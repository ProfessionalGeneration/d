-- How to use
--[[
    local CHLib = loadstring(game:HttpGet url)()
    
    CHLib:AddCommand("Print", -- main command name
    {"p"}, -- aliases
    "Prints Arguments given", -- info
    function(Args) table.foreach(args,print) end)

    CHLib:RemoveCommand("Print") or CHLib:RemoveCommand(CHLib.Commands[1])
]]

-- Variables

local CH = {}
CH.Configuration = {}
CH.cc = {}
CH.Commands = {}
CH.Configuration.Prefix = "-"
CH.Configuration.Split = "|" -- if you ever use multiple commands

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local hook = hookmetamethod
local oldhook

-- Misc functions for you to use

function CH.cc:GetPlayer(String)
    for _,Player in pairs(Players:GetPlayers()) do
        if Player.Name:lower():find(String:lower()) then
            return Player
        end
    end
end

function CH.cc:PlayerExists(String)
    if Players:FindFirstChild(String) and game:GetService("Workspace"):FindFirstChild(String) then
        return true
    end
end

function CH.cc:RayCast(From,To,Ignore)
    return game:GetService("Workspace"):Raycast(From,To,Ignore)    
end

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

function CH:AddCommand(Command, Aliases, Info, Function) -- if you like functions better
    assert(type(Command) == "string", "1st Argument to AddCommand is not a string")
    assert(type(Aliases) == "table", "2nd Argument to AddCommand is not a table")
    assert(type(Info) == "string", "3rd Argument to AddCommand is not a string")
    assert(type(Function) == "function", "4th Argument to AddCommand is not a function")
    
    local Final = {}
    
    Final["Command"] = Command
    Final["Aliases"] = Aliases
    Final["Info"] = Info
    Final["Function"] = Function
    
    table.insert(CH.Commands,Final)    
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

-- chatted

LocalPlayer.Chatted:Connect(function(msg)
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
            
            if found then
                task.spawn(function()cmdtable["Function"](args)end)
            end
            
        end
    end

end)
