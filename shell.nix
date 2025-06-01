{ pkgs ? import <nixpkgs> {}, serve ? false }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    nodePackages.npm
    git
  ];

  shellHook = ''
      rsync -avP --delete ~/Obsidian/Blog/ ./content/ --exclude ".*"
      ${if serve then '' npx quartz build --serve'' else ''npx quartz sync''}
      exit
  '';
}
