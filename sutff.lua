local ui = script.Parent.Ui
local proxPrompt = script.Parent.Part.ProximityPrompt
local plrs = game:GetService"Players"
local worker = {}
worker.__index = worker

function worker:new(player) 
    local properties = {
        name = player.Name
        player = player
        position = "worker"
    }

    return setmetatable(properties, worker)
end

function worker.promote(self, position)
    self.position = position

    return self
end

_G.basharAlRepair = {
    workers = {
        worker:new(plrs.MrGFXTI):promote("manager")
    },

    function listWorkers()
        local list = {}

        for i,v in self.workers do
            table.insert(list, v.name)
        end

        return list
    end,

    function isWorker(player: string)
        for i,v in self.listWorkers() do
            if v == player then
                return v
            end
        end

        return false
    end
}

proxPrompt.Triggered:Connect(function(playerWhoTriggered: Player)
    ui:Clone().Parent = playerWhoTriggered.PlayerGui
end)

while task.wait(1) do
    for i,v in _G.basharAlRepair.listWorkers() do
        local plr = plrs:FindFirstChild(v)
        if not plr then continue end

        local character = plr.Character
        if not character then continue end

        
    end
end

-- localScript

local 