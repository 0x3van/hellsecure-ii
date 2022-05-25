local parser = require("parselua")
local raw = require("raw")
local frac = rawget(require("fraction"), "fraction")
local Generate = require("gen")
--require("scope")
local ParseLua = parser.ParseLua
local function lookupify(tb)
    for _, v in pairs(tb) do
        tb[v] = true
    end
    return tb
end
local function dead(id)
    if not _G.ded or not options.MaxBranch or options.MaxBranch <= 0 or not options.Complex or options.Complex <= 0 then
        return ""
    end
    local c = Generate.Code(0)
    if c then
        if printid then
            print(id)
            return " \nprint(\"" .. id .. "\");\n "
        end
        return " \n" .. c .. "\n "
    end
    --return " \nprint(\"" .. id .. "\");\n "
end
local function hex(n)
    math.randomseed(tonumber(tostring(tostring(tonumber(tostring(os.clock()):reverse()) .. tostring(os.time()):reverse():sub(5)):gsub("0", math.random(0, 9)))))
    return frac(n, true, true, math.random(0, math.random(math.random(2)))):lower()
end

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
    local str = x
    if x:len() > 215 or str:len() < 1 then
        if x:len() == 0 then
            return '""'
        end
        return "\"" .. x:gsub(".", function(d)
            return "\\" .. d:byte()
        end) .. "\""
    end
    local index = 0 -- \\115\\116\\114\\105\\110\\103
    return ("_ENV[" .. ({"string.char", "string[\"\\99\" .. \"\\104\" .. \"\\97\" .. \"\\114\"]", "string[\"\\99\\104\\97\\114\"]"})[math.random(3)] .. "(" .. softdump("string") .. ")][\"\\99\\104\\97\\114\"](" .. str:gsub(".", function(c)
        index = 1 + (index or 0)
        if index > 1 then
            return ", " .. hex(string.byte(c))
        end
        return hex(string.byte(c))
    end) .. ")")
end
function string.filter(self)
    return tostring(self:gsub("\46", function(c)
        if c:upper() == c:lower() then
            if c:byte() == 92 then
                return "\\" .. "\\"
            elseif c:byte() == 13 then
                return "\\r"
            elseif c:byte() == 12 then
                return "\\f"
            elseif c:byte() == 11 then
                return "\\v"
            elseif c:byte() == 10 then
                return "\\n"
            elseif c:byte() == 9 then
                return "\\t"
            elseif c:byte() == 8 then
                return "\\b"
            elseif c:byte() == 7 then
                return "\\a"
            else
                return "\\" .. c:byte()
            end
        end
    end) or self or "")
end

