-- Configure LSPs here
local lspconfig = require('lspconfig')
lspconfig.marksman.setup {}

-- Lint on buffer enter, save and leaving insert mode
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup('UserLintConfig', {clear=true}),
    callback = function() require('lint').try_lint() end,
})

-- TODO configure keys below
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
	-- Enable completion triggered by <c-x><c-o>
	vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

	-- Buffer local mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local opts = { buffer = ev.buf }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
	vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set('n', '<Leader>wl', function()
	    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
	vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
	vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    end,
})
