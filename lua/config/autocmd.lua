vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("UserMarkdownAutoCmds", { clear = true }),
    pattern = "markdown",
    callback = function()
        vim.opt.wrap = true
        vim.opt.linebreak = true
        vim.opt.breakindent = true
        vim.opt.colorcolumn = "120"
    end,
})
