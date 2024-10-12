vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
-- jump and center screen
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- insert new line in normal mode
vim.api.nvim_set_keymap('n', '<Leader>o', 'o<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>O', 'O<Esc>', { noremap = true, silent = true })

-- search stays on current word
vim.api.nvim_set_keymap('n', '*', '*N', { noremap = true, silent = true })
