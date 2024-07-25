-- Set the leader key if not already set
vim.g.mapleader = ' ' -- Assuming the leader key is set to space

-- Key mapping to source the current file
vim.api.nvim_set_keymap('n', '<leader>r', ':source %<CR>', { noremap = true, silent = true })
-- Key mapping to toggle NvimTree
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- Create a custom key mapping to focus the view on the currently selected directory
vim.api.nvim_set_keymap('n', '<leader>e', ':lua require("nvim-tree.api").tree.focus()<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<leader>c', '"+yy', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-c>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-C>', '"+y', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<C-C>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-V>', '"+p', { noremap = true, silent = true })
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

-- map Ctrl+d to scroll down 1/2 screen
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>', { noremap = true, silent = true })
-- map Ctrl+f to scroll up 1/2 screen
vim.api.nvim_set_keymap('n', '<C-f>', '<C-u>', { noremap = true, silent = true })


vim.keymap.set('', "<C-s>j", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set('', "<C-s>k", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set('', "<C-s>i", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set('', "<C-s>l", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set('', "<C-s>,", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set('', "<C-s>Space", nvim_tmux_nav.NvimTmuxNavigateNext)


vim.keymap.set('', "<C-w>j", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set('', "<C-w>k", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set('', "<C-w>i", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set('', "<C-w>l", nvim_tmux_nav.NvimTmuxNavigateRight)





-- Define a function to write and then close the buffer
function Write_and_close()
	vim.cmd('write') -- Save the buffer
	vim.cmd('bd') -- Delete the buffer
end



-- Keymap for horizontal split using Ctrl+w h
vim.keymap.set('n', '<C-w>h', ':vsplit<CR>', { noremap = true, silent = true })
-- Keymap for vertical split using Ctrl+w s
vim.keymap.set('n', '<C-w>v', ':split<CR>', { noremap = true, silent = true })
-- Keymap for creating a new tab using Ctrl+w c
vim.keymap.set('n', '<C-w>c', ':tabnew<CR>', { noremap = true, silent = true })
-- Keymap for closing the current pane using Ctrl+w x
-- Map the function to <C-w>-x to write and close buffer
vim.api.nvim_set_keymap('n', '<C-w>x', ':lua write_and_close()<CR>', { noremap = true, silent = true })
-- Keymap for closing the current tab using Ctrl+w X
vim.keymap.set('n', '<C-w>X', ':bd<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>d', ':close<CR>', { noremap = true, silent = true })
-- Keymap for saving all
vim.keymap.set('n', '<C-w>s', ':wa<CR>', { noremap = true, silent = true })
-- Select all text
vim.keymap.set('', '<C-w>a', 'ggVG<CR>', { noremap = true, silent = true })
vim.keymap.set('', '<C-w>q', ':wa | qa!<CR>', { noremap = true, silent = true })
vim.keymap.set('', '<C-w>Q', ':qa!<CR>', { noremap = true, silent = true })


-- Resize splits with Ctrl + arrow keys
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +5<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<M-j>', ':vertical resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-l>', ':vertical resize +5<CR>', { noremap = true, silent = true })

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

-- zz - Center the screen on the current line  
vim.api.nvim_set_keymap('n', 'zz', 'zz', { noremap = true, silent = true })

-- zt - Center the screen on the current line, aligning it to the top of the window  
vim.api.nvim_set_keymap('n', 'zt', 'zt', { noremap = true, silent = true })

-- zb - Center the screen on the current line, aligning it to the bottom of the window  
vim.api.nvim_set_keymap('n', 'zb', 'zb', { noremap = true, silent = true })
-- Example in init.lua


-- Direct Insert Mode Mappings for Movement
vim.api.nvim_set_keymap('i', '<M-i>', '<Up>', { noremap = true, silent = true })    -- Move up
vim.api.nvim_set_keymap('i', '<M-j>', '<Left>', { noremap = true, silent = true })  -- Move down
vim.api.nvim_set_keymap('i', '<M-k>', '<Down>', { noremap = true, silent = true })  -- Move left
vim.api.nvim_set_keymap('i', '<M-l>', '<Right>', { noremap = true, silent = true }) -- Move right


-- Indent Line Forward with `»`
vim.api.nvim_set_keymap('n', '«', '@', { noremap = true, silent = true })


-- Map Tab to indent line forward
vim.api.nvim_set_keymap('n', '<Tab>', '>gv', { noremap = true, silent = true })

-- Map Shift+Tab to indent line backward
vim.api.nvim_set_keymap('n', '<S-Tab>', '<gv', { noremap = true, silent = true })


-- Map Tab to indent line forward
vim.api.nvim_set_keymap('v', '<Tab>', '>>', { noremap = true, silent = true })

-- Map Shift+Tab to indent line backward
vim.api.nvim_set_keymap('v', '<S-Tab>', '<<', { noremap = true, silent = true })



-- Map `w` to move to the start of the next word
vim.api.nvim_set_keymap('n', 'w', 'w', { noremap = true, silent = true })
-- Map `s` to move to the start of the previous word
vim.api.nvim_set_keymap('n', 's', 'b', { noremap = true, silent = true })

-- Map `s` to move to the end of the next word
vim.api.nvim_set_keymap('n', 'e', 'e', { noremap = true, silent = true })
-- Map `q` to move to the end of the previous word
vim.api.nvim_set_keymap('n', 'q', 'ge', { noremap = true, silent = true })

-- Map `b` start a macro
vim.api.nvim_set_keymap('n', 'b', 'q', { noremap = true, silent = true })


-- Map `w` to move to the start of the next word
vim.api.nvim_set_keymap('v', 'w', 'w', { noremap = true, silent = true })
-- Map `s` to move to the start of the previous word
vim.api.nvim_set_keymap('v', 's', 'b', { noremap = true, silent = true })

-- Map `s` to move to the end of the next word
vim.api.nvim_set_keymap('v', 'e', 'e', { noremap = true, silent = true })
-- Map `q` to move to the end of the previous word
vim.api.nvim_set_keymap('v', 'q', 'ge', { noremap = true, silent = true })

-- Map `b` start a macro
vim.api.nvim_set_keymap('v', 'b', 'q', { noremap = true, silent = true })




function Replace_with_input()
	local old_char = vim.fn.input("Replace character: ")
	local new_char = vim.fn.input("Replace with: ")
	if old_char ~= "" and new_char ~= "" then
		vim.cmd(string.format('%%s/%s/%s/g', old_char, new_char))
	end
end

function Replace_with_confirmation()
	local old_char = vim.fn.input("Replace character: ")
	local new_char = vim.fn.input("Replace with: ")
	if old_char ~= "" and new_char ~= "" then
		-- Execute substitution with confirmation for each match
		vim.cmd(string.format('%%s/%s/%s/gc', old_char, new_char))
	end
end

-- Bind the function to <C-H>
vim.api.nvim_set_keymap('n', '<C-g>', '<Cmd>lua Replace_with_confirmation()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<Cmd>lua Replace_with_input()<CR>', { noremap = true, silent = true })



-- Oil go backward with backspace
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
vim.keymap.set("n", "<BS>", require("oil").open, { desc = "Open parent directory" })

vim.api.nvim_set_keymap('n', '<leader>o', ':Oil<CR>', { noremap = true, silent = true })



--end
print("Vim configuration reloaded")
--print(vim.env.TERM)
