---Wraps a command in <cmd> and <cr> tags
---@param command string
---@return string
function _G.cmd(command)
    return "<cmd>" .. command .. "<cr>"
end
