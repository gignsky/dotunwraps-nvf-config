{ pkgs, ... }: {
  config.vim.languages.nix = {
    enable = true;
    format = {
      type = "alejandra";
      package = pkgs.alejandra;
    };
  };
}
