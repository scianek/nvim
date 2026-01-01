---@type vim.lsp.Config
return {
    init_options = { hostInfo = "neovim" },
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    root_markers = { "package.json", "package-lock.json", "yarn.lock", "pnpm-lock.yaml" },
}
