-- Window actions
vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Vertical right split" })
vim.keymap.set("n", "<leader>ws", "<C-W>s", { desc = "Horizontal bottom split" })
vim.keymap.set("n", "<leader>wc", "<C-W>d", { desc = "Delete window" })

vim.keymap.set("n", "<leader>wh", "<C-W>h", { desc = "Go to the left window" })
vim.keymap.set("n", "<leader>wl", "<C-W>l", { desc = "Go to the right window" })
vim.keymap.set("n", "<leader>wj", "<C-W>j", { desc = "Go to the lower window" })
vim.keymap.set("n", "<leader>wk", "<C-W>k", { desc = "Go to the upper window" })

vim.cmd.tnoremap("<A-h> <C-\\><C-N><C-w>h")
vim.cmd.tnoremap("<A-j> <C-\\><C-N><C-w>j")
vim.cmd.tnoremap("<A-k> <C-\\><C-N><C-w>k")
vim.cmd.tnoremap("<A-l> <C-\\><C-N><C-w>l")

vim.cmd.inoremap("<A-h> <C-\\><C-N><C-w>l")
vim.cmd.inoremap("<A-j> <C-\\><C-N><C-w>l")
vim.cmd.inoremap("<A-k> <C-\\><C-N><C-w>l")
vim.cmd.inoremap("<A-l> <C-\\><C-N><C-w>l")

vim.cmd.nnoremap("<A-h> <C-w>h")
vim.cmd.nnoremap("<A-j> <C-w>j")
vim.cmd.nnoremap("<A-k> <C-w>k")
vim.cmd.nnoremap("<A-l> <C-w>l")

vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Telescope file browser
vim.api.nvim_set_keymap(
	"n",
	"<leader>er",
	":Telescope file_browser<CR>",
	{ noremap = true, desc = "File browser in [r]oot folder" }
)

-- Open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
	"n",
	"<leader>el",
	":Telescope file_browser path=%:p:h select_buffer=true<CR>",
	{ noremap = true, desc = "File browser in [l]" }
)

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

-- LSP diagnostics for a current buffer
vim.keymap.set("n", "<leader>ld", require("telescope.builtin").diagnostics, { desc = "[L]SP [D]iagnostics" })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, { desc = "[F]ind current [W]ord" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "[F]ind [D]iagnostics" })

-- Telescope undo tree
vim.keymap.set("n", "<leader>uh", "<cmd>Telescope undo<CR>", { desc = "[U]ndo [h]istory" })
-- Undotre
vim.keymap.set("n", "<leader>ut", function()
	vim.cmd.NvimTreeClose()
	vim.cmd.UndotreeToggle()
end, { desc = "[U]ndo [t]ree" })
-- nvim tree
vim.keymap.set("n", "<leader>ee", function()
	vim.cmd.UndotreeHide()
	vim.cmd.NvimTreeToggle()
end, { desc = "Toggle NvimTree" })

-- Telescope yanky
vim.keymap.set("n", "<leader>fy", "<cmd>Telescope yank_history<CR>", { desc = "[F]ind [y]ank" })
-- Yank current file name
vim.keymap.set("n", "<leader>yf", '<cmd>let @+ = expand("%:t")<CR>', { desc = "[Y]ank [f]ile name" })
vim.keymap.set(
	"n",
	"<leader>yn",
	'<cmd>let @+ = expand("%:t:r")<CR>',
	{ desc = "[Y]ank file [n]ame without extension" }
)
vim.keymap.set(
	"n",
	"<leader>yr",
	'<cmd>let @+ = fnamemodify(expand("%"), ":~:.")<CR>',
	{ desc = "[Y]ank [r]elative file path" }
)
vim.keymap.set("n", "<leader>ya", '<cmd>let @+ = expand("%:p")<CR>', { desc = "[Y]ank [a]bsolute file path" })
-- yank to a system clipboard
vim.keymap.set("n", "<leader>ys", '"+y>', { desc = "[Y]ank to [s]ystem clipboard" })
vim.keymap.set("v", "<leader>ys", '"+y>', { desc = "[Y]ank to [s]ystem clipboard" })
vim.keymap.set("n", "<leader>ye", '"+Y>', { desc = "[Y]ank to the end of the line" })
-- Past from system clipboard
vim.keymap.set("n", "<leader>ps", '"+p>', { desc = "[P]aste from [s]ystem clipboard" })
vim.keymap.set("v", "<leader>ps", '"+p>', { desc = "[P]aste from [s]ystem clipboard" })
vim.keymap.set("n", "<leader>Ps", '"+P>', { desc = "[P]aste from [s]ystem clipboard" })
vim.keymap.set("v", "<leader>Ps", '"+P>', { desc = "[P]aste from [s]ystem clipboard" })

-- Harpoon mappings are in harpoon.lua

-- Show LspInfo
vim.keymap.set("n", "<leader>li", vim.cmd.LspInfo, { desc = "Show [L]SP [i]nfo" })
-- Formatter
vim.keymap.set("n", "<leader>cf", "<cmd>FormatLock<CR>", { desc = "[C]ode [format]" })
vim.keymap.set("n", "<leader>cF", "<cmd>FormatWriteLock<CR>", { desc = "[C]ode [format]" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

--bufferline
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle [b]uffer [p]in" })
vim.keymap.set("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Delete non-pinned buffers" })

-- buffers
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "[B]uffer [d]elete" })
vim.keymap.set("n", "<leader>bD", "<cmd>bd!<cr>", { desc = "[B]uffer [d]elete and discard changes" })
-- map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
-- map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
-- map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
-- map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
-- map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- tabs
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- trouble
vim.keymap.set("n", "<leader>cx", function()
	require("trouble").open()
end, { desc = "[C]ode - [T]rouble" })
vim.keymap.set("n", "<leader>cw", function()
	require("trouble").open("workspace_diagnostics")
end, { desc = "[C]ode - [w]orkspace diagnostics" })
vim.keymap.set("n", "<leader>cd", function()
	require("trouble").open("document_diagnostics")
end, { desc = "[C]ode - [d]ocument diagnostics" })
vim.keymap.set("n", "<leader>cq", function()
	require("trouble").open("quickfix")
end, { desc = "[C]ode - [Q]uickfix" })
vim.keymap.set("n", "<leader>cl", function()
	require("trouble").open("loclist")
end, { desc = "[C]ode - [L]oclist" })
vim.keymap.set("n", "gR", function()
	require("trouble").open("lsp_references")
end, { desc = "[G]o to [L]SP references" })

-- FTerm
vim.keymap.set("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle FTerm" })
vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle FTerm" })

vim.keymap.set("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to Buffer 1" })
vim.keymap.set("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to Buffer 2" })
vim.keymap.set("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to Buffer 3" })
vim.keymap.set("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "Go to Buffer 4" })
vim.keymap.set("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "Go to Buffer 5" })
vim.keymap.set("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { desc = "Go to Buffer 6" })
vim.keymap.set("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { desc = "Go to Buffer 7" })
vim.keymap.set("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { desc = "Go to Buffer 8" })
vim.keymap.set("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { desc = "Go to Buffer 9" })
vim.keymap.set("n", "<leader>0", "<Cmd>BufferLineGoToBuffer 10<CR>", { desc = "Go to Buffer 10" })
