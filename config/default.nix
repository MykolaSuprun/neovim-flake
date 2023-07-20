{ pkgs }:
let
  nixFiles2ConfigFiles = dir:
    builtins.map (file:
      pkgs.writeTextFile {
        name = pkgs.lib.strings.removeSuffix ".nix" file;
        text = import ./${dir}/${file} { inherit pkgs; };
      }) (builtins.attrNames (builtins.readDir ./${dir}));

  scripts2ConfigFiles = dir:
    let
      configDir = pkgs.stdenv.mkDerivation {
        name = "nvim-${dir}-configs";
        src = ./${dir};
        installPhase = ''
          mkdir -p $out/
          cp ./* $out/
        '';
      };
    in builtins.map (file: "${configDir}/${file}")
    (builtins.attrNames (builtins.readDir configDir));

  sourceConfigFiles = files:
    builtins.concatStringsSep "\n" (builtins.map (file:
      (if pkgs.lib.strings.hasSuffix "lua" file then "luafile" else "source")
      + " ${file}") files);

  vim = scripts2ConfigFiles "vim";
  lua_config = scripts2ConfigFiles "lua-config";
  lua_plugins = scripts2ConfigFiles "lua-plugins";
  luanix = nixFiles2ConfigFiles "luanix";

in builtins.concatStringsSep "\n"
(builtins.map (configs: sourceConfigFiles configs) [
  vim
  lua_config
  lua_plugins
  luanix
])
