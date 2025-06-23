{ pkgs, ... }: {
  imports = [
    ./assembly.nix
    ./bash.nix
    ./clang.nix
    ./csharp.nix
    ./css.nix
    ./go.nix
    ./html.nix
    ./lua.nix
    ./markdown.nix
    ./nix.nix
    ./php.nix
    ./python.nix
    ./rust.nix
    ./sql.nix
    ./svelte.nix
    ./tailwind.nix
    ./typescript.nix
    ./typst.nix
  ];

  config.vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
      lightbulb.enable = true;
      trouble.enable = true;
      otter-nvim.enable = true;
    };

    debugger.nvim-dap = {
      enable = true;
      ui = {
        enable = true;
        autoStart = true;
      };
    };

    treesitter = {
      enable = true;
      addDefaultGrammars = true;
      autotagHtml = true;
      grammars = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      enableDAP = true;
    };
  };
}
