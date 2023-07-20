require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	-- ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = false,

	-- List of parsers to ignore installing (for "all")
	-- ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		disable = {
			-- "c",
			-- "rust"
		},
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		disable = function(lang, buf)
			local max_filesize = 256 * 1024 -- 256 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},

	refactor = {
		highlight_definitions = {
			enable = true,
			-- Set to false if you have an `updatetime` of ~100.
			clear_on_cursor_move = true,
			highlight_current_scope = { enable = true },
			smart_rename = {
				enable = true,
				-- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
				keymaps = {
					smart_rename = "grr",
				},
			},
			navigation = {
				enable = true,
				-- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
				keymaps = {
					goto_definition = "gnd",
					list_definitions = "gnD",
					list_definitions_toc = "gO",
					goto_next_usage = "<a-*>",
					goto_previous_usage = "<a-#>",
				},
			},
		},
	},
	endwise = {
		enable = true,
	},

	-- pyfold = {
	--   enable = true
	--   custom_foldtext = true -- Sets provided foldtext on window where module is active
	-- },
})

require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
	trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = nil,
	zindex = 20, -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})
