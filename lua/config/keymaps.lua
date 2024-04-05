local keymap = vim.keymap

keymap.set("n", "<Leader><S-l>", "<cmd>Lazy<cr>", { desc = "Open [L]azy" })

vim.keymap.set("n", "<Leader>do", function() vim.diagnostic.open_float() end, { desc = "[D]iagnostics [o]pen float" })
vim.keymap.set("n", "<Leader>dn", function() vim.diagnostic.goto_next() end, { desc = "[D]iagnostics go to [n]ext" })
vim.keymap.set("n", "<Leader>dp", function() vim.diagnostic.goto_prev() end, { desc = "[D]iagnostics go to [p]evious" })
