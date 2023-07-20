{
  pkgs,
  src,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "cmp-async-path";
  inherit src;
  # If fails due to attempt to build from a makefile, include dontBuild = true into
  #   the set that is passed to buildVimPlugin function.
}
