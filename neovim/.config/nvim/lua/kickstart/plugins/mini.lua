---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  ft = '*',
  config = function()
    require('mini.pairs').setup()

    require('mini.bufremove').setup()

    -- Trim all trailing whitespace with `MiniTrailspace.trim()`
    -- Trim all trailing empty lines with `MiniTrailspace.trim_last_lines()`
    require('mini.trailspace').setup()

    require('mini.jump').setup {
      mappings = {
        forward = 'f',
        backward = 'F',
        forward_till = 't',
        backward_till = 'T',
        repeat_jump = ';',
      },
    }

    -- Better Around/Inside textobjects
    --  - va)  - [V]isually select [A]round [)]parenthen
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    -- require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup {
      mappings = {
        add = 'sa', -- Add surrounding in Normal and Visual modes
        delete = 'sd', -- Delete surrounding
        find = 'sf', -- Find surrounding (to the right)
        find_left = 'sF', -- Find surrounding (to the left)
        highlight = 'sh', -- Highlight surrounding
        replace = 'sr', -- Replace surrounding
        update_n_lines = '', -- Update `n_lines`

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    }

    require('mini.indentscope').setup {
      mappings = {
        -- Textobjects
        object_scope = 'ii',
        object_scope_with_border = 'ai',
        -- Motions (jump to respective border line; if not present - body line)
        goto_top = '[i',
        goto_bottom = ']i',
      },
      symbol = '│',
    }

    local hipatterns = require 'mini.hipatterns'
    hipatterns.setup {
      highlighters = {
        hex_color = hipatterns.gen_highlighter.hex_color(),
        emmylua = {
          pattern = function(buf_id)
            if vim.bo[buf_id].filetype ~= 'lua' then
              return nil
            end
            return '^%s*%-%-%-()@%w+()'
          end,
          group = 'Special',
        },
      },
    }

    require('mini.comment').setup {
      options = {
        custom_commentstring = function()
          if pcall(require, 'ts_context_commentstring') then
            return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
          end
        end,
      },
    }
  end,
  keys = {
    -- Buffer Remove
    {
      '<leader>bd',
      function()
        local bd = require('mini.bufremove').delete
        if vim.bo.modified then
          local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')
          if choice == 1 then -- Yes
            vim.cmd.write()
            bd(0)
          elseif choice == 2 then -- No
            bd(0, true)
          end
        else
          bd(0)
        end
      end,
      desc = 'Delete Buffer',
    },
  },
}
