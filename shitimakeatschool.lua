local function Scrolling(frame, settings)
    local scrollbar = GetGradientBox(true)
    local scrollbarsize = settings.scrollbarsize or 400

    scrollbar.ZIndex = frame.ZIndex + 1
    scrollbar.Position = frame.Position + Vector2.new(frame.Size.X - 5, frame.Position.Y - 1)
    scrollbar.Size = Vector2.new(4, scrollbarsize / frame.Size.Y)
    scrollbar.parent = frame
    scrollbar.name = "scrollbar"

    Box(scrollbar, frame.ZIndex + 1)

    return function(newsettings) -- update func
        scrollbar.Size = Vector2.new(4, (newsettings.scrollbarsize or 400) / frame.Size.Y)
        settings = newsettings
    end
end

-- made this at school doubt it'll work but wtv
-- still need to add scroll clamping so u dont under/over scroll
-- wholecream is hacking