# vim: ft=lua
{ pkgs }:
''
require('lint').linters_by_ft = {
  lua = {'selene' }, 
  python = {'ruff', 'pycodestyle', 'pydocstyle', 'bandit', 'vulture' },
  dockerfile = {'hadolint'},
  haslkell = {'hlint'},
  -- json = {},
  text = { 'vale', 'proselint' },
  markdown = {'markdownlint', 'vale' },
  nix = { 'nix', 'statix' },
  sh = { 'shellcheck' },
  sql = { 'sqlfluff' },
  vim = { 'vint' },
  -- yaml = { 'yamlling' },
}
-- Update linter suggestions on given events
-- list of possible events: https://neovim.io/doc/user/autocmd.html#autocmd-events
-- or run in cmd: :lua require('lint').try_lint()
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "TextChanged", "InsertLeave" }, {
    callback = function()
    require("lint").try_lint()
  end,
})
-- if put in a separate script virtual_text gets overriden
vim.diagnostic.config({
  signs = true,
  underline = true,
  update_in_insert = true,
  virtual_text = {
    source = "if_many",
    signs = true,
    severity_sort = true,
  }
 })
''
