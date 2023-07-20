{ pkgs }:
let
 customRC = import ../config { inherit pkgs; };
 plugins = import ../plugins.nix { inherit pkgs; };
in
pkgs.wrapNeovim pkgs.neovim {
  configure = {
    # here will come your custom configuration
    inherit customRC;
    packages.all.start = plugins;
  };
}
