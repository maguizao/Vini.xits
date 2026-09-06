-- ============================================================================
-- LOADER.LUA
-- Cole a URL do seu NexusUILib.lua no campo abaixo
-- ============================================================================

local NEXUS_LIB_URL = "https://raw.githubusercontent.com/SEU_USER/SEU_REPO/main/NexusUILib.lua"

local CONFIG = {
	ScriptName = "NEXUS UI",
	LoadingDuration = 4.0,
	HoldAfter100 = 1.5,
	N_MoveSpeed = 1.0,
	LinesExpandSpeed = 0.8,
	HoldFinalName = 3.5,
	FadeOutSpeed = 0.8,
	BackgroundColor = Color3.fromRGB(8, 8, 12),
	ProgressBgColor = Color3.fromRGB(20, 20, 25),
	N_TargetPosition = UDim2.new(0.32, 0, 0.5, 0),
	SoundId = "rbxassetid://12222200"
}

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

pcall(function()
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
end)

if CoreGui:FindFirstChild("FullIntroGui") then
	CoreGui.FullIntroGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FullIntroGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999999999
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then
	ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

local RevealSound = Instance.new("Sound")
RevealSound.SoundId = CONFIG.SoundId
RevealSound.Volume = 0.8
RevealSound.Parent = ScreenGui

local MainBackground = Instance.new("Frame")
MainBackground.Size = UDim2.new(1, 0, 1, 0)
MainBackground.BackgroundColor3 = CONFIG.BackgroundColor
MainBackground.BorderSizePixel = 0
MainBackground.ZIndex = 999999
MainBackground.Parent = ScreenGui

local BackgroundGlow = Instance.new("ImageLabel")
BackgroundGlow.Size = UDim2.new(0, 800, 0, 800)
BackgroundGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
BackgroundGlow.AnchorPoint = Vector2.new(0.5, 0.5)
BackgroundGlow.BackgroundTransparency = 1
BackgroundGlow.Image = "rbxassetid://6015801993"
BackgroundGlow.ImageColor3 = Color3.fromRGB(45, 55, 75)
BackgroundGlow.ImageTransparency = 0.65
BackgroundGlow.ZIndex = 999999
BackgroundGlow.Parent = MainBackground

local GridTexture = Instance.new("ImageLabel")
GridTexture.Size = UDim2.new(1, 0, 1, 0)
GridTexture.BackgroundTransparency = 1
GridTexture.Image = "rbxassetid://996834483"
GridTexture.ScaleType = Enum.ScaleType.Tile
GridTexture.TileSize = UDim2.new(0, 40, 0, 40)
GridTexture.ImageColor3 = Color3.fromRGB(255, 255, 255)
GridTexture.ImageTransparency = 0.95
GridTexture.ZIndex = 999999
GridTexture.Parent = MainBackground

local N_Label = Instance.new("TextLabel")
N_Label.Size = UDim2.new(0, 120, 0, 120)
N_Label.Position = UDim2.new(0.5, 0, 0.45, 0)
N_Label.AnchorPoint = Vector2.new(0.5, 0.5)
N_Label.BackgroundTransparency = 1
N_Label.Text = "N"
N_Label.Font = Enum.Font.GothamBlack
N_Label.TextSize = 0
N_Label.TextColor3 = Color3.fromRGB(255, 255, 255)
N_Label.TextTransparency = 1
N_Label.ZIndex = 1000000
N_Label.Parent = MainBackground

local N_Gradient = Instance.new("UIGradient")
N_Gradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(240, 245, 255)),
	ColorSequenceKeypoint.new(0.25, Color3.fromRGB(150, 155, 165)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(0.75, Color3.fromRGB(140, 145, 155)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(230, 235, 245))
})
N_Gradient.Rotation = 45
N_Gradient.Parent = N_Label

local N_Stroke = Instance.new("UIStroke")
N_Stroke.Thickness = 1.5
N_Stroke.Color = Color3.fromRGB(200, 210, 225)
N_Stroke.Transparency = 1
N_Stroke.Parent = N_Label

local LoadingContainer = Instance.new("Frame")
LoadingContainer.Size = UDim2.new(0, 300, 0, 5)
LoadingContainer.Position = UDim2.new(0.5, 0, 0.75, 0)
LoadingContainer.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingContainer.BackgroundColor3 = CONFIG.ProgressBgColor
LoadingContainer.BorderSizePixel = 0
LoadingContainer.BackgroundTransparency = 1
LoadingContainer.ZIndex = 1000000
LoadingContainer.Parent = MainBackground

local UICorner1 = Instance.new("UICorner")
UICorner1.CornerRadius = UDim.new(1, 0)
UICorner1.Parent = LoadingContainer

local ProgressBar = Instance.new("Frame")
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ProgressBar.BorderSizePixel = 0
ProgressBar.ZIndex = 1000001
ProgressBar.Parent = LoadingContainer

local BarGradient = Instance.new("UIGradient")
BarGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 185, 195)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
})
BarGradient.Parent = ProgressBar

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(1, 0)
UICorner2.Parent = ProgressBar

local ProgressGlow = Instance.new("Frame")
ProgressGlow.Size = UDim2.new(0, 10, 0, 10)
ProgressGlow.Position = UDim2.new(1, 0, 0.5, 0)
ProgressGlow.AnchorPoint = Vector2.new(0.5, 0.5)
ProgressGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ProgressGlow.BorderSizePixel = 0
ProgressGlow.BackgroundTransparency = 1
ProgressGlow.ZIndex = 1000002
ProgressGlow.Parent = ProgressBar

local GlowCorner = Instance.new("UICorner")
GlowCorner.CornerRadius = UDim.new(1, 0)
GlowCorner.Parent = ProgressGlow

local ProgressPercent = Instance.new("TextLabel")
ProgressPercent.Size = UDim2.new(0, 100, 0, 20)
ProgressPercent.Position = UDim2.new(0.5, 0, 1, 8)
ProgressPercent.AnchorPoint = Vector2.new(0.5, 0)
ProgressPercent.BackgroundTransparency = 1
ProgressPercent.Text = "0%"
ProgressPercent.Font = Enum.Font.GothamMedium
ProgressPercent.TextSize = 13
ProgressPercent.TextColor3 = Color3.fromRGB(220, 225, 235)
ProgressPercent.TextTransparency = 1
ProgressPercent.ZIndex = 1000000
ProgressPercent.Parent = LoadingContainer

local DetailsContainer = Instance.new("Frame")
DetailsContainer.Size = UDim2.new(0, 320, 0, 60)
DetailsContainer.Position = UDim2.new(0.38, 30, 0.5, 0)
DetailsContainer.AnchorPoint = Vector2.new(0, 0.5)
DetailsContainer.BackgroundTransparency = 1
DetailsContainer.ZIndex = 1000000
DetailsContainer.Parent = MainBackground

local LineTop = Instance.new("Frame")
LineTop.Size = UDim2.new(0, 0, 0, 2)
LineTop.Position = UDim2.new(0, 0, 0.2, 0)
LineTop.BackgroundColor3 = Color3.fromRGB(220, 225, 235)
LineTop.BorderSizePixel = 0
LineTop.ZIndex = 1000000
LineTop.Parent = DetailsContainer

local LineBottom = Instance.new("Frame")
LineBottom.Size = UDim2.new(0, 0, 0, 2)
LineBottom.Position = UDim2.new(0, 0, 0.8, 0)
LineBottom.BackgroundColor3 = Color3.fromRGB(220, 225, 235)
LineBottom.BorderSizePixel = 0
LineBottom.ZIndex = 1000000
LineBottom.Parent = DetailsContainer

local ScriptNameLabel = Instance.new("TextLabel")
ScriptNameLabel.Size = UDim2.new(1, 0, 0.4, 0)
ScriptNameLabel.Position = UDim2.new(0, 0, 0.3, 0)
ScriptNameLabel.BackgroundTransparency = 1
ScriptNameLabel.Text = CONFIG.ScriptName
ScriptNameLabel.Font = Enum.Font.GothamBold
ScriptNameLabel.TextSize = 24
ScriptNameLabel.TextColor3 = Color3.fromRGB(240, 245, 255)
ScriptNameLabel.TextTransparency = 1
ScriptNameLabel.TextXAlignment = Enum.TextXAlignment.Left
ScriptNameLabel.ZIndex = 1000000
ScriptNameLabel.Parent = DetailsContainer

