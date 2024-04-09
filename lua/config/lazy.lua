-- Install lazy.nvim in config data folder
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

-- Prepend lazy.nvim to path
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load lazy.nvim
require("lazy").setup({
    spec = {
        { import = "lsp" },
        { import = "plugins" },
    },
    defaults = { lazy = true, version = false },
    colorscheme = { "catppuccin", "habamax" },
    checker = { enabled = true, notify = false },
})
vim.cmd("colorscheme catppuccin")
