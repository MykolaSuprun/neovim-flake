# vim: ft=lua
{ pkgs }:
''
--   local lsp = require('lsp-zero').preset({
--     manage_nvim_cmp = {
--       set_sources = 'recommended',
--       set_basic_mappings = true,
--       set_extra_mappings = true,
--       use_luasnip = true,
--       set_format = true,
--       documentation_window = true,
--     },
--     configure_diagnostics = true,
--     call_servers = "global",
--     set_lsp_keymaps = {
--       preserve_mappings = false,
--       omit = nil,
--     },
--   })
--
--   lsp.on_attach(function(client, bufnr)
--     -- see :help lsp-zero-keybindings
--     -- to learn the available actions
--     lsp.default_keymaps({
--       buffer = bufnr,
--       preserve_mappings = false,
--     })
--   end)
--
--   -- When you don't have mason.nvim installed
--   -- You'll need to list the servers installed in your system
--   lsp.setup_servers({
--     'lua_ls',
--     'tsserver',
--     'nixd',
--     'bashls',
--     'nil_ls',
--     'clangd',
--     'cmake',
--   --  'docker_compose_language_service.setup',
--     'marksman',
--     'pyright',
--   })
--
--   -- configure language servers
--   require'lspconfig'.lua_ls.setup {
--     settings = {
--       Lua = {
--         runtime = {
--           -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--           version = 'LuaJIT',
--         },
--         diagnostics = {
--           -- Get the language server to recognize the `vim` global
--           globals = {'vim'},
--         },
--         workspace = {
--           -- Make the server aware of Neovim runtime files
--           library = vim.api.nvim_get_runtime_file("", true),
--           checkThirdParty = false,
--         },
--         -- Do not send telemetry data containing a randomized but unique identifier
--         telemetry = {
--           enable = false,
--         },
--       },
--     },
--   }
--   -- TODO set up later based on the requirements for specific languages
--   -- General purpose language server: https://github.com/mattn/efm-langserver
--   -- require('lspconfig')['efm'].setup{
--   --   settings = ..., -- You must populate this according to the EFM readme
--   --   filetypes = ..., -- Populate this according to the note below
--   --   single_file_support = true, -- This is the important line for supporting older version of EFM
--   -- }
--   
--   require'lspconfig'.tsserver.setup{}
--   require'lspconfig'.nixd.setup{}
--   require'lspconfig'.bashls.setup{}
--   require'lspconfig'.nil_ls.setup{}
--   require'lspconfig'.clangd.setup{}
--   require'lspconfig'.cmake.setup{}
--   -- require'lspconfig'.docker_compose_language_service.setup{}
--   -- TODO set up grammarly after secrets
--   -- require'lspconfig'.grammarly.setup{
--   --
--   -- }
--   require'lspconfig'.marksman.setup{} 
--   require'lspconfig'.pyright.setup{}
--   require'lspconfig'.yamlls.setup{}
--
--   lsp.setup()
''
