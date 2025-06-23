{ lib, ... }: {
  imports = [
    ./mini.nix
  ];

  config.vim = {
    telescope.enable = true;
    autocomplete.blink-cmp.enable = true;
    formatter.conform-nvim.enable = true;
    snippets.luasnip.enable = true;
    notes.todo-comments.enable = true;

    fzf-lua = {
      enable = true;
      profile = "default-title";
    };
  };
}
