-- Credits To The Original Devs @xz, @goof
getgenv().Config = {
	Invite = "Midnigt.xyz",
	Version = "0.1",
}

getgenv().luaguardvars = {
	DiscordName = "Ak3_s",
}

local camera = game:GetService("Workspace").CurrentCamera
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ak3ss/GandruHub.miau/refs/heads/main/uhbdvfsiohujgdfsionjgdfsinjpkcxvhipudfsgiuhpjbvcpjinkvdfbspoijubcv.lua"))()
local espBoxes = {}

local G2L = {};
G2L["1"] = Instance.new("ScreenGui", game.CoreGui);
G2L["1"]["Name"] = [[ShowNearestArmor]];
G2L["1"]["Enabled"] = false;
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 2;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(58, 58, 58);
G2L["2"]["Size"] = UDim2.new(0, 449, 0, 38);
G2L["2"]["Position"] = UDim2.new(0.358, 0, 0.01131, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 252, 255);
G2L["3"] = Instance.new("UIStroke", G2L["2"]);
G2L["3"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["3"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
G2L["3"]["Thickness"] = 1.2;
G2L["4"] = Instance.new("TextLabel", G2L["2"]);
G2L["4"]["TextWrapped"] = true;
G2L["4"]["TextStrokeTransparency"] = 0;
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["TextSize"] = 14;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4"]["TextColor3"] = Color3.fromRGB(0, 252, 255);
G2L["4"]["BackgroundTransparency"] = 1;
G2L["4"]["Size"] = UDim2.new(0, 449, 0, 38);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Text"] = [[No Armor Found]];

local EspSettings = {
	Enabled = false,
	Box = false,
	BoxOutline = false,
	Skeleton = false,
	Nametag = false,
	NametagOutline = false
}

local HitboxSettings = {
    Enabled = false,
    HeadSize = 1,
    HeadTransparency = 0,
    TorsoSize = 2,
    TorsoTransparency = 0
}

library:init()

local Window = library.NewWindow({
	title = "Midnight.xyz | Public | Trident Survival V5",
	size = UDim2.new(0, 525, 0, 650)
})

local tabs = {
    Combat = Window:AddTab("Combat"),
    Visuals = Window:AddTab("Visuals"),
    Misc = Window:AddTab("Misc"),
	Settings = library:CreateSettingsTab(Window),
}

local sections = {
	Playertab = tabs.Visuals:AddSection("Player Esp", 1),
	Buildtab = tabs.Visuals:AddSection("Buildings Stuff", 2),
	othertab = tabs.Visuals:AddSection("Other", 2),
	Playerhitbox = tabs.Combat:AddSection("Player Hitbox", 2),
	Stuff = tabs.Misc:AddSection("Stuff", 1),
}

sections.othertab:AddToggle({
	enabled = true,
	text = "Show Armor [Better with crosshair]",
	flag = "Toggle_1",
	tooltip = "",
	risky = false,
	callback = function(value)
	    G2L["1"]["Enabled"] = value;
	end
})

local Wallstrans = 0

sections.Buildtab:AddSlider({
	text = "Walls/Roofs Transparency", 
	flag = 'dsfgerte45wt', 
	suffix = "", 
	value = 0,
	min = 0, 
	max = 1,
	increment = 0.1,
	tooltip = "",
	risky = false,
	callback = function(v) 
		Wallstrans = v
	end
})

RunService.RenderStepped:Connect(function()
	for _, v in pairs(workspace:GetChildren()) do
		if v:FindFirstChild("Hitbox") then
			v.Hitbox.Transparency = Wallstrans
		end
	end
end)

local clockenb = false
local ClockTime = 1

sections.Stuff:AddToggle({
	enabled = true,
	text = "Time Changer Enabled",
	flag = "Toggle_1",
	tooltip = "",
	risky = false,
	callback = function(value)
	    clockenb = value
	end
})

sections.Stuff:AddSlider({
	text = "Time Changer", 
	flag = 'Slider_1', 
	suffix = "", 
	value = 12,
	min = 0, 
	max = 24,
	increment = 0.1,
	tooltip = "",
	risky = false,
	callback = function(v) 
		ClockTime = v
	end
})

sections.Playerhitbox:AddToggle({
	enabled = true,
	text = "Enabled",
	flag = "Toggle_1",
	tooltip = "",
	risky = false,
	callback = function(value)
	    HitboxSettings.Enabled = value
	end
})

sections.Playerhitbox:AddSeparator({
	text = "Head Hitbox"
})

sections.Playerhitbox:AddSlider({
	text = "Head Size", 
	flag = 'dsfgerte45wt', 
	suffix = "", 
	value = 1,
	min = 1, 
	max = 50,
	increment = 0.1,
	tooltip = "",
	risky = false,
	callback = function(v) 
		HitboxSettings.HeadSize = v
	end
})

sections.Playerhitbox:AddSlider({
	text = "Head Transparency", 
	flag = '4wt3f34wftw34tvrd', 
	suffix = "", 
	value = 0,
	min = 0, 
	max = 1,
	increment = 0.1,
	tooltip = "",
	risky = false,
	callback = function(v) 
		HitboxSettings.HeadTransparency = v
	end
})

sections.Playerhitbox:AddSeparator({
	text = "Torso Hitbox"
})

sections.Playerhitbox:AddSlider({
	text = "Torso Size", 
	flag = 'Slider_1', 
	suffix = "", 
	value = 1,
	min = 1, 
	max = 50,
	increment = 0.1,
	tooltip = "",
	risky = false,
	callback = function(v) 
		HitboxSettings.TorsoSize = v
	end
})

sections.Playerhitbox:AddSlider({
	text = "Torso Transparency", 
	flag = 'Slider_1', 
	suffix = "", 
	value = 0,
	min = 0, 
	max = 1,
	increment = 0.1,
	tooltip = "",
	risky = false,
	callback = function(v) 
		HitboxSettings.TorsoTransparency = v
	end
})

RunService.RenderStepped:Connect(function()
	if HitboxSettings.Enabled == true then
		for _, v in pairs(workspace:GetChildren()) do
			if v:FindFirstChild("Head") and v:FindFirstChild("Torso") then
				v.Head.CanCollide = false
				v.Head.Transparency = HitboxSettings.HeadTransparency
				v.Head.Size = Vector3.new(HitboxSettings.HeadSize, HitboxSettings.HeadSize, HitboxSettings.HeadSize)

				v.Torso.CanCollide = false
				v.Torso.Transparency = HitboxSettings.TorsoTransparency
				v.Torso.Size = Vector3.new(HitboxSettings.TorsoSize, HitboxSettings.TorsoSize, HitboxSettings.TorsoSize)
			end
		end
	elseif HitboxSettings.Enabled == false then
		for _, v in pairs(workspace:GetChildren()) do
			if v:FindFirstChild("Head") and v:FindFirstChild("Torso") then
				v.Head.CanCollide = true
				v.Head.Transparency = 0
				v.Head.Size = Vector3.new(1.672, 0.836, 0.836)

				v.Torso.CanCollide = true
				v.Torso.Transparency = 0
				v.Torso.Size = Vector3.new(0.653, 2.22, 1.437)
			end
		end
	end
end)

RunService.RenderStepped:Connect(function()
	if clockenb == true then
		game.Lighting.ClockTime = ClockTime
	end
end)

sections.Playertab:AddToggle({
	enabled = true,
	text = "Enabled",
	flag = "Toggle_1",
	tooltip = "",
	risky = false,
	callback = function(value)
	    EspSettings.Enabled = value
	end
})

sections.Playertab:AddToggle({
	enabled = true,
	text = "Box",
	flag = "Toggle_1",
	tooltip = "",
	risky = false,
	callback = function(value)
	    EspSettings.Box = value
	end
})

sections.Playertab:AddToggle({
	enabled = true,
	text = "Box Outline",
	flag = "Toggle_1",
	tooltip = "",
	risky = false,
	callback = function(value)
	    EspSettings.BoxOutline = value
	end
})

sections.Playertab:AddToggle({
	enabled = true,
	text = "Skeleton",
	flag = "Toggle_1",
	tooltip = "",
	risky = false,
	callback = function(value)
	    EspSettings.Skeleton = value
	end
})

sections.Playertab:AddToggle({
	enabled = true,
	text = "Nametag",
	flag = "Toggle_1",
	tooltip = "",
	risky = false,
	callback = function(value)
	    EspSettings.Nametag = value
	end
})

sections.Playertab:AddToggle({
	enabled = true,
	text = "Nametag Outline",
	flag = "Toggle_1",
	tooltip = "",
	risky = false,
	callback = function(value)
	    EspSettings.NametagOutline = value
	end
})

local function createESP(player)
	local boxOutline = Drawing.new("Square")
	boxOutline.Thickness = 1.1
	boxOutline.Filled = false
	boxOutline.Color = Color3.fromRGB(0, 0, 0)
	boxOutline.Visible = false

	local box = Drawing.new("Square")
	box.Thickness = 1
	box.Filled = false
	box.Color = Color3.fromRGB(255, 0, 0)
	box.Visible = false

	espBoxes[player] = { box = box, outline = boxOutline }
end

local function removeESP(player)
	if espBoxes[player] then
		espBoxes[player].box:Remove()
		espBoxes[player].outline:Remove()
		espBoxes[player] = nil
	end
end

local function updateESP()
	for player, esp in pairs(espBoxes) do
		local box = esp.box
		local outline = esp.outline

		local character = player
		if character and character:FindFirstChild("HumanoidRootPart") then
			local rootPart = character.HumanoidRootPart
			local screenPos, onScreen = camera:WorldToViewportPoint(rootPart.Position)

			if onScreen then
				local head = character:FindFirstChild("Head")      
				if head then
					local headPos, _ = camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
					local rootPos, _ = camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 4.5, 0))

					local boxHeight = math.abs(headPos.Y - rootPos.Y)
					local boxWidth = boxHeight / 1.5

					local position = Vector2.new(screenPos.X - boxWidth / 2, screenPos.Y - boxHeight / 2.3)
					local size = Vector2.new(boxWidth, boxHeight)

					outline.Size = size + Vector2.new(2, 2)
					outline.Position = position - Vector2.new(1, 1)
					if EspSettings.Enabled == true then
						if EspSettings.BoxOutline == true then
							outline.Visible = true
						else
							outline.Visible = false
						end
					else
						outline.Visible = false
					end 

					box.Size = size
					box.Position = position
					if EspSettings.Enabled == true then
						if EspSettings.Box == true then
							box.Visible = true
						else
							box.Visible = false
						end
					else
						box.Visible = false
					end 
				end
			else
				box.Visible = false
				outline.Visible = false
			end
		else
			box.Visible = false
			outline.Visible = false
		end
	end
