return {
    {
        "windwp/nvim-ts-autotag",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            fast_wrap = {
                map = "<M-e>",
                chars = { "{", "[", "(", '"', "'" },
                pattern = [=[[%'%"%>%]%)%}%,]]=],
                end_key = "$",
                keys = "qwertyuiopzxcvbnmasdfghjkl",
                check_comma = true,
                manual_position = true,
                highlight = "Search",
                highlight_grey = "Comment",
            },
        },
    },
    {
        "kylechui/nvim-surround",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            aliases = { q = '"' },
            move_cursor = false,
        },
    },
}
