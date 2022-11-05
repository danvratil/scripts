require("dvratil.mappings").registerLSPMappings()

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local util = require('lspconfig.util')

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
    capabilities = capabilities,
    cmd = { "vscode-html-languageserver", "--stdio" }
}
lspconfig.tsserver.setup {
    capabilities = capabilities
}
lspconfig.vuels.setup {
    capabilities = capabilities
}
lspconfig.kotlin_language_server.setup {
    capabilities = capabilities,
    root_dir = util.root_pattern("pom.xml")
}
lspconfig.rust_analyzer.setup {
    capabilities = update_capabilities
}
