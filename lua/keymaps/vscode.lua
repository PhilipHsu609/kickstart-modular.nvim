-- [[ VSCode-Neovim Integration Keymaps ]]
-- Keymaps specific to VSCode-Neovim integration
--  See: https://github.com/vscode-neovim/vscode-neovim

-- VSCode keymaps
local code = require 'vscode'

-- Editor Group Navigation (matches Neovim window navigation)
vim.keymap.set('n', '<C-h>', function()
  code.action 'workbench.action.navigateLeft'
end, { desc = 'Navigate to left editor group' })

vim.keymap.set('n', '<C-l>', function()
  code.action 'workbench.action.navigateRight'
end, { desc = 'Navigate to right editor group' })

vim.keymap.set('n', '<C-j>', function()
  code.action 'workbench.action.navigateDown'
end, { desc = 'Navigate to editor group below' })

vim.keymap.set('n', '<C-k>', function()
  code.action 'workbench.action.navigateUp'
end, { desc = 'Navigate to editor group above' })

vim.keymap.set('n', '<leader>wt', function()
  code.call 'workbench.view.testing.focus'
end, { desc = 'Move focus to the testing view' })

vim.keymap.set('n', '<leader>we', function()
  code.call 'workbench.view.explorer'
end, { desc = 'Move focus to the explorer view' })

vim.keymap.set('n', '<leader>q', function()
  code.action 'workbench.action.closeActiveEditor'
end, { desc = 'Close active editor' })

-- Implementation
vim.keymap.set('n', 'gi', function()
  code.action 'editor.action.goToImplementation'
end)
vim.keymap.set('n', 'gI', function()
  code.action 'editor.action.peekImplementation'
end)

-- Definition
vim.keymap.set('n', 'gd', function()
  code.action 'editor.action.revealDefinition'
end)
vim.keymap.set('n', 'gD', function()
  code.action 'editor.action.peekDefinition'
end)

-- Reference
vim.keymap.set('n', 'gr', function()
  code.action 'editor.action.goToReferences'
end, { desc = 'Go to [R]eferences' })
vim.keymap.set('n', 'gR', function()
  code.action 'editor.action.referenceSearch.trigger'
end, { desc = '[R]eference search' })

-- ============================================================================
-- Search Commands (Telescope equivalents)
-- ============================================================================

-- Search text in files
vim.keymap.set('n', '<leader>st', function()
  code.action 'workbench.action.quickTextSearch'
end, { desc = '[S]earch [T]ext' })

-- Search symbols in workspace
vim.keymap.set('n', '<leader>ss', function()
  code.action 'workbench.action.showAllSymbols'
end, { desc = '[S]earch [S]ymbols' })

-- Find buffers (recent editors)
vim.keymap.set('n', '<leader><leader>', function()
  code.action 'workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup'
end, { desc = '[ ] Find existing buffers' })

-- vim: ts=2 sts=2 sw=2 et
