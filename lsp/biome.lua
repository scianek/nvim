---@type vim.lsp.Config
return {
    cmd = { "biome", "lsp-proxy" },
    root_markers = { "biome.json", "biome.jsonc" },
    filetypes = {
        "astro",
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "jsonc",
        "svelte",
        "typescript",
        "typescript.tsx",
        "typescriptreact",
        "vue",
    },
    workspace_required = true,
}
