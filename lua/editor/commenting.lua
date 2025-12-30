return {
    {
        "numtostr/comment.nvim",
        keys = { { "gc", mode = { "n", "x", "o" } }, "gcc", "gb", "gbc" },
        config = function()
            require("Comment").setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            })
        end,
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = { "BufReadPre", "BufNewFile" },
    },
}
