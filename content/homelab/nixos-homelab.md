---
title: A NixOS Newbie's Homelab Setup
draft: false
---
> [!tldr] TL;DR
> From Unraid's GUI to NixOS declarative config. Started with nix-darwin on my MacBook, migrated my home server, then added a VPS and ThinkPad. Four machines, one repo, shared modules. As a newbie, it's been surprisingly manageable.

## The Unraid Days

I started my homelab journey with Unraid, and honestly, it was great for getting things running quickly. The web GUI made it dead simple to set up storage arrays, spin up Docker containers, and manage everything through a browser.

But the limitations became obvious once I tried to do more. Managing Docker containers through the GUI was tedious. When setting up something like Nextcloud or Immich that needs multiple containers, the web GUI becomes very restrictive. You can use docker compose through a plugin on Unraid, but you're still stuck with a broken CLI experience. You either click through the GUI or suffer through a terminal that doesn't even have vim (just vi). Installing packages on Unraid isn't straightforward, though it is essentially a Linux distro.

The breaking point was realizing I was paying for a system with limited functionalities that I could actually build myself. That feels wrong for a geek. Unraid's core feature: combining drives of different sizes and filesystems into a unified mount point with parity protection, can be easily replicated with MergerFS plus SnapRAID. Everything else a home server needs (Docker containers, network shares, backups) are all standard open source tools.

## Discovering NixOS

Around this time, I had a friend who ran NixOS on all his machines. He kept talking about declarative configuration and reproducibility. I also stumbled across multiple videos talking about NixOS setups on YouTube, like ["What's on my Home Server 2025 – NixOS Edition"](https://www.youtube.com/watch?v=f-x5cB6qCzA). The idea clicked: what if your entire system configuration was just code? Version controlled, reproducible, and auditable.

I decided to try it on my MacBook Air first using `nix-darwin`. I set up a flake-based configuration, configured system settings like dock behavior, keyboard remapping, finder preferences, customized development tools like zsh, tmux, neovim, and git. Then the configuration expands to terminal emulator (Ghostty), browser config (Firefox with extensions), and even LaTeX. All defined in modular `.nix` files. I basically cannot return to install any software or make any customization the old way.

Here's the thing: I didn't find NixOS particularly hard to learn. Yes, the Nix language looks weird at first. But everything being a config file means you can actually track what changed. When something breaks, you have git history. When you want to tweak something, you edit a file and rebuild. No more "what did I click three months ago?" And because it's all text files, AI assistants can actually help you maintain and debug your configs. Try getting Claude to guide you clicking checkboxes on a GUI.

## Going All In

Once I had `nix-darwin` working smoothly on my MacBook, it was time to tackle the real goal: replacing Unraid on my home server. I added a new host configuration to the same repo. This time it was actual NixOS, not just nix-darwin.

One thing Unraid did right: it doesn't use proprietary filesystems. My data drives were just XFS, which meant I could keep all my existing files without migration. I wiped the system drive and installed NixOS with ZFS mirroring on two 1TB SSDs. For storage, I kept the two 12TB data drives and 16TB parity drive, just replacing Unraid's array management with MergerFS and SnapRAID.

The system-level config was more involved than nix-darwin. Bootloader setup, ZFS configuration, filesystem mounts, networking, services. But all those modules I'd written for my MacBook (zsh, tmux, neovim, git, ssh) imported directly into the home server config. Same development environment across both machines. After seeing what NixOS can do, macOS also began to feel restrictive with `nix-darwin` only able to replicate the full NixOS experience partially. My next laptop probably won't be Macs again.

Then I added my Hetzner VPS to the repo. I'd been running it manually on Debian, but `nixos-anywhere` made the transition surprisingly smooth. Remote install, and suddenly my VPS was managed the same way as everything else, with all my module configuration perfectly replicated with a few commands. I also borrowed a ThinkPad from the university to experiment with NixOS desktop environments. It's now sitting in my office serving as a backup server (and still running KDE Plasma when I need it). Four machines, one git repo, shared modules everywhere. The home server handles media and self-hosted apps. The VPS runs minimal cloud services. The ThinkPad acts as the Borg backup target and a spare laptop. My MacBook stays as my daily driver. All managed from the same flake.

![[Pasted image 20251011162802.png]]

## The Current Setup

My nix config repo is structured around a single `flake.nix` that defines all four hosts. Each host has its own directory under `hosts/darwin/` or `hosts/nixos/` with host-specific configuration. The mba gets `nix-darwin` system settings and macOS-specific tweaks, like using `nix-homebrew` to install softwares that are not well supported by `nix-darwin`. The three NixOS machines (hs, vps, thinkpad) get their respective system configs with bootloaders, filesystems, networking, and services.

The real power is in the modules. I've built up 29 reusable modules that handle everything from low-level system services to user applications. Some are system-level: `traefik.nix` for reverse proxy with automatic SSL via Cloudflare DNS challenge, `wireguard.nix` for mesh networking between my machines, `podman.nix` for container runtime, `borg-client.nix` and `borg-server.nix` for backups. Others are user-level and work across both Darwin and NixOS: `zsh.nix` with my shell config, `tmux.nix`, `nvim.nix` using nixvim, `git.nix` with aliases, `firefox.nix` that even installs extensions declaratively.

The home server runs the heavy lifting. Media stack with Plex, Jellyfin, Sonarr, Radarr, and qBittorrent. Self-hosted services like Immich for photo backup, Nextcloud for cloud storage, and Paperless-ngx for document management. These are mostly migrated from my docker compose setup on Unraid, now defined as container specs in `containers.nix` using Podman. I know most of these could be run as native NixOS modules with better integration, but for quick migration I stuck with containers. Podman integrates better with NixOS than Docker anyway. Maybe someday I'll convert them to native modules.

The setup is self-contained across hosts. Traefik runs on both the VPS and home server. The VPS instance handles public URLs like `plex.yanlincs.com` and proxies requests back to the actual services running on the home server through the WireGuard subnet. The whole thing backs up to the ThinkPad via Borg, also connected through WireGuard.

![[Pasted image 20251011162639.png]]

## Retrospective

The single command rebuild is still impressive. I set up aliases: `oss` rebuilds the system, `hms` rebuilds the user environment, `fs` does both. I can push a change to git, pull it on another machine, run one command, and the change is live. No more "let me remember what I did on this machine, SSH into another machine, and try to do the adjustment again."

Modules as building blocks means I write once, reuse everywhere. When I improve my zsh config, all four machines get it. When I add a new git alias, it propagates to everything. This is especially helpful for complicated modules like zsh, nvim, and tmux where I have tons of customization. The podman module sets up container runtime identically across hs, vps, and thinkpad. The WireGuard module handles the mesh network.

Everything in git means I have history. I can see exactly when I changed something, why I changed it, and roll back if needed. No more uncertainty about what's actually configured on each machine. And because it's all text files, AI tools can help. I can ask Claude Code to help debug a module or suggest improvements to my config.

Looking back, moving from Unraid to NixOS was one of those decisions that feels obvious in hindsight. I went from paying for a system that fought me at every turn to having full control over my infrastructure. As a NixOS newbie, I'm genuinely happy with where things are. The learning curve wasn't as steep as people make it out to be. The setup just works, and I can maintain it without fighting the system.
