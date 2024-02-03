{
  inputs = {
    flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
    flake-utils.url = "github:numtide/flake-utils";
    gitignore = {
      url = "github:hercules-ci/gitignore.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:NixOS/nixpkgs";
    std.url = "github:chessai/nix-std";
  };
  outputs =
    { flake-utils, gitignore, nixpkgs }: flake-utils.lib.eachDefaultSystem (system:
      let
        app = p: { program = "${p}"; type = "app"; };
        pkgs = import nixpkgs { inherit system; };
        src = gitignore.lib.gitignoreSource ./.;
      in
      {
        apps = { };
        devShells = { };
        packages = { };
      }
    );
}
