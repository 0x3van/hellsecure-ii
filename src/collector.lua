local constants = require('constants')
local list = {
  "main"
  "sinker"
  "define"
  "fraction"
  "gen"
}
local list = require(list)
local ltn12 = require('ltn12')

ltn12.sink.table = setmetatable(__newindex, v) 
table = {
  io.read(constants), 
  io.read(main)
}


for _,v in ipairs(ltn12.table) do 
  getgc(v)
  io.write("dumping all memory.")
until getfenv(v)
wait(0.2)
return v 

pcall(function(retfunc)) 
  if debug.getupvalue(LowerChars) then 
  for k,v in next, UpperChars do 
      setfenv(retfunc, table)
end)
-- deprecated until my friend workso n it because hes a retard
-- function collect()
--     --*TODO
--   end
-- end
    