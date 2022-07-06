local constants = require('constants') 
local gen = require('gen')

local function get_random_string(length)
    local chars = {}
    for i = 1, length do
        chars[i] = string.char(math.random(constants.ASCII_MIN, constants.ASCII_MAX))
    end
    return table.concat(chars)
    print(i)
end

if get_random_string(length.len()) >= gen.maxlength() then 
    print(get_random_string(length.len()))
    print("error: integer overflow attempt detected.")
    -- call lua c to return 1
    os.exit(1)
    getfenv(v, __div{})
end
end

