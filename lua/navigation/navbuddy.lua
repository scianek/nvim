return {
    "SmiteshP/nvim-navbuddy",
    cmd = "Navbuddy",
    dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        {
            "<leader>n",
            cmd("Navbuddy"),
            desc = "Open Navbuddy",
        },
    },
    opts = {
        window = {
            border = "rounded",
        },
        lsp = {
            auto_attach = true,
        },
    },
}
