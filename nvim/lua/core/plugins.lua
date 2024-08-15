require("lazy").setup({
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	"tpope/vim-commentary",
	"mattn/emmet-vim",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"ellisonleao/gruvbox.nvim",
	"dracula/vim",
	"nvim-lualine/lualine.nvim",
	"nvim-treesitter/nvim-treesitter",
	"vim-test/vim-test",
	"lewis6991/gitsigns.nvim",
	"preservim/vimux",
	{ 'alexghergh/nvim-tmux-navigation', config = function()

		nvim_tmux_nav = require('nvim-tmux-navigation')

		nvim_tmux_nav.setup {
			disable_when_zoomed = true -- defaults to false
		}


		--    vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
		--    vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
		--    vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
		--    vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
		--    vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
		--    vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)



		--	vim.keymap.set('', "<C-s>j", nvim_tmux_nav.NvimTmuxNavigateLeft)
		--	vim.keymap.set('', "<C-s>k", nvim_tmux_nav.NvimTmuxNavigateDown)
		--	vim.keymap.set('', "<C-s>i", nvim_tmux_nav.NvimTmuxNavigateUp)
		--	vim.keymap.set('', "<C-s>l", nvim_tmux_nav.NvimTmuxNavigateRight)
		--	vim.keymap.set('', "<C-s>,", nvim_tmux_nav.NvimTmuxNavigateLastActive)
		--	vim.keymap.set('', "<C-s>Space", nvim_tmux_nav.NvimTmuxNavigateNext)
	end
	},
	{'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = '^1.0.0', -- optional: only update when a new 1.x version is released
	},
	"folke/which-key.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	"stevearc/oil.nvim",
	"norcalli/nvim-colorizer.lua",
	"sindrets/diffview.nvim",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	-- completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	"github/copilot.vim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	{
		"vinnymeller/swagger-preview.nvim",
		run = "npm install -g swagger-ui-watcher",
	},
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
	},
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim"}
	},
})

-- Attaches to every FileType mode
require 'colorizer'.setup()

-- Attach to certain Filetypes, add special configuration for `html`
-- Use `background` for everything else.
require 'colorizer'.setup {
  'css';
  'javascript';
  html = {
    mode = 'foreground';
  }
}

-- Use the `default_options` as the second parameter, which uses
-- `foreground` for every mode. This is the inverse of the previous
-- setup configuration.
require 'colorizer'.setup({
  'css';
  'javascript';
  html = { mode = 'background' };
}, { mode = 'foreground' })

-- Use the `default_options` as the second parameter, which uses
-- `foreground` for every mode. This is the inverse of the previous
-- setup configuration.
require 'colorizer'.setup {
  '*'; -- Highlight all files, but customize some others.
  css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
  html = { names = false; } -- Disable parsing "names" like Blue or Gray
}

-- Exclude some filetypes from highlighting by using `!`
require 'colorizer'.setup {
  '*'; -- Highlight all files, but customize some others.
  '!vim'; -- Exclude vim from highlighting.
  -- Exclusion Only makes sense if '*' is specified!
}
