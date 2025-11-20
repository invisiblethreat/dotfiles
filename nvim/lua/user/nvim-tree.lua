local tree = require("nvim-tree")

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	-- Default mappings. Feel free to modify or remove as you wish.
	--

  -- shorten all the calls to vim.keymap.set
	local kms = vim.keymap.set
	-- BEGIN_DEFAULT_ON_ATTACH
	kms("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
	kms("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
	kms("n", "<C-k>", api.node.show_info_popup, opts("Info"))
	kms("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
	kms("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
	kms("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
	kms("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
	kms("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
	kms("n", "<CR>", api.node.open.edit, opts("Open"))
	kms("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
	kms("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
	kms("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
	kms("n", ".", api.node.run.cmd, opts("Run Command"))
	kms("n", "-", api.tree.change_root_to_parent, opts("Up"))
	kms("n", "a", api.fs.create, opts("Create"))
	kms("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
	kms("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle No Buffer"))
	kms("n", "c", api.fs.copy.node, opts("Copy"))
	kms("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
	kms("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
	kms("n", "]c", api.node.navigate.git.next, opts("Next Git"))
	kms("n", "d", api.fs.remove, opts("Delete"))
	kms("n", "D", api.fs.trash, opts("Trash"))
	kms("n", "E", api.tree.expand_all, opts("Expand All"))
	kms("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
	kms("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
	kms("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
	kms("n", "F", api.live_filter.clear, opts("Clean Filter"))
	kms("n", "f", api.live_filter.start, opts("Filter"))
	kms("n", "g?", api.tree.toggle_help, opts("Help"))
	kms("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
	kms("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
	kms("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
	kms("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
	kms("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
	kms("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
	kms("n", "o", api.node.open.edit, opts("Open"))
	kms("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
	kms("n", "p", api.fs.paste, opts("Paste"))
	kms("n", "P", api.node.navigate.parent, opts("Parent Directory"))
	kms("n", "q", api.tree.close, opts("Close"))
	kms("n", "r", api.fs.rename, opts("Rename"))
	kms("n", "R", api.tree.reload, opts("Refresh"))
	kms("n", "s", api.node.run.system, opts("Run System"))
	kms("n", "S", api.tree.search_node, opts("Search"))
	kms("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
	kms("n", "W", api.tree.collapse_all, opts("Collapse"))
	kms("n", "x", api.fs.cut, opts("Cut"))
	kms("n", "y", api.fs.copy.filename, opts("Copy Name"))
	kms("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
	kms("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
	kms("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
	-- END_DEFAULT_ON_ATTACH

	-- Mappings removed via:
	--   remove_keymaps
	--   OR
	--   view.mappings.list..action = ""
	--
	-- The dummy set before del is done for safety, in case a default mapping does not exist.
	--
	-- You might tidy things by removing these along with their default mapping.
	-- vim.keymap.set("n", "<2-RightMouse>", "", { buffer = bufnr })
	-- vim.keymap.del("n", "<2-RightMouse>", { buffer = bufnr })
	-- vim.keymap.set("n", "<C-]>", "", { buffer = bufnr })
	-- vim.keymap.del("n", "<C-]>", { buffer = bufnr })
	-- vim.keymap.set("n", "<C-v>", "", { buffer = bufnr })
	-- vim.keymap.del("n", "<C-v>", { buffer = bufnr })
	-- vim.keymap.set("n", "<C-x>", "", { buffer = bufnr })
	-- vim.keymap.del("n", "<C-x>", { buffer = bufnr })
	-- vim.keymap.set("n", "<C-t>", "", { buffer = bufnr })
	-- vim.keymap.del("n", "<C-t>", { buffer = bufnr })
	-- vim.keymap.set("n", "<BS>", "", { buffer = bufnr })
	-- vim.keymap.del("n", "<BS>", { buffer = bufnr })
	-- vim.keymap.set("n", "<Tab>", "", { buffer = bufnr })
	-- vim.keymap.del("n", "<Tab>", { buffer = bufnr })
	-- vim.keymap.set("n", "D", "", { buffer = bufnr })
	-- vim.keymap.del("n", "D", { buffer = bufnr })
	-- vim.keymap.set("n", "[e", "", { buffer = bufnr })
	-- vim.keymap.del("n", "[e", { buffer = bufnr })
	-- vim.keymap.set("n", "]e", "", { buffer = bufnr })
	-- vim.keymap.del("n", "]e", { buffer = bufnr })
	-- vim.keymap.set("n", "[c", "", { buffer = bufnr })
	-- vim.keymap.del("n", "[c", { buffer = bufnr })
	-- vim.keymap.set("n", "]c", "", { buffer = bufnr })
	-- vim.keymap.del("n", "]c", { buffer = bufnr })
	-- vim.keymap.set("n", "-", "", { buffer = bufnr })
	-- vim.keymap.del("n", "-", { buffer = bufnr })
	-- vim.keymap.set("n", "s", "", { buffer = bufnr })
	-- vim.keymap.del("n", "s", { buffer = bufnr })
	-- vim.keymap.set("n", "W", "", { buffer = bufnr })
	-- vim.keymap.del("n", "W", { buffer = bufnr })
	-- vim.keymap.set("n", "g?", "", { buffer = bufnr })
	-- vim.keymap.del("n", "g?", { buffer = bufnr })

	-- Mappings migrated from view.mappings.list
	--
	-- You will need to insert "your code goes here" for any mappings with a custom action_cb
	vim.keymap.set("n", "d", api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set("n", "x", api.fs.remove, opts("Delete"))
	vim.keymap.set("n", "t", api.fs.cut, opts("Cut"))
	vim.keymap.set("n", "<Space>p", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
	vim.keymap.set("n", "<Space>.", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
	vim.keymap.set("n", "<Space>k", api.node.navigate.git.prev, opts("Prev Git"))
	vim.keymap.set("n", "<Space>j", api.node.navigate.git.next, opts("Next Git"))
	vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "'", api.node.navigate.parent_close, opts("Close Directory"))
	vim.keymap.set("n", '"', api.tree.collapse_all, opts("Collapse"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

tree.setup({
	on_attach = on_attach,
	sync_root_with_cwd = true,
	view = {
		adaptive_size = false,
	},
	renderer = {
		full_name = true,
		highlight_git = true,

		group_empty = true,
		special_files = {},
		symlink_destination = false,
		indent_markers = { enable = true },
		icons = {
			webdev_colors = true,
			git_placement = "signcolumn",
			modified_placement = "after",
			symlink_arrow = "  ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
				modified = true,
			},
		},
	},
	update_focused_file = {
		enable = true,
		update_root = true,
		ignore_list = { "help" },
	},
	diagnostics = { enable = true, show_on_dirs = true },
	filters = { custom = { "^.git$" } },
	actions = {
		-- change_dir = {enable = false, restrict_above_cwd = false},
		change_dir = { enable = true, restrict_above_cwd = false },
		open_file = { resize_window = true, window_picker = { chars = "aoeui" } },
		remove_file = { close_window = false },
	},
	log = {
		enable = false,
		truncate = true,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			diagnostics = false,
			git = false,
			profile = false,
			watcher = false,
		},
	},
})
