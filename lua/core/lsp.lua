local lsp_dir = vim.fn.stdpath("config") .. "/lsp"
local files = vim.fn.glob(lsp_dir .. "/*.lua", false, true)

for _, file in ipairs(files) do
    local server_name = vim.fn.fnamemodify(file, ":t:r")
    vim.lsp.enable(server_name)
end
