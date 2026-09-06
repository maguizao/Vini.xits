-- ============================================================================
-- LOADING SCREEN (roda antes do NexusUI abrir)
-- ============================================================================

local CONFIG = {
	ScriptURL = "", -- deixe vazio se não quiser carregar outro script depois
	ScriptName = "NEXUS UI",
	LoadingDuration = 5.0,
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
-- NEXUS UI LIB (carrega após o loading terminar)
-- ============================================================================

local function LoadNexusUI()
	local UserInputService = game:GetService("UserInputService")
	local HttpService = game:GetService("HttpService")
	local RunService = game:GetService("RunService")

	local LibraryConfig = {
		WindowTitle = "NEXUS UI",
		DefaultTheme = "Original",
		SaveFileName = "NexusUI_Config.json",
		ClickSoundId = "rbxassetid://4499400560",
		EnableSaving = true,
		IncludeDefaultSettingsTab = true,
		IncludeDefaultCreditsTab = true,
		AnimationSpeed = 0.3,
	}

	local Themes = {
		Original = { Background = Color3.fromRGB(15, 15, 20), Accent = Color3.fromRGB(0, 170, 255), AccentDark = Color3.fromRGB(0, 80, 150), Ghost = Color3.fromRGB(140, 50, 255), Text = Color3.fromRGB(255, 255, 255), TextDim = Color3.fromRGB(150, 150, 150), ItemBG = Color3.fromRGB(30, 30, 35), InputBG = Color3.fromRGB(10, 10, 15), TabBG = Color3.fromRGB(25, 25, 30) },
		Red = { Background = Color3.fromRGB(20, 15, 15), Accent = Color3.fromRGB(255, 0, 0), AccentDark = Color3.fromRGB(150, 0, 0), Ghost = Color3.fromRGB(255, 50, 140), Text = Color3.fromRGB(255, 255, 255), TextDim = Color3.fromRGB(150, 150, 150), ItemBG = Color3.fromRGB(35, 30, 30), InputBG = Color3.fromRGB(15, 10, 10), TabBG = Color3.fromRGB(30, 25, 25) },
		Blue = { Background = Color3.fromRGB(15, 15, 20), Accent = Color3.fromRGB(0, 100, 255), AccentDark = Color3.fromRGB(0, 50, 150), Ghost = Color3.fromRGB(50, 140, 255), Text = Color3.fromRGB(255, 255, 255), TextDim = Color3.fromRGB(150, 150, 150), ItemBG = Color3.fromRGB(30, 30, 35), InputBG = Color3.fromRGB(10, 10, 15), TabBG = Color3.fromRGB(25, 25, 30) },
		Verde = { Background = Color3.fromRGB(15, 20, 15), Accent = Color3.fromRGB(0, 255, 0), AccentDark = Color3.fromRGB(0, 150, 0), Ghost = Color3.fromRGB(140, 255, 50), Text = Color3.fromRGB(255, 255, 255), TextDim = Color3.fromRGB(150, 150, 150), ItemBG = Color3.fromRGB(30, 35, 30), InputBG = Color3.fromRGB(10, 15, 10), TabBG = Color3.fromRGB(25, 30, 25) },
		Purple = { Background = Color3.fromRGB(20, 15, 20), Accent = Color3.fromRGB(170, 0, 255), AccentDark = Color3.fromRGB(80, 0, 150), Ghost = Color3.fromRGB(200, 50, 255), Text = Color3.fromRGB(255, 255, 255), TextDim = Color3.fromRGB(150, 150, 150), ItemBG = Color3.fromRGB(35, 30, 35), InputBG = Color3.fromRGB(15, 10, 15), TabBG = Color3.fromRGB(30, 25, 30) },
		Yellow = { Background = Color3.fromRGB(20, 20, 15), Accent = Color3.fromRGB(255, 255, 0), AccentDark = Color3.fromRGB(150, 150, 0), Ghost = Color3.fromRGB(255, 255, 50), Text = Color3.fromRGB(255, 255, 255), TextDim = Color3.fromRGB(150, 150, 150), ItemBG = Color3.fromRGB(35, 35, 30), InputBG = Color3.fromRGB(15, 15, 10), TabBG = Color3.fromRGB(30, 30, 25) },
		Branco = { Background = Color3.fromRGB(240, 240, 240), Accent = Color3.fromRGB(0, 120, 255), AccentDark = Color3.fromRGB(0, 80, 200), Ghost = Color3.fromRGB(100, 100, 100), Text = Color3.fromRGB(0, 0, 0), TextDim = Color3.fromRGB(80, 80, 80), ItemBG = Color3.fromRGB(200, 200, 200), InputBG = Color3.fromRGB(180, 180, 180), TabBG = Color3.fromRGB(210, 210, 210) },
		Preto = { Background = Color3.fromRGB(10, 10, 10), Accent = Color3.fromRGB(255, 255, 255), AccentDark = Color3.fromRGB(150, 150, 150), Ghost = Color3.fromRGB(100, 100, 100), Text = Color3.fromRGB(255, 255, 255), TextDim = Color3.fromRGB(150, 150, 150), ItemBG = Color3.fromRGB(30, 30, 30), InputBG = Color3.fromRGB(20, 20, 20), TabBG = Color3.fromRGB(25, 25, 25) },
	}

	local NexusUI = {
		ScreenGui = nil, MainFrame = nil, TabContainer = nil, TabScroll = nil,
		ContentContainer = nil, ContentSlide = nil, TitleLabel = nil, ToggleButton = nil,
		Tabs = {}, CurrentTheme = nil, NotifyContainer = nil, NotifyList = nil,
		CreditsContainer = nil, SavedPositions = {}, Config = {}, RegisteredElements = {},
		Animating = false, TabButtons = {},
	}

	local function AddCorner(instance, radius)
		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, radius)
		corner.Parent = instance
		return corner
	end

	local function AddStroke(instance, color, thickness)
		local stroke = Instance.new("UIStroke")
		stroke.Color = color
		stroke.Thickness = thickness
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke.Parent = instance
		return stroke
	end

	local function AddShadow(instance, size, color, transparency)
		local shadow = Instance.new("ImageLabel")
		shadow.Name = "Shadow"
		shadow.Size = UDim2.new(1, size * 2, 1, size * 2)
		shadow.Position = UDim2.new(0.5, -size, 0.5, -size)
		shadow.BackgroundTransparency = 1
		shadow.Image = "rbxassetid://1316045115"
		shadow.ImageColor3 = color or Color3.new(0, 0, 0)
		shadow.ImageTransparency = transparency or 0.5
		shadow.ZIndex = -1
		shadow.Parent = instance
		return shadow
	end

	local function PlayClickSound()
		task.spawn(function()
			local s = Instance.new("Sound")
			s.SoundId = LibraryConfig.ClickSoundId
			s.Volume = 1
			s.Parent = NexusUI.ScreenGui or CoreGui
			s:Play()
			s.Ended:Connect(function() s:Destroy() end)
		end)
	end

	local function SaveUIConfig()
		if not LibraryConfig.EnableSaving then return end
		if not writefile then return end
		local config = { Theme = LibraryConfig.DefaultTheme, Positions = NexusUI.SavedPositions, Settings = NexusUI.Config }
		local success, encoded = pcall(function() return HttpService:JSONEncode(config) end)
		if success then pcall(function() writefile(LibraryConfig.SaveFileName, encoded) end) end
	end

	local function LoadUIConfig()
		if not LibraryConfig.EnableSaving then return end
		if not isfile then return end
		if isfile(LibraryConfig.SaveFileName) then
			local content = readfile(LibraryConfig.SaveFileName)
			local success, decoded = pcall(function() return HttpService:JSONDecode(content) end)
			if success and decoded then
				if decoded.Theme and Themes[decoded.Theme] then
					NexusUI.CurrentTheme = Themes[decoded.Theme]
					LibraryConfig.DefaultTheme = decoded.Theme
				end
				if decoded.Positions then NexusUI.SavedPositions = decoded.Positions end
				if decoded.Settings then NexusUI.Config = decoded.Settings end
			end
		end
		if not NexusUI.CurrentTheme then
			NexusUI.CurrentTheme = Themes[LibraryConfig.DefaultTheme] or Themes.Original
		end
	end

	local function ApplyThemeToUI()
		if NexusUI.MainFrame then
			NexusUI.MainFrame.BackgroundColor3 = NexusUI.CurrentTheme.Background
			local stroke = NexusUI.MainFrame:FindFirstChildOfClass("UIStroke")
			if stroke then stroke.Color = NexusUI.CurrentTheme.Accent end
		end
		if NexusUI.TitleLabel then NexusUI.TitleLabel.TextColor3 = NexusUI.CurrentTheme.Accent end
		if NexusUI.TabContainer then NexusUI.TabContainer.BackgroundColor3 = NexusUI.CurrentTheme.TabBG end
		for _, tab in ipairs(NexusUI.Tabs) do
			if tab.Btn then
				tab.Btn.BackgroundColor3 = NexusUI.CurrentTheme.TabBG
				tab.Btn.TextColor3 = NexusUI.CurrentTheme.TextDim
				if tab.Frame and tab.Frame.Visible then
					tab.Btn.BackgroundColor3 = NexusUI.CurrentTheme.AccentDark
					tab.Btn.TextColor3 = NexusUI.CurrentTheme.Text
				end
			end
		end
	end

	function NexusUI.MakeDraggableWithSave(frame, saveName, saveCallback)
		saveName = saveName or frame.Name or "Unknown"
		local dragging, dragInput, dragStart, startPos
		frame.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then dragging = false end
				end)
			end
		end)
		frame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if dragging and input == dragInput then
				local delta = input.Position - dragStart
				frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				NexusUI.SavedPositions[saveName] = { frame.Position.X.Scale, frame.Position.X.Offset, frame.Position.Y.Scale, frame.Position.Y.Offset }
				SaveUIConfig()
				if saveCallback then saveCallback(frame) end
			end
		end)
		if NexusUI.SavedPositions and NexusUI.SavedPositions[saveName] then
			local p = NexusUI.SavedPositions[saveName]
			if #p >= 4 then frame.Position = UDim2.new(p[1], p[2], p[3], p[4]) end
		end
		return frame
	end

	local function SetupNotifications()
		if NexusUI.NotifyContainer then return end
		NexusUI.NotifyContainer = Instance.new("ScreenGui")
		NexusUI.NotifyContainer.Name = "NexusUINotifyContainer"
		NexusUI.NotifyContainer.Parent = CoreGui
		NexusUI.NotifyContainer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		NexusUI.NotifyContainer.IgnoreGuiInset = true
		NexusUI.NotifyList = Instance.new("Frame")
		NexusUI.NotifyList.Size = UDim2.new(0, 300, 1, 0)
		NexusUI.NotifyList.Position = UDim2.new(0, 20, 0.8, 0)
		NexusUI.NotifyList.BackgroundTransparency = 1
		NexusUI.NotifyList.Parent = NexusUI.NotifyContainer
		local layout = Instance.new("UIListLayout")
		layout.Parent = NexusUI.NotifyList
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout.VerticalAlignment = Enum.VerticalAlignment.Top
		layout.Padding = UDim.new(0, 8)
	end

	function NexusUI.Notify(title, text, duration)
		SetupNotifications()
		local order = -(os.clock() * 1000)
		local Frame = Instance.new("Frame")
		Frame.Size = UDim2.new(1, 0, 0, 60)
		Frame.BackgroundColor3 = NexusUI.CurrentTheme.Background
		Frame.BackgroundTransparency = 0.1
		Frame.BorderSizePixel = 0
		Frame.LayoutOrder = order
		Frame.Parent = NexusUI.NotifyList
		Frame.Position = UDim2.new(1, 0, 0, 0)
		local Stroke = AddStroke(Frame, NexusUI.CurrentTheme.Accent, 1.5)
		AddCorner(Frame, 6)
		AddShadow(Frame, 10, Color3.new(0, 0, 0), 0.4)
		local TitleLbl = Instance.new("TextLabel")
		TitleLbl.Parent = Frame
		TitleLbl.Size = UDim2.new(1, -10, 0, 20)
		TitleLbl.Position = UDim2.new(0, 10, 0, 5)
		TitleLbl.BackgroundTransparency = 1
		TitleLbl.Text = title
		TitleLbl.Font = Enum.Font.GothamBlack
		TitleLbl.TextColor3 = NexusUI.CurrentTheme.Accent
		TitleLbl.TextSize = 14
		TitleLbl.TextXAlignment = Enum.TextXAlignment.Left
		local MsgLbl = Instance.new("TextLabel")
		MsgLbl.Parent = Frame
		MsgLbl.Size = UDim2.new(1, -10, 0, 30)
		MsgLbl.Position = UDim2.new(0, 10, 0, 25)
		MsgLbl.BackgroundTransparency = 1
		MsgLbl.Text = text
		MsgLbl.Font = Enum.Font.GothamSemibold
		MsgLbl.TextColor3 = NexusUI.CurrentTheme.Text
		MsgLbl.TextSize = 12
		MsgLbl.TextXAlignment = Enum.TextXAlignment.Left
		MsgLbl.TextWrapped = true
		Frame.BackgroundTransparency = 1
		TitleLbl.TextTransparency = 1
		MsgLbl.TextTransparency = 1
		Stroke.Transparency = 1
		TweenService:Create(Frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(0, 0, 0, 0) }):Play()
		TweenService:Create(Frame, TweenInfo.new(0.3), { BackgroundTransparency = 0.1 }):Play()
		TweenService:Create(TitleLbl, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
		TweenService:Create(MsgLbl, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
		TweenService:Create(Stroke, TweenInfo.new(0.3), { Transparency = 0 }):Play()
		task.delay(duration or 3, function()
			if Frame then
				TweenService:Create(Frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Position = UDim2.new(1, 0, 0, 0) }):Play()
				TweenService:Create(Frame, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
				TweenService:Create(TitleLbl, TweenInfo.new(0.3), { TextTransparency = 1 }):Play()
				TweenService:Create(MsgLbl, TweenInfo.new(0.3), { TextTransparency = 1 }):Play()
				TweenService:Create(Stroke, TweenInfo.new(0.3), { Transparency = 1 }):Play()
				task.wait(0.3)
				Frame:Destroy()
			end
		end)
	end

	local function RegisterElement(id, type, setter, default)
		NexusUI.RegisteredElements[id] = { type = type, setter = setter, default = default }
	end

	local function ApplySavedSettings()
		for id, element in pairs(NexusUI.RegisteredElements) do
			local savedValue = NexusUI.Config[id]
			if savedValue ~= nil and element.setter then element.setter(savedValue) end
		end
	end

	function NexusUI.SaveAllSettings()
		SaveUIConfig()
		NexusUI.Notify("CONFIG", "Settings saved successfully!", 2)
	end

	function NexusUI.ResetAllSettings()
		for id, element in pairs(NexusUI.RegisteredElements) do
			if element.default ~= nil and element.setter then element.setter(element.default) end
		end
		NexusUI.SetTheme("Original")
		SaveUIConfig()
		NexusUI.Notify("CONFIG", "Settings reset to default!", 2)
	end

	function NexusUI.SetTheme(themeName)
		if Themes[themeName] then
			NexusUI.CurrentTheme = Themes[themeName]
			LibraryConfig.DefaultTheme = themeName
			ApplyThemeToUI()
			SaveUIConfig()
			return true
		end
		return false
	end

	function NexusUI.SetWindowTitle(title)
		LibraryConfig.WindowTitle = title
		if NexusUI.TitleLabel then NexusUI.TitleLabel.Text = title end
	end

	function NexusUI.SetConfigFileName(fileName)
		if type(fileName) == "string" and fileName ~= "" then
			LibraryConfig.SaveFileName = fileName
			LoadUIConfig()
			for id, element in pairs(NexusUI.RegisteredElements) do
				local savedValue = NexusUI.Config[id]
				if savedValue ~= nil and element.setter then element.setter(savedValue) end
			end
			ApplyThemeToUI()
			NexusUI.Notify("CONFIG", "Arquivo alterado para: " .. fileName, 3)
			return true
		end
		return false
	end

	function NexusUI.GetConfigFileName()
		return LibraryConfig.SaveFileName
	end

	local function ReorderTabs()
		local normalTabs, fixedTabs = {}, {}
		for _, tab in ipairs(NexusUI.Tabs) do
			if tab.IsFixed then table.insert(fixedTabs, tab) else table.insert(normalTabs, tab) end
		end
		local orderedTabs = {}
		for _, tab in ipairs(normalTabs) do table.insert(orderedTabs, tab) end
		for _, tab in ipairs(fixedTabs) do table.insert(orderedTabs, tab) end
		local xOffset = 5
		for _, tab in ipairs(orderedTabs) do
			tab.Btn.Position = UDim2.new(0, xOffset, 0, 5)
			xOffset = xOffset + tab.Btn.Size.X.Offset + 2
		end
		if NexusUI.TabScroll then NexusUI.TabScroll.CanvasSize = UDim2.new(0, xOffset + 10, 0, 0) end
	end

	function NexusUI.CreateWindow(title, toggleImageId, includeDefaultSettings, configFileName, includeDefaultCredits)
		if includeDefaultSettings == nil then includeDefaultSettings = LibraryConfig.IncludeDefaultSettingsTab end
		if includeDefaultCredits == nil then includeDefaultCredits = LibraryConfig.IncludeDefaultCreditsTab end
		if configFileName then LibraryConfig.SaveFileName = configFileName end
		if NexusUI.ScreenGui then NexusUI.ScreenGui:Destroy() end
		title = title or LibraryConfig.WindowTitle
		LoadUIConfig()

		NexusUI.ScreenGui = Instance.new("ScreenGui")
		NexusUI.ScreenGui.Name = "NexusUIMain"
		NexusUI.ScreenGui.Parent = CoreGui
		NexusUI.ScreenGui.ResetOnSpawn = false
		NexusUI.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		local toggleBtn = Instance.new("ImageButton")
		toggleBtn.Name = "ToggleButton"
		toggleBtn.Parent = NexusUI.ScreenGui
		toggleBtn.Size = UDim2.new(0, 40, 0, 40)
		toggleBtn.Position = UDim2.new(0.1, 0, 0.1, 0)
		toggleBtn.BackgroundTransparency = 1
		toggleBtn.Image = toggleImageId or "rbxassetid://108999865215827"
		toggleBtn.ImageColor3 = Color3.new(1, 1, 1)
		toggleBtn.ScaleType = Enum.ScaleType.Fit
		toggleBtn.ZIndex = 100
		AddCorner(toggleBtn, 10)
		AddShadow(toggleBtn, 12, Color3.new(0, 0, 0), 0.5)
		NexusUI.MakeDraggableWithSave(toggleBtn, "ToggleButton")
		toggleBtn.MouseEnter:Connect(function() TweenService:Create(toggleBtn, TweenInfo.new(0.2), { ImageColor3 = NexusUI.CurrentTheme.Accent }):Play() end)
		toggleBtn.MouseLeave:Connect(function() TweenService:Create(toggleBtn, TweenInfo.new(0.2), { ImageColor3 = Color3.new(1, 1, 1) }):Play() end)

		local mainFrame = Instance.new("Frame")
		mainFrame.Name = "MainFrame"
		mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		mainFrame.Size = UDim2.new(0, 0, 0, 0)
		mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		mainFrame.BackgroundColor3 = NexusUI.CurrentTheme.Background
		mainFrame.Parent = NexusUI.ScreenGui
		mainFrame.ClipsDescendants = true
		mainFrame.Visible = true
		AddCorner(mainFrame, 12)
		AddStroke(mainFrame, NexusUI.CurrentTheme.Accent, 2)
		AddShadow(mainFrame, 20, Color3.new(0, 0, 0), 0.6)

		local titleLabel = Instance.new("TextLabel")
		titleLabel.Name = "TitleLabel"
		titleLabel.Size = UDim2.new(1, 0, 0, 30)
		titleLabel.BackgroundTransparency = 1
		titleLabel.Text = title
		titleLabel.TextColor3 = NexusUI.CurrentTheme.Accent
		titleLabel.Font = Enum.Font.GothamBlack
		titleLabel.TextSize = 14
		titleLabel.TextXAlignment = Enum.TextXAlignment.Center
		titleLabel.Parent = mainFrame

		local tabContainer = Instance.new("Frame")
		tabContainer.Name = "TabContainer"
		tabContainer.Size = UDim2.new(1, 0, 0, 35)
		tabContainer.Position = UDim2.new(0, 0, 0, 30)
		tabContainer.BackgroundColor3 = NexusUI.CurrentTheme.TabBG
		tabContainer.BackgroundTransparency = 0.5
		tabContainer.Parent = mainFrame
		AddCorner(tabContainer, 6)

		local tabScroll = Instance.new("ScrollingFrame")
		tabScroll.Name = "TabScroll"
		tabScroll.Size = UDim2.new(1, 0, 1, 0)
		tabScroll.BackgroundTransparency = 1
		tabScroll.ScrollBarThickness = 3
		tabScroll.ScrollBarImageColor3 = NexusUI.CurrentTheme.Accent
		tabScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
		tabScroll.AutomaticCanvasSize = Enum.AutomaticSize.None
		tabScroll.ScrollingDirection = Enum.ScrollingDirection.X
		tabScroll.Parent = tabContainer

		local content = Instance.new("Frame")
		content.Name = "ContentContainer"
		content.Size = UDim2.new(1, -10, 1, -75)
		content.Position = UDim2.new(0, 5, 0, 70)
		content.BackgroundTransparency = 1
		content.ClipsDescendants = true
		content.Parent = mainFrame

		local contentSlide = Instance.new("Frame")
		contentSlide.Name = "ContentSlide"
		contentSlide.Size = UDim2.new(1, 0, 1, 0)
		contentSlide.BackgroundTransparency = 1
		contentSlide.Parent = content

		if NexusUI.SavedPositions["MainFrame"] then
			local p = NexusUI.SavedPositions["MainFrame"]
			mainFrame.Position = UDim2.new(p[1], p[2], p[3], p[4])
		end

		NexusUI.MainFrame = mainFrame
		NexusUI.TabContainer = tabContainer
		NexusUI.TabScroll = tabScroll
		NexusUI.ContentContainer = content
		NexusUI.ContentSlide = contentSlide
		NexusUI.TitleLabel = titleLabel
		NexusUI.ToggleButton = toggleBtn
		NexusUI.Tabs = {}

		toggleBtn.MouseButton1Click:Connect(function()
			PlayClickSound()
			if mainFrame.Visible then
				mainFrame.Visible = false
			else
				mainFrame.Visible = true
				mainFrame.Size = UDim2.new(0, 0, 0, 0)
				mainFrame.BackgroundTransparency = 1
				TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 500, 0, 350), BackgroundTransparency = 0 }):Play()
			end
		end)

		mainFrame.Size = UDim2.new(0, 0, 0, 0)
		TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 500, 0, 350) }):Play()

		ApplyThemeToUI()

		if includeDefaultSettings then
			local settingsTab = NexusUI.CreateTab("⚙ SETTINGS", true)
			NexusUI.CreateSection(settingsTab, "CONFIGURATION")
			NexusUI.CreateButton(settingsTab, "SAVE CONFIGURATION", function() NexusUI.SaveAllSettings() end)
			NexusUI.CreateButton(settingsTab, "RESET SETTINGS", function() NexusUI.ResetAllSettings() end)
			NexusUI.CreateSection(settingsTab, "CUSTOM THEME")
			NexusUI.CreateThemeSelector(settingsTab, function(themeName) NexusUI.SetTheme(themeName) end)
		end

		if includeDefaultCredits then
			local creditsTab = NexusUI.CreateTab("✨ CREDITS", true)
			NexusUI.CreateSection(creditsTab, "DEVELOPERS & CONTRIBUTORS")
			local scrollContainer = Instance.new("ScrollingFrame")
			scrollContainer.Size = UDim2.new(1, -10, 0, 280)
			scrollContainer.BackgroundColor3 = NexusUI.CurrentTheme.ItemBG
			scrollContainer.BackgroundTransparency = 0.5
			scrollContainer.ScrollBarThickness = 4
			scrollContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
			scrollContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
			scrollContainer.Parent = creditsTab
			AddCorner(scrollContainer, 8)
			local containerLayout = Instance.new("UIListLayout")
			containerLayout.Padding = UDim.new(0, 6)
			containerLayout.SortOrder = Enum.SortOrder.LayoutOrder
			containerLayout.Parent = scrollContainer
			NexusUI.CreditsContainer = scrollContainer
		end

		ReorderTabs()
		return NexusUI
	end

	function NexusUI.CreateTab(name, isFixed)
		if not NexusUI.MainFrame then error("CreateWindow must be called before CreateTab") end
		local textWidth = #name * 10 + 20
		if textWidth < 80 then textWidth = 80 end
		local tabBtn = Instance.new("TextButton")
		tabBtn.Size = UDim2.new(0, textWidth, 0, 28)
		tabBtn.BackgroundColor3 = NexusUI.CurrentTheme.TabBG
		tabBtn.Text = name
		tabBtn.Font = Enum.Font.GothamSemibold
		tabBtn.TextColor3 = NexusUI.CurrentTheme.TextDim
		tabBtn.TextSize = 12
		tabBtn.AutoButtonColor = false
		tabBtn.Parent = NexusUI.TabScroll
		AddCorner(tabBtn, 6)
		tabBtn.MouseEnter:Connect(function() TweenService:Create(tabBtn, TweenInfo.new(0.2), { TextColor3 = NexusUI.CurrentTheme.Text }):Play() end)
		tabBtn.MouseLeave:Connect(function()
			if not tabBtn.Frame or not tabBtn.Frame.Visible then
				TweenService:Create(tabBtn, TweenInfo.new(0.2), { TextColor3 = NexusUI.CurrentTheme.TextDim }):Play()
			end
		end)
		local tabFrame = Instance.new("ScrollingFrame")
		tabFrame.Size = UDim2.new(1, 0, 1, 0)
		tabFrame.BackgroundTransparency = 1
		tabFrame.ScrollBarThickness = 2
		tabFrame.ScrollBarImageColor3 = NexusUI.CurrentTheme.Accent
		tabFrame.Visible = false
		tabFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
		tabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		tabFrame.Parent = NexusUI.ContentSlide
		local layout = Instance.new("UIListLayout")
		layout.Padding = UDim.new(0, 6)
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout.Parent = tabFrame
		local padding = Instance.new("UIPadding")
		padding.PaddingTop = UDim.new(0, 5)
		padding.PaddingLeft = UDim.new(0, 5)
		padding.PaddingBottom = UDim.new(0, 5)
		padding.Parent = tabFrame
		local tabEntry = { Btn = tabBtn, Frame = tabFrame, IsFixed = isFixed or false }
		table.insert(NexusUI.Tabs, tabEntry)
		tabBtn.MouseButton1Click:Connect(function()
			PlayClickSound()
			if NexusUI.Animating then return end
			for _, t in ipairs(NexusUI.Tabs) do
				t.Frame.Visible = false
				TweenService:Create(t.Btn, TweenInfo.new(0.3), { TextColor3 = NexusUI.CurrentTheme.TextDim, BackgroundColor3 = NexusUI.CurrentTheme.TabBG }):Play()
			end
			tabFrame.Visible = true
			TweenService:Create(tabBtn, TweenInfo.new(0.3), { TextColor3 = NexusUI.CurrentTheme.Text, BackgroundColor3 = NexusUI.CurrentTheme.AccentDark }):Play()
			tabFrame.Position = UDim2.new(1, 0, 0, 0)
			NexusUI.Animating = true
			TweenService:Create(tabFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(0, 0, 0, 0) }):Play()
			task.wait(0.3)
			NexusUI.Animating = false
		end)
		ReorderTabs()
		return tabFrame
	end

	function NexusUI.CreateSection(parent, text)
		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1, -10, 0, 20)
		label.BackgroundTransparency = 1
		label.Text = text
		label.TextColor3 = NexusUI.CurrentTheme.Accent
		label.Font = Enum.Font.GothamBold
		label.TextSize = 11
		label.TextXAlignment = Enum.TextXAlignment.Left
		label.Parent = parent
		return label
	end

	function NexusUI.CreateToggle(parent, text, default, callback, id)
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(1, -10, 0, 32)
		frame.BackgroundColor3 = NexusUI.CurrentTheme.ItemBG
		frame.Parent = parent
		AddCorner(frame, 6)
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(1, 0, 1, 0)
		btn.BackgroundTransparency = 1
		btn.Text = ""
		btn.Parent = frame
		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(0.8, 0, 1, 0)
		label.Position = UDim2.new(0, 8, 0, 0)
		label.BackgroundTransparency = 1
		label.Text = text
		label.TextColor3 = NexusUI.CurrentTheme.Text
		label.Font = Enum.Font.GothamSemibold
		label.TextSize = 12
		label.TextXAlignment = Enum.TextXAlignment.Left
		label.Parent = frame
		local indicator = Instance.new("Frame")
		indicator.Size = UDim2.new(0, 16, 0, 16)
		indicator.Position = UDim2.new(1, -24, 0.5, -8)
		indicator.BackgroundColor3 = default and NexusUI.CurrentTheme.Accent or Color3.fromRGB(60, 60, 60)
		indicator.Parent = frame
		AddCorner(indicator, 4)
		local toggled = default
		local setter = function(state)
			toggled = state
			TweenService:Create(indicator, TweenInfo.new(0.3), { BackgroundColor3 = toggled and NexusUI.CurrentTheme.Accent or Color3.fromRGB(60, 60, 60) }):Play()
			if callback then callback(toggled) end
			if id then NexusUI.Config[id] = toggled; SaveUIConfig() end
		end
		btn.MouseButton1Click:Connect(function() PlayClickSound(); setter(not toggled) end)
		btn.MouseEnter:Connect(function() TweenService:Create(frame, TweenInfo.new(0.2), { BackgroundColor3 = NexusUI.CurrentTheme.AccentDark }):Play() end)
		btn.MouseLeave:Connect(function() TweenService:Create(frame, TweenInfo.new(0.2), { BackgroundColor3 = NexusUI.CurrentTheme.ItemBG }):Play() end)
		if id then
			local saved = NexusUI.Config[id]
			if saved ~= nil then setter(saved) else NexusUI.Config[id] = default end
			RegisterElement(id, "toggle", setter, default)
		end
		return setter
	end

	function NexusUI.CreateButton(parent, text, callback)
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(1, -10, 0, 32)
		frame.BackgroundColor3 = NexusUI.CurrentTheme.ItemBG
		frame.Parent = parent
		AddCorner(frame, 6)
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(1, 0, 1, 0)
		btn.BackgroundTransparency = 1
		btn.Text = text
		btn.TextColor3 = NexusUI.CurrentTheme.Accent
		btn.Font = Enum.Font.GothamBold
		btn.TextSize = 12
		btn.Parent = frame
		btn.MouseEnter:Connect(function() TweenService:Create(frame, TweenInfo.new(0.2), { BackgroundColor3 = NexusUI.CurrentTheme.AccentDark }):Play() end)
		btn.MouseLeave:Connect(function() TweenService:Create(frame, TweenInfo.new(0.2), { BackgroundColor3 = NexusUI.CurrentTheme.ItemBG }):Play() end)
		btn.MouseButton1Click:Connect(function()
			PlayClickSound()
			TweenService:Create(frame, TweenInfo.new(0.1), { BackgroundColor3 = NexusUI.CurrentTheme.Accent }):Play()
			task.wait(0.1)
			TweenService:Create(frame, TweenInfo.new(0.1), { BackgroundColor3 = NexusUI.CurrentTheme.ItemBG }):Play()
			if callback then callback(btn, frame) end
		end)
		return btn
	end

	function NexusUI.CreateInput(parent, text, placeholder, defaultVal, callback, id)
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(1, -10, 0, 32)
		frame.BackgroundColor3 = NexusUI.CurrentTheme.ItemBG
		frame.Parent = parent
		AddCorner(frame, 6)
		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(0.5, 0, 1, 0)
		label.Position = UDim2.new(0, 8, 0, 0)
		label.BackgroundTransparency = 1
		label.Text = text
		label.TextColor3 = NexusUI.CurrentTheme.Text
		label.Font = Enum.Font.GothamSemibold
		label.TextSize = 12
		label.TextXAlignment = Enum.TextXAlignment.Left
		label.Parent = frame
		local box = Instance.new("TextBox")
		box.Size = UDim2.new(0.4, 0, 0.7, 0)
		box.Position = UDim2.new(0.55, 0, 0.15, 0)
		box.BackgroundColor3 = NexusUI.CurrentTheme.InputBG
		box.Text = defaultVal or ""
		box.PlaceholderText = placeholder
		box.TextColor3 = NexusUI.CurrentTheme.Accent
		box.Font = Enum.Font.GothamBold
		box.TextSize = 11
		box.Parent = frame
		AddCorner(box, 4)
		local stroke = AddStroke(box, Color3.fromRGB(50, 50, 60), 1)
		local setter = function(value)
			box.Text = value
			if callback then callback(value) end
			if id then NexusUI.Config[id] = value; SaveUIConfig() end
		end
		box.Focused:Connect(function() TweenService:Create(stroke, TweenInfo.new(0.2), { Color = NexusUI.CurrentTheme.Accent }):Play() end)
		box.FocusLost:Connect(function()
			TweenService:Create(stroke, TweenInfo.new(0.2), { Color = Color3.fromRGB(50, 50, 60) }):Play()
			if callback then callback(box.Text) end
			if id then NexusUI.Config[id] = box.Text; SaveUIConfig() end
		end)
		if id then
			local saved = NexusUI.Config[id]
			if saved ~= nil then setter(saved) else NexusUI.Config[id] = defaultVal end
			RegisterElement(id, "input", setter, defaultVal)
		end
		return box, setter
	end

	function NexusUI.CreateKeybind(parent, text, defaultKey, callback, id)
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(1, -10, 0, 32)
		frame.BackgroundColor3 = NexusUI.CurrentTheme.ItemBG
		frame.Parent = parent
		AddCorner(frame, 6)
		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(0.6, 0, 1, 0)
		label.Position = UDim2.new(0, 8, 0, 0)
		label.BackgroundTransparency = 1
		label.Text = text
		label.TextColor3 = NexusUI.CurrentTheme.Text
		label.Font = Enum.Font.GothamSemibold
		label.TextSize = 12
		label.TextXAlignment = Enum.TextXAlignment.Left
		label.Parent = frame
		local keyBtn = Instance.new("TextButton")
		keyBtn.Size = UDim2.new(0.3, 0, 0.7, 0)
		keyBtn.Position = UDim2.new(0.65, 0, 0.15, 0)
		keyBtn.BackgroundColor3 = NexusUI.CurrentTheme.InputBG
		keyBtn.Text = defaultKey
		keyBtn.TextColor3 = NexusUI.CurrentTheme.Accent
		keyBtn.Font = Enum.Font.GothamBold
		keyBtn.TextSize = 11
		keyBtn.Parent = frame
		AddCorner(keyBtn, 4)
		local stroke = AddStroke(keyBtn, Color3.fromRGB(50, 50, 60), 1)
		local setter = function(key)
			keyBtn.Text = key
			if callback then callback(key) end
			if id then NexusUI.Config[id] = key; SaveUIConfig() end
		end
		local listening = false
		local connection
		keyBtn.MouseButton1Click:Connect(function()
			PlayClickSound()
			listening = true
			keyBtn.Text = "..."
			keyBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
			stroke.Color = Color3.fromRGB(255, 50, 50)
			if connection then connection:Disconnect() end
			connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
				if listening and not gameProcessed then
					local keyName = tostring(input.KeyCode):gsub("Enum.KeyCode.", "")
					setter(keyName)
					listening = false
					connection:Disconnect()
				end
			end)
			task.delay(10, function()
				if listening then
					listening = false
					keyBtn.Text = defaultKey
					keyBtn.TextColor3 = NexusUI.CurrentTheme.Accent
					stroke.Color = NexusUI.CurrentTheme.Accent
					if connection then connection:Disconnect() end
				end
			end)
		end)
		if id then
			local saved = NexusUI.Config[id]
			if saved ~= nil then setter(saved) else NexusUI.Config[id] = defaultKey end
			RegisterElement(id, "keybind", setter, defaultKey)
		end
		return keyBtn, setter
	end

	function NexusUI.CreateDropdown(parent, text, options, default, callback, id)
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(1, -10, 0, 32)
		frame.BackgroundColor3 = NexusUI.CurrentTheme.ItemBG
		frame.Parent = parent
		AddCorner(frame, 6)
		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(0.5, 0, 1, 0)
		label.Position = UDim2.new(0, 8, 0, 0)
		label.BackgroundTransparency = 1
		label.Text = text
		label.TextColor3 = NexusUI.CurrentTheme.Text
		label.Font = Enum.Font.GothamSemibold
		label.TextSize = 12
		label.TextXAlignment = Enum.TextXAlignment.Left
		label.Parent = frame
		local dropdownBtn = Instance.new("TextButton")
		dropdownBtn.Size = UDim2.new(0.4, 0, 0.7, 0)
		dropdownBtn.Position = UDim2.new(0.55, 0, 0.15, 0)
		dropdownBtn.BackgroundColor3 = NexusUI.CurrentTheme.InputBG
		dropdownBtn.Text = default or options[1] or ""
		dropdownBtn.TextColor3 = NexusUI.CurrentTheme.Accent
		dropdownBtn.Font = Enum.Font.GothamBold
		dropdownBtn.TextSize = 11
		dropdownBtn.Parent = frame
		AddCorner(dropdownBtn, 4)
		AddStroke(dropdownBtn, Color3.fromRGB(50, 50, 60), 1)
		local dropdownList, isOpen = nil, false
		local function closeDropdown()
			if dropdownList then
				TweenService:Create(dropdownList, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
				task.wait(0.2)
				dropdownList:Destroy()
				dropdownList = nil
			end
			isOpen = false
		end
		local function openDropdown()
			if isOpen then return end
			isOpen = true
			local dc = Instance.new("Frame")
			dc.Name = "DropdownContainer"
			dc.Size = UDim2.new(0, 200, 0, 150)
			dc.BackgroundColor3 = NexusUI.CurrentTheme.ItemBG
			dc.BorderSizePixel = 0
			dc.ZIndex = 999
			dc.Parent = NexusUI.ScreenGui
			AddCorner(dc, 6)
			AddStroke(dc, NexusUI.CurrentTheme.Accent, 1)
			AddShadow(dc, 10, Color3.new(0, 0, 0), 0.5)
			dc.Size = UDim2.new(0, 0, 0, 0)
			TweenService:Create(dc, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 200, 0, 150) }):Play()
			local btnAbsPos = dropdownBtn.AbsolutePosition
			local parentAbsPos = frame.AbsolutePosition
			dc.Position = UDim2.new(0, btnAbsPos.X - parentAbsPos.X, 0, 34)
			local scroll = Instance.new("ScrollingFrame")
			scroll.Size = UDim2.new(1, 0, 1, 0)
			scroll.BackgroundTransparency = 1
			scroll.ScrollBarThickness = 4
			scroll.CanvasSize = UDim2.new(0, 0, 0, 30 * #options)
			scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
			scroll.Parent = dc
			local layout = Instance.new("UIListLayout")
			layout.Padding = UDim.new(0, 1)
			layout.SortOrder = Enum.SortOrder.LayoutOrder
			layout.Parent = scroll
			for _, opt in ipairs(options) do
				local optBtn = Instance.new("TextButton")
				optBtn.Size = UDim2.new(1, 0, 0, 30)
				optBtn.BackgroundColor3 = NexusUI.CurrentTheme.InputBG
				optBtn.Text = opt
				optBtn.TextColor3 = NexusUI.CurrentTheme.Text
				optBtn.Font = Enum.Font.GothamSemibold
				optBtn.TextSize = 11
				optBtn.Parent = scroll
				AddCorner(optBtn, 4)
				optBtn.MouseEnter:Connect(function() TweenService:Create(optBtn, TweenInfo.new(0.2), { BackgroundColor3 = NexusUI.CurrentTheme.AccentDark }):Play() end)
				optBtn.MouseLeave:Connect(function() TweenService:Create(optBtn, TweenInfo.new(0.2), { BackgroundColor3 = NexusUI.CurrentTheme.InputBG }):Play() end)
				optBtn.MouseButton1Click:Connect(function()
					PlayClickSound()
					dropdownBtn.Text = opt
					if callback then callback(opt) end
					if id then NexusUI.Config[id] = opt; SaveUIConfig() end
					closeDropdown()
				end)
			end
			local connection
			connection = UserInputService.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					local mp = input.Position
					local bap, bas = dropdownBtn.AbsolutePosition, dropdownBtn.AbsoluteSize
					local cap, cas = dc.AbsolutePosition, dc.AbsoluteSize
					local insideBtn = mp.X >= bap.X and mp.X <= bap.X + bas.X and mp.Y >= bap.Y and mp.Y <= bap.Y + bas.Y
					local insideCont = mp.X >= cap.X and mp.X <= cap.X + cas.X and mp.Y >= cap.Y and mp.Y <= cap.Y + cas.Y
					if not insideBtn and not insideCont then closeDropdown() end
				end
				if not isOpen and connection then connection:Disconnect() end
			end)
			dc.Destroying:Connect(function() if connection then connection:Disconnect() end end)
			dropdownList = dc
		end
		dropdownBtn.MouseButton1Click:Connect(function()
			PlayClickSound()
			if isOpen then closeDropdown() else openDropdown() end
		end)
		local setter = function(value)
			if table.find(options, value) then
				dropdownBtn.Text = value
				if callback then callback(value) end
				if id then NexusUI.Config[id] = value; SaveUIConfig() end
			end
		end
		if id then
			local saved = NexusUI.Config[id]
			if saved ~= nil and table.find(options, saved) then
				setter(saved)
			else
				NexusUI.Config[id] = default or options[1]
				setter(default or options[1])
			end
			RegisterElement(id, "dropdown", setter, default or options[1])
		end
		return setter
	end

	function NexusUI.CreateThemeSelector(parent, onThemeChanged)
		local themeNames = {"Original", "Red", "Blue", "Verde", "Purple", "Yellow", "Branco", "Preto"}
		local rows = {{1,3}, {4,6}, {7,8}}
		for rowIdx, range in ipairs(rows) do
			local row = Instance.new("Frame")
			row.Size = UDim2.new(1, -10, 0, 32)
			row.Position = UDim2.new(0, 0, 0, (rowIdx - 1) * 40)
			row.BackgroundTransparency = 1
			row.Parent = parent
			for i = range[1], range[2] do
				local themeName = themeNames[i]
				local col = i - range[1]
				local btn = Instance.new("TextButton")
				btn.Size = UDim2.new(0.32, -5, 1, 0)
				btn.Position = UDim2.new(col * 0.33, 0, 0, 0)
				btn.BackgroundColor3 = NexusUI.CurrentTheme.ItemBG
				btn.Text = themeName
				btn.TextColor3 = LibraryConfig.DefaultTheme == themeName and NexusUI.CurrentTheme.Accent or NexusUI.CurrentTheme.TextDim
				btn.Font = Enum.Font.GothamBold
				btn.TextSize = 11
				btn.Parent = row
				AddCorner(btn, 4)
				btn.MouseEnter:Connect(function() TweenService:Create(btn, TweenInfo.new(0.2), { TextColor3 = NexusUI.CurrentTheme.Text }):Play() end)
				btn.MouseLeave:Connect(function() TweenService:Create(btn, TweenInfo.new(0.2), { TextColor3 = LibraryConfig.DefaultTheme == themeName and NexusUI.CurrentTheme.Accent or NexusUI.CurrentTheme.TextDim }):Play() end)
				btn.MouseButton1Click:Connect(function()
					PlayClickSound()
					NexusUI.SetTheme(themeName)
					if onThemeChanged then onThemeChanged(themeName) end
				end)
			end
		end
	end

	function NexusUI.AddCredit(name, role, imageId, youtubeChannelName, youtubeUrl)
		if not NexusUI.CreditsContainer then return end
		local card = Instance.new("Frame")
		card.Size = UDim2.new(1, -10, 0, 90)
		card.BackgroundColor3 = NexusUI.CurrentTheme.ItemBG
		card.Parent = NexusUI.CreditsContainer
		AddCorner(card, 8)
		AddShadow(card, 8, Color3.new(0, 0, 0), 0.3)
		if imageId and imageId ~= "" then
			local img = Instance.new("ImageLabel")
			img.Size = UDim2.new(0, 60, 0, 60)
			img.Position = UDim2.new(0, 10, 0.5, -30)
			img.BackgroundTransparency = 1
			img.Image = imageId
			img.Parent = card
			AddCorner(img, 8)
		end
		local nameLabel = Instance.new("TextLabel")
		nameLabel.Size = UDim2.new(0.6, 0, 0, 25)
		nameLabel.Position = UDim2.new(0, 80, 0, 10)
		nameLabel.BackgroundTransparency = 1
		nameLabel.Text = name
		nameLabel.TextColor3 = NexusUI.CurrentTheme.Accent
		nameLabel.Font = Enum.Font.GothamBlack
		nameLabel.TextSize = 14
		nameLabel.TextXAlignment = Enum.TextXAlignment.Left
		nameLabel.Parent = card
		local roleLabel = Instance.new("TextLabel")
		roleLabel.Size = UDim2.new(0.6, 0, 0, 20)
		roleLabel.Position = UDim2.new(0, 80, 0, 35)
		roleLabel.BackgroundTransparency = 1
		roleLabel.Text = role
		roleLabel.TextColor3 = NexusUI.CurrentTheme.TextDim
		roleLabel.Font = Enum.Font.GothamSemibold
		roleLabel.TextSize = 11
		roleLabel.TextXAlignment = Enum.TextXAlignment.Left
		roleLabel.Parent = card
		if youtubeChannelName and youtubeUrl then
			local ytBtn = Instance.new("TextButton")
			ytBtn.Size = UDim2.new(0.3, -10, 0, 25)
			ytBtn.Position = UDim2.new(0, 80, 0, 58)
			ytBtn.BackgroundColor3 = NexusUI.CurrentTheme.Accent
			ytBtn.Text = "🎬 " .. youtubeChannelName
			ytBtn.TextColor3 = Color3.new(1, 1, 1)
			ytBtn.Font = Enum.Font.GothamBold
			ytBtn.TextSize = 11
			ytBtn.Parent = card
			AddCorner(ytBtn, 4)
			ytBtn.MouseEnter:Connect(function() TweenService:Create(ytBtn, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(255, 50, 50) }):Play() end)
			ytBtn.MouseLeave:Connect(function() TweenService:Create(ytBtn, TweenInfo.new(0.2), { BackgroundColor3 = NexusUI.CurrentTheme.Accent }):Play() end)
			ytBtn.MouseButton1Click:Connect(function()
				PlayClickSound()
				setclipboard(youtubeUrl)
				NexusUI.Notify("YOUTUBE", "Link copiado: " .. youtubeUrl, 3)
			end)
		end
	end

	function NexusUI.ClearCredits()
		if NexusUI.CreditsContainer then
			for _, child in ipairs(NexusUI.CreditsContainer:GetChildren()) do
				if child:IsA("Frame") then child:Destroy() end
			end
		end
	end

	function NexusUI.Destroy()
		if NexusUI.ScreenGui then NexusUI.ScreenGui:Destroy() end
		if NexusUI.NotifyContainer then NexusUI.NotifyContainer:Destroy() end
		NexusUI.Tabs = {}
		NexusUI.SavedPositions = {}
	end

	task.spawn(function()
		task.wait(0.1)
		ApplySavedSettings()
	end)

	return NexusUI
end

-- ============================================================================
-- SEQUÊNCIA: roda o loading, depois abre o NexusUI
-- ============================================================================

local function RunSequence()
	-- Aparece o N
	local nAppear = TweenService:Create(N_Label, TweenInfo.new(0.9, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { TextTransparency = 0, TextSize = 100 })
	TweenService:Create(N_Stroke, TweenInfo.new(0.9), { Transparency = 0.3 }):Play()
	nAppear:Play()
	nAppear.Completed:Wait()

	-- Barra de progresso aparece
	TweenService:Create(LoadingContainer, TweenInfo.new(0.4), { BackgroundTransparency = 0 }):Play()
	TweenService:Create(ProgressPercent, TweenInfo.new(0.4), { TextTransparency = 0 }):Play()
	TweenService:Create(ProgressGlow, TweenInfo.new(0.4), { BackgroundTransparency = 0 }):Play()
	task.wait(0.2)

	TweenService:Create(ProgressBar, TweenInfo.new(CONFIG.LoadingDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(1, 0, 1, 0) }):Play()

	local startTime = tick()
	while tick() - startTime < CONFIG.LoadingDuration do
		local p = math.floor(((tick() - startTime) / CONFIG.LoadingDuration) * 100)
		ProgressPercent.Text = math.clamp(p, 0, 100) .. "%"
		task.wait(0.03)
	end
	ProgressPercent.Text = "100%"
	task.wait(CONFIG.HoldAfter100)

	-- Some barra
	TweenService:Create(LoadingContainer, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
	TweenService:Create(ProgressBar, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
	TweenService:Create(ProgressPercent, TweenInfo.new(0.3), { TextTransparency = 1 }):Play()
	TweenService:Create(ProgressGlow, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
	task.wait(0.3)

	-- N se move para a esquerda
	local nMove = TweenService:Create(N_Label, TweenInfo.new(CONFIG.N_MoveSpeed, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), { Position = CONFIG.N_TargetPosition })
	nMove:Play()
	nMove.Completed:Wait()

	pcall(function() RevealSound:Play() end)

	-- Linhas expandem + nome aparece
	TweenService:Create(LineTop, TweenInfo.new(CONFIG.LinesExpandSpeed, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(0, 240, 0, 2) }):Play()
	task.wait(0.12)
	TweenService:Create(LineBottom, TweenInfo.new(CONFIG.LinesExpandSpeed, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(0, 240, 0, 2) }):Play()

	local scriptNameFade = TweenService:Create(ScriptNameLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { TextTransparency = 0 })
	scriptNameFade:Play()
	scriptNameFade.Completed:Wait()
	task.wait(CONFIG.HoldFinalName)

	-- Fade out geral
	local fadeOutSpeed = CONFIG.FadeOutSpeed
	TweenService:Create(BackgroundGlow, TweenInfo.new(fadeOutSpeed * 0.5), { ImageTransparency = 1 }):Play()
	TweenService:Create(GridTexture, TweenInfo.new(fadeOutSpeed * 0.5), { ImageTransparency = 1 }):Play()
	TweenService:Create(N_Label, TweenInfo.new(fadeOutSpeed * 0.5), { TextTransparency = 1 }):Play()
	TweenService:Create(N_Stroke, TweenInfo.new(fadeOutSpeed * 0.5), { Transparency = 1 }):Play()
	TweenService:Create(LineTop, TweenInfo.new(fadeOutSpeed * 0.5), { BackgroundTransparency = 1 }):Play()
	TweenService:Create(LineBottom, TweenInfo.new(fadeOutSpeed * 0.5), { BackgroundTransparency = 1 }):Play()
	TweenService:Create(ScriptNameLabel, TweenInfo.new(fadeOutSpeed * 0.5), { TextTransparency = 1 }):Play()

	local fadeOutAll = TweenService:Create(MainBackground, TweenInfo.new(fadeOutSpeed, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { BackgroundTransparency = 1 })
	fadeOutAll:Play()
	fadeOutAll.Completed:Wait()

	-- Destroy loading e restaura CoreGui
	ScreenGui:Destroy()
	pcall(function() StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true) end)

	-- ✅ Abre o NexusUI logo depois
	local NexusUI = LoadNexusUI()
	local Window = NexusUI.CreateWindow("NEXUS UI")

	-- Exemplo de uso — substitua pelo seu código aqui:
	local Tab1 = NexusUI.CreateTab("🏠 MAIN")
	NexusUI.CreateSection(Tab1, "EXEMPLO")
	NexusUI.CreateButton(Tab1, "TESTE", function()
		NexusUI.Notify("NEXUS", "Funcionando!", 3)
	end)
	NexusUI.CreateToggle(Tab1, "OPÇÃO 1", false, function(v) print("Toggle:", v) end)

	-- Se quiser carregar outro script após o NexusUI:
	if CONFIG.ScriptURL and CONFIG.ScriptURL ~= "" then
		pcall(function() loadstring(game:HttpGet(CONFIG.ScriptURL))() end)
	end
end

task.spawn(RunSequence)
