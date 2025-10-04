{ pkgs ? import <nixpkgs> {}, serve ? false, sync ? false, push ? false }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs_24
    git
  ];

  shellHook = ''
      alias serve="npx quartz build --serve"
      alias sync="npx quartz build && rsync -avP --delete ./public/ vps:~/www/blog/ && rsync -avP ./nginx.conf vps:~/www/blog-nginx.conf && npx quartz sync"
      
      echo "Available commands:"
      echo "  serve      - Build and serve the site locally"
      echo "  sync       - Sync the site with remote production server and commit the changes"
  '';
}
