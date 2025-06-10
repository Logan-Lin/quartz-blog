{ pkgs ? import <nixpkgs> {}, serve ? false, sync ? true }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    nodePackages.npm
    git
  ];

  shellHook = ''
      rsync -avP --delete ~/Obsidian/Blog/ ./content/ --exclude ".*"
      ${if serve then '' npx quartz build --serve && exit'' else ''''}
      ${if sync then ''
        npx quartz build && npx quartz sync && rsync -avP --delete ./{public,compose.yml,nginx.conf} hetzner:/root/blog/
        exit
      '' else ''''}
  '';
}
