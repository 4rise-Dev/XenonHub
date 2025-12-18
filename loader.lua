--[[
╔════════════════════════════╗
  XENON VOID
  Script by : น้อวเติ้ลคุคิ
  UI Library : OrionLib (jensonhirst)
  Discord : https://discord.gg/U2Pfvc9JaZ
  Version : 0.0.1
╚════════════════════════════╝
]]


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local Window = OrionLib:MakeWindow({
	Name = "Xenon Void",
	IntroEnabled = true,
	IntroText = "Xenon Void | by น้อวเติ้ลคุง",
	SaveConfig = true
})

OrionLib:MakeNotification({
	Name = "ยินดีต้อนรับ!",
	Content = "Welcome To Xenon Void",
	Image = "rbxassetid://4483345998",
	Time = 5
})

--[[
Title = <string> - The title of the notification.
Content = <string> - The content of the notification.
Image = <string> - The icon of the notification.
Time = <number> - The duration of the notfication.
]]

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local SpeedOn = false

Tab:AddToggle({
	Name = "วิ่งเร็ว",
	Default = false,
	Callback = function(Value)
		SpeedOn = Value
		local char = LocalPlayer.Character
		if char and char:FindFirstChild("Humanoid") then
			char.Humanoid.WalkSpeed = Value and 80 or 16
		end
	end
})

--==============================
-- SERVICES
--==============================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

--==============================
-- CHARACTER / HUMANOID
--==============================
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

LocalPlayer.CharacterAdded:Connect(function(char)
	Character = char
	Humanoid = char:WaitForChild("Humanoid")
end)

--==============================
-- NOCLIP TOGGLE
--==============================
local Noclip = false
local NoclipConnection

