local vaultPath = vim.fn.expand("$data/Obsidian vaults/Personal vault")

return {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown", -- use filtype for now
    -- event = {
    --     "BufReadPre "..vaultPath,
    --     "BufNewFile "..vaultPath,
    -- },
    dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-lua/plenary.nvim",
    },
    opts = {
	workspaces = { { name = "vault", path = vaultPath }, {name = "test", path = [[C:\tmp\Personal vault]] } },
	daily_notes = {
	    folder = "Periodic notes/daily",
	    date_format = "%Y-%m-%d",
	    -- TODO Add template
	},
	-- Use nvim_cmp after 2 chars have been entered for autocompletion
	completion = { nvim_cmp = true, min_chars = 2 },
	-- TODO Override mappings
    }
}

