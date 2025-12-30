local augroup = vim.api.nvim_create_augroup

vim.api.nvim_create_autocmd("BufAdd", {
    desc = "Write shada when a buffer is opened, to persist recent files",
    group = augroup("shada_persist", { clear = true }),
    callback = function()
        vim.cmd("wshada")
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight selection on yank",
    group = augroup("highlight_yank", { clear = true }),
    callback = function()
        local c = require("mrok.palette")
        vim.api.nvim_set_hl(0, "HighlightYank", { bg = c.bg_green })
        vim.hl.on_yank({ timeout = 200, higroup = "HighlightYank" })
    end,
})

vim.api.nvim_create_autocmd("VimResized", {
    desc = "Equalize windows on vim resize",
    group = augroup("equalize_wins", { clear = true }),
    command = "wincmd =",
})

vim.api.nvim_create_autocmd("FileType", {
    desc = "Disable auto-commenting on new line",
    group = augroup("no_auto_comment", { clear = true }),
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

local tmux_pane = vim.env.TMUX_PANE
vim.api.nvim_create_autocmd("DirChanged", {
    desc = "Set project root for tmux",
    group = augroup("tmux_project_root", { clear = true }),
    callback = function()
        if tmux_pane then
            os.execute("tmux set-option -p -t " .. tmux_pane .. " @project_root " .. vim.fn.getcwd())
        end
    end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    desc = "Reload file if changed on disk",
    group = augroup("checktime", { clear = true }),
    callback = function()
        if vim.fn.mode() ~= "c" then
            vim.cmd("checktime")
        end
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged" }, {
    desc = "Disable diagnostics if conflict markers are detected",
    group = augroup("conflict_marker_diag", { clear = true }),
    callback = function()
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        for _, line in ipairs(lines) do
            if line:match("^<<<<<<<") or line:match("^=======") or line:match("^>>>>>>>") then
                vim.diagnostic.enable(false, { bufnr = 0 })
                return
            end
        end
        vim.diagnostic.enable(true, { bufnr = 0 })
    end,
})
