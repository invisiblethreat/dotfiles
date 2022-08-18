function ChmodExecute()
  -- nvim_get_buf_lines returns a table, which is a 1-indexed array. Keys are the array index.
  local line = vim.api.nvim_buf_get_lines(0, 0, 1, 0) -- current file, first, last_exclude, strict range
  local shebang = line[1]
  local s, _ = string.find(shebang, "#!/") -- first condition
  if (s ~= nil) then
    local b, _ = string.find(shebang, "/bin/") -- second condition
    if ( b~= nil) then
      vim.api.nvim_command(":silent !chmod 755 " .. vim.api.nvim_buf_get_name(0))
    end
  end
end

-- au BufWritePost * call Chmod_bin()
vim.cmd("autocmd BufWritePost * lua ChmodExecute()")
