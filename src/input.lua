-- Source to be obfuscated
local list = {a}
for i,v in ipairs(list) do
  print(list[1])
end
-- ? -- ? -- ?

-- no integer overflow
