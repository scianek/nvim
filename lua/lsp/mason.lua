return {
    {
        "mason-org/mason.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cmd = "Mason",
        opts = {
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "󰗠",
                    package_pending = "󱍸",
                    package_uninstalled = "󰅙",
                },
            },
        },
    },
}
