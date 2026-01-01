return {
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        build = "make install_jsregexp",
        config = function()
            local ls = require("luasnip")
            ls.setup({
                history = false,
                region_check_events = "CursorMoved,CursorHold,InsertEnter",
                delete_check_events = "TextChanged",
            })

            vim.keymap.set({ "i", "s" }, "<C-l>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end)
            vim.keymap.set({ "i", "s" }, "<C-h>", function()
                if ls.choice_active() then
                    ls.change_choice(-1)
                end
            end)
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    {
        "rafamadriz/friendly-snippets",
        event = "InsertEnter",
    },
}
