{ pkgs ? import <nixpkgs> {}, serve ? false, sync ? false, push ? false }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs_24
    git
  ];

  shellHook = ''
      alias serve="npx quartz build --serve"
      alias build="npx quartz build"
      
      echo "Available commands:"
      echo "  serve      - Build and serve the site locally"
      echo "  build      - Build the site"
      
      ${if serve then '' npx quartz build --serve'' else ''''}
      ${if sync then ''
        npx quartz build && rsync -avP --delete ./{public,compose.yml,nginx.conf} personal-vps:/root/blog/ && exit
      '' else ''''}
      ${if push then ''
        npx quartz build && npx quartz sync && exit
      '' else ''''}
  '';
}
