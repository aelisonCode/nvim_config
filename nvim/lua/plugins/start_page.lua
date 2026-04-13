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
      math.randomseed(os.time())
      local current_quote = quotes[math.random(#quotes)]

      local cat_a = {
	      "\\   /\\",
	      ")  ( ')",
	      "( /  )",
	      "\\(__)|",
      }

      local cat_b = {
	      "/   /\\",
	      "(  ( ')",
	      ") /  )",
	      "\\(__)|",

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
      dashboard.section.header.val = get_header(cat_a)

      -- Cat Animation Loop
      local function animate_cat(state)
        dashboard.section.header.val = get_header(state and cat_a or cat_b)
        alpha.redraw()
        vim.defer_fn(function() animate_cat(not state) end, 700)
      end

      animate_cat(true)
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
        local new_quote = quotes[math.random(#quotes)]
        while new_quote == current_quote do
          new_quote = quotes[math.random(#quotes)]
        end

        local delay = 20

        -- Erase existing text
        for i = #current_quote, 0, -1 do
          vim.defer_fn(function()
            dashboard.section.footer.val = current_quote:sub(1, i)
            alpha.redraw()
          end, (#current_quote - i) * delay)
        end

        -- Type new text
        local start_typing_delay = #current_quote * delay + 500
        for i = 1, #new_quote do
          vim.defer_fn(function()
            dashboard.section.footer.val = new_quote:sub(1, i)
            alpha.redraw()
            if i == #new_quote then
              current_quote = new_quote
              -- WAIT 5 seconds and then run the animation again
              vim.defer_fn(animate_footer, 10000)
            end
          end, start_typing_delay + (i * delay))
        end
      end
	-- Starting animation after 10 seconds
    vim.defer_fn(animate_footer, 10000)
      alpha.setup(dashboard.opts)
    end,
  },
}
