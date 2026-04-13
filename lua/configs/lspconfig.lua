-- Cargar los defaults de NvChad
-- (Nota: si NvChad aún no ha actualizado su código interno a la v0.11,
-- esta línea podría seguir lanzando un warning temporalmente hasta que ellos lo parcheen).
require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- 1. LUA_LS
vim.lsp.config("lua_ls", {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                enable = false,
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})
vim.lsp.enable("lua_ls")

-- 2. CLANGD
vim.lsp.config("clangd", {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
})
vim.lsp.enable("clangd")

-- 3. BASEDPYRIGHT
vim.lsp.config("basedpyright", {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "off",
            },
        },
    },
})
vim.lsp.enable("basedpyright")
