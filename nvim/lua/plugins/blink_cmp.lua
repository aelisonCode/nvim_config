return {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },

	version = '1.*',
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = 'none',

			['<Up>'] = { 'select_prev', 'fallback' },
			['<Down>'] = { 'select_next', 'fallback' },

			-- Accept only if an item is explicitly selected
			['<CR>'] = { 'accept', 'fallback' },

			-- Tab for snippet jumping
			['<Tab>'] = { 'snippet_forward', 'fallback' },
			['<S-Tab>'] = { 'snippet_backward', 'fallback' },

			-- Standard controls
			['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
		},

		appearance = {
			nerd_font_variant = 'mono'
		},

		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = false
				}
			},
			menu = {
				border = "rounded",
				winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
			},
			documentation = {
				auto_show = true,
				window = {
					border = "rounded",
					winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
				},
			}
		},
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},

		fuzzy = {
			implementation = "prefer_rust_with_warning"
		}
	},
	opts_extend = { "sources.default" }
}
