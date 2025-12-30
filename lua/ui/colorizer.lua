return {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        filetypes = { "*" },
        user_default_options = {
            names = false,
            css = true,
            mode = "background",
            virtualtext = "■",
            always_update = true,
        },
    },
}
