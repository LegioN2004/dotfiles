if vim.g.neovide then
  -- vim.g.neovide_transparency = 3
  -- vim.g.transparency = 0
  -- vim.o.guifont = "FiraCode NF:h13"
  vim.g.neovide_scale_factor = 1.0
  vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_refresh_rate_idle = 5
  -- vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_remember_window_size = "true"
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
  end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 0.7
  vim.g.transparency = 0.7
  vim.g.neovide_background_color = "#0f1117" .. alpha()
end
-- vim.cmd 'set guifont=Hack\ NF:h10'
-- vim.o.guifont='Consolas:h10'
vim.o.guifont = "JetBrainsMono NF:h10"
