return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
                ["markdown-toc"] = {
                    condition = function(_, ctx)
                        for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
                            if line:find("<!%-%- toc %-%->") then
                                return true
                            end
                        end
                    end,
                },
                ["markdownlint-cli2"] = {
                    condition = function(_, ctx)
                        local diag = vim.tbl_filter(function(d)
                            return d.source == "markdownlint"
                        end, vim.diagnostic.get(ctx.buf))
                        return #diag > 0
                    end,
                },
			},
			-- Prefer Biome if available, otherwise fall back to Prettier for JS/TS/HTML/CSS
			formatters_by_ft = (function()
				-- Prefer project-local biome (node_modules/.bin) first, then global biome binary
				local function project_has_executable(name)
					local cwd = vim.fn.getcwd()
					local candidate = cwd .. "/node_modules/.bin/" .. name
					if vim.fn.filereadable(candidate) == 1 then
						return true
					end
					return vim.fn.executable(name) == 1
				end
				local has_biome = project_has_executable("biome") or project_has_executable("biome-check") or project_has_executable("biomejs")
				if has_biome then
					return {
						javascript = { "biome-check" },
						typescript = { "biome-check" },
						javascriptreact = { "biome-check" },
						typescriptreact = { "biome-check" },
						css = { "biome-check" },
						html = { "biome-check" },
						svelte = { "prettier" },
						json = { "prettier" },
						yaml = { "prettier" },
						graphql = { "prettier" },
						liquid = { "prettier" },
						lua = { "stylua" },
						markdown = { "prettier", "markdown-toc" },
					}
				else
					return {
						javascript = { "prettier" },
						typescript = { "prettier" },
						javascriptreact = { "prettier" },
						typescriptreact = { "prettier" },
						css = { "prettier" },
						html = { "prettier" },
						svelte = { "prettier" },
						json = { "prettier" },
						yaml = { "prettier" },
						graphql = { "prettier" },
						liquid = { "prettier" },
						lua = { "stylua" },
						markdown = { "prettier", "markdown-toc" },
					}
				end
				end)(),

				-- format_on_save = {
				-- 	lsp_fallback = true,
				-- 	async = false,
				-- 	timeout_ms = 1000,
				-- },

			})

		-- Configure individual formatters
		conform.formatters.prettier = {
			args = {
				"--stdin-filepath",
				"$FILENAME",
				"--tab-width",
				"4",
				"--use-tabs",
				"false",
			},
		}
		conform.formatters.shfmt = {
			prepend_args = { "-i", "4" },
		}

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format whole file or range (in visual mode) with" })

		-- Format on save: run conform.format synchronously before saving.
		-- Protected with pcall to avoid errors when formatters are missing.
		local fmt_group = vim.api.nvim_create_augroup("ConformFormatOnSave", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = fmt_group,
			pattern = "*",
			callback = function()
				local ok, err = pcall(function()
					conform.format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
				end)
				if not ok then
					vim.notify("Format on save failed: " .. tostring(err), vim.log.levels.WARN)
				end
			end,
		})
	end,
}
