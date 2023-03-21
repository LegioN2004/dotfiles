require('neorg').setup {
	-- tag = "*",
	ft = "norg",
	after = "nvim-treesitter", -- You may want to specify Telescope here as well
	config = function()
		load = {
			["core.defaults"] = {}, -- Loads default behaviour
			["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
			["core.norg.dirman"] = { -- Manages Neorg workspaces
				config = {
					workspaces = {
						notes = "~/Documents/notes",
						org = "~/ghq/github.com/LegioN2004/programs/org-docs",
						norg = "~/ghq/github.com/LegioN2004/programs/norg-docs",
					},
				},
			},
		}
	end
}
