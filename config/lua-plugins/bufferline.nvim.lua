local bufferline = require("bufferline")
bufferline.setup({
	options = {
		-- mode = "tabs",
		themable = true,
		numbers = "ordinal",
		tab_size = 12,

		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},

		offsets = {
			{
				filetype = "NvimTree",
				text = function()
					return vim.fn.getcwd()
				end,
				highlight = "Directory",
				separator = true, -- use a "true" to enable the default, or set your own character
			},
		},

		diagnostics = "nvim_lsp",

		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = ""
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or "")
				s = s .. n .. sym
			end
			return s
		end,
	},
})
