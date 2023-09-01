-- basic configuration is managed through lsp-zero
local cmp = require("cmp")

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	sources = {
		-- list cmpletion sources here
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		-- {
		-- 	name = "buffer",
		-- 	option = { keyword_pattern = [[\k\+]] },
		-- },
		{ name = "buffer-lines" },
		{ name = "fuzzy_path" },
		{ name = "fuzzy_buffer" },
		{
			name = "rg",
			-- Try it when you feel cmp performance is poor
			-- keyword_length = 3
		},
		{ name = "calc" },
	},
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'fuzzy_path' },
		{ name = 'fuzzy_buffer' }
  })
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- The following example advertise capabilities to `clangd`.
-- require'lspconfig'.clangd.setup {
--   capabilities = capabilities,
-- }

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require'lspconfig'.ruff-lsp.setup {
--   capabilities = capabilities,
-- }
require'lspconfig'.pyright.setup {
  capabilities = capabilities,
}
require'lspconfig'.lua_ls.setup {
  capabilities = capabilities,
}
require'lspconfig'.tsserver.setup {
  capabilities = capabilities,
}
require'lspconfig'.nixd.setup {
  capabilities = capabilities,
}
require'lspconfig'.nil_ls.setup {
  capabilities = capabilities,
}
require'lspconfig'.dockerls.setup {
  capabilities = capabilities,
}
require'lspconfig'.docker_compose_language_service.setup {
  capabilities = capabilities,
}
require'lspconfig'.bashls.setup {
  capabilities = capabilities,
}
require'lspconfig'.rust_analyzer.setup {
  capabilities = capabilities,
}
require'lspconfig'.clangd.setup {
  capabilities = capabilities,
}
require'lspconfig'.vale_ls.setup {
  capabilities = capabilities,
}
require'lspconfig'.yamlls.setup {
  capabilities = capabilities,
}
