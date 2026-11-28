return {
	"Pocco81/auto-save.nvim",
	config = function()
		require("auto-save").setup({
			condition = function(buf)
				local fn = vim.fn
				local utils = require("auto-save.utils.data")

				if
					fn.getbufvar(buf, "&modifiable") == 1
					and fn.getbufvar(buf, "&buftype") == ""
					and utils.not_in(fn.getbufvar(buf, "&filetype"), { "harpoon", "oil" })
				then
					return true
				end
				return false
			end,
		})
	end,
}
