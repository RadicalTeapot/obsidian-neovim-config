return {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths in commands
    'hrsh7th/cmp-nvim-lsp', -- source file for LSP
    { 
	"L3MON4D3/LuaSnip", -- snippet engine
	dependencies = { "rafamadriz/friendly-snippets", },
	config = function()
	    -- Required by friendly snippets
	    require("luasnip.loaders.from_vscode").lazy_load()
	end
    },
    "saadparwaiz1/cmp_luasnip", -- for lua autocompletion
    "rafamadriz/friendly-snippets", -- useful snippet library
    {
	"hrsh7th/nvim-cmp",
	dependencies = {
	    "hrsh7th/cmp-buffer",
	    "hrsh7th/cmp-path",
	    'hrsh7th/cmp-nvim-lsp',
	    "L3MON4D3/LuaSnip",
	    "saadparwaiz1/cmp_luasnip",
	    "rafamadriz/friendly-snippets",
	},
	config = function()
	    local cmp = require('cmp')
	    local luasnip = require('luasnip')
	    cmp.setup({
		-- Set menu behavior
		completion = { completeopt = "menu,menuone,preview,noselect" }, -- see :h 'completeopt'
		-- Set snippet engine
		snippet = { 
		    expand = function(args)
			luasnip.lsp_expand(args.body) -- configure to work with luasnip
		    end
		},
		-- Set mapping in menu
		mapping = cmp.mapping.preset.insert({
		    ["<C-n>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		    ["<C-p>"] = cmp.mapping.select_next_item(), -- next suggestion
		    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
		    ["<C-d>"] = cmp.mapping.scroll_docs(4),
		    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		    ["<esc>"] = cmp.mapping.abort(), -- close completion window
		    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Insert selected one, set to false to only insert specifically picked one
		}),
		-- Set autocompletion sources
		sources = cmp.config.sources({
		    { name = "nvim_lsp" },
		    { name = "luasnip" }, -- snippets
		    { name = "buffer" }, -- text within current buffer
		    { name = "path" }, -- file system paths
		}),
	    })
	end
    }
}
