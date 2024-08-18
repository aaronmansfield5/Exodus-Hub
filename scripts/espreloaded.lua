_G.Testing = true

local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local tracerFolder = camera:FindFirstChild("Tracers") or Instance.new("Folder", camera)
tracerFolder.Name = "Tracers"

local playerCache = {}

local function updateTracers(tracer, attachment0, attachment1, playerName)
	tracer.Attachment0 = attachment0
	tracer.Attachment1 = attachment1
	tracer.FaceCamera = true
	tracer.Color = ColorSequence.new(Color3.new(1, 0, 0))
	tracer.Width0 = 0.05
	tracer.Width1 = 0.05

	local playerString = tracer:FindFirstChild("Player")
	if not playerString then
		playerString = Instance.new("StringValue", tracer)
		playerString.Name = "Player"
	end
	playerString.Value = playerName
end

local function manageSurfaceGui(part)
	local faces = {"Front", "Back", "Left", "Right", "Top", "Bottom"}
	for _, face in ipairs(faces) do
		if not part:FindFirstChild(face.."SurfaceGui") then
			local SurfaceGui = Instance.new("SurfaceGui", part)
			SurfaceGui.Face = Enum.NormalId[face]
			SurfaceGui.Name = face.."SurfaceGui"

			local Frame = Instance.new("Frame", SurfaceGui)
			SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			SurfaceGui.Active = true
			SurfaceGui.AlwaysOnTop = true
			SurfaceGui.LightInfluence = 1.000

			Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
			Frame.BorderColor3 = Color3.fromRGB(135, 0, 2)
			Frame.BorderSizePixel = 3
			Frame.Size = UDim2.new(1, 0, 1, 0)
			Frame.Transparency = 0.5
		end
	end
end

local function manageSelectionBox(part)
	if not part:FindFirstChild("SelectionBox") then
		local SelectionBox = Instance.new("SelectionBox", part)
		SelectionBox.Adornee = part
		SelectionBox.LineThickness = 0.015
		SelectionBox.SurfaceTransparency = 0.75
		SelectionBox.Color3 = Color3.new(1, 0, 0.0156863)
		SelectionBox.SurfaceColor3 = Color3.new(1, 0, 0.0156863)
	end
end

local function getRoot(char)
	if not char then return nil end
	return char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('UpperTorso') or char:FindFirstChild('Torso')
end

local function removeOldVisuals(characterName)
	if playerCache[characterName] then
		for _, item in pairs(playerCache[characterName]) do
			if item and item.Parent then
				item:Destroy()
			end
		end
		playerCache[characterName] = nil
	end
end

local function createTracerAndAttachments(v)
	local root1 = getRoot(player.Character)
	local root2 = getRoot(v)
	if root1 and root2 then
		local attachment0 = Instance.new("Attachment", root1)
		local attachment1 = Instance.new("Attachment", root2)

		local tracer = Instance.new("Beam", tracerFolder)
		tracer.Name = "Tracer"

		return tracer, attachment0, attachment1
	else
		return nil
	end
end

local function updatePlayerVisuals(v)
	local characterName = v.Name

	removeOldVisuals(characterName)

	local tracer, attachment0, attachment1 = createTracerAndAttachments(v)

	if not tracer then return end

	playerCache[characterName] = {
		Tracer = tracer,
		Attachment0 = attachment0,
		Attachment1 = attachment1
	}

	updateTracers(tracer, attachment0, attachment1, characterName)

	for _, part in pairs(v:GetChildren()) do
		if part:IsA("Part") or part:IsA("MeshPart") then
			local viewportPoint, onScreen = camera:WorldToViewportPoint(part.Position)
			local direction = part.Position - camera.CFrame.Position
			local raycastParams = RaycastParams.new()
			raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
			raycastParams.FilterDescendantsInstances = {player.Character} -- Avoid self-intersection
			local raycastResult = workspace:Raycast(camera.CFrame.Position, direction, raycastParams)

			if onScreen then
				if not raycastResult or raycastResult.Instance == part then
					manageSelectionBox(part)
				else
					manageSurfaceGui(part)
				end
			end
		end
	end
end

local function waitForCharacter(character)
	repeat
		wait()
	until character and character:FindFirstChild("HumanoidRootPart")
end

local function safeGetPlayerCharacter(player)
	if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		return player.Character
	end
	return nil
end

local function monitorPlayers()
	while true do
		if _G.Testing then
			for _, obj in ipairs(workspace:GetChildren()) do
				if obj:FindFirstChild("Humanoid") and obj.Name ~= player.Name then
					updatePlayerVisuals(obj)
				end
			end
		else
			for _, player in ipairs(game.Players:GetPlayers()) do
				if player.Name ~= player.Name then
					local char = safeGetPlayerCharacter(player)
					if char then
						updatePlayerVisuals(char)
					end
				end
			end
		end
		wait(0.1)
	end
end

coroutine.wrap(monitorPlayers)()

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(char)
		waitForCharacter(char)
		updatePlayerVisuals(char)
	end)
end)

game.Players.PlayerRemoving:Connect(function(player)
	removeOldVisuals(player.Name)
end)

player.CharacterAdded:Connect(function(char)
	waitForCharacter(char)
	for _, v in pairs(game.Players:GetPlayers()) do
		if v ~= player then
			updatePlayerVisuals(v.Character)
		end
	end
end)