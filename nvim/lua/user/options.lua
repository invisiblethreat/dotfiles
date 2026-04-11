-- :help options
local o = vim.opt
o.guicursor = "" -- fat cursor
o.cmdheight = 1
o.colorcolumn = "81,120"
o.cursorline = true -- highlight the current line
o.enc = "utf8"
-- o.scriptencoding = "utf8"
o.expandtab = true
o.foldlevelstart = 20
o.foldmethod = "indent"
o.hidden = true
o.history = 1000
o.hlsearch = true
o.incsearch = true
o.list = true
o.listchars = {
	trail = "",
	tab = "",
	precedes = "",
	extends = "",
}
o.number = true
o.relativenumber = true
o.scrolloff = 20
o.shiftwidth = 2
o.showmatch = true
o.splitbelow = true -- force splits below current window
o.splitright = true -- force splits right of the current window
o.statusline = "%F%m%r%h%w [Position=%04l,%04v][%p%%] [Lines=%L]"
o.tabstop = 2
o.termguicolors = true
o.title = true
o.undofile = true
o.undolevels = 1000
o.modeline = true
o.mouse = ""

vim.o.cmdheight = 0
require("vim._core.ui2").enable({
	enable = true,
	msg = {
		targets = {
			[""] = "msg",
			empty = "cmd",
			bufwrite = "msg",
			confirm = "cmd",
			emsg = "pager",
			echo = "msg",
			echomsg = "msg",
			echoerr = "pager",
			completion = "cmd",
			list_cmd = "pager",
			lua_error = "pager",
			lua_print = "msg",
			progress = "pager",
			rpc_error = "pager",
			quickfix = "msg",
			search_cmd = "cmd",
			search_count = "cmd",
			shell_cmd = "pager",
			shell_err = "pager",
			shell_out = "pager",
			shell_ret = "msg",
			undo = "msg",
			verbose = "pager",
			wildlist = "cmd",
			wmsg = "msg",
			typed_cmd = "cmd",
		},
		cmd = {
			height = 0.5,
		},
		dialog = {
			height = 0.5,
		},
		msg = {
			height = 0.3,
			timeout = 5000,
		},
		pager = {
			height = 0.5,
		},
	},
})
