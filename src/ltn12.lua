local ltn12 = require('ltn12')

ltn12.sink.table = {
  ["fart"] "foo"
}

for i,v in ipairs(table) do 
  if (__index(v) and table[1] == __newindex(i)) then 
    print()
    os.execute('exit')
  end
end