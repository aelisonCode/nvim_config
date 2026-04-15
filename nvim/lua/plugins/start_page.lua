return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			local quotes = {
				"Hello there ! Want a cacahuete ?",
				"My name is huete.. cacahuete",
				"Nothing to say, start doing what you have to do",
				"May the source be with you",
				"Assembly better than all",
				"0001 + 0001 = 0010, change my mind",
				"There is no better place than 127.0.0.1",
			}

			local function padding(n)
				return { type = "padding", val = n }
			end

			dashboard.config.layout = {
				padding(15),
				dashboard.section.header,
				padding(4),
				dashboard.section.buttons,
				padding(4),
				dashboard.section.footer,
			}

			local current_frame = 1
			local frames = {
				{
					" /\\_/\\ ",
					"( o.o )",
					" > ^ < ",
				},
				{
					" /\\_/\\ ",
					"( o.< )",
					" > ^ < ",
				},
				{
					" /\\_/\\ ",
					"( o.o )",
					" > ^ < ",
				},

				{
					" /\\_/\\ ",
					"( -.- )",
					" > ^ < ",
				},

			}

			dashboard.section.header.val = frames[current_frame]

			local function animate_header()
				if vim.bo[0].filetype ~= "alpha" then
					vim.defer_fn(animate_header, 50)
					return
				end

				current_frame = (current_frame % #frames) + 1
				dashboard.section.header.val = frames[current_frame]
				alpha.redraw()

				vim.defer_fn(animate_header, 700)
			end

			dashboard.section.buttons.val = {
				dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
				dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
				dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
				dashboard.button("s", "  Settings", ":e $MYVIMRC <CR>"),
				dashboard.button("p", "󰏖  Plugins", ":cd ~/.config/nvim/lua/plugins | e .<CR>"),
				dashboard.button("c", "  Configs", ":cd ~/.config/nvim/lua/configs | e .<CR>"),
				dashboard.button("q", "󰅙  Quit", ":qa<CR>"),
			}

			local quote_index = 1
			local current_quote = quotes[quote_index]
			dashboard.section.footer.val = current_quote

			local function animate_footer()
				if vim.bo.filetype ~= "alpha" then return end

				quote_index = (quote_index % #quotes) + 1
				local new_quote = quotes[quote_index]

				local delay = 20

				for i = #current_quote, 0, -1 do
					vim.defer_fn(function()
						if vim.bo.filetype == "alpha" then
							dashboard.section.footer.val = current_quote:sub(1, i)
							alpha.redraw()
						end
					end, (#current_quote - i) * delay)
				end

				local start_typing_delay = #current_quote * delay + 500
				for i = 1, #new_quote do
					vim.defer_fn(function()
						if vim.bo.filetype == "alpha" then
							dashboard.section.footer.val = new_quote:sub(1, i)
							alpha.redraw()
							if i == #new_quote then
								current_quote = new_quote
								vim.defer_fn(animate_footer, 10000)
							end
						end
					end, start_typing_delay + (i * delay))
				end
			end

			alpha.setup(dashboard.opts)

			-- Start animations (schedule header so alpha buffer is active)
			vim.schedule(function()
				animate_header()
			end)

			vim.defer_fn(animate_footer, 10000)
		end,
	},
}
