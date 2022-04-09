require("dvratil.mappings").registerLSPMappings()

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.bashls.setup {
    capabilities = capabilities
}
lspconfig.ccls.setup {
    capabilities = capabilities
}
lspconfig.cssls.setup {
    capabilities = capabilities
}
lspconfig.cmake.setup {
    capabilities = capabilities
}
lspconfig.jedi_language_server.setup {
    capabilities = capabilities
}
lspconfig.html.setup {
    capabilities = capabilities
}
lspconfig.tsserver.setup {
    capabilities = capabilities
}
lspconfig.vuels.setup {
    capabilities = capabilities
}
