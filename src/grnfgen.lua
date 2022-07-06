-- generate regular expression for obfuscating

local constants = require('constants')
local gen = require('gen')


for i,v in next, _G do
    if type(v) == 'function' then
        print(i)
    end
end