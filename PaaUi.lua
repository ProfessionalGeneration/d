---@diagnostic disable: undefined-global

local t = {}

function t:Library()
    local UI = {}
    
    local opent = tick()
    local extended = false
    local ets = UDim2.new(0, 666,0, 317)
    local etp = UDim2.new(0.016, 0,0.146, 0)
    local sts = UDim2.new(0, 505, 0, 317)
    local stp = UDim2.new(0.251, 0, .146, 0)
    
    local OpenKeycode = Enum.KeyCode.LeftControl
    
    local PaaUi = Instance.new("ScreenGui",game:GetService"CoreGui")
    local main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Tabs = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding = Instance.new("UIPadding")
    local Extend = Instance.new("ImageButton")
    local TextLabel = Instance.new("TextLabel")
    local TabFrames = Instance.new("Folder")
    local TabText = Instance.new("TextLabel")
    
    main.Name = "main"
    main.Parent = PaaUi
    main.BackgroundColor3 = Color3.fromRGB(0, 121, 177)
    main.BorderColor3 = Color3.fromRGB(27, 42, 53)
    main.BorderSizePixel = 0
    main.Position = UDim2.new(0.0296610165, 0, 0.460130721, 0)
    main.Size = UDim2.new(0, 688, 0, 383)
    
    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = main
    
    Tabs.Name = "Tabs"
    Tabs.Parent = main
    Tabs.Active = true
    Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabs.BackgroundTransparency = 1.000
    Tabs.BorderSizePixel = 0
    Tabs.Position = UDim2.new(0.014586715, 0, 0.148825064, 0)
    Tabs.Size = UDim2.new(0, 153, 0, 318)
    Tabs.SizeConstraint = Enum.SizeConstraint.RelativeYY
    Tabs.ScrollBarThickness = 3
	Tabs.CanvasSize = UDim2.new(0,0,10,0)
    Tabs.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
    
    UIListLayout.Parent = Tabs
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    UIPadding.Parent = Tabs
    UIPadding.PaddingLeft = UDim.new(0, 5)
    
    Extend.Name = "Extend"
    Extend.Parent = main
    Extend.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Extend.BackgroundTransparency = 1.000
    Extend.Position = UDim2.new(0.0162074547, 0, 0.0287206266, 0)
    Extend.Size = UDim2.new(0, 41, 0, 41)
    Extend.Image = "rbxassetid://2246054658"
    Extend.ImageColor3 = Color3.fromRGB(170, 0, 0)
    
    TextLabel.Parent = main
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.132901132, 0, 0.0156657957, 0)
    TextLabel.Size = UDim2.new(0, 58, 0, 50)
    TextLabel.Font = Enum.Font.SciFi
    TextLabel.Text = "PAA"
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextSize = 57.000
    
    TabFrames.Name = "TabFrames"
    TabFrames.Parent = main
    
    TabText.Name = "TabText"
    TabText.Parent = main
    TabText.BackgroundColor3 = Color3.fromRGB(0, 99, 147)
    TabText.BorderColor3 = Color3.fromRGB(27, 42, 53)
    TabText.BorderSizePixel = 0
    TabText.Position = UDim2.new(0.694, 0, 0.0156657957, 0)
    TabText.Size = UDim2.new(0, 200, 0, 50)
    TabText.Font = Enum.Font.SourceSansBold
    TabText.Text = ""
    TabText.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabText.TextScaled = true
    TabText.TextSize = 14.000
    TabText.TextStrokeTransparency = 0.500
    TabText.TextWrapped = true
    
     draggable = function(obj)
        spawn(function()
            obj.Active = true;
            local minitial;
            local initial;
            local isdragging;
            obj.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    isdragging = true;
                    minitial = input.Position;
                    initial = obj.Position;
                    local con;
                    con = game:GetService("RunService").Stepped:Connect(function()
                        if isdragging then
                            local mouse = game:GetService"Players".LocalPlayer:GetMouse()
                            local delta = Vector3.new(mouse.X, mouse.Y, 0) - minitial;
                            obj.Position = UDim2.new(initial.X.Scale, initial.X.Offset + delta.X, initial.Y.Scale, initial.Y.Offset + delta.Y)
                        else
                            con:Disconnect();
                        end;
                    end);
                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            isdragging = false;
                        end;
                    end);
                end;
            end);
        end)
	end;

	draggable(main)
    
    Extend.Activated:Connect(function()
        if tick() - opent >= 1 then
            opent = tick()
            if extended then
                table.foreach(TabFrames:GetChildren(),function(_,v)
                    game:GetService("TweenService"):Create(v,TweenInfo.new(1,Enum.EasingStyle.Quad),{Position = stp, Size = sts}):Play()
                end)
                Tabs.Visible = true
            else
                Tabs.Visible = false
                table.foreach(TabFrames:GetChildren(),function(_,v)
                    game:GetService("TweenService"):Create(v,TweenInfo.new(1,Enum.EasingStyle.Quad),{Position = etp, Size = ets}):Play()
                end)
            end
            extended = not extended
        end
    end)
    
    function UI:SetOpenBind(key)
        OpenKeycode = key
    end
    
    game:GetService("UserInputService").InputBegan:Connect(function(m,k)
        if not k and m.KeyCode == OpenKeycode then
            main.Visible = not main.Visible
        end
    end)
    
    function UI:Note(title,desc,t)
        task.spawn(function()
            local Note = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local Main = Instance.new("TextButton")
            local Info = Instance.new("TextButton")
            local Countdown = Instance.new("TextButton")
            
            local close = Instance.new("BindableEvent")
            local mouseover = false
            local del = false
            local con
            local vp = workspace.Camera.ViewportSize
            
            Note.Name = "Note"
            Note.Parent = PaaUi
            Note.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
            Note.Position = UDim2.new(0,vp.X+215,vp.Y-240)
            Note.Size = UDim2.new(0, 215, 0, 94)
            
            UICorner.CornerRadius = UDim.new(0, 4)
            UICorner.Parent = Note
            
            Main.Name = "Main"
            Main.Parent = Note
            Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Main.BackgroundTransparency = 1.000
            Main.Position = UDim2.new(0.0372093022, 0, 0, 0)
            Main.Size = UDim2.new(0, 149, 0, 28)
            Main.Font = Enum.Font.SourceSansBold
            Main.Text = tostring(title)
            Main.TextColor3 = Color3.fromRGB(255, 255, 255)
            Main.TextScaled = true
            Main.TextSize = 14.000
            Main.TextStrokeTransparency = 0.500
            Main.TextWrapped = true
            Main.TextXAlignment = Enum.TextXAlignment.Left
            
            Info.Name = "Info"
            Info.Parent = Note
            Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Info.BackgroundTransparency = 1.000
            Info.Position = UDim2.new(0, 0, 0.388888747, 0)
            Info.Size = UDim2.new(0, 215, 0, 57)
            Info.Font = Enum.Font.SourceSansLight
            Info.Text = tostring(desc)
            Info.TextColor3 = Color3.fromRGB(255, 255, 255)
            Info.TextScaled = true
            Info.TextSize = 14.000
            Info.TextStrokeTransparency = 0.800
            Info.TextWrapped = true
            
            Countdown.Name = "Countdown"
            Countdown.Parent = Note
            Countdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Countdown.BackgroundTransparency = 1.000
            Countdown.Position = UDim2.new(0.730232596, 0, 0.0106382985, 0)
            Countdown.Size = UDim2.new(0, 58, 0, 25)
            Countdown.Font = Enum.Font.SourceSansBold
            Countdown.Text = tostring(t)
            Countdown.TextColor3 = Color3.fromRGB(255, 255, 255)
            Countdown.TextScaled = true
            Countdown.TextSize = 14.000
            Countdown.TextStrokeTransparency = 0.500
            Countdown.TextWrapped = true
            
            local function count()
                task.spawn(function()
                    for i = 1,t+1 do
                        if mouseover or del then
                            break
                        end
                        if i == (t+1) then
                            close:Fire()
                            break
                        end
                        task.wait(1)
                        if not mouseover and not del then
                            Countdown.Text = tostring(t - i)
                        end
                    end
                end)
            end
            
            local function delete()
                game:GetService("TweenService"):Create(Note,TweenInfo.new(.5,Enum.EasingStyle.Quad),{Position = Note.Position + UDim2.new(0,vp.X+215,0,0)}):Play()
                task.wait(.5)
                Note:Destroy()
                con:Disconnect()
                del = true
            end
            
            game:GetService("TweenService"):Create(Note,TweenInfo.new(.8,Enum.EasingStyle.Quad),{Position = UDim2.new(0,vp.X-250,0,vp.Y-240)}):Play()
            
            Note.MouseEnter:Connect(function()
                mouseover = true
                Countdown.Text = tostring(t)
            end)
            
            Note.MouseLeave:Connect(function()
                mouseover = false
                count()
            end)
            
            Countdown.Activated:Connect(delete)
            Info.Activated:Connect(delete)
            Main.Activated:Connect(delete)
            
            con = PaaUi.ChildAdded:Connect(function(t)
                if t.Name == "Note" then
                    game:GetService("TweenService"):Create(Note,TweenInfo.new(.2,Enum.EasingStyle.Quad),{Position = Note.Position - UDim2.new(0,0,0,100)}):Play()
                end
            end)
            
            count()
            
            close.Event:Wait()
            delete()
        end)
    end
    
    function UI:Tab(Name)
    	local self = {}
    
    	local TabName = Instance.new("ScrollingFrame")
        local UIGridLayout = Instance.new("UIGridLayout")
        local UIPadding = Instance.new("UIPadding")
        local TextButton = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        
        TextButton.Parent = Tabs
        TextButton.BackgroundColor3 = Color3.fromRGB(0, 145, 212)
        TextButton.Position = UDim2.new(0.0138239637, 0, -0.00130548305, 0)
        TextButton.Size = UDim2.new(0, 147, 0, 50)
        TextButton.Font = Enum.Font.SourceSans
        TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton.TextScaled = true
        TextButton.TextSize = 14.000
        TextButton.TextStrokeTransparency = 0.500
        TextButton.TextWrapped = true
        TextButton.Text = tostring(Name)
        
        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = TextButton
        
        TabName.Name = "TabName"
        TabName.Parent = TabFrames
        TabName.Active = true
        TabName.Visible = false
        TabName.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
        TabName.BackgroundTransparency = 0.400
        TabName.BorderSizePixel = 0
        TabName.Position = UDim2.new(0.250633687, 0, 0.146214098, 0)
        TabName.Size = UDim2.new(0, 505, 0, 317)
		TabName.CanvasSize = UDim2.new(0,0,10,0)
        TabName.ScrollBarThickness = 0
        
        UIGridLayout.Parent = TabName
        UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIGridLayout.CellSize = UDim2.new(0, 160, 0, 50)
        
        UIPadding.Parent = TabName
        UIPadding.PaddingBottom = UDim.new(0, 5)
        UIPadding.PaddingLeft = UDim.new(0, 5)
        UIPadding.PaddingRight = UDim.new(0, 5)
        UIPadding.PaddingTop = UDim.new(0, 5)
    	
    	function self:Slider(name,min,max,default,f)
    		--[[ I TAKE NO CREDIT FOR THE SLIDER FUNCTION. I AM NOT THAT SMART. ]]
    
    		local self2 = {}
    		local con
    		local con2
    
    		local Slider = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local _1 = Instance.new("TextLabel")
            local _2 = Instance.new("TextBox")
            local UICorner_2 = Instance.new("UICorner")
            local SliderFrame = Instance.new("TextButton")
            local UICorner_3 = Instance.new("UICorner")
            local TextButton = Instance.new("TextButton")
            local UICorner_4 = Instance.new("UICorner")
            
            Slider.Name = "Slider"
            Slider.Parent = TabName
            Slider.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
            Slider.Size = UDim2.new(0, 100, 0, 100)
            
            UICorner.CornerRadius = UDim.new(0, 3)
            UICorner.Parent = Slider
            
            _1.Name = "1"
            _1.Parent = Slider
            _1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _1.BackgroundTransparency = 1.000
            _1.Size = UDim2.new(0, 118, 0, 35)
            _1.Font = Enum.Font.SourceSansBold
            _1.Text = tostring(name)
            _1.TextColor3 = Color3.fromRGB(255, 255, 255)
            _1.TextScaled = true
            _1.TextSize = 14.000
            _1.TextStrokeTransparency = 0.500
            _1.TextWrapped = true
            
            _2.Name = "2"
            _2.Parent = Slider
            _2.BackgroundColor3 = Color3.fromRGB(0, 62, 91)
            _2.BackgroundTransparency = 1.000
            _2.Position = UDim2.new(0.737500012, 0, 0, 0)
            _2.Size = UDim2.new(0, 41, 0, 35)
            _2.Font = Enum.Font.SourceSansLight
            _2.TextColor3 = Color3.fromRGB(255, 255, 255)
            _2.TextScaled = true
            _2.Text = default.."/"..max
            _2.TextSize = 14.000
            _2.TextStrokeTransparency = 0.500
            _2.TextWrapped = true
            
            UICorner_2.CornerRadius = UDim.new(0, 3)
            UICorner_2.Parent = _2
            
            SliderFrame.Name = "SliderFrame"
            SliderFrame.Parent = Slider
            SliderFrame.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
            SliderFrame.Position = UDim2.new(0, 0, 0.699999988, 0)
            SliderFrame.Size = UDim2.new(0, 159, 0, 15)
            SliderFrame.Font = Enum.Font.SourceSans
            SliderFrame.Text = ""
            SliderFrame.TextColor3 = Color3.fromRGB(0, 0, 0)
            SliderFrame.TextSize = 14.000
            
            UICorner_3.CornerRadius = UDim.new(0, 3)
            UICorner_3.Parent = SliderFrame
            
            TextButton.Parent = SliderFrame
            TextButton.BackgroundColor3 = Color3.fromRGB(0, 62, 91)
            TextButton.Size = UDim2.new(0, 10, 0, 15)
            TextButton.Font = Enum.Font.SourceSans
            TextButton.Text = ""
            TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton.TextSize = 14.000
            
            UICorner_4.CornerRadius = UDim.new(0, 3)
            UICorner_4.Parent = TextButton
    
    		game:GetService("UserInputService").InputEnded:Connect(function(m)
    			if m.UserInputType == Enum.UserInputType.MouseButton1 then
    				if con then
    					con:Disconnect()
    					con = nil
    				end
    			end
    		end)
    
            local function move()
                if con or con2 then
    				con:Disconnect()
    				con2:Disconnect()
    			end
    
                if not con2 then
        			con = game:GetService("RunService").Stepped:Connect(function()
        				local m = game:GetService("UserInputService"):GetMouseLocation()
        				local r = math.clamp((m.X - TextButton.AbsolutePosition.X)/(SliderFrame.AbsoluteSize.X),0,1)
        				local vtn = min + (max - min)*r
        
        				vtn = math.round(math.clamp(vtn,min,max))
        
        				_2.Text = vtn .. "/" ..max
        
        				f(vtn)
        				_2.Text = vtn
        			end)
                end
                
    			if not con then
        			con2 = game:GetService("RunService").Heartbeat:Connect(function()
        				local m = game:GetService("UserInputService"):GetMouseLocation()
        				local r = math.clamp((m.X - TextButton.AbsolutePosition.X)/(SliderFrame.AbsoluteSize.X),0,1)
        				local vtn = min + (max - min)*r
        
        				vtn = math.round(math.clamp(vtn,min,max))
        
        				_2.Text = vtn .. "/" ..max
        
        				f(vtn)
        				_2.Text = vtn
        			end)
    			end
            end
            
    		SliderFrame.MouseButton1Down:Connect(move)
    		TextButton.MouseButton1Down:Connect(move)
    
    		function self2:Call(v)
    			local percent = 1 - ((max - v)/(max - min))
    			local Number = v
    
    			Number = math.round(Number)
    
    			TextButton.Size = UDim2.new(percent,0,0,15)
    			f(Number)
    			_2.Text = Number .. "/" .. max
    		end
    
    		_2.FocusLost:Connect(function()
    			self2:Call(math.clamp(tonumber(_2.Text),min,max))
    		end)
    
    		return self2
    	end
    	
    	function self:Dropdown(name,default,tbl,f)
    		local self2 = {}
    		local options = {}
    		local tblopen = false
    
    		local Dropdown = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local _1 = Instance.new("TextButton")
            local ImageButton = Instance.new("ImageButton")
            local DFrame = Instance.new("Frame")
            local UICorner_2 = Instance.new("UICorner")
            local UIListLayout = Instance.new("UIListLayout")
            local UIPadding = Instance.new("UIPadding")
            local TextButton = Instance.new("TextButton")
            
            Dropdown.Name = "Dropdown"
            Dropdown.Parent = TabName
            Dropdown.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
            Dropdown.Size = UDim2.new(0, 100, 0, 100)
            
            UICorner.CornerRadius = UDim.new(0, 3)
            UICorner.Parent = Dropdown
            
            _1.Name = "1"
            _1.Parent = Dropdown
            _1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _1.BackgroundTransparency = 1.000
            _1.Size = UDim2.new(0, 124, 0, 50)
            _1.Font = Enum.Font.SourceSansBold
            _1.Text = tostring(name).."\n("..tostring(default)..")"
            _1.TextColor3 = Color3.fromRGB(255, 255, 255)
            _1.TextScaled = true
            _1.TextSize = 14.000
            _1.TextStrokeTransparency = 0.500
            _1.TextWrapped = true
            
            ImageButton.Parent = Dropdown
            ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ImageButton.BackgroundTransparency = 1.000
            ImageButton.Position = UDim2.new(0.787500024, 0, 0.200000003, 0)
            ImageButton.Size = UDim2.new(0, 30, 0, 30)
            ImageButton.Image = "rbxassetid://6545531971"
            
            DFrame.Name = "DFrame"
            DFrame.Parent = Dropdown
            DFrame.BackgroundColor3 = Color3.fromRGB(0, 62, 91)
            DFrame.Position = UDim2.new(0, 0, 0.980606675, 0)
            DFrame.Size = UDim2.new(0, 160, 0, 0)
            DFrame.Visible = false
            DFrame.ZIndex = 2
            
            UICorner_2.CornerRadius = UDim.new(0, 3)
            UICorner_2.Parent = DFrame
            
            UIListLayout.Parent = DFrame
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0, 1)
            
            UIPadding.Parent = DFrame
            UIPadding.PaddingBottom = UDim.new(0, 5)
            UIPadding.PaddingTop = UDim.new(0, 5)
    
    		function self2:AddOption(thing)
    			local TextButton = Instance.new("TextButton")

    			TextButton.Parent = DFrame
                TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.BackgroundTransparency = 1.000
                TextButton.Size = UDim2.new(0, 160, 0, 25)
                TextButton.Font = Enum.Font.SourceSansLight
                TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.TextScaled = true
                TextButton.TextSize = 14.000
                TextButton.TextStrokeTransparency = 0.500
                TextButton.TextWrapped = true
                TextButton.Visible = false
                TextButton.ZIndex = 3
                TextButton.Text = tostring(thing)
    
    			TextButton.Activated:Connect(function()
    				f(thing)
    				_1.Text = tostring(name).."\n("..tostring(thing)..")"
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
    			f(thing)
    			_1.Text = tostring(name).."\n("..tostring(thing)..")"
    		end
    
    		ImageButton.Activated:Connect(function()
    			local function resize()
    				local size = 2
    				for i = 1,#options do
    					size = size + 27
    				end
    
    				return size
    			end
    
    			if not tblopen then
    			    DFrame.Visible = true
    			    game:GetService("TweenService"):Create(ImageButton,TweenInfo.new(.4,Enum.EasingStyle.Quad),{Rotation = 180}):Play()
    				game:GetService("TweenService"):Create(DFrame,TweenInfo.new(.4,Enum.EasingStyle.Quad),{Size = UDim2.new(0, 160, 0, resize())}):Play()
    			    tblopen = true
    			    task.wait(.4)
    			    table.foreach(DFrame:GetChildren(),function(_,v)pcall(function()v.Visible=true end)end)
    			else
    			    table.foreach(DFrame:GetChildren(),function(_,v)pcall(function()v.Visible=false end)end)
                	game:GetService("TweenService"):Create(DFrame,TweenInfo.new(.4,Enum.EasingStyle.Quad),{Size = UDim2.new(0, 160, 0, 0)}):Play()
                	game:GetService("TweenService"):Create(ImageButton,TweenInfo.new(.4,Enum.EasingStyle.Quad),{Rotation = 0}):Play()
                	task.wait(.4)
                	DFrame.Visible = false
                	tblopen = false
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
    
    		local KeyBind = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local _1 = Instance.new("TextButton")
            local _2 = Instance.new("TextButton")
            local UICorner_2 = Instance.new("UICorner")
            
            KeyBind.Name = "KeyBind"
            KeyBind.Parent = TabName
            KeyBind.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
            KeyBind.Size = UDim2.new(0, 100, 0, 100)
            
            UICorner.CornerRadius = UDim.new(0, 3)
            UICorner.Parent = KeyBind
            
            _1.Name = "1"
            _1.Parent = KeyBind
            _1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _1.BackgroundTransparency = 1.000
            _1.BorderSizePixel = 0
            _1.Size = UDim2.new(0, 118, 0, 50)
            _1.Font = Enum.Font.SourceSansBold
            _1.Text = tostring(name)
            _1.TextColor3 = Color3.fromRGB(255, 255, 255)
            _1.TextScaled = true
            _1.TextSize = 14.000
            _1.TextStrokeTransparency = 0.500
            _1.TextWrapped = true
            
            _2.Name = "2"
            _2.Parent = KeyBind
            _2.BackgroundColor3 = Color3.fromRGB(0, 62, 91)
            _2.Position = UDim2.new(0.742262006, 0, 0, 0)
            _2.Size = UDim2.new(0, 41, 0, 50)
            _2.Font = Enum.Font.SourceSansLight
            _2.TextColor3 = Color3.fromRGB(255, 255, 255)
            _2.TextScaled = true
            _2.TextSize = 14.000
            _2.TextStrokeTransparency = 0.500
            _2.TextWrapped = true
            
            UICorner_2.CornerRadius = UDim.new(0, 3)
            UICorner_2.Parent = _2
    
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
    			else
    			    return str:sub(1,1)
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
    			_2.Text = gets(tostring(keycode):sub(14))
    		end
    
    		function self2:Call(keycode)
    			f(keycode or default)
    			self2:SetKeybind(keycode)
    		end
    
    		_2.Text = gets(tostring(default):sub(14))
    
    		_2.Activated:Connect(function()
    			if not selecting then
    			    _2.Text = "..."
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
            local UICorner = Instance.new("UICorner")
            
            Button.Name = "Button"
            Button.Parent = TabName
            Button.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
            Button.Position = UDim2.new(0, 0, -0.00661375653, 0)
            Button.Size = UDim2.new(0, 140, 0, 50)
            Button.Font = Enum.Font.SourceSansBold
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextScaled = true
            Button.TextSize = 14.000
            Button.Text = tostring(name)
            Button.TextStrokeTransparency = 0.500
            Button.TextWrapped = true
            
            UICorner.CornerRadius = UDim.new(0, 3)
            UICorner.Parent = Button
    
    		function self2:Call()	
    			f()
    		end
    
    		Button.Activated:Connect(function()
    			self2:Call()
    		end)
    
    		return self2
    	end
    	
    	function self:Toggle(name,default,f)
    		local self2 = {}
    		local on = false
    
    		local oncol = Color3.new(0, 1, 0)
    		local offcol = Color3.new(1,0,0)
    
    		local Toggle = Instance.new("TextButton")
            local TextButton = Instance.new("TextButton")
            local UICorner = Instance.new("UICorner")
            local UICorner_2 = Instance.new("UICorner")

            Toggle.Name = "Toggle"
            Toggle.Parent = TabName
            Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            Toggle.Size = UDim2.new(0, 100, 0, 100)
            Toggle.Text = ""
            
            TextButton.Parent = Toggle
            TextButton.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
            TextButton.Size = UDim2.new(0, 147, 0, 50)
            TextButton.Font = Enum.Font.SourceSansBold
            TextButton.Text = "Toggle"
            TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextButton.TextScaled = true
            TextButton.TextSize = 14.000
            TextButton.TextStrokeTransparency = 0.500
            TextButton.TextWrapped = true
            
            UICorner.CornerRadius = UDim.new(0, 3)
            UICorner.Parent = TextButton
            
            UICorner_2.CornerRadius = UDim.new(0, 3)
            UICorner_2.Parent = Toggle
    
    		function self2:Call(bool)
    			if bool ~= nil then
    				f(bool)
    				if on or bool then
    					game:GetService("TweenService"):Create(Toggle,TweenInfo.new(.5,Enum.EasingStyle.Quad),{BackgroundColor3 = offcol}):Play()
    					on = false
    					return
    				end
    
    				if not on or bool == false then
    					game:GetService("TweenService"):Create(Toggle,TweenInfo.new(.5,Enum.EasingStyle.Quad),{BackgroundColor3 = oncol}):Play()
    					on = true
    					return
    				end
    			else
    				if on then
    					game:GetService("TweenService"):Create(Toggle,TweenInfo.new(.5,Enum.EasingStyle.Quad),{BackgroundColor3 = offcol}):Play()
    					on = false
    					f(false)
    					return
    				end
    
    				if not on then
    					game:GetService("TweenService"):Create(Toggle,TweenInfo.new(.5,Enum.EasingStyle.Quad),{BackgroundColor3 = oncol}):Play()
    					on = true
    					f(true)
    					return
    				end
    			end
    		end
    		
    		self2:Call(default)
    
    		Toggle.Activated:Connect(function()
    			self2:Call()
    		end)
    
    		TextButton.Activated:Connect(function()
    			self2:Call()
    		end)
    
    		return self2
    	end
    
    	function self:TextBox(name,f)
    	    local self2 = {}
    	
            local TextBox = Instance.new("Frame")
            local TextLabel = Instance.new("TextLabel")
            local TextBox_2 = Instance.new("TextBox")
            local UICorner = Instance.new("UICorner")
            
            TextBox.Name = "TextBox"
            TextBox.Parent = TabName
            TextBox.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
            TextBox.Size = UDim2.new(0, 100, 0, 100)
            
            TextLabel.Parent = TextBox
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.BorderSizePixel = 0
            TextLabel.Size = UDim2.new(0, 160, 0, 25)
            TextLabel.Font = Enum.Font.SourceSansBold
            TextLabel.Text = tostring(name)
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.TextScaled = true
            TextLabel.TextSize = 14.000
            TextLabel.TextStrokeTransparency = 0.500
            TextLabel.TextWrapped = true
            
            TextBox_2.Parent = TextBox
            TextBox_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextBox_2.BackgroundTransparency = 1.000
            TextBox_2.Position = UDim2.new(0, 0, 0.5, 0)
            TextBox_2.Size = UDim2.new(0, 160, 0, 25)
            TextBox_2.Font = Enum.Font.SourceSansLight
            TextBox_2.Text = "Type Here!"
            TextBox_2.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox_2.TextScaled = true
            TextBox_2.TextSize = 14.000
            TextBox_2.TextStrokeTransparency = 0.500
            TextBox_2.TextWrapped = true
            
            UICorner.CornerRadius = UDim.new(0, 3)
            UICorner.Parent = TextBox
    		
    		function self2:Call(text)
    		    f(text)
    		end
    		
    		function self2:SetText(text)
    		    TextBox_2.Text = text or "Type Here!"
    		end
    
            TextBox_2.FocusLost:Connect(function()
                self2:Call(TextBox_2.Text)
            end)
            
            return self2
    	end
    	
    	TextButton.Activated:Connect(function()
    	    TabText.Text = tostring(Name)
    	    for i,v in pairs(TabFrames:GetChildren()) do
    	        v.Visible = false
    	    end
    	    TabName.Visible = true
    	end)
    
    	return self
    end
    
    return UI
end

return t
--[[

local main = t:Library()

local tab = main:Tab("misc")

local fb = tab:Button("Hi",function()

end)

fb:Call()

local tog = tab:Toggle("Toggle thing",true,function(b)
    print(b)
end)

local drop = tab:Dropdown("b","Hi",{"hi","bye"},function(g)
    print(g)
end)

drop:CallOption("bye")

local slider = tab:Slider("Slide",1,50,25,function(bruh)
	print(bruh)
end)

slider:Call(50/3)

local keybind = tab:Keybind("key!?!?",Enum.KeyCode.B,function(n)
    print(n)
end)

keybind:Call(Enum.KeyCode.J)

local textbox = tab:TextBox("thing",function(g)
    print(g)
end)

textbox:Call("nig")

local newtab = main:Tab("the sequal")

newtab:Toggle("your mother",false,function(h)
    print(h)
end)

main:Note("njigger","NIUGEGER",5)
wait(1)
main:Note("g","g",90)

]]
