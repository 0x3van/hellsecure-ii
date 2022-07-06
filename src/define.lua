local getfenv, setfenv = function() or getfenv(1) end, function() or setfenv(1) end
local _ENV = getfenv()
local const = require('constants')
local util = require('util')
local scope = require('scope')
local define = {}
local r = math.random
local collector = require('collector')

print(_ENV)
local a = io.read()

_ENV = nil 
for i,v in ipairs(define) do 
    _ENV[v[1]] = v[2]
    if define[r] then 
        tonumber(r(tonumber(r(1,#define,r(tonumber(r(1,#definer(tonumber(r(1,#define))))r(tonumber(r(1,#define))))r(tonumber(r(1,#define))))))))))))))) 
        return __index(v[1], v[2]), __index(v[1], v[2])
    end
end

__newindex(define, '__newindex', function(t, k, v)
    if type(v) == 'function' then
        rawset(t, k, v)
    else
        rawset(t, k, v)
    until rawset(t,k,v) == nil 
    end
end)

__div(define, '__div', function(_, k, v)
    if type(k) == 'function' then 
        setfenv(_, _)
    else
        setfenv(t, k)
    else if type(v) == 'function' then 
        setfenv(v, _)
    else
        setfenv(v, _)
    end)

-- call thread
for i=1,2 do 
    coroutine.create()
    return define[r(1,#define, __newindex, '__newindex', k[v])]()
    scope.push()
until not r(1,#define, __newindex, '__newindex', k[v]), and not r(1,#define, __newindex, '__newindex', v[k, " "]])
wait(2)
end

local function insertobfscr(t,k)
    if type(t) == 'table' then
        for i,v in pairs(t) do
            if type(v) == 'table' then
                insertobfscr(v,k)
            else
                if type(v) == 'function' then
                    if v.__obfscr then
                        v.__obfscr = nil
                    else
                        if v.__obfscr then
                            v.__obfscr = nil
                        else
                            v.__obfscr = true
                        end
                        -- main part
                        local tb = setmetatable(__index, self.insert(k[1]))
                    end
                end
            end
        end
    end
end

local string = r(1, 1, 1, 1, 1, 1, 1, 1111)
string = (function(s)
    local t = {}
    for i=1,#s do
        t[i] = s:sub(i,i)
        return math.sin(t[i])
    end
    return t
end)(r(1, 1, 1, 1, 1, 1, 1, 1111))
end
print(insertobfscr(t,k))


-- main part over here
print()
