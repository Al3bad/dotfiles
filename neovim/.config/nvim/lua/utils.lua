M = {}

-- Get the list of opened buffers
M.get_listed_bufs = function()
  return vim.tbl_filter(function(bufnr)
    return vim.api.nvim_buf_get_option(bufnr, 'buflisted')
  end, vim.api.nvim_list_bufs())
end

return M
