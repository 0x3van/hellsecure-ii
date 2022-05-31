local sinker = require('sinker')

for i,v in next, type(function) do 
  rfe = local function rfe(i)
      getfenv(v)  
    end)
end

