---@diagnostic disable: undefined-global

local t = {}

function t:Library()
    local UI = {}
    
    local PaaUi = Instance.new("ScreenGui",game:GetService("CoreGui"))
    local main = Instance.new("Frame",PaaUi)
    local UICorner = Instance.new("UICorner",main)
    local Logo = Instance.new("TextButton",main)
    local Tabs = Instance.new("ScrollingFrame",main)
    local UIListLayout = Instance.new("UIListLayout",Tabs)
    local UIPadding = Instance.new("UIPadding",Tabs)
    local TabText = Instance.new("TextLabel",main)
    local Intro = Instance.new("TextLabel",main)
    
    PaaUi.Name = "PaaUi"
    PaaUi.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    main.Name = "main"
    main.BackgroundColor3 = Color3.fromRGB(0, 111, 167)
    main.Position = UDim2.new(0.175084502, 0, 0.240490794, 0)
    main.Size = UDim2.new(0, 595, 0, 400)
    
    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = main
    
    Logo.Name = "Logo"
    Logo.Parent = main
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.Position = UDim2.new(0.0158415847, 0, 0.0308641978, 0)
    Logo.Size = UDim2.new(0, 88, 0, 50)
    Logo.Font = Enum.Font.SciFi
    Logo.Text = "PAA"
    Logo.TextColor3 = Color3.fromRGB(0, 0, 0)
    Logo.TextSize = 50.000
    
    Tabs.Name = "Tabs"
    Tabs.Parent = main
    Tabs.Active = true
    Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabs.BackgroundTransparency = 1.000
    Tabs.BorderSizePixel = 0
    Tabs.Position = UDim2.new(0.0130000003, 0, 0.185185164, 0)
    Tabs.Size = UDim2.new(0, 88, 0, 307)
    Tabs.ScrollBarThickness = 4
    Tabs.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
    
    UIListLayout.Parent = Tabs
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)
    
    UIPadding.Parent = Tabs
    UIPadding.PaddingBottom = UDim.new(0, 5)
    UIPadding.PaddingLeft = UDim.new(0, 5)
    UIPadding.PaddingRight = UDim.new(0, 5)
    UIPadding.PaddingTop = UDim.new(0, 5)
    
    TabText.Name = "TabText"
    TabText.Parent = main
    TabText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabText.BackgroundTransparency = 1.000
    TabText.Position = UDim2.new(0.728332758, 0, 0.0302607417, 0)
    TabText.Size = UDim2.new(0, 147, 0, 50)
    TabText.Font = Enum.Font.SourceSansBold
    TabText.Text = "Settings"
    TabText.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabText.TextScaled = true
    TabText.TextSize = 14.000
    TabText.TextStrokeTransparency = 0.500
    TabText.TextWrapped = true
    
    Intro.Name = "Intro"
    Intro.Parent = main
    Intro.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Intro.BackgroundTransparency = 1.000
    Intro.Position = UDim2.new(0.183933377, 0, 0.0302607417, 0)
    Intro.Size = UDim2.new(0, 324, 0, 50)
    Intro.Font = Enum.Font.SourceSansBold
    Intro.Text = "Hello, "..game:GetService("Players").LocalPlayer.Name
    Intro.TextColor3 = Color3.fromRGB(255, 255, 255)
    Intro.TextSize = 30.000
    Intro.TextStrokeTransparency = 0.500
    Intro.TextWrapped = true
    Intro.TextXAlignment = Enum.TextXAlignment.Left
    
    function UI:Tab()
    	local self = {}
    
    	local Tab = Instance.new("Frame")
    	local UICorner = Instance.new("UICorner")
    	local UIPadding = Instance.new("UIPadding")
    	local UIGridLayout = Instance.new("UIGridLayout")
    
    	local Example = Instance.new("TextButton")
    	local UICorner = Instance.new("UICorner")
    	
    	function self:Slider(name,min,max,default,var,f)
    		--[[ I TAKE NO CREDIT FOR THE SLIDER FUNCTION. I AM NOT THAT SMART. ]]
    
    		local self2 = {}
    		local con
    
    		local Slider = Instance.new("Frame")
    		local SliderCorner = Instance.new("UICorner")
    		local _1 = Instance.new("TextLabel")
    		local _2 = Instance.new("TextBox")
    		local Frame = Instance.new("Frame")
    		local SliderCorner_2 = Instance.new("UICorner")
    		local ImageButton = Instance.new("ImageButton")
    
    		Slider.Name = "Slider"
    		Slider.Parent = Tab
    		Slider.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    		Slider.Size = UDim2.new(0, 100, 0, 100)
    
    		SliderCorner.CornerRadius = UDim.new(0, 4)
    		SliderCorner.Name = "SliderCorner"
    		SliderCorner.Parent = Slider
    
    		_1.Name = "1"
    		_1.Parent = Slider
    		_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    		_1.BackgroundTransparency = 1.000
    		_1.Size = UDim2.new(0, 95, 0, 23)
    		_1.Font = Enum.Font.SourceSansBold
    		_1.Text = tostring(name)
    		_1.TextColor3 = Color3.fromRGB(255, 255, 255)
    		_1.TextScaled = true
    		_1.TextSize = 14.000
    		_1.TextStrokeTransparency = 0.500
    		_1.TextWrapped = true
    
    		_2.Name = "2"
    		_2.Parent = Slider
    		_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    		_2.BackgroundTransparency = 1.000
    		_2.Position = UDim2.new(0.730769217, 0, 0, 0)
    		_2.Size = UDim2.new(0, 39, 0, 23)
    		_2.Font = Enum.Font.SourceSansLight
    		_2.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
    		_2.Text = default
    		_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    		_2.TextScaled = true
    		_2.TextSize = 14.000
    		_2.TextStrokeTransparency = 0.500
    		_2.TextWrapped = true
    
    		Frame.Parent = Slider
    		Frame.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
    		Frame.Position = UDim2.new(0, 0, 0.625, 0)
    		Frame.Size = UDim2.new(0, 133, 0, 15)
    
    		SliderCorner_2.CornerRadius = UDim.new(0, 15)
    		SliderCorner_2.Name = "SliderCorner"
    		SliderCorner_2.Parent = Frame
    
    		ImageButton.Parent = Frame
    		ImageButton.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
    		ImageButton.BackgroundTransparency = 1.000
    		ImageButton.Size = UDim2.new(0, 15, 0, 15)
    		ImageButton.Image = "rbxassetid://971251927"
    		ImageButton.ImageColor3 = Color3.fromRGB(0, 85, 127)
    
    		game:GetService("UserInputService").InputEnded:Connect(function(m)
    			if m.UserInputType == Enum.UserInputType.MouseButton1 then
    				if con then
    					con:Disconnect()
    					con = nil
    				end
    			end
    		end)
    
    
    		ImageButton.MouseButton1Down:Connect(function()
    			if con then
    				con:Disconnect()
    			end
    
    			con = game:GetService("RunService").Heartbeat:Connect(function()
    				local m = game:GetService("UserInputService"):GetMouseLocation()
    				local r = math.clamp((m.X - ImageButton.AbsolutePosition.X)/(Slider.AbsoluteSize.X),0,1)
    				local vtn = min + (max - min)*r
    
    				vtn = math.clamp(vtn,min,max)
    
    				_2.Text = vtn .. "/" ..max
    
    				f(vtn)
    				var = vtn
    				_2.Text = vtn
    			end)
    		end)
    
    		function self2:Call(v)
    			local percent = 1 - ((max - v)/(max - min))
    			local Number = v
    
    			Number = math.round(Number)
    
    			var = Number
    			ImageButton.Size = UDim2.new(percent,0,0,15)
    			f(var)
    			_2.Text = Number .. "/" .. max
    		end
    
    		_2.Changed:Connect(function()
    			pcall(function()
    				local Value = tonumber(_2.Text)
    				if Value >= min and Value <= max then
    					self2:Call(tonumber(_2.Text))
    				end
    			end)
    		end)
    
    		_2.FocusLost:Connect(function()
    			self2:Call(tonumber(_2.Text))
    		end)
    
    		return self2
    	end
    	
    	function self:Dropdown(name,tbl,f)
    		local self2 = {}
    		local options = {}
    		local tblopen = false
    
    		local List = Instance.new("Frame")
    		local ListCorner = Instance.new("UICorner")
    		local _1 = Instance.new("TextButton")
    		local Dropdown = Instance.new("Frame")
    		local DropdownListLayout = Instance.new("UIListLayout")
    		local DropdownCorner = Instance.new("UICorner")
    		local DropdownPadding = Instance.new("UIPadding")
    
    		List.Name = "List"
    		List.Parent = Tab
    		List.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    		List.Position = UDim2.new(0.286103547, 0, 0, 0)
    		List.Size = UDim2.new(0, 130, 0, 40)
    
    		ListCorner.CornerRadius = UDim.new(0, 4)
    		ListCorner.Name = "ListCorner"
    		ListCorner.Parent = List
    
    		_1.Name = "1"
    		_1.Parent = List
    		_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    		_1.BackgroundTransparency = 1.000
    		_1.Position = UDim2.new(0.00717186043, 0, 0, 0)
    		_1.Size = UDim2.new(0, 132, 0, 40)
    		_1.Font = Enum.Font.SourceSansBold
    		_1.Text = tostring(name)
    		_1.TextColor3 = Color3.fromRGB(255, 255, 255)
    		_1.TextScaled = true
    		_1.TextSize = 14.000
    		_1.TextStrokeTransparency = 0.500
    		_1.TextWrapped = true
    
    		Dropdown.Name = "Dropdown"
    		Dropdown.Parent = List
    		Dropdown.BackgroundColor3 = Color3.fromRGB(0, 106, 159)
    		Dropdown.BackgroundTransparency = 0.250
    		Dropdown.Position = UDim2.new(0.00717186043, 0, 1.10000002, 0)
    		Dropdown.Size = UDim2.new(0, 130, 0, 35)
    
    		DropdownListLayout.Name = "DropdownListLayout"
    		DropdownListLayout.Parent = Dropdown
    		DropdownListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    		DropdownListLayout.Padding = UDim.new(0, 2)
    
    		DropdownCorner.Name = "DropdownCorner"
    		DropdownCorner.Parent = Dropdown
    
    		DropdownPadding.Name = "DropdownPadding"
    		DropdownPadding.Parent = Dropdown
    		DropdownPadding.PaddingBottom = UDim.new(0, 5)
    		DropdownPadding.PaddingTop = UDim.new(0, 5)
    
    		function self2:AddOption(thing)
    			local Option = Instance.new("TextButton")
    			local OptionCorner = Instance.new("UICorner")
    
    			Option.Name = "Option"
    			Option.Text = tostring(thing)
    			Option.Parent = Dropdown
    			Option.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    			Option.BackgroundTransparency = 0.300
    			Option.Position = UDim2.new(0.0153846154, 0, -0.666666687, 0)
    			Option.Size = UDim2.new(0, 130, 0, 25)
    			Option.Font = Enum.Font.SourceSansLight
    			Option.TextColor3 = Color3.fromRGB(255, 255, 255)
    			Option.TextScaled = true
    			Option.TextSize = 14.000
    			Option.TextStrokeTransparency = 0.500
    			Option.TextWrapped = true
    
    			OptionCorner.CornerRadius = UDim.new(0, 4)
    			OptionCorner.Name = "OptionCorner"
    			OptionCorner.Parent = Option
    
    			Option.Activated:Connect(function()
    				f(thing)
    			end)
    
    			table.insert(options,tostring(thing))
    		end
    
    		function self2:GetOptions()
    			return options
    		end
    
    		function self2:RemoveOption(thing)
    			for i,v in pairs(options) do
    				if v == thing then
    					table.remove(options,i)
    				end
    			end
    		end
    
    		function self2:CallOption(thing)
    			if options[thing] then
    				f(options[thing])
    			end
    		end
    
    		_1.Activated:Connect(function()
    			local function resize()
    				local size = 10
    				for i = 1,#options do
    					size = size + 29
    				end
    
    				return size
    			end
    
    			if not tblopen then
    				game:GetService("TweenService"):Create(Dropdown,TweenInfo.new(.4,Enum.EasingStyle.Quad))
    			else
    
    			end
    		end)
    
    		for i,v in pairs(tbl) do
    			self2:AddOption(v)
    		end
    
    		return self2
    	end
    	
    	function self:Keybind(name,default,f)
    		local self2 = {}
    		local selecting = false
    		local con
    		local keybind = default
    
    		local Keybind = Instance.new("Frame")
    		local _2 = Instance.new("TextLabel")
    		local KeybindCorner = Instance.new("UICorner")
    		local _1 = Instance.new("TextButton")
    		local KeybindCorner_2 = Instance.new("UICorner")
    
    		Keybind.Name = "Keybind"
    		Keybind.Parent = Tab
    		Keybind.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    		Keybind.Size = UDim2.new(0, 100, 0, 100)
    
    		_2.Name = "2"
    		_2.Parent = Keybind
    		_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    		_2.BackgroundTransparency = 1.000
    		_2.Position = UDim2.new(0, 0, 0.0250000004, 0)
    		_2.Size = UDim2.new(0, 94, 0, 39)
    		_2.Font = Enum.Font.SourceSansBold
    		_2.Text = "Keybind"
    		_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    		_2.TextScaled = true
    		_2.TextSize = 22.000
    		_2.TextStrokeTransparency = 0.500
    		_2.TextWrapped = true
    
    		KeybindCorner.CornerRadius = UDim.new(0, 4)
    		KeybindCorner.Name = "KeybindCorner"
    		KeybindCorner.Parent = Keybind
    
    		_1.Name = "1"
    		_1.Parent = Keybind
    		_1.BackgroundColor3 = Color3.fromRGB(0, 113, 170)
    		_1.Position = UDim2.new(0.706766903, 0, 0, 0)
    		_1.Size = UDim2.new(0, 39, 0, 40)
    		_1.Font = Enum.Font.SourceSansLight
    		_1.TextColor3 = Color3.fromRGB(255, 255, 255)
    		_1.TextScaled = true
    		_1.TextSize = 57.000
    		_1.TextStrokeTransparency = 0.500
    		_1.TextWrapped = true
    
    		KeybindCorner_2.CornerRadius = UDim.new(0, 4)
    		KeybindCorner_2.Name = "KeybindCorner"
    		KeybindCorner_2.Parent = _1
    
    		local function subs(str)
    			if #str >= 3 then
    				local f = {}
    				for i = 1,#str do
    					if str:sub(i,i):match("%u") then
    						table.insert(f,str:sub(i,i))
    					end
    				end
    				local s = ""
    				for i,v in pairs(f) do
    					s = s..v
    				end
    
    				return s
    			end
    		end
    
    		local function gets(str)
    			if #subs(str) > 1 then
    				return subs(str)
    			else
    				return str:sub(1,3)
    			end
    		end
    
    		function self2:SetKeybind(keycode)
    			keybind = keycode
    			_1.Text = gets(tostring(keycode):sub(14))
    		end
    
    		function self2:Call(keycode)
    			f(keycode or default)
    		end
    
    		_1.Text = gets(default:sub(14))
    
    		_1.Activated:Connect(function()
    			if not selecting then
    				con = game:GetService("UserInputService").InputBegan:Connect(function(m)
    					if m.KeyCode ~= Enum.KeyCode.Unknown then
    						selecting = false
    						self2:SetKeybind(m.KeyCode)
    						con:Disconnect()
    					end
    				end)
    			end
    		end)
    
    		game:GetService("UserInputService").InputBegan:Connect(function(m,j)
    			if not j and m.KeyCode == keybind then
    				self2:Call(m.KeyCode)
    			end
    		end)
    
    		return self2
    	end
    	
    	function self:Button(name,f)
    		local self2 = {}
    
    		local Button = Instance.new("TextButton")
    		local ButtonTextConstraint = Instance.new("UITextSizeConstraint")
    		local ButtonCorner = Instance.new("UICorner")
    
    		Button.Name = "Button"
    		Button.Parent = Tab
    		Button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    		Button.Position = UDim2.new(0.033657968, 0, 0.00945702475, 0)
    		Button.Size = UDim2.new(0, 130, 0, 40)
    		Button.Font = Enum.Font.SourceSansBold
    		Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    		Button.TextScaled = true
    		Button.Text = tostring(name)
    		Button.TextSize = 14.000
    		Button.TextStrokeTransparency = 0.500
    		Button.TextWrapped = true
    
    		ButtonTextConstraint.Name = "ButtonTextConstraint"
    		ButtonTextConstraint.Parent = Button
    		ButtonTextConstraint.MaxTextSize = 30
    		ButtonTextConstraint.MinTextSize = 12
    
    		ButtonCorner.CornerRadius = UDim.new(0, 4)
    		ButtonCorner.Name = "ButtonCorner"
    		ButtonCorner.Parent = Button
    
    		function self2:Call()	
    			f()
    		end
    
    		Button.Activated:Connect(function()
    			self2:Call()
    		end)
    
    		return self2
    	end
    	
    	function self:Toggle(name,var,f)
    		local self2 = {}
    		local on = false
    
    		local onpos = UDim2.new(0.349, 0, 0, 0)
    		local oncol = Color3.new(0, 1, 0)
    
    		local offpos = UDim2.new(-0.0115386462, 0, 0, 0)
    		local offcol = Color3.new(1,0,0)
    
    		local Toggle = Instance.new("Frame")
    		local ToggleCorner = Instance.new("UICorner")
    		local _1 = Instance.new("TextLabel")
    		local ToggleButton = Instance.new("TextButton")
    		local _2 = Instance.new("ImageButton")
    		local TBCorner = Instance.new("UICorner")
    
    		Toggle.Name = "Toggle"
    		Toggle.Parent = Tab
    		Toggle.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    		Toggle.Position = UDim2.new(0.194063753, 0, 0.331896544, 0)
    		Toggle.Size = UDim2.new(0, 130, 0, 40)
    
    		ToggleCorner.CornerRadius = UDim.new(0, 4)
    		ToggleCorner.Name = "ToggleCorner"
    		ToggleCorner.Parent = Toggle
    
    		_1.Name = "1"
    		_1.Parent = Toggle
    		_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    		_1.BackgroundTransparency = 1.000
    		_1.Position = UDim2.new(-0.00192307692, 0, 0, 0)
    		_1.Size = UDim2.new(0, 66, 0, 40)
    		_1.Font = Enum.Font.SourceSansBold
    		_1.Text = tostring(name)
    		_1.TextColor3 = Color3.fromRGB(255, 255, 255)
    		_1.TextScaled = true
    		_1.TextSize = 14.000
    		_1.TextStrokeTransparency = 0.500
    		_1.TextWrapped = true
    
    		ToggleButton.Name = "ToggleButton"
    		ToggleButton.Parent = Toggle
    		ToggleButton.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
    		ToggleButton.Position = UDim2.new(0.538461328, 0, 0, 0)
    		ToggleButton.Size = UDim2.new(0, 61, 0, 40)
    		ToggleButton.Font = Enum.Font.SourceSans
    		ToggleButton.Text = ""
    		ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    		ToggleButton.TextSize = 14.000
    
    		_2.Name = "2"
    		_2.Parent = ToggleButton
    		_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    		_2.BackgroundTransparency = 1.000
    		_2.Position = UDim2.new(-0.0115386462, 0, 0, 0)
    		_2.Size = UDim2.new(0, 40, 0, 40)
    		_2.Image = "rbxassetid://971251927"
    		_2.ImageColor3 = Color3.fromRGB(255, 0, 0)
    
    		TBCorner.CornerRadius = UDim.new(0, 150)
    		TBCorner.Name = "TBCorner"
    		TBCorner.Parent = ToggleButton
    
    		function self2:Call(bool)
    			if bool ~= nil then
    				f(bool)
    				if on or bool then
    					game:GetService("TweenService"):Create(_2,TweenInfo.new(.5,Enum.EasingStyle.Quad),{ImageColor3 = offcol,Position = offpos}):Play()
    					var = false
    					on = false
    				end
    
    				if not on or bool == false then
    					game:GetService("TweenService"):Create(_2,TweenInfo.new(.5,Enum.EasingStyle.Quad),{ImageColor3 = oncol,Position = onpos}):Play()
    					var = true
    					on = true
    				end
    			else
    				if on then
    					game:GetService("TweenService"):Create(_2,TweenInfo.new(.5,Enum.EasingStyle.Quad),{ImageColor3 = offcol,Position = offpos}):Play()
    					var = false
    					on = false
    					f(false)
    				end
    
    				if not on then
    					game:GetService("TweenService"):Create(_2,TweenInfo.new(.5,Enum.EasingStyle.Quad),{ImageColor3 = oncol,Position = onpos}):Play()
    					var = true
    					on = true
    					f(true)
    				end
    			end
    		end
    
    		_2.Activated:Connect(function()
    			self2:Call()
    		end)
    
    		_1.Activated:Connect(function()
    			self2:Call()
    		end)
    
    		ToggleButton.Activated:Connect(function()
    			self2:Call()
    		end)
    
    		return self2
    	end
    
    	function self:TextBox(name,f)
    		local TextBox = Instance.new("Frame")
    		local TextBoxCorner = Instance.new("UICorner")
    		local _1 = Instance.new("TextBox")
    		local _1Size = Instance.new("UITextSizeConstraint")
    		local TextBoxPad = Instance.new("UIPadding")
    
    		TextBox.Name = "TextBox"
    		TextBox.Parent = Tab
    		TextBox.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    		TextBox.Size = UDim2.new(0, 100, 0, 100)
    
    		TextBoxCorner.CornerRadius = UDim.new(0, 4)
    		TextBoxCorner.Name = "TextBoxCorner"
    		TextBoxCorner.Parent = TextBox
    
    		_1.Name = "1"
    		_1.Parent = TextBox
    		_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    		_1.BackgroundTransparency = 1.000
    		_1.Position = UDim2.new(-0.0390625, 0, 0, 0)
    		_1.Size = UDim2.new(0, 133, 0, 40)
    		_1.Font = Enum.Font.SourceSans
    		_1.PlaceholderText = tostring(name)
    		_1.Text = ""
    		_1.TextColor3 = Color3.fromRGB(255, 255, 255)
    		_1.TextScaled = true
    		_1.TextSize = 14.000
    		_1.TextStrokeTransparency = 0.500
    		_1.TextWrapped = true
    		_1.TextXAlignment = Enum.TextXAlignment.Left
    
    		_1Size.Name = "1Sizew"
    		_1Size.Parent = _1
    		_1Size.MaxTextSize = 30
    		_1Size.MinTextSize = 12
    
    		TextBoxPad.Name = "TextBoxPad"
    		TextBoxPad.Parent = TextBox
    		TextBoxPad.PaddingLeft = UDim.new(0, 8)
    		
    		function self2:Call(text)
    		    f(text)
    		end
    
            _1.FocustLost:Connect(function(ep)
                if ep then
                    self2:Call(_1.Text)
                end
            end)
    	end
    
    	Example.Name = "Example"
    	Example.Parent = Tabs
    	Example.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    	Example.BackgroundTransparency = 0.600
    	Example.Size = UDim2.new(0, 83, 0, 50)
    	Example.Font = Enum.Font.SourceSansBold
    	Example.TextColor3 = Color3.fromRGB(255, 255, 255)
    	Example.TextScaled = true
    	Example.TextSize = 14.000
    	Example.TextStrokeTransparency = 0.500
    	Example.TextWrapped = true
    
    	UICorner.CornerRadius = UDim.new(0, 4)
    	UICorner.Parent = Example
    
    	Tab.Name = "Tab"
    	Tab.Parent = PaaUi
    	Tab.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    	Tab.BackgroundTransparency = 0.600
    	Tab.Position = UDim2.new(0.163740754, 0, 0.180185169, 0)
    	Tab.Size = UDim2.new(0, 483, 0, 307)
    
    	UICorner.CornerRadius = UDim.new(0, 4)
    	UICorner.Parent = Tab
    
    	UIPadding.Parent = Tab
    	UIPadding.PaddingBottom = UDim.new(0, 5)
    	UIPadding.PaddingLeft = UDim.new(0, 8)
    	UIPadding.PaddingRight = UDim.new(0, 8)
    	UIPadding.PaddingTop = UDim.new(0, 5)
    
    	UIGridLayout.Parent = Tab
    	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    	UIGridLayout.CellSize = UDim2.new(0, 133, 0, 40)
    
    	return self
    end
    
    return UI
end)

return t
