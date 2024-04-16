local ns = vim.api.nvim_create_namespace("markdown")
vim.api.nvim_set_hl(ns, "ColorColumn", { link = "TabLine" })
vim.api.nvim_win_set_hl_ns(0, ns)

vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.breakindent = true
vim.bo.textwidth = 120
vim.bo.shiftwidth = 2
