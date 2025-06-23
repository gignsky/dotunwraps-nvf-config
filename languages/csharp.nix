{ lib
, pkgs
, ...
}:
let
  badSystems = [ "aarch64-darwin" ];
in
{
  config.vim.languages.csharp.enable = lib.mkIf (!(builtins.elem pkgs.stdenv.system badSystems)) true;
}
