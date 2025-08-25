{ pkgs ? import <nixpkgs> {}, serve ? false, sync ? false, push ? false }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs_24
    git
  ];

  shellHook = ''
      alias serve="npx quartz build --serve"
      alias build="npx quartz build"
      alias sync="npx quartz build && rsync -avP --delete ./{public,compose.yml,nginx.conf} personal-vps:/root/blog/"
      alias push="npx quartz build && npx quartz sync && exit"
      
      echo "Available commands:"
      echo "  serve      - Build and serve the site locally"
      echo "  build      - Build the site"
      echo "  sync       - Sync the site with remote production server"
      echo "  push       - Commit and push updates to remote repo"
  '';
}
