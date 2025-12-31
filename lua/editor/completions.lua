return {
    "saghen/blink.cmp",
    event = "InsertEnter",
    version = "1.*",

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "default",
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
            ["<C-h>"] = { "snippet_backward", "fallback" },
            ["<C-l>"] = { "snippet_forward", "fallback" },
        },

        snippets = {
            preset = "luasnip",
        },

        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 500 },
            menu = {
                winhighlight = "Normal:FloatNormal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
                draw = {
                    padding = { 0, 1 },
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                return " " .. ctx.kind_icon .. ctx.icon_gap .. " "
                            end,
                        },
                    },
                },
            },
        },
    },
}
