-- :help options
local options = {
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  colorcolumn = "81,120",
  cursorline = true,                       -- highlight the current line
  enc = "utf8",
  expandtab = true,
  foldlevelstart = 20,
  foldmethod = "indent",
  hidden = true,
  history = 1000,
  hlsearch = true,
  incsearch = true,
  list = true,
  number = true,
  relativenumber = true,
  scrolloff = 20,
  shiftwidth = 2,
  showmatch = true,
  splitbelow = true,                       -- force splits below current window
  splitright = true,                       -- force splits right of the current window
  statusline = "%F%m%r%h%w [Position=%04l,%04v][%p%%] [Lines=%L]",
  tabstop = 2,
  title = true,
  undodir = "~/.config/nvim/undo",
  undofile = true,
  undolevels = 1000,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

