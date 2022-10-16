local CDrawing = {}
local Drawvals = {
    ["Line"] = {
        Thickness = "IntValue",
        From = "Vector3Value",
        To = "Vector3Value"
    },
    ["Text"] = {
        Size = "IntValue",
        Outlined = "BoolValue",
        Centered = "BoolValue",
        Position = "Vector3Value"
    },
    ["Image"] = {
        Rounding = "IntValue",
        Position = "Vector3Value",
        Size = "Vector3Value",
        Data = "StringValue"
    },
    ["Circle"] = {
        Thickness = "IntValue",
        NumSides = "IntValue",
        Radius = "IntValue",
        Filled = "BoolValue",
        Position = "Vector3Value"
    },
    ["Square"] = {
        Thickness = "IntValue",
        Size = "Vector3Value",
        Position = "Vector3Value",
        Filled = "IntValue"
    },
    ["Triangle"] = {
        Thickness = "IntValue",
        PointA = "Vector3Value",
        PointB = "Vector3Value",
        PointC = "Vector3Value",
        Filled = "BoolValue"
    },
    ["Quad"] = {
        Thickness = "IntValue",
        PointA = "Vector3Value",
        PointB = "Vector3Value",
        PointC = "Vector3Value",
        PointD = "Vector3Value",
        Filled = "BoolValue"
    }
}
CDrawing.__index = CDrawing
CDrawing.__newindex = function(self, key, val)
    if self.Drawing[key] then
        self.Drawing[key] = val

        if self[key] then
            self[key].Value = val
        end
    end
end

function CDrawing.Create(Type, props)
    local tvs = {
        ZIndex = Instance.new("IntValue"),
        Transparency = Instance.new("IntValue"),
        Color = Instance.new("Color3Value"),
        Visible = Instance.new("BoolValue"),
        Drawing = Drawing.new(Type)
    }

    for i,v in next, Drawvals[Type] do
        tvs[i] = Instance.new(v)
    end

    for i,v in next, props do
        if tvs[i] then
            tvs[i].Value = v
        end

        tvs.Drawing[i] = v
    end

    for i,v in next, tvs do
        if v == tvs.Drawing then continue end
        
        v.Changed:Connect(function(val)
            tvs.Drawing[i] = typeof(val) == "Vector3" and Vector2.new(val.X, val.Y) or val
        end)
    end

    return setmetatable(tvs, CDrawing)
end

function CDrawing.Destroy(self)
    self.__mode = "k"
    self.Drawing:Remove()
end

function CDrawing.Update(self, props) -- mass updating
    for i,v in next, props do
        self[i].Value = typeof(v) == "Vector2" and Vector2.new(v.X, v.Y) or v
    end
end

return CDrawing

--[[

local draw = CDrawing.Create("Line", {})

draw:Update({
    Size = Vector2.new(10, 20)
})
print(draw.Size.Value)
draw.Size.Value = Vector3.new(10, 20, 0)
print(draw.Size.Value)
task.wait(3)
draw:Destroy()
