---
title: A NixOS Newbie's Homelab Setup
draft: false
---

> [!tldr]
> From Unraid's GUI to NixOS declarative config. Started with nix-darwin on my MacBook, migrated my home server, then added a VPS and ThinkPad. Four machines, one repo, shared modules. As a newbie, it's been surprisingly manageable.

## The Unraid Days

I started my homelab journey with Unraid, and honestly, it was great for getting things running quickly. The web GUI made it dead simple to set up storage arrays, spin up Docker containers, and manage everything through a browser. For someone who just wanted to get Plex running and start backing up photos, it was perfect.

But the limitations became obvious once I tried to do more. Managing Docker containers through the GUI was tedious. Setting up something like Nextcloud or Immich that needs multiple containers? Painful. Sure, you can use docker compose through a plugin, but then you're stuck with a broken CLI experience. You either click through the GUI or suffer through a terminal that doesn't even have vim (just vi), and installing packages isn't straightforward. It's supposedly a Linux distro, but it feels like you're constantly fighting the system.

The breaking point was realizing I was paying for a system with limited functionalities that I could actually build myself. Unraid's core feature is combining drives of different sizes and filesystems into a unified mount point with parity protection. But that's just MergerFS plus SnapRAID. Everything else a home server needs (Docker containers, network shares, backups) are all standard open source tools. As a geek, paying for a restrictive wrapper around software I could customize and control myself just didn't sit right.

## Discovering NixOS

Around this time, I had a friend who ran NixOS on all his machines. He kept talking about declarative configuration and reproducibility. Then I stumbled across ["What's on my Home Server 2025 – NixOS Edition"](https://www.youtube.com/watch?v=f-x5cB6qCzA) on YouTube. The idea clicked: what if your entire system configuration was just code? Version controlled, reproducible, and auditable.

I decided to try it on my MacBook Air first using nix-darwin. Starting on my daily driver meant I could experiment without risking my server. I set up a flake-based configuration in `~/.config/nix`. System settings like dock behavior, keyboard remapping, finder preferences. Development tools like zsh with powerlevel10k, tmux, neovim, git. Terminal emulator (Ghostty), browser config (Firefox with extensions), even LaTeX setup. All defined in modular `.nix` files.

Here's the thing: I didn't find NixOS particularly hard to learn. Yes, the Nix language looks weird at first. But everything being a config file means you can actually track what changed. When something breaks, you have git history. When you want to tweak something, you edit a file and rebuild. No more "what did I click three months ago?" And because it's all text files, AI assistants can actually help you maintain and debug your configs. Try getting Claude to help you remember which checkboxes you clicked in a GUI.

## Going All In

Once I had nix-darwin working smoothly on my MacBook, it was time to tackle the real goal: replacing Unraid on my home server. I added a new host configuration to the same `~/.config/nix` repo. This time it was actual NixOS, not just nix-darwin.

One thing Unraid did right: it doesn't use proprietary filesystems. My data drives were just XFS, which meant I could keep all my existing files without migration. I wiped the system drive and installed NixOS with ZFS mirroring on two 1TB SSDs. For storage, I kept the two 12TB data drives and 16TB parity drive, just replacing Unraid's array management with MergerFS and SnapRAID. Same hardware, same data, full control.

The system-level config was more involved than nix-darwin. Bootloader setup, ZFS configuration, filesystem mounts, networking, services. But all those modules I'd written for my MacBook (zsh, tmux, neovim, git, ssh) imported directly into the home server config. Same development environment across both machines.

Then I added my Hetzner VPS to the repo. I'd been running it manually on Debian, but nixos-anywhere made the transition surprisingly smooth. Remote install, and suddenly my VPS was managed the same way as everything else. Then came a ThinkPad borrowed from the university. Originally meant to experiment with NixOS desktop environments, it's now sitting in my office serving as a backup server (and still running KDE Plasma when I need it). Four machines, one git repo, shared modules everywhere. The home server handles media and self-hosted apps. The VPS runs minimal cloud services. The ThinkPad acts as the Borg backup target. My MacBook stays as my daily driver. All managed from the same flake.

![[Pasted image 20251011162802.png]]

## The Current Setup

My `~/.config/nix` repo is structured around a single `flake.nix` that defines all four hosts. Each host has its own directory under `hosts/darwin/` or `hosts/nixos/` with host-specific configuration. The mba gets nix-darwin system settings and macOS-specific tweaks. The three NixOS machines (hs, vps, thinkpad) get their respective system configs with bootloaders, filesystems, networking, and services.

The real power is in the modules. I've built up 29 reusable modules that handle everything from low-level system services to user applications. Some are system-level: `traefik.nix` for reverse proxy with automatic SSL via Cloudflare DNS challenge, `wireguard.nix` for mesh networking between my machines, `podman.nix` for container runtime, `borg-client.nix` and `borg-server.nix` for backups. Others are user-level and work across both Darwin and NixOS: `zsh.nix` with my shell config, `tmux.nix`, `nvim.nix` using nixvim, `git.nix` with aliases, `firefox.nix` that even installs extensions declaratively.

The home server runs the heavy lifting. Media stack with Plex, Jellyfin, Sonarr, Radarr, and qBittorrent. Self-hosted services like Immich for photo backup, Nextcloud for cloud storage, and Paperless for document management. These are mostly migrated from my docker compose setup on Unraid, now defined as container specs in `containers.nix` using Podman. I know most of these could be run as native NixOS modules with better integration, but for quick migration I stuck with containers. Podman integrates better with NixOS than Docker anyway. Maybe someday I'll convert them to native modules.

The setup is self-contained across hosts. Traefik runs on both the VPS and home server. The VPS instance (configured through `proxy.nix`) handles public URLs like plex.yanlincs.com and proxies requests back to the actual services running on the home server through the WireGuard mesh network. Both the Traefik configs and WireGuard tunnels are all defined in NixOS. The whole thing backs up to the ThinkPad via Borg, also configured through Nix modules.

![[Pasted image 20251011162639.png]]

## Retrospective

The single command rebuild is still impressive. I set up aliases: `oss` rebuilds the system, `hms` rebuilds the user environment, `fs` does both. I can push a change to git, pull it on another machine, run one command, and the change is live. No more "let me SSH in and manually update this config file on each server."

Modules as building blocks means I write once, reuse everywhere. When I improve my zsh config, all four machines get it. When I add a new git alias, it propagates to everything. This is especially helpful for complicated modules like zsh, nvim, and tmux where I have tons of customization. The podman module sets up container runtime identically across hs, vps, and thinkpad. The wireguard module handles the mesh network. Each module is self-contained with both package installation and configuration.

Everything in git means I have history. I can see exactly when I changed something, why I changed it, and roll back if needed. No more uncertainty about what's actually configured on each machine. The config is the documentation. And because it's all text files, AI tools can help. I can ask Claude to help debug a module or suggest improvements to my config. Try doing that with a GUI.

Looking back, moving from Unraid to NixOS was one of those decisions that feels obvious in hindsight. I went from paying for a system that fought me at every turn to having full control over my infrastructure. As a NixOS newbie, I'm genuinely happy with where things are. The learning curve wasn't as steep as people make it out to be. The setup just works, and I can maintain it without fighting the system. That's a win.
