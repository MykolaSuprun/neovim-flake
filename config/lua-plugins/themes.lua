require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	integrations = {
		cmp = true,
		which_key = true,
		noice = true,
		notify = true,
		nvimtree = true,
		treesitter_context = true,
		telescope = {
			enabled = true,
			style = "nvchad",
		},
		harpoon = true,
	},
})

vim.cmd.colorscheme("catppuccin")