-- ============================================================================
-- SEQUÊNCIA DO LOADING
-- ============================================================================

local function RunSequence()
	local nAppear = TweenService:Create(N_Label, TweenInfo.new(0.9, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		TextTransparency = 0,
		TextSize = 100
	})
	TweenService:Create(N_Stroke, TweenInfo.new(0.9), { Transparency = 0.3 }):Play()
	nAppear:Play()
	nAppear.Completed:Wait()

	TweenService:Create(LoadingContainer, TweenInfo.new(0.4), { BackgroundTransparency = 0 }):Play()
	TweenService:Create(ProgressPercent, TweenInfo.new(0.4), { TextTransparency = 0 }):Play()
	TweenService:Create(ProgressGlow, TweenInfo.new(0.4), { BackgroundTransparency = 0 }):Play()
	task.wait(0.2)

	TweenService:Create(ProgressBar, TweenInfo.new(CONFIG.LoadingDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = UDim2.new(1, 0, 1, 0)
	}):Play()

	local startTime = tick()
	while tick() - startTime < CONFIG.LoadingDuration do
		local p = math.floor(((tick() - startTime) / CONFIG.LoadingDuration) * 100)
		ProgressPercent.Text = math.clamp(p, 0, 100) .. "%"
		task.wait(0.03)
	end
	ProgressPercent.Text = "100%"
	task.wait(CONFIG.HoldAfter100)

	TweenService:Create(LoadingContainer, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
	TweenService:Create(ProgressBar, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
	TweenService:Create(ProgressPercent, TweenInfo.new(0.3), { TextTransparency = 1 }):Play()
	TweenService:Create(ProgressGlow, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
	task.wait(0.3)

	local nMove = TweenService:Create(N_Label, TweenInfo.new(CONFIG.N_MoveSpeed, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Position = CONFIG.N_TargetPosition
	})
	nMove:Play()
	nMove.Completed:Wait()

	pcall(function() RevealSound:Play() end)

	TweenService:Create(LineTop, TweenInfo.new(CONFIG.LinesExpandSpeed, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(0, 240, 0, 2) }):Play()
	task.wait(0.12)
	TweenService:Create(LineBottom, TweenInfo.new(CONFIG.LinesExpandSpeed, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(0, 240, 0, 2) }):Play()

	local scriptNameFade = TweenService:Create(ScriptNameLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { TextTransparency = 0 })
	scriptNameFade:Play()
	scriptNameFade.Completed:Wait()
	task.wait(CONFIG.HoldFinalName)

	-- Fade out
	TweenService:Create(BackgroundGlow, TweenInfo.new(CONFIG.FadeOutSpeed * 0.5), { ImageTransparency = 1 }):Play()
	TweenService:Create(GridTexture, TweenInfo.new(CONFIG.FadeOutSpeed * 0.5), { ImageTransparency = 1 }):Play()
	TweenService:Create(N_Label, TweenInfo.new(CONFIG.FadeOutSpeed * 0.5), { TextTransparency = 1 }):Play()
	TweenService:Create(N_Stroke, TweenInfo.new(CONFIG.FadeOutSpeed * 0.5), { Transparency = 1 }):Play()
	TweenService:Create(LineTop, TweenInfo.new(CONFIG.FadeOutSpeed * 0.5), { BackgroundTransparency = 1 }):Play()
	TweenService:Create(LineBottom, TweenInfo.new(CONFIG.FadeOutSpeed * 0.5), { BackgroundTransparency = 1 }):Play()
	TweenService:Create(ScriptNameLabel, TweenInfo.new(CONFIG.FadeOutSpeed * 0.5), { TextTransparency = 1 }):Play()

	local fadeOutAll = TweenService:Create(MainBackground, TweenInfo.new(CONFIG.FadeOutSpeed, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { BackgroundTransparency = 1 })
	fadeOutAll:Play()
	fadeOutAll.Completed:Wait()

	ScreenGui:Destroy()
	pcall(function() StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true) end)

	-- ✅ Carrega o NexusUILib e retorna para o seu script usar
	local NexusUI = loadstring(game:HttpGet(NEXUS_LIB_URL))()
	return NexusUI
end

-- Executa e expõe o NexusUI globalmente
local NexusUI = RunSequence()
return NexusUI
