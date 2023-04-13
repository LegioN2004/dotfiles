-- return {
-- 		{
-- 				"nvim-lualine/lualine.nvim",
-- 				event = "VeryLazy",
-- --				opts = function()
-- --						return {
-- --								--[[add your custom lualine config here]]
-- --						}
-- --				end,
-- 		},
-- config = function()
-- local status, lualine = pcall(require, 'lualine')
-- if (not status) then return end

-- lualine.setup {
-- 	options = {
-- 		icons_enabled = true,
-- 		-- theme = 'solarized_dark',
-- 		theme = 'auto',
-- 		section_separators = { left = '', right = '' },
-- 		component_separators = { left = '', right = '' },
-- 		disabled_filetypes = {}
-- 	},
-- 	sections = {
-- 		lualine_a = { 'mode' },
-- 		lualine_b = { 'branch' },
-- 		lualine_c = { {
-- 			'lsp_progress',
-- 			'filename',
-- 			file_status = true, -- displays file status (readonly status, modified status)
-- 			path = 0   -- 0 = just filename, 1 = relative path, 2 = absolute path
-- 		} },
-- 		lualine_x = {
-- 			{
-- 				'diagnostics',
-- 				sources = { "nvim_diagnostic" },
-- 				symbols = {
-- 					error = ' ',
-- 					warn = ' ',
-- 					info = ' ',
-- 					hint = ' '
-- 				}
-- 			},
-- 			'encoding',
-- 			'tabnine',
-- 			'filetype'
-- 		},
-- 		lualine_y = { 'progress' },
-- 		lualine_z = { 'location' }
-- 	},
-- }

-- -- From github.com/Isrothy = I just made a lualine component which shows lsp diagnostic message on cursor line.

-- -- local utils = require("lualine.utils.utils")
-- -- local highlight = require("lualine.highlight")

-- -- local diagnostics_message = require("lualine.component"):extend()

-- -- diagnostics_message.default = {
-- -- 	colors = {
-- -- 		error = utils.extract_color_from_hllist(
-- -- 			{ "fg", "sp" },
-- -- 			{ "DiagnosticError", "LspDiagnosticsDefaultError", "DiffDelete" },
-- -- 			"#e32636"
-- -- 		),
-- -- 		warning = utils.extract_color_from_hllist(
-- -- 			{ "fg", "sp" },
-- -- 			{ "DiagnosticWarn", "LspDiagnosticsDefaultWarning", "DiffText" },
-- -- 			"#ffa500"
-- -- 		),
-- -- 		info = utils.extract_color_from_hllist(
-- -- 			{ "fg", "sp" },
-- -- 			{ "DiagnosticInfo", "LspDiagnosticsDefaultInformation", "DiffChange" },
-- -- 			"#ffffff"
-- -- 		),
-- -- 		hint = utils.extract_color_from_hllist(
-- -- 			{ "fg", "sp" },
-- -- 			{ "DiagnosticHint", "LspDiagnosticsDefaultHint", "DiffAdd" },
-- -- 			"#273faf"
-- -- 		),
-- -- 	},
-- -- }
-- -- function diagnostics_message:init(options)
-- -- 	diagnostics_message.super:init(options)
-- -- 	self.options.colors = vim.tbl_extend("force", diagnostics_message.default.colors, self.options.colors or {})
-- -- 	self.highlights = { error = "", warn = "", info = "", hint = "" }
-- -- 	self.highlights.error = highlight.create_component_highlight_group(
-- -- 		{ fg = self.options.colors.error },
-- -- 		"diagnostics_message_error",
-- -- 		self.options
-- -- 	)
-- -- 	self.highlights.warn = highlight.create_component_highlight_group(
-- -- 		{ fg = self.options.colors.warn },
-- -- 		"diagnostics_message_warn",
-- -- 		self.options
-- -- 	)
-- -- 	self.highlights.info = highlight.create_component_highlight_group(
-- -- 		{ fg = self.options.colors.info },
-- -- 		"diagnostics_message_info",
-- -- 		self.options
-- -- 	)
-- -- 	self.highlights.hint = highlight.create_component_highlight_group(
-- -- 		{ fg = self.options.colors.hint },
-- -- 		"diagnostics_message_hint",
-- -- 		self.options
-- -- 	)
-- -- end

-- -- function diagnostics_message:update_status(is_focused)
-- -- 	local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
-- -- 	local diagnostics = vim.diagnostic.get(0, { lnum = r - 1 })
-- -- 	if #diagnostics > 0 then
-- -- 		local diag = diagnostics[1]
-- -- 		for _, d in ipairs(diagnostics) do
-- -- 			if d.severity < diag.severity then
-- -- 				diagnostics = d
-- -- 			end
-- -- 		end
-- -- 		local icons = { " ", " ", " ", " " }
-- -- 		local hl = { self.highlights.error, self.highlights.warn, self.highlights.info, self.highlights.hint }
-- -- 		return highlight.component_format_highlight(hl[diag.severity]) .. icons[diag.severity] .. " " .. diag.message
-- -- 	else
-- -- 		return ""
-- -- 	end
-- -- end

-- -- require("lualine").setup({
-- -- 	sections = {
-- -- 		lualine_c = {
-- -- 			{
-- -- 				diagnostics_message,
-- -- 				colors = {
-- -- 					error = "#BF616A",
-- -- 					warn = "#EBCB8B",
-- -- 					info = "#A3BE8C",
-- -- 					hint = "#88C0D0",
-- -- 				},
-- -- 			},
-- -- 		},
-- -- 	},
-- -- })
-- end
-- }

return {
	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			local icons = require("lazyvim.config").icons

			local function fg(name)
				return function()
					---@type {foreground?:number}?
					local hl = vim.api.nvim_get_hl_by_name(name, true)
					return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
				end
			end

			return {
				options = {
					theme = "auto",
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "alpha" } },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{
							"diagnostics",
							symbols = {
								error = icons.diagnostics.Error,
								warn = icons.diagnostics.Warn,
								info = icons.diagnostics.Info,
								hint = icons.diagnostics.Hint,
							},
						},
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
				-- stylua: ignore
				{
				  function() return require("nvim-navic").get_location() end,
				  cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
				},
					},
					lualine_x = {
				-- stylua: ignore
				{
				  function() return require("noice").api.status.command.get() end,
				  cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
				  color = fg("Statement")
				},
				-- stylua: ignore
				{
				  function() return require("noice").api.status.mode.get() end,
				  cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
				  color = fg("Constant") ,
				},
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
							color = fg("Special"),
						},
						{
							"diff",
							symbols = {
								added = icons.git.added,
								modified = icons.git.modified,
								removed = icons.git.removed,
							},
						},
					},
					lualine_y = {
						{ "progress", separator = " ", padding = { left = 1, right = 0 } },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
				extensions = { "neo-tree", "lazy" },
			}
		end,
	},
}
