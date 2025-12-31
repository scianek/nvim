return {
    "scianek/swiftline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local p = require("swiftline.builtin.providers")
        local s = require("swiftline.builtin.separators")
        local c = require("swiftline.builtin.components")
        local Style = require("swiftline.style")
        local colors = require("mrok.palette")

        local style_primary = Style:new({
            fg = colors.bg,
            bg = colors.blue,
            sep = {
                left = s.rounded.left,
                right = { s.rounded.right[1], style = { bg = colors.bg_blue } },
            },
            bold = true,
        })

        local style_secondary = Style:new({
            fg = colors.blue,
            bg = colors.bg_blue,
            sep = {
                left = s.block.left,
                right = s.rounded.right,
            },
            bold = true,
        })

        require("swiftline").setup({
            modules = {
                { p.mode():prefix(" "), style = style_primary },
                { p.git_branch():prefix("󰘬 "), style = style_secondary },
                p.filename(),
                c.git_diff({ color = colors.gray2 }),

                p.fill(),

                c.diagnostics(),
                { p.lsp():prefix("  "), style = { fg = colors.gray2 } },
                { p.cwd():prefix("󰉋 "), style = style_secondary:flip_sep() },
                { p.percentage():prefix(" "), style = style_primary:flip_sep() },
            },
            default_style = {
                sep = s.space,
            },
        })
    end,
}
