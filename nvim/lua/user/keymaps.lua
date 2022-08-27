-- Set options
local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

-- Shorten the call to the API
local km = vim.api.nvim_set_keymap

-- Remap the leader
km("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keymap stub
-- Modes are "n", "i", "v", and probably "e"
-- km("n", "<leader>x", "REPLACE", opts)

-- Navigate between windows more easily
km("n", "<C-h>", "<C-w>h", opts)
km("n", "<C-j>", "<C-w>j", opts)
km("n", "<C-k>", "<C-w>k", opts)
km("n", "<C-l>", "<C-w>l", opts)

-- Navigate between buffers more easily
km("n", "<leader>h", ":bprev<CR>", opts)
km("n", "<leader>l", ":bnext<CR>", opts)
km("n", "<leader>x", ":Bdelete<CR>", opts)
-- EXPERIMENT: trial buffer switching
km("n", "H", ":bprev<CR>", opts)
km("n", "L", ":bnext<CR>", opts)
km("n", "X", ":Bdelete<CR>", opts)

-- Resize with arrows ** This conflicts with macOS Expose
km("n", "<C-Up>", ":resize +2<CR>", opts)
km("n", "<C-Down>", ":resize -2<CR>", opts)
km("n", "<C-Left>", ":vertical resize -2<CR>", opts)
km("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Press jk fast to enter
km("i", "jk", "<ESC>", opts)

-- Quality of life mappings
km("n", ";", ":", opts)
km("n", ";;", ":x<CR>", opts)
km("n", ";'", ":q!<CR>", opts)
km("n", ";l", ":w<CR>", opts)

-- Indents
km("v", "<", "<gv", opts)
km("v", ">", ">gv", opts)

-- Move text up and down
km("v", "<A-j>", ":m .+1<CR>==", opts)
km("v", "<A-k>", ":m .-2<CR>==", opts)
km("v", "p", '"_dP', opts)

-- Quick sourcing
km("n", "<leader>s", ":source %<CR>:lua print(\"Sourced \" .. vim.fn.expand('%'))<CR>", opts)

-- Function keys mapping
km("n", "<F5>", ":syntax sync from start<CR>", opts)    -- large JSON objects often break highlighitng, use this to try again
km("n", "<F6>", ":UndoTreeToggle<CR>", opts)
km("n", "<F7>", ":set nowrap!<CR>", opts)
km("n", "<F8>", ":set nu! rnu!<CR>", opts)              -- useful for cut and paste outside of nvim

-- Formatting
km("n", "<leader><space>", ":%s/\\s\\+$//e<CR>", opts)
km("n", "<leader>f", ":Neoformat<CR>", opts)

-- NvimTree
km("n", "<leader>d", ":NvimTreeToggle<CR>", opts)

-- Telescope
km("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
km("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