end

for _, player in pairs(game.Workspace:GetChildren()) do
	if player:FindFirstChild("HumanoidRootPart") and player:FindFirstChild("Head") then
		createESP(player)
	end
end

game.Workspace.ChildAdded:Connect(function(player)
	local rootPart = player:WaitForChild("HumanoidRootPart", 2)
	if rootPart then
		createESP(player)
	else
		return
	end
end)

game.Workspace.ChildRemoved:Connect(function(player)
	if player:FindFirstChild("HumanoidRootPart") then
		removeESP(player)
	end
end)

RunService.RenderStepped:Connect(updateESP)






local function createLine()
	local line = Drawing.new("Line")
	line.Visible = false
	line.Color = Color3.fromRGB(255, 0, 0)
	line.Thickness = 3
	return line
end

local espLines = {}

local function createSkeletonESP(player)
	espLines[player] = {}
	local function getPartPosition(part)
		if part then
			local pos, onScreen = camera:WorldToViewportPoint(part.Position)
			return Vector2.new(pos.X, pos.Y), onScreen
		end
		return nil, false
	end

	local bones = {
		{"Head", "Torso"},
		{"Torso", "LowerTorso"},
		{"Torso", "LeftUpperArm"},
		{"LeftUpperArm", "LeftLowerArm"},
		{"LeftLowerArm", "LeftHand"},
		{"Torso", "RightUpperArm"},
		{"RightUpperArm", "RightLowerArm"},
		{"RightLowerArm", "RightHand"},
		{"LowerTorso", "LeftUpperLeg"},
		{"LeftUpperLeg", "LeftLowerLeg"},
		{"LeftLowerLeg", "LeftFoot"},
		{"LowerTorso", "RightUpperLeg"},
		{"RightUpperLeg", "RightLowerLeg"},
		{"RightLowerLeg", "RightFoot"},
	}

	for _, bone in pairs(bones) do
		local line = createLine()
		table.insert(espLines[player], {line, bone[1], bone[2]})
	end

	RunService.RenderStepped:Connect(function()
		if player then
			for _, boneData in pairs(espLines[player]) do
				local line, part1, part2 = unpack(boneData)
				local char = player

				if char:FindFirstChild(part1) and char:FindFirstChild(part2) then
					local pos1, onScreen1 = getPartPosition(char[part1])
					local pos2, onScreen2 = getPartPosition(char[part2])

					if onScreen1 and onScreen2 then
						line.From = pos1
						line.To = pos2
						if EspSettings.Enabled == true then
							if EspSettings.Skeleton == true then
								line.Visible = true
							else
								line.Visible = false
							end
						else
							line.Visible = false
						end
					else
						line.Visible = false
					end
				else
					line.Visible = false
				end
			end
		end
	end)
end

for _, player in pairs(game.Workspace:GetChildren()) do
	if player:FindFirstChild("HumanoidRootPart") then
		createSkeletonESP(player)
	end
end

game.Workspace.ChildAdded:Connect(function(player)
	local rootPart = player:WaitForChild("HumanoidRootPart", 2)
	if rootPart then
		createSkeletonESP(player)
	else
		return
	end
end)



local Nametags = {}

-- Function to create a nametag
local function createNametag(player)
	local text = Drawing.new("Text")
	text.Visible = false
	text.Center = true
	text.Outline = false
	text.Size = 20
	text.Color = Color3.fromRGB(255, 0, 0)
	Nametags[player] = text
end

local function removeNametag(player)
	if Nametags[player] then
		Nametags[player]:Remove()
		Nametags[player] = nil
	end
end

for _, player in pairs(workspace:GetChildren()) do
	if player:FindFirstChild("HumanoidRootPart") then
		createNametag(player)
	end
end

game.Workspace.ChildAdded:Connect(function(player)
	local rootPart = player:WaitForChild("HumanoidRootPart", 2)
	if rootPart then
		createNametag(player)
	else
		return
	end
end)

game.Workspace.ChildRemoved:Connect(function(player)
	if player:FindFirstChild("HumanoidRootPart") then
		removeNametag(player)
	end
end)

