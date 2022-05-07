local ret = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/GFXTI/d/main/AthenaUi.lua"))()
local togs = {
    SilentAim = {
        Toggled = false;
        Fov = 150;
        Wallcheck = false;
        FovCircle = false;
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
    NoSpread = false;
	InfJump = false;
	TriggerBot = false;
	InfHunger = false;
	Killaura = false;
	AutoReload = false;
	AutoDrink = false;
	InfEnergy = false;
	NCS = false;
}
local PlayerSelected

local esp = togs.Esp

local fovcircle = Drawing.new("Circle")
fovcircle.NumSides = 150
fovcircle.Color = Color3.fromRGB(46,59,145)
fovcircle.Thickness = 2

local oldshake = getrenv()._G.CSH

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

local things = {}

for i = 1,127 do
    table.insert(things,string.char(i))
end

local function rstring()
    local b = math.random(5,20)
    local s = ""
    
    for i = 1,b do
        s = s..things[math.random(1,127)]
    end
    
    return s
end

game:GetService("RunService"):BindToRenderStep(rstring().."FovCircle",0,function()
    local mp = uis:GetMouseLocation()
    fovcircle.Visible = togs.SilentAim.FovCircle and togs.SilentAim.Toggled
    fovcircle.Radius = togs.SilentAim.Fov
    fovcircle.Position = Vector2.new(mp.X,mp.Y)
end)

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
    local lastdis = math.huge
    local plr
    for i,v in next, plrs.GetPlayers(plrs) do
        if v ~= lp and v.Character then
            local pos = getpiv(v.Character)
            if ffc(v.Character,"Humanoid") and v.Character.Humanoid.Health ~= 0 and disfroml(lp,pos.p) <= 200 then
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
				["Player"] = thing;
				["string1"] = s1;
				["string2"] = s2;
				["tracer"] = t;
				['esptype'] = 'Player Esp';
			})
			return
		end

		if thing ~= nil and thing.Parent == workspace.MoneyPrinters then
			table.insert(espupdates,{
				["Printer"] = thing;
				["string1"] = s1;
				["string2"] = s2;
				["tracer"] = t;
				['esptype'] = 'Printer Esp';
			})
			return
		end

		if thing ~= nil and thing.Parent == workspace.Entities and thing.Name:find("Shipment") then
			table.insert(espupdates,{
				["Shipment"] = thing;
				["string1"] = s1;
				["string2"] = s2;
				["tracer"] = t;
				['esptype'] = 'Shipment Esp';
			})
			return
		end

		if thing ~= nil and thing.Parent == workspace.Entities and thing.Name == "Gun" then
			table.insert(espupdates,{
				["Entity"] = thing;
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
	if inst:FindFirstChild("NameTag") and inst.NameTag:FindFirstChild("TextLabel") then
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
			local t = v["Player"]
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
			local t = v["Shipment"]
			string1 = t.Name
			string2 = "Uses: "..tostring(t.Int.Uses.Value).." Locked: "..tostring(t.TrueOwner.Locked.Value)
			instance = t
			color = t:FindFirstChildWhichIsA("BasePart").Color
		end

		if v["esptype"] == "Entity Esp" then
			string1 = v["Entity"].Int.Value
			instance = v["Entity"]
			color = v["Entity"]:FindFirstChildWhichIsA("BasePart").Color
		end

		if v["esptype"] == "Printer Esp" then
			local t = v["Printer"]
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

local function SaveData(data) -- this is a sign of me being super tired and trying to make a save data 
	local fs = ""
	local t = typeof
	for i,v in pairs(togs) do
		if table.find({"EnumItem","boolean","number"},t(v)) then
			fs = fs..(' '):rep(4)..'["'..i..'"]'.." = "..tostring(v)..";\n"
			continue
		end

		if t(v) == "string" then
			fs = fs..(' '):rep(4)..'["'..i..'"]'.." = \""..v.."\";\n"
			continue
		end

		if t(v) == "table" then
			fs = fs..(' '):rep(4)..'["'..i..'"]'.." = {\n"

			for i2,v2 in pairs(v) do
				if table.find({"EnumItem","boolean","number"},t(v2)) then
					fs = fs..(' '):rep(4)..'["'..i2..'"]'.." = "..tostring(v2)..";\n"
					continue
				end
			end

			if t(v) == "string" then
				fs = fs..(' '):rep(4)..'["'..i..'"]'.." = \""..v.."\";\n"
				continue
			end

			fs = fs..'};\n'
		end
	end
    writefile("athenaconfig.lua","return {\n"..fs.."\n}")
end

local function LoadData()
	if not isfile("athenaconfig.lua") then
		writefile("athenaconfig.lua","")
		return
	end
    local data = loadstring(readfile("athenaconfig.lua"))() -- cuz krnl just never thought of loadfile...
	togs = data
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

connections["WorkspaceAdded"] = workspace.ChildAdded:Connect(function(child)
	task.wait()
	if child.Name == "NL" then
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
end)

connections["EntityAdded"] = workspace.Entities.ChildAdded:Connect(function(item)
	task.wait()
	AddUpdate(item)
end)

connections["PrinterAdded"] = workspace.MoneyPrinters.ChildAdded:Connect(function(item)
	task.wait()
	AddUpdate(item)
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
	if uis:IsKeyDown(togs.Walkspeed.Key) and not uis:GetFocusedTextBox() then
		local c = lp.Character:GetPivot()
		lp.Character:PivotTo(c + c.LookVector * togs.Walkspeed.Rate)
	end
end)

local lib = ret:Library()

local Player = lib:Window("Player")
local World = lib:Window("World")
local Render = lib:Window("Render")
local Combat = lib:Window("Combat")
local Config = lib:Window("Config")
local Misc = lib:Window("Misc")

Player:Toggle("Auto Drink",togs.AutoDrink,function(t)
	togs.AutoDrink = t
end)

local entspeed = Player:ToggleDropdown("Entity Speed",togs.EntitySpeed.Toggled,function(t)
	togs.EntitySpeed.Toggled = t
end)

entspeed:Slider("Speed",1,15,togs.EntitySpeed.Rate,togs.EntitySpeed.Rate,function(t)
	togs.EntitySpeed.Rate = t
end)

entspeed:Keybind("Keybind",togs.EntitySpeed.Key,function(t)
	togs.EntitySpeed.Key = t
end)

Player:Toggle("Infinite Energy",togs.InfEnergy,function(t)
	togs.InfEnergy = t
end)

Player:Toggle("Infinite Jump",togs.InfJump,function(t)
	togs.InfJump = t
end)

Player:Toggle("Anti Nlr",togs.AntiNlr,function(t)
	togs.AntiNlr = t
end)

Player:Button("Semi-God",SemiGod)

Player:Toggle("Infinite Hunger",togs.InfHunger,function(t)
	togs.InfHunger = t
	lp.PlayerData.Hunger.Value = 100
end)

local thing = Player:ToggleDropdown("Auto Semi-God",togs.AutoSemiGod.Toggled,function(t)
	togs.AutoSemiGod.Toggled = t
	local h = lp.Charactr and lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid
	if h and h.Health <= togs.AutoSemiGod.Rate and t then
		SemiGod()
	end
end)

thing:Slider("Health",1,150,togs.AutoSemiGod.Rate,false,function(t)
	togs.AutoSemiGod.Rate = t
	local h = lp.Charactr and lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid
	if h and h.Health <= t and togs.AutoSemiGod.Toggled then
		SemiGod()
	end
end)

Player:Button("Incognito Mode",function()

end)

Player:Toggle("Anti Afk",togs.AntiAfk,function(t)
	togs.AntiAfk = t
	table.foreach(getconnections(lp.Idled),function(s,v)
		v[t and "Disable" or "Enable"](v)
	end)
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

local thing = Render:ToggleDropdown("Cursor",togs.Cursor.Toggled,function(t)
	togs.Cursor.Toggled = t
end)

thing:TextBox("Cursor Id",{},function(t)
	togs.Cursor.Id = t
end)

Render:Slider("Refresh Rate",0,10,0,true,function(t)
	esp["Refresh Rate"] = t
end)

Render:Toggle("Player Esp",esp["Player Esp"],function(t)
	esp["Player Esp"] = t
	for i,v in next, plrs:GetPlayers() do
		if v ~= lp then
			AddUpdate(v)
		end
	end
end)

Render:Toggle("Entity Esp",esp["Entity Esp"],function(t)
	esp["Entity Esp"] = t
	for i,v in next, workspace.Entities:GetChildren() do
		if v.Name == "Gun" then
			AddUpdate(v)
		end
	end
end)

Render:Toggle("Shipment Esp",esp["Shipment Esp"],function(t)
	esp["Shipment Esp"] = t
	for i,v in next, workspace.Entities:GetChildren() do
		if v.Name:find("Shipment") then
			AddUpdate(v)
		end
	end
end)

Render:Toggle("Printer Esp",esp["Printer Esp"],function(t)
	esp["Printer Esp"] = t
	for i,v in next, workspace.MoneyPrinters:GetChildren() do
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

Combat:Toggle("No Spread",togs.NoSpread,function(t)
	togs.NoSpread = t
end)

Combat:Button("Sniper Shotgun",function()
	local th = lp.Character and lp.Character:FindFirstChild("Remington")
	if th and th:FindFirstChild("LocalScript") then
		th.LocalScript:Destroy()
		require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("TS"):WaitForChild("SHT")).Initiate(th, 2.1, 6, 0.4, 20, 0, 4, nil, nil, "Heavy Ammo")
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

thing:Toggle("Wallcheck",togs.SilentAim.Wallcheck,function(t)
	togs.SilentAim.Wallcheck = t
end)

local killaura = Combat:ToggleDropdown("Kill Aura",togs.Killaura,function(t)
	togs.Killaura = t
end)

killaura:Button("Whitelist Player",function()
	
end)

Combat:Button("Kill Player",function()
	
end)

task.spawn(function()
	while task.wait(esp["Refresh Rate"]) do
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

local old2; old2 = hookmetamethod(game,"__index",function(...)
	local args = {...}
	local value = old2(unpack(args))
	local ns = tostring(args[1])
	local v = args[2]
	local i = args[1]
	local cs = getcallingscript()

	if not checkcaller() then
		if togs.SilentAim.Toggled and v == "Hit" and i == lp:GetMouse() and cs.Parent and cs.Parent:IsA("Tool") then
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

local mrh; mrh = hookfunction(math.random,function(...)
    local cs = getcallingscript()
    local a = {...}
    if togs.NoSpread and cs and cs.Parent and cs:IsA('LocalScript') and not table.find(a,1) and not checkcaller() then
        return 0
    end

    return mrh(...)
end) -- jam told me this method :popcorn:

local nch; nch = hookmetamethod(game,"__namecall",function(s,...)
	local args = {...}
    local cs = getcallingscript()
	local gnm = getnamecallmethod()
	local cc = checkcaller()
	local ns = tostring(s)

	if gnm == "FireServer" and ns == "MenuActionEvent" and args[1] == 33 and togs.AutoReload then
		local am = tostring(args[6].GetAttribute(args[6],"Ammo"))
		if am == '1' or am == '0' then
			task.spawn(function()
				task.wait(.2)
				keypress(0x52)
				task.wait()
				keyrelease(0x52)
			end)
		end
	end

	if gnm == "FireServer" and ns == "MenuActionEvent" then
		if args[1] == 33 and togs.AutoReload then
			local am = tostring(args[6].GetAttribute(args[6],"Ammo"))
			if am == '1' or am == '0' then
				task.spawn(function()
					task.wait(.2)
					keypress(0x52)
					task.wait()
					keyrelease(0x52)
				end)
			end
		end

		if args[1] == 26 then
			return
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

