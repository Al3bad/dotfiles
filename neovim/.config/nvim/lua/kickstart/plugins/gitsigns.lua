-------------------------------------------------
--> Keybindings
-------------------------------------------------
local function setupKeys(gs, map)
  map('n', ']h', gs.next_hunk, 'Next [H]unk')
  map('n', '[h', gs.prev_hunk, 'Prev [H]unk')
  map({ 'n', 'v' }, '<leader>gS', ':Gitsigns stage_hunk<CR>', '[G]it [H]unk [S]tage')
  map({ 'n', 'v' }, '<leader>gR', ':Gitsigns reset_hunk<CR>', '[G]it [H]unk [R]eset')
  map('n', '<leader>gu', gs.undo_stage_hunk, '[G]it [H]unk [U]ndo')
  map('n', '<leader>gp', gs.preview_hunk, '[G]it [H]unk [P]review')
  map('n', '<leader>gb', function()
    gs.blame_line { full = true }
  end, '[G]it [H]unk [B]lame Line')
  map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', '[G]it Select Inner Hunk')
end

-------------------------------------------------

---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '' },
      topdelete = { text = '' },
      changedelete = { text = '┃' },
      untracked = { text = '┆' },
    },
    signs_staged = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '' },
      topdelete = { text = '' },
      changedelete = { text = '┃' },
      untracked = { text = '┆' },
    },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end
      setupKeys(gs, map)
    end,
  },
}
