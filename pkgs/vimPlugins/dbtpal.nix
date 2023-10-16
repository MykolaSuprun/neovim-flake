{
  pkgs,
  src,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "dbtpal";
  inherit src;
  dontBuild = true;
}
