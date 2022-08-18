local ok_nvim_tree, ntree = pcall(require, 'nvim-tree')
if not ok_nvim_tree then
  print("Didn't find nvim-tree")
end

ntree.setup({
  hijack_netrw = true,
  auto_reload_on_write = true,
  reload_on_bufenter = true,
  respect_buf_cwd = true,
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- Enable dynamic reloading on FS operations
local ok_api, api = pcall(require, 'nvim-tree.api')
if not ok_api then
  vim.notify("nvim-tree.api requirement not met")
  return
end

Event = api.events.Event

api.events.subscribe(Event.FileCreated, function()
    api.tree.reload()
end)

api.events.subscribe(Event.FileRemoved, function()
    api.tree.reload()
end)

api.events.subscribe(Event.NodeRenamed, function()
    api.tree.reload()
end)

api.events.subscribe(Event.FolderCreated, function()
    api.tree.reload()
end)

api.events.subscribe(Event.FolderRemoved, function()
    api.tree.reload()
end)
