require("config.icons")
return {
		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{
				"L3MON4D3/LuaSnip",
				dependencies = {"rafamadriz/friendly-snippets", 'saadparwaiz1/cmp_luasnip'}, -- Set of preconfigured snippets for different languages.
				config = function()
						local luasnip = require("luasnip")

						-- forget the current snippet when leaving the insert mode. ref: https://github.com/L3MON4D3/LuaSnip/issues/656#issuecomment-1313310146
						local unlinkgrp = vim.api.nvim_create_augroup(
								'UnlinkSnippetOnModeChange',
								{ clear = true }
						)

						vim.api.nvim_create_autocmd('ModeChanged', {
								group = unlinkgrp,
								pattern = { 's:n', 'i:*' },
								desc = 'Forget the current snippet when leaving the insert mode',
								callback = function(evt)
										if luasnip.session
												and luasnip.session.current_nodes[evt.buf]
												and not luasnip.session.jump_active
										then
												luasnip.unlink_current()
										end
								end,
						})

						-- luasnip.filetype_extend("typescriptreact", { "html", "typescript" })
						-- luasnip.filetype_extend("javascriptreact", { "html", "javascript" })

						require("luasnip.loaders.from_vscode").lazy_load()
						luasnip.config.set_config({
								region_check_events = 'CursorMoved'
						})
				end
		},

		-- vscode-like pictograms
		{
				"onsails/lspkind-nvim",
				config = function()
						require("lspkind").init({
								symbol_map = {
										Text = '',
										Method = '',
										Function = '',
										Constructor = '',
										Field = '',
										Variable = '',
										Class = '',
										Interface = '',
										Module = '',
										Property = '',
										Unit = '',
										Value = '',
										Enum = '',
										Keyword = '',
										Snippet = '',
										Color = '',
										File = '',
										Reference = '',
										Folder = '',
										EnumMember = '',
										Constant = '',
										Struct = '',
										Event = '',
										Operator = '',
										TypeParameter = '',
								}
						})
				end
		},

		config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		vim.opt.completeopt = "menu,menuone,noselect"
		vim.opt.pumheight = 10 -- Maximum number of items to show in the popup menu

		local formatForTailwindCSS = function(entry, vim_item)
				if vim_item.kind == 'Color' and entry.completion_item.documentation then
						local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
						if r then
								local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
								local group = 'Tw_' .. color
								if vim.fn.hlID(group) < 1 then
										vim.api.nvim_set_hl(0, group, { fg = '#' .. color })
								end
								vim_item.kind = "●" -- or "■" or anything
								vim_item.kind_hl_group = group
								return vim_item
						end
				end
				-- vim_item.kind = icons[vim_item.kind] and (icons[vim_item.kind] .. vim_item.kind) or vim_item.kind
				-- or just show the icon
				vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
				return vim_item
		end

		cmp.setup({
				snippet = {
						expand = function(args)
								luasnip.lsp_expand(args.body)
						end
				},

				--   פּ ﯟ   some other good icons
				-- local kind_icons = {
				--     Text = "",
				--     Method = "m",
				--     Function = "",
				--     Constructor = "",
				--     Field = "",
				--     Variable = "",
				--     Class = "",
				--     Interface = "",
				--     Module = "",
				--     Property = "",
				--     Unit = "",
				--     Value = "",
				--     Enum = "",
				--     Keyword = "",
				--     Snippet = "",
				--     Color = "",
				--     File = "",
				--     Reference = "",
				--     Folder = "",
				--     EnumMember = "",
				--     Constant = "",
				--     Struct = "",
				--     Event = "",
				--     Operator = "",
				--     TypeParameter = "",
				-- }
				-- find more here: https://www.nerdfonts.com/cheat-sheet

				cmp.setup ({
						snippet = {
								expand = function(args)
										luasnip.lsp_expand(args.body) -- For `luasnip` users.
								end,
						},
						mapping = cmp.mapping.preset.insert({ 
								["<C-p>"] = cmp.mapping.select_prev_item(),
								["<C-n>"] = cmp.mapping.select_next_item(),
								["<C-d>"] = cmp.mapping.scroll_docs(-4),
								["<C-u>"] = cmp.mapping.scroll_docs(4),
								["<C-Space>"] = cmp.mapping.complete(),
								["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
								["<C-e>"] = cmp.mapping.abort(),
								-- Accept currently selected item. If none selected, `select` first item.
								-- Set `select` to `false` to only confirm explicitly selected items.
								["<CR>"] = cmp.mapping.confirm { select = true },
								["<Tab>"] = cmp.mapping(function(fallback)
										if cmp.visible() then
												cmp.select_next_item()
										elseif luasnip.expandable() then
												luasnip.expand()
										elseif luasnip.expand_or_jumpable() then
												luasnip.expand_or_jump()
										elseif check_backspace() then
												fallback()
										else
												fallback()
										end
								end, {
												"i",
												"s",
										}),
								["<S-Tab>"] = cmp.mapping(function(fallback)
										if cmp.visible() then
												cmp.select_prev_item()
										elseif luasnip.jumpable(-1) then
												luasnip.jump(-1)
										else
												fallback()
										end
								end, {
												"i",
												"s",
										}),
						}),
						formatting = {
								fields = { "kind", "abbr", "menu" },
format = function(entry, vim_item)
										-- Kind icons
										vim_item.kind = string.format("%s", icons.kind[vim_item.kind])
										-- vim_item.kind = string.format("%s", lspkind.symbolic[vim_item.kind]) -- use this if the above doesn't work
										-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
										vim_item.menu = ({
												nvim_lsp = "[LSP]",
												luasnip = "[Snippet]",
												buffer = "[Buffer]",
												path = "[Path]",
										})[entry.source.name]
										return vim_item
								end,
						},
						sources = cmp.config.sources({
								{ name = "nvim_lsp" },
								{ name = "luasnip" },
{ name = "path" },
{ name = 'buffer', keyword_length = 5 }, -- show buffer's completion only if type more then keyword_length
}),
confirm_opts = {
								behavior = cmp.ConfirmBehavior.Replace,
								select = false,
						},
						window = {
								completion = cmp.config.window.bordered({
										col_offset = -3, -- align the abbr and word on cursor (due to fields order below)
										side_padding = 0,
								}),
								documentation = {
										cmp.config.window.bordered({ "╭", "─", "╮", "│", "╯", "─", "╰", "│" }),
										-- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
								},
						},
						experimental = {
								ghost_text = false,
								native_menu = false,
						},
				}),

				cmp.setup.cmdline(":", {
						completion = {
								autocomplete = false
						},
						mapping = cmp.mapping.preset.cmdline({
								['<C-p>'] = cmp.mapping({
										c = function(fallback)
												if cmp.visible() then
return cmp.select_prev_item()
end
fallback()
end,
}),
['<C-n>'] = cmp.mapping({
										c = function(fallback)
												if cmp.visible() then
														return cmp.select_next_item()
end
												fallback()
										end,
								}),
								['<Tab>'] = cmp.mapping({
										c = function()
												if cmp.visible() then
														return cmp.select_next_item()
												else
														cmp.complete()
														cmp.select_next_item()
														return
												end
										end
								}),
								['<S-Tab>'] = cmp.mapping({
										c = function()
												if cmp.visible() then
														return cmp.select_prev_item()
												else
														cmp.complete()
														cmp.select_next_item()
														return
												end
										end
}),
}),
						sources = {
								{ name = "path" },
								{ name = "cmdline",
										option = {
												ignore_cmds = { "Man", "!" }
										}
								},
						},
						formatting = {
								fields = { "abbr", "kind" },
								format = lspkind.cmp_format({
										mode = 'symbol_text', -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
										before = function(_, vim_item)
												if vim_item.kind == "Variable" then
														vim_item.kind = ""
														return vim_item
												end
												-- just show the icon
												vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
												return vim_item
end
								}),
},
}),
		end
		}),
}
