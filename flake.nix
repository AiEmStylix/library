{
  description = "Vue + Express monorepo with pnpm";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.nodejs_24
            pkgs.pnpm
          ];

          shellHook = ''
            echo "🚀 Dev shell ready!"
            echo "👉 cd frontend && pnpm run dev  # Vue app"
            echo "👉 cd backend && pnpm run dev   # Express server"
          '';
        };
      }
    );
}
