require("config.lazy")
require("config.keymaps")

vim.opt.conceallevel = 2

vim.opt.list=true -- Show list chars
-- vim.opt.listchars:append("eol:") -- character to draw an end of line
vim.opt.listchars:append("trail:␣")  -- character to draw a trailing space
vim.opt.listchars:append("extends:❯")  -- character to draw when line is extended past the last column
vim.opt.listchars:append("precedes:❮")  -- character to draw when line is extended before the first column
