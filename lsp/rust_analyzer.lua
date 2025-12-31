---@type vim.lsp.Config
return {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml" },
    settings = {
        ["rust-analyzer"] = {
            inlayHints = {
                parameterHints = { enable = false },
                bindingModeHints = { enable = false },
                closingBraceHints = { enable = false },
                lifetimeElisionHints = { enable = false },
                reborrowHints = { enable = false },

                typeHints = { enable = true },
                chainingHints = { enable = true },
                closureReturnTypeHints = { enable = true },
            },
        },
    },
}
