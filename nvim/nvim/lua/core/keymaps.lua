-- copy to clipboard
vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', 'yy', '"+yy', { noremap = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true })

-- cut 
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true })
vim.api.nvim_set_keymap('v', 'x', '"+d', { noremap = true })

-- Paste from clipboard
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('v', 'p', '"_dP', { noremap = true })

-- save and quit and select all
vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>w!<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-q>', '<cmd>q!<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-a>', 'gg<S-v>G', { noremap = true })

-- split
vim.api.nvim_set_keymap('n', 'sv', '<cmd>vplit<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'ss', '<cmd>split<cr>', { noremap = true })

vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "??", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "?.", 'copilot#Next()', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "?,", 'copilot#Previous()', { silent = true, expr = true })

