return {
    "stevearc/oil.nvim",
    lazy = true,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = true,
    keys = {
        { "<leader>o", "<cmd>Oil<cr>", desc = "[O]il" },
    },
}
