return {
    "neovim/nvim-lspconfig",
    -- Base LSP manager
    {
	"williamboman/mason.nvim",
	opts = {},
    },
    -- Convenience plugin to handle installing DAPs, linters and formatters
    {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "williamboman/mason.nvim", },
	opts = {
	    ensure_installed = {
		'markdownlint',
		'prettier'
	    },
	},
    },
    -- LSPs manager and configuration
    {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig", },
	opts={
	    ensure_installed = { "marksman" }
	},
    },
    -- Linter
    {
	"mfussenegger/nvim-lint",
	dependencies = { "williamboman/mason-lspconfig.nvim", },
	event = { "BufWinEnter", "BufReadPre" },
	keys = {
	    { "<Leader>lb", function() require('lint').try_lint() end, desc = "[L]int [b]uffer" },
	},
	config = function()
	    local lint = require('lint')
	    lint.linters_by_ft = { markdown = { "markdownlint" } }
	    lint.linters.markdownlint.args = {
		'--disable', 
		-- Add rules here
		'MD041', -- should start with top level header
		'MD013', -- line too long
		'--' -- Required
	    }
	    -- Hide virtual text for makdownlint for all but errors
	    local markdownlint_namespace = lint.get_namespace('markdownlint') 
	    vim.diagnostic.config({ virtual_text = { severity = vim.diagnostic.severity.ERROR } }, markdownlint_namespace)
	end
    },
    -- Formatter
    {
	'stevearc/conform.nvim',
	keys = {
	    { "<Leader>fb", function() require("conform").format({lsp_fallback = true}) end, {"n", "v"}, desc = "[F]ormat [b]uffer" },
	},
	opts = {
	    formatters_by_ft = { markdown = { "prettier" } },
	},
    }
}
