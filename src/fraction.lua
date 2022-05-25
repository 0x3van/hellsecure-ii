local function Round(v, p)
    local scale = 10 ^ (p or 0)
    local res = math.floor(math.abs(v) * scale + 0.5) / scale
    if v < 0 then
        res = -res
    end
    return res
end

local function factors(number) -- Ty luatut
    local factors = {}
    for possible_factor = 1, math.sqrt(number) do
        local remainder = number % possible_factor
        if remainder == 0 then
            local factor, factor_pair = possible_factor, number / possible_factor
            table.insert(factors, factor)
            if factor ~= factor_pair then
                table.insert(factors, factor_pair)
            end
        end
    end
    table.sort(factors)
    local nt, c = {}, 0
    for k, v in pairs(factors) do
        if not nt[v] then
            c = 1 + c
        end
        nt[v] = v
    end
    return nt, c
end
local fraction
local function fraction(n, offset, hex, comp)
    local orig = n + 0
    n = tonumber(n or 1)
    local leftovers = 1
    if offset and Round(n, 1) == n then
        offset = type(offset) == "number" and offset or math.random(math.random(2, 10), math.random(30, 50))
        n, leftovers = offset * n, offset * leftovers
        if hex and (not comp or comp <= 0) then
            return "0X" .. string.format("%X", n) .. " / " .. "0X" .. string.format("%X", leftovers)
        elseif comp > 0 then
            return "(" .. fraction(n, true, true, comp - 1) .. ") / (" .. fraction(leftovers, true, true, comp - 1) .. ")"
        end
        return tostring(n) .. "/" .. tostring(leftovers)
    end
    while tostring(n):find(".", nil, true) do
        n = 10 * n
        leftovers = 10 * leftovers
    end
    local tn, nn = factors(n)
    local td, dn = factors(leftovers)
    local least = nn > dn and td or tn
    local most = nn > dn and tn or td
    local nums = {}
    for k, v in pairs(least) do
        if most[k] and least[k] and most[k] == least[k] and not nums[k] then
            most[k] = false
            least[k] = false
            nums[k] = tonumber(k)
        elseif nums[k] then
            most[k] = false
            least[k] = false
        end
    end
    local nt = {}
    for k, v in pairs(nums) do
        table.insert(nt, tonumber(k))
    end
    table.sort(nt)
    local gcf = rawget(nt, #nt)
    gcf = gcf == nil and 1 or gcf
    n = n / gcf
    leftovers = leftovers / gcf
    if hex and (not comp or comp <= 0) then
        return "0X" .. string.format("%X", n) .. " / " .. "0X" .. string.format("%X", leftovers)
    elseif hex and comp > 0 then
        return "(" .. fraction(n, true, true, comp - 1) .. ") / (" .. fraction(leftovers, true, true, comp - 1) .. ")"
    end
    return tostring(n) .. "/" .. tostring(leftovers)
end

return {
    Round = Round,
    fraction = fraction,
    factors = factors
}