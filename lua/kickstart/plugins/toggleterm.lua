---@module 'lazy'
---@type LazySpec
return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    { '<C-t>', mode = { 'n', 't' }, desc = 'Toggle floating terminal' },
    { '<leader>xb', function() require('kickstart.terminal').run_kind 'build' end, desc = 'Terminal: [B]uild' },
    { '<leader>xt', function() require('kickstart.terminal').run_kind 'test' end, desc = 'Terminal: [T]est' },
    { '<leader>xl', function() require('kickstart.terminal').rerun() end, desc = 'Terminal: re-run [L]ast command' },
    { '<leader>xx', function() require('kickstart.terminal').prompt() end, desc = 'Terminal: run command' },
  },
  opts = {
    open_mapping = [[<C-t>]],
    direction = 'float',
    float_opts = { border = 'rounded', width = function() return math.floor(vim.o.columns * 0.8) end, height = function() return math.floor(vim.o.lines * 0.8) end },
    persist_mode = false,
    on_open = function(term)
      -- Buffer-local: overrides the global <Esc><Esc> (exit terminal mode) only inside toggleterm.
      vim.keymap.set({ 't', 'n' }, '<Esc><Esc>', function() term:close() end, { buffer = term.bufnr, desc = 'Hide floating terminal' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
