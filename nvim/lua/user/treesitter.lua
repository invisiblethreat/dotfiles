-- nvim-treesitter v2 (rewrite) — no more nvim-treesitter.configs
-- Parsers are installed independently; highlighting uses vim.treesitter built-ins.

require("nvim-treesitter").install({
	"bash",
	"c",
	"dockerfile",
	"go",
	"json",
	"lua",
	"markdown",
	"python",
	"sql",
	"yaml",
  "git_config",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "gitignore",
  "toml",
  "vim",
  "xml",
})


-- Define a custom highlight group for Python comments
-- https://neovim.io/doc/user/api.html#nvim_set_hl()

-- Use :Inspect or :InspectTree to see what's under the cursor to override
vim.api.nvim_set_hl(0, "CustomLuaComment", { fg = "#3399ff", italic = true })
vim.api.nvim_set_hl(0, "@lsp.type.comment.lua", { link = "CustomLuaComment" })

vim.api.nvim_set_hl(0, "CustomPythonComment", { fg = "#3399ff", italic = true })
vim.api.nvim_set_hl(0, "@comment.python", { link = "CustomPythonComment" })
