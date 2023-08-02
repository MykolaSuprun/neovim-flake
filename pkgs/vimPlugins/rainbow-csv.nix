{
  pkgs,
  src,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "rainbow-csv";
  inherit src;
}
