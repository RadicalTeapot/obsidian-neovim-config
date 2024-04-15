---@type string|integer
local current_color_column = 0
return {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
    lazy = true,
    event = "VeryLazy",
    keys = { { "<Leader>zm", "<cmd>ZenMode<cr>", desc = "[Z]en [m]ode" } },
    opts = { window = { width = 120 },
    on_open = function()
      current_color_column = vim.wo.colorcolumn
      -- Disable color column when zen mode is open
      vim.wo.colorcolumn = 0
    end,
    on_close = function()
        -- Restore color column
        vim.wo.colorcolumn = current_color_column
    end
  },
}
