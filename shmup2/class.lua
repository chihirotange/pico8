--_G is global env variable
_G = _ENV
_G.__index = _G

function create_object(tbl)
    local obj = tbl or {}
    setmetatable(obj, _ENV)
    return obj
end