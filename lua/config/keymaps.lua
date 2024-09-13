-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap('n', '<Leader>ua', ':PhpactorAddUse<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rn', ':PhpactorRename<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rf', ':PhpactorRefactor<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gd', ':PhpactorGoToDefinition<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gr', ':PhpactorReferences<CR>', { noremap = true, silent = true })
