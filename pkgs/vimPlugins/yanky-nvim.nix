{
  pkgs,
  src,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "yanky-nvim";
  inherit src;
  dontBuild = true;
  # If fails due to attempt to build from a makefile, include dontBuild = true into
  #   the set that is passed to buildVimPlugin function.
}
