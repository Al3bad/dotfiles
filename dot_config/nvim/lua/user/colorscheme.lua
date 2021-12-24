vim.cmd "autocmd ColorScheme * hi Normal ctermbg=NONE guibg=NONE"

local colorscheme = "onedark"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

-- Print an error messages if the color scheme is not found
if not status_ok then
  vim.cmd "colorscheme default"
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end


