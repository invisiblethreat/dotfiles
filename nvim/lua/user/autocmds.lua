-- Enable treesitter highlighting and indentation for all filetypes
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		local ok = pcall(vim.treesitter.start)
		if ok then
			-- Use treesitter-based indentation where available
			vim.bo.indentexpr = "v:lua.vim.treesitter.indentexpr()"
		end
	end,
})

-- Disable treesitter indentation for yaml (notoriously broken)
vim.api.nvim_create_autocmd("FileType", {
	pattern = "yaml",
	callback = function()
		vim.bo.indentexpr = ""
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "msg",
	callback = function()
		local ui2 = require("vim._core.ui2")
		local win = ui2.wins and ui2.wins.msg
		if win and vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_set_option_value("winhighlight", "Normal:NormalFloat,FloatBorder:FloatBorder", {
				scope = "local",
				win = win,
			})
		end
	end,
})

local ui2 = require("vim._core.ui2")
local msgs = require("vim._core.ui2.messages")
local orig_set_pos = msgs.set_pos
msgs.set_pos = function(tgt)
	orig_set_pos(tgt)
	if (tgt == "msg" or tgt == nil) and vim.api.nvim_win_is_valid(ui2.wins.msg) then
		pcall(vim.api.nvim_win_set_config, ui2.wins.msg, {
			relative = "editor",
			anchor = "NW",
			row = 1,
			col = 0,
			border = "rounded",
		})
	end
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "cmd",
	callback = function()
		vim.schedule(function()
			local win = ui2.wins and ui2.wins.cmd
			if not (win and vim.api.nvim_win_is_valid(win)) then
				return
			end
			-- Don't read width from the existing config: check_targets() opens
			-- the cmd window at width=10000, so the `or` fallback never fires.
			local width = math.floor(vim.o.columns * 0.6)
			local height = 1
			pcall(vim.api.nvim_win_set_config, win, {
				relative = "editor",
				anchor = "NW",
				row = math.floor((vim.o.lines - height) / 2),
				col = math.floor((vim.o.columns - width) / 2),
				width = width,
				height = height,
				border = "rounded",
				style = "minimal",
			})
		end)
	end,
})

-- autocmd to load the nvim-tree without stealing focus. This is generally a
-- reminder that you can stay in nvim and move around more easily
local function open_nvim_tree()
	-- open the tree
	require("nvim-tree.api").tree.toggle({ focus = false })
end

-- open nvimtree on startup
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
