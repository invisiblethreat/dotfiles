-- load this file last

-- autocmd to load the nvim-tree without stealing focus. This is generally a
-- reminder that you can stay in nvim and move around more easily
local function open_nvim_tree()
  -- open the tree
  require("nvim-tree.api").tree.toggle({ focus = false })
end

-- open nvimtree on startup
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
