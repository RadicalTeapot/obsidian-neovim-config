return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
	-- Add markdown support
	ensure_installed = { "markdown", "markdown_inline" },
	-- Disable auto-install (add required packages above and run :TSUpdate instead)
	auto_install = false,
	highlight = {
	    enabled = true,
	    -- uses :h syntax if true, disabled due to potential slowdown
	    additional_vim_regex_highlighting = false
	},
    }
}
