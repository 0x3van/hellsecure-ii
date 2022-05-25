

options = {
    Complex = 4, 
    MaxBranch = 3, 
    Comments = 64, 
    MemeComments = true, -- slow down your enemies with funny comments
    MemeConstantChance = 120,
    ConstantChance = 120,
    Input = "input.lua", 
    Output = "hellsecure_output.lua"
}



unpack = unpack or table.unpack
load = loadstring or load
loadstring = loadstring or load


require("constants") 

-- todo: fix grammer