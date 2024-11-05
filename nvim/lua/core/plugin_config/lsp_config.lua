require("mason-lspconfig").setup({
	-- ensure_installed = { "lua_ls", "solargraph", "ts_ls", "pyright", "clangd", "jdtls" },
	ensure_installed = { "lua_ls", "solargraph", "ts_ls", "pyright", "clangd" },
})

require("mason-tool-installer").setup({

	ensure_installed = {
		"black",
		"debugpy",
		"flake8",
		"isort",
		"mypy",
		"pylint",
		"ruff",

		"clangd",
		"clang-format",
		-- "clang-tidy",
	},
})

local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities =
	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

local cmp = require("cmp")
-- `/` cmdline setup.
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{
			name = "cmdline",
			option = {
				ignore_cmds = { "Man", "!" },
			},
		},
	}),
})

lspconfig.bashls.setup({
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "bash" },
	root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
	settings = {
		bash = {
			useLinting = true,
		},
	},
})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

lspconfig.pyright.setup({

	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic", -- Can be "off", "basic", or "strict"
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
})

lspconfig.clangd.setup({
	cmd = {
		-- clangd command with additional options
		"clangd",
		"--background-index", -- Enable background indexing
		"--clang-tidy", -- Enable clang-tidy diagnostics
		"--completion-style=bundled", -- Style for autocompletion
		"--cross-file-rename", -- Support for renaming symbols across files
		"--header-insertion=iwyu", -- Include "what you use" insertion
	},
	capabilities = lsp_defaults.capabilities, -- Auto-completion capabilities
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
	settings = {
		clangd = {
			fallbackFlags = { "-std=c++17" }, -- Adjust this if using a different C++ standard
		},
	},
})

-- lspconfig.jdtls.setup({
-- 	cmd = { "jdtls" },
-- 	root_dir = lspconfig.util.root_pattern(".git", "pom.xml", "build.gradle", ".classpath"),
-- 	settings = {
-- 		java = {
-- 			configuration = {
-- 				runtimes = {
-- 					{ name = "JavaSE-23", path = "/usr/lib/jvm/java-23-openjdk" },
-- 					{ name = "JavaSE-24", path = "/usr/lib/jvm/liberica-nik-24-full" },
-- 				},
-- 			},
-- 		},
-- 	},
-- 	capabilities = lsp_defaults.capabilities,
-- })

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "$", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>Br", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

require("lspconfig").solargraph.setup({})
require("lspconfig").ts_ls.setup({})
require("lspconfig").gopls.setup({})
require("lspconfig").tailwindcss.setup({})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<space>H", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<space>la", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>lr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>ll", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

-- Hyprlang LSP
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.hl", "hypr*.conf" },
	callback = function(event)
		print(string.format("starting hyprls for %s", vim.inspect(event)))
		vim.lsp.start({
			name = "hyprlang",
			cmd = { "hyprls" },
			root_dir = vim.fn.getcwd(),
		})
	end,
})
