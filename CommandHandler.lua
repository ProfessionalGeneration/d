-- How to use
--[[
    local CHLib = loadstring(game:HttpGet'https://raw.githubusercontent.com/GFXTI/d/main/CommandHandler.lua')()
    
    CHLib:AddCommand("Print", -- main command name
    {"p"}, -- aliases
    "Prints Arguments given", -- info
    function(Args) table.foreach(args,print) end)

    CHLib:RemoveCommand("Print") or CHLib:RemoveCommand(CHLib.Commands[1])
    
    CHLib:ChangeConfiguration("Prefix",".")
]]

-- Variables

local CH = {}
CH.GivenAdmin = {}
CH.Configuration = {}
CH.Commands = {}
CH.Configuration.Prefix = "-"
CH.Configuration.Split = "|" -- if you ever use multiple commands

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

table.insert(CH.GivenAdmin,LocalPlayer)

-- Command Handler functions (important)

function CH:FindCommand(String)
    local check = false
    local table
    
    for _,cmd in pairs(CH.Commands) do
        if cmd["Command"]:lower() == String:lower() then
            check = true
            table = cmd
        end
        
        for _,alias in pairs(cmd["Aliases"]) do
            if alias:lower() == String:lower() then
                check = true
                table = cmd
            end
        end
    end
    
    return check, table
end

function CH:ChangeConfiguration(Setting,ChangeTo)
    CH.Configuration[Setting] = ChangeTo
end

function CH:AddCommand(Command, Aliases, Info, Function, IsUsableByOthers) -- if you like functions better
    assert(type(Command) == "string", "1st Argument to AddCommand is not a string")
    assert(type(Aliases) == "table", "2nd Argument to AddCommand is not a table")
    assert(type(Info) == "string", "3rd Argument to AddCommand is not a string")
    assert(type(Function) == "function", "4th Argument to AddCommand is not a function")
    
    local Final = {}
    
    Final["Command"] = Command
    Final["Aliases"] = Aliases
    Final["Info"] = Info
    Final["Function"] = Function
    Final["IsUsableByOthers"] = IsUsableByOthers or false
    
    table.insert(CH.Commands,Final)    
end

function CH:UpdateCommand(Command, Aliases, Info, Function)
    assert(type(Command) == "string", "1st Argument to AddCommand is not a string")
    assert(type(Aliases) == "table", "2nd Argument to AddCommand is not a table")
    assert(type(Info) == "string", "3rd Argument to AddCommand is not a string")
    assert(type(Function) == "function", "4th Argument to AddCommand is not a function")
    
    local function Update(Table)
        Table["Aliases"] = Aliases
        Table["Info"] = Info
        Table["Function"] = Function
    end 
    
    for i,v in pairs(CH.Command) do
        if type(Command) == "table" then
            if v == Command then
                Update(v)
                break
            end
        end
        
        if type(Command) == "string" then
            if v["Command"] == Command then
                Update(v)
            end
        end
    end
end

function CH:RemoveCommand(ToRemove)
    if type(ToRemove) == "table" then
        for i,v in pairs(CH.Commands) do
            if v == ToRemove then
                table.remove(CH.Commands,i)
            end
        end
    end
    
    if type(ToRemove) == "string" then
        for i,v in pairs(CH.Commands) do
            if v["Command"] == ToRemove:lower() then
                table.remove(CH.Commands,i)
            end
        end
    end
end

function CH:HandleMessage(msg,plr)
    if table.find(CH.GivenAdmin,plr) then
        local commandamount = msg:split(tostring(CH.Configuration.Split))
        local prefix = tostring(CH.Configuration.Prefix)
        
        if commandamount[1]:sub(1,#prefix) == prefix then
            for i = 1,#commandamount do
                local firstarg
                
                if i == 1 then -- fix to sum funtcion dieding because prefix
                    local prestring = commandamount[i]:split(" ")[1]
                    firstarg = prestring:lower():sub(2,#prestring)
                else
                    firstarg = commandamount[i]:split(" ")[1]:lower()
                end
                
                local args = commandamount[i]:split(" ")
                local found, cmdtable = CH:FindCommand(firstarg)
                table.remove(args,1)
                
                if found and plr == LocalPlayer or cmdtable.IsUsableByOthers then
                    task.spawn(function()cmdtable["Function"](args)end)
                end
                
            end
        end
    end
end

function CH:ChangeAdminPerms(plr)
    local function check()
        for i,v in pairs(CH.GivenAdmin) do
            if v == plr then
                return true, i
            end
        end
    end
    
    local c,p = check()
    
    if not c then
        table.insert(CH.GivenAdmin,plr)
    else
        table.remove(CH.GivenAdmin,p)
    end
end

-- chatted

for i,v in pairs(Players:GetPlayers()) do 
    v.Chatted:Connect(function(msg)
        CH:HandleMessage(msg,v)
    end)
end

Players.PlayerAdded:Connect(function(v)
    v.Chatted:Connect(function(msg)
        CH:HandleMessage(msg,v)
    end)
end)

return CH
