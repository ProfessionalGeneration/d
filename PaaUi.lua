---@diagnostic disable: undefined-global

local t = {}

function t:Library(name)
    local UI = {}
    
    local OpenKeycode = Enum.KeyCode.LeftControl
    
    local PaaUi = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local Tabs = Instance.new("ScrollingFrame")
    local UIGridLayout = Instance.new("UIGridLayout")
    local UIPadding = Instance.new("UIPadding")
    local Logo = Instance.new("TextLabel")
    local TabFrames = Instance.new("Folder")
    local UICorner = Instance.new("UICorner")

    PaaUi.Name = "PaaUiV2"
    PaaUi.Parent = game:GetService("CoreGui")
    PaaUi.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Main.Name = "Main"
    Main.Parent = PaaUi
    Main.BackgroundColor3 = Color3.fromRGB(0, 109, 159)
    Main.Position = UDim2.new(0.0568181798, 0, 0.347888857, 0)
    Main.Size = UDim2.new(0, 700, 0, 450)

    Tabs.Name = "Tabs"
    Tabs.Parent = Main
    Tabs.Active = true
    Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabs.BackgroundTransparency = 1.000
    Tabs.BorderSizePixel = 0
    Tabs.Position = UDim2.new(0.0114285713, 0, 0.13555555, 0)
    Tabs.Size = UDim2.new(0, 95, 0, 360)
    Tabs.CanvasPosition = Vector2.new(0, 2.29591846)
    Tabs.ScrollBarThickness = 0
    Tabs.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

    UIGridLayout.Parent = Tabs
    UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIGridLayout.CellSize = UDim2.new(0, 93, 0, 40)

    UIPadding.Parent = Tabs
    UIPadding.PaddingBottom = UDim.new(0, 5)
    UIPadding.PaddingLeft = UDim.new(0, 1)
    UIPadding.PaddingTop = UDim.new(0, 5)

    Logo.Name = "Logo"
    Logo.Parent = Main
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.Position = UDim2.new(0.0128571428, 0, 0.0177777782, 0)
    Logo.Size = UDim2.new(0, 94, 0, 50)
    Logo.Font = Enum.Font.SourceSansBold
    Logo.Text = tostring(name)
    Logo.TextColor3 = Color3.fromRGB(255, 255, 255)
    Logo.TextScaled = true
    Logo.TextSize = 14.000
    Logo.TextStrokeTransparency = 0.500
    Logo.TextWrapped = true

    TabFrames.Name = "TabFrames"
    TabFrames.Parent = Main

    UICorner.CornerRadius = UDim.new(0, 3)
    UICorner.Parent = Main
    
    local draggable = function(obj)
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

	draggable(Main)
    
    function UI:SetOpenBind(key)
        OpenKeycode = key
    end
    
    game:GetService("UserInputService").InputBegan:Connect(function(m,k)
        if not k and m.KeyCode == OpenKeycode then
            Main.Visible = not Main.Visible
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
    
    	local Tab = Instance.new("ScrollingFrame")
        local UIGridLayout = Instance.new("UIGridLayout")
        local UIPadding = Instance.new("UIPadding")
        local Tab1 = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")

        Tab1.Name = "Tab"
        Tab1.Parent = Tabs
        Tab1.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
        Tab1.Size = UDim2.new(0, 200, 0, 50)
        Tab1.Font = Enum.Font.SourceSansBold
        Tab1.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab1.TextScaled = true
        Tab1.Text = tostring(Name)
        Tab1.TextSize = 14.000
        Tab1.TextStrokeTransparency = 0.500
        Tab1.TextWrapped = true

        UICorner.CornerRadius = UDim.new(0, 3)
        UICorner.Parent = Tab1

        Tab.Name = "Tab"
        Tab.Parent = TabFrames
        Tab.Active = true
        Tab.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
        Tab.BorderSizePixel = 0
        Tab.Position = UDim2.new(0.157142863, 0, 0.0688888878, 0)
        Tab.Size = UDim2.new(0, 583, 0, 413)
        Tab.ScrollBarThickness = 5
        Tab.CanvasSize = UDim2.new(0,0,0,300)

        UIGridLayout.Parent = Tab
        UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIGridLayout.CellSize = UDim2.new(0, 283, 0, 65)

        UIPadding.Parent = Tab
        UIPadding.PaddingBottom = UDim.new(0, 5)
        UIPadding.PaddingLeft = UDim.new(0, 5)
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
            local SliderFrame = Instance.new("TextButton")
            local UICorner_2 = Instance.new("UICorner")
            local Slider_2 = Instance.new("TextButton")
            local UICorner_3 = Instance.new("UICorner")

            Slider.Name = "Slider"
            Slider.Parent = Tab
            Slider.BackgroundColor3 = Color3.fromRGB(0, 109, 159)
            Slider.Size = UDim2.new(0, 100, 0, 100)

            UICorner.CornerRadius = UDim.new(0, 3)
            UICorner.Parent = Slider

            _1.Name = "1"
            _1.Parent = Slider
            _1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _1.BackgroundTransparency = 1.000
            _1.Size = UDim2.new(0, 236, 0, 38)
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
            _2.Position = UDim2.new(0.837455809, 0, 0, 0)
            _2.Size = UDim2.new(0, 46, 0, 38)
            _2.Font = Enum.Font.SourceSansBold
            _2.Text = tostring(default)
            _2.TextColor3 = Color3.fromRGB(255, 255, 255)
            _2.TextScaled = true
            _2.TextSize = 14.000
            _2.TextStrokeTransparency = 0.500
            _2.TextWrapped = true

            SliderFrame.Name = "SliderFrame"
            SliderFrame.Parent = Slider
            SliderFrame.BackgroundColor3 = Color3.fromRGB(0, 73, 107)
            SliderFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
            SliderFrame.BorderSizePixel = 0
            SliderFrame.Position = UDim2.new(0, 0, 0.615384638, 0)
            SliderFrame.Size = UDim2.new(0, 283, 0, 17)
            SliderFrame.Font = Enum.Font.SourceSans
            SliderFrame.Text = ""
            SliderFrame.TextColor3 = Color3.fromRGB(0, 0, 0)
            SliderFrame.TextSize = 14.000

            UICorner_2.CornerRadius = UDim.new(0, 3)
            UICorner_2.Parent = SliderFrame

            Slider_2.Name = "Slider"
            Slider_2.Parent = SliderFrame
            Slider_2.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
            Slider_2.Size = UDim2.new(0, 17, 0, 17)
            Slider_2.Font = Enum.Font.SourceSans
            Slider_2.Text = ""
            Slider_2.TextColor3 = Color3.fromRGB(0, 0, 0)
            Slider_2.TextSize = 14.000

            UICorner_3.CornerRadius = UDim.new(0, 3)
            UICorner_3.Parent = Slider_2
    
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
        				local r = math.clamp((m.X - Slider_2.AbsolutePosition.X)/(SliderFrame.AbsoluteSize.X),0,1)
        				local vtn = min + (max - min)*r
        
        				vtn = math.round(math.clamp(vtn,min,max))
                        Slider_2.Size = UDim2.new(r,0,0,17)
        
        				_2.Text = vtn
        
        				f(vtn)
        				_2.Text = vtn
        			end)
                end
                
    			if not con then
        			con2 = game:GetService("RunService").Heartbeat:Connect(function()
        				local m = game:GetService("UserInputService"):GetMouseLocation()
        				local r = math.clamp((m.X - Slider_2.AbsolutePosition.X)/(SliderFrame.AbsoluteSize.X),0,1)
        				local vtn = min + (max - min)*r
        
        				vtn = math.round(math.clamp(vtn,min,max))
                        Slider_2.Size = UDim2.new(r,0,0,17)
        
        				_2.Text = vtn
        
        				f(vtn)
        				_2.Text = vtn
        			end)
    			end
            end
            
    		SliderFrame.MouseButton1Down:Connect(move)
    		Slider_2.MouseButton1Down:Connect(move)
    
    		function self2:Call(v)
    			local percent = 1 - ((max - v)/(max - min))
    			local Number = v
    
    			Number = math.round(Number)
    
    			Slider_2.Size = UDim2.new(percent,0,0,17)
    			f(Number)
    			_2.Text = Number
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
            local _1 = Instance.new("TextLabel")
            local _2 = Instance.new("ImageButton")
            local DFrame = Instance.new("ScrollingFrame")
            local UIPadding = Instance.new("UIPadding")
            local UIGridLayout = Instance.new("UIGridLayout")

            Dropdown.Name = "Dropdown"
            Dropdown.Parent = Tab
            Dropdown.BackgroundColor3 = Color3.fromRGB(0, 109, 159)
            Dropdown.Size = UDim2.new(0, 100, 0, 100)
            Dropdown.ZIndex = 2

            UICorner.CornerRadius = UDim.new(0, 3)
            UICorner.Parent = Dropdown

            _1.Name = "1"
            _1.Parent = Dropdown
            _1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _1.BackgroundTransparency = 1.000
            _1.Size = UDim2.new(0, 230, 0, 65)
            _1.Font = Enum.Font.SourceSansBold
            _1.TextColor3 = Color3.fromRGB(255, 255, 255)
            _1.TextScaled = true
            _1.Text = tostring(name)
            _1.TextSize = 14.000
            _1.TextStrokeTransparency = 0.500
            _1.TextWrapped = true
            _1.ZIndex = 3

            _2.Name = "2"
            _2.Parent = Dropdown
            _2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _2.BackgroundTransparency = 1.000
            _2.Position = UDim2.new(0.812720835, 0, 0.138461545, 0)
            _2.Rotation = 180.000
            _2.Size = UDim2.new(0, 47, 0, 47)
            _2.Image = "rbxassetid://6545531971"
            _2.ZIndex = 3

            DFrame.Name = "DFrame"
            DFrame.Parent = Dropdown
            DFrame.Active = true
            DFrame.BackgroundColor3 = Color3.fromRGB(0, 109, 159)
            DFrame.BorderSizePixel = 0
            DFrame.Position = UDim2.new(0, 0, 1.06153846, 0)
            DFrame.Size = UDim2.new(0, 283, 0, 145)
            DFrame.Visible = false
            DFrame.ZIndex = 4
            DFrame.CanvasSize = UDim2.new(0, 0, 20, 0)
            DFrame.ScrollBarThickness = 0

            UIPadding.Parent = DFrame
            UIPadding.PaddingBottom = UDim.new(0, 5)
            UIPadding.PaddingLeft = UDim.new(0, 5)
            UIPadding.PaddingRight = UDim.new(0, 5)
            UIPadding.PaddingTop = UDim.new(0, 5)

            UIGridLayout.Parent = DFrame
            UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIGridLayout.CellSize = UDim2.new(0, 64, 0, 25)

    		function self2:AddOption(thing)
    			local Option = Instance.new("TextButton")

    			Option.Name = "Option"
                Option.Parent = DFrame
                Option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Option.BackgroundTransparency = 1.000
                Option.BorderSizePixel = 0
                Option.Text = tostring(thing)
                Option.Size = UDim2.new(0, 283, 0, 24)
                Option.ZIndex = 5
                Option.Font = Enum.Font.SourceSansBold
                Option.TextColor3 = Color3.fromRGB(255, 255, 255)
                Option.TextScaled = true
                Option.TextSize = 14.000
                Option.TextStrokeTransparency = 0.500
                Option.TextWrapped = true
    
    			Option.Activated:Connect(function()
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
    
    		_2.Activated:Connect(function()
    			if not tblopen then
    			    DFrame.Visible = true
    			    game:GetService("TweenService"):Create(_2,TweenInfo.new(.2,Enum.EasingStyle.Quad),{Rotation = 180}):Play()
    				game:GetService("TweenService"):Create(DFrame,TweenInfo.new(.2,Enum.EasingStyle.Quad),{Size = UDim2.new(0, 283, 0, 145)}):Play()
    			    tblopen = true
    			    task.wait(.2)
    			    table.foreach(DFrame:GetChildren(),function(_,v)pcall(function()v.Visible=true end)end)
    			else
    			    table.foreach(DFrame:GetChildren(),function(_,v)pcall(function()v.Visible=false end)end)
                	game:GetService("TweenService"):Create(DFrame,TweenInfo.new(.2,Enum.EasingStyle.Quad),{Size = UDim2.new(0, 283, 0, 0)}):Play()
                	game:GetService("TweenService"):Create(_2,TweenInfo.new(.2,Enum.EasingStyle.Quad),{Rotation = 0}):Play()
                	task.wait(.2)
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
    
    		local Keybind = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local _1 = Instance.new("TextLabel")
            local _2 = Instance.new("TextButton")

            Keybind.Name = "Keybind"
            Keybind.Parent = Tab
            Keybind.BackgroundColor3 = Color3.fromRGB(0, 109, 159)
            Keybind.Size = UDim2.new(0, 100, 0, 100)

            UICorner.CornerRadius = UDim.new(0, 3)
            UICorner.Parent = Keybind

            _1.Name = "1"
            _1.Parent = Keybind
            _1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _1.BackgroundTransparency = 1.000
            _1.Size = UDim2.new(0, 182, 0, 65)
            _1.Font = Enum.Font.SourceSansBold
            _1.TextColor3 = Color3.fromRGB(255, 255, 255)
            _1.TextScaled = true
            _1.Text = tostring(name)
            _1.TextSize = 14.000
            _1.TextStrokeTransparency = 0.500
            _1.TextWrapped = true

            _2.Name = "2"
            _2.Parent = Keybind
            _2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _2.BackgroundTransparency = 1.000
            _2.Position = UDim2.new(0.64310956, 0, 0, 0)
            _2.Size = UDim2.new(0, 101, 0, 65)
            _2.Font = Enum.Font.SourceSansBold
            _2.Text = ""
            _2.TextColor3 = Color3.fromRGB(255, 255, 255)
            _2.TextScaled = true
            _2.TextSize = 14.000
            _2.TextStrokeTransparency = 0.500
            _2.TextWrapped = true
    
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
    
    		local Button = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local TextButton = Instance.new("TextButton")

            Button.Name = "Button"
            Button.Parent = Tab
            Button.BackgroundColor3 = Color3.fromRGB(0, 109, 159)
            Button.Position = UDim2.new(0.115916952, 0, 0.0112359552, 0)
            Button.Size = UDim2.new(0, 100, 0, 100)

            UICorner.CornerRadius = UDim.new(0, 3)
            UICorner.Parent = Button

            TextButton.Parent = Button
            TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextButton.BackgroundTransparency = 1.000
            TextButton.Size = UDim2.new(0, 283, 0, 65)
            TextButton.Font = Enum.Font.SourceSansBold
            TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextButton.TextScaled = true
            TextButton.TextSize = 14.000
            TextButton.TextStrokeTransparency = 0.500
            TextButton.TextWrapped = true
    
    		function self2:Call()	
    			f()
    		end
    
    		TextButton.Activated:Connect(function()
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
            local UICorner = Instance.new("UICorner")
            local _1 = Instance.new("TextButton")
            local UICorner_2 = Instance.new("UICorner")

            Toggle.Name = "Toggle"
            Toggle.Parent = Tab
            Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            Toggle.Size = UDim2.new(0, 100, 0, 100)
            Toggle.Text = ""

            UICorner.CornerRadius = UDim.new(0, 3)
            UICorner.Parent = Toggle

            _1.Name = "1"
            _1.Parent = Toggle
            _1.BackgroundColor3 = Color3.fromRGB(0, 109, 159)
            _1.Size = UDim2.new(0, 225, 0, 65)
            _1.Font = Enum.Font.SourceSansBold
            _1.TextColor3 = Color3.fromRGB(255, 255, 255)
            _1.TextScaled = true
            _1.Text = tostring(name)
            _1.TextSize = 14.000
            _1.TextStrokeTransparency = 0.500
            _1.TextWrapped = true

            UICorner_2.CornerRadius = UDim.new(0, 3)
            UICorner_2.Parent = _1
    
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
    
    		_1.Activated:Connect(function()
    			self2:Call()
    		end)
    
    		return self2
    	end
    
    	function self:TextBox(name,f)
    	    local self2 = {}
    	
            local Textbox = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local _1 = Instance.new("TextLabel")
            local _2 = Instance.new("TextBox")

            Textbox.Name = "Textbox"
            Textbox.Parent = Tab
            Textbox.BackgroundColor3 = Color3.fromRGB(0, 109, 159)
            Textbox.Size = UDim2.new(0, 100, 0, 100)

            UICorner.CornerRadius = UDim.new(0, 3)
            UICorner.Parent = Textbox

            _1.Name = "1"
            _1.Parent = Textbox
            _1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _1.BackgroundTransparency = 1.000
            _1.Size = UDim2.new(0, 283, 0, 37)
            _1.Font = Enum.Font.SourceSansBold
            _1.TextColor3 = Color3.fromRGB(255, 255, 255)
            _1.TextScaled = true
            _1.Text = tostring(name)
            _1.TextSize = 14.000
            _1.TextStrokeTransparency = 0.500
            _1.TextWrapped = true

            _2.Name = "2"
            _2.Parent = Textbox
            _2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _2.BackgroundTransparency = 1.000
            _2.Position = UDim2.new(0, 0, 0.569230795, 0)
            _2.Size = UDim2.new(0, 283, 0, 28)
            _2.Font = Enum.Font.SourceSans
            _2.Text = "Type here!"
            _2.TextColor3 = Color3.fromRGB(255, 255, 255)
            _2.TextSize = 30.000
            _2.TextStrokeTransparency = 0.700
            _2.TextWrapped = true
                        
    		function self2:Call(text)
    		    f(text)
    		end
    		
    		function self2:SetText(text)
    		    _2.Text = text or "Type Here!"
    		end
    
            _2.FocusLost:Connect(function()
                self2:Call(_2.Text)
            end)
            
            return self2
    	end
    	
    	Tab1.Activated:Connect(function()
    	    for i,v in pairs(TabFrames:GetChildren()) do
    	        v.Visible = false
    	    end
    	    Tab.Visible = true
    	end)
    
    	return self
    end
    
    return UI
end

return t

--[[local main = t:Library("paa")

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
main:Note("g","g",90)]]
