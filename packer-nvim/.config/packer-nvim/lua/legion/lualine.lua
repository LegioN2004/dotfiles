local status, lualine = pcall(require, 'lualine')
if (not status) then return end

lualine.setup {
		options = {
				icons_enabled = true,
				-- theme = 'solarized_dark',
				theme = 'auto',
				section_separators = { left = '', right = '' },
				component_separators = { left = '', right = '' },
				disabled_filetypes = {
						"dashboard",
						"alpha",
						"lspinfo",
						"mason",
						"startuptime",
						"checkhealth",
						"help",
						"toggleterm",
						"lazy",
						"packer",
						"NvimTree",
						"lspsagaoutline",
				},

		},
		sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch' },
				lualine_c = { {
						'lsp_progress',
						'filename',
						file_status = true, -- displays file status (readonly status, modified status)
						path = 0   -- 0 = just filename, 1 = relative path, 2 = absolute path
				} },
				lualine_x = {
						{
								'diagnostics',
								sources = { "nvim_diagnostic" },
								symbols = {
										error = ' ',
										warn = ' ',
										info = ' ',
										hint = ' '
								}
						},
						'encoding',
						'tabnine',
						'filetype'
				},
				lualine_y = { 'progress' },
				lualine_z = { 'location' }
		},
}
