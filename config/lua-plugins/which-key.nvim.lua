vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")
wk.register({
	y = "yank",
	p = "paste/preview",
	P = "Paste",
	w = "window",
	e = "explorer",
	g = "goto/git",
	x = "trouble",
	c = "code",
	l = "LSP",
	u = "undo",
	b = "buffer",
	f = "find",
	U = "ui",
	["<tab >"] = "tabs",
}, { prefix = "<leader>" })
