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
      flake = {
        homeManagerModules.default = { config, lib, pkgs, ... }: {
          options.programs.unwrap-vim = {
            enable = lib.mkEnableOption "dotunwrap's Neovim configuration";
            
            package = lib.mkOption {
              type = lib.types.package;
              description = "The Neovim package to use";
              default = inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.default;
            };
          };

          config = lib.mkIf config.programs.unwrap-vim.enable {
            home.packages = [ config.programs.unwrap-vim.package ];
            
            # Optional: Set as default editor
            home.sessionVariables = {
              EDITOR = lib.mkDefault "${config.programs.unwrap-vim.package}/bin/nvim";
              VISUAL = lib.mkDefault "${config.programs.unwrap-vim.package}/bin/nvim";
            };
          };
        };

        # Alias for convenience
        homeManagerModules.unwrap-vim = inputs.self.homeManagerModules.default;
      };
    };
}
