-- Define the custom function to print node path (optional)
local function print_node_path(node)
  print(node.absolute_path)
end

-- Define the key mappings
local list = {
  { key = {"<CR>", "o"}, action = "edit", mode = "n" }, -- Default action for Enter key and 'o'
  { key = "p", action = "print_path", action_cb = print_node_path }, -- Optional custom function
  { key = "u", action = "edit" }, -- Bind 'u' to open (edit) the directory or file
}

-- Set up nvim-tree with custom key mappings
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  }
})

-- Set up keymap to find the file in nvim-tree
vim.keymap.set('n', '<c-n>', ':NvimTreeFindFile<CR>')

