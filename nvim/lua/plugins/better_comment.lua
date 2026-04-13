return {
	"numToStr/Comment.nvim",
	opts = {
		toggler = {
			line = "gcc",
		},
		opleader = {
			line = "gc",
			block = "gb",
		},
	},
	config = function(_, opts)
		opts.pre_hook = function(ctx)
			local ft = vim.bo.filetype

			local ft_map = {
				asm = "; %s",
				s = "; %s",
				make = "# %s",
				python = "# %s",
				cpp = "// %s",
				c = "// %s",
				javascript = "// %s",
				typescript = "// %s",
			}

			if ctx.cmotion == require("Comment.utils").cmotion.v or
				ctx.cmotion == require("Comment.utils").cmotion.V then
				if ft == "c" or ft == "cpp" then
					return "/* %s */"
				end
			end

			return ft_map[ft] or vim.bo.commentstring or "; %s"
		end

		require("Comment").setup(opts)
	end,
}
