-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap('n', '<C-e>', ':execute "e %:h/" . input("Enter filename: ")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'C-H', ':<C-U>execute "silent !rg " . shellescape(getreg("\""))<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Leader>ua", ":PhpactorAddUse<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>rn", ":PhpactorRename<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>rf", ":PhpactorRefactor<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gd", ":PhpactorGoToDefinition<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gr", ":PhpactorReferences<CR>", { noremap = true, silent = true })
