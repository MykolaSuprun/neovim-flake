{
  description = "Neovim flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    telescope-recent-files-src = {
      url = "github:smartpde/telescope-recent-files";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, neovim, telescope-recent-files-src }:
    let 

      overlayFlakeInputs = prev: final: {
        neovim = neovim.packages.x86_64-linux.neovim;
        vimPlugins = final.vimPlugins // {
          telescope-recent-files = import ./pkgs/vimPlugins/telescopeRecentFiles.nix {
            src = telescope-recent-files-src;
            pkgs = prev;
          };
        };
      };

      overlayMyNeovim = prev : final: {
        myNeovim = import ./pkgs/myNeovim.nix {
          pkgs = final;
        };
      };

      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ overlayFlakeInputs overlayMyNeovim ];
      };
    in
    {
      packages.x86_64-linux.default = neovim.packages.x86_64-linux.neovim;
      apps.x86_64-linux.default = {
        type = "app";
        program = "${pkgs.myNeovim}/bin/nvim";
      };
    };
}
