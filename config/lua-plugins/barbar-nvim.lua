vim.g.barbar_auto_setup = false -- disable auto-setup

require("barbar").setup({
	-- Enable/disable animations
	animation = true,

	-- Enable/disable auto-hiding the tab bar when there is a single buffer
	auto_hide = false,

	-- Enable/disable current/total tabpages indicator (top right corner)
	tabpages = true,

	-- Enables/disable clickable tabs
	--  - left-click: go to buffer
	--  - middle-click: delete buffer
	clickable = true,

	-- Excludes buffers from the tabline
	-- exclude_ft = {'javascript'},
	-- exclude_name = {'package.json'},

	-- A buffer to this direction will be focused (if it exists) when closing the current buffer.
	-- Valid options are 'left' (the default), 'previous', and 'right'
	focus_on_close = "left",

	-- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
	hide = { extensions = true, inactive = false },

	-- Disable highlighting alternate buffers
	highlight_alternate = true,

	-- Disable highlighting file icons in inactive buffers
	highlight_inactive_file_icons = true,

	-- Enable highlighting visible buffers
	highlight_visible = true,

	icons = {
		-- Configure the base icons on the bufferline.
		-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
		buffer_index = true,
		buffer_number = false,
		button = "",
		-- Enables / disables diagnostic symbols
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
			[vim.diagnostic.severity.WARN] = { enabled = false },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = false },
		},
		gitsigns = {
			added = { enabled = true, icon = "+" },
			changed = { enabled = true, icon = "~" },
			deleted = { enabled = true, icon = "-" },
		},
		filetype = {
			-- Sets the icon's highlight group.
			-- If false, will use nvim-web-devicons colors
			custom_colors = false,

			-- Requires `nvim-web-devicons` if `true`
			enabled = true,
		},
		separator = { left = "▎", right = "" },

		-- If true, add an additional separator at the end of the buffer list
		separator_at_end = true,

		-- Configure the icons on the bufferline when modified or pinned.
		-- Supports all the base icon options.
		modified = { button = "●" },
		pinned = { button = "", filename = true },

		-- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
		preset = "slanted",

		-- Configure the icons on the bufferline based on the visibility of a buffer.
		-- Supports all the base icon options, plus `modified` and `pinned`.
		alternate = { filetype = { enabled = false } },
		current = { buffer_index = true },
		inactive = { button = "×" },
		visible = { modified = { buffer_number = false } },
	},

	-- If true, new buffers will be inserted at the start/end of the list.
	-- Default is to insert after current buffer.
	insert_at_end = false,
	insert_at_start = false,

	-- Sets the maximum padding width with which to surround each tab
	maximum_padding = 1,

	-- Sets the minimum padding width with which to surround each tab
	minimum_padding = 1,

	-- Sets the maximum buffer name length.
	maximum_length = 30,

	-- Sets the minimum buffer name length.
	minimum_length = 0,

	-- If set, the letters for each buffer in buffer-pick mode will be
	-- assigned based on their name. Otherwise or in case all letters are
	-- already assigned, the behavior is to assign letters in order of
	-- usability (see order below)
	semantic_letters = true,

	-- Set the filetypes which barbar will offset itself for
	sidebar_filetypes = {
		-- Use the default values: {event = 'BufWinLeave', text = nil}
		NvimTree = true,
		-- Or, specify the text used for the offset:
		undotree = { text = "Undotree" },
		-- Or, specify the event which the sidebar executes when leaving:
		["neo-tree"] = { event = "BufWipeout" },
		-- Or, specify both
		Outline = { event = "BufWinLeave", text = "symbols-outline" },
	},

	-- New buffer letters are assigned in this order. This order is
	-- optimal for the qwerty keyboard layout but might need adjustment
	-- for other layouts.
	letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",

	-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
	-- where X is the buffer number. But only a static string is accepted here.
	no_name_title = nil,
})

-- keymaps
local map = vim.api.nvim_set_keymap
-- Move to previous/next
map("n", "<S-h>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true, desc = "Prev buffer" })
map("n", "<S-l>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
-- Re-order to previous/next
map("n", "<A-h>", "<Cmd>BufferMovePrevious<CR>", { noremap = true, silent = true, desc = "Move buffer left" })
map("n", "<A-l>", "<Cmd>BufferMoveNext<CR>", { noremap = true, silent = true, desc = "Move buffer right" } )
-- Goto buffer in position...
map("n", "<leader>1", "<Cmd>BufferGoto 1<CR>", { noremap = true, silent = true, desc = "which_key_ignore" } )
map("n", "<leader>2", "<Cmd>BufferGoto 2<CR>", { noremap = true, silent = true, desc = "which_key_ignore" } )
map("n", "<leader>3", "<Cmd>BufferGoto 3<CR>", { noremap = true, silent = true, desc = "which_key_ignore" } )
map("n", "<leader>4", "<Cmd>BufferGoto 4<CR>", { noremap = true, silent = true, desc = "which_key_ignore" } )
map("n", "<leader>5", "<Cmd>BufferGoto 5<CR>", { noremap = true, silent = true, desc = "which_key_ignore" } )
map("n", "<leader>6", "<Cmd>BufferGoto 6<CR>", { noremap = true, silent = true, desc = "which_key_ignore" } )
map("n", "<leader>7", "<Cmd>BufferGoto 7<CR>", { noremap = true, silent = true, desc = "which_key_ignore" } )
map("n", "<leader>8", "<Cmd>BufferGoto 8<CR>", { noremap = true, silent = true, desc = "which_key_ignore" } )
map("n", "<leader>9", "<Cmd>BufferGoto 9<CR>", { noremap = true, silent = true, desc = "which_key_ignore" } )
map("n", "<leader>0", "<Cmd>BufferGoto 0<CR>", { noremap = true, silent = true, desc = "which_key_ignore" } )

-- Pin/unpin buffer
map("n", "<leader>bp", "<Cmd>BufferPin<CR>", { noremap = true, silent = true, desc = "Toggle [b]uffer [p]in" } )
map("n", "<leader>bP", "<Cmd>BufferCloseAllButPinned<CR>", { noremap = true, silent = true, desc = "[B]uffer close non-[p]inned" } )
-- Close buffer
map("n", "<leader>bd", "<Cmd>BufferClose<CR>", { noremap = true, silent = true, desc = "[B]uffer [d]elete" })
map("n", "<leader>bD", "<Cmd>BufferWipeout<CR>", { noremap = true, silent = true, desc = "[B]uffer [D]elete with changes" })
map("n", "<leader>j", "<Cmd>BufferPick<CR>", { noremap = true, silent = true, desc = "Jump to buffer" })
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', { noremap = true, silent = true, desc = "Sort by number" })
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', { noremap = true, silent = true, desc = "Sort by directory" })
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', { noremap = true, silent = true, desc = "Sort by language" })
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', { noremap = true, silent = true, desc = "Sort by window number" })
-- vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle [b]uffer [p]in" })
-- vim.keymap.set("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Delete non-pinned buffers" })
