{
  pkgs,
  src,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "nvim-cmp-buffer-lines";
  inherit src;
}
