-- Set the leader key if not already set
vim.g.mapleader = ' ' -- Assuming the leader key is set to space

-- Key mapping to source the current file
vim.api.nvim_set_keymap('n', '<leader>r', ':source %<CR>', { noremap = true, silent = true })
-- Key mapping to toggle NvimTree
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>c', '"+yy', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<leader>c', '"+yy', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})



vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
-- Navigate to the next buffer
vim.api.nvim_set_keymap('n', '<C-n>', ':bnext<CR>', { noremap = true, silent = true })
-- Navigate to the previous buffer
vim.api.nvim_set_keymap('n', '<C-b>', ':bprevious<CR>', { noremap = true, silent = true })


vim.keymap.set('', "<C-s>j", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set('', "<C-s>k", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set('', "<C-s>i", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set('', "<C-s>l", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set('', "<C-s>,", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set('', "<C-s>Space", nvim_tmux_nav.NvimTmuxNavigateNext)


-- Navigate vim panes better
--vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
--vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
--vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
--vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Keymap for horizontal split using Ctrl+w h
vim.keymap.set('n', '<C-w>h', ':split<CR>', { noremap = true, silent = true })
-- Keymap for vertical split using Ctrl+w s
vim.keymap.set('n', '<C-w>v', ':vsplit<CR>', { noremap = true, silent = true })
-- Keymap for creating a new tab using Ctrl+w c
vim.keymap.set('n', '<C-w>c', ':tabnew<CR>', { noremap = true, silent = true })
-- Keymap for closing the current pane using Ctrl+w x
vim.keymap.set('n', '<C-w>x', ':close<CR>', { noremap = true, silent = true })
-- Keymap for closing the current tab using Ctrl+w X
vim.keymap.set('n', '<C-w>X', ':bd<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>d', ':bd<CR>', { noremap = true, silent = true })
-- Keymap for saving all
vim.keymap.set('n', '<C-w>s', ':wa<CR>', { noremap = true, silent = true })
-- Select all text
vim.keymap.set('', '<C-w>a', ':ggVG<CR>', { noremap = true, silent = true })
vim.keymap.set('', '<C-w>q', ':wq!<CR>', { noremap = true, silent = true })
vim.keymap.set('', '<C-w>Q', ':wa | qa!<CR>', { noremap = true, silent = true })

-- Apply 'jk' to exit insert mode and visual mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('v', 'jk', '<Esc>', { noremap = true })


vim.api.nvim_set_keymap('v', 'j', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'l', 'l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'i', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'h', 'i', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'j', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'l', 'l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'i', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'h', 'i', { noremap = true, silent = true })

--end
print("Vim configuration reloaded")
