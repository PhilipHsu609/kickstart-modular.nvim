return {
  {
    url = 'https://codeberg.org/andyg/leap.nvim',
    config = function()
      -- Enable leap in both Neovim and VSCode-Neovim
      -- Provides fast 2-character search motion
      --
      -- Keymaps:
      --  - gs{char}{char}  - [G]oto [S]earch forward
      --  - gS{char}{char}  - [G]oto [S]earch backward
      --  - gw{char}{char}  - [G]oto [W]indow (leap to other windows)

      -- Bidirectional search in normal mode
      vim.keymap.set('n', 'gs', '<Plug>(leap-forward)', { desc = 'Leap forward' })
      vim.keymap.set('n', 'gS', '<Plug>(leap-backward)', { desc = 'Leap backward' })

      -- Visual mode
      vim.keymap.set('x', 'gs', '<Plug>(leap-forward)', { desc = 'Leap forward' })
      vim.keymap.set('x', 'gS', '<Plug>(leap-backward)', { desc = 'Leap backward' })

      -- Operator pending mode
      vim.keymap.set('o', 'gs', '<Plug>(leap-forward)', { desc = 'Leap forward' })
      vim.keymap.set('o', 'gS', '<Plug>(leap-backward)', { desc = 'Leap backward' })

      -- Leap to other windows
      vim.keymap.set('n', 'gw', '<Plug>(leap-from-window)', { desc = 'Leap to window' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
