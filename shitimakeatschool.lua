local function DeltaIter(start, _end, callback)
    local up
    local rstep = sv.RunService.RenderStepped

    if _end < start then
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