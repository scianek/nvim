return {
    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            indent = {
                enable = true,
                style = {
                    { fg = "#1c2f54" },
                },
            },
        },
        config = function(_, opts)
            require("hlchunk").setup(opts)
        end,
    },
}
