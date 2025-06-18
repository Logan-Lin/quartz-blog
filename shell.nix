{ pkgs ? import <nixpkgs> {}, serve ? false, sync ? true, push ? false }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    nodePackages.npm
    git
  ];

  shellHook = ''
      rsync -avP --delete ~/Obsidian/Blog/ ./content/ --exclude ".*"
      ${if serve then '' npx quartz build --serve'' else ''''}
      ${if sync then ''
        npx quartz build && rsync -avP --delete ./{public,compose.yml,nginx.conf} personal-vps:/root/blog/
      '' else ''''}
      ${if push then ''
        npx quartz build && npx quartz sync
      '' else ''''}
      exit
  '';
}
