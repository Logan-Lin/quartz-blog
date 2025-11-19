{ pkgs ? import <nixpkgs> {}, serve ? false, sync ? false, push ? false }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs_24
  ];

  shellHook = ''
      alias setup="npm ci"
      alias serve="npx quartz build --serve"

      echo "Available commands:"
      echo "  setup      - Install dependencies"
      echo "  serve      - Build and serve the site locally"
  '';
}
