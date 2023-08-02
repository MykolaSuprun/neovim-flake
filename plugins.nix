{pkgs}:
with pkgs.vimPlugins; [
  # Themes
  catppuccin-nvim
  # telescope modules and their dependencies
  plenary-nvim
  nvim-web-devicons
  popup-nvim
  telescope-nvim
  telescope-recent-files
  telescope-fzf-native-nvim
  telescope-file-browser-nvim
  telescope-undo-nvim
  telescope-media-files-nvim
  # file manager
  nvim-tree-lua
  # Git and github integration
  vim-sleuth # Detect tabstop and shiftwidth automatically
  vim-fugitive # Git integration
  vim-rhubarb # Github integration
  lazygit-nvim
  #fidget-nvim                 # Standalone UI for nvim-lsp progress # temporarily disabled until plugin is revritten
  gitsigns-nvim # Git decorations
  # Code completions
  cmp-nvim-lsp # Adds LSP completion capabilities
  nvim-cmp # Neovim completions
  cmp_luasnip
  cmp-nvim-ultisnips
  ultisnips
  # lua
  neodev-nvim # Neovim setup for init.lua and plugin development
  # General code completion
  luasnip
  cmp_luasnip
  friendly-snippets
  cmp-buffer
  nvim-cmp-buffer-lines
  cmp-calc
  cmp-nvim-lsp
  cmp-async-path
  cmp-fuzzy-path
  # Useful plugin to show you pending keybinds.
  which-key-nvim
  # Configurable statusline
  lualine-nvim
  # This plugin adds indentation guides to all lines (including empty lines).
  indent-blankline-nvim
  # Commenting plugin
  comment-nvim
  # treesitter
  nvim-treesitter
  nvim-treesitter-refactor
  nvim-treesitter-endwise
  nvim-treesitter-context
  nvim-treesitter-textobjects
  # nvim-treesitter-pyfold
  nvim-treesitter-parsers.python
  nvim-treesitter-parsers.haskell
  nvim-treesitter-parsers.nix
  nvim-treesitter-parsers.rust
  nvim-treesitter-parsers.c
  nvim-treesitter-parsers.go
  nvim-treesitter-parsers.yaml
  nvim-treesitter-parsers.toml
  nvim-treesitter-parsers.json
  nvim-treesitter-parsers.http
  nvim-treesitter-parsers.html
  nvim-treesitter-parsers.dockerfile
  nvim-treesitter-parsers.markdown_inline
  nvim-treesitter-parsers.vim
  nvim-treesitter-parsers.vimdoc
  nvim-treesitter-parsers.sql
  nvim-treesitter-parsers.scala
  nvim-treesitter-parsers.regex
  nvim-treesitter-parsers.query
  nvim-treesitter-parsers.mlir
  nvim-treesitter-parsers.make
  nvim-treesitter-parsers.cmake
  nvim-treesitter-parsers.markdown
  nvim-treesitter-parsers.lua
  nvim-treesitter-parsers.luap
  nvim-treesitter-parsers.latex
  nvim-treesitter-parsers.javascript
  nvim-treesitter-parsers.gitignore
  nvim-treesitter-parsers.gitcommit
  nvim-treesitter-parsers.gitattributes
  nvim-treesitter-parsers.git_rebase
  nvim-treesitter-parsers.git_config
  nvim-treesitter-parsers.diff
  nvim-treesitter-parsers.cpp
  nvim-treesitter-parsers.commonlisp
  nvim-treesitter-parsers.comment
  nvim-treesitter-parsers.bash
  # undotree
  undotree
  # better messages, popups and cmdline
  noice-nvim
  nvim-notify
  nui-nvim
  dressing-nvim
  # LSP
  nvim-lspconfig
  lsp-zero-nvim
  # Better CSV support
  rainbow-csv
  # formatting
  formatter-nvim
  # better buffer switching
  harpoon
  # soft capslock
  vim-capslock
  # surround plugin
  mini-nvim
  # tabline
  bufferline-nvim
  # smart autopairs
  nvim-autopairs
  # better yanking
  yanky-nvim
  # linter plugin
  nvim-lint
  # better diagnostics
  trouble-nvim
  # Terminal integration
  FTerm-nvim
  toggleterm-nvim
  # sqlite
  sqlite-lua
  # making macros easier to work with
  nvim-recorder
]
