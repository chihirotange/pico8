function contains(list, x)
    for i, v in ipairs(list) do
        if v == x then return true end
    end
end