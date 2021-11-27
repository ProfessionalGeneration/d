local old
local LocalPlayer = game:GetService("Players").LocalPlayer
local sahit
local mrh = {"Head","HumanoidRootPart"}
local plrs = {}
getgenv().var = {}
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
old = hookmetamethod(game,'__namecall',function(s,...)
    local args = {...}
    if var.autoreload and getnamecallmethod() == "FireServer" and tostring(s):lower():find("shootevent") then
        require(args[2]:FindFirstChild("GunStates")).CurrentAmmo = tonumber(require(args[2]:FindFirstChild("GunStates")).MaxAmmo) + 1
        game:GetService("ReplicatedStorage").ReloadEvent:FireServer(args[2])
        return old(s,...) 
    end
    if var.silentaim and getnamecallmethod() == "FindPartOnRay" and tostring(getcallingscript()) == "GunInterface" and sahit ~= nil then
        return sahit.Character[mrh[math.random(1,2)]],sahit.Character:GetPivot().p
    end 
    return old(s,...)    
end)
while true do
    local __ = math.huge
    for i,v in ipairs(plrs) do
        if v ~= LocalPlayer and LocalPlayer.Parent:FindFirstChild(tostring(v)) and workspace:FindFirstChild(tostring(v)) and v.Character:FindFirstChildWhichIsA("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChildWhichIsA("Humanoid").Health ~= 0 and v.Team ~= LocalPlayer.Team then
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
