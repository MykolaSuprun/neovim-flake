{
  description = "Neovim flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    telescope-recent-files-src = {
      url = "github:smartpde/telescope-recent-files"; # don't forget to format url a github format
      flake = false;
    };
    # TODO create sqlls package first, and then add it to LSP config
    sql-language-server-src = {
      url = "github:joe-re/sql-language-server";
      flake = false;
    };
    yanky-nvim-src = {
      url = "github:gbprod/yanky.nvim";
      flake = false;
    };
    nvim-cmp-buffer-lines-src = {
      url = "github:amarakon/nvim-cmp-buffer-lines";
      flake = false;
    };
    cmp-async-path-src = {
      url = "github:FelipeLema/cmp-async-path";
      flake = false;
    };
    nvim-recorder-src = {
      url = "github:chrisgrieser/nvim-recorder";
      flake = false;
    };
    rainbow-csv-src = {
      url = "github:cameron-wags/rainbow_csv.nvim";
      flake = false;
    };
    # diagnostic-languageserver-src = {
    #   url = "github:iamcco/diagnostic-languageserver";
    #   flake = false;
    # }
  };
  outputs = {
    self,
    nixpkgs,
    neovim,
    telescope-recent-files-src,
    sql-language-server-src,
    yanky-nvim-src,
    nvim-cmp-buffer-lines-src,
    cmp-async-path-src,
    nvim-recorder-src,
    rainbow-csv-src,
  }: let
    overlayFlakeInputs = prev: final: {
      neovim = neovim.packages.x86_64-linux.neovim;
      vimPlugins =
        final.vimPlugins
        // {
          telescope-recent-files = import ./pkgs/vimPlugins/telescopeRecentFiles.nix {
            src = telescope-recent-files-src;
            pkgs = prev;
          };
          yanky-nvim = import ./pkgs/vimPlugins/yanky-nvim.nix {
            src = yanky-nvim-src;
            pkgs = prev;
          };
          nvim-cmp-buffer-lines = import ./pkgs/vimPlugins/nvim-cmp-buffer-lines.nix {
            src = nvim-cmp-buffer-lines-src;
            pkgs = prev;
          };
          cmp-async-path = import ./pkgs/vimPlugins/cmp-async-path.nix {
            src = cmp-async-path-src;
            pkgs = prev;
          };
          nvim-recorder = import ./pkgs/vimPlugins/nvim-recorder.nix {
            src = nvim-recorder-src;
            pkgs = prev;
          };
          rainbow-csv = import ./pkgs/vimPlugins/rainbow-csv.nix {
            src = rainbow-csv-src;
            pkgs = prev;
          };
        };
    };

    overlayMyNeovim = prev: final: {
      myNeovim = import ./pkgs/myNeovim.nix {
        pkgs = final;
      };
    };

    pkgs = import nixpkgs {
      system = "x86_64-linux";
      overlays = [overlayFlakeInputs overlayMyNeovim];
    };
  in {
    packages.x86_64-linux = rec {
      nvim = pkgs.myNeovim;
      default = nvim;
    };
    apps.x86_64-linux.default = {
      type = "app";
      program = "${pkgs.myNeovim}/bin/nvim";
    };
  };
}