RunService.RenderStepped:Connect(function()
	for player, text in pairs(Nametags) do
		local character = player
		if character then
			local rootPart = character:FindFirstChild("HumanoidRootPart")
			if rootPart then
				local screenPosition, onScreen = camera:WorldToViewportPoint(rootPart.Position + Vector3.new(0, 3.3, 0))
				local humanoidRootPart = player:FindFirstChild("HumanoidRootPart")
				local distance2 = math.floor((camera.CFrame.Position - humanoidRootPart.Position).magnitude)
				local distance = (camera.CFrame.Position - rootPart.Position).Magnitude
				local username = "Player"
				if player:FindFirstChild("Head") and player.Head:FindFirstChild("Nametag") and player.Head.Nametag.tag.Text == "Shylou2644" then
					username = "Soldier"
				end
				if onScreen then
					local verticalOffset = math.clamp(distance / 3, 1, 14)
					text.Position = Vector2.new(screenPosition.X, screenPosition.Y - verticalOffset)
					text.Text = username .. " [" .. distance2 .. "s]"
					text.Size = math.clamp(30 - distance, 12, 20)
					if EspSettings.Enabled == true then
						if EspSettings.Nametag == true then
							text.Visible = true
						else
							text.Visible = false
						end
					else
						text.Visible = false
					end

					if EspSettings.Enabled == true then
						if EspSettings.NametagOutline == true then
							text.Outline = true
						else
							text.Outline = false
						end
					else
						text.Visible = false
					end
				else
					text.Visible = false
				end
			else
				text.Visible = false
			end
		else
			text.Visible = false
		end
	end
end)