Tab:AddToggle({
	Name = "ทะลุกำแพง",
	Default = false,
	Callback = function(Value)
		Noclip = Value

		if Noclip then
			NoclipConnection = RunService.Stepped:Connect(function()
				if Character then
					for _, v in pairs(Character:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false
						end
					end
				end
			end)
		else
			if NoclipConnection then
				NoclipConnection:Disconnect()
				NoclipConnection = nil
			end
			if Character then
				for _, v in pairs(Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = true
					end
				end
			end
		end
	end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ESP_Enabled = false
local ESP_Objects = {}

local function CreateESP(player)
	if player == LocalPlayer then return end
	if not player.Character then return end
	if player.Character:FindFirstChild("ESP_Highlight") then return end

	local highlight = Instance.new("Highlight")
	highlight.Name = "ESP_Highlight"
	highlight.FillColor = Color3.fromRGB(255, 0, 0)
	highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	highlight.FillTransparency = 0.5
	highlight.OutlineTransparency = 0
	highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	highlight.Adornee = player.Character
	highlight.Parent = player.Character

	ESP_Objects[player] = highlight
end

local function RemoveESP()
	for _, highlight in pairs(ESP_Objects) do
		if highlight then
			highlight:Destroy()
		end
	end
	ESP_Objects = {}
end

local function EnableESP()
	for _, player in pairs(Players:GetPlayers()) do
		CreateESP(player)
	end

	Players.PlayerAdded:Connect(function(player)
		player.CharacterAdded:Connect(function()
			if ESP_Enabled then
				task.wait(1)
				CreateESP(player)
			end
		end)
	end)
end

Tab:AddToggle({
	Name = "มองผู้เล่น",
	Default = false,
	Callback = function(Value)
		ESP_Enabled = Value

		if Value then
			EnableESP()   -- 👈 เรียก ESP
		else
			RemoveESP()   -- 👈 ปิด ESP
		end
	end
})


--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--// Variables
local LockOn = false
local LockConnection
local LockedTarget = nil

--// เช็กว่าเห็นเป้าจริงไหม (ไม่มีกำแพงบัง)
local function HasLineOfSight(targetChar)
	local myChar = LocalPlayer.Character
	if not myChar then return false end

	local myHead = myChar:FindFirstChild("Head")
	local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
	if not myHead or not targetHRP then return false end

	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Blacklist
	params.FilterDescendantsInstances = {myChar, targetChar}

	local direction = targetHRP.Position - myHead.Position
	local result = workspace:Raycast(myHead.Position, direction, params)

	-- ถ้า Ray ไม่ชนอะไรเลย = เห็นชัด
	return result == nil
end

--// หาเป้าที่ใกล้ที่สุด และต้องไม่มีสิ่งกีดขวาง
local function GetClosestVisiblePlayer()
	local closestPlayer = nil
	local shortestDistance = math.huge
	local myChar = LocalPlayer.Character
	if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return nil end

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer
		and player.Character
		and player.Character:FindFirstChild("HumanoidRootPart") then

			if HasLineOfSight(player.Character) then
				local dist = (player.Character.HumanoidRootPart.Position - myChar.HumanoidRootPart.Position).Magnitude
				if dist < shortestDistance then
					shortestDistance = dist
					closestPlayer = player
				end
			end
		end
	end

	return closestPlayer
end

--// Orion Toggle
Tab:AddToggle({
	Name = "ล็อคเป้า(บัค)",
	Default = false,
	Callback = function(Value)
		LockOn = Value

		if Value then
			LockedTarget = GetClosestVisiblePlayer()
			if not LockedTarget then
				warn("ไม่พบเป้าที่มองเห็นได้")
				return
			end

			LockConnection = RunService.RenderStepped:Connect(function()
				if LockedTarget
				and LockedTarget.Character
				and LockedTarget.Character:FindFirstChild("HumanoidRootPart")
				and HasLineOfSight(LockedTarget.Character) then

					local targetPos = LockedTarget.Character.HumanoidRootPart.Position
					Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPos)
				end
			end)

		else
			if LockConnection then
				LockConnection:Disconnect()
				LockConnection = nil
			end
			LockedTarget = nil
		end
	end
})
--============================--
--         SCRIPT TAB         --
--============================--

local ScriptTab = Window:MakeTab({
	Name = "สคริปต์ทั้งหมด",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--============================--
-- Fly Script
--============================--
local FlyLoaded = false

ScriptTab:AddButton({
	Name = "Fly Gui - สคริปต์บิน",
	Callback = function()
		if FlyLoaded then
			OrionLib:MakeNotification({
				Name = "Script",
				Content = "Fly ถูกโหลดไปแล้ว",
				Time = 3
			})
			return
		end

		FlyLoaded = true
		loadstring(game:HttpGet(
			"https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"
		))()

		OrionLib:MakeNotification({
			Name = "Script",
			Content = "โหลด Fly Script สำเร็จ",
			Time = 4
		})
	end
})

--============================--
-- Infinite Yield (ตัวอย่าง)
--============================--
local IYLoaded = false

ScriptTab:AddButton({
	Name = "Infinite Yield - แอดมินสคริปต์",
	Callback = function()
		if IYLoaded then
			OrionLib:MakeNotification({
				Name = "Script",
				Content = "Infinite Yield ถูกโหลดแล้ว",
				Time = 3
			})
			return
		end

		IYLoaded = true
		loadstring(game:HttpGet(
			"https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
			true
		))()

		OrionLib:MakeNotification({
			Name = "Script",
			Content = "โหลด Infinite Yield สำเร็จ",
			Time = 4
		})
	end
})

local FlyLoaded = false

ScriptTab:AddButton({
	Name = "Brookhaven🏡 - สคริปต์บลู๊คเฮเว่น",
	Callback = function()
		if FlyLoaded then
			OrionLib:MakeNotification({
				Name = "Script",
				Content = "Brookhaven ถูกโหลดไปแล้ว",
				Time = 3
			})
			return
		end

		BrookLoaded = true
		loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-R4D-Leak-12773"))()

		OrionLib:MakeNotification({
			Name = "Script",
			Content = "โหลด Brookhaven สำเร็จ",
			Time = 4
		})
	end
})

-----============================--
--        UTILITY TAB         --
--============================--

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer

--// สร้างแท็บ Utility
local UtilityTab = Window:MakeTab({
	Name = "ตั้งค่าเพิ่มเติม",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--============================--
-- Anti AFK
--============================--
local AntiAFK = false

UtilityTab:AddToggle({
	Name = "Anti AFK",
	Default = false,
	Callback = function(Value)
		AntiAFK = Value
		if Value then
			LocalPlayer.Idled:Connect(function()
				if AntiAFK then
					VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
					task.wait(1)
					VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
				end
			end)
		end
	end
})

--============================--
-- Rejoin Server
--============================--
UtilityTab:AddButton({
	Name = "Rejoin Server",
	Callback = function()
		TeleportService:Teleport(game.PlaceId, LocalPlayer)
	end
})

--============================--
-- FPS Boost
--============================--
UtilityTab:AddButton({
	Name = "FPS Boost",
	Callback = function()
		for _, v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Material = Enum.Material.SmoothPlastic
				v.Reflectance = 0
			elseif v:IsA("Decal") or v:IsA("Texture") then
				v:Destroy()
			elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
				v.Enabled = false
			end
		end
		Lighting.GlobalShadows = false
	end
})

--============================--
-- Remove Fog / Blur
--============================--
UtilityTab:AddToggle({
	Name = "Remove Fog / Blur",
	Default = false,
	Callback = function(Value)
		if Value then
			Lighting.FogEnd = 100000
			for _, v in pairs(Lighting:GetChildren()) do
				if v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") then
					v.Enabled = false
				end
			end
		end
	end
})

--============================--
-- Reset Character
--============================--
UtilityTab:AddButton({
	Name = "Reset Character",
	Callback = function()
		local char = LocalPlayer.Character
		if char and char:FindFirstChild("Humanoid") then
			char.Humanoid.Health = 0
		end
	end
})

--============================--
-- Toggle UI (คีย์ลัด)
--============================--
UtilityTab:AddBind({
	Name = "Toggle UI",
	Default = Enum.KeyCode.RightControl,
	Hold = false,
	Callback = function()
		OrionLib:ToggleUI()
	end
})
