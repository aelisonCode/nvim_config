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
				"There is no better place than 127.0.0.1"
			}
			local function padding(n)
				return { type = "padding", val = n }
			end
			dashboard.config.layout = {
				padding(10),      -- TOP PADDING (Moves everything down)
				dashboard.section.header,
				padding(4),      -- MIDDLE PADDING (Space between Header and Buttons)
				dashboard.section.buttons,
				padding(4),      -- BOTTOM PADDING (Space between Buttons and Footer)
				dashboard.section.footer,
			}
			local quote_index = 1
			local current_quote = quotes[quote_index]

			local current_frame = 1
			local cat_frames = {
				{
					"\\   /\\",
					")  ( ')",
					"( /  )",
					"\\(__)|",
				},
				{
					"/   /\\",
					"(  ( ')",
					") /  )",
					"\\(__)|",

				}

			}

			local main_header = {
				" █████╗ ███████╗██╗     ██╗███████╗ ██████╗ ███╗   ██╗",
				"██╔══██╗██╔════╝██║     ██║██╔════╝██╔═══██╗████╗  ██║",
				"███████║█████╗  ██║     ██║███████╗██║   ██║██╔██╗ ██║",
				"██╔══██║██╔══╝  ██║     ██║╚════██║██║   ██║██║╚██╗██║",
				"██║  ██║███████╗███████╗██║███████║╚██████╔╝██║ ╚████║",
				"╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝",
				"            ██████╗ ██████╗ ██████╗ ███████╗          ",
				"           ██╔════╝██╔═══██╗██╔══██╗██╔════╝          ",
				"           ██║     ██║   ██║██║  ██║█████╗            ",
				"           ██║     ██║   ██║██║  ██║██╔══╝            ",
				"           ╚██████╗╚██████╔╝██████╔╝███████╗          ",
				"            ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝          ",
			}

			local function get_header(cat_frame)
				local combined = {}
				local cat_start_line = 9

				for i, header_line in ipairs(main_header) do
					if i >= cat_start_line and i < cat_start_line + #cat_frame then
						local cat_line = cat_frame[i - cat_start_line + 1]
						table.insert(combined, header_line .. " " .. cat_line)
					else
						table.insert(combined, header_line)
					end
				end
				return combined
			end

			-- Initial Draw
			dashboard.section.header.val = get_header(cat_frames[1])

			local function animate_cat()
				if vim.bo.filetype ~= "alpha" then return end
				local frame = cat_frames[current_frame]

				dashboard.section.header.val = get_header(frame)
				alpha.redraw()

				current_frame = (current_frame % #cat_frames) + 1

				vim.defer_fn(animate_cat, 700)
			end

			animate_cat()
			-- Set the Menu buttons
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
			-- Starting animation after 10 seconds
			vim.defer_fn(function()
				animate_cat()
			end, 100)
			vim.defer_fn(animate_footer, 10000)
		end,
	},
}
