return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"zbirenbaum/copilot.lua",
	},
	opts = {
		opts = { log_level = "DEBUG" },

		display = {
			chat = {
				window = {
					layout = "float",
					relative = "editor",
					border = "rounded",

					width = math.floor(vim.o.columns * 0.25),
					height = math.floor(vim.o.lines * 0.80),

					row = 2,
					col = vim.o.columns,

					opts = {
						breakindent = true,
						linebreak = true,
						wrap = true,
					},
				},
			},
		},
	},

	keys = {
		{ "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle AI chat" },
	},

	-- Little spinner with text 'thinking' to know that the LLM is still thinking
	config = function(_, opts)
		require("codecompanion").setup(opts)

		local group = vim.api.nvim_create_augroup("CodeCompanionChatSpinner", { clear = true })
		local ns = vim.api.nvim_create_namespace("CodeCompanionChatSpinner")

		local spinner = { "⠋","⠙","⠹","⠸","⠼","⠴","⠦","⠧","⠇","⠏" }
		local idx = 1

		local state = {
			timer = nil,
			bufnr = nil,
			mark_id = nil,
			active = false,
			anchor_line = nil,
		}

		local function is_chat_buffer(bufnr)
			return bufnr
			and vim.api.nvim_buf_is_valid(bufnr)
			and vim.bo[bufnr].filetype == "codecompanion"
		end

		local function clear_spinner()
			state.active = false

			if state.timer then
				state.timer:stop()
				state.timer:close()
				state.timer = nil
			end

			if state.bufnr and vim.api.nvim_buf_is_valid(state.bufnr) then
				vim.api.nvim_buf_clear_namespace(state.bufnr, ns, 0, -1)
			end

			state.bufnr = nil
			state.mark_id = nil
			state.anchor_line = nil
		end

		local function render()
			if not state.active then
				return
			end
			if not is_chat_buffer(state.bufnr) then
				return clear_spinner()
			end

			local line_count = vim.api.nvim_buf_line_count(state.bufnr)
			local anchor = state.anchor_line or math.max(line_count - 1, 0)
			anchor = math.max(math.min(anchor, line_count - 1), 0)

			state.mark_id = vim.api.nvim_buf_set_extmark(state.bufnr, ns, anchor, 0, {
				id = state.mark_id,
				virt_lines = {
					{ { spinner[idx] .. " thinking…", "Comment" } },
				},
				virt_lines_above = false,
				hl_mode = "combine",
			})

			idx = (idx % #spinner) + 1
		end

		local function start_spinner_for(bufnr)
			if not is_chat_buffer(bufnr) then
				return
			end

			clear_spinner()
			state.active = true
			state.bufnr = bufnr
			idx = 1

			state.anchor_line = math.max(vim.api.nvim_buf_line_count(bufnr) - 1, 0)

			state.timer = vim.uv.new_timer()
			state.timer:start(0, 80, vim.schedule_wrap(render))
		end

		vim.api.nvim_create_autocmd("User", {
			group = group,
			pattern = "CodeCompanionRequestStarted",
			callback = function()
				start_spinner_for(vim.api.nvim_get_current_buf())
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			group = group,
			pattern = "CodeCompanionRequestFinished",
			callback = function()
				clear_spinner()
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			group = group,
			pattern = "CodeCompanionChatClosed",
			callback = function()
				clear_spinner()
			end,
		})
	end,
}
