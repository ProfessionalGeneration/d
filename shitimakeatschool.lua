local function DeltaIter(start, _end, callback)
    local up
    local rstep = sv.RunService.RenderStepped

    if _end > start then
        up = true
    end

    while (up and _end < start) or (start < _end) do
        start += rstep:wait() * (up and 1 or -1)
        task.spawn(callback, start)
    end

    rstep:wait()
    callback(_bend)
end

local function Scrolling(frame, options)
    local scrollbar = GetGradientBox(true)
    local scrollbarsize = options.scrollbarsize or frame.Size.Y
    local scrollposy = 0
    options = options or {scrollamount = 10, paddingbottom = 0, scrollbar = true}

    table.insert(cons, sv.UserInputService.InputChanged:Connect(function(a, b)
        if b then return end

        if a.UserInputType == Enum.UserInputType.MouseWheel and IsInFrame(frame, GetMousePosition()) and frame.Visible and frame.Opacity ~= 0 then
            local up = a.Position.Z > 0

            task.spawn(function() 
                for _ = 1, options.scrollamount / 5 do
                    
                end
            end)

            for i,v in frame:children(true) do
                if (table.find({"l", "ts", "s", "scrollbar"}, v.name) and v.parent == frame) then continue end

                task.spawn(function()
                    for _ = 1, options.scrollamount / 5 do
                        v.Position += Vector2.new(0, (up and options.scrollamount or -options.scrollamount) / 5)
                        if v.Position.Y <= frame.Position.Y or v.Position.Y + (typeof(v.Size) == "Vector2" and v.Size or v.TextBounds).Y >= frame.Position.Y + frame.Size.Y - options.paddingbottom then
                            v.Visible = false

                            for _, v2 in v:children(true) do
                                v2.Visible = false
                            end
                        end

                        if v.Position.Y > frame.Position.Y and v.Position.Y + (typeof(v.Size) == "Vector2" and v.Size or v.TextBounds).Y < frame.Position.Y + frame.Size.Y - options.paddingbottom then
                            v.Visible = true

                            for _, v2 in v:children(true) do
                                v2.Visible = true
                            end
                        end

                        task.wait()
                    end
                end)
            end
        end
    end))

    if options.scrollbar then
        scrollbar.ZIndex = frame.ZIndex + 1
        scrollbar.Position = frame.Position + Vector2.new(frame.Size.X - 5, frame.Position.Y - 1)
        scrollbar.Size = Vector2.new(4, scrollbarsize / frame.Size.Y)
        scrollbar.parent = frame
        scrollbar.name = "scrollbar"

        Box(scrollbar, frame.ZIndex + 1)
    end

    return function(newsettings) -- update func
        scrollbar.Size = Vector2.new(4, (newsettings.scrollbarsize or 400) / frame.Size.Y)
        options = newsettings
    end
end

-- made this at school doubt it'll work but wtv
-- still need to add scroll clamping so u dont under/over scroll
-- wholecream is hacking

-- uhhh deadass got no clue what to do in school

-- ill mess with OOP in school cuz why not (and remake my "Draw" stuff to be a bit more useful)

local Dinstance = {} do
    local GradientData = syn.request({Url = "https://media.discordapp.net/attachments/907173542972502072/1076735971749535845/angryimg.png"}).Body
    local function UpdateBox(props, frames)
        local msize = frames.Main.Size or frames.Main.TextBounds or frames.Main.Radius or (frames.PointB - frames.PointD) -- ill add the uhh custom outline objects later ("Circle", "Quad", and other stuff)

        if tostring(frames.Main) == "Circle" then
            for i,v in frames do
                if i == "Main" then continue end

                v.Visible = props.Outline and frames.Main.Visible
                v.Color = props.OutlineColor
                v.Thickness = props.OutlineThickness
                v.Position = frames.Main.Position
                v.Radius = frames.Main.Radius + ((props.OutlineThickness / 2) * (i:find("In") and -1 or 1))
                v.ZIndex = frames.Main.ZIndex
            end
            
            return
        end
        
        if table.find({"Image", "Square"}, tostring(frames.Main))
            frames.Outline.Visible = props.Outline and frames.Main.Visible
            frames.Outline.Color = props.OutlineColor
            frames.Outline.Thickness = props.OutlineThickness
            frames.Outline.Position = frames.Main.Position - Vector2.new(props.OutlineThickness, props.OutlineThickness)
            frames.Outline.Size = msize + Vector2.new(props.OutlineThickness, props.OutlineThickness)
            frames.Outline.ZIndex = frames.Main.ZIndex
        end
    end

    local newindex = function(t, k, v)
        if k == "Position" then
            for i,v in t.__children do
                v.Position = v + (v.Position - t.frames.main.Position)
            end
        end

        if t.frames.main[k] then t.frames.main[k] = v end
        t.props[k] = v

        UpdateBox(t.props, t.frames)
    end

    local Types = {
        ["Frame"] = function()
            local frame = Drawing.new "Square"
            local frames = {
                ["Main"] = frame,
                ["Outline"] = Drawing.new "Square"
            }
            local props = {
                ["Outline"] = false,
                ["OutlineColor"] = Color3.new(),
                ["OutlineThickness"] = 2,
            }
            local children = {}

            frame.Filled = true

            return frame, setmetatable({["__children"] = children, ["__props"] = props, ["__frames"] = frames}, {
                __index = props,
                __newindex = newindex
            })
        end,
        ["Gradient"] = function()
            local frame = Drawing.new "Image"
            local frames = {
                ["Main"] = frame,
                ["Outline"] = Drawing.new "Square"
            }
            local props = {
                ["Outline"] = false,
                ["OutlineColor"] = Color3.new(),
                ["OutlineThickness"] = 2,
            }
            local children = {}

            frame.Data = GradientData

            return frame, setmetatable({}, {
                __index = props,
                __newindex = newindex
            })
        end,
        ["Circle"] = function()
            local frame = Drawing.new "Cirlce"
            local frames = {
                ["Main"] = frame,
                ["OutlineIn"] = Drawing.new "Cirlce",
                ["OutlineOut"] = Drawing.new "Circle"
            }
            local props = {
                ["Outline"] = false,
                ["OutlineColor"] = Color3.new(),
                ["OutlineThickness"] = 2
            }
            local children = {}

            return frame, setmetatable({}, {
                __index = props,
                __newindex = newindex
            })
        end
    }
    
    function Dinstance.new(Type)
        local Object, Metatable = Types[Type]()
        local RawNewIndex = getrawmetatable(Metatable.__newindex)

        setmetatable(Metatable, {
            __newindex = function(t, k, v)
                

                RawNewIndex(t, k, v)
            end
        })

        return Metatable
    end

    setmetatable(Dinstance, {
        __index = Dinstance
    })
end