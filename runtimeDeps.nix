{pkgs}:
with pkgs; [
  lazygit
  fd
  ripgrep
  git
  fzf
  fzf-zsh
  clang-tools
  cmake-language-server
  # docker
  hadolint
  docker-compose-language-service
  # efm lsp
  # efm-langserver
  # nix
  nixd
  nil
  statix
  alejandra
  # lua
  lua-language-server
  luajitPackages.luacheck
  luajit
  stylua
  selene
  # python
  mypy
  python311Packages.pycodestyle
  python311Packages.pydocstyle
  python311Packages.bandit
  python311Packages.vulture
  # ruff-lsp
  ruff
  yapf
  # haskell
  hlint
  stylish-haskell
  # rust
  rust-analyzer
  # text and markdown
  # languagetool
  vale
  # proselint
  # marksman
  # nodePackages.markdownlint-cli
  # shell
  shellcheck
  # sql
  sqlfluff
  sqlite
  # vim
  vim-vint
  # yaml
  yamllint
  # packages with results in /lib/node_modules/.bin must come at the end
  nodePackages.typescript
  nodePackages.typescript-language-server
  nodePackages.bash-language-server
  nodePackages.grammarly-languageserver
  nodePackages.pyright
  nodePackages.yaml-language-server
]
