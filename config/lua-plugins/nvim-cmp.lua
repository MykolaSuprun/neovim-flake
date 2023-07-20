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
		{ name = "luasnip" },
		{
			name = "buffer",
			option = { keyword_pattern = [[\k\+]] },
		},
		{ name = "buffer-lines" },
		{ name = "calc" },
		{ name = "nvim_lsp" },
		{ name = "async_path" },
		{ name = "fuzzy_path" },
	},
})
-- -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
--
-- -- The following example advertise capabilities to `clangd`.
-- require'lspconfig'.clangd.setup {
--   capabilities = capabilities,
-- }
