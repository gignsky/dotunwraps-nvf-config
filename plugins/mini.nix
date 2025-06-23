{ lib, ... }: {
  config.vim.mini = {
    ai.enable = true;
    align.enable = true;
    bracketed.enable = true;
    comment.enable = true;
    diff.enable = true;
    files.enable = true;
    git.enable = true;
    icons.enable = true;
    indentscope = {
      enable = true;
      setupOpts.draw.animation = lib.generators.mkLuaInline ''require("mini.indentscope").gen_animation.none()'';
    };
    jump2d = {
      enable = true;
      setupOpts = {
        labels = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        mappings.start_jumping = "<leader>j";
        view.dim = true;
        silent = true;
      };
    };
    move.enable = true;
    notify.enable = true;
    operators.enable = true;
    pairs.enable = true;
    splitjoin.enable = true;
    starter.enable = true;
    statusline.enable = true;
    surround.enable = true;
    tabline.enable = true;
    trailspace.enable = true;
  };
}
