local sinker = require('sinker')
local rem = require('rem')
for i,v in next, type(function) do 
  rfe = local function rfe(i)
      getfenv(v)  
    end)
end

-- make second regular expression
function rfegcatch() 
  for _,g in ipairs(getfenv(v)) do 
    if type(g) == 'function' then 
      setfenv(g, _G.environment)
    end
  end

parse(g)
