return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		local logo = [[
                              mili's                               
                                                                    Z
       ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗       Z   
       ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║    z   
       ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  z
       ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
       ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
       ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]]

		dashboard.section.buttons.val = {
			dashboard.button("f", " ❯ Find file", ":Telescope find_files <CR>"),
			dashboard.button("n", " ❯ New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("p", " ❯ Find project", ":Telescope projects <CR>"),
			dashboard.button("r", " ❯ Recently used files", ":Telescope oldfiles <CR>"),
			dashboard.button("t", " ❯ Find text", ":Telescope live_grep <CR>"),
			dashboard.button("c", " ❯ Configuration", ":e ~/.config/nvim/init.lua <CR>"),
			dashboard.button("q", " ❯ Quit Neovim", ":qa<CR>"),
		}

		local fortune = require("alpha.fortune")
		dashboard.section.footer.val = fortune()

		-- alpha.setup(dashboard.opts)
		-- dashboard.opts.opts.noautocmd = true
		-- vim.cmd([[autocmd User FileType alpha nofoldenable setlocal AlphaReady echo 'ready']])

		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.section.footer.opts.hl = "AlphaFooter"
		dashboard.opts.layout[1].val = 8
		return dashboard
	end,
	config = function(_, dashboard)
		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		require("alpha").setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			pattern = "neovim Started",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