local CrosshairVertical = Drawing.new("Line")
CrosshairVertical.Color = Color3.fromRGB(255, 0, 0)
CrosshairVertical.Thickness = 1
CrosshairVertical.Visible = false

local CrosshairHorizontal = Drawing.new("Line")
CrosshairHorizontal.Color = Color3.fromRGB(255, 0, 0)
CrosshairHorizontal.Thickness = 1
CrosshairHorizontal.Visible = false


sections.othertab:AddToggle({
	enabled = true,
	text = "Crosshair",
	flag = "Toggle_1",
	tooltip = "",
	risky = false,
	callback = function(value)
	    CrosshairVertical.Visible = value
		CrosshairHorizontal.Visible = value
	end
})

local function updateCrosshair()
    local screenSize = camera.ViewportSize
    local centerX = screenSize.X / 2
    local centerY = screenSize.Y / 2
    CrosshairVertical.From = Vector2.new(centerX, centerY - 10)
    CrosshairVertical.To = Vector2.new(centerX, centerY + 10)
    CrosshairHorizontal.From = Vector2.new(centerX - 10, centerY)
    CrosshairHorizontal.To = Vector2.new(centerX + 10, centerY)
end

local function findClosestPlayer()
    local screenSize = camera.ViewportSize
    local centerScreen = Vector2.new(screenSize.X / 2, screenSize.Y / 2)
    local closestPlayer = nil
    local closestDistance = 50 -- Detection range in pixels

    for _, player in pairs(workspace:GetChildren()) do
        if player then
            local HumanoidRootPart = player:FindFirstChild("HumanoidRootPart")
            if HumanoidRootPart then
                local ScreenPos, OnScreen = camera:WorldToViewportPoint(HumanoidRootPart.Position)
                local PlayerScreenPos = Vector2.new(ScreenPos.X, ScreenPos.Y)
                local Distance = (PlayerScreenPos - centerScreen).Magnitude
                if OnScreen and Distance < closestDistance then
                    closestPlayer = player
                    closestDistance = Distance
                end
            end
        end
    end

    return closestPlayer
end

local function updateArmorText(player)
    if player then
        local armorFolder = player:FindFirstChild("Armor")
        if armorFolder and armorFolder:IsA("Folder") then
            local armorItems = {}

            for _, item in pairs(armorFolder:GetChildren()) do
                table.insert(armorItems, item.Name)
            end

            G2L["4"]["Text"] = table.concat(armorItems, "  |  ")
            return
        end
    end
    G2L["4"]["Text"] = "No Armor Found"
end

RunService.RenderStepped:Connect(function()
    updateCrosshair()

    local targetPlayer = findClosestPlayer()
    updateArmorText(targetPlayer)
end)

library:SendNotification("Notification", 5, Color3.new(255, 0, 0))
