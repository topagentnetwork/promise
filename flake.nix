{
  description = "TAN promise bindings (fork of aantron promise)";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        frameworks = pkgs.darwin.apple_sdk.frameworks;
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            opam
            nodejs_22
            wget
            just
            ocamlPackages.ocamlformat
            nodePackages.pnpm
            frameworks.Security
            frameworks.CoreFoundation
            frameworks.CoreServices
          ];
          shellHook = ''
            eval $(opam env)
          '';
        };
      });
}

