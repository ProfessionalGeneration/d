-- the funny paa command addon initializer (so your commands work as intended :grin: :thumbsup:)

local old
local LocalPlayer = game:GetService("Players").LocalPlayer
local sahit
local mrh = {"Head","HumanoidRootPart"}
local plrs = {}
getgenv().varggg = {}

-- cool functions, where did you find them

local function respawnondeath(g)
    pcall(function()
    	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:wait()
        local d
        d = character:WaitForChild("Humanoid").Died:Connect(function()
            d:Disconnect()
            if varggg.autorespawn then
                local c = workspace.Camera.CFrame
                local bp = character:GetPivot()
                local ot
                if character:FindFirstChildWhichIsA("Tool") and character:FindFirstChildWhichIsA("Tool"):FindFirstChild("GunInterface") then
                    ot = character:FindFirstChildWhichIsA("Tool").Name
                end
                workspace.Remote.loadchar:InvokeServer(LocalPlayer,LocalPlayer.TeamColor.Color)                
                workspace:WaitForChild(tostring(character)):PivotTo(bp)
                workspace.Camera.CFrame = c
                if type(ot) ~= "nil" and type(ot) == type("im gonna pee YOUR pants") then
                    workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver[ot].ITEMPICKUP)
                    LocalPlayer.Parent[tostring(character)].Backpack:WaitForChild(ot)
                    LocalPlayer.Parent[tostring(character)].Backpack[ot].Parent = workspace[tostring(character)]
                end
            end
        end)
    end)
end

LocalPlayer.CharacterAdded:Connect(respawnondeath)

-- players

for i,v in pairs(LocalPlayer.Parent:GetPlayers()) do
    table.insert(plrs,v)
end

LocalPlayer.Parent.PlayerAdded:Connect(function(v)
    table.insert(plrs,v)    
end)

LocalPlayer.Parent.PlayerRemoving:Connect(function(v)
    for i,v2 in pairs(plrs) do
        if tostring(v2) == tostring(v) then
            table.remove(plrs,i)
            break
        end
    end 
end)

-- localplayer character

LocalPlayer.CharacterAdded:Connect(respawnondeath)

-- the holy metamethod overuse

old = hookmetamethod(game,'__namecall',function(s,...)
    local args = {...}
    if varggg.autoreload and getnamecallmethod() == "FireServer" and tostring(s):lower():find("shootevent") then
        require(args[2]:FindFirstChild("GunStates")).CurrentAmmo = tonumber(require(args[2]:FindFirstChild("GunStates")).MaxAmmo) + 1
        game:GetService("ReplicatedStorage").ReloadEvent:FireServer(args[2])
        return old(s,...) 
    end
    if varggg.silentaim and getnamecallmethod() == "FindPartOnRay" and tostring(getcallingscript()) == "GunInterface" and sahit ~= nil then
        return sahit.Character[mrh[math.random(1,2)]],sahit.Character:GetPivot().p
    end 
    return old(s,...)    
end)

-- loops

coroutine.resume(coroutine.create(function()
    while true do
        local __ = math.huge
        
        for i,v in ipairs(plrs) do
            if v ~= LocalPlayer and LocalPlayer.Parent:FindFirstChild(tostring(v)) and workspace:FindFirstChild(tostring(v)) and v.Character:FindFirstChildWhichIsA("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChildWhichIsA("Humanoid").Health ~= 0 and v.TeamColor ~= LocalPlayer.TeamColor and #game:GetService("Workspace").CurrentCamera:GetPartsObscuringTarget({v.Character:GetPivot().p}, {v.Character, LocalPlayer.Character}) == 0 then
                local m = game:GetService("UserInputService"):GetMouseLocation()
                local p,c = workspace.Camera:WorldToViewportPoint(v.Character:GetPivot().p)
                if c then
                    local d = (Vector2.new(m.x,m.y)-Vector2.new(p.x,p.y)).magnitude
                    if d <= __ then
                        __ = d 
                        sahit = v
                    end
                end
            end
        end
        
        getgenv().getfenv().getgenv().getrenv().wait(.05)    
    end
end))
