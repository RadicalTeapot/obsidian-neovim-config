return {
  "folke/zen-mode.nvim",
  dependencies = { "folke/twilight.nvim" },
  lazy = true,
  event = "VeryLazy",
  keys = { { "<Leader>zm", "<cmd>ZenMode<cr>", desc = "[Z]en [m]ode" } },
  opts = { window = { width = 120 } },
}
