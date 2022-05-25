-- Source to be obfuscated
local n = 0
while wait() and n <= 10 do
    print(n)
    n = n + 0.1
end
print(n)