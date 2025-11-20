-- Set options
local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

-- Shorten the call to the API
local km = vim.api.nvim_set_keymap
local kms = vim.keymap.set

-- Remap the leader
km("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keymap stub
-- Modes are "n", "i", "v", and probably "e"

-- Navigate between windows more easily
km("n", "<C-h>", "<C-w>h", opts)
km("n", "<C-j>", "<C-w>j", opts)
km("n", "<C-k>", "<C-w>k", opts)
km("n", "<C-l>", "<C-w>l", opts)

-- TRIAL: Window switching
km("n", "<leader>h", "<C-w>h", opts)
km("n", "<leader>l", "<C-w>l", opts)

-- Buffer movement and management
km("n", "H", ":bprev<CR>", opts)
km("n", "L", ":bnext<CR>", opts)
km("n", "X", ":bdelete<CR>", opts)

-- Resize with arrows ** This conflicts with macOS Expose
km("n", "<C-Up>", ":resize +2<CR>", opts)
km("n", "<C-Down>", ":resize -2<CR>", opts)
km("n", "<C-Left>", ":vertical resize -2<CR>", opts)
km("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- jk to enter normal mode
km("i", "jk", "<ESC>", opts)

-- Quality of life mappings
km("n", ";", ":", opts)
km("n", ";;", ":xa<CR>", opts)
km("n", ";'", ":qa!<CR>", opts)
km("n", ";l", ":w<CR>", opts)

-- Vicual mode indents. Can be used with visual blocks as well
km("v", "<", "<gv", opts)
km("v", ">", ">gv", opts)

-- Move text up and down
km("v", "<A-j>", ":m .+1<CR>==", opts)
km("v", "<A-k>", ":m .-2<CR>==", opts)
km("v", "p", '"_dP', opts)

-- Quick sourcing
km("n", "<leader>s", ":source %<CR>:lua print(\"Sourced \" .. vim.fn.expand('%'))<CR>", opts)

-- Function keys mapping
km("n", "<F5>", ":syntax sync from start<CR>", opts) -- large JSON objects often break highlighitng, use this to try again
km("n", "<F6>", ":UndotreeToggle<CR>", opts)
km("n", "<F7>", ":set nowrap!<CR>", opts)
km("n", "<F8>", ":set nu! rnu!<CR>", opts) -- useful for cut and paste outside of nvim

-- Formatting
km("n", "<leader><space>", ":%s/\\s\\+$//e<CR>", opts) -- kill trailing spaces

-- NvimTree
km("n", "<leader>d", ":NvimTreeToggle<CR>", opts)

--  Outline
km("n", "<leader>o", ":Outline<CR>", opts)

-- Telescope
km("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
km("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)

-- Goto Preview
km("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
km("n", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", opts)
km("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_type_implementation()<CR>", opts)
km("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opts)
km("n", "gpx", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)
km("n", "<leader>r", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opts)
km("n", "<leader>x", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)
-- nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
-- nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
-- nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
-- nnoremap gpD <cmd>lua require('goto-preview').goto_preview_declaration()<CR>
-- nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
-- nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>
-- LuaSnip
local ls = require("luasnip")
kms({ "i" }, "<C-K>", function()
	ls.expand()
end, { silent = true })
kms({ "i", "s" }, "<C-L>", function()
	ls.jump(1)
end, { silent = true })
kms({ "i", "s" }, "<C-J>", function()
	ls.jump(-1)
end, { silent = true })

kms({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })
