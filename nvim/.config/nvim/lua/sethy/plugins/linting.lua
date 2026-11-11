return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		local eslint = lint.linters.eslint_d

		local function has_executable(name)
			local cwd = vim.fn.getcwd()
			local local_binary = cwd .. "/node_modules/.bin/" .. name
			if vim.fn.filereadable(local_binary) == 1 then
				return true
			end
			return vim.fn.executable(name) == 1
		end

		local function get_js_linters()
			if has_executable("biome") or has_executable("biomejs") or has_executable("biome-check") then
				return { "biomejs" }
			elseif has_executable("eslint_d") then
				return { "eslint_d" }
			elseif has_executable("eslint") then
				return { "eslint" }
			end
			return {}
		end

		local js_filetypes = {
			javascript = true,
			typescript = true,
			javascriptreact = true,
			typescriptreact = true,
			svelte = true,
		}

		lint.linters_by_ft = setmetatable({
			python = { "pylint" },
		}, {
			__index = function(_, ft)
				if js_filetypes[ft] then
					return get_js_linters()
				end
				return nil
			end,
		})

		eslint.args = {
			"--no-warn-ignored",
			"--format",
			"json",
			"--stdin",
			"--stdin-filename",
			function()
				return vim.fn.expand("%:p")
			end,
		}

		local function try_lint()
			lint.try_lint(nil, {
				ignore_errors = true,
				filter = function(linter)
					local cmd = type(linter.cmd) == "function" and linter.cmd() or linter.cmd
					return cmd and vim.fn.executable(cmd) == 1
				end,
			})
		end

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
