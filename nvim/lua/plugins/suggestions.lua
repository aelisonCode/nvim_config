return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()
        cmp.setup({
		snippet = {
		  expand = function(args)
		    luasnip.lsp_expand(args.body)
		  end,
        },
	performance = {
	  max_view_entries = 10,
	},
	window = {
		completion = cmp.config.window.bordered({
		  border = "rounded",
		  winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
		}),
		documentation = cmp.config.window.bordered({
		  border = "rounded",
		  winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
		}),
	},
	preselect = cmp.PreselectMode.None,
	completion = {
	completeopt = 'menu,menuone,noinsert,noselect',
	},
        mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({
		select = false,
		}),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() and cmp.get_selected_entry() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() and cmp.get_selected_entry() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
        }),
      })
    end,
  },
}