local LowerChars = lookupify {
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z"
}
local UpperChars = lookupify {
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
}
local Digits = lookupify {
    "\48",
    "\49",
    "\50",
    "\51",
    "\52",
    "\53",
    "\54",
    "\55",
    "\56",
    "\57"
}
local function Format_Beautify(ast)
    local formatStatlist, formatExpr
    local indent = 0
    local EOL = "\n"
    local tab = "\t"
    local function getIndentation()
        return string.rep(tab or "    ", indent)
    end
    local function retstr(num, str)
        indent = num + indent
        return tostring(str or "") or ""
    end
    local function joinStatementsSafe(a, b, sep)
        sep = sep or ""
        local aa, bb = a:sub(-1, -1), b:sub(1, 1)
        if UpperChars[aa] or LowerChars[aa] or aa == "\95" then
            if not (UpperChars[bb] or LowerChars[bb] or bb == "\95" or Digits[bb]) then
                return a .. b-- .. "print(0)"
            elseif bb == "\40" then
                return a .. sep .. b-- .. "print(1)"
            else
                return a .. sep .. b-- .. "print(2)"
            end
        elseif Digits[aa] then
            if bb == "\40" then
                return a .. b-- .. "print(3)"
            else
                return a .. sep .. b-- .. "print(4)"
            end
        elseif aa == "" then
            return a .. b -- no
        else
            if bb == "\40" then
                return a .. sep .. b -- no
            else
                return a .. b -- no
            end
        end
    end
    function formatExpr(expr)
        --print(expr)
        if expr == nil then
            --return "nil"
        end
        local out = string.rep("(", expr.ParenCount or 0)
        if expr.AstType == "VarExpr" then
            if expr.Variable then
                out = out .. expr.Variable.Name
            else
                out = out .. expr.Name
            end
        elseif expr.AstType == "NumberExpr" then
            out = out .. expr.Value.Data
        elseif expr.AstType == "StringExpr" then
            out = out .. expr.Value.Data
        elseif expr.AstType == "BooleanExpr" then
            out = out .. tostring(expr.Value)
        elseif expr.AstType == "NilExpr" then
            out = joinStatementsSafe(out, "nil")
        elseif expr.AstType == "BinopExpr" then
            out = joinStatementsSafe(out, formatExpr(expr.Lhs)) .. " "
            out = joinStatementsSafe(out, expr.Op) .. " "
            out = joinStatementsSafe(out, formatExpr(expr.Rhs))
        elseif expr.AstType == "UnopExpr" then
            out = joinStatementsSafe(out, expr.Op) .. (#expr.Op ~= 1 and " " or "")
            out = joinStatementsSafe(out, formatExpr(expr.Rhs))
        elseif expr.AstType == "DotsExpr" then
            out = out .. "\46\46\46"
        elseif expr.AstType == "CallExpr" then
            out = out .. formatExpr(expr.Base)
            out = out .. "("
            for i = 1, #expr.Arguments do
                out = out .. formatExpr(expr.Arguments[i])
                if i ~= #expr.Arguments then
                    out = out .. "\44 "
                end
            end
            out = out .. "\41"
        elseif expr.AstType == "TableCallExpr" then
            out = out .. formatExpr(expr.Base) .. " "
            out = out .. formatExpr(expr.Arguments[1])
        elseif expr.AstType == "StringCallExpr" then
            out = out .. formatExpr(expr.Base) .. " "
            out = out .. expr.Arguments[1].Data
        elseif expr.AstType == "IndexExpr" then
            out = out .. formatExpr(expr.Base) .. "[" .. formatExpr(expr.Index) .. "\93"
        elseif expr.AstType == "MemberExpr" then
            if expr.Indexer == "." and not _G.func then
                out = out .. formatExpr(expr.Base) .. "[" .. dumpString(expr.Ident.Data) .. "]"
            else
                out = out .. formatExpr(expr.Base) .. expr.Indexer .. expr.Ident.Data
            end
        elseif expr.AstType == "Function" then
            _G.func = true
            --expr.Scope:ObfuscateVariables()
            out = out .. "function\40"
            if #expr.Arguments > 0 then
                for i = 1, #expr.Arguments do
                    if i == 1 then
                    end
                    out = out .. expr.Arguments[i].Name
                    if i ~= #expr.Arguments then
                        out = out .. "\44 "
                    elseif expr.VarArg then
                        out = out .. "\44 \46\46\46"
                    end
                    if 1 == #expr.Arguments then
                    end
                end
            elseif expr.VarArg then
                out = out .. "\46\46\46"
            end
            out = out .. "\41" .. EOL
            indent = indent + 1
            out = joinStatementsSafe(out, formatStatlist(expr.Body))
            indent = indent - 1
            out = joinStatementsSafe(out, getIndentation() .. "end")
            _G.func = false
        elseif expr.AstType == "ConstructorExpr" then
            local useraw, iid = true, 1
            if #expr.EntryList > 165 then
                useraw = false
                out = out .. "{"
                for i = 1, #expr.EntryList do
                    local entry = expr.EntryList[i]
                    if entry.Type == 'Key' then
                        out = out .. "[" .. formatExpr(entry.Key) .. "] = " .. formatExpr(entry.Value)
                    elseif entry.Type == 'Value' then
                        print(entry.Value)
                        out = out .. formatExpr(entry.Value)
                    elseif entry.Type == 'KeyString' then
                        out = out .. entry.Key .. " = " .. formatExpr(entry.Value)
                    end
                    if i ~= #expr.EntryList then
                        out = out .. ",\n"
                    end
                end
                out = out .. "}"
            end
            local dummy, rdummy = "{", "{}"
            for i = 1, #expr.EntryList do
                local entry = expr.EntryList[i]
                if nil == entry.Key then
                    entry.Key = iid
                end
                print(entry.Key, "\t", type(entry.Key))
                print(entry.Value, "\t", type(entry.Value))
                if entry.Type == 'Key' then
                    dummy, rdummy = (dummy .. "[" .. formatExpr(entry.Key) .. "] = " .. formatExpr(entry.Value)), ("_ENV[" .. dumpString("rawset") .. "](" .. rdummy .. ", " .. formatExpr(entry.Key) .. ", " .. formatExpr(entry.Value) .. ")")
                elseif entry.Type == 'Value' then
                    dummy, rdummy = dummy .. formatExpr(entry.Value), ("_ENV[" .. dumpString("rawset") .. "](" .. rdummy .. ", " .. tostring(entry.Key) .. ", " .. formatExpr(entry.Value) .. ")")
                    iid = 1 + iid
                elseif entry.Type == 'KeyString' then
                    local key = entry.Key
                    if type(key) == "string" then
                        key = "\"" .. key .. "\""
                    elseif type(key) == "table" then
                        key = formatExpr(key)
                    end
                    dummy, rdummy = dummy .. entry.Key .. " = " .. formatExpr(entry.Value), ("_ENV[" .. dumpString("rawset") .. "](" .. rdummy .. ", " .. key .. ",\n" .. formatExpr(entry.Value) .. ")")
                end
                if i ~= #expr.EntryList then
                    dummy = dummy .. ",\n"
                end
            end
            dummy = dummy .. "}"
            --local s, t = pcall(load("return " .. rdummy))
            --error(print(rdummy))
            if useraw and rdummy then
                out = out .. rdummy
            else
                --out = out .. dummy
            end
        elseif expr.AstType == "Parentheses" then
            out = out .. "\40" .. formatExpr(expr.Inner) .. "\41"
        end
        out = out .. string.rep("\41", expr.ParenCount or 0)
        return out
    end
    local formatStatement = function(statement)
        local out = dead(0) .. "" .. dead(1)
        if statement.AstType == "AssignmentStatement" then
            out = --[[no]]getIndentation() --no
            for i = 1, #statement.Lhs do
                out = --[[no]]out--[[no]] .. formatExpr(statement.Lhs[i]) -- no
                if i ~= #statement.Lhs then
                    out = dead(2) .. out--[[no]] .. "\44 " --no
                end
            end
            if #statement.Rhs > 0 then
                out = --[[no]]out --[[no]] .. " \61 " --no
                for i = 1, #statement.Rhs do
                    out =  --[[no]]out --[[no]] .. formatExpr(statement.Rhs[i]) --no
                    if i ~= #statement.Rhs then
                        out = --[[no]]out --[[no]] .. "\44 " --no
                    end
                end
            end
        elseif statement.AstType == "CallStatement" then
            out = dead(3) .. getIndentation() .. dead(4) .. formatExpr(statement.Expression) .. dead(5)
        elseif statement.AstType == "LocalStatement" then
            out = dead(6) .. getIndentation() .. dead(7) .. out .. dead(8) .. "local " -- no
            for i = 1, #statement.LocalList do
                out = dead(9) .. out--[[no]] .. statement.LocalList[i].Name -- no
                if i ~= #statement.LocalList then
                    out = dead(10) .. out--[[no]] .. "\44 " --no
                end
            end
            if #statement.InitList > 0 then
                out = dead(11) .. out ..--[[no]] " \61 " -- no
                for i = 1, #statement.InitList do
                    out = dead(12) .. out --[[no]] .. formatExpr(statement.InitList[i]) --no
                    if i ~= #statement.InitList then
                        out = dead(13) .. out --[[no]] .. "\44 " --no
                    end
                end
            end
        elseif statement.AstType == "IfStatement" then
            out = dead(14) .. getIndentation() .. dead(15) .. joinStatementsSafe(dead(16) .. "if " --[[no]], --[[no]]formatExpr(statement.Clauses[1].Condition) --[[no]]) --no
            out = dead(20) .. joinStatementsSafe(dead(21) .. out--[[no]], " then " .. dead(22)) .. dead(23) .. EOL .. dead(24)
            indent = indent + 1
            out = dead(25) .. joinStatementsSafe(dead(26) .. out .. dead(27), formatStatlist(statement.Clauses[1].Body)) --no
            indent = indent - 1
            for i = 2, #statement.Clauses do
                local st = statement.Clauses[i]
                if st.Condition then
                    out = dead(28) .. joinStatementsSafe(dead(29) .. out --[[no]], --[[no]]getIndentation()--[[no]] .. "elseif " --[[no]]) -- no
                    out = dead(30) .. joinStatementsSafe(dead(31) .. out --[[no]], formatExpr(st.Condition)) --no
                    out = dead(32) .. joinStatementsSafe(dead(33)..out--[[no]], --[[no]] " then " .. dead(35)) .. EOL .. dead(36)
                else
                    out = dead(37) .. joinStatementsSafe(dead(38) .. out --[[no]],  --[[no]]getIndentation()--[[no]] .. "else" .. dead(39)) .. dead(40) .. EOL .. dead(41)
                end
                indent = indent + 1
                out = dead(42) .. joinStatementsSafe(dead(43) .. out .. dead(44), formatStatlist(st.Body))--no
                indent = indent - 1
            end
            out = dead(45) .. joinStatementsSafe(dead(46) .. out --[[no]],  --[[no]]getIndentation()--[[no]] .. "end" .. dead(47)) .. dead(48)
        elseif statement.AstType == "WhileStatement" then
            out = dead(50) .. getIndentation() .. dead(51) .. joinStatementsSafe(dead(52) .. "while " --[[no]], --[[no]]formatExpr(statement.Condition)--[[no]])--no
            out = dead(55) .. joinStatementsSafe(dead(56) .. out --[[no]], " do" .. dead(58)) .. dead(59) .. EOL .. dead(60)
            indent = indent + 1
            out = dead(61) .. joinStatementsSafe(dead(62) .. out .. dead(63), dead(64) .. formatStatlist(statement.Body) .. dead(65)) .. dead(66)
            indent = indent - 1
            out = dead(67) .. joinStatementsSafe(dead(68) .. out .. dead(69), dead(70) .. getIndentation() .. dead(71) .. "end" .. dead(72))
        elseif statement.AstType == "DoStatement" then
            out = dead(77) .. getIndentation() .. dead(78) .. joinStatementsSafe(dead(79) .. out .. dead(80), dead(81) .. "do" .. dead(82)) .. dead(83)
            indent = indent + 1
            out = dead(84) .. joinStatementsSafe(dead(85) .. out .. dead(86), dead(87) .. formatStatlist(statement.Body) .. dead(88)) --no
            indent = indent - 1
            out = dead(89) .. joinStatementsSafe(dead(90) .. out .. dead(91), dead(92) .. getIndentation()--[[no]] .. "end" .. dead(93)) .. dead(94)
        elseif statement.AstType == "ReturnStatement" then
            out = dead(95) .. getIndentation() .. dead(96) .. "do return " --no
            for i = 1, #statement.Arguments do
                if i == 1 then
                end
                out = dead(97) .. joinStatementsSafe(dead(98) .. out --[[no]], --[[no]]formatExpr(statement.Arguments[i]) --[[no]]) --no
                if i ~= #statement.Arguments then
                    out = dead(102) .. out --[[no]] .. "\44 " --no
                end
                if #statement.Arguments == i then
                end
            end
            out = out .. " end "
        elseif statement.AstType == "BreakStatement" then
            out = dead(103) .. getIndentation() .. dead(104) .. "do break end" .. dead(105)
        elseif statement.AstType == "RepeatStatement" then
            out = dead(106) .. getIndentation() .. dead(107) .. "repeat" .. dead(108) .. EOL .. dead(109)
            indent = indent + 1
            out = dead(110) .. joinStatementsSafe(dead(111) .. out .. dead(112), dead(113) .. formatStatlist(statement.Body) .. dead(114)) .. dead(115)
            indent = indent - 1
            out = dead(116) .. joinStatementsSafe(dead(117) .. out .. dead(118), dead(119) .. getIndentation() .. dead(120) .. "until " --[[no]]) --no
            out = dead(123) .. joinStatementsSafe(dead(124) .. out --[[no]], --[[no]]formatExpr(statement.Condition) .. dead(127)) .. dead(128)
        elseif statement.AstType == "Function" then
            _G.func = true
            --statement.Scope:ObfuscateVariables()
            if statement.IsLocal then
                out = dead(129) .. "local " --no
            end
            out = dead(131) .. joinStatementsSafe(dead(132) .. out --[[no]],  --[[no]]"function " --[[no]]) --no
            out = dead(137) .. getIndentation() .. dead(137) .. out --no
            if statement.IsLocal then
                out = dead(138) .. out --[[no]] .. statement.Name.Name --no
            else
                out = dead(139) ..out--[[no]] .. formatExpr(statement.Name) --no
            end
            out = dead(140) .. out --[[no]] .. "\40" -- no
            if #statement.Arguments > 0 then
                for i = 1, #statement.Arguments do
                    if i == 1 then
                    end
                    out = dead(141) .. out --[[no]] .. statement.Arguments[i].Name -- no
                    if i ~= #statement.Arguments then
                        out = dead(142) .. out --[[no]] .. "\44 " --no
                    elseif statement.VarArg then
                        out = dead(143) .. out --[[no]] .. "\44 \46\46\46" --no
                    end
                    if i == #statement.Arguments then
                    end
                end
            elseif statement.VarArg then
                out = dead(146) .. out --[[no]].. "\46\46\46" -- no
            end
            out = dead(149) .. out --[[no]] .. "\41" .. dead(150) .. EOL .. dead(151)
            indent = indent + 1
            out = dead(152) .. joinStatementsSafe(dead(153) .. out .. dead(154), dead(155) .. formatStatlist(statement.Body) --[[no]]) --no
            indent = indent - 1
            out = dead(157) .. joinStatementsSafe(dead(158) .. out --[[no]], --[[no]]getIndentation() --[[no]] .. "end" .. dead(160)) .. dead(161)
            _G.func = false
        elseif statement.AstType == "GenericForStatement" then
            -- statement.Scope:ObfuscateVariables()
            out = dead(162) .. getIndentation() --[[no]] .. "for " -- no
            for i = 1, #statement.VariableList do
                out = dead(163) .. out --[[no]] .. statement.VariableList[i].Name --no
                if i ~= #statement.VariableList then
                    out = dead(164) .. out --[[no]] .. "\44 " --no
                end
            end
            out = dead(165) .. out --[[no]] .. " in " --no
            for i = 1, #statement.Generators do
                out = dead(166) .. joinStatementsSafe(dead(167) .. out --[[no]], --[[no]]formatExpr(statement.Generators[i]) --[[no]]) --no
                if i ~= #statement.Generators then
                --out = joinStatementsSafe(out, "\44 ")
                    out = dead(171) .. joinStatementsSafe(dead(172) .. out, "\44 ") -- no
                end
            end
            out = dead(177) .. joinStatementsSafe(dead(178) .. out --[[no]], --[[no]] " do" .. dead(181)) .. dead(182) .. EOL .. dead(183)
            indent = indent + 1
            out = dead(184) .. joinStatementsSafe(dead(185) .. out .. dead(186), dead(187) .. formatStatlist(statement.Body) .. dead(188)) .. dead(189)
            indent = indent - 1
            out = dead(190) .. joinStatementsSafe(dead(191) .. out .. dead(192), getIndentation() .. dead(193) .. "end" .. dead(194)) .. dead(195)
        elseif statement.AstType == "NumericForStatement" then
            out = dead(196) .. getIndentation() .. dead(197) .. "for " --no
            out = dead(198) .. out--[[no]] .. statement.Variable.Name --[[no]] .. " \61 " --no
            out = dead(199) .. out --[[no]] .. formatExpr(statement.Start) --[[no]] .. "\44 " --[[no]] .. formatExpr(statement.End) --no
            if statement.Step then
                out = dead(201) .. out --[[.. dead(202) ]].. "\44 " --[[.. dead(203) no]].. formatExpr(statement.Step) --[[no .. dead(204)]]
            end

            out = dead(205) .. joinStatementsSafe(dead(206) .. out --[[no]], --[[no]] " do" .. dead(209)) .. dead(210) .. EOL .. dead(11)
            indent = indent + 1
            out = dead(212) .. joinStatementsSafe(dead(213) .. out .. dead(214), dead(215) .. formatStatlist(statement.Body) .. dead(216)) .. dead(217)
            indent = indent - 1
            out = dead(218) .. joinStatementsSafe(dead(219) .. out .. dead(220), dead(221) .. getIndentation() .. dead(222) .. "end" .. dead(223)) .. dead(224)
        elseif statement.AstType == "LabelStatement" then
            out = dead(223) .. getIndentation() .. dead(224) .. "\58\58" .. dead(225) .. statement.Label .. dead(226) .. "\58\58" .. dead(227) .. EOL .. dead(228)
        elseif statement.AstType == "GotoStatement" then
            out = dead(229) .. getIndentation() .. dead(230) .. "goto " .. dead(231) .. statement.Label .. dead(232) .. EOL .. dead(233)
        elseif statement.AstType == "Comment" then
            if statement.CommentType == "Shebang" then
                out = getIndentation() .. statement.Data
            elseif statement.CommentType == "Comment" then
                out = getIndentation() .. statement.Data
            elseif statement.CommentType == "LongComment" then
                out = getIndentation() .. statement.Data
            end
        elseif statement.AstType == "Eof" then
            out = dead(234) .. out .. dead(235)
        else
            print("Unknown AST Type\58 ", statement.AstType)
        end
        return dead(236) .. out -- no
    end
    formatStatlist = function(statList)
        local out = ""
        --statList.Scope:ObfuscateVariables()
        for _, stat in pairs(statList.Body) do
            out = joinStatementsSafe(out, formatStatement(stat) .. " "--[[ .. insertcomment()]])
        end
        return out
    end
    --ast.Scope:ObfuscateVariables()
    --ast.Scope:ObfuscateLocals()
    return formatStatlist(ast)
end
return Format_Beautify