local str, n = "{}", 0
local ignore_length = false
local max_length = 165
local mask_strings = false

function get(tab, num)
    num = math.abs(tonumber(num or 0)) - 1
    if num < 0 then
        num = 0
    end
    if num == 0 then
        num = nil
    end
    return next(tab, num)
end

function parse(val, write)
    if n <= max_length and not ignore_length then
        write = true
    end
    if ignore_length then
        write = false
    end
    if type(val) == "string" then
        if val:sub(1, 1) == "<" and val:sub(-1) == ">" then -- Escape functions, etc
            return val:sub(2, -2)
        elseif mask_strings == true then
            return "\"" .. val:gsub(".", function(b)
                return "\\" .. string.byte(b)
            end) .. "\""
        end
        return "\"" .. val:gsub(".", function(c)
            if c:find("%d") then
                return "\\" .. c:byte()
            elseif c:find("%W") then
                if c == "\t" then
                    return "\\t"
                elseif c == "\n" then
                    return "\\n"
                elseif c == "\r" then
                    return "\\r"
                end
                return "\\" .. string.byte(c)
            end
            return c
        end) .. "\""
    elseif type(val) == "number" then
        return hex(val)
    elseif type(val) == "table" and not write then
        return parse_table(val)
    elseif type(val) == "table" and write then
        return write_table(val)
    elseif type(val) == "function" then -- Try the best to convert function. Recomend using strings
        return tostring("loadstring(\"" .. string.dump(val):gsub(".", function(b)
            return "\\" .. string.byte(b)
        end) .. "\")")
    elseif type(val) == "nil" then
        return "nil"
    end
    return tostring(val)
end

function parse_table(t, res, p)
    local s = res or write_table(trim_tab(t, max_length), p)
    if type(t) == "table" then
        for k, v in pairs(t) do
            n = 1 + n
            if p then
                k, v = parse(k), parse(v)
            end
            s = "_ENV[\"rawset\"](" .. s .. ", " .. k .. ", " .. v .. ")"
        end
    end
    return s
end

function write_table(t, sk, p)
    if type(t) ~= "table" then
        return parse(t, true)
    end
    local s = "{"
    local q = 0
    for k, v in pairs(t) do
        q = 1 + q
        if q > 1 then
            s = s .. ", "
        end
        if p then
            k, v = parse(k), parse(v, true)
        end
        if k == q and not sk then
            s = s .. parse(v, true)
        else
            s = s .. "[" .. k .. "] = " .. v
        end
    end
    return s .. "}"
end

function hex(num)
    num = tonumber(num or 0)
    local str = "0X"
    if tostring(num):find("%.") then
        return tostring(num) -- We're not gonna make a fraction maker......yet
    end
    if tostring(num):find("%-") then
        str = "-" .. str
    end
    local nnum = string.format("%X", math.abs(tonumber(num)))
    if not nnum then
        return tostring(num) -- format failed
    end
    return tostring(str .. tostring(nnum))
end

local function getmin(t, min)
    assert(t ~= nil and min ~= nil, t == nil and "Table missing" or "Number missing")
    t = type(t) == "table" and t or {t}
    min = math.abs(tonumber(min or max_length or 165))
    local n = 0
    for k, v in pairs(t) do
        n = 1 + n
        if n >= min then
            return k
        end
    end
end

function trim_tab(t, min)
    assert(t ~= nil and min ~= nil, t == nil and "Table missing" or "Number missing")
    t = type(t) == "table" and t or {t}
    min = getmin(t, math.abs(tonumber(min or max_length or 165)))
    local cutouts = {}
    local s, k, v = pcall(next, t, min)
    if not s or not min then
        return cutouts or {}
    elseif k ~= nil and v ~= nil then
        repeat
            s, k, v = pcall(next, t, min)
            if s and k and v then
                cutouts[k] = v
                if k == min then
                    table.remove(t, k)
                else
                    t[k] = nil
                end
            elseif not s or not v and not k then
                break
            end
        until not pcall(next, t, min)
    end
    return cutouts
end

return parse_table, trim_tab, write_table