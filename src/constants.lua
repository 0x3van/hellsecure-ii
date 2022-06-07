
local getfenv, setfenv = getfenv or function()
    return _ENV
end, setfenv or function(s, d)
    _ENV[s] = d 
end
-- cock and ball gaming 
local the_time = os.clock()
me = require("gen").Memes

-- Seed fucker
local mr = math.random
local seeds = {}
function seed()
    local ns = tonumber(tostring(tonumber(tostring(tostring(tonumber(tostring(os.clock()):reverse()) .. tostring(os.time()):reverse():sub(-mr(8))):gsub("0", mr(0, 9)))) * mr()):gsub("%.", ""):sub(1, 6):reverse():reverse() .. mr(9))
    for n = 1, 32 do
        if not seeds[ns] then
            break
        elseif n >= 32 then
            print("Seed failed:", n)
            seeds = {}
            ns = mr(9^9)
            if not seeds[ns] then
                break
            end
        elseif n >= 16 then
            print("Seed failed:", n)
            ns = mr() * 1e5
            if not seeds[ns] then
                break
            end
        elseif n >= 8 then
            print("Seed failed:", n)
            ns = mr(9e9)
            if not seeds[ns] then
                break
            end
        end
        ns = tonumber(tostring(tonumber(tostring(tostring(tonumber(tostring(os.clock()):reverse()) .. tostring(os.time()):reverse():sub(mr(8))):gsub("0", mr(0, 9)))) * mr()):gsub("%.", ""):sub(1, 6):reverse() .. mr(9))
        print("seed", ns)
    end
    seeds[ns] = (seeds[ns] or 0) + 1
    --table.sort(seeds)
    return math.randomseed(ns or mr())
end
seed()
--[[function math.random(...)
    pcall(seed)
    return mr(...)
end]]

--sys.clear()

math.randomseed(tonumber(tostring(os.clock()):gsub("%.", ""):reverse()))
function ecall(...)
    local arg = {pcall(...)}
    if not arg[1] and arg[2] then
        return print("Error:" .. tostring(arg[2]))
    end
    table.remove(arg, 1)
    return unpack(arg)
end

local formatbeautify = require("formatbeautify")
local formatmini = require("formatmini")

local source
 -- Input file
    local file = ecall(io.open, options.Input, "r")
    if not file then
        file = ecall(io.open, options.Input, "w")
        if not file then
            return error("Couldnt find/create " .. options.Input .. " for reading.")
        end
        file:write("print(\"Hello World!\")"):close()
        file = ecall(io.open, options.Input, "r")
    end
    source = file:read("*all")

--CONST

require("parselua")
local frac = rawget(require("fraction"), "fraction")
local code = source

local function hex(n)
    math.randomseed(tonumber(tostring(tostring(tonumber(tostring(os.clock()):reverse()) .. tostring(os.time()):reverse():sub(5)):gsub("0", math.random(0, 9)))))
    return frac(n, true, true, math.random(0, math.random(1))):lower()
end

