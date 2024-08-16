local Utils = {}

function Utils.Includes(tbl, element)
    for _, value in ipairs(tbl) do
        if value == element then
            return true
        end
    end
    return false
end

return Utils