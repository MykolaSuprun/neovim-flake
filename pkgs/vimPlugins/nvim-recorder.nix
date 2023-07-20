{
  pkgs,
  src,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "nvim-recorder";
  inherit src;
}
