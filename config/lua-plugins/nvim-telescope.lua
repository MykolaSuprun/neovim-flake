local opt = { noremap = true }
local telescope = require("telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
	},

	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		file_browser = {
			--theme = "catppuccin",
			-- disables netrw and use telescope-file-browser in its place
			--hijack_netrw = true, -- disable to prevent a conflict with nvim-tree-lua
			grouped = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
		undo = {
			side_by_side = true,
			layout_strategy = "vertical",
			layout_config = {
				preview_height = 0.8,
			},
		},
	},
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("recent_files")
require("telescope").load_extension("fzf")
require("telescope").load_extension("undo")
require("telescope").load_extension("media_files")
require("telescope").load_extension("harpoon")
require("telescope").load_extension("yank_history")
--vim.api.nvim_set_keymap("n", "<leader><tab>", ":lua require('telescope.builtin').find_files()<CR>", opt)
--vim.api.nvim_set_keymap("n", "<leader><leader>", ":lua require('telescope').extensions.recent_files.pick()<CR>", opt)
