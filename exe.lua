return function()
  local l = Instance.new("ScreenGui")
local b = Instance.new("Frame")
local t = Instance.new("TextLabel")
local r = Instance.new("UICorner")
local n = Instance.new("TextButton")
local g = Instance.new("TextButton")
local k = 1

l.Name = "l"
l.Parent = game:GetService("CoreGui")
l.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

b.Name = "b"
b.Parent = l
b.BackgroundColor3 = Color3.fromRGB(76, 109, 255)
b.Position = UDim2.new(0.5, -350, 0.5, -200)
b.Size = UDim2.new(0, 350, 0, 200)

t.Name = "t"
t.Parent = b
t.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
t.BackgroundTransparency = 1.090
t.Size = UDim2.new(0, 350, 0, 151)
t.Font = Enum.Font.SourceSans
t.Text = "Piano is insecure and detected. Instead use Athena!"
t.TextColor3 = Color3.fromRGB(255, 255, 255)
t.TextSize = 49.000
t.TextStrokeTransparency = 0.500
t.TextWrapped = true

r.Name = "r"
r.Parent = b

n.Name = "n"
n.Parent = b
n.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
n.BackgroundTransparency = 1.000
n.Position = UDim2.new(0, 0, 0.754999995, 0)
n.Size = UDim2.new(0, 173, 0, 50)
n.Font = Enum.Font.SourceSans
n.Text = "New Script"
n.TextColor3 = Color3.fromRGB(255, 255, 255)
n.TextSize = 38.000
n.TextStrokeTransparency = 0.500

g.Name = "g"
g.Parent = b
g.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
g.BackgroundTransparency = 1.000
g.Position = UDim2.new(0.505714297, 0, 0.754999995, 0)
g.Size = UDim2.new(0, 173, 0, 50)
g.Font = Enum.Font.SourceSans
g.Text = "Copy Discord"
g.TextColor3 = Color3.fromRGB(255, 255, 255)
g.TextSize = 38.000
g.TextStrokeTransparency = 0.500

g.Activated:Connect(function()
	setclipboard('https://discord.gg/ng8yFn2zX6')
	k = k + 1
end)

n.Activated:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/GFXTI/AthenaClient/main/Main.lua"))()
	k = k + 1
end)

while k ~= 3 and task.wait(1) do end
l:Destroy()
end
