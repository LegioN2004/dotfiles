require'nvim-treesitter.configs'.setup({
		-- A list of parser names, or "all"
		ensure_installed = {
				"lua",
				"markdown",
				"java",
				"cpp",
				"css",
				"html",
				-- "c",
				-- "js",
				-- "ts",
				-- "python",
				-- "csharp",
		},
		sync_install = false,
		auto_install = true,
		additional_vim_regex_highlighting = false,
})
