{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nvf.url = "github:notashelf/nvf";
    dotunwrap-nixos-config.url = "github:dotunwrap/nixos-config";
    home-manager.follows = "dotunwrap-nixos-config/nixpkgs";
  };

  outputs =
    { flake-parts
    , nvf
    , ...
    } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      perSystem = { pkgs, ... }:
        let
          configModule = import ./nvf-config.nix;
          nvimConfig = nvf.lib.neovimConfiguration {
            modules = [ configModule ];
            inherit pkgs;
          };
        in
        {
          packages.default = nvimConfig.neovim;
          formatter = pkgs.alejandra;
        };
    };
}
