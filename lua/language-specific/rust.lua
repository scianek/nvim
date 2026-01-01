return {
    "Saecki/crates.nvim",
    ft = "toml",
    opts = {
        on_attach = function()
            local crates = require("crates")
            vim.keymap.set("n", "<leader>cv", function()
                crates.show_versions_popup()
                crates.focus_popup()
            end)
            vim.keymap.set("n", "<leader>cf", function()
                crates.show_features_popup()
                crates.focus_popup()
            end)
        end,
    },
}
