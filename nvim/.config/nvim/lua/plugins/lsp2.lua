local status, nvim_lsp = pcall ( require, 'lspconfig')
if (not status) then return end

local protocol = require ( 'vim.lsp.protocol' )

local on_attach = function(client, bufnr)
  -- formatting
  if client.server_capabilities.documentFormatting
end
