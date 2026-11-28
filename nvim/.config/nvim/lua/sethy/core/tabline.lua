local M = {}

local icon_hl_cache = {}

vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("CustomTablineCache", { clear = true }),
	callback = function()
		icon_hl_cache = {}
	end,
})

local function get_tab_bg(hl_name)
	local hl = vim.api.nvim_get_hl(0, { name = hl_name, link = false })
	return hl and hl.bg or nil
end

local function get_icon_hl(icon_hl_name, is_active)
	if not icon_hl_name or icon_hl_name == "" then
		return is_active and "TabLineSel" or "TabLine"
	end

	local cache_key = icon_hl_name .. (is_active and "_sel" or "_norm")
	if icon_hl_cache[cache_key] then
		return icon_hl_cache[cache_key]
	end

	local base_group = is_active and "TabLineSel" or "TabLine"
	local icon_hl = vim.api.nvim_get_hl(0, { name = icon_hl_name, link = false })
	local tab_bg = get_tab_bg(base_group)

	if icon_hl and icon_hl.fg then
		local new_name = "Tabline" .. cache_key
		vim.api.nvim_set_hl(0, new_name, {
			fg = icon_hl.fg,
			bg = tab_bg,
			bold = is_active,
		})
		icon_hl_cache[cache_key] = new_name
		return new_name
	end

	return base_group
end

local function get_buf_label(bufnr)
	local bufname = vim.api.nvim_buf_get_name(bufnr)
	local ft = vim.bo[bufnr].filetype
	local bt = vim.bo[bufnr].buftype

	if ft == "oil" then
		local tail = vim.fn.fnamemodify(bufname:gsub("^oil://", ""):gsub("/$", ""), ":t")
		return (tail ~= "" and tail or "Oil") .. "/"
	end

	if bt == "terminal" then
		return "Terminal"
	end

	if bufname == "" then
		return "[No Name]"
	end

	return vim.fn.fnamemodify(bufname, ":t")
end

function M.render()
	local ok_devicons, devicons = pcall(require, "nvim-web-devicons")
	local tabs = vim.api.nvim_list_tabpages()
	local current_tab = vim.api.nvim_get_current_tabpage()
	local parts = {}

	for i, tab in ipairs(tabs) do
		local is_active = (tab == current_tab)
		local tab_hl = is_active and "%#TabLineSel#" or "%#TabLine#"
		local win = vim.api.nvim_tabpage_get_win(tab)
		local bufnr = vim.api.nvim_win_get_buf(win)

		local label = get_buf_label(bufnr)
		local modified = vim.bo[bufnr].modified and " [+]" or ""

		local icon = ""
		local icon_hl = is_active and "TabLineSel" or "TabLine"
		if ok_devicons then
			local ext = vim.fn.fnamemodify(label, ":e")
			local ic, hl = devicons.get_icon(label, ext, { default = true })
			if ic then
				icon = ic .. " "
				icon_hl = get_icon_hl(hl, is_active)
			end
		end

		local chunk = string.format(
			"%%%dT%s %d %%#%s#%s%s%s%s ",
			i,
			tab_hl,
			i,
			icon_hl,
			icon,
			tab_hl,
			label,
			modified
		)
		table.insert(parts, chunk)
	end

	table.insert(parts, "%#TabLineFill#%T")
	return table.concat(parts)
end

_G.CustomTabline = M.render
vim.o.tabline = "%!v:lua.CustomTabline()"

return M