function insertcomment(orig, force)
    orig = orig or ""
    if math.random(7) >= 2 and not force then
        return orig
    end
    local x = "\226\128\174"
    if options.MemeComments and math.random(3) > 1 then
        x = x .. string.reverse(me[math.random(#me)]) .. x
    else
        for loop = 1, math.random(3, 10) do
            x = x .. ({"I", "l"})[math.random(2)] .. "\226\128\174"
        end
    end
    print("Comment:" .. x)
    return orig .. "--[[\226\128\174" .. (x) .. "\226\128\174]] "
end

local function extract(code, ast)
    local function softdump(str)
        local index = 0
        return str:gsub(".", function(c)
            index = 1 + (index or 0)
            if index > 1 then
                return ", " .. hex(string.byte(c))
            end
            return hex(string.byte(c))
        end)
    end
    local function dumpString(x)
        --if options.ConstantChance > 0 and math.random(options.ConstantChance) == 1 then
        local str = x
        if x:len() > 200 or str:len() < 1 then
            if x:len() == 0 then
                return '""'
            end
            return "\"" .. x:gsub(".", function(d)
                return "\\" .. d:byte()
            end) .. "\""
        end
        local index = 0 -- \\115\\116\\114\\105\\110\\103
        return ("_ENV[\"\\115\\116\\114\\105\\110\\103\"][\"\\99\\104\\97\\114\"](" .. str:gsub(".", function(c)
            index = 1 + (index or 0)
            if index > 1 then
                return ", " .. hex(string.byte(c))
            end
            return hex(string.byte(c))
        end) .. ")")
        --end
        --return "\"" .. x .. "\""
    end
    local CONSTANT_POOL_NAME
    seed()
    base = string.rep(".", math.random(20)):gsub(".", function()
        return ({"l", "I"})[math.random(2)]
    end)
    --base = 'CONSTANT_POOl'
    local chars = "Il"
    while code:find(base, 1, true) do
        local n = math.random(#chars)
        base = base .. chars:sub(n, n)
    end
    CONSTANT_POOL_NAME = base

    -- Rip constant strings out
    local function makeNode(index)
        return {
            AstType = 'IndexExpr',
            ParentCount = 1,
            Base = { AstType = 'VarExpr', Name = CONSTANT_POOL_NAME },
            Index = { AstType = 'NumberExpr', Value = { Data = index } }
        } -- Ast Node
    end

    table.insert(ast.Body, 1, {
        AstType = 'LocalStatement',
        Scope = ast.Scope,
        LocalList = {
            --ast.Scope:CreateLocal('CONSTANT_POOL'),
            { Scope = ast.Scope, Name = CONSTANT_POOL_NAME, CanRename = true },
        },
        InitList = {
            { EntryList = { }, AstType = 'ConstructorExpr' },
        },
    })
    local constantPoolAstNode = ast.Body[1].InitList[1]

    local CONSTANT_POOL = { }
    local nilIndex
    local index = 1
    local function insertConstant(v, index, type)
        table.insert(constantPoolAstNode.EntryList, {
            Type = 'Key',
            Value = { AstType = type or 'StringExpr', Value = v },
            Key = { AstType = 'StringExpr', Value = { Data = dumpString(index) } }
        })
        print("Inserted a", type, "constant.")
    end
    local indexes = {}
    local function addConstant(const)
        print("Added a", const, "constant.")
        index = string.gsub(string.rep(".", math.random(6, math.random(25, math.random(30, math.random(35, 40))))), ".", function()
            return ({"I", "l"})[math.random(2)]
        end)
        while indexes[index] do
            index = string.gsub(string.rep(".", math.random(5, math.random(25, math.random(30, math.random(35, 40))))), ".", function()
                return ({"I", "l"})[math.random(2)]
            end)
        end
        indexes[index] = true
        if CONSTANT_POOL[const] then
            return CONSTANT_POOL[const]
        end
        if const == nil and nilIndex then
            return nilIndex
        end
        if type(const) == 'string' then
            if #const == 0 then
                const = "\"\""
            end
            const = dumpString(const)
            insertConstant({ Data = const, Constant = const }, index, 'StringExpr')
            CONSTANT_POOL[const] = dumpString(index)
            --index = index + 1
            return CONSTANT_POOL[const]
        elseif type(const) == 'number' then
            --const = hex(const)
            insertConstant({ Data = hex(const) }, index, 'NumberExpr')
            CONSTANT_POOL[const] = dumpString(index)
            --index = index + 1
            return CONSTANT_POOL[const]
        elseif type(const) == 'nil' then
            insertConstant(const, index, 'NilExpr')
            nilIndex = index
            --index = index + 1
            return nilIndex
        elseif type(const) == 'boolean' then
            insertConstant(const, index, 'BooleanExpr')
            CONSTANT_POOL[const] = dumpString(index)
            --index = index + 1
            return CONSTANT_POOL[const]
        elseif const.AstType == 'VarExpr' then
            table.insert(constantPoolAstNode.EntryList, {
                Type = 'Key',
                Value = const,
                Key = { AstType = 'NumberExpr', Value = { Data = tostring(index) } }
            })
            CONSTANT_POOL[const] = dumpString(index)
            --index = index + 1
            return CONSTANT_POOL[const]
        else
            error("Unable to process constant of type '" .. const .. "'")
        end
    end
    local fixExpr, fixStatList
    function fixExpr(expr)
        if expr.AstType == 'VarExpr' then
            if expr.Local then
                --[[for k, v in pairs(expr.Local) do
				print(k, v)
				if type(v) == "table" then
				for l, b in pairs(v) do
				print(l, b)
				end
				end
				end]]
                return expr
            else
                --local i = addConstant(expr)
                --return makeNode(i)
            end
        elseif expr.AstType == 'NumberExpr' then
            --local
            local i = addConstant(tonumber(expr.Value.Data))
            return makeNode(i)
        elseif expr.AstType == 'StringExpr' then
            local i = addConstant(expr.Value.Constant)
            return makeNode(i)
        elseif expr.AstType == 'BooleanExpr' then
            local i = addConstant(expr.Value)
            return makeNode(i)
        elseif expr.AstType == 'NilExpr' then
            local i = addConstant(nil)
            return makeNode(i)
        elseif expr.AstType == 'BinopExpr' then
            expr.Lhs = fixExpr(expr.Lhs)
            expr.Rhs = fixExpr(expr.Rhs)
        elseif expr.AstType == 'UnopExpr' then
            expr.Rhs = fixExpr(expr.Rhs)
        elseif expr.AstType == 'DotsExpr' then
        elseif expr.AstType == 'CallExpr' then
            expr.Base = fixExpr(expr.Base)
            for i = 1, #expr.Arguments do
                expr.Arguments[i] = fixExpr(expr.Arguments[i])
            end
        elseif expr.AstType == 'TableCallExpr' then
            expr.Base = fixExpr(expr.Base)
            expr.Arguments[1] = fixExpr(expr.Arguments[1])
        elseif expr.AstType == 'StringCallExpr' then
            expr.Base = fixExpr(expr.Base)
            expr.Arguments[1] = fixExpr(expr.Arguments[1])
        elseif expr.AstType == 'IndexExpr' then
            expr.Base = fixExpr(expr.Base)
            expr.Index = fixExpr(expr.Index)
        elseif expr.AstType == 'MemberExpr' then
            expr.Base = fixExpr(expr.Base)
        elseif expr.AstType == 'Function' then
            fixStatList(expr.Body)
        elseif expr.AstType == 'ConstructorExpr' then
            for i = 1, #expr.EntryList do
                local entry = expr.EntryList[i]
                if entry.Type == 'Key' then
                    entry.Key = fixExpr(entry.Key)
                    entry.Value = fixExpr(entry.Value)
                elseif entry.Type == 'Value' then
                    entry.Value = fixExpr(entry.Value)
                elseif entry.Type == 'KeyString' then
                    entry.Value = fixExpr(entry.Value)
                end
            end
        end
        return expr
    end
    local function fixStmt(statement)
        if statement.AstType == 'AssignmentStatement' then
            for i = 1, #statement.Lhs do
                statement.Lhs[i] = fixExpr(statement.Lhs[i])
            end
            for i = 1, #statement.Rhs do
                statement.Rhs[i] = fixExpr(statement.Rhs[i])
            end
        elseif statement.AstType == 'CallStatement' then
            statement.Expression = fixExpr(statement.Expression)
        elseif statement.AstType == 'LocalStatement' then
            for i = 1, #statement.InitList do
                statement.InitList[i] = fixExpr(statement.InitList[i])
            end
        elseif statement.AstType == 'IfStatement' then
            statement.Clauses[1].Condition = fixExpr(statement.Clauses[1].Condition)
            fixStatList(statement.Clauses[1].Body)
            for i = 2, #statement.Clauses do
                local st = statement.Clauses[i]
                if st.Condition then
                    st.Condition = fixExpr(st.Condition)
                end
                fixStatList(st.Body)
            end
        elseif statement.AstType == 'WhileStatement' then
            statement.Condition = fixExpr(statement.Condition)
            fixStatList(statement.Body)
        elseif statement.AstType == 'DoStatement' then
            fixStatList(statement.Body)
        elseif statement.AstType == 'ReturnStatement' then
            for i = 1, #statement.Arguments do
                statement.Arguments[i] = fixExpr(statement.Arguments[i])
            end
        elseif statement.AstType == 'BreakStatement' then
        elseif statement.AstType == 'RepeatStatement' then
            fixStatList(statement.Body)
            statement.Condition = fixExpr(statement.Condition)
        elseif statement.AstType == 'Function' then
            if statement.IsLocal then
            else
                statement.Name = fixExpr(statement.Name)
            end
            fixStatList(statement.Body)
        elseif statement.AstType == 'GenericForStatement' then
            for i = 1, #statement.Generators do
                statement.Generators[i] = fixExpr(statement.Generators[i])
            end
            fixStatList(statement.Body)
        elseif statement.AstType == 'NumericForStatement' then
            statement.Start = fixExpr(statement.Start)
            statement.End = fixExpr(statement.End)
            if statement.Step then
                statement.Step = fixExpr(statement.Step)
            end
            fixStatList(statement.Body)
        elseif statement.AstType == 'LabelStatement' then
        elseif statement.AstType == 'GotoStatement' then
        else
            print("Unknown AST Type: " .. statement.AstType)
        end
    end
    function fixStatList(statList)
        for _, stat in pairs(statList.Body) do
            seed()
            if math.random(5) == 1 then
                fixStmt(stat)
            end
        end
    end
    fixStatList(ast)

    addConstant("Evan Was Here", index)
    if options.ConstantChance and options.MemeConstantChance > 0 then

        for k = 1, 25 do
            local m = me[math.random(#me)]
            if math.random(options.MemeConstantChance) == 1 and m then
                addConstant(m, index)
            end
        end
    end
end


local success, ast = ParseLua(code)
if not success then
    error("Failed to parse code: " .. ast)
end
print("parse finish")
_G.ded = true
code = require("formatbeautify")(ast)
print("beautify finish")
_G.ded = false
local success, ast = ParseLua(code)
if not success then
    local out = ecall(io.open, options.Output, "w")
    if not out then
        return error("Couldnt find/create " .. options.Output .. " for reading.")
    end
    --out:write("function _ENV.getfenv()return _ENV end\n" .. source):close()
    out:write("_ENV = assert(_ENV or (getfenv and getfenv()), \"Envrionment missing.\")\n", code)
    out:close()
    error("Failed to parse code: " .. ast)
end
print("parse finish, extracting constants")

extract(code, ast)
print("extract finish, minifying")
--code = require("formatbeautify")(ast)
code = Format_Mini(ast)

local success, ast = ParseLua(code)
if not success then
    local out = ecall(io.open, options.Output, "w")
    if out then
        out:write("_ENV = assert(_ENV or (getfenv and getfenv()), \"Envrionment missing.\")\n", code)
        out:close()
    end
    error("Failed to parse code: " .. ast)
end
print("parse finish, beautifying")
_G.ded = false
code = require("formatbeautify")(ast)--:match("^%s*(.-)%s*$")

if options.Comments and options.Comments > 0 then
    print("Generating comments")
    code = code:gsub("[%s]+", function(s)
        if math.random(7) >= 2 then
            return s
        end
        local x = "\226\128\174"
        if options.MemeComments and math.random(3) > 1 then
            x = x .. string.reverse(me[math.random(#me)]) .. x
        else
            for loop = 1, math.random(3, 10) do
                x = x .. ({"I", "l"})[math.random(2)] .. "\226\128\174"
            end
        end
        print("Comment:" .. x)
        return s .. "--[[" .. (x) .. "\226\128\174]] "
    end)
end
print("finish")

--CONST
source = code
    local out = ecall(io.open, options.Output, "w")
    if not out then
        return error("Couldnt find/create " .. options.Output .. " for reading.")
    end
    --out:write("function _ENV.getfenv()return _ENV end\n" .. source):close()
    out:write("-- HellSecure Obfuscator v0.4\n" .. insertcomment(nil, true) .. "_ENV = assert(" .. insertcomment(nil, true) .. "_ENV or" .. insertcomment(nil, true) .. " (getfenv " .. insertcomment(nil, true) .. "and" .. insertcomment(nil, true) .. " getfenv()" .. insertcomment(nil, true) .. "), \"Envrionment missing.\")" .. insertcomment(nil, true) .. "\n", source--[[:gsub("\t", function()
        return " " .. insertcomment() .. " "
    end)]])
    out:close()

print("Process complete in", (os.clock() - tonumber(the_time)), "seconds.")