local ret = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/GFXTI/d/main/AthenaUi.lua"))()
local togs = {
    SilentAim = {
        Toggled = false;
        Fov = 150;
        Wallcheck = false;
        FovCircle = false;
		NoSpread = false;
    };
	EntitySpeed = {
		Toggled = false;
		Rate = 1;
		Key = Enum.KeyCode.LeftControl;
	};
	Walkspeed = {
		Toggled = false;
		Rate = 1;
		Key = Enum.KeyCode.Z;
	};
	Noclip = {
		Toggled = false;
		Key = Enum.KeyCode.X;
	};
	Cursor = {
		Toggled = false;
		Id = ""
	};
	Esp = {
		['Player Esp'] = false;
		['Entity Esp'] = false;
		['Printer Esp'] = false;
		['Shipment Esp'] = false;
		['Refresh Rate'] = 0.0001;
		Tracers = false;
		TracerMouse = false;
	};
	AutoSemiGod = {
		Toggled = false;
		Rate = 26;
	};
	KillauraWhitelist = {
		"";
	};
	HealauraBlacklist = {
		"";
	};
	Printers = {
		Toggled = false;
		Void = false;
		Basic = false;
	};
	Farm = {
		Toggled = false;
		Carrot = false;
		Corn = false;
		Tomato = false;
	};
    NoSpread = false;
	InfJump = false;
	TriggerBot = false;
	InfHunger = false;
	Killaura = false;
	AutoReload = false;
	AutoDrink = false;
	InfEnergy = false;
	NCS = false;
	AutoInvisJet = false;
	Healaura = false;
	MaterialFarm = false;
	DestroyPrints = false;
}
local PlayerSelected
local Collecting = false

local esp = togs.Esp

local fovcircle = Drawing.new("Circle")
fovcircle.NumSides = 150
fovcircle.Color = Color3.fromRGB(46,59,145)
fovcircle.Thickness = 2

local oldshake = getrenv()._G.CSH
local shoot = getrenv()._G.FR

-- the things

local plrs = game.GetService(game,"Players")
local lp = plrs.LocalPlayer
local mouse = lp.GetMouse(lp)
local uis = game.GetService(game,"UserInputService")
local cam = workspace.CurrentCamera
local raycast = cam.GetPartsObscuringTarget
local getpiv = workspace.GetPivot
local wtvp = cam.WorldToViewportPoint
local ffc = workspace.FindFirstChild
local disfroml = lp.DistanceFromCharacter
local run = game:GetService("RunService")
local hts = game:GetService("HttpService")
local sv = setmetatable({},{__index = function(s,a) return game:GetService(a) end})

local weather = {}

weather["Evening"] = {
	["Lighting"] = {
		Ambient = Color3.fromRGB(111, 82, 102);
		Brightness = 0.7;
		ColorShift_Bottom = Color3.fromRGB(95, 114, 138);
		ColorShift_Top = Color3.fromRGB(195, 195, 195);
		FogColor = Color3.fromRGB(253, 198, 189);
		FogEnd = 4000;
		FogStart = 0;
		OutdoorAmbient = Color3.fromRGB(124,92,114);
		GeographicLatitude = 13;
	};
	["Sky"] = {
		SkyboxBk = "rbxassetid://271042516";
		SkyboxDn = "rbxassetid://271077243";
		SkyboxFt = "rbxassetid://271042556";
		SkyboxLf = "rbxassetid://271042310";
		SkyboxRt = "rbxassetid://271042467";
		SkyboxUp = "rbxassetid://271077958";
	}
}

weather["Morning"] = {
	["Lighting"] = {
		Ambient = Color3.new(0,0,0);
		Brightness = 0.25;
		ColorShift_Bottom = Color3.fromRGB(96,144,138);
		ColorShift_Top = Color3.new(0,0,0);
		FogColor =  Color3.fromRGB(81,107,112);
		FogEnd = 3000;
		FogStart = 0;
		OutdoorAmbient = Color3.fromRGB(35, 45, 61);
		GeographicLatitude = 20
	};
	["Sky"] = {
		SkyboxBk = "rbxassetid://253027015";
		SkyboxDn = "rbxassetid://253027058";
		SkyboxFt = "rbxassetid://253027039";
		SkyboxLf = "rbxassetid://253027029";
		SkyboxRt = "rbxassetid://253026999";
		SkyboxUp = "rbxassetid://253027050";
	}
}

weather["Night"] = {
	["Lighting"] = {
		Ambient = Color3.new(0,0,0);
		Brightness = 0;
		ColorShift_Bottom = Color3.fromRGB(95, 114, 138);
		ColorShift_Top = Color3.new(0,0,0);
		FogColor = Color3.fromRGB(31,46,75);
		FogEnd = 2000;
		FogStart = 0;
		OutdoorAmbient = Color3.fromRGB(33,40,61);
		GeographicLatitude = 20;
	};
	["Sky"] = {
		SkyboxBk = "rbxassetid://220789535";
		SkyboxDn = "rbxassetid://213221473";
		SkyboxFt = "rbxassetid://220789557";
		SkyboxLf = "rbxassetid://220789543";
		SkyboxRt = "rbxassetid://220789524";
		SkyboxUp = "rbxassetid://220789575";
	}
}

weather["Day"] = {
	["Lighting"] = {
		Ambient = Color3.fromRGB(74,73,69);
		Brightness = 1;
		ColorShift_Bottom = Color3.fromRGB(95,114,138);
		ColorShift_Top = Color3.fromRGB(68,66,58);
		FogColor = Color3.fromRGB(255,247,234);
		FogEnd = 4000;
		FogStart = 0;
		OutdoorAmbient = Color3.fromRGB(149,141,128);
		GeographicLatitude = 13;
	};
	["Sky"] = {
		SkyboxBk = "rbxassetid://497798770";
		SkyboxDn = "rbxassetid://489495201";
		SkyboxFt = "rbxassetid://497793238";
		SkyboxLf = "rbxassetid://497798734";
		SkyboxRt = "rbxassetid://497798714";
		SkyboxUp = "rbxassetid://489495183";
	}
}

weather["Rain"] = {
	["Lighting"] = {
		Ambient = Color3.new(0,0,0);
		Brightness = 0;
		ColorShift_Bottom = Color3.new(0,0,0);
		ColorShift_Top = Color3.new(0,0,0);
		FogColor = Color3.fromRGB(225,225,225);
		FogEnd = 1000;
		FogStart = 0;
		GeographicLatitude = 13;
		OutdoorAmbient = Color3.fromRGB(147,147,147);
	};
	["Sky"] = {
		SkyboxBk = "rbxassetid://931421737";
		SkyboxDn = "rbxassetid://931421868";
		SkyboxFt = "rbxassetid://931421587";
		SkyboxLf = "rbxassetid://931421672";
		SkyboxRt = "rbxassetid://931421501";
		SkyboxUp = "rbxassetid://931421803";
	}
}

weather["Snow"] = {
	["Lighting"] = {
		Ambient = Color3.new(0,0,0);
		ColorShift_Bottom = Color3.fromRGB(39,39,39);
		ColorShift_Top = Color3.fromRGB(74,74,74);
		FogColor = Color3.fromRGB(229,229,229);
		FogEnd = 400;
		FogStart = 0;
		GeographicLatitude = 13;
		OutdoorAmbient = Color3.fromRGB(191,191,191);
	};
	["Sky"] = {
		SkyboxBk = "rbxassetid://226025278";
		SkyboxDn = "rbxassetid://226025278";
		SkyboxFt = "rbxassetid://226025278";
		SkyboxLf = "rbxassetid://226025278";
		SkyboxRt = "rbxassetid://226025278";
		SkyboxUp = "rbxassetid://226025278";
	}
}

weather["Sand"] = {
	["Lighting"] = {
		Ambient = Color3.fromRGB(255,232,176);
		Brightness = 0;
		ColorShift_Bottom = Color3.fromRGB(95,114,138);
		ColorShift_Top = Color3.new(0,0,0);
		FogColor = Color3.fromRGB(248,235,190);
		FogEnd = 150;
		FogStart = 0;
		GeographicLatitude = 13;
		OutdoorAmbient = Color3.fromRGB(255,228,179);
	};
	["Sky"] = {
		SkyboxBk = "rbxassetid://8946325034";
		SkyboxDn = "rbxassetid://8946325034";
		SkyboxFt = "rbxassetid://8946325034";
		SkyboxLf = "rbxassetid://8946325034";
		SkyboxRt = "rbxassetid://8946325034";
		SkyboxUp = "rbxassetid://8946325034";
	}
}

local espupdates = {}
local connections = {}
local playernames = {}

local function CharacterAdded(c)
	if togs.AutoInvisJet then
		Instance.new("Model",c:WaitForChild("Util")).Name = "Jetpack"
	end

	c:WaitForChild("HumanoidRootPart").ChildAdded:Connect(function(i)
		if tostring(i) == "FlightVelocity" then
			i:GetPropertyChangedSignal("Velocity"):Connect(function()
				if togs.EntitySpeed.Toggled and uis:IsKeyDown(togs.EntitySpeed.Key) then
					i.Velocity = i.Velocity * (togs.EntitySpeed.Rate/20+1)
				end
			end)
		end
	end)
end

local function GetPlr(str)
	for i,v in next, plrs:GetPlayers() do
		if v.Name:lower():find(str:lower()) or v.DisplayName:lower():find(str:lower()) then
			return v
		end
	end
end

local function HasGun(plr)
	local b = plr and plr.Character and plr.Character:FindFirstChildOfClass("Tool")
	if b and b:FindFirstChild("Handle") and b.Handle:FindFirstChild("Reload") then
		return true, b
	end
end

local function CopyNode(plrname) -- i took the Size.(xyz) adding method from luna cuz thats actually pretty smart (everything else original tho)
	local node = workspace.Buildings:FindFirstChild(plrname)
	local r = math.floor
	if node then -- i know ive tried this method before and gave up on it but you can do it gfx!
		local nodepos = node.Node:GetPivot()
		local finalstring = "--[[\nAthena Node Copier remade by GFX\n If you have a node, it will place it there.\nElse it will place where original node was.\n]]\n\nlocal plr = game:GetService(\"Players\").LocalPlayer.Name]\nlocal node = workspace.Buildings[plr] and workspace.Buildings[plr].Node:GetPivot() or CFrame.new("..nodepos..")"
		for i,v in pairs(getnilinstances()) do -- i cant do getnilinstances.Furniture for some reason
			if v.Name == "Furniture" then
				furn = v:GetChildren()
				break
			end

			for i,v in pairs(furn) do
				for i2,v2 in pairs(node:GetChildren()) do
					if r(v2.Size.X+v2.Size+Y+v2.Size.Z) == r(v.Size.X+v.Size.Y+v.Size.Y) then
						-- write thing here when get home
					else
						for int = 0,3,.01 do
							local s1 = r(v.Size.X+v.Size.Y+v.Size.Y)
							local s2 = r(v2.Size.X+v2.Size+Y+v2.Size.Z)
							if s2*int == s1 then
								finalstring = finalstring.."--#"..v.Name.."\nnode:ToWorldSpace(nodepos):ToObjecttSpace("..v2:GetPivot()..")\n"
							end
						end
					end
				end
			end
		end
	end
end

local function GetRandomPart(plr)
    if plr ~= nil and plr.Character then
        local g = {}
        for i,v in pairs(plr.Character.GetChildren(plr.Character)) do
            if v.IsA(v,"BasePart") then
                table.insert(g,v)
            end
        end
        if #g ~= 0 then
            return g[math.random(1,#g)]
        end
    end
end

local function ClosestToMouse()
    local lastdis = 225
    local plr
    for i,v in next, plrs.GetPlayers(plrs) do
        if v ~= lp and v.Character then
            local pos = getpiv(v.Character)
            if ffc(v.Character,"Humanoid") and disfroml(lp,pos.p) < 225 and v.Character.Humanoid.Health ~= 0 and ffc(v.Character,"Head") and v.Character.Head.Transparency < 0.1  then
                local vp,vis = wtvp(cam,pos.p)
                if vis then
                    local mp = uis.GetMouseLocation(uis)
                    local pp = Vector2.new(vp.X,vp.Y)
                    local mp2 = Vector2.new(mp.X,mp.Y)
                    local dis = (mp2 - pp).magnitude

                    if dis < lastdis and dis <= togs.SilentAim.Fov then
                        if (togs.SilentAim.Wallcheck and #raycast(cam,{pos.p},{lp.Character,v.Character,workspace.Vehicles}) < 1) or not togs.SilentAim.Wallcheck then
                            lastdis = dis
                            plr = v
                        end
                    end
                end
            end 
        end
    end

    return plr
end

local function AddUpdate(thing)
	if thing.Parent ~= nil then
		local s1 = Drawing.new("Text")
		local s2 = Drawing.new("Text")
		local t = Drawing.new("Line")
		local con
		con = thing.Parent.ChildRemoved:Connect(function(item)
			if item == thing then
				s1:Remove()
				s2:Remove()
				t:Remove()
				t = nil
				s2 = nil
				s1 = nil
				con:Disconnect()
			end
		end)

		if plrs:FindFirstChild(tostring(thing)) then
			table.insert(espupdates,{
				["Instance"] = thing;
				["string1"] = s1;
				["string2"] = s2;
				["tracer"] = t;
				['esptype'] = 'Player Esp';
			})
			return
		end

		if thing ~= nil and thing.Parent == workspace.MoneyPrinters then
			table.insert(espupdates,{
				["Instance"] = thing;
				["string1"] = s1;
				["string2"] = s2;
				["tracer"] = t;
				['esptype'] = 'Printer Esp';
			})
			return
		end

		if thing ~= nil and thing.Parent == workspace.Entities and thing.Name:find("Shipment") then
			table.insert(espupdates,{
				["Instance"] = thing;
				["string1"] = s1;
				["string2"] = s2;
				["tracer"] = t;
				['esptype'] = 'Shipment Esp';
			})
			return
		end

		if thing ~= nil and thing.Parent == workspace.Entities and thing.Name == "Gun" then
			table.insert(espupdates,{
				["Instance"] = thing;
				["string1"] = s1;
				["string2"] = s2;
				["tracer"] = t;
				['esptype'] = 'Entity Esp';
			})
			return
		end
	end
end

local function EspCheckEnabled(str)
	if esp[str] and esp[str] == true then
		return true
	end
	return false
end

local function Hasnt(inst)
	if inst ~= nil and inst:FindFirstChild("NameTag") and inst.NameTag:FindFirstChild("TextLabel") then
		return inst.NameTag.TextLabel.TextColor3, inst.NameTag
	end
end

local function UpdateEsp(v) -- good luck reading any of this
	if v['tracer'] ~= nil and v['string1'] ~= nil and v['string2'] ~= nil then
		local string1 = ""
		local string2 = ""
		local color
		local instance
		local yp

		if v["esptype"] == "Player Esp" then
			local t = v["Instance"]
			local b = Hasnt(t.Character)
			if t.Character and t.Character:FindFirstChild("Humanoid") then
				string1 = t.Name.." ["..tostring(math.round(t.Character.Humanoid.Health)).."/"..tostring(t.Character.Humanoid.MaxHealth).."]"
				string2 = "Distance: "..tostring(math.round(lp:DistanceFromCharacter(t.Character:GetPivot().p))).." Karma: "..tostring(t.PlayerData.Karma.Value).."\nJob: "..t.Job.Value.." Tool: "..tostring(t.Character:FindFirstChildWhichIsA("Tool"))
				instance = t.Character
				color = b ~= Color3.new(1,1,1) and b ~= nil and b or b == Color3.new(1,1,1) and Color3.fromRGB(34,139,34) or Color3.new(0,0,0)
				yp = true
			else
				return
			end
		end

		if v["esptype"] == "Shipment Esp" then
			local t = v["Instance"]
			string1 = t.Name
			string2 = "Uses: "..tostring(t.Int.Uses.Value).." Locked: "..tostring(t.TrueOwner.Locked.Value)
			instance = t
			color = t:FindFirstChildWhichIsA("BasePart").Color
		end

		if v["esptype"] == "Entity Esp" then
			string1 = v["Instance"].Int.Value
			instance = v["Instance"]
			color = v["Instance"]:FindFirstChildWhichIsA("BasePart").Color
		end

		if v["esptype"] == "Printer Esp" then
			local t = v["Instance"]
			string1 = t.Name
			string2 = "Uses: "..tostring(t.Int.Uses.Value).." Money: "..tostring(t.Int.Money.Value).."\nLocked: "..tostring(t.TrueOwner.Locked.Value)
			instance = t
			color = t:FindFirstChildWhichIsA("BasePart").Color
			yp = true
		end

		local pos,vis = workspace.CurrentCamera:WorldToViewportPoint(instance:GetPivot().p)

		v['string2'].Text = string2
		v['string2'].Position = Vector2.new(pos.x,pos.y)
		v['string2'].Color = Color3.new(1,1,1)
		v['string2'].Outline = true
		v['string2'].Size = 16
		v['string2'].Center = true

		v['string1'].Text = string1
		v['string1'].Color = color
		v['string1'].Outline = true
		v['string1'].Center = true
		v['string1'].Size = 16
		v['string1'].Position = Vector2.new(pos.x,pos.y-v['string2'].TextBounds.Y+(yp and v['string1'].TextBounds.Y or 0))

		v["tracer"].To = Vector2.new(pos.x,pos.y)
		v["tracer"].Color = color
 		v['tracer'].From = (esp.TracerMouse and uis:GetMouseLocation() or Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y - 100))

		v["string1"].Visible = (EspCheckEnabled(v['esptype']) and vis and instance and instance.Parent ~= nil)
		v['string2'].Visible = (EspCheckEnabled(v['esptype']) and vis and instance and instance.Parent ~= nil)
		v['tracer'].Visible = (EspCheckEnabled("Tracers") and EspCheckEnabled(v['esptype']) and vis and instance and instance.Parent ~= nil)
	end
end

local function SemiGod()
	local _,nt = Hasnt(lp.Character)
	if nt then
		nt:Clone().Parent = lp.Character
		nt:Destroy()
	end
end

local function SaveData(ba) 
	local b = ba
	for i,v in pairs(b) do
		if type(v) == 'table' then
			for i2,v2 in pairs(v) do
				if i2 == "Key" and type(v2) ~= "string" then
					b[i][i2] = tostring(v2):sub(14)
					print(b[i][i2],type(b[i][i2]))
				end
			end
		end
	end
	local encode = hts:JSONEncode(b)
    writefile("athenaconfig.lua",encode)
end

local function LoadData()
	if not isfile("athenaconfig.lua") then
		writefile("athenaconfig.lua","")
		return
	end
    local data = hts:JSONDecode(readfile('athenaconfig.lua'))
	for i,v in pairs(data) do
		if type(v) == 'table' then
			for i2,v2 in pairs(v) do
				if i2 == "Key" then
					print(i2,v2)
					data[i][i2] = Enum.KeyCode[v2]
					print(data[i][i2],type(data[i][i2]))
				end
			end
		end
	end
	togs = data
end

local function CheckDrawingExists(check,type)
	for i,v in pairs(espupdates) do
		if v['esptype'] == type and check == v['Instance'] then
			return true
		end
	end
end

for i,v in pairs(plrs:GetChildren()) do
	table.insert(playernames,v.Name)
end

LoadData()

CharacterAdded(lp.Character)
connections["LocalPlayerCharacterAdded"] = lp.CharacterAdded:Connect(CharacterAdded)

connections["InputBegan"] = uis.InputBegan:Connect(function(key,m)
	if not m then
		
	end
end)

connections['DrawingRenderStepped'] = run.RenderStepped:Connect(function(t)
	local mp = uis:GetMouseLocation()
	fovcircle.Visible = togs.SilentAim.FovCircle and togs.SilentAim.Toggled
	fovcircle.Radius = togs.SilentAim.Fov
	fovcircle.Position = Vector2.new(mp.X,mp.Y)
end)

connections["WorkspaceAdded"] = workspace.ChildAdded:Connect(function(child)
	task.wait()
	if child.Name == "NL" and togs.AntiNlr then
		child:Destroy()
	end
end)

connections["KeyDown"] = lp:GetMouse().KeyDown:Connect(function(key)
	if key:byte() == 32 and togs.InfJump then
		lp.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

connections["BackpackAdded"] = lp.Backpack.ChildAdded:Connect(function(item)
	task.wait()
	local b = item.Name:find("Bloxy Cola") and item
	if togs.AutoDrink and item then
		game:GetService("ReplicatedStorage").Events.ToolsEvent:FireServer(4,item)
	end
end)

connections["EntityAdded"] = workspace.Entities.ChildAdded:Connect(function(item)
	task.wait()
	AddUpdate(item)
end)

connections["PrinterAdded"] = workspace.MoneyPrinters.ChildAdded:Connect(function(item)
	task.wait()
	AddUpdate(item)
	if togs.DestroyPrints then
		if table.find({"Soldier","Detective","Mayor"},lp.Job.Value) and lp.Character and lp.Character.PrimaryPart and not Collecting then
			local opos = lp.Character:GetPivot()
			local bat = lp.Backpack:FindFirstChild("["..lp.Job.Value.."] Baton") or lp.Character:FindFirstChild("["..lp.Job.Value.."] Baton")
			if bat then
				Collecting = true
				sv.TweenService:Create(lp.Character.PrimaryPart,TweenInfo.new(.05),{CFrame = item:GetPivot()}):Play()
				task.wait(.05)
				game:GetService("ReplicatedStorage").Events.ToolsEvent:FireServer(11,item)
				task.wait(1)
				sv.TweenService:Create(lp.Character.PrimaryPart,TweenInfo.new(.05),{CFrame = opos}):Play()
				Collecting = false
			end
		end
	end
end)

connections['PlayerAdded'] = plrs.PlayerAdded:Connect(function(player)
	task.wait()
	table.insert(playernames,player.Name)
	AddUpdate(player)
end)

connections['PlayerRemoving'] = plrs.PlayerRemoving:Connect(function(player)
	for i,v in next, playernames do
		if v == player.Name then
			table.remove(playernames,i)
		end
	end
end)

connections['TriggerBotRenderStepped'] = run.RenderStepped:Connect(function()
	if togs.TriggerBot and lp.Character and lp.Character:FindFirstChildOfClass("Tool") then
		local hit = lp:GetMouse().Target
		local pos = lp:GetMouse()
		local dis = (lp.Character:GetPivot().p - lp:GetMouse().Hit.p).magnitude
		if dis <= 200 then
			if hit ~= nil then
				if table.find(playernames,hit:GetFullName():split(".")[2]) then
					mouse1press()
					mouse1release()
				end
			end
		end
	end
end)

connections["NoclipStepped"] = run.Stepped:Connect(function()
	if togs.Noclip.Toggled and uis:IsKeyDown(togs.Noclip.Key) then
		for i,v in next, lp.Character:GetDescendants() do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	end
end)

connections["WalkspeedRenderStepped"] = run.RenderStepped:Connect(function()
	if uis:IsKeyDown(togs.Walkspeed.Key) and togs.Walkspeed.Toggled and not uis:GetFocusedTextBox() then
		local c = lp.Character:GetPivot()
		lp.Character:PivotTo(c + c.LookVector * togs.Walkspeed.Rate)
	end
end)

local lib = ret:Library()

local Player = lib:Window("Player")
local Farm = lib:Window("Farming")
local World = lib:Window("World")
local Render = lib:Window("Render")
local Combat = lib:Window("Combat")
local Util = lib:Window("Utility")
local Set = lib:Window("Settings")

Player:Toggle("Auto Drink",togs.AutoDrink,function(t)
	togs.AutoDrink = t
end)

Player:Button("Invis Jet",function()
	if lp.Character:FindFirstChild("Util") then
		Instance.new("Model",lp.Character.Util).Name = "Jetpack"
	end
end)

Player:Toggle("Auto Invis Jet",togs.AutoInvisJet,function(t)
	togs.AutoInvisJet = t
	if t and lp.Character:FindFirstChild("Uitl") then
		Instance.new("Model",lp.Character.Util).Name = "Jetpack"
	end
end)

Player:Toggle("Infinite Energy",togs.InfEnergy,function(t)
	togs.InfEnergy = t
end)

Player:Toggle("Infinite Jump",togs.InfJump,function(t)
	togs.InfJump = t
end)

Player:Button("Semi-God",SemiGod)

Player:Toggle("Infinite Hunger",togs.InfHunger,function(t)
	togs.InfHunger = t
	lp.PlayerData.Hunger.Value = t and 100 or lp.PlayerData.Hunger.Value
end)

local thing = Player:ToggleDropdown("Auto Semi-God",togs.AutoSemiGod.Toggled,function(t)
	togs.AutoSemiGod.Toggled = t
	local h = lp.Character and lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid
	if h and h.Health <= togs.AutoSemiGod.Rate and t then
		SemiGod()
	end
end)

thing:Slider("Health",1,150,togs.AutoSemiGod.Rate,false,function(t)
	togs.AutoSemiGod.Rate = t
	local h = lp.Character and lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid
	if h and h.Health <= t and togs.AutoSemiGod.Toggled then
		SemiGod()
	end
end)

Player:Toggle("Anti Afk",togs.AntiAfk,function(t)
	togs.AntiAfk = t
	table.foreach(getconnections(lp.Idled),function(s,v)
		v[t and "Disable" or "Enable"](v)
	end)
end)

Player:Button("Spy Watch Bypass",function()
	local i = lp.Character and lp.Character:FindFirstChild("Spy Watch")
	if i then
		sv.ReplicatedStorage.Events.ToolsEvent:FireServer(16,true,i)
	end
end)

local thing = Player:SplitFrame()

thing:Toggle("NoClip",togs.Noclip.Toggled,function(t)
	togs.Noclip.Toggled = t
end)

thing:Keybind("Key",togs.Noclip.Key,function(t)
	togs.Noclip.Key = t
end)

local thing = Player:ToggleDropdown("Walkspeed",togs.Walkspeed.Toggled,function(t)
	togs.Walkspeed.Toggled = t
end)

thing:Keybind("Key",togs.Walkspeed.Key,function(t)
	togs.Walkspeed.Key = t
end)

thing:Slider("Speed",1,15,togs.Walkspeed.Rate,true,function(t)
	togs.Walkspeed.Rate = t
end)

Farm:Label("None of this works")

Farm:Label("as of right now.")

Farm:Toggle("Material Farm",togs.MaterialFarm,function(t)
	togs.MaterialFarm = t
end)

local thing = Farm:ToggleDropdown("Printer Farm",togs.Printers.Toggled,function(t)
	togs.Printers.Toggled = t
end)

thing:Toggle("Basic Printers",togs.Printers.Basic,function(t)
	togs.Printers.Basic = t
end)

thing:Toggle("Void",togs.Printers.Void,function(t)
	togs.Printers.Void = t
end)

Farm:Toggle("Destroy Printers",togs.DestroyPrints,function(t)
	togs.DestroyPrints = t
end)

local thing = Farm:ToggleDropdown("Farm",false,function(t)
	togs.Farm.Toggled = t
	if t then
		local lw
		local be = sv.ReplicatedStorage.Events.BuildingEvent
		local node = workspace.Buildings:FindFirstChild(lp.Name) and workspace.Buildings[lp.Name]
		local nodepiv = workspace.Buildings:FindFirstChild(lp.Name) and game:GetService("Workspace").Buildings[lp.Name].Node:GetPivot()
		if not game:GetService("Workspace").Buildings:FindFirstChild(lp.Name) then
			local pos = CFrame.new(lp.Character:GetPivot().p + Vector3.new(0,600,0))
			be:FireServer(1, "Node", pos)
			node = workspace.Buildings:WaitForChild(lp.Name)
			nodepiv = node:WaitForChild("Node"):GetPivot()
		end
		be:FireServer(1, "Resizable Wall", nodepiv:ToWorldSpace(CFrame.new(-765.164551, 312.565948, -433.252563, 0, 0, 1, 0, 1, -0, -1, 0, 0):ToObjectSpace(CFrame.new(-759.291565, 313.015594, -432.407166, 0, 0, 1, 0, 1, -0, -1, 0, 0))))
		lw = node.ChildAdded:Wait()
		lw.ChildAdded:Wait()
		be:FireServer(5, lw, lw:GetPivot(), nil, BrickColor.new("Camo"), nil, nil, "Grass")
		be:FireServer(7, lw, lw:GetPivot(), nil, Vector3.new(24, 1, 16))
		be:FireServer(1, "Resizable Wall", nodepiv:ToWorldSpace(CFrame.new(-765.164551, 312.565948, -433.252563, 0, 0, 1, 0, 1, -0, -1, 0, 0):ToObjectSpace(CFrame.new(-759.291565, 312.715594, -432.407166, 0, 0, 1, 0, 1, -0, -1, 0, 0))))
		lw = node.ChildAdded:Wait()
		lw.ChildAdded:Wait()
		be:FireServer(5, lw, lw:GetPivot(), nil, BrickColor.new("Pine Cone"), nil, nil, "Grass")
		be:FireServer(7, lw, lw:GetPivot(), nil, Vector3.new(24.5, .6, 16.5))
		be:FireServer(1, "Capital Cargo Station", nodepiv:ToWorldSpace(CFrame.new(-765.164551, 312.565948, -433.252563, 0, 0, 1, 0, 1, -0, -1, 0, 0):ToObjectSpace(CFrame.new(-759.81311, 313.515594, -422.56955, -1, 0, 0, 0, 1, 0, 0, 0, -1))))
		if togs.Farm.Carrot then
			be:FireServer(1, "Carrot Farm", nodepiv:ToWorldSpace(CFrame.new(-765.164551, 312.565948, -433.252563, 0, 0, 1, 0, 1, -0, -1, 0, 0):ToObjectSpace(CFrame.new(-763.581116, 313.515594, -427.847656, -1, 0, 0, 0, 1, 0, 0, 0, -1))))
			be:FireServer(1, "Carrot Farm", nodepiv:ToWorldSpace(CFrame.new(-765.164551, 312.565948, -433.252563, 0, 0, 1, 0, 1, -0, -1, 0, 0):ToObjectSpace(CFrame.new(-755.031921, 313.515594, -427.848389, -1, 0, 0, 0, 1, 0, 0, 0, -1))))
		end

		if togs.Farm.Tomato then
			be:FireServer(1, "Tomato Farm", nodepiv:ToWorldSpace(CFrame.new(-765.164551, 312.565948, -433.252563, 0, 0, 1, 0, 1, -0, -1, 0, 0):ToObjectSpace(CFrame.new(-763.583008, 313.515594, -434.33609, -1, 0, 0, 0, 1, 0, 0, 0, -1))))
			be:FireServer(1, "Tomato Farm", nodepiv:ToWorldSpace(CFrame.new(-765.164551, 312.565948, -433.252563, 0, 0, 1, 0, 1, -0, -1, 0, 0):ToObjectSpace(CFrame.new(-755.032959, 313.515594, -434.336761, -1, 0, 0, 0, 1, 0, 0, 0, -1))))
		end

		if togs.Farm.Corn then
			be:FireServer(1, "Corn Farm", nodepiv:ToWorldSpace(CFrame.new(-765.164551, 312.565948, -433.252563, 0, 0, 1, 0, 1, -0, -1, 0, 0):ToObjectSpace(CFrame.new(-755.018311, 313.515594, -440.827545, -1, 0, 0, 0, 1, 0, 0, 0, -1))))
			be:FireServer(1, "Corn Farm", nodepiv:ToWorldSpace(CFrame.new(-765.164551, 312.565948, -433.252563, 0, 0, 1, 0, 1, -0, -1, 0, 0):ToObjectSpace(CFrame.new(-763.58667, 313.515594, -440.826691, -1, 0, 0, 0, 1, 0, 0, 0, -1))))
		end

		sv.TweenService:Create(lp.Character.PrimaryPart,TweenInfo.new(.05),{CFrame = lw:GetPivot() + lw:GetPivot().UpVector * 5}):Play()
		task.wait(.05)

		for i,v in pairs(node:GetChildren()) do
			task.spawn(function()
				if (v.Name == "Corn Farm" and togs.Farm.Corn) or (v.Name == "Tomato Farm" and togs.Farm.Tomato) or (v.Name == "Carrot Farm" and togs.Farm.Carrot) then
					local cap = node:WaitForChild("Capital Cargo Station",1/0)
					v:WaitForChild("3",1/0):GetPropertyChangedSignal("Transparency"):Connect(function()
						local val = v['3'].Transparency
						if val == 0 then
							if Collecting then repeat task.wait() until not Collecting end
							Collecting = true
							sv.ReplicatedStorage.Events.MenuActionEvent:FireServer(40,v)
							local item = lp.Character.ChildAdded:Wait()
							sv.TweenService:Create(lp.Character.PrimaryPart,TweenInfo.new(.05),{CFrame = cap:GetPivot() + cap:GetPivot().UpVector * 2}):Play()
							item.Parent = lp.Character
							task.delay(.05,function()
								sv.ReplicatedStorage.Events.MenuActionEvent:FireServer(41,cap,item)
								lp.Character.ChildRemoved:Wait()
								sv.TweenService:Create(lp.Character.PrimaryPart,TweenInfo.new(.05),{CFrame = v:GetPivot() + v:GetPivot().UpVector * 1.2}):Play()
								task.delay(.05,function()
									sv.ReplicatedStorage.Events.MenuActionEvent:FireServer(40,v)
								end)
							end)
							Collecting = false
						end
					end)

					Collecting = true
					sv.TweenService:Create(lp.Character.PrimaryPart,TweenInfo.new(.05),{CFrame = v:GetPivot() + v:GetPivot().UpVector * 1.2}):Play()
					task.wait(.05)
					sv.ReplicatedStorage.Events.MenuActionEvent:FireServer(40,v)
					Collecting = false
				end
			end)
		end
	end
end)

thing:Toggle("Corn",togs.Farm.Corn,function(t)
	togs.Farm.Corn = t
	local nodepiv = workspace.Buildings:FindFirstChild(lp.Name) and workspace.Buildings[lp.Name].Node:GetPivot()
	local node = nodepiv and workspace.Buildings[lp.Name]
	if t and nodepiv and togs.Farm.Toggled then
		local be = sv.ReplicatedStorage.Events.BuildingEvent
		be:FireServer(1, "Corn Farm", nodepiv:ToWorldSpace(CFrame.new(-765.164551, 312.565948, -433.252563, 0, 0, 1, 0, 1, -0, -1, 0, 0):ToObjectSpace(CFrame.new(-755.018311, 313.515594, -440.827545, -1, 0, 0, 0, 1, 0, 0, 0, -1))))
		be:FireServer(1, "Corn Farm", nodepiv:ToWorldSpace(CFrame.new(-765.164551, 312.565948, -433.252563, 0, 0, 1, 0, 1, -0, -1, 0, 0):ToObjectSpace(CFrame.new(-763.58667, 313.515594, -440.826691, -1, 0, 0, 0, 1, 0, 0, 0, -1))))
		
		for i,v in pairs(node:GetChildren()) do
			task.spawn(function()
				if v.Name == "Corn Farm" then
					local cap = node:WaitForChild("Capital Cargo Station",1/0)
					v:WaitForChild("3",1/0):GetPropertyChangedSignal("Transparency"):Connect(function()
						local val = v['3'].Transparency
						if val == 0 then
							if Collecting then repeat task.wait() until not Collecting end
							Collecting = true
							sv.ReplicatedStorage.Events.MenuActionEvent:FireServer(40,v)
							local item = lp.Character.ChildAdded:Wait()
							sv.TweenService:Create(lp.Character.PrimaryPart,TweenInfo.new(.05),{CFrame = cap:GetPivot() + cap:GetPivot().UpVector * 2}):Play()
							item.Parent = lp.Character
							task.delay(.05,function()
								sv.ReplicatedStorage.Events.MenuActionEvent:FireServer(41,cap,item)
								lp.Character.ChildRemoved:Wait()
								sv.TweenService:Create(lp.Character.PrimaryPart,TweenInfo.new(.05),{CFrame = v:GetPivot() + v:GetPivot().UpVector * 1.2}):Play()
								task.delay(.05,function()
									sv.ReplicatedStorage.Events.MenuActionEvent:FireServer(40,v)
								end)
							end)
							Collecting = false
						end
					end)

					Collecting = true
					sv.TweenService:Create(lp.Character.PrimaryPart,TweenInfo.new(.05),{CFrame = v:GetPivot() + v:GetPivot().UpVector * 1.2}):Play()
					task.wait(.05)
					sv.ReplicatedStorage.Events.MenuActionEvent:FireServer(40,v)
					Collecting = false
				end
			end)
		end
	end
end)

thing:Toggle("Tomato",togs.Farm.Tomato,function(t)
	togs.Farm.Tomato = t

	local nodepiv = workspace.Buildings:FindFirstChild(lp.Name) and workspace.Buildings[lp.Name].Node:GetPivot()
	local node = nodepiv and workspace.Buildings[lp.Name]
	if t and nodepiv and togs.Farm.Toggled then
		local be = sv.ReplicatedStorage.Events.BuildingEvent
		be:FireServer(1, "Tomato Farm", nodepiv:ToWorldSpace(CFrame.new(-765.164551, 312.565948, -433.252563, 0, 0, 1, 0, 1, -0, -1, 0, 0):ToObjectSpace(CFrame.new(-763.583008, 313.515594, -434.33609, -1, 0, 0, 0, 1, 0, 0, 0, -1))))
		be:FireServer(1, "Tomato Farm", nodepiv:ToWorldSpace(CFrame.new(-765.164551, 312.565948, -433.252563, 0, 0, 1, 0, 1, -0, -1, 0, 0):ToObjectSpace(CFrame.new(-755.032959, 313.515594, -434.336761, -1, 0, 0, 0, 1, 0, 0, 0, -1))))
		
		for i,v in pairs(node:GetChildren()) do
			task.spawn(function()
				if v.Name == "Tomato Farm" then
					local cap = node:WaitForChild("Capital Cargo Station",1/0)
					v:WaitForChild("3",1/0):GetPropertyChangedSignal("Transparency"):Connect(function()
						local val = v['3'].Transparency
						if val == 0 then
							if Collecting then repeat task.wait() until not Collecting end
							Collecting = true
							sv.ReplicatedStorage.Events.MenuActionEvent:FireServer(40,v)
							local item = lp.Character.ChildAdded:Wait()
							sv.TweenService:Create(lp.Character.PrimaryPart,TweenInfo.new(.05),{CFrame = cap:GetPivot() + cap:GetPivot().UpVector * 2}):Play()
							item.Parent = lp.Character
							task.delay(.05,function()
								sv.ReplicatedStorage.Events.MenuActionEvent:FireServer(41,cap,item)
								lp.Character.ChildRemoved:Wait()
								sv.TweenService:Create(lp.Character.PrimaryPart,TweenInfo.new(.05),{CFrame = v:GetPivot() + v:GetPivot().UpVector * 1.2}):Play()
								task.delay(.05,function()
									sv.ReplicatedStorage.Events.MenuActionEvent:FireServer(40,v)
								end)
							end)
							Collecting = false
						end
					end)
				end

				Collecting = true
				sv.TweenService:Create(lp.Character.PrimaryPart,TweenInfo.new(.05),{CFrame = v:GetPivot() + v:GetPivot().UpVector * 1.2}):Play()
				task.wait(.05)
				sv.ReplicatedStorage.Events.MenuActionEvent:FireServer(40,v)
				Collecting = false
			end)
		end
	end
end)

thing:Toggle("Carrot",togs.Farm.Carrot,function(t)
	togs.Farm.Carrot = t

	local nodepiv = workspace.Buildings:FindFirstChild(lp.Name) and workspace.Buildings[lp.Name].Node:GetPivot()
	local node = nodepiv and workspace.Buildings[lp.Name]
	if t and nodepiv and togs.Farm.Toggled then
		local be = sv.ReplicatedStorage.Events.BuildingEvent
		be:FireServer(1, "Carrot Farm", nodepiv:ToWorldSpace(CFrame.new(-765.164551, 312.565948, -433.252563, 0, 0, 1, 0, 1, -0, -1, 0, 0):ToObjectSpace(CFrame.new(-763.581116, 313.515594, -427.847656, -1, 0, 0, 0, 1, 0, 0, 0, -1))))
		be:FireServer(1, "Carrot Farm", nodepiv:ToWorldSpace(CFrame.new(-765.164551, 312.565948, -433.252563, 0, 0, 1, 0, 1, -0, -1, 0, 0):ToObjectSpace(CFrame.new(-755.031921, 313.515594, -427.848389, -1, 0, 0, 0, 1, 0, 0, 0, -1))))
		
		for i,v in pairs(node:GetChildren()) do
			task.spawn(function()
				if v.Name == "Carrot Farm" then
					local cap = node:WaitForChild("Capital Cargo Station",1/0)
					v:WaitForChild("3",1/0):GetPropertyChangedSignal("Transparency"):Connect(function()
						local val = v['3'].Transparency
						if val == 0 then
							if Collecting then repeat task.wait() until not Collecting end
							Collecting = true
							sv.ReplicatedStorage.Events.MenuActionEvent:FireServer(40,v)
							local item = lp.Character.ChildAdded:Wait()
							sv.TweenService:Create(lp.Character.PrimaryPart,TweenInfo.new(.05),{CFrame = cap:GetPivot() + cap:GetPivot().UpVector * 2}):Play()
							item.Parent = lp.Character
							task.delay(.05,function()
								sv.ReplicatedStorage.Events.MenuActionEvent:FireServer(41,cap,item)
								lp.Character.ChildRemoved:Wait()
								sv.TweenService:Create(lp.Character.PrimaryPart,TweenInfo.new(.05),{CFrame = v:GetPivot() + v:GetPivot().UpVector * 1.2}):Play()
								task.delay(.05,function()
									sv.ReplicatedStorage.Events.MenuActionEvent:FireServer(40,v)
								end)
							end)
							Collecting = false
						end
					end)
				end

				Collecting = true
				sv.TweenService:Create(lp.Character.PrimaryPart,TweenInfo.new(.05),{CFrame = v:GetPivot() + v:GetPivot().UpVector * 1.2}):Play()
				task.wait(.05)
				sv.ReplicatedStorage.Events.MenuActionEvent:FireServer(40,v)
				Collecting = false
			end)
		end
	end
end)

World:Toggle("Anti NLR",togs.AntiNlr,function(t)
	togs.AntiNlr = t
end)

World:Toggle("FullBright",togs.FullBright,function(t)
	togs.FullBright = t
end)

for i,v in next, weather do
	World:Button(i,function()
		for i2,v2 in pairs(v) do
			for i3,v3 in pairs(v2) do
				game:GetService("Lighting").Condition.Value = i
				if i2 == "Lighting" then
					game:GetService("Lighting")[i3] = v3
				else
					game:GetService("Lighting")[i2][i3] = v3
				end
			end
		end
	end)
end

World:Toggle("Disable Kill Barriers",togs.DCB,function(t)
	togs.DCB = t
end)

local entspeed = World:ToggleDropdown("Entity Speed",togs.EntitySpeed.Toggled,function(t)
	togs.EntitySpeed.Toggled = t
end)

entspeed:Slider("Speed",1,15,togs.EntitySpeed.Rate,togs.EntitySpeed.Rate,function(t)
	togs.EntitySpeed.Rate = t
end)

entspeed:Keybind("Keybind",togs.EntitySpeed.Key,function(t)
	togs.EntitySpeed.Key = t
end)

local thing = Render:ToggleDropdown("Cursor",togs.Cursor.Toggled,function(t)
	togs.Cursor.Toggled = t
end)

thing:TextBox("Cursor Id",{},function(t)
	togs.Cursor.Id = t
end)

Render:Toggle("Player Esp",esp["Player Esp"],function(t)
	esp["Player Esp"] = t
	for i,v in next, plrs:GetPlayers() do
		if CheckDrawingExists(v,"Player Esp") or not t then continue end
		if v ~= lp then
			AddUpdate(v)
		end
	end
end)

Render:Toggle("Entity Esp",esp["Entity Esp"],function(t)
	esp["Entity Esp"] = t
	for i,v in next, workspace.Entities:GetChildren() do
		if CheckDrawingExists(v,"Entity Esp") or not t then continue end
		if v.Name == "Gun" then
			AddUpdate(v)
		end
	end
end)

Render:Toggle("Shipment Esp",esp["Shipment Esp"],function(t)
	esp["Shipment Esp"] = t
	for i,v in next, workspace.Entities:GetChildren() do
		if CheckDrawingExists(v,"Shipment Esp") or not t then continue end
		if v.Name:find("Shipment") then
			AddUpdate(v)
		end
	end
end)

Render:Toggle("Printer Esp",esp["Printer Esp"],function(t)
	esp["Printer Esp"] = t
	for i,v in next, workspace.MoneyPrinters:GetChildren() do
		if CheckDrawingExists(v,"Printer Esp") or not t then continue end
		AddUpdate(v)
	end
end)

Render:Toggle("Tracers",esp.Tracers,function(t)
	esp["Tracers"] = t
end)

Combat:Toggle("Trigger Bot",togs.TriggerBot,function(t)
	togs.TriggerBot = t
end)

Combat:Toggle("No Camera Shake",togs.NCS,function(t)
	togs.NCS = t
	getrenv()._G.CSH = t and function()end or oldshake
end)

Combat:Button("Sniper Shotgun",function()
	local th = lp.Character and lp.Character:FindFirstChild("Remington")
	if th and th:FindFirstChild("LocalScript") then
		th.Parent = lp.Backpack
		th.LocalScript:Destroy()
		require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("TS"):WaitForChild("SHT")).Initiate(th, 2.1, 6, 0.4, 20, 0, 4, nil, nil, "Heavy Ammo")
		th.Parent = lp.Character
		lib:Note("Athena Client","Sniper Shotgunfied")
	end
end)

Combat:Toggle("Auto Reload",togs.AutoReload,function(t)
	togs.AutoReload = t
end)

Combat:Button("Weapon Multiplier",function()
	local th = lp.Character and lp.Character:FindFirstChildWhichIsA("Tool")
	if th and th:FindFirstChild("LocalScript") then
		th.LocalScript:Clone().Parent = th
		lib:Note("Athena Client","Weapon Multiplied")
	end
end)

local thing = Combat:ToggleDropdown("Silent Aim",togs.SilentAim.Toggled,function(t)
	togs.SilentAim.Toggled = t
end)

thing:Toggle("Fov Circle",togs.SilentAim.FovCircle,function(t)
	togs.SilentAim.FovCircle = t
end)

thing:Slider("Fov Size",1,750,togs.SilentAim.Fov,togs.SilentAim.Fov,function(t)
	togs.SilentAim.Fov = t
end)

thing:Toggle("No Spread",togs.SilentAim.NoSpread,function(t)
	togs.SilentAim.NoSpread = t
end)

thing:Toggle("Wallcheck",togs.SilentAim.Wallcheck,function(t)
	togs.SilentAim.Wallcheck = t
end)

local killaura = Combat:ToggleDropdown("Kill Aura",togs.Killaura,function(t)
	togs.Killaura = t
end)

killaura:Button("Whitelist Player",function()
	if PlayerSelected then
		local kaw = togs.KillauraWhitelist
		local t = table.find(kaw,PlayerSelected)
		if t then
			table.remove(kaw,t)
			lib:Note("Athena Client","Removed Killaura Whitelist")
			return
		end
		table.insert(kaw,PlayerSelected)
		lib:Note("Athena Client","Added Killaura Whitelist")
	end
end)

local healaura = Combat:ToggleDropdown("Heal Aura",togs.Healaura,function(t)
	togs.Healaura = t
end)

healaura:Button("Blacklist Player",function()
	if PlayerSelected then
		local kaw = togs.HealauraBlacklist
		local t = table.find(kaw,PlayerSelected)
		if t then
			table.remove(kaw,t)
			lib:Note("Athena Client","Removed Healaura Blacklist")
			return
		end
		table.insert(kaw,PlayerSelected)
		lib:Note("Athena Client","Added Healaura Blacklist")
	end
end)

Combat:Button("Kill Player",function()
	if PlayerSelected then
		local p = PlayerSelected
		local _,gun = HasGun(lp)
		if gun then
			while task.wait(gun:GetAttribute("BulletPerSecond")) do
				if not p.Character or not p.Character:FindFirstChild("Humanoid") or p.Character.Humanoid.Health == 0 or disfroml(lp,p.Character:GetPivot().p) > 225 or not HasGun(lp) or gun:GetAttribute("Ammo") == 0 and ffc(v.Character,"Head") then
					break
				end
				shoot(p.Character.Head:GetPivot(),gun:GetAttribute("Damage"),0,gun.Name:find("Laser Musket") and "LMF" or nil,1)
			end
		end
	end	
end)

Util:Button("Copy Node (w.i.p)",function()
	if PlayerSelected then
		CopyNode(PlayerSelected.Name)
	end
end)

Util:Button("Copy Song",function()
	if PlayerSelected and workspace.Buildings:FindFirstChild(PlayerSelected.Name) and workspace.Buildings[PlayerSelected.Name]:FindFirstChild("Jukebox") then
		writefile(PlayerSelected.Name.."'s Jukebox Id ["..math.random(1,10000).."]",tostring(workspace.Buildings[PlayerSelected.Name].Jukebox.Speaker.Sound.SoundId))
	end
end)

Util:Button("Copy Outfit",function()
	if PlayerSelected then
		writefile(PlayerSelected.Name.."'s Outfit ["..math.random(1,10000).."]",tostring(PlayerSelected.PlayerData.Outfit.Value))
	end
end)

Util:Toggle("Admin Notifier",togs.AdminNotifier,function(t)
	togs.AdminNotifier = t
end)

Set:TextBox("Players Name","players",function(t)
	PlayerSelected = GetPlr(t)
end)

task.spawn(function()
	while task.wait() do
		for i,v in pairs(espupdates) do
			pcall(UpdateEsp,v)
		end
	end
end)

task.spawn(function()
	while task.wait(2/2*2) do
		SaveData(togs)
	end
end)

task.spawn(function()
	while task.wait(.2) do
		for i,v in pairs(plrs:GetPlayers()) do
			if togs.Killaura then
				local nt,hnt = Hasnt(v.Character)
				local hg,g = HasGun(lp)
				if v ~= lp and v.Character and hg and g:GetAttribute("Ammo") ~= 0 and hnt and ffc(v.Character,"Head") then 
					if ffc(v.Character,"Humanoid") and v.Character.Humanoid.Health ~= 0 and nt == Color3.fromRGB(255,33,33) then 
						if disfroml(lp,v.Character:GetPivot().p) <= 225 and not table.find(togs.KillauraWhitelist or {},v.Name) then
							local ray = raycast(workspace.CurrentCamera,{v.Character:GetPivot().p},{lp.Character,v.Character,workspace.Vehicles})
							if #ray == 0 then
								shoot(v.Character.Head:GetPivot().p,g:GetAttribute("Damage"),0,g.Name:find("Laser Musket") and "LMF" or nil,1)
							end
						end
					end
				end
			end

			if togs.Healaura then
				local medigun = lp.Character and (lp.Character:FindFirstChild("MediGun") or lp.Character:FindFirstChild("[Doctor] MediGun"))
				if medigun and v ~= lp and v.Character and ffc(v.Character,"Humanoid") and v.Character.Humanoid.Health ~= 0 then
					if disfroml(lp,v.Character:GetPivot().p) <= 20 and not table.find(togs.HealauraBlacklist or {},v.Name) then
						if v.Character.Humanoid.Health ~= 0 and v.Character.Humanoid.Health ~= v.Character.Humanoid.MaxHealth then
							for i = 1,35 do
								sv.ReplicatedStorage.Events.ToolsEvent:FireServer(5,v.Character.Humanoid)
								task.wait(.043)
								sv.ReplicatedStorage.Events.ToolsEvent:FireServer(5,medigun)
							end
						end
					end
				end
			end
		end
	end
end)

local old2; old2 = hookmetamethod(game,"__index",function(...)
	local args = {...}
	local value = old2(unpack(args))
	local ns = tostring(args[1])
	local v = args[2]
	local i = args[1]
	local cs = getcallingscript()

	if not checkcaller() then
		if togs.SilentAim.Toggled and not togs.SilentAim.NoSpread and v == "Hit" and i == lp:GetMouse() and cs.Parent and cs.Parent:IsA("Tool") then
			local c = ClosestToMouse()
			local r = GetRandomPart(c)
			if c and r then
				return r:GetPivot()
			end
		end

		if v == "Value" then
			if togs.InfHunger and ns == "Hunger" then
				return 100
			end

			if togs.InfEnergy and ns == "GadgetFuel" then
				return 1000
			end
		end

		if togs.EntitySpeed.Toggled then
			if v == "Velocity" then
				if i:GetFullName():find("Vehicles") then
					if value.magnitude > 500 then
						return Vector3.new()
					end

					local seat = lp.Character.Humanoid.SeatPart
					if seat and seat:GetFullName():find("Vehicles") and uis:IsKeyDown(togs.EntitySpeed.Key) then
						local part = seat.Parent:FindFirstChild("Main")
						part:ApplyImpulse(part:GetPivot().lookVector * togs.EntitySpeed.Rate/10 * ((uis:IsKeyDown(Enum.KeyCode.W) and 1000) or (uis:IsKeyDown(Enum.KeyCode.S) and -1000) or 1))
					end
				end
			end
		end
	end

	return old2(...)
end)

local nch; nch = hookmetamethod(game,"__namecall",function(s,...)
	local args = {...}
    local cs = getcallingscript()
	local gnm = getnamecallmethod()
	local cc = checkcaller()
	local ns = tostring(s)

	if gnm == "FireServer" and ns == "MenuActionEvent" then
		if args[1] == 33 and togs.AutoReload then
			local ga = args[6].GetAttribute
			local ev = s.Parent.WeaponReloadEvent
			args[6].SetAttribute(args[6],"Ammo",ga(args[6],"MaxAmmo")+1)
			ev.FireServer(ev,ga(args[6],"AmmoType"),1,args[6])
		end

		if args[1] == 26 then
			return
		end
	end

	if not cc and gnm == "FindPartOnRayWithIgnoreList" and togs.SilentAim.Toggled and togs.SilentAim.NoSpread and cs and cs.Parent and cs.Parent.IsA(cs.Parent,"Tool") and cs.IsA(cs,"LocalScript") then
        local clos = ClosestToMouse()
        local part = GetRandomPart(clos)
        if clos and part then
            return part,part.GetPivot(part).p,Vector3.new(0,0,0)
        end
    end

	if gnm == "Destroy" and ns == "Humanoid" and togs.DCB then
		return
	end

	if not cc and gnm == "Raycast" and cs and cs.Parent == game.ReplicatedStorage.Modules.TS and togs.SilentAim.Toggled then
		local clos = ClosestToMouse()
		local part = GetRandomPart(clos)
		return {Instance = part,Position = part.Position,Normal = Vector3.new(0,0,0)}
	end

	if not cc and gnm == "Destroy" and ns == "Humanoid" then
		return
	end

    return nch(s,...)
end)
