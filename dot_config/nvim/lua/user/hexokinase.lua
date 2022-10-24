local status_ok, hexokinase = pcall(require, "hexokinase")
if not status_ok then return end

vim.g.Hexokinase_highlighters = { "backgroundfull" }
vim.g.Hexokinase_optInPatterns = "full_hex,triple_hex,rgb,rgba,hsl,hsla"
