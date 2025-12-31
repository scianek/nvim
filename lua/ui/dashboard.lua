return {
    "goolord/alpha-nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = "VimEnter",
    keys = {
        { "<leader>H", cmd("Alpha"), desc = "Open dashboard" },
    },
    init = function()
        local colors = require("mrok.palette")
        local hls = {
            AlphaNeovimLogoBlue = { fg = colors.blue },
            AlphaNeovimLogoGreenFBlueB = { fg = colors.green, bg = colors.blue },
            AlphaNeovimLogoGreen = { fg = colors.green },
            AlphaNeovimLogoGreenText = { fg = colors.green, bold = true, italic = true },
            AlphaNeovimLogoBlueText = { fg = colors.blue, bold = true, italic = true },
        }
        for name, hl in pairs(hls) do
            vim.api.nvim_set_hl(0, name, hl)
        end
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "alpha",
            callback = function()
                local laststatus = vim.opt.laststatus
                vim.opt.laststatus = 0
                vim.api.nvim_create_autocmd("BufUnload", {
                    buffer = 0,
                    callback = function()
                        vim.opt.laststatus = laststatus
                    end,
                })
            end,
        })
    end,
    config = function()
        local plenary_path = require("plenary.path")
        local button = require("alpha.themes.dashboard").button
        local function shorten_path(path, max_width)
            local short_fn = vim.fn.fnamemodify(path, ":.")
            if #short_fn > max_width then
                short_fn = plenary_path.new(short_fn):shorten(1, { -2, -1 })
                if #short_fn > max_width then
                    short_fn = plenary_path.new(short_fn):shorten(1, { -1 })
                end
            end
            return short_fn
        end
        local function file_button(path, shortcut, max_width)
            local short_path = shorten_path(path, max_width)
            local fb_hl = {}
            local icon, hl =
                require("nvim-web-devicons").get_icon(vim.fn.fnamemodify(path, ":t"), nil, { default = true })
            if hl then
                table.insert(fb_hl, { hl, 0, #icon })
            end
            icon = icon .. "  "
            local file_button_el = button(shortcut, icon .. short_path, cmd("e " .. vim.fn.fnameescape(path)))
            local fn_start = short_path:match(".*[/\\]")
            if fn_start ~= nil then
                table.insert(fb_hl, { "Comment", #icon - 2, #fn_start + #icon })
            end
            file_button_el.opts.hl = fb_hl
            return file_button_el
        end
        local function get_oldfiles(num)
            local readable_oldfiles = vim.tbl_filter(function(file)
                return vim.fn.filereadable(file) == 1
            end, vim.v.oldfiles)
            return { unpack(readable_oldfiles, 1, num) }
        end
        local header = {
            type = "text",
            val = {
                [[     █  █     ]],
                [[     ██ ██     ]],
                [[     █████     ]],
                [[     ██ ███     ]],
                [[     █  █     ]],
                [[]],
                [[N  E  O   V  I  M]],
            },
            opts = {
                position = "center",
                hl = {
                    { { "AlphaNeovimLogoBlue", 3, 8 }, { "AlphaNeovimLogoGreen", 8, 22 } },
                    {
                        { "AlphaNeovimLogoBlue", 3, 7 },
                        { "AlphaNeovimLogoGreenFBlueB", 8, 10 },
                        { "AlphaNeovimLogoGreen", 10, 24 },
                    },
                    { { "AlphaNeovimLogoBlue", 3, 11 }, { "AlphaNeovimLogoGreen", 11, 26 } },
                    { { "AlphaNeovimLogoBlue", 3, 11 }, { "AlphaNeovimLogoGreen", 12, 24 } },
                    { { "AlphaNeovimLogoBlue", 3, 11 }, { "AlphaNeovimLogoGreen", 12, 22 } },
                    {},
                    { { "AlphaNeovimLogoGreenText", 0, 9 }, { "AlphaNeovimLogoBlueText", 10, 18 } },
                },
            },
        }
        local startup_info = {
            type = "text",
            val = "", -- will be populated once Lazy loads
            opts = {
                position = "center",
                hl = "Comment",
            },
        }
        local buttons = {
            type = "group",
            val = {
                button("f", "󰈞  Find Files", cmd("Telescope find_files")),
                button(
                    "v",
                    "  Neovim Config",
                    cmd("Telescope find_files prompt_title=Neovim\\ Config cwd=~/.config/nvim")
                ),
                button("p", "  Plugins", cmd("Lazy")),
                button("t", "󱁤  Tools", cmd("Mason")),
                button("o", "󰆧  Projects", cmd("Telescope projects")),
                button("h", "󰋖  Help", cmd("Telescope help_tags")),
            },
            position = "center",
        }
        local function mru(opts)
            return {
                type = "group",
                val = vim.iter(ipairs(get_oldfiles(opts.items_number)))
                    :map(function(i, path)
                        return file_button(path, tostring(i), opts.target_width)
                    end)
                    :totable(),
            }
        end
        local section_mru = {
            type = "group",
            val = {
                {
                    type = "text",
                    val = " Recent files",
                    opts = {
                        hl = "Comment",
                        shrink_margin = false,
                        position = "center",
                    },
                },
                {
                    type = "group",
                    val = function()
                        return { mru({ target_width = 35, items_number = 8 }) }
                    end,
                    opts = { shrink_margin = false },
                },
            },
        }
        local fortune = {
            type = "text",
            val = require("alpha.fortune")(),
            opts = {
                position = "center",
                hl = "Comment",
            },
        }
        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                pattern = "AlphaReady",
                callback = function()
                    require("lazy").show()
                end,
            })
        end
        require("alpha").setup({
            margin = 10,
            layout = {
                { type = "padding", val = 1 },
                header,
                { type = "padding", val = 1 },
                startup_info,
                { type = "padding", val = 1 },
                buttons,
                { type = "padding", val = 1 },
                section_mru,
                { type = "padding", val = 1 },
                fortune,
            },
        })
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                startup_info.val = stats.loaded .. "/" .. stats.count .. " plugins loaded in " .. ms .. "ms"
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
