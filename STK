-- Libraries.
local WindUI = loadstring(game:HttpGet(
	"https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
))()

-- Services.
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Constants.
local LocalPlayer = Players.LocalPlayer
local VERSION = "v 1.0"
local DEFAULT_THEME = "Willow Noir"

-- State.
local NotificationsSilenced = false
local NotificationBusy = false
local ReopenNotificationBusy = false
local SelectedConfig = nil
local CurrentKey = "U"
local DEFAULT_KEY = "U"
local StatsService = game:GetService("Stats")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local Themes = {}

local function Gradient(colors, rotation)
	local points = {}
	for position, color in pairs(colors) do
		if type(color) == "table" then
			points[position] = { Color = Color3.fromHex(color.Color), Transparency = color.Transparency or 0 }
		else
			points[position] = { Color = Color3.fromHex(color), Transparency = 0 }
		end
	end
	return WindUI:Gradient(points, { Rotation = rotation or 45 })
end

local function CreateTheme(name, accent, background, outline, button, icon)
	local theme = {
		Name = name,
		Accent = accent,
		Background = background,
		Outline = outline,
		Text = Color3.fromHex("#FFFFFF"),
		Placeholder = Color3.fromHex("#B8A0A8"),
		Button = button,
		Icon = icon,
	}
	Themes[name] = theme
	WindUI:AddTheme(theme)
end

CreateTheme("Willow Rose",
	Gradient({ ["0"]="#711E42", ["50"]="#E45B91", ["100"]="#711E42" }, 45),
	Gradient({ ["0"]={Color="#0B0408",Transparency=0.06}, ["25"]={Color="#190812",Transparency=0.08}, ["50"]={Color="#351126",Transparency=0.10}, ["75"]={Color="#711E42",Transparency=0.13}, ["100"]={Color="#0B0408",Transparency=0.06} }, 135),
	Gradient({ ["0"]={Color="#4B1730",Transparency=0.45}, ["50"]={Color="#D14F85",Transparency=0.22}, ["100"]={Color="#5A1C39",Transparency=0.42} }, 90),
	Gradient({ ["0"]={Color="#2A0C1C",Transparency=0.72}, ["50"]={Color="#7E2850",Transparency=0.61}, ["100"]={Color="#2A0C1C",Transparency=0.74} }, 90),
	Color3.fromHex("#FFFFFF"))

CreateTheme("Willow Noir",
	Gradient({ ["0"]="#111111", ["25"]="#252525", ["50"]="#777777", ["75"]="#252525", ["100"]="#111111" }, 45),
	Gradient({ ["0"]={Color="#050505",Transparency=0.05}, ["30"]={Color="#101010",Transparency=0.07}, ["55"]={Color="#202020",Transparency=0.10}, ["75"]={Color="#333333",Transparency=0.13}, ["100"]={Color="#050505",Transparency=0.05} }, 135),
	Gradient({ ["0"]={Color="#FFFFFF",Transparency=0.78}, ["50"]={Color="#8D8D8D",Transparency=0.45}, ["100"]={Color="#FFFFFF",Transparency=0.80} }, 90),
	Gradient({ ["0"]={Color="#101010",Transparency=0.70}, ["50"]={Color="#555555",Transparency=0.48}, ["100"]={Color="#101010",Transparency=0.70} }, 90),
	Color3.fromHex("#FFFFFF"))

CreateTheme("Willow Crimson",
	Gradient({ ["0"]="#5C0B1C", ["50"]="#A81738", ["100"]="#5C0B1C" }, 45),
	Gradient({ ["0"]={Color="#090306",Transparency=0.08}, ["25"]={Color="#14050A",Transparency=0.09}, ["55"]={Color="#260710",Transparency=0.10}, ["80"]={Color="#5C0B1C",Transparency=0.14}, ["100"]={Color="#090306",Transparency=0.08} }, 135),
	Gradient({ ["0"]={Color="#3A0A15",Transparency=0.45}, ["50"]={Color="#8B1732",Transparency=0.22}, ["100"]={Color="#420A17",Transparency=0.42} }, 90),
	Gradient({ ["0"]={Color="#2A0A14",Transparency=0.72}, ["50"]={Color="#70152B",Transparency=0.61}, ["100"]={Color="#2A0A14",Transparency=0.74} }, 90),
	Color3.fromHex("#FFFFFF"))

CreateTheme("Willow Midnight",
	Gradient({ ["0"]="#171B35", ["50"]="#4652A8", ["100"]="#171B35" }, 45),
	Gradient({ ["0"]={Color="#05060C",Transparency=0.08}, ["25"]={Color="#080B17",Transparency=0.09}, ["55"]={Color="#11182B",Transparency=0.10}, ["80"]={Color="#202B52",Transparency=0.14}, ["100"]={Color="#05060C",Transparency=0.08} }, 135),
	Gradient({ ["0"]={Color="#1D2447",Transparency=0.45}, ["50"]={Color="#5867C7",Transparency=0.22}, ["100"]={Color="#252B55",Transparency=0.42} }, 90),
	Gradient({ ["0"]={Color="#11162D",Transparency=0.72}, ["50"]={Color="#303D7D",Transparency=0.61}, ["100"]={Color="#11162D",Transparency=0.74} }, 90),
	Color3.fromHex("#FFFFFF"))

CreateTheme("Willow Violet",
	Gradient({ ["0"]="#4A176E", ["50"]="#A44BE2", ["100"]="#4A176E" }, 45),
	Gradient({ ["0"]={Color="#08040D",Transparency=0.08}, ["25"]={Color="#12071B",Transparency=0.09}, ["55"]={Color="#251039",Transparency=0.10}, ["80"]={Color="#4A176E",Transparency=0.14}, ["100"]={Color="#08040D",Transparency=0.08} }, 135),
	Gradient({ ["0"]={Color="#35144C",Transparency=0.45}, ["50"]={Color="#9844CF",Transparency=0.22}, ["100"]={Color="#431B5C",Transparency=0.42} }, 90),
	Gradient({ ["0"]={Color="#1D0C2B",Transparency=0.72}, ["50"]={Color="#60308A",Transparency=0.61}, ["100"]={Color="#1D0C2B",Transparency=0.74} }, 90),
	Color3.fromHex("#FFFFFF"))

CreateTheme("Willow Ocean",
	Gradient({ ["0"]="#0B4C67", ["50"]="#36BFEA", ["100"]="#0B4C67" }, 45),
	Gradient({ ["0"]={Color="#03080C",Transparency=0.08}, ["25"]={Color="#05131C",Transparency=0.09}, ["55"]={Color="#082735",Transparency=0.10}, ["80"]={Color="#0B4C67",Transparency=0.14}, ["100"]={Color="#03080C",Transparency=0.08} }, 135),
	Gradient({ ["0"]={Color="#0B384A",Transparency=0.45}, ["50"]={Color="#36A9D0",Transparency=0.22}, ["100"]={Color="#0B4055",Transparency=0.42} }, 90),
	Gradient({ ["0"]={Color="#06212E",Transparency=0.72}, ["50"]={Color="#185E76",Transparency=0.61}, ["100"]={Color="#06212E",Transparency=0.74} }, 90),
	Color3.fromHex("#FFFFFF"))

CreateTheme("Willow Emerald",
	Gradient({ ["0"]="#0B593C", ["50"]="#38D79A", ["100"]="#0B593C" }, 45),
	Gradient({ ["0"]={Color="#030907",Transparency=0.08}, ["25"]={Color="#06160F",Transparency=0.09}, ["55"]={Color="#0A2D20",Transparency=0.10}, ["80"]={Color="#0B593C",Transparency=0.14}, ["100"]={Color="#030907",Transparency=0.08} }, 135),
	Gradient({ ["0"]={Color="#0B3E2B",Transparency=0.45}, ["50"]={Color="#32B986",Transparency=0.22}, ["100"]={Color="#0B4934",Transparency=0.42} }, 90),
	Gradient({ ["0"]={Color="#06261A",Transparency=0.72}, ["50"]={Color="#177955",Transparency=0.61}, ["100"]={Color="#06261A",Transparency=0.74} }, 90),
	Color3.fromHex("#FFFFFF"))

CreateTheme("Willow Ember",
	Gradient({ ["0"]="#7A2A0C", ["50"]="#E87530", ["100"]="#7A2A0C" }, 45),
	Gradient({ ["0"]={Color="#0B0604",Transparency=0.08}, ["25"]={Color="#1A0B06",Transparency=0.09}, ["55"]={Color="#3A180B",Transparency=0.10}, ["80"]={Color="#7A2A0C",Transparency=0.14}, ["100"]={Color="#0B0604",Transparency=0.08} }, 135),
	Gradient({ ["0"]={Color="#52200E",Transparency=0.45}, ["50"]={Color="#CF5C25",Transparency=0.22}, ["100"]={Color="#642810",Transparency=0.42} }, 90),
	Gradient({ ["0"]={Color="#2C1107",Transparency=0.72}, ["50"]={Color="#7F3514",Transparency=0.61}, ["100"]={Color="#2C1107",Transparency=0.74} }, 90),
	Color3.fromHex("#FFFFFF"))

WindUI:SetTheme(DEFAULT_THEME)

local ThemeButtonColors = {
	["Willow Rose"] = { Low = "#711E42", High = "#E45B91" },
	["Willow Noir"] = { Low = "#101010", High = "#777777" },
	["Willow Crimson"] = { Low = "#5C0B1C", High = "#A81738" },
	["Willow Midnight"] = { Low = "#171B35", High = "#4652A8" },
	["Willow Violet"] = { Low = "#4A176E", High = "#A44BE2" },
	["Willow Ocean"] = { Low = "#0B4C67", High = "#36BFEA" },
	["Willow Emerald"] = { Low = "#0B593C", High = "#38D79A" },
	["Willow Ember"] = { Low = "#7A2A0C", High = "#E87530" },
}

local ThemeTagColors = {
	["Willow Rose"] = "#E45B91",
	["Willow Noir"] = "#666666",
	["Willow Crimson"] = "#A81738",
	["Willow Midnight"] = "#4652A8",
	["Willow Violet"] = "#A44BE2",
	["Willow Ocean"] = "#36BFEA",
	["Willow Emerald"] = "#38D79A",
	["Willow Ember"] = "#E87530",
}

local function GetOpenButtonColor(themeName)
	local colors = ThemeButtonColors[themeName] or ThemeButtonColors[DEFAULT_THEME]
	return ColorSequence.new(Color3.fromHex(colors.Low), Color3.fromHex(colors.High))
end

local function GetTagColor(themeName)
	return Color3.fromHex(ThemeTagColors[themeName] or ThemeTagColors[DEFAULT_THEME])
end

local function Notify(title, content, icon, duration, force)
	duration = duration or 4
	if NotificationsSilenced and not force then return end
	if NotificationBusy and not force then return end
	NotificationBusy = true
	WindUI:Notify({ Title = title, Content = content, Icon = icon or "info", Duration = duration })
	task.delay(duration, function() NotificationBusy = false end)
end

local function ReopenNotify()
	if ReopenNotificationBusy then return end
	ReopenNotificationBusy = true
	task.delay(5, function() ReopenNotificationBusy = false end)
end

-- Window.
WindUI:SetFont("rbxassetid://115884882777577")

local Window = WindUI:CreateWindow({
	Title = "128B!t Hub X | Survive The Killer",
	Icon = "https://i.postimg.cc/63NzC6Ym/mi-m-ch-x-7-20260926071835.png",
	Author = "made by 128B!t",
	Folder = "128BitConfig",
	Size = UDim2.fromOffset(700, 480),
	MinSize = Vector2.new(580, 390),
	MaxSize = Vector2.new(920, 680),
	ToggleKey = Enum.KeyCode.U,
	Transparent = true,
	Theme = DEFAULT_THEME,
	Resizable = true,
	SideBarWidth = 180,
	HideSearchBar = true,
	ScrollBarEnabled = true,
	BackgroundImageTransparency = 0.5,
	ShadowTransparency = 0.22,
	Radius = 14,
	ElementsRadius = 10,
	Acrylic = true,
	NewElements = true,
	HidePanelBackground = true,
	Topbar = { Height = 44, ButtonsType = "Mac" },
	OpenButton = {
		Title = "128B!t Hub X",
		Icon = "https://i.postimg.cc/BbdNqW5g/a64070bdf0a63b4e7c0f6176e7e92bb5.jpg",
		CornerRadius = UDim.new(1, 0),
		StrokeThickness = 1,
		Draggable = true,
		Enabled = true,
		OnlyMobile = false,
		Scale = 0.92,
		Color = GetOpenButtonColor(DEFAULT_THEME),
	},
	User = { Enabled = true, Anonymous = false, Callback = function() end },
})

Window:SetBackgroundTransparency(0.5)

local function ApplyOpenButtonTheme(themeName)
	pcall(function()
		Window:EditOpenButton({
			Title = "128B!t Hub X", Icon = "https://i.postimg.cc/63NzC6Ym/mi-m-ch-x-7-20260926071835.png",
			CornerRadius = UDim.new(1, 0), StrokeThickness = 1,
			Enabled = true, Draggable = true, OnlyMobile = false,
			Scale = 0.92, Color = GetOpenButtonColor(themeName),
		})
	end)
end

local VersionTag = Window:Tag({ Title = VERSION, Icon = "badge-check", Color = GetTagColor(DEFAULT_THEME), Radius = 7 })
local FPSTag = Window:Tag({ Title = "FPS: --", Icon = "gauge", Color = GetTagColor(DEFAULT_THEME), Radius = 7 })

local function ApplyTagTheme(themeName)
	local color = GetTagColor(themeName)
	pcall(function() VersionTag:SetColor(color) end)
	pcall(function() FPSTag:SetColor(color) end)
end

ApplyOpenButtonTheme(DEFAULT_THEME)
ApplyTagTheme(DEFAULT_THEME)

local Frames = 0
local LastFPSUpdate = os.clock()
RunService.RenderStepped:Connect(function()
	Frames += 1
	if os.clock() - LastFPSUpdate >= 1 then
		FPSTag:SetTitle("FPS: " .. tostring(Frames))
		Frames = 0
		LastFPSUpdate = os.clock()
	end
end)

local function loadCore()
local _select = select
local function v1761(tbl, idx, ...)
    local va = {
        ...,
    }
    for i = 1, _select("#", ...) do
        tbl[idx + i - 1] = va[i]
    end
end
local s1 = "V7.2"
local s2 = "1. 🐛 Bugs Fixed\n2. 🚀 General Improvements"
local s3 = "1. 🐛 Исправлены ошибки\n2. 🚀 Общие улучшения"
local s4 = "1. 🐛 تم إصلاح الأخطاء\n2. 🚀 تحسينات عامة"
local s5 = "1. 🐛 Errores corregidos\n2. 🚀 Mejoras generales"
local s6 = "1. 🐛 Erros corrigidos\n2. 🚀 Melhorias gerais"
local s7 = "1. 🐛 Hatalar düzeltildi\n2. 🚀 Genel iyileştirmeler"
local s8 = "1. 🐛 Bug diperbaiki\n2. 🚀 Peningkatan umum"
local s9 = "1. 🐛 Naayos ang mga Bug\n2. 🚀 Mga Pangkalahatang Pagpapabuti"
local floor = math.floor
local max = math.max
local min = math.min
local new = Vector3.new
local new2 = CFrame.new
local new3 = Instance.new
local new4 = Color3.new
local fromRGB = Color3.fromRGB
local new5 = UDim2.new
local new6 = UDim.new
local u20 = new(0, 0, 0)
local t1 = {
    Players = game:GetService("Players"),
    RunService = game:GetService("RunService"),
    UserInputService = game:GetService("UserInputService"),
    CoreGui = game:GetService("CoreGui"),
    TweenService = game:GetService("TweenService"),
    Lighting = game:GetService("Lighting"),
    HttpService = game:GetService("HttpService"),
    Stats = game:GetService("Stats"),
    SoundService = game:GetService("SoundService"),
    TextService = game:GetService("TextService"),
}
t1.LocalPlayer = t1.Players.LocalPlayer
local t2 = {
    _imageCache = {},
    _imgMap = setmetatable({}, {
        __mode = "k",
    }),
    _imgByFile = {},
    ALL_ASSETS = {
        [1] = "Heart.png",
        [2] = "CoINs.png",
        [3] = "Farm.png",
        [4] = "setting.png",
        [5] = "esp.png",
        [6] = "JXPhoTHO.png",
        [7] = "Telegram.png",
        [8] = "Home.png",
        [9] = "English.jpg",
        [10] = "Russian.jpg",
        [11] = "Arabic.jpg",
    },
    DOUBLE_JUMP_ANIM_ID = "rbxassetid://4643151469",
    MIN_LOOT_VALUE = 1,
    farmCollectDelay = 3.16,
    farmSpeedPct = 40,
    LIVES_MAX = 3,
    Settings = {
        PlayerESP = false,
        ExitESP = false,
        LootESP = false,
        ShowDistance = false,
        ShowNames = false,
        ShowCoins = false,
        LivesESP = false,
        DoubleJump = true,
        InfiniteJump = false,
        Noclip = false,
        SpeedEnabled = false,
        FlyEnabled = false,
        GhostMode = false,
        Hitbox = false,
        AutoFarmLoot = false,
        KillerSafety = false,
        AutoEscape = false,
        AutoHS = false,
        RemoveFog = false,
        AntiAFK = false,
        _killAll = false,
        AutoRevive = false,
        AutoSelfRevive = false,
        SnowAnimation = false,
        RoyalAnimation = false,
        NinjaAnimation = false,
        AntiVoid = false,
        ThemeHue = 0.58,
        FpsBoost = false,
        ShowAds = true,
        ShiftLock = false,
        JumpBoost = false,
    },
    NameSettings = {
        OffsetY = 4.5,
        Font = Enum.Font.GothamBold,
    },
    DistSettings = {
        OffsetY = -4.5,
        Font = Enum.Font.GothamBold,
    },
    LivesSettings = {
        OffsetY = 7,
        OffsetX = 0,
        HeartSize = 10,
    },
    OriginalFog = {
        FogEnd = t1.Lighting.FogEnd,
        FogStart = t1.Lighting.FogStart,
        Ambient = t1.Lighting.Ambient,
        OutdoorAmbient = t1.Lighting.OutdoorAmbient,
        ColorShift_Bottom = t1.Lighting.ColorShift_Bottom,
        ColorShift_Top = t1.Lighting.ColorShift_Top,
        ClockTime = t1.Lighting.ClockTime,
        Brightness = t1.Lighting.Brightness,
        GlobalShadows = t1.Lighting.GlobalShadows,
    },
    OriginalAtmosphere = {},
    OriginalAnims = {},
    Connections = {
        Jump = nil,
        State = nil,
    },
    Storage = {
        Players = {},
        TeamConns = {},
        Exits = {},
        Loot = {},
        NameLabels = {},
        DistLabels = {},
        Lives = {},
    },
    Cn = {
        autoEscape = nil,
        killerSafety = nil,
        noclip = nil,
        speed = nil,
        fog = nil,
        antiAfk = nil,
        autoRevive = nil,
        reviveFollow = nil,
        autoSelfRevive = nil,
        fly = nil,
        infiniteJump = nil,
        watchdog = nil,
        antiSeat = nil,
        teamWatch = nil,
        lootAdded = nil,
        lootRemoved = nil,
        hitbox = nil,
        jumpBoost = nil,
        autoHS = nil,
    },
    Fl = {
        autoFarmRunning = false,
        autoEscapeRunning = false,
        killerSafetyActive = false,
        killAllRunning = false,
        fogLoopRunning = false,
        autoReviveRunning = false,
        reviveSelfPaused = false,
        farmPaused = false,
        farmStoppedForRound = false,
        escapeTriggeredExternal = false,
        escapeCheckTimer = 0,
        farmPriority = 0,
        killerSafetyDist = 50,
        currentSpeed = 16,
        flySpeed = 50,
        hitboxRadius = 15,
        jumpPower = 60,
        lastFarmPos = nil,
        lastFarmPosTime = 0,
        uiScale = 1,
        winSize = 1,
        hudSize = 1,
        bgTransparency = 0.5,
        lootCacheMap = nil,
        currentMapInstance = nil,
        originalMasterVolume = t1.SoundService.AmbientReverb,
        currentTab = "home",
        _reviveStarting = false,
        _escapeWaitStart = nil,
        isTeleporting = false,
        ghostActive = false,
        ghostDebounce = false,
        realChar = nil,
        fakeChar = nil,
        ghostSavedStates = {},
        autoHSRunning = false,
    },
    flyKeys = {
        up = false,
        down = false,
    },
    toggleRefs = {},
    toggleCbs = {},
    collectedLoot = setmetatable({}, {
        __mode = "k",
    }),
    cachedMap = nil,
    lootValueCache = setmetatable({}, {
        __mode = "k",
    }),
    espColorCache = {},
    reviveTracking = {},
    livesData = {},
    livesDownState = {},
    MainBtn_ref = nil,
    CoinsHUD_ref = nil,
    UIRefs = {
        Themed = {},
    },
    _savedBtnPos = nil,
    _lockerCache = {
        models = {},
        time = 0,
    },
    _pristineAnimate = nil,
    SAVE_FILE = "JxH_settingsV7.0.json",
    _lastSaveTime = 0,
    _sliderDrags = {},
    _sliderDragId = nil,
    _restartCooldown = 0,
    canJump2 = false,
    jumpCount = 0,
    farmLoopId = 0,
    lootEspTimer = 0,
    livesTrackTimer = 0,
    reviveLoopId = 0,
    selfReviveLoopId = 0,
    PUBLIC_REPO_URL = "https://raw.githubusercontent.com/bandmy00-droid/JohnyX-V6.0/main/",
    Language = "EN",
    Analytics = {
        farmSuccess = 0,
        farmFail = 0,
        escapeCount = 0,
        coinsCollected = 0,
        sessionStart = tick(),
    },
}
for _, child in ipairs(t1.Lighting:GetChildren()) do
    if child:IsA("Atmosphere") then
        t2.OriginalAtmosphere[child] = {
            Density = child.Density,
            Haze = child.Haze,
        }
    end
end
t1.UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then
        return
    end
    if input.KeyCode == Enum.KeyCode.Space then
        t2.flyKeys.up = true
    elseif input.KeyCode == Enum.KeyCode.LeftControl then
        t2.flyKeys.down = true
    end
end)
t1.UserInputService.InputEnded:Connect(function(input, _)
    if input.KeyCode == Enum.KeyCode.Space then
        t2.flyKeys.up = false
    elseif input.KeyCode == Enum.KeyCode.LeftControl then
        t2.flyKeys.down = false
    end
end)
local t3 = {}
local t4 = {}
local t5 = {}
local u28 = nil
local u29 = nil
t3.clearTable = function(p2)
    if type(p2) == "table" then
        for k in pairs(p2) do
            p2[k] = nil
        end
    end
end
t3.pctToDelay = function(p3)
    if p3 >= 180 then
        return 0
    end
    if p3 <= 100 then
        return 3 - p3 / 100 * 2
    end
    return 1 - (p3 - 100) / 80 * 0.95
end
t3.safeDestroy = function(p4)
    if p4 and p4.Parent then
        pcall(function()
            p4:Destroy()
        end)
    end
end
t3.setToggleState = function(p5, p6)
    if p6 ~= t2.Settings[p5] then
        t2.Settings[p5] = p6
        if t2.toggleRefs[p5] then
            t2.toggleRefs[p5](p6)
        end
        if t2.toggleCbs[p5] then
            t2.toggleCbs[p5](p6)
        end
        if t2.UIRefs and t2.UIRefs._updateStatusBar then
            t2.UIRefs._updateStatusBar()
        end
    end
end
local t6 = {
    ["Heart.png"] = "rbxthumb://type=Asset&id=108571680732230&w=420&h=420",
    ["CoINs.png"] = "rbxthumb://type=Asset&id=136782305608562&w=420&h=420",
    ["Farm.png"] = "rbxthumb://type=Asset&id=110686780409469&w=420&h=420",
    ["setting.png"] = "rbxthumb://type=Asset&id=96621936204864&w=420&h=420",
    ["esp.png"] = "rbxthumb://type=Asset&id=108417288747288&w=420&h=420",
    ["JXPhoTHO.png"] = "rbxthumb://type=Asset&id=138627690193651&w=420&h=420",
    ["Telegram.png"] = "rbxthumb://type=Asset&id=86445606186301&w=420&h=420",
    ["Home.png"] = "rbxthumb://type=Asset&id=102444249610138&w=420&h=420",
    ["English.jpg"] = "rbxthumb://type=Asset&id=105735635413663&w=420&h=420",
    ["Russian.jpg"] = "rbxthumb://type=Asset&id=95543406783515&w=420&h=420",
    ["Arabic.jpg"] = "rbxthumb://type=Asset&id=135608817445851&w=420&h=420",
}
local function u31(p7, p8)
    pcall(function()
        if p7 and p7.Parent then
            p7.Image = t6[p8] or ""
        end
    end)
end
local self = setmetatable({}, {
    __mode = "k",
})
t3.findFolder = function(p9, p10)
    if not p9 then
        return nil
    end
    if not self[p9] then
        self[p9] = {}
    end
    local v73 = self[p9][p10]
    if v73 ~= nil then
        if v73 == false then
            return nil
        end
        if v73.Parent then
            return v73
        end
        self[p9][p10] = nil
    end
    local p10_2 = p9:FindFirstChild(p10, true)
    if p10_2 and (p10_2:IsA("Folder") or p10_2:IsA("Model")) then
        self[p9][p10] = p10_2
        return p10_2
    end
    self[p9][p10] = false
    return nil
end
t3.getMap = function()
    if t3.getMyTeamType() == "lobby" then
        return nil
    end
    if t2.cachedMap and t2.cachedMap.Parent then
        return t2.cachedMap
    end
    t2.cachedMap = nil
    local t7 = {
        ["happy neighborhood"] = true,
        ["willow marsh"] = true,
        ["water treatment facility"] = true,
        ["papa roni's pizzeria"] = true,
        ["night school"] = true,
        ["fair grounds"] = true,
        ["haunted mansion"] = true,
        ["scary gary's academy"] = true,
        ["deadman's point"] = true,
        ["space lab"] = true,
        ["darkwood asylum"] = true,
        ["skate zone"] = true,
        ["cabin fever"] = true,
        ["the shipwreck"] = true,
        ["desert ruins"] = true,
        ["area 51"] = true,
        ["the sewers"] = true,
        ["construction site"] = true,
        ["the suburbs"] = true,
        ["creepy carnival"] = true,
        ["winter wonderland"] = true,
        ["gingerbread village"] = true,
        ["pumpkin patch"] = true,
        ["santa's workshop"] = true,
        ["haunted forest"] = true,
    }
    local children = workspace:GetChildren()
    for i2 = 1, #children do
        local v78 = children[i2]
        if (v78:IsA("Model") or v78:IsA("Folder")) and v78 ~= t1.LocalPlayer.Character and t7[v78.Name:lower()] then
            t2.cachedMap = v78
            return v78
        end
    end
    return nil
end
t3.getMyTeamType = function()
    local Team = t1.LocalPlayer.Team
    if not Team then
        return "lobby"
    end
    local v80 = Team.Name:lower()
    if v80:find("survivor") or v80:find("innocent") or v80:find("hider") then
        return "survivor"
    end
    if v80:find("killer") then
        return "killer"
    end
    return "lobby"
end
t3.getPlayerTeamType = function(p11)
    if p11 == t1.LocalPlayer then
        return t3.getMyTeamType()
    end
    local Team = p11.Team
    if not Team then
        return "lobby"
    end
    local v83 = Team.Name:lower()
    if v83:find("killer") then
        return "killer"
    end
    if v83:find("survivor") or v83:find("innocent") or v83:find("hider") then
        return "survivor"
    end
    return "lobby"
end
local u33 = fromRGB(255, 40, 40)
local u34 = fromRGB(40, 200, 255)
local u35 = fromRGB(180, 180, 180)
t3.isKillerPlayer = function(p12)
    if p12 == t1.LocalPlayer then
        return false
    end
    local Team = p12.Team
    if not Team then
        return false
    end
    local v86 = Team.Name:lower()
    if v86 == "killer" or v86:find("^killer") then
        return true
    end
    if v86:find("survivor") or v86:find("innocent") or v86:find("lobby") or v86:find("hider") then
        return false
    end
    local Team2 = t1.LocalPlayer.Team
    if Team2 then
        local v88 = Team2.Name:lower()
        if v88:find("survivor") or v88:find("innocent") or v88:find("hider") then
            return Team ~= Team2
        end
    end
    return false
end
t3.refreshPlayerColor = function(p13)
    t2.espColorCache[p13.UserId] = nil
    local Team = p13.Team
    local v91 = Team and (not not Team.Name:lower():find("lobby") and u35) or (t3.isKillerPlayer(p13) and u33 or u34)
    t2.espColorCache[p13.UserId] = v91
    return v91
end
t3.applyNameFont = function(p14)
    t2.NameSettings.Font = p14
    for _, v in pairs(t2.Storage.NameLabels) do
        if v.lbl and v.lbl.Parent then
            v.lbl.Font = p14
        end
    end
end
t3.applyNameOffset = function(p15)
    t2.NameSettings.OffsetY = p15
    for _, v in pairs(t2.Storage.NameLabels) do
        if v.bgui and v.bgui.Parent then
            v.bgui.StudsOffset = new(0, p15, 0)
        end
    end
end
t3.applyDistFont = function(p16)
    t2.DistSettings.Font = p16
    for _, v in pairs(t2.Storage.DistLabels) do
        if v.lbl and v.lbl.Parent then
            v.lbl.Font = p16
        end
    end
end
t3.applyDistOffset = function(p17)
    t2.DistSettings.OffsetY = p17
    for _, v in pairs(t2.Storage.DistLabels) do
        if v.bgui and v.bgui.Parent then
            v.bgui.StudsOffset = new(0, p17, 0)
        end
    end
end
t3.applyLivesOffsetY = function(p18)
    t2.LivesSettings.OffsetY = p18
    for _, v in pairs(t2.livesData) do
        if v.bgui and v.bgui.Parent then
            v.bgui.StudsOffset = new(t2.LivesSettings.OffsetX, p18, 0)
        end
    end
end
t3.applyLivesOffsetX = function(p19)
    t2.LivesSettings.OffsetX = p19
    for _, v in pairs(t2.livesData) do
        if v.bgui and v.bgui.Parent then
            v.bgui.StudsOffset = new(p19, t2.LivesSettings.OffsetY, 0)
        end
    end
end
t3.applyLivesSize = function(p20)
    t2.LivesSettings.HeartSize = p20
    local v111 = floor(p20 / 6 + 1)
    local v112 = p20 * t2.LIVES_MAX + v111 * (t2.LIVES_MAX - 1)
    for _, v in pairs(t2.livesData) do
        local v115 = v
        if v115.bgui and v115.bgui.Parent then
            v115.bgui.Size = new5(0, v112, 0, p20 + 4)
            for i3, v2 in ipairs(v115.heartImgs or {}) do
                if v2 and v2.Parent then
                    v2.Size = new5(0, p20, 0, p20)
                    v2.Position = new5(0, (i3 - 1) * (p20 + v111), 0.5, -floor(p20 / 2))
                end
            end
        end
    end
end
t3.updateHearts = function(p21, p22)
    local v120 = t2.livesData[p21]
    if not v120 then
        return
    end
    local v121 = math.clamp(p22, 0, t2.LIVES_MAX)
    v120.lives = v121
    for i4, v in ipairs(v120.heartImgs or {}) do
        local v124 = v
        if v124 and v124.Parent then
            if i4 <= v121 then
                v124.Visible = true
                v124.ImageTransparency = 0
                v124.ImageColor3 = fromRGB(255, 40, 40)
            else
                v124.Visible = false
            end
        end
    end
end
t3.isPlayerDowned = function(p23)
    local Character = p23.Character
    if not Character then
        return false
    end
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    if not Humanoid or Humanoid.Health <= 0 and Humanoid.MaxHealth > 0 then
        return false
    end
    if Character:FindFirstChildOfClass("ForceField") then
        return false
    end
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return false
    end
    local BleedOutHealth = HumanoidRootPart:FindFirstChild("BleedOutHealth")
    if BleedOutHealth and BleedOutHealth.Enabled then
        return true
    end
    local Downed = Character:FindFirstChild("Downed")
    if Downed and (Downed:IsA("BoolValue") and Downed.Value or Downed:IsA("IntValue") and Downed.Value > 0) then
        return true
    end
    local Incapacitated = Character:FindFirstChild("Incapacitated")
    if Incapacitated and (Incapacitated:IsA("BoolValue") and Incapacitated.Value or Incapacitated:IsA("IntValue") and Incapacitated.Value > 0) then
        return true
    end
    local State = Humanoid:GetState()
    if (State == Enum.HumanoidStateType.FallingDown or State == Enum.HumanoidStateType.Ragdoll) and Humanoid.WalkSpeed < 5 then
        return true
    end
    return false
end
t3.ultraFastTeleport = function(p24)
    local Character = t1.LocalPlayer.Character
    local u136 = Character and Character:FindFirstChild("HumanoidRootPart")
    local v137 = Character and Character:FindFirstChildOfClass("Humanoid")
    if not u136 or not v137 or v137.Health <= 0 then
        return
    end
    local Position = u136.Position
    local Magnitude = (p24 - Position).Magnitude
    if Magnitude <= 55 then
        pcall(function()
            u136.CFrame = new2(p24)
            u136.Velocity = u20
            u136.RotVelocity = u20
        end)
    else
        if t2.Fl.isTeleporting then
            return
        end
        t2.Fl.isTeleporting = true
        local v140 = floor(Magnitude / 55) + 1
        for i5 = 1, v140 do
            if not u136 or not u136.Parent or v137.Health <= 0 then
                break
            end
            local v142 = i5 / v140
            local u143 = Position:Lerp(p24, v142)
            pcall(function()
                u136.CFrame = new2(u143)
                u136.Velocity = u20
                u136.RotVelocity = u20
            end)
            t1.RunService.Heartbeat:Wait()
        end
        t2.Fl.isTeleporting = false
    end
end
t3.createPlayerESP = function(p25)
    if p25 == t1.LocalPlayer then
        return
    end
    local function u146()
        local u757 = t2.Storage.Players[p25.UserId]
        if u757 then
            if u757.colorDot then
                pcall(function()
                    u757.colorDot:Destroy()
                end)
            end
            t3.safeDestroy(u757.bgui)
            t3.safeDestroy(u757.bguiDist)
            t3.safeDestroy(u757.bguiBox)
            t3.safeDestroy(u757.hl)
            if u757.conn then
                u757.conn:Disconnect()
            end
            if u757.charConn then
                u757.charConn:Disconnect()
            end
            t2.Storage.Players[p25.UserId] = nil
        end
        local v758 = t2.Storage.Lives[p25.UserId]
        if v758 then
            t3.safeDestroy(v758.bgui)
            t2.Storage.Lives[p25.UserId] = nil
        end
        t2.Storage.NameLabels[p25.UserId] = nil
        t2.Storage.DistLabels[p25.UserId] = nil
        t2.espColorCache[p25.UserId] = nil
        t2.livesData[p25.UserId] = nil
        t2.livesDownState[p25.UserId] = nil
    end
    local function u147()
        u146()
        local v759 = "team_" .. p25.UserId
        t2.espColorCache[v759] = nil
        local v760 = t3.refreshPlayerColor(p25)
        local u761 = new3("BillboardGui")
        u761.Name = "ESP_Name"
        u761.Size = new5(0, 100, 0, 15)
        u761.StudsOffset = new(0, t2.NameSettings.OffsetY, 0)
        u761.AlwaysOnTop = true
        u761.LightInfluence = 0
        u761.MaxDistance = math.huge
        u761.ResetOnSpawn = false
        u761.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        u761.Enabled = t2.Settings.PlayerESP and t2.Settings.ShowNames
        local u762 = t1.CoreGui:FindFirstChild("RobloxGui") or t1.CoreGui
        pcall(function()
            u761.Parent = u762
        end)
        if not u761.Parent then
            pcall(function()
                u761.Parent = t1.LocalPlayer:WaitForChild("PlayerGui")
            end)
        end
        local v763 = new3("Frame")
        v763.Parent = u761
        v763.Size = new5(0, 6, 0, 6)
        v763.Position = new5(0, -8, 0.5, -3)
        v763.BackgroundColor3 = v760
        v763.BorderSizePixel = 0
        local v764 = new3("UICorner")
        v764.Parent = v763
        v764.CornerRadius = new6(1, 0)
        local v765 = new3("TextLabel")
        v765.Parent = u761
        v765.Size = new5(1, 0, 1, 0)
        v765.BackgroundTransparency = 1
        v765.Text = p25.DisplayName
        v765.TextColor3 = v760
        v765.Font = t2.NameSettings.Font
        v765.TextSize = 10
        v765.TextStrokeTransparency = 0.2
        v765.TextStrokeColor3 = new4(0, 0, 0)
        v765.TextXAlignment = Enum.TextXAlignment.Center
        local u766 = new3("BillboardGui")
        u766.Name = "ESP_Dist"
        u766.Size = new5(0, 80, 0, 12)
        u766.StudsOffset = new(0, t2.DistSettings.OffsetY, 0)
        u766.AlwaysOnTop = true
        u766.LightInfluence = 0
        u766.MaxDistance = math.huge
        u766.ResetOnSpawn = false
        u766.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        u766.Enabled = t2.Settings.PlayerESP and t2.Settings.ShowDistance
        pcall(function()
            u766.Parent = u762
        end)
        if not u766.Parent then
            pcall(function()
                u766.Parent = t1.LocalPlayer:WaitForChild("PlayerGui")
            end)
        end
        local v767 = new3("TextLabel")
        v767.Parent = u766
        v767.Size = new5(1, 0, 1, 0)
        v767.BackgroundTransparency = 1
        v767.Text = ""
        v767.TextColor3 = fromRGB(230, 230, 230)
        v767.Font = t2.DistSettings.Font
        v767.TextSize = 9
        v767.TextStrokeTransparency = 0.2
        v767.TextStrokeColor3 = new4(0, 0, 0)
        v767.TextXAlignment = Enum.TextXAlignment.Center
        local u768 = new3("BillboardGui")
        u768.Name = "ESP_Box"
        u768.Size = new5(0, 40, 0, 62)
        u768.StudsOffset = new(0, 0.5, 0)
        u768.AlwaysOnTop = true
        u768.LightInfluence = 0
        u768.MaxDistance = math.huge
        u768.ResetOnSpawn = false
        u768.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        u768.Enabled = false
        pcall(function()
            u768.Parent = u762
        end)
        if not u768.Parent then
            pcall(function()
                u768.Parent = t1.LocalPlayer:WaitForChild("PlayerGui")
            end)
        end
        local v769 = new3("Frame")
        v769.Parent = u768
        v769.Size = new5(1, 0, 1, 0)
        v769.BackgroundTransparency = 1
        v769.BorderSizePixel = 0
        local v770 = new3("UIStroke")
        v770.Parent = v769
        v770.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        v770.Color = v760
        v770.Thickness = 1
        v770.Transparency = 0
        local HeartSize = t2.LivesSettings.HeartSize
        local v772 = floor(HeartSize / 6 + 1)
        local v773 = HeartSize * t2.LIVES_MAX + v772 * (t2.LIVES_MAX - 1)
        local u774 = new3("BillboardGui")
        u774.Name = "ESP_Lives"
        u774.Size = new5(0, v773, 0, HeartSize + 4)
        u774.StudsOffset = new(t2.LivesSettings.OffsetX, t2.LivesSettings.OffsetY, 0)
        u774.AlwaysOnTop = true
        u774.LightInfluence = 0
        u774.MaxDistance = math.huge
        u774.ResetOnSpawn = false
        u774.Enabled = false
        pcall(function()
            u774.Parent = u762
        end)
        if not u774.Parent then
            pcall(function()
                u774.Parent = t1.LocalPlayer:WaitForChild("PlayerGui")
            end)
        end
        local t8 = {}
        for i6 = 1, t2.LIVES_MAX do
            local v777 = i6
            local v778 = new3("ImageLabel")
            v778.Parent = u774
            v778.Size = new5(0, HeartSize, 0, HeartSize)
            v778.Position = new5(0, (v777 - 1) * (HeartSize + v772), 0.5, -floor(HeartSize / 2))
            v778.BackgroundTransparency = 1
            v778.ScaleType = Enum.ScaleType.Fit
            v778.Visible = true
            v778.ImageColor3 = fromRGB(255, 40, 40)
            v778.ImageTransparency = 0
            u31(v778, "Heart.png")
            t8[v777] = v778
        end
        if not t2.livesData[p25.UserId] then
            t2.livesData[p25.UserId] = {
                lives = t2.LIVES_MAX,
                lastLoss = 0,
            }
        end
        t2.livesData[p25.UserId].bgui = u774
        t2.livesData[p25.UserId].heartImgs = t8
        t2.livesDownState[p25.UserId] = false
        t2.Storage.Lives[p25.UserId] = {
            bgui = u774,
        }
        t2.Storage.NameLabels[p25.UserId] = {
            lbl = v765,
            bgui = u761,
        }
        t2.Storage.DistLabels[p25.UserId] = {
            lbl = v767,
            bgui = u766,
            lastDist = -1,
        }
        local v779 = new3("Highlight")
        v779.FillTransparency = 0.75
        v779.OutlineTransparency = 0.1
        v779.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        v779.FillColor = v760
        v779.OutlineColor = v760
        v779.Enabled = false
        local t9 = {
            bgui = u761,
            bguiDist = u766,
            hl = v779,
            colorDot = v763,
            conn = nil,
            charConn = nil,
            bguiBox = u768,
            boxStroke = v770,
            boxSzW = 0,
            boxSzH = 0,
        }
        t2.Storage.Players[p25.UserId] = t9
        t3.updateHearts(p25.UserId, t2.livesData[p25.UserId].lives)
        t9.charConn = p25.CharacterAdded:Connect(function(_)
            task.wait(0.5)
            if p25 and p25.Parent then
                u147()
            end
        end)
    end
    u147()
    if t2.Storage.TeamConns[p25.UserId] then
        t2.Storage.TeamConns[p25.UserId]:Disconnect()
    end
    t2.Storage.TeamConns[p25.UserId] = p25:GetPropertyChangedSignal("Team"):Connect(function()
        local v781 = "team_" .. p25.UserId
        t2.espColorCache[v781] = nil
        local v782 = t3.refreshPlayerColor(p25)
        local v783 = t2.Storage.Players[p25.UserId]
        if v783 and v783.hl then
            v783.hl.FillColor = v782
            v783.hl.OutlineColor = v782
        end
        if v783 and v783.boxStroke and v783.boxStroke.Parent then
            v783.boxStroke.Color = v782
        end
        if v783 and v783.colorDot and v783.colorDot.Parent then
            v783.colorDot.BackgroundColor3 = v782
        end
        local v784 = t2.Storage.NameLabels[p25.UserId]
        if v784 and v784.lbl and v784.lbl.Parent then
            v784.lbl.TextColor3 = v782
        end
        local v785 = t3.getPlayerTeamType(p25)
        local v786 = t2.livesData[p25.UserId]
        if v786 and v786.bgui and v785 ~= "survivor" then
            v786.bgui.Enabled = false
            v786.lives = t2.LIVES_MAX
            t2.livesDownState[p25.UserId] = false
            t3.updateHearts(p25.UserId, t2.LIVES_MAX)
        end
    end)
end
local t10 = {}
local u37 = true
local function u38()
    if u37 then
        t10 = t1.Players:GetPlayers()
        u37 = false
    end
    return t10
end
local n1 = 0
local n2 = 0
local n3 = 0
t1.RunService.Heartbeat:Connect(function(dt)
    n1 += dt
    n2 += dt
    n3 += dt
    t2.livesTrackTimer = t2.livesTrackTimer + dt
    if n2 >= 0.5 then
        n2 = 0
        if t2.Fl.autoFarmRunning then
            if t1.SoundService.AmbientReverb ~= Enum.ReverbType.NoReverb then
                t1.SoundService.AmbientReverb = Enum.ReverbType.NoReverb
            end
        elseif t1.SoundService.AmbientReverb ~= t2.Fl.originalMasterVolume then
            t1.SoundService.AmbientReverb = t2.Fl.originalMasterVolume
        end
    end
    if n3 >= 8 then
        n3 = 0
        if t3.getMyTeamType() ~= "lobby" then
            local v149 = t3.getMap()
            if v149 ~= t2.Fl.currentMapInstance then
                t2.Fl.currentMapInstance = v149
                t3.clearTable(t2.Storage.Loot)
                t3.clearTable(t2.collectedLoot)
                t2.Fl.lootCacheMap = nil
                t3.clearTable(t2._lockerCache.models)
                for _, v in pairs(t2.Storage.Exits) do
                    t3.safeDestroy(v)
                end
                t3.clearTable(t2.Storage.Exits)
                if t2.Settings.ExitESP then
                    task.spawn(t3.updateExitESP)
                end
            end
        else
            t2.Fl.currentMapInstance = nil
        end
    end
    if n1 >= 0.2 then
        n1 = 0
        if not t2.Settings.PlayerESP then
            for _, v in pairs(t2.Storage.Players) do
                local v154 = v
                if v154.bgui and v154.bgui.Enabled then
                    v154.bgui.Enabled = false
                end
                if v154.bguiDist and v154.bguiDist.Enabled then
                    v154.bguiDist.Enabled = false
                end
                if v154.hl and v154.hl.Enabled then
                    v154.hl.Enabled = false
                end
                if v154.bguiBox and v154.bguiBox.Enabled then
                    v154.bguiBox.Enabled = false
                end
            end
        else
            local Character = t1.LocalPlayer.Character
            local v156 = Character and Character:FindFirstChild("HumanoidRootPart")
            local CurrentCamera = workspace.CurrentCamera
            local v158 = v156
            local v159 = CurrentCamera and CurrentCamera.CameraSubject
            if v159 and v159:IsA("Humanoid") then
                local Parent = v159.Parent
                if Parent then
                    local HumanoidRootPart = Parent:FindFirstChild("HumanoidRootPart")
                    if HumanoidRootPart and HumanoidRootPart ~= v156 then
                        v158 = HumanoidRootPart
                    end
                end
            end
            for _, v in ipairs(u38()) do
                if v ~= t1.LocalPlayer then
                    local UserId = v.UserId
                    local u165 = t2.Storage.Players[UserId]
                    if u165 then
                        local Character2 = v.Character
                        local v167 = Character2 and Character2:FindFirstChild("HumanoidRootPart")
                        local bgui = u165.bgui
                        local bguiDist = u165.bguiDist
                        local v170 = t2.Storage.Lives[UserId] and t2.Storage.Lives[UserId].bgui
                        if not Character2 or not v167 then
                            if bgui and bgui.Enabled then
                                bgui.Enabled = false
                            end
                            if bguiDist and bguiDist.Enabled then
                                bguiDist.Enabled = false
                            end
                            if v170 and v170.Enabled then
                                v170.Enabled = false
                            end
                            if u165.hl and u165.hl.Enabled then
                                u165.hl.Enabled = false
                            end
                            if u165.bguiBox and u165.bguiBox.Enabled then
                                u165.bguiBox.Enabled = false
                            end
                        else
                            local v171 = v158 and (v167.Position - v158.Position).Magnitude or 0
                            local v172 = not (v171 < 203)
                            if bgui then
                                if v167 ~= bgui.Adornee then
                                    bgui.Adornee = v167
                                end
                                local ShowNames = t2.Settings.ShowNames
                                if ShowNames ~= bgui.Enabled then
                                    bgui.Enabled = ShowNames
                                end
                            end
                            if bguiDist then
                                if v167 ~= bguiDist.Adornee then
                                    bguiDist.Adornee = v167
                                end
                                if t2.Settings.ShowDistance and v156 then
                                    local v174 = t2.Storage.DistLabels[UserId]
                                    if v174 and v174.lbl then
                                        local v175 = floor(v171)
                                        if v175 ~= v174.lastDist then
                                            v174.lastDist = v175
                                            v174.lbl.Text = v175 .. " m"
                                        end
                                    end
                                    if not bguiDist.Enabled then
                                        bguiDist.Enabled = true
                                    end
                                elseif bguiDist.Enabled then
                                    bguiDist.Enabled = false
                                end
                            end
                            if u165.hl then
                                if u165.hl.Adornee ~= Character2 then
                                    u165.hl.Adornee = Character2
                                end
                                if u165.hl.Parent ~= Character2 then
                                    pcall(function()
                                        u165.hl.Parent = Character2
                                    end)
                                end
                                local v176 = "team_" .. UserId
                                local v177 = t2.espColorCache[v176] or t3.getPlayerTeamType(v)
                                t2.espColorCache[v176] = v177
                                local v178 = t2.espColorCache[UserId] or t3.refreshPlayerColor(v)
                                if v178 ~= u165.hl.FillColor then
                                    u165.hl.FillColor = v178
                                    u165.hl.OutlineColor = v178
                                end
                                local v179 = not v172
                                if v179 ~= u165.hl.Enabled then
                                    u165.hl.Enabled = v179
                                end
                            end
                            if u165.bguiBox then
                                if v167 ~= u165.bguiBox.Adornee then
                                    u165.bguiBox.Adornee = v167
                                end
                                if v172 ~= u165.bguiBox.Enabled then
                                    u165.bguiBox.Enabled = v172
                                end
                                if v172 then
                                    local v180 = max(5, floor(1540 / v171))
                                    local v181 = max(8, floor(3850 / v171))
                                    if v180 ~= u165.boxSzW or v181 ~= u165.boxSzH then
                                        u165.boxSzW = v180
                                        u165.boxSzH = v181
                                        u165.bguiBox.Size = new5(0, v180, 0, v181)
                                    end
                                    if u165.boxStroke then
                                        local v182 = t2.espColorCache[UserId] or t3.refreshPlayerColor(v)
                                        if v182 ~= u165.boxStroke.Color then
                                            u165.boxStroke.Color = v182
                                        end
                                    end
                                end
                            end
                            if v170 then
                                if v167 ~= v170.Adornee then
                                    v170.Adornee = v167
                                end
                                local v183 = "team_" .. UserId
                                local v184 = t2.espColorCache[v183]
                                if not v184 then
                                    v184 = t3.getPlayerTeamType(v)
                                end
                                local v185 = t2.Settings.LivesESP and v184 == "survivor"
                                if v185 ~= v170.Enabled then
                                    v170.Enabled = v185
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    if t2.livesTrackTimer >= 0.5 then
        t2.livesTrackTimer = 0
        if t2.Settings.LivesESP then
            for _, v in ipairs(u38()) do
                local v188 = v
                if v188 ~= t1.LocalPlayer then
                    local UserId = v188.UserId
                    local v190 = "team_" .. UserId
                    local v191 = t2.espColorCache[v190] or t3.getPlayerTeamType(v188)
                    t2.espColorCache[v190] = v191
                    if v191 ~= "survivor" then
                        t2.livesDownState[UserId] = false
                    else
                        local v192 = t3.isPlayerDowned(v188)
                        local v193 = t2.livesDownState[UserId] or false
                        local elapsed = os.clock()
                        if not t2.livesData[UserId] then
                            t2.livesData[UserId] = {
                                lives = t2.LIVES_MAX,
                                lastLoss = 0,
                            }
                        end
                        t2.livesData[UserId].lastLoss = t2.livesData[UserId].lastLoss or 0
                        local v195 = v192
                        if v195 then
                            v195 = not v193
                        end
                        if v195 then
                            v195 = elapsed - t2.livesData[UserId].lastLoss > 4
                        end
                        if v195 then
                            t2.livesData[UserId].lives = max(0, t2.livesData[UserId].lives - 1)
                            t2.livesData[UserId].lastLoss = elapsed
                            t3.updateHearts(UserId, t2.livesData[UserId].lives)
                        end
                        t2.livesDownState[UserId] = v192
                        local Character = v188.Character
                        local v197 = Character and Character:FindFirstChildOfClass("Humanoid")
                        if v197 and v197.Health <= 0 and t2.livesData[UserId] and t2.livesData[UserId].lives > 0 then
                            t2.livesData[UserId].lives = 0
                            t3.updateHearts(UserId, 0)
                        end
                    end
                end
            end
        end
    end
end)
t3.createLootBillboard = function(p27, p28)
    for _, child in ipairs(p27:GetChildren()) do
        if child:IsA("BillboardGui") and child.Name == "JxH_LootESP" then
            t3.safeDestroy(child)
            break
        end
    end
    local v202 = new3("BillboardGui")
    v202.Name = "JxH_LootESP"
    v202.Adornee = p27
    v202.Size = new5(0, 45, 0, 14)
    v202.AlwaysOnTop = true
    v202.StudsOffset = new(0, 1.5, 0)
    v202.MaxDistance = 400
    v202.Enabled = p27.Transparency < 0.9
    local v203 = new3("ImageLabel")
    v203.Parent = v202
    v203.Size = new5(0, 9, 0, 9)
    v203.Position = new5(0, 2, 0.5, -4)
    v203.BackgroundTransparency = 1
    v203.ScaleType = Enum.ScaleType.Fit
    u31(v203, "CoINs.png")
    local v204 = new3("TextLabel")
    v204.Parent = v202
    v204.Size = new5(1, -12, 1, 0)
    v204.Position = new5(0, 12, 0, 0)
    v204.BackgroundTransparency = 1
    v204.Text = "+" .. tostring(p28)
    v204.TextColor3 = fromRGB(255, 230, 0)
    v204.Font = Enum.Font.GothamBold
    v204.TextSize = 9
    v204.TextStrokeTransparency = 0.5
    v204.TextXAlignment = Enum.TextXAlignment.Left
    v202.Parent = p27
    return v202
end
t3.getLootValue = function(p29)
    if t2.lootValueCache[p29] ~= nil then
        return t2.lootValueCache[p29]
    end
    local function v207(p30)
        if p30 == 20 then
            p30 = nil
        end
        t2.lootValueCache[p29] = p30
        return p30
    end
    local v208 = p29:GetAttribute("Value") or p29:GetAttribute("Amount")
    if v208 then
        local v209 = nil
        if type(v208) == "number" then
            v209 = v208
        elseif type(v208) == "string" then
            v209 = tonumber(v208)
        end
        if v209 then
            return v207(v209)
        end
    end
    local descendants = p29:GetDescendants()
    local num = nil
    local v212, v213, v214 = ipairs(descendants)
    for _, v216 in v212, v213, v214 do
        local v217 = v216
        if v217:IsA("ProximityPrompt") then
            local ActionText = v217:GetAttribute("ActionText")
            if ActionText and type(ActionText) == "string" then
                local v219 = ActionText:match("%+(%d+)")
                if v219 then
                    num = tonumber(v219)
                    break
                end
            end
            local v220 = v217.ActionText .. " " .. v217.ObjectText
            local v221 = v220:match("%+(%d+)") or (v220:match("(%d+)%s*[Cc]oin") or v220:match("(%d+)%s*[Gg]old"))
            if not v221 then
                continue
            end
            num = tonumber(v221)
            break
        end
        if v217:IsA("ClickDetector") then
            local ActionText = v217:GetAttribute("ActionText")
            if not ActionText or type(ActionText) ~= "string" then
                continue
            end
            local v223 = ActionText:match("%+(%d+)")
            if not v223 then
                continue
            end
            num = tonumber(v223)
            break
        end
        if not (v217:IsA("TextLabel") or v217:IsA("TextButton")) then
            if (v217:IsA("IntValue") or v217:IsA("NumberValue")) and not num then
                num = v217.Value
            elseif v217:IsA("StringValue") and not num then
                local num2 = tonumber(v217.Value)
                if num2 then
                    num = num2
                end
            end
            continue
        end
        local v225 = v217.Text:match("%+(%d+)")
        if not not v225 then
            num = tonumber(v225)
            break
        end
    end
    if num then
        return v207(num)
    end
    if p29:IsDescendantOf(workspace) then
        local v226 = t3.getMap()
        local v227 = t3.findFolder(v226, "LootSpawns")
        if not v227 then
            v227 = t3.findFolder(workspace, "LootSpawns")
        end
        if v227 and p29:IsDescendantOf(v227) then
            return v207(1)
        end
    end
    return v207(nil)
end
t3.buildLootCache = function(p31)
    if t2.Fl.lootCacheMap == p31 then
        return
    end
    if t2.Cn.lootAdded then
        t2.Cn.lootAdded:Disconnect()
        t2.Cn.lootAdded = nil
    end
    if t2.Cn.lootRemoved then
        t2.Cn.lootRemoved:Disconnect()
        t2.Cn.lootRemoved = nil
    end
    for _, v in pairs(t2.Storage.Loot) do
        if v.bgui then
            t3.safeDestroy(v.bgui)
        end
    end
    t3.clearTable(t2.Storage.Loot)
    t2.Fl.lootCacheMap = p31
    local function u232(p32)
        local v789 = nil
        if p32:IsA("Model") or p32:IsA("Folder") then
            v789 = p32:IsA("Model") and p32.PrimaryPart or p32:FindFirstChildWhichIsA("BasePart", true)
        elseif p32:IsA("BasePart") then
            if p32.Parent and ((p32.Parent:IsA("Model") or p32.Parent:IsA("Folder")) and p32.Parent ~= p31) and (not p32:GetAttribute("Value") and (not p32:GetAttribute("Amount") and (not p32:FindFirstChildWhichIsA("ProximityPrompt", true) and not p32:FindFirstChildWhichIsA("ClickDetector", true)))) then
                return
            end
            v789 = p32
        end
        if v789 and not t2.collectedLoot[v789] then
            local v790 = t3.getLootValue(p32)
            if v790 and v790 ~= 20 then
                if t2.Storage.Loot[v789] and t2.Storage.Loot[v789].bgui then
                    t3.safeDestroy(t2.Storage.Loot[v789].bgui)
                end
                t2.Storage.Loot[v789] = {
                    target = v789,
                    src = p32,
                    value = v790,
                }
                if t2.Settings.LootESP and v790 >= t2.MIN_LOOT_VALUE then
                    t2.Storage.Loot[v789].bgui = t3.createLootBillboard(v789, v790)
                end
            end
        end
    end
    local descendants = p31:GetDescendants()
    local n4 = 0
    for i7 = 1, #descendants do
        local v236 = descendants[i7]
        if v236:IsA("Model") or v236:IsA("BasePart") or v236:IsA("Folder") then
            u232(v236)
            n4 += 1
            if n4 % 50 == 0 then
                task.wait()
            end
        end
    end
    t2.Cn.lootAdded = p31.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("Model") or (descendant:IsA("BasePart") or descendant:IsA("Folder")) then
            task.wait(0.1)
            if descendant and descendant.Parent then
                u232(descendant)
            end
        end
    end)
    t2.Cn.lootRemoved = p31.DescendantRemoving:Connect(function(descendant)
        if descendant:IsA("Model") or (descendant:IsA("BasePart") or descendant:IsA("Folder")) then
            if descendant:IsA("Model") or descendant:IsA("Folder") then
                descendant = descendant:IsA("Model") and descendant.PrimaryPart or descendant:FindFirstChildWhichIsA("BasePart", true)
            end
            if descendant and t2.Storage.Loot[descendant] then
                if t2.Storage.Loot[descendant].bgui then
                    t3.safeDestroy(t2.Storage.Loot[descendant].bgui)
                end
                t2.Storage.Loot[descendant] = nil
            end
        end
    end)
end
t3.updateLootESP = function()
    if not t2.Settings.LootESP or t3.getMyTeamType() == "lobby" then
        for k, v in pairs(t2.Storage.Loot) do
            local v239 = v
            if v239.bgui then
                t3.safeDestroy(v239.bgui)
                v239.bgui = nil
            end
            t2.Storage.Loot[k] = nil
        end
        return
    end
    local v240 = t3.getMap()
    local u241 = t3.findFolder(v240, "LootSpawns") or t3.findFolder(workspace, "LootSpawns")
    if not u241 then
        return
    end
    if t2.Fl.lootCacheMap ~= u241 then
        t2.Fl.lootCacheMap = nil
        t3.clearTable(t2.Storage.Loot)
        task.spawn(function()
            t3.buildLootCache(u241)
        end)
        return
    end
    for k, v in pairs(t2.Storage.Loot) do
        local v244 = v
        if not v244.target or not v244.target.Parent then
            if v244.bgui then
                t3.safeDestroy(v244.bgui)
                v244.bgui = nil
            end
            t2.Storage.Loot[k] = nil
        elseif v244.value >= t2.MIN_LOOT_VALUE then
            if not v244.bgui then
                v244.bgui = t3.createLootBillboard(v244.target, v244.value)
            else
                local v245 = v244.target.Transparency < 0.9
                if v245 ~= v244.bgui.Enabled then
                    v244.bgui.Enabled = v245
                end
            end
        elseif v244.bgui then
            t3.safeDestroy(v244.bgui)
            v244.bgui = nil
            if v244.target and v244.target.Parent then
                for _, child in ipairs(v244.target:GetChildren()) do
                    if child:IsA("BillboardGui") and child.Name == "JxH_LootESP" then
                        t3.safeDestroy(child)
                    end
                end
            end
        end
    end
end
t3.tryTriggerLoot = function(p33)
    if not p33 then
        return
    end
    local ok, result = pcall(function()
        return p33:GetDescendants()
    end)
    if not ok or not result then
        return
    end
    for _, v in ipairs(result) do
        if v:IsA("ProximityPrompt") and v.Enabled then
            pcall(function()
                local RequiresLineOfSight = v.RequiresLineOfSight
                local MaxActivationDistance = v.MaxActivationDistance
                v.RequiresLineOfSight = false
                v.MaxActivationDistance = 8999999488
                fireproximityprompt(v)
                task.delay(0.5, function()
                    if v and v.Parent then
                        v.RequiresLineOfSight = RequiresLineOfSight
                        v.MaxActivationDistance = MaxActivationDistance
                    end
                end)
            end)
        elseif v:IsA("ClickDetector") then
            pcall(function()
                fireclickdetector(v, 0)
            end)
        end
    end
end
t3.startAutoHS = function()
    if t2.Fl.autoHSRunning then
        return
    end
    t2.Fl.autoHSRunning = true
    t2.Settings.AutoHS = true
    local Players = t1.Players
    local PathfindingService = game:GetService("PathfindingService")
    local _workspace = workspace
    local RunService = t1.RunService
    local LocalPlayer = t1.LocalPlayer
    local t11 = {
        [1] = new(52.5388, 264.6762, 10.4454),
        [2] = new(-37.3878, 260.8593, -5.1795),
        [3] = new(-25.2802, 260.8593, -20.4532),
        [4] = new(-18.4071, 260.8593, -20.2298),
        [5] = new(-18.1125, 261.1531, -2.111),
        [6] = new(-12.97, 260.8593, 15.2693),
        [7] = new(-11.756, 269.0895, -4.7729),
        [8] = new(7.0312, 260.8593, 7.0861),
        [9] = new(13.1345, 260.8593, -12.2344),
    }
    local v260 = t11
    v1761(v260, 10, new(37.4509, 260.8593, -0.8731))
    local t12 = {
        AgentRadius = 2.5,
        AgentHeight = 5,
        AgentCanJump = true,
        AgentCanClimb = true,
        WaypointSpacing = 2.5,
    }
    local t13 = {}
    local u263 = new()
    local timestamp = tick()
    local t14 = {}
    local n5 = 1
    local u267 = nil
    local s10 = ""
    local n6 = 0
    local n7 = 0
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    local overlapParams = OverlapParams.new()
    overlapParams.FilterType = Enum.RaycastFilterType.Exclude
    _workspace.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("Model") and descendant.Name == "Trap" then
            pcall(descendant.Destroy, descendant)
        end
    end)
    local function u273()
        pcall(function()
            local v1467 = _workspace:FindFirstChild("Space Lab")
            if v1467 then
                local RatTraps = v1467:FindFirstChild("RatTraps")
                if RatTraps then
                    for _, child in ipairs(RatTraps:GetChildren()) do
                        child:Destroy()
                    end
                end
            end
        end)
    end
    local function u274(p34)
        if not p34 then
            return false
        end
        local Humanoid = p34:FindFirstChildOfClass("Humanoid")
        if not Humanoid or Humanoid.Health <= 0 then
            return true
        end
        local HumanoidRootPart = p34:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return false
        end
        local BleedOutHealth = HumanoidRootPart:FindFirstChild("BleedOutHealth")
        if BleedOutHealth and BleedOutHealth.Enabled then
            return true
        end
        local Downed = p34:FindFirstChild("Downed")
        if Downed and (Downed:IsA("BoolValue") and Downed.Value or Downed:IsA("IntValue") and Downed.Value > 0) then
            return true
        end
        local Incapacitated = p34:FindFirstChild("Incapacitated")
        if Incapacitated and (Incapacitated:IsA("BoolValue") and Incapacitated.Value or Incapacitated:IsA("IntValue") and Incapacitated.Value > 0) then
            return true
        end
        local State = Humanoid:GetState()
        if (State == Enum.HumanoidStateType.FallingDown or State == Enum.HumanoidStateType.Ragdoll) and Humanoid.WalkSpeed < 5 then
            return true
        end
        return false
    end
    local function u275(p35)
        local Team = p35.Team
        if not Team then
            return "lobby"
        end
        local v805 = Team.Name:lower()
        if v805:find("killer") then
            return "killer"
        end
        if v805:find("survivor") or v805:find("innocent") or v805:find("hider") then
            return "survivor"
        end
        return "lobby"
    end
    local function u276()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and u275(player) == "killer" and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                return player.Character
            end
        end
        return nil
    end
    local function u277(p36)
        local huge = math.huge
        local Character = nil
        local v811 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not v811 then
            return nil
        end
        for _, player in ipairs(Players:GetPlayers()) do
            local v814 = player
            if v814 ~= LocalPlayer and u275(v814) == "survivor" and v814.Character then
                local HumanoidRootPart = v814.Character:FindFirstChild("HumanoidRootPart")
                if HumanoidRootPart then
                    local v816 = u274(v814.Character)
                    if p36 and v816 or not p36 and not v816 then
                        local Magnitude = (v811.Position - HumanoidRootPart.Position).Magnitude
                        if Magnitude < huge then
                            huge = Magnitude
                            Character = v814.Character
                        end
                    end
                end
            end
        end
        return Character
    end
    local function u278()
        local t15 = {
            ["happy neighborhood"] = true,
            ["willow marsh"] = true,
            ["water treatment facility"] = true,
            ["papa roni's pizzeria"] = true,
            ["night school"] = true,
            ["fair grounds"] = true,
            ["haunted mansion"] = true,
            ["scary gary's academy"] = true,
            ["deadman's point"] = true,
            ["space lab"] = true,
            ["darkwood asylum"] = true,
            ["skate zone"] = true,
            ["cabin fever"] = true,
            ["the shipwreck"] = true,
            ["desert ruins"] = true,
            ["area 51"] = true,
            ["the sewers"] = true,
            ["construction site"] = true,
            ["the suburbs"] = true,
            ["creepy carnival"] = true,
            ["winter wonderland"] = true,
            ["gingerbread village"] = true,
            ["pumpkin patch"] = true,
            ["santa's workshop"] = true,
            ["haunted forest"] = true,
        }
        for _, child in ipairs(_workspace:GetChildren()) do
            if (child:IsA("Model") or child:IsA("Folder")) and child ~= LocalPlayer.Character and t15[child.Name:lower()] then
                return child
            end
        end
        return nil
    end
    local function u279(p37, p38)
        local v823 = u278()
        if not v823 then
            return nil
        end
        local Exits = v823:FindFirstChild("Exits", true)
        if not Exits then
            return nil
        end
        local v825 = -math.huge
        local v826 = nil
        local timestamp2 = tick()
        for _, child in ipairs(Exits:GetChildren()) do
            local v830 = child
            local v831 = false
            for _, descendant in ipairs(v830:GetDescendants()) do
                if descendant:IsA("TouchTransmitter") and descendant.Parent and descendant.Parent.Name == "Trigger" then
                    v831 = true
                    break
                end
            end
            if v831 then
                local Bouncer = v830:FindFirstChild("Bouncer", true)
                if not Bouncer or not Bouncer:IsA("BasePart") or not Bouncer.CanCollide then
                    local v835 = v830:FindFirstChild("Trigger", true) or v830.PrimaryPart
                    if v835 and (not t13[v835] or not (timestamp2 - t13[v835] < 15)) then
                        local Magnitude = (p37 - v835.Position).Magnitude
                        local v837 = p38 and (p38 - v835.Position).Magnitude or math.huge
                        if v837 > 45 then
                            local v838 = v837 - Magnitude
                            if v825 < v838 then
                                v825 = v838
                                v826 = v835
                            end
                        end
                    end
                end
            end
        end
        return v826
    end
    local function u280()
        local v839 = u278()
        if not v839 then
            return nil
        end
        local v840 = v839:FindFirstChild("LootSpawns", true) or _workspace:FindFirstChild("LootSpawns", true)
        if not v840 then
            return nil
        end
        local huge = math.huge
        local v842 = nil
        local v843 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not v843 then
            return nil
        end
        local timestamp3 = tick()
        for _, descendant in ipairs(v840:GetDescendants()) do
            local v847 = descendant
            if v847:IsA("BasePart") and v847.Transparency < 0.9 and (not t13[v847] or not (timestamp3 - t13[v847] < 15)) then
                local Magnitude = (v843.Position - v847.Position).Magnitude
                if Magnitude < huge then
                    huge = Magnitude
                    v842 = v847
                end
            end
        end
        return v842
    end
    local function u281(p39)
        local u851 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if u851 and p39 then
            pcall(function()
                firetouchinterest(u851, p39, 0)
                task.wait()
                firetouchinterest(u851, p39, 1)
            end)
        end
    end
    local function u282(p40, _, p42)
        local Character = LocalPlayer.Character
        local v856 = Character and Character:FindFirstChildOfClass("Humanoid")
        local u857 = Character and Character:FindFirstChild("HumanoidRootPart")
        if not v856 or (not u857 or v856.Health <= 0) then
            return
        end
        overlapParams.FilterDescendantsInstances = {
            [1] = Character,
        }
        local PartBoundsInRadius = _workspace:GetPartBoundsInRadius(u857.Position, 10, overlapParams)
        for _, v in ipairs(PartBoundsInRadius) do
            if v.Name:lower():find("door") or v:FindFirstChildWhichIsA("TouchTransmitter") then
                u281(v)
            end
        end
        local u861 = typeof(p40) == "Instance" and p40.Position or p40
        local v862 = u267 and (typeof(u267) == "Vector3" and (u267 - u861).Magnitude) or 100
        if p40 ~= u267 or p42 or v862 > 5 then
            local u863 = PathfindingService:CreatePath(t12)
            local ok, _ = pcall(function()
                u863:ComputeAsync(u857.Position, u861)
            end)
            if not ok or u863.Status ~= Enum.PathStatus.Success then
                if typeof(p40) == "Instance" then
                    t13[p40] = tick()
                end
                v856:MoveTo(u861)
                t14 = {}
                return
            end
            t14 = u863:GetWaypoints()
            n5 = 2
            u267 = p40
        end
        if tick() - timestamp > 1.5 then
            if (new(u857.Position.X, 0, u857.Position.Z) - new(u263.X, 0, u263.Z)).Magnitude < 1.5 then
                v856.Jump = true
                v856:Move(new(math.random(-1, 1), 0, math.random(-1, 1)))
                if typeof(p40) == "Instance" then
                    t13[p40] = tick()
                end
                t14 = {}
                u267 = nil
            end
            u263 = u857.Position
            timestamp = tick()
        end
        if #t14 > 0 and n5 <= #t14 then
            local v866 = t14[n5]
            if (new(u857.Position.X, 0, u857.Position.Z) - new(v866.Position.X, 0, v866.Position.Z)).Magnitude < 4.5 then
                n5 += 1
            end
            if t14[n5] then
                if t14[n5].Action == Enum.PathWaypointAction.Jump then
                    v856.Jump = true
                end
                v856:MoveTo(t14[n5].Position)
            else
                v856:MoveTo(u861)
            end
        else
            v856:MoveTo(u861)
        end
    end
    local function u283(p43, p44)
        local p43Position = p43.Position
        local p44Position = p44.Position
        local Unit = (p43Position - p44Position).Unit
        local Unit2 = new(Unit.X, 0, Unit.Z).Unit
        local v873 = -math.huge
        local v874 = p43Position
        raycastParams.FilterDescendantsInstances = {
            [1] = LocalPlayer.Character,
            [2] = p44.Parent,
        }
        for i8 = -90, 90, 15 do
            local v876 = math.rad(i8)
            local v877 = CFrame.Angles(0, v876, 0) * Unit2
            local v878 = p43Position + v877 * 70
            local raycastResult = _workspace:Raycast(p43Position, v877 * 70, raycastParams)
            local v880 = raycastResult and raycastResult.Position or v878
            if raycastResult then
                v880 -= v877 * 4
            end
            local Magnitude = (v880 - p44Position).Magnitude
            if _workspace:Raycast(v880, p44Position - v880, raycastParams) then
                Magnitude += 600
            end
            if v873 < Magnitude then
                v873 = Magnitude
                v874 = v880
            end
        end
        u282(v874, nil, true)
    end
    local function u284(p45, p46)
        raycastParams.FilterDescendantsInstances = {
            [1] = LocalPlayer.Character,
            [2] = p46.Parent,
        }
        return _workspace:Raycast(p45.Position, p46.Position - p45.Position, raycastParams) == nil
    end
    local function u285()
        local Character = LocalPlayer.Character
        if not Character then
            return
        end
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            for _, descendant in ipairs(Character:GetDescendants()) do
                if descendant:IsA("Tool") then
                    Humanoid:EquipTool(descendant)
                end
            end
            local Tool = Character:FindFirstChildOfClass("Tool")
            if Tool then
                Tool:Activate()
            end
        end
    end
    t2.Cn.autoHS = RunService.Heartbeat:Connect(function()
        local timestamp4 = tick()
        if timestamp4 - n6 < 0.05 then
            return
        end
        n6 = timestamp4
        u273()
        for k, v in pairs(t13) do
            if timestamp4 - v > 15 then
                t13[k] = nil
            end
        end
        local v892 = u275(LocalPlayer)
        if v892 ~= s10 then
            s10 = v892
            u267 = nil
            t14 = {}
            t13 = {}
        end
        local Character = LocalPlayer.Character
        local v894 = Character and Character:FindFirstChildOfClass("Humanoid")
        local v895 = Character and Character:FindFirstChild("HumanoidRootPart")
        if not Character or not v894 or not v895 or v894.Health <= 0 then
            return
        end
        if v892 == "lobby" then
            if not u267 or typeof(u267) == "Instance" then
                u267 = t11[math.random(1, #t11)]
            end
            if (new(v895.Position.X, 0, v895.Position.Z) - new(u267.X, 0, u267.Z)).Magnitude > 3 then
                u282(u267, nil, false)
            else
                v894:MoveTo(v895.Position)
                t14 = {}
                if timestamp4 - n7 >= 20 then
                    v894.Jump = true
                    n7 = timestamp4
                end
            end
            return
        end
        if v892 == "killer" then
            local v896 = u277(false)
            if v896 and v896:FindFirstChild("HumanoidRootPart") then
                u282(v896.HumanoidRootPart.Position, v896.HumanoidRootPart, false)
                if (v895.Position - v896.HumanoidRootPart.Position).Magnitude < 15 then
                    u285()
                end
            else
                if not u267 or typeof(u267) == "Instance" or (v895.Position - u267).Magnitude < 5 then
                    u267 = v895.Position + new(math.random(-50, 50), 0, math.random(-50, 50))
                end
                u282(u267, nil, false)
            end
            return
        end
        if v892 == "survivor" then
            local v897 = u276()
            local v898 = v897 and v897:FindFirstChild("HumanoidRootPart")
            local v899 = v898 and (v895.Position - v898.Position).Magnitude or math.huge
            local v900 = false
            if v898 and v899 < 130 then
                v900 = u284(v895, v898)
            end
            if v899 < 60 or v899 < 110 and v900 then
                if s10 ~= "FLEE" then
                    s10 = "FLEE"
                    n7 = 0
                end
                if timestamp4 - n7 > 0.8 then
                    u283(v895, v898)
                    n7 = timestamp4
                end
                return
            end
            if u274(Character) then
                s10 = "CRAWL"
                local v901 = u277(true)
                if v901 and v901:FindFirstChild("HumanoidRootPart") then
                    u282(v901.HumanoidRootPart.Position, v901.HumanoidRootPart, true)
                end
                return
            end
            local v902 = u279(v895.Position, v898 and v898.Position or nil)
            if v902 then
                s10 = "EXIT"
                u282(v902.Position, v902, false)
                if (v895.Position - v902.Position).Magnitude < 8 then
                    t13[v902] = tick()
                end
                return
            end
            local v903 = u280()
            if v903 then
                s10 = "LOOT"
                u282(v903.Position, v903, false)
                if (v895.Position - v903.Position).Magnitude < 7 then
                    u281(v903)
                    t13[v903] = tick()
                end
                return
            end
            s10 = "WANDER"
            if not u267 or typeof(u267) == "Instance" or (v895.Position - u267).Magnitude < 5 then
                u267 = v895.Position + new(math.random(-45, 45), 0, math.random(-45, 45))
            end
            u282(u267, nil, false)
        end
    end)
end
t3.stopAutoHS = function()
    if not t2.Fl.autoHSRunning then
        return
    end
    t2.Fl.autoHSRunning = false
    t2.Settings.AutoHS = false
    if t2.Cn.autoHS then
        t2.Cn.autoHS:Disconnect()
        t2.Cn.autoHS = nil
    end
end
t3.startAutoFarm = function()
    if t3.getMyTeamType() ~= "survivor" then
        return
    end
    if t2.Fl.farmStoppedForRound then
        return
    end
    t2.Fl.autoFarmRunning = false
    t2.farmLoopId = t2.farmLoopId + 1
    local farmLoopId = t2.farmLoopId
    task.wait(0.1)
    if farmLoopId ~= t2.farmLoopId then
        return
    end
    t2.Fl.autoFarmRunning = true
    t2.Fl.lastFarmPos = nil
    t2.Fl.lastFarmPosTime = tick()
    task.spawn(function()
        while t2.Fl.autoFarmRunning and t2.Settings.AutoFarmLoot and t2.farmLoopId == farmLoopId and t3.getMyTeamType() == "survivor" and not t2.Fl.farmStoppedForRound do
            if t2.Fl.farmPaused or t2.Fl.killerSafetyActive then
                task.wait(0.5)
            else
                local Character = t1.LocalPlayer.Character
                local v905 = Character and Character:FindFirstChild("HumanoidRootPart")
                local u906 = Character and Character:FindFirstChildOfClass("Humanoid")
                if not v905 or not u906 or u906.Health <= 0 then
                    task.wait(0.5)
                else
                    if u906.Sit then
                        pcall(function()
                            u906.Sit = false
                        end)
                    end
                    local Position = v905.Position
                    if Position.Y < -80 then
                        t3.ultraFastTeleport(new(Position.X, 20, Position.Z))
                        task.wait(0.3)
                    else
                        local timestamp = tick()
                        if t2.Fl.lastFarmPos and t2.Settings.AntiAFK then
                            local Magnitude = (Position - t2.Fl.lastFarmPos).Magnitude
                            if Magnitude < 0.5 and timestamp - t2.Fl.lastFarmPosTime > 5 then
                                pcall(function()
                                    u906.Jump = true
                                end)
                                t2.Fl.lastFarmPosTime = timestamp
                            elseif Magnitude > 0.5 then
                                t2.Fl.lastFarmPos = Position
                                t2.Fl.lastFarmPosTime = timestamp
                            end
                        else
                            t2.Fl.lastFarmPos = Position
                        end
                        local v910 = t3.getMap()
                        local v911 = t3.findFolder(v910, "LootSpawns")
                        if not v911 then
                            v911 = t3.findFolder(workspace, "LootSpawns")
                        end
                        local u912 = v911
                        if not u912 then
                            task.wait(0.8)
                        elseif t2.Fl.lootCacheMap ~= u912 then
                            t2.Fl.lootCacheMap = nil
                            t3.clearTable(t2.Storage.Loot)
                            task.spawn(function()
                                t3.buildLootCache(u912)
                            end)
                            task.wait(0.5)
                        end
                        if not next(t2.Storage.Loot) then
                            task.wait(0.5)
                        end
                        local v913 = -1
                        local v914 = nil
                        local target = nil
                        for _, v in pairs(t2.Storage.Loot) do
                            if not t2.collectedLoot[v.target] and v.target.Parent and v.target.Transparency < 0.9 and v.value >= t2.MIN_LOOT_VALUE and v913 < v.value then
                                v913 = v.value
                                target = v.target
                                v914 = v
                            end
                        end
                        if not v914 then
                            t2.Fl.lootCacheMap = nil
                            task.wait(1.2)
                        else
                            local v918 = target:IsA("BasePart") and target.Size.Y / 2 or 1
                            t3.ultraFastTeleport(new(target.Position.X, target.Position.Y + v918 + 2.5, target.Position.Z))
                            if t2.farmSpeedPct >= 180 then
                                if target.Parent then
                                    t3.tryTriggerLoot(v914.src)
                                    t2.collectedLoot[target] = true
                                    t2.Analytics.farmSuccess = t2.Analytics.farmSuccess + 1
                                    t2.Analytics.coinsCollected = t2.Analytics.coinsCollected + (v914.value or 0)
                                    if v914.bgui then
                                        t3.safeDestroy(v914.bgui)
                                    end
                                    t2.Storage.Loot[target] = nil
                                end
                                task.wait(0.25)
                            else
                                task.wait(0.05)
                                if not t2.Fl.farmPaused and not t2.Fl.farmStoppedForRound and not t2.Fl.killerSafetyActive then
                                    if target.Parent then
                                        t3.tryTriggerLoot(v914.src)
                                        task.wait(t2.farmCollectDelay)
                                        t2.collectedLoot[target] = true
                                        t2.Analytics.farmSuccess = t2.Analytics.farmSuccess + 1
                                        t2.Analytics.coinsCollected = t2.Analytics.coinsCollected + (v914.value or 0)
                                        if v914.bgui then
                                            t3.safeDestroy(v914.bgui)
                                        end
                                        t2.Storage.Loot[target] = nil
                                    else
                                        t2.collectedLoot[target] = true
                                        t2.Analytics.farmFail = t2.Analytics.farmFail + 1
                                        if v914.bgui then
                                            t3.safeDestroy(v914.bgui)
                                        end
                                        t2.Storage.Loot[target] = nil
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        if t2.farmLoopId == farmLoopId then
            t2.Fl.autoFarmRunning = false
        end
    end)
end
t3.updateExitESP = function()
    if t3.getMyTeamType() == "lobby" then
        for _, v in pairs(t2.Storage.Exits) do
            t3.safeDestroy(v)
        end
        t3.clearTable(t2.Storage.Exits)
        return
    end
    if #t2.Storage.Exits > 0 then
        for _, v in ipairs(t2.Storage.Exits) do
            if v and v.Parent then
                v.Enabled = t2.Settings.ExitESP
            end
        end
        return
    end
    if not t2.Settings.ExitESP then
        return
    end
    task.spawn(function()
        local v919 = t3.getMap()
        if not v919 then
            return
        end
        local t16 = {}
        local v921 = t3.findFolder(v919, "Exits")
        if v921 then
            for _, descendant in ipairs(v921:GetDescendants()) do
                if descendant:IsA("BasePart") or descendant:IsA("Model") then
                    table.insert(t16, descendant)
                end
            end
        end
        local n8 = 0
        for _, descendant in ipairs(v919:GetDescendants()) do
            local v927 = descendant
            n8 += 1
            if n8 % 150 == 0 then
                task.wait()
            end
            if not t2.Settings.ExitESP then
                break
            end
            local v928 = v927.Name:lower()
            if (v928:find("exit") or v928:find("gateway")) and (v927:IsA("BasePart") or v927:IsA("Model")) then
                table.insert(t16, v927)
            end
            if v927:IsA("ProximityPrompt") or v927:IsA("ClickDetector") then
                local Parent = v927.Parent
                if Parent and (Parent:IsA("BasePart") or Parent:IsA("Model")) then
                    table.insert(t16, Parent)
                end
            end
        end
        local t17 = {}
        for _, v in ipairs(t16) do
            local v933 = v
            if not t17[v933] then
                t17[v933] = true
                local v934 = new3("Highlight")
                v934.Adornee = v933
                v934.FillTransparency = 1
                v934.OutlineColor = fromRGB(0, 255, 120)
                v934.OutlineTransparency = 0
                v934.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                v934.Parent = v933
                v934.Enabled = t2.Settings.ExitESP
                table.insert(t2.Storage.Exits, v934)
            end
        end
    end)
end
t3.stopInfiniteJump = function()
    t2.Settings.InfiniteJump = false
    if t2.Cn.infiniteJump then
        t2.Cn.infiniteJump:Disconnect()
        t2.Cn.infiniteJump = nil
    end
end
t3.startInfiniteJump = function()
    t3.stopInfiniteJump()
    t2.Settings.InfiniteJump = true
    t2.Cn.infiniteJump = t1.UserInputService.JumpRequest:Connect(function()
        if not t2.Settings.InfiniteJump then
            t3.stopInfiniteJump()
            return
        end
        local Character = t1.LocalPlayer.Character
        local u936 = Character and Character:FindFirstChildOfClass("Humanoid")
        if u936 and u936.Health > 0 then
            pcall(function()
                u936:ChangeState(Enum.HumanoidStateType.Jumping)
            end)
        end
    end)
end
t3.startJumpBoost = function()
    t2.Settings.JumpBoost = true
    if t2.Cn.jumpBoost then
        t2.Cn.jumpBoost:Disconnect()
    end
    t2.Cn.jumpBoost = t1.RunService.Heartbeat:Connect(function()
        if not t2.Settings.JumpBoost then
            return
        end
        local Character = t1.LocalPlayer.Character
        local v938 = Character and Character:FindFirstChildOfClass("Humanoid")
        if v938 and v938.Health > 0 then
            if not v938.UseJumpPower then
                v938.UseJumpPower = true
            end
            if v938.JumpPower ~= t2.Fl.jumpPower then
                v938.JumpPower = t2.Fl.jumpPower
            end
        end
    end)
end
t3.stopJumpBoost = function()
    t2.Settings.JumpBoost = false
    if t2.Cn.jumpBoost then
        t2.Cn.jumpBoost:Disconnect()
        t2.Cn.jumpBoost = nil
    end
    local Character = t1.LocalPlayer.Character
    local v292 = Character and Character:FindFirstChildOfClass("Humanoid")
    if v292 then
        v292.UseJumpPower = false
        v292.JumpPower = 50
    end
end
local u42 = nil
local function u43()
    if u42 then
        pcall(function()
            u42:Disconnect()
        end)
        u42 = nil
    end
end
local function u44()
    if u42 then
        return
    end
    local n9 = 0
    u42 = t1.RunService.Heartbeat:Connect(function(dt)
        if not t2.Settings.AntiVoid then
            return
        end
        if t3.getMyTeamType() == "lobby" then
            return
        end
        n9 += dt
        if n9 < 0.2 then
            return
        end
        n9 = 0
        local Character = t1.LocalPlayer.Character
        local u941 = Character and Character:FindFirstChild("HumanoidRootPart")
        if not u941 then
            return
        end
        if u941.Position.Y < -25 or u941.Velocity.Y < -250 then
            local v942 = t3.getLockerModels()
            if #v942 > 0 then
                local u943 = v942[math.random(1, #v942)]
                task.spawn(function()
                    t3.teleportInsideLocker(u943)
                end)
            else
                task.spawn(function()
                    t3.ultraFastTeleport(new(u941.Position.X, 35, u941.Position.Z))
                end)
            end
        end
    end)
end
t3.setupDoubleJump = function()
    local v294 = t1.LocalPlayer.Character or t1.LocalPlayer.CharacterAdded:Wait()
    if not v294 then
        return
    end
    local Humanoid = v294:WaitForChild("Humanoid", 3)
    if not Humanoid then
        return
    end
    local Animator = Humanoid:WaitForChild("Animator", 3)
    if not Animator then
        return
    end
    local v297 = new3("Animation")
    v297.AnimationId = t2.DOUBLE_JUMP_ANIM_ID
    t2.jumpAnimTrack = Animator:LoadAnimation(v297)
    t2.jumpAnimTrack.Priority = Enum.AnimationPriority.Action
    if t2.Connections.Jump then
        t2.Connections.Jump:Disconnect()
    end
    if t2.Connections.State then
        t2.Connections.State:Disconnect()
    end
    t2.Connections.Jump = t1.UserInputService.JumpRequest:Connect(function()
        if not t2.Settings.DoubleJump or not t2.canJump2 or t2.jumpCount >= 2 then
            return
        end
        if t3.isPlayerDowned(t1.LocalPlayer) then
            return
        end
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        t2.jumpCount = t2.jumpCount + 1
        if t2.jumpAnimTrack then
            t2.jumpAnimTrack:Stop()
            t2.jumpAnimTrack:Play()
        end
    end)
    t2.Connections.State = Humanoid.StateChanged:Connect(function(_, newState)
        if newState == Enum.HumanoidStateType.Landed then
            local v946 = t2
            t2.canJump2 = false
            v946.jumpCount = 0
        elseif newState == Enum.HumanoidStateType.Freefall then
            task.wait(0.15)
            t2.canJump2 = true
        elseif newState == Enum.HumanoidStateType.Jumping then
            t2.jumpCount = t2.jumpCount == 0 and 1 or t2.jumpCount
        end
    end)
end
t3.getExitParts = function()
    local v298 = t3.getMap()
    if not v298 then
        return {}
    end
    local t18 = {}
    local t19 = {}
    local function v301(p48)
        if p48 and (p48:IsA("BasePart") and not t19[p48]) then
            t19[p48] = true
            table.insert(t18, p48)
        end
    end
    local v302 = t3.findFolder(v298, "Exits")
    if v302 then
        for _, descendant in ipairs(v302:GetDescendants()) do
            local v305 = descendant
            if v305:IsA("Model") then
                local v306 = v305:FindFirstChild("Trigger") or v305.PrimaryPart
                if v306 and v306:IsA("BasePart") then
                    v301(v306)
                end
            elseif v305:IsA("BasePart") then
                v301(v305)
            end
        end
    end
    for _, descendant in ipairs(v298:GetDescendants()) do
        local v309 = descendant
        local v310 = v309.Name:lower()
        if v310:find("exit") or v310:find("gateway") then
            if v309:IsA("BasePart") then
                v301(v309)
            elseif v309:IsA("Model") then
                local v311 = v309:FindFirstChild("Trigger") or v309.PrimaryPart
                if v311 then
                    v301(v311)
                end
            end
        end
    end
    return t18
end
t3.getReadyExit = function()
    local v312 = t3.getMap()
    if not v312 then
        return nil
    end
    local v313 = t3.findFolder(v312, "Exits")
    if v313 then
        local v314, v315, v316 = ipairs(v313:GetChildren())
        for _, v318 in v314, v315, v316 do
            local v319 = v318
            local v320 = false
            for _, descendant in ipairs(v319:GetDescendants()) do
                if descendant:IsA("TouchTransmitter") and descendant.Parent and descendant.Parent.Name == "Trigger" then
                    v320 = true
                    break
                end
            end
            if not not v320 then
                local Bouncer = v319:FindFirstChild("Bouncer", true)
                if not (not Bouncer or (not Bouncer:IsA("BasePart") or not Bouncer.CanCollide)) then
                    continue
                end
                return v319
            end
        end
    end
    return nil
end
t3.resolveGatePart = function(p49)
    if p49:IsA("BasePart") then
        return p49
    end
    if p49:IsA("Model") then
        for _, v in ipairs({
            [1] = "Getawaygate",
            [2] = "GetawayGate",
            [3] = "getawaygate",
            [4] = "Gate",
            [5] = "Exit",
            [6] = "Door",
            [7] = "Escape",
        }) do
            local v3 = p49:FindFirstChild(v, true)
            if v3 and v3:IsA("BasePart") then
                return v3
            end
        end
        local n10 = 0
        local v329 = nil
        for _, descendant in ipairs(p49:GetDescendants()) do
            local v332 = descendant
            if v332:IsA("BasePart") and v332.Name ~= "Bouncer" then
                local v333 = v332.Size.X * v332.Size.Y * v332.Size.Z
                if n10 < v333 then
                    v329 = v332
                    n10 = v333
                end
            end
        end
        return v329 or p49.PrimaryPart
    end
    return nil
end
t3.doEscapeNow = function()
    local Character = t1.LocalPlayer.Character
    local u335 = Character and Character:FindFirstChild("HumanoidRootPart")
    local v336 = Character and Character:FindFirstChildOfClass("Humanoid")
    if not u335 or not v336 or v336.Health <= 0 then
        return
    end
    local v337 = nil
    local v338 = t3.getReadyExit()
    if v338 then
        v337 = t3.resolveGatePart(v338)
    end
    if not v337 then
        local v339 = t3.getExitParts()
        if #v339 == 0 then
            return
        end
        v337 = v339[1]
        local huge = math.huge
        for _, v in ipairs(v339) do
            local v343 = v
            local Magnitude = (u335.Position - v343.Position).Magnitude
            if Magnitude < huge then
                huge = Magnitude
                v337 = v343
            end
        end
    end
    if not v337 or not v337.Parent then
        return
    end
    t3.ultraFastTeleport(v337.Position)
    task.wait(0.1)
    local v345 = t3.getMap()
    if v345 then
        for _, descendant in ipairs(v345:GetDescendants()) do
            local v348 = descendant.Name:lower()
            if v348:find("exit") or v348:find("gateway") or v348:find("escape") or v348:find("door") or v348:find("gate") then
                if descendant:IsA("ProximityPrompt") then
                    pcall(function()
                        fireproximityprompt(descendant)
                    end)
                elseif descendant:IsA("ClickDetector") then
                    pcall(function()
                        fireclickdetector(descendant)
                    end)
                elseif descendant:IsA("TouchTransmitter") then
                    pcall(function()
                        firetouchinterest(u335, descendant.Parent, 0)
                        task.wait()
                        firetouchinterest(u335, descendant.Parent, 1)
                    end)
                end
            end
        end
    end
    task.wait(0.1)
    t3.ultraFastTeleport((v337.CFrame * new2(0, 0, -3)).Position)
    task.wait(0.1)
    t3.ultraFastTeleport((v337.CFrame * new2(0, 0, 3)).Position)
    t2.Analytics.escapeCount = t2.Analytics.escapeCount + 1
end
t3.teleportToNearestExit = function()
    if t3.getMyTeamType() == "lobby" then
        return
    end
    local Character = t1.LocalPlayer.Character
    local v350 = Character and Character:FindFirstChild("HumanoidRootPart")
    if not v350 then
        return
    end
    local v351 = t3.getExitParts()
    if #v351 == 0 then
        return
    end
    local v352 = v351[1]
    local huge = math.huge
    for _, v in ipairs(v351) do
        local v356 = v
        local Magnitude = (v350.Position - v356.Position).Magnitude
        if Magnitude < huge then
            huge = Magnitude
            v352 = v356
        end
    end
    if not v352 or not v352.Parent then
        return
    end
    local v358 = v350.Position - v352.Position
    local v359 = v358.Magnitude > 2 and v358.Unit or -v352.CFrame.LookVector
    t3.ultraFastTeleport(v352.Position + v359 * 8 + new(0, 3.5, 0))
    t2.Analytics.escapeCount = t2.Analytics.escapeCount + 1
end
t3.stopAutoEscape = function()
    t2.Fl.autoEscapeRunning = false
    if t2.Cn.autoEscape then
        pcall(function()
            t2.Cn.autoEscape:Disconnect()
        end)
        t2.Cn.autoEscape = nil
    end
end
t3.startAutoEscape = function()
    if t3.getMyTeamType() ~= "survivor" then
        return
    end
    t2.Fl.autoEscapeRunning = false
    if t2.Cn.autoEscape then
        pcall(function()
            t2.Cn.autoEscape:Disconnect()
        end)
        t2.Cn.autoEscape = nil
    end
    t2.Fl.escapeCheckTimer = 0
    t2.Fl.escapeTriggeredExternal = false
    t2.Settings.AutoEscape = true
    t2.Fl.autoEscapeRunning = true
    local u360 = false
    local function u361()
        if u360 or not t2.Settings.AutoEscape then
            return
        end
        u360 = true
        t2.Fl.escapeTriggeredExternal = true
        t2.Fl.autoFarmRunning = false
        t2.Fl.farmStoppedForRound = true
        t2.Fl.autoEscapeRunning = false
        if t2.Cn.autoEscape then
            pcall(function()
                t2.Cn.autoEscape:Disconnect()
            end)
            t2.Cn.autoEscape = nil
        end
        task.spawn(function()
            t3.doEscapeNow()
        end)
    end
    t2.Cn.autoEscape = t1.RunService.Heartbeat:Connect(function(dt)
        if t3.getMyTeamType() ~= "survivor" then
            return
        end
        if not t2.Settings.AutoEscape or not t2.Fl.autoEscapeRunning or u360 then
            return
        end
        t2.Fl.escapeCheckTimer = t2.Fl.escapeCheckTimer + dt
        if t2.Fl.escapeCheckTimer < 0.25 then
            return
        end
        t2.Fl.escapeCheckTimer = 0
        local v949 = t3.getReadyExit()
        if v949 then
            local v950 = t3.resolveGatePart(v949)
            local Character = t1.LocalPlayer.Character
            local v952 = Character and Character:FindFirstChild("HumanoidRootPart")
            if v952 and v950 then
                if (v952.Position - v950.Position).Magnitude < 18 then
                    if not t2.Fl._escapeWaitStart then
                        t2.Fl._escapeWaitStart = os.clock()
                    end
                    if os.clock() - t2.Fl._escapeWaitStart < 2 then
                        return
                    end
                else
                    t2.Fl._escapeWaitStart = nil
                end
            end
            u361()
        else
            t2.Fl._escapeWaitStart = nil
        end
    end)
end
t3.stopFly = function()
    t2.Settings.FlyEnabled = false
    if t2.Cn.fly then
        t2.Cn.fly:Disconnect()
        t2.Cn.fly = nil
    end
    local Character = t1.LocalPlayer.Character
    local v363 = Character and Character:FindFirstChild("HumanoidRootPart")
    if v363 then
        local JxH_FlyAtt = v363:FindFirstChild("JxH_FlyAtt")
        local JxH_FlyLv = v363:FindFirstChild("JxH_FlyLv")
        local JxH_FlyAo = v363:FindFirstChild("JxH_FlyAo")
        if JxH_FlyAtt then
            pcall(function()
                JxH_FlyAtt:Destroy()
            end)
        end
        if JxH_FlyLv then
            pcall(function()
                JxH_FlyLv:Destroy()
            end)
        end
        if JxH_FlyAo then
            pcall(function()
                JxH_FlyAo:Destroy()
            end)
        end
    end
end
t3.startFly = function()
    if not t2.Settings.FlyEnabled then
        return
    end
    local Character = t1.LocalPlayer.Character
    local u368 = Character and Character:FindFirstChild("HumanoidRootPart")
    local u369 = Character and Character:FindFirstChildOfClass("Humanoid")
    if not u368 or not u369 then
        return
    end
    local JxH_FlyAtt = u368:FindFirstChild("JxH_FlyAtt")
    if not JxH_FlyAtt then
        JxH_FlyAtt = new3("Attachment")
        JxH_FlyAtt.Name = "JxH_FlyAtt"
        JxH_FlyAtt.Parent = u368
    end
    local JxH_FlyLv = u368:FindFirstChild("JxH_FlyLv")
    if not JxH_FlyLv then
        JxH_FlyLv = new3("LinearVelocity")
        JxH_FlyLv.Name = "JxH_FlyLv"
        JxH_FlyLv.MaxForce = math.huge
        JxH_FlyLv.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
        JxH_FlyLv.Attachment0 = JxH_FlyAtt
        JxH_FlyLv.Parent = u368
    end
    local JxH_FlyAo = u368:FindFirstChild("JxH_FlyAo")
    if not JxH_FlyAo then
        JxH_FlyAo = new3("AlignOrientation")
        JxH_FlyAo.Name = "JxH_FlyAo"
        JxH_FlyAo.MaxTorque = math.huge
        JxH_FlyAo.MaxAngularVelocity = math.huge
        JxH_FlyAo.Responsiveness = 200
        JxH_FlyAo.Mode = Enum.OrientationAlignmentMode.OneAttachment
        JxH_FlyAo.Attachment0 = JxH_FlyAtt
        JxH_FlyAo.Parent = u368
    end
    local CurrentCamera = workspace.CurrentCamera
    if t2.Cn.fly then
        t2.Cn.fly:Disconnect()
    end
    t2.Cn.fly = t1.RunService.RenderStepped:Connect(function()
        if not t2.Settings.FlyEnabled then
            t3.stopFly()
            return
        end
        if not u369 or not u368 then
            return
        end
        local MoveDirection = u369.MoveDirection
        local v954 = u20
        if MoveDirection.Magnitude > 0 then
            v954 = MoveDirection * t2.Fl.flySpeed
            local v955 = MoveDirection:Dot(new(CurrentCamera.CFrame.LookVector.X, 0, CurrentCamera.CFrame.LookVector.Z).Unit)
            if v955 > 0.5 then
                v954 += new(0, CurrentCamera.CFrame.LookVector.Y * t2.Fl.flySpeed, 0)
            elseif v955 < -0.5 then
                v954 -= new(0, CurrentCamera.CFrame.LookVector.Y * t2.Fl.flySpeed, 0)
            end
        end
        if t2.flyKeys.up then
            v954 += new(0, t2.Fl.flySpeed, 0)
        end
        if t2.flyKeys.down then
            v954 -= new(0, t2.Fl.flySpeed, 0)
        end
        JxH_FlyLv.VectorVelocity = v954
        JxH_FlyAo.CFrame = CurrentCamera.CFrame
    end)
end
t3.startNoclip = function()
    if t2.Cn.noclip then
        t2.Cn.noclip:Disconnect()
    end
    t2.Cn.noclip = t1.RunService.Stepped:Connect(function()
        if not t2.Settings.Noclip then
            return
        end
        local Character = t1.LocalPlayer.Character
        if Character then
            for _, descendant in ipairs(Character:GetDescendants()) do
                if descendant:IsA("BasePart") and descendant.CanCollide then
                    descendant.CanCollide = false
                end
            end
        end
    end)
end
t3.stopNoclip = function()
    t2.Settings.Noclip = false
    if t2.Cn.noclip then
        t2.Cn.noclip:Disconnect()
        t2.Cn.noclip = nil
    end
end
t3.toggleGhostMode = function(p50)
    if t2.Fl.ghostDebounce then
        return
    end
    t2.Fl.ghostDebounce = true
    task.delay(0.15, function()
        t2.Fl.ghostDebounce = false
    end)
    local LocalPlayer = t1.LocalPlayer
    if p50 then
        if t2.Fl.ghostActive then
            return
        end
        local Character = LocalPlayer.Character
        if not Character then
            return
        end
        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if not HumanoidRootPart or not Humanoid then
            return
        end
        pcall(function()
            Character.Archivable = true
            local clone = Character:Clone()
            Character.Archivable = false
            if not clone then
                return
            end
            t2.Fl.realChar = Character
            clone.Name = Character.Name .. "_Ghost"
            clone.Parent = workspace
            t2.Fl.fakeChar = clone
            local HumanoidRootPart2 = clone:FindFirstChild("HumanoidRootPart")
            if HumanoidRootPart2 then
                HumanoidRootPart2.CFrame = HumanoidRootPart.CFrame
            end
            for _, descendant in ipairs(clone:GetDescendants()) do
                local v963 = descendant
                if v963:IsA("BasePart") then
                    v963.Anchored = false
                    v963.Transparency = 0.5
                elseif v963:IsA("Decal") or v963:IsA("Texture") then
                    v963.Transparency = 0.5
                end
            end
            local Humanoid2 = clone:FindFirstChildOfClass("Humanoid")
            if Humanoid2 then
                workspace.CurrentCamera.CameraSubject = Humanoid2
                Humanoid2.Died:Connect(function()
                    pcall(function()
                        t3.toggleGhostMode(false)
                    end)
                end)
            end
            Humanoid.Died:Connect(function()
                pcall(function()
                    t3.toggleGhostMode(false)
                end)
            end)
            Humanoid.WalkSpeed = 0
            local v965 = new2(54.907, 265.321, -82.957, -0.731, "-0", 0.682, 0, 1, 0, -0.682, 0, -0.731)
            workspace:BulkMoveTo({
                [1] = HumanoidRootPart,
            }, {
                [1] = v965,
            })
            t2.Fl.ghostSavedStates = {}
            for _, descendant in ipairs(Character:GetDescendants()) do
                local v968 = descendant
                if v968:IsA("BasePart") then
                    t2.Fl.ghostSavedStates[v968] = {
                        CanCollide = v968.CanCollide,
                    }
                    v968.CanCollide = false
                elseif v968:IsA("ParticleEmitter") or v968:IsA("Trail") or v968:IsA("Beam") then
                    t2.Fl.ghostSavedStates[v968] = {
                        Enabled = v968.Enabled,
                    }
                    v968.Enabled = false
                end
            end
            task.wait(0.25)
            HumanoidRootPart.Anchored = true
            HumanoidRootPart.Velocity = u20
            HumanoidRootPart.RotVelocity = u20
            LocalPlayer.Character = clone
            if Humanoid2 then
                Humanoid2:ChangeState(Enum.HumanoidStateType.Running)
            end
            t2.Fl.ghostActive = true
        end)
    else
        if not t2.Fl.ghostActive then
            return
        end
        local fakeChar = t2.Fl.fakeChar
        local realChar = t2.Fl.realChar
        pcall(function()
            local HumanoidRootPartCFrame = nil
            if fakeChar then
                local HumanoidRootPart = fakeChar:FindFirstChild("HumanoidRootPart")
                if HumanoidRootPart then
                    HumanoidRootPartCFrame = HumanoidRootPart.CFrame
                end
            end
            if realChar then
                for k, v in pairs(t2.Fl.ghostSavedStates) do
                    local v973 = k
                    local v974 = v
                    if v973 and v973.Parent then
                        if v973:IsA("BasePart") and v974.CanCollide ~= nil then
                            v973.CanCollide = v974.CanCollide
                        elseif (v973:IsA("ParticleEmitter") or v973:IsA("Trail") or v973:IsA("Beam")) and v974.Enabled ~= nil then
                            v973.Enabled = v974.Enabled
                        end
                    end
                end
                t2.Fl.ghostSavedStates = {}
                local HumanoidRootPart = realChar:FindFirstChild("HumanoidRootPart")
                if HumanoidRootPart then
                    HumanoidRootPart.Anchored = false
                    if HumanoidRootPartCFrame then
                        workspace:BulkMoveTo({
                            [1] = HumanoidRootPart,
                        }, {
                            [1] = HumanoidRootPartCFrame,
                        })
                    end
                    HumanoidRootPart.Velocity = u20
                    HumanoidRootPart.RotVelocity = u20
                end
            end
            task.wait(0.05)
            if realChar then
                LocalPlayer.Character = realChar
                local Humanoid = realChar:FindFirstChildOfClass("Humanoid")
                if Humanoid then
                    workspace.CurrentCamera.CameraSubject = Humanoid
                    Humanoid.WalkSpeed = 16
                    Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
            end
            if fakeChar then
                fakeChar:Destroy()
            end
            t2.Fl.fakeChar = nil
            t2.Fl.realChar = nil
            t2.Fl.ghostActive = false
        end)
    end
end
t3.getLockerModels = function()
    local v381 = nil
    if #t2._lockerCache.models > 0 then
        local v382 = true
        for _, v in ipairs(t2._lockerCache.models) do
            if not v or not v.Parent then
                v382 = false
                break
            end
        end
        if v382 then
            return t2._lockerCache.models
        end
    end
    local t20 = {}
    local t21 = {}
    local v387 = t3.getMap()
    local v388 = nil
    for _, v in ipairs({
        [1] = "Lockers",
        [2] = "Locker",
        [3] = "lockers",
        [4] = "locker",
        [5] = "Wardrobes",
        [6] = "Wardrobe",
        [7] = "Cabinets",
        [8] = "Cabinet",
        [9] = "Hideouts",
        [10] = "Hideout",
        [11] = "Closets",
        [12] = "Closet",
    }) do
        local v391 = v387 and v387:FindFirstChild(v) or workspace:FindFirstChild(v)
        if v391 then
            v388 = v391
            break
        end
    end
    if v388 then
        for _, child in ipairs(v388:GetChildren()) do
            if child:IsA("Model") and not t21[child] then
                t21[child] = true
                table.insert(t20, child)
            end
        end
    end
    if #t20 == 0 then
        local v394 = v387 or workspace
        local n11 = 0
        for _, descendant in ipairs(v394:GetDescendants()) do
            local v398 = descendant
            n11 += 1
            if n11 % 150 == 0 then
                task.wait()
            end
            if v398:IsA("Model") and not t21[v398] and v398 ~= t1.LocalPlayer.Character then
                local v399 = v398.Name:lower()
                for _, v in ipairs({
                    [1] = "locker",
                    [2] = "wardrobe",
                    [3] = "cabinet",
                    [4] = "closet",
                    [5] = "hideout",
                    [6] = "armoire",
                    [7] = "coffin",
                    [8] = "chest",
                }) do
                    if v399:find(v) then
                        t21[v398] = true
                        table.insert(t20, v398)
                        v381 = true
                    end
                    if v381 then
                        break
                    end
                end
            end
            v381 = false
        end
    end
    t2._lockerCache.models = t20
    return t20
end
t3.teleportInsideLocker = function(p51)
    local Character = t1.LocalPlayer.Character
    local v405 = Character and Character:FindFirstChild("HumanoidRootPart")
    local v406 = Character and Character:FindFirstChildOfClass("Humanoid")
    if not v405 or not p51 then
        return
    end
    local v407 = nil
    local v408 = v406 and max(v406.HipHeight + 1.5, 2) or 2.5
    for _, descendant in ipairs(p51:GetDescendants()) do
        if descendant:IsA("BasePart") and descendant.Name == "Walls" then
            v407 = descendant
            break
        end
    end
    local v411
    if v407 then
        v411 = new(v407.Position.X, v407.Position.Y - v407.Size.Y / 2 + v408, v407.Position.Z)
    else
        local ok, result, v414 = pcall(function()
            return p51:GetBoundingBox()
        end)
        if not ok or not result then
            return
        end
        v411 = new(result.Position.X, result.Position.Y - v414.Y / 2 + v408, result.Position.Z)
    end
    local t22 = {}
    if Character then
        for _, descendant in ipairs(Character:GetDescendants()) do
            if descendant:IsA("BasePart") then
                t22[descendant] = descendant.CanCollide
                descendant.CanCollide = false
            end
        end
    end
    t3.ultraFastTeleport(v411)
    task.delay(1.8, function()
        for k, v in pairs(t22) do
            if k and k.Parent then
                pcall(function()
                    k.CanCollide = v
                end)
            end
        end
    end)
end
t3.stopKillerSafety = function()
    t2.Settings.KillerSafety = false
    if t2.Cn.killerSafety then
        t2.Cn.killerSafety:Disconnect()
        t2.Cn.killerSafety = nil
    end
    t2.Fl.killerSafetyActive = false
end
t3.startKillerSafety = function()
    if t3.getMyTeamType() ~= "survivor" then
        return
    end
    if t2.Cn.killerSafety then
        t2.Cn.killerSafety:Disconnect()
        t2.Cn.killerSafety = nil
    end
    t2.Fl.killerSafetyActive = false
    t2.Settings.KillerSafety = true
    local n12 = 0
    local n13 = 0
    t2.Cn.killerSafety = t1.RunService.Heartbeat:Connect(function(dt)
        if not t2.Settings.KillerSafety then
            t3.stopKillerSafety()
            return
        end
        if t3.isPlayerDowned(t1.LocalPlayer) then
            t2.Fl.killerSafetyActive = false
            return
        end
        if t2.Fl.killerSafetyActive then
            return
        end
        n13 += dt
        if n13 < 0.3 then
            return
        end
        n13 = 0
        local timestamp = tick()
        if timestamp - n12 < 3 then
            return
        end
        local Character = t1.LocalPlayer.Character
        local v982 = Character and Character:FindFirstChild("HumanoidRootPart")
        local v983 = Character and Character:FindFirstChildOfClass("Humanoid")
        if not v982 or not v983 or v983.Health <= 0 then
            return
        end
        local u984 = nil
        local huge = math.huge
        for _, player in ipairs(t1.Players:GetPlayers()) do
            local v988 = player
            if v988 ~= t1.LocalPlayer then
                local v989 = v988.Character and v988.Character:FindFirstChild("HumanoidRootPart")
                if v989 then
                    local Magnitude = (v982.Position - v989.Position).Magnitude
                    if Magnitude <= t2.Fl.killerSafetyDist and t3.isKillerPlayer(v988) and Magnitude < huge then
                        huge = Magnitude
                        u984 = v989
                    end
                end
            end
        end
        if not u984 then
            return
        end
        n12 = timestamp
        task.spawn(function()
            local v1471 = t3.getLockerModels()
            if #v1471 == 0 then
                return
            end
            local n14 = 0
            local u1473 = v1471[1]
            for _, v in ipairs(v1471) do
                local ok, result = pcall(function()
                    return v:GetBoundingBox()
                end)
                if ok then
                    ok = result
                end
                if ok then
                    local Magnitude = (u984.Position - result.Position).Magnitude
                    if n14 < Magnitude then
                        n14 = Magnitude
                        u1473 = v
                    end
                end
            end
            t2.Fl.killerSafetyActive = true
            local autoFarmRunning = t2.Fl.autoFarmRunning
            t2.Fl.autoFarmRunning = false
            task.spawn(function()
                t3.teleportInsideLocker(u1473)
            end)
            task.delay(4, function()
                t2.Fl.killerSafetyActive = false
                if autoFarmRunning and t2.Settings.AutoFarmLoot and not t2.Fl.farmStoppedForRound then
                    t3.startAutoFarm()
                end
            end)
        end)
    end)
end
t3.stopKillAll = function()
    t2.Fl.killAllRunning = false
    t2.Settings._killAll = false
end
t3.startKillAll = function()
    if t3.getMyTeamType() ~= "killer" then
        return
    end
    if t2.Fl.killAllRunning then
        return
    end
    t2.Fl.killAllRunning = true
    t2.Settings._killAll = true
    task.spawn(function()
        while t2.Fl.killAllRunning and t2.Settings._killAll do
            local v991 = t1.LocalPlayer.Character and t1.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not v991 then
                task.wait(0.1)
            else
                local v992 = (function()
                    local t23 = {}
                    for _, v in ipairs(u38()) do
                        local v1483 = v
                        if v1483 ~= t1.LocalPlayer then
                            local v1484 = v1483.Character and v1483.Character:FindFirstChild("HumanoidRootPart")
                            local v1485 = v1483.Character and v1483.Character:FindFirstChildOfClass("Humanoid")
                            if v1484 and v1485 and v1485.Health > 0 then
                                local Team = v1483.Team
                                if Team then
                                    local v1487 = Team.Name:lower()
                                    if v1487:find("survivor") or v1487:find("innocent") or v1487:find("hider") then
                                        table.insert(t23, v1484)
                                    end
                                elseif not t3.isKillerPlayer(v1483) then
                                    table.insert(t23, v1484)
                                end
                            end
                        end
                    end
                    return t23
                end)()
                if #v992 == 0 then
                    task.wait(0.5)
                else
                    local u993 = v991.CFrame * new2(0, 0, -3.5)
                    for _, v in ipairs(v992) do
                        if not t2.Fl.killAllRunning then
                            break
                        end
                        if v and v.Parent then
                            pcall(function()
                                v.CFrame = u993
                                v.Velocity = u20
                            end)
                        end
                    end
                    task.wait(0.1)
                end
            end
        end
        t2.Fl.killAllRunning = false
    end)
end
local u45 = new(2, 2, 1)
t3.stopHitbox = function()
    t2.Settings.Hitbox = false
    if t2.Cn.hitbox then
        t2.Cn.hitbox:Disconnect()
        t2.Cn.hitbox = nil
    end
    for _, player in ipairs(t1.Players:GetPlayers()) do
        local v422 = player
        if v422 ~= t1.LocalPlayer then
            local v423 = v422.Character and v422.Character:FindFirstChild("HumanoidRootPart")
            if v423 and v423.Size.X ~= 2 then
                v423.Size = u45
                v423.Transparency = 1
            end
        end
    end
end
t3.startHitbox = function()
    if t3.getMyTeamType() ~= "killer" then
        return
    end
    t3.stopHitbox()
    t2.Settings.Hitbox = true
    local n15 = 0
    t2.Cn.hitbox = t1.RunService.Heartbeat:Connect(function(dt)
        if not t2.Settings.Hitbox or t3.getMyTeamType() ~= "killer" then
            t3.stopHitbox()
            return
        end
        n15 += dt
        if n15 < 0.2 then
            return
        end
        n15 = 0
        local Character = t1.LocalPlayer.Character
        local v998 = Character and Character:FindFirstChild("HumanoidRootPart")
        if not v998 then
            return
        end
        local hitboxRadius = t2.Fl.hitboxRadius
        local v1000 = new(hitboxRadius, hitboxRadius, hitboxRadius)
        local Position = v998.Position
        for _, v in ipairs(u38()) do
            local v1004 = v
            if v1004 ~= t1.LocalPlayer then
                local Character3 = v1004.Character
                local v1006 = Character3 and Character3:FindFirstChild("HumanoidRootPart")
                if v1006 then
                    local Humanoid = Character3:FindFirstChildOfClass("Humanoid")
                    if Humanoid and Humanoid.Health > 0 then
                        local v1008 = false
                        local Team = v1004.Team
                        if Team then
                            local v1010 = Team.Name:lower()
                            if v1010:find("survivor") or v1010:find("innocent") or v1010:find("hider") then
                                v1008 = true
                            end
                        elseif not t3.isKillerPlayer(v1004) then
                            v1008 = true
                        end
                        if v1008 then
                            if hitboxRadius >= (Position - v1006.Position).Magnitude then
                                if hitboxRadius ~= v1006.Size.X then
                                    v1006.Size = v1000
                                    v1006.Transparency = 0.7
                                    v1006.CanCollide = false
                                end
                            elseif v1006.Size.X ~= 2 then
                                v1006.Size = u45
                                v1006.Transparency = 1
                            end
                        end
                    end
                end
            end
        end
    end)
end
t3.enableFogRemoval = function()
    if t2.Fl.fogLoopRunning then
        return
    end
    if t2.Cn.fog then
        t2.Cn.fog:Disconnect()
        t2.Cn.fog = nil
    end
    if t2.Cn.fogEC then
        t2.Cn.fogEC:Disconnect()
        t2.Cn.fogEC = nil
    end
    if t2.Cn.fogCC then
        t2.Cn.fogCC:Disconnect()
        t2.Cn.fogCC = nil
    end
    if t2.Cn.fogCam then
        t2.Cn.fogCam:Disconnect()
        t2.Cn.fogCam = nil
    end
    if t2.Cn.fogLoop then
        t2.Cn.fogLoop:Disconnect()
        t2.Cn.fogLoop = nil
    end
    t2.OriginalFog.FogEnd = t1.Lighting.FogEnd
    t2.OriginalFog.FogStart = t1.Lighting.FogStart
    t2.OriginalFog.Ambient = t1.Lighting.Ambient
    t2.OriginalFog.OutdoorAmbient = t1.Lighting.OutdoorAmbient
    t2.OriginalFog.ColorShift_Bottom = t1.Lighting.ColorShift_Bottom
    t2.OriginalFog.ColorShift_Top = t1.Lighting.ColorShift_Top
    t2.OriginalFog.ClockTime = t1.Lighting.ClockTime
    t2.OriginalFog.Brightness = t1.Lighting.Brightness
    t2.OriginalFog.GlobalShadows = t1.Lighting.GlobalShadows
    t2.OriginalFog.ExposureCompensation = t1.Lighting.ExposureCompensation
    t2.Fl.fogLoopRunning = true
    local CurrentCamera = workspace.CurrentCamera
    local function u426(p52)
        if p52:IsA("ColorCorrectionEffect") then
            pcall(function()
                p52.TintColor = new4(1, 1, 1)
                p52.Brightness = 0
                p52.Contrast = 0
                p52.Saturation = 0
            end)
        end
    end
    local function u427()
        t1.Lighting.FogEnd = 1000000000
        t1.Lighting.FogStart = 999999900
        t1.Lighting.ExposureCompensation = 0
        t1.Lighting.Ambient = new4(1, 1, 1)
        t1.Lighting.OutdoorAmbient = new4(1, 1, 1)
        t1.Lighting.ColorShift_Bottom = new4(0, 0, 0)
        t1.Lighting.ColorShift_Top = new4(0, 0, 0)
        t1.Lighting.ClockTime = 14
        t1.Lighting.Brightness = 2
        t1.Lighting.GlobalShadows = false
        for _, child in ipairs(t1.Lighting:GetChildren()) do
            if child:IsA("Atmosphere") then
                child.Density = 0
                child.Haze = 0
                child.Glare = 0
                child.Offset = 0
            end
            u426(child)
        end
        if CurrentCamera and CurrentCamera.Parent then
            for _, child in ipairs(CurrentCamera:GetChildren()) do
                u426(child)
            end
        end
    end
    pcall(u427)
    t2.Cn.fogLoop = t1.RunService.Heartbeat:Connect(function()
        if not t2.Settings.RemoveFog then
            return
        end
        pcall(u427)
    end)
    t2.Cn.fogEC = t1.Lighting:GetPropertyChangedSignal("ExposureCompensation"):Connect(function()
        if t2.Settings.RemoveFog then
            pcall(function()
                t1.Lighting.ExposureCompensation = 0
            end)
        end
    end)
    t2.Cn.fog = t1.Lighting.ChildAdded:Connect(function(child)
        if not t2.Settings.RemoveFog then
            return
        end
        task.defer(function()
            if child and child.Parent then
                if child:IsA("Atmosphere") then
                    child.Density = 0
                    child.Haze = 0
                    child.Glare = 0
                    child.Offset = 0
                end
                pcall(function()
                    u426(child)
                end)
            end
        end)
    end)
    t2.Cn.fogCC = t1.Lighting.DescendantAdded:Connect(function(descendant)
        if not t2.Settings.RemoveFog then
            return
        end
        task.defer(function()
            if descendant and descendant.Parent then
                pcall(function()
                    u426(descendant)
                end)
            end
        end)
    end)
    t2.Cn.fogCam = CurrentCamera.ChildAdded:Connect(function(child)
        if not t2.Settings.RemoveFog then
            return
        end
        task.defer(function()
            if child and child.Parent then
                pcall(function()
                    u426(child)
                end)
            end
        end)
    end)
end
t3.disableFogRemoval = function()
    t2.Settings.RemoveFog = false
    t2.Fl.fogLoopRunning = false
    t1.Lighting.FogEnd = t2.OriginalFog.FogEnd
    t1.Lighting.FogStart = t2.OriginalFog.FogStart
    t1.Lighting.Ambient = t2.OriginalFog.Ambient
    t1.Lighting.OutdoorAmbient = t2.OriginalFog.OutdoorAmbient
    t1.Lighting.ColorShift_Bottom = t2.OriginalFog.ColorShift_Bottom
    t1.Lighting.ColorShift_Top = t2.OriginalFog.ColorShift_Top
    t1.Lighting.ClockTime = t2.OriginalFog.ClockTime
    t1.Lighting.Brightness = t2.OriginalFog.Brightness
    t1.Lighting.GlobalShadows = t2.OriginalFog.GlobalShadows
    if t2.OriginalFog.ExposureCompensation then
        t1.Lighting.ExposureCompensation = t2.OriginalFog.ExposureCompensation
    end
    for k, v in pairs(t2.OriginalAtmosphere) do
        if k and k.Parent then
            pcall(function()
                k.Density = v.Density
                k.Haze = v.Haze
            end)
        end
    end
    if t2.Cn.fog then
        t2.Cn.fog:Disconnect()
        t2.Cn.fog = nil
    end
    if t2.Cn.fogEC then
        t2.Cn.fogEC:Disconnect()
        t2.Cn.fogEC = nil
    end
    if t2.Cn.fogCC then
        t2.Cn.fogCC:Disconnect()
        t2.Cn.fogCC = nil
    end
    if t2.Cn.fogCam then
        t2.Cn.fogCam:Disconnect()
        t2.Cn.fogCam = nil
    end
    if t2.Cn.fogLoop then
        t2.Cn.fogLoop:Disconnect()
        t2.Cn.fogLoop = nil
    end
end
t3.stopAntiAFK = function()
    t2.Settings.AntiAFK = false
    if t2.Cn.antiAfk then
        t2.Cn.antiAfk:Disconnect()
        t2.Cn.antiAfk = nil
    end
    if t2.Cn.watchdog then
        t2.Cn.watchdog:Disconnect()
        t2.Cn.watchdog = nil
    end
end
t3.startAntiAFK = function()
    t3.stopAntiAFK()
    t2.Settings.AntiAFK = true
    local n16 = 0
    local n17 = 0
    local ok, result = pcall(function()
        return game:GetService("VirtualUser")
    end)
    local u434 = result
    if not ok then
        u434 = nil
    end
    t2.Cn.antiAfk = t1.RunService.Heartbeat:Connect(function(dt)
        if not t2.Settings.AntiAFK then
            t3.stopAntiAFK()
            return
        end
        n16 += dt
        n17 += dt
        if n16 >= 35 then
            n16 = 0
            pcall(function()
                if u434 then
                    u434:Button1Down(Vector2.new(math.random(100, 700), math.random(100, 500)), workspace.CurrentCamera.CFrame)
                    task.wait(0.05)
                    u434:Button1Up(Vector2.new(math.random(100, 700), math.random(100, 500)), workspace.CurrentCamera.CFrame)
                end
                local Character = t1.LocalPlayer.Character
                local v1489 = Character and Character:FindFirstChildOfClass("Humanoid")
                if v1489 and v1489.Health > 0 then
                    if v1489.Sit then
                        v1489.Sit = false
                    end
                    v1489.Jump = true
                end
            end)
        end
        if n17 >= 10 then
            n17 = 0
            pcall(function()
                if t2.Settings.AutoFarmLoot and not t2.Fl.autoFarmRunning and not t2.Fl.farmStoppedForRound and t3.getMyTeamType() == "survivor" then
                    t3.startAutoFarm()
                end
                if t2.Settings.AutoRevive and not t2.Fl.autoReviveRunning then
                    t3.startAutoRevive()
                end
                if t2.Settings.AutoSelfRevive and not t2.Cn.autoSelfRevive then
                    t3.startAutoSelfRevive()
                end
                if t2.Settings.KillerSafety and not t2.Cn.killerSafety then
                    t3.startKillerSafety()
                end
            end)
        end
    end)
end
t3.teleportToRandomSurvivor = function()
    if t3.getMyTeamType() ~= "survivor" then
        return
    end
    local t24 = {}
    for _, player in ipairs(t1.Players:GetPlayers()) do
        local v438 = player
        if v438 ~= t1.LocalPlayer then
            local Team = v438.Team
            if Team then
                local v440 = Team.Name:lower()
                if v440:find("survivor") or v440:find("innocent") or v440:find("hider") then
                    local v441 = v438.Character and v438.Character:FindFirstChild("HumanoidRootPart")
                    local v442 = v438.Character and v438.Character:FindFirstChildOfClass("Humanoid")
                    if v441 and v442 and v442.Health > 0 then
                        table.insert(t24, v441)
                    end
                end
            end
        end
    end
    if #t24 == 0 then
        return
    end
    local v443 = t24[math.random(#t24)]
    if t1.LocalPlayer.Character and t1.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v443 and v443.Parent then
        t3.ultraFastTeleport(v443.Position + new(2, 0, 0))
    end
end
t3.stopReviveFollow = function()
    if t2.Cn.reviveFollow then
        pcall(function()
            t2.Cn.reviveFollow:Disconnect()
        end)
        t2.Cn.reviveFollow = nil
    end
    t2.Fl.farmPaused = false
end
t3.stopAutoRevive = function()
    t2.Fl.autoReviveRunning = false
    if t2.Cn.autoRevive then
        pcall(function()
            t2.Cn.autoRevive:Disconnect()
        end)
        t2.Cn.autoRevive = nil
    end
    t3.stopReviveFollow()
    t3.clearTable(t2.reviveTracking)
end
t3.startAutoRevive = function()
    if t2.Fl._reviveStarting then
        return
    end
    t2.Fl._reviveStarting = true
    if t3.getMyTeamType() ~= "survivor" then
        t2.Fl._reviveStarting = false
        return
    end
    t3.stopAutoRevive()
    task.wait(0.05)
    t2.Fl._reviveStarting = false
    t2.reviveLoopId = t2.reviveLoopId + 1
    local reviveLoopId = t2.reviveLoopId
    t2.Settings.AutoRevive = true
    t2.Fl.autoReviveRunning = true
    if t2.Settings.KillerSafety and not t2.Cn.killerSafety then
        t3.startKillerSafety()
    end
    local n18 = 0
    local u446 = nil
    t2.Cn.autoRevive = t1.RunService.Heartbeat:Connect(function(dt)
        if reviveLoopId ~= t2.reviveLoopId then
            t2.Fl.autoReviveRunning = false
            t2.Cn.autoRevive:Disconnect()
            t2.Cn.autoRevive = nil
            return
        end
        if not t2.Settings.AutoRevive or not t2.Fl.autoReviveRunning then
            return
        end
        if t3.getMyTeamType() ~= "survivor" then
            t3.stopAutoRevive()
            return
        end
        if t3.isPlayerDowned(t1.LocalPlayer) then
            if u446 then
                t2.reviveTracking[u446] = nil
                u446 = nil
                t3.stopReviveFollow()
            end
            return
        end
        n18 += dt
        if n18 < 0.3 then
            return
        end
        n18 = 0
        local timestamp = tick()
        for _, player in ipairs(t1.Players:GetPlayers()) do
            local v1028 = player
            if v1028 ~= t1.LocalPlayer then
                local Team = v1028.Team
                if Team then
                    local v1030 = Team.Name:lower()
                    if v1030:find("survivor") or v1030:find("innocent") or v1030:find("hider") then
                        local UserId = v1028.UserId
                        if t3.isPlayerDowned(v1028) then
                            if not t2.reviveTracking[UserId] then
                                t2.reviveTracking[UserId] = {
                                    player = v1028,
                                    downTime = timestamp,
                                }
                            end
                        elseif t2.reviveTracking[UserId] then
                            t2.reviveTracking[UserId] = nil
                            if UserId == u446 then
                                u446 = nil
                                t3.stopReviveFollow()
                            end
                        end
                    end
                end
            end
        end
        for k in pairs(t2.reviveTracking) do
            local v1033 = k
            local v1034 = t2.reviveTracking[v1033]
            if not v1034.player or not v1034.player.Parent then
                t2.reviveTracking[v1033] = nil
                if v1033 == u446 then
                    u446 = nil
                    t3.stopReviveFollow()
                end
            end
        end
        if u446 and t2.reviveTracking[u446] then
            return
        end
        if u446 and not t2.reviveTracking[u446] then
            u446 = nil
            t3.stopReviveFollow()
        end
        local Character = t1.LocalPlayer.Character
        local v1036 = Character and Character:FindFirstChildOfClass("Humanoid")
        if not v1036 or v1036.Health <= 0 then
            return
        end
        local u1037 = nil
        local n19 = 0
        for k, v in pairs(t2.reviveTracking) do
            local v1041 = timestamp - v.downTime
            if v1041 >= 5 and n19 < v1041 then
                n19 = v1041
                u1037 = k
            end
        end
        if not u1037 then
            return
        end
        local player = t2.reviveTracking[u1037].player
        local u1043 = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not u1043 or not u1043.Parent or not t3.isPlayerDowned(player) then
            t2.reviveTracking[u1037] = nil
            return
        end
        u446 = u1037
        t2.Fl.farmPaused = true
        local n20 = 0
        t2.Cn.reviveFollow = t1.RunService.Heartbeat:Connect(function(dt2)
            if not t2.Settings.AutoRevive then
                t2.Fl.farmPaused = false
                t3.stopReviveFollow()
                u446 = nil
                return
            end
            if t2.Fl.killerSafetyActive then
                return
            end
            if not t3.isPlayerDowned(player) or not u1043.Parent then
                t2.reviveTracking[u1037] = nil
                u446 = nil
                t2.Fl.farmPaused = false
                t3.stopReviveFollow()
                return
            end
            n20 += dt2
            if n20 < 0.08 then
                return
            end
            n20 = 0
            if not t1.LocalPlayer.Character or not t1.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                return
            end
            task.spawn(function()
                pcall(function()
                    t3.ultraFastTeleport(u1043.Position + new(2, 0, 0))
                end)
                t3.tryTriggerLoot(player.Character)
            end)
        end)
    end)
end
t3.reviveMySelf = function()
    if t3.getMyTeamType() ~= "survivor" then
        return
    end
    local Character = t1.LocalPlayer.Character
    local v448 = Character and Character:FindFirstChild("HumanoidRootPart")
    if not v448 then
        return
    end
    t2.Fl.reviveSelfPaused = true
    t3.stopReviveFollow()
    if t2.Cn.selfReviveFollow then
        pcall(function()
            t2.Cn.selfReviveFollow:Disconnect()
        end)
        t2.Cn.selfReviveFollow = nil
    end
    local n21 = 0
    local u450 = nil
    for _, player in ipairs(t1.Players:GetPlayers()) do
        local v453 = player
        if v453 ~= t1.LocalPlayer then
            local Team = v453.Team
            if Team then
                local v455 = Team.Name:lower()
                if (v455:find("survivor") or v455:find("innocent") or v455:find("hider")) and not t3.isPlayerDowned(v453) then
                    local v456 = v453.Character and v453.Character:FindFirstChild("HumanoidRootPart")
                    local v457 = v453.Character and v453.Character:FindFirstChildOfClass("Humanoid")
                    if v456 and v457 and v457.Health > 0 then
                        local Magnitude = (v448.Position - v456.Position).Magnitude
                        if n21 < Magnitude then
                            n21 = Magnitude
                            u450 = v456
                        end
                    end
                end
            end
        end
    end
    if u450 and u450.Parent then
        t2.Cn.selfReviveFollow = t1.RunService.Heartbeat:Connect(function()
            local player = t1.Players:GetPlayerFromCharacter(u450.Parent)
            if not t3.isPlayerDowned(t1.LocalPlayer) or not u450.Parent or player and t3.isPlayerDowned(player) then
                if t2.Cn.selfReviveFollow then
                    pcall(function()
                        t2.Cn.selfReviveFollow:Disconnect()
                    end)
                    t2.Cn.selfReviveFollow = nil
                end
                t2.Fl.reviveSelfPaused = false
                return
            end
            t3.ultraFastTeleport(u450.Position + new(2, 0, 0))
        end)
    else
        task.delay(2.5, function()
            t2.Fl.reviveSelfPaused = false
        end)
    end
end
t3.stopAutoSelfRevive = function()
    if t2.Cn.autoSelfRevive then
        pcall(function()
            t2.Cn.autoSelfRevive:Disconnect()
        end)
        t2.Cn.autoSelfRevive = nil
    end
    if t2.Cn.selfReviveFollow then
        pcall(function()
            t2.Cn.selfReviveFollow:Disconnect()
        end)
        t2.Cn.selfReviveFollow = nil
    end
    t2.Fl.reviveSelfPaused = false
end
t3.startAutoSelfRevive = function()
    if t3.getMyTeamType() ~= "survivor" then
        return
    end
    t3.stopAutoSelfRevive()
    task.wait(0.05)
    t2.selfReviveLoopId = t2.selfReviveLoopId + 1
    local selfReviveLoopId = t2.selfReviveLoopId
    t2.Settings.AutoSelfRevive = true
    local n22 = 0
    local n23 = 0
    t2.Cn.autoSelfRevive = t1.RunService.Heartbeat:Connect(function(dt)
        if selfReviveLoopId ~= t2.selfReviveLoopId then
            t2.Cn.autoSelfRevive:Disconnect()
            t2.Cn.autoSelfRevive = nil
            return
        end
        if not t2.Settings.AutoSelfRevive then
            t3.stopAutoSelfRevive()
            return
        end
        if t3.getMyTeamType() ~= "survivor" then
            t3.stopAutoSelfRevive()
            return
        end
        n22 += dt
        if n22 < 0.5 then
            return
        end
        n22 = 0
        local timestamp = tick()
        if timestamp - n23 < 5 then
            return
        end
        if t2.Fl.farmStoppedForRound then
            return
        end
        if t3.isPlayerDowned(t1.LocalPlayer) then
            n23 = timestamp
            t3.reviveMySelf()
        end
    end)
end
local t25 = {
    Snowman = {
        idle = {
            Animation1 = "rbxassetid://122257458498464",
            Animation2 = "rbxassetid://122257458498464",
        },
        walk = {
            WalkAnim = "rbxassetid://122150855457006",
        },
        run = {
            RunAnim = "rbxassetid://82598234841035",
        },
        jump = {
            JumpAnim = "rbxassetid://75290611992385",
        },
        fall = {
            FallAnim = "rbxassetid://75290611992385",
        },
        climb = {
            ClimbAnim = "rbxassetid://88763136693023",
        },
        swim = {
            Swim = "rbxassetid://109346520324160",
        },
    },
    Royal = {
        idle = {
            Animation1 = "http://www.roblox.com/asset/?id=10921248039",
            Animation2 = "rbxassetid://14366558676",
        },
        walk = {
            WalkAnim = "http://www.roblox.com/asset/?id=10921298616",
        },
        run = {
            RunAnim = "http://www.roblox.com/asset/?id=10921250460",
        },
        jump = {
            JumpAnim = "http://www.roblox.com/asset/?id=10921252123",
        },
        fall = {
            FallAnim = "http://www.roblox.com/asset/?id=10921251156",
        },
        climb = {
            ClimbAnim = "http://www.roblox.com/asset/?id=10921247141",
        },
        sit = {
            SitAnim = "rbxassetid://98983598181881",
        },
    },
    Ninja = {
        idle = {
            Animation1 = "http://www.roblox.com/asset/?id=10921155160",
            Animation2 = "http://www.roblox.com/asset/?id=10921155867",
        },
        walk = {
            WalkAnim = "http://www.roblox.com/asset/?id=10921162768",
        },
        run = {
            RunAnim = "http://www.roblox.com/asset/?id=10921157929",
        },
        jump = {
            JumpAnim = "http://www.roblox.com/asset/?id=10921160088",
        },
        fall = {
            FallAnim = "http://www.roblox.com/asset/?id=10921159222",
        },
    },
}
local t26 = {
    Snowman = "SnowAnimation",
    Royal = "RoyalAnimation",
    Ninja = "NinjaAnimation",
}
t3._getPristineAnimate = function(p53)
    local Animate = p53:FindFirstChild("Animate")
    if p53 == t2._pristineAnimateChar and t2._pristineAnimate then
        if Animate and not Animate:GetAttribute("JxH_Custom") then
            t2._pristineAnimate:Destroy()
            t2._pristineAnimate = Animate:Clone()
            t2._pristineAnimate.Disabled = true
        end
        return t2._pristineAnimate
    end
    if not Animate then
        return nil
    end
    local clone = Animate:Clone()
    clone.Disabled = true
    t2._pristineAnimate = clone
    t2._pristineAnimateChar = p53
    return clone
end
t3._injectAnim = function(p54, p55)
    for k, v in pairs(p55) do
        local k2 = p54:FindFirstChild(k)
        if k2 then
            for k3, v4 in pairs(v) do
                local v472 = k3
                local v473 = v4
                local v474 = k2:FindFirstChild(v472)
                if not v474 then
                    v474 = new3("Animation")
                    v474.Name = v472
                    v474.Parent = k2
                end
                if v474:IsA("Animation") then
                    v474.AnimationId = v473
                elseif v474:IsA("StringValue") then
                    v474.Value = v473
                end
            end
        end
    end
end
t3._cleanCustomAnim = function()
    if t2._customAnimConn then
        t2._customAnimConn:Disconnect()
        t2._customAnimConn = nil
    end
end
t3.applyCustomAnim = function(p56, p57)
    if not p56 or not t25[p57] then
        return
    end
    if t3.getMyTeamType() == "killer" then
        t3.stopCustomAnim(p56, true)
        return
    end
    local Humanoid = p56:FindFirstChildOfClass("Humanoid")
    if not Humanoid then
        return
    end
    local v478 = t3._getPristineAnimate(p56)
    if not v478 then
        return
    end
    t3._cleanCustomAnim()
    local Animate = p56:FindFirstChild("Animate")
    local clone = v478:Clone()
    t3._injectAnim(clone, t25[p57])
    clone:SetAttribute("JxH_Custom", true)
    if Animate then
        Animate:Destroy()
    end
    clone.Disabled = t3.isPlayerDowned(t1.LocalPlayer)
    clone.Parent = p56
    t2._customAnimConn = Humanoid.StateChanged:Connect(function()
        if clone.Parent then
            clone.Disabled = t3.isPlayerDowned(t1.LocalPlayer)
        end
    end)
end
t3.stopCustomAnim = function(p58, p59)
    if not p59 then
        for _, v in pairs(t26) do
            t2.Settings[v] = false
        end
    end
    t3._cleanCustomAnim()
    if not p58 then
        return
    end
    local Animate = p58:FindFirstChild("Animate")
    if Animate and Animate:GetAttribute("JxH_Custom") then
        if p58 == t2._pristineAnimateChar and t2._pristineAnimate then
            local clone = t2._pristineAnimate:Clone()
            Animate:Destroy()
            clone.Disabled = false
            clone.Parent = p58
        else
            Animate:Destroy()
        end
    end
end
t3.getActiveAnim = function()
    for k, v in pairs(t26) do
        if t2.Settings[v] then
            return k
        end
    end
    return nil
end
t3.setActiveAnim = function(p60)
    local Character = t1.LocalPlayer.Character
    for k, v in pairs(t26) do
        if k ~= p60 and t2.Settings[v] then
            t2.Settings[v] = false
            if t2.toggleRefs[v] then
                t2.toggleRefs[v](false)
            end
        end
    end
    if p60 then
        t3.applyCustomAnim(Character, p60)
    else
        t3.stopCustomAnim(Character, true)
    end
end
local t27 = {
    qualityLevel = nil,
    globalShadows = nil,
    atmospheres = {},
    particles = {},
}
t3.startFpsBoost = function()
    t2.Settings.FpsBoost = true
    pcall(function()
        t27.qualityLevel = settings().Rendering.QualityLevel
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end)
    t27.globalShadows = t1.Lighting.GlobalShadows
    pcall(function()
        t1.Lighting.GlobalShadows = false
    end)
    t3.clearTable(t27.atmospheres)
    for _, child in ipairs(t1.Lighting:GetChildren()) do
        if child:IsA("Atmosphere") then
            t27.atmospheres[child] = {
                Density = child.Density,
                Haze = child.Haze,
                Glare = child.Glare,
                Blur = child.Blur,
            }
            pcall(function()
                child.Density = 0
                child.Haze = 0
                child.Glare = 0
                child.Blur = 0
            end)
        end
    end
    t3.clearTable(t27.particles)
    for _, descendant in ipairs(workspace:GetDescendants()) do
        if descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") or descendant:IsA("Smoke") or descendant:IsA("Fire") or descendant:IsA("Sparkles") then
            pcall(function()
                t27.particles[descendant] = descendant.Enabled
                descendant.Enabled = false
            end)
        end
    end
end
t3.stopFpsBoost = function()
    t2.Settings.FpsBoost = false
    pcall(function()
        settings().Rendering.QualityLevel = t27.qualityLevel or Enum.QualityLevel.Automatic
    end)
    if t27.globalShadows ~= nil then
        pcall(function()
            t1.Lighting.GlobalShadows = t27.globalShadows
        end)
        t27.globalShadows = nil
    end
    for k, v in pairs(t27.atmospheres) do
        if k and k.Parent then
            pcall(function()
                k.Density = v.Density
                k.Haze = v.Haze
                k.Glare = v.Glare
                k.Blur = v.Blur
            end)
        end
    end
    for k, v in pairs(t27.particles) do
        if k and k.Parent then
            pcall(function()
                k.Enabled = v
            end)
        end
    end
    t3.clearTable(t27.particles)
    t3.clearTable(t27.atmospheres)
    t27.qualityLevel = nil
end
t3.stopAllActionsInternal = function()
    t3.stopAutoHS()
    t2.Fl.autoFarmRunning = false
    t2.farmLoopId = t2.farmLoopId + 1
    if t2.Cn.autoEscape then
        pcall(function()
            t2.Cn.autoEscape:Disconnect()
        end)
        t2.Cn.autoEscape = nil
    end
    t2.Fl.autoEscapeRunning = false
    if t2.Cn.killerSafety then
        t2.Cn.killerSafety:Disconnect()
        t2.Cn.killerSafety = nil
    end
    t2.Fl.killerSafetyActive = false
    if t2.Cn.autoRevive then
        pcall(function()
            t2.Cn.autoRevive:Disconnect()
        end)
        t2.Cn.autoRevive = nil
    end
    t2.Fl.autoReviveRunning = false
    t3.stopReviveFollow()
    t2.reviveLoopId = t2.reviveLoopId + 1
    if t2.Cn.autoSelfRevive then
        pcall(function()
            t2.Cn.autoSelfRevive:Disconnect()
        end)
        t2.Cn.autoSelfRevive = nil
    end
    t2.selfReviveLoopId = t2.selfReviveLoopId + 1
    t2.Fl.killAllRunning = false
    if t2.Fl.ghostActive then
        t3.toggleGhostMode(false)
    end
    if t2.Cn.hitbox then
        t2.Cn.hitbox:Disconnect()
        t2.Cn.hitbox = nil
    end
end
t3.startShiftLock = function()
    t2.Settings.ShiftLock = true
    if t2.Cn.shiftLock then
        t2.Cn.shiftLock:Disconnect()
    end
    t2.Cn.shiftLock = t1.RunService.RenderStepped:Connect(function()
        if not t2.Settings.ShiftLock then
            return
        end
        pcall(function()
            t1.UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
            local Character = t1.LocalPlayer.Character
            local v1497 = Character and Character:FindFirstChildOfClass("Humanoid")
            local v1498 = Character and Character:FindFirstChild("HumanoidRootPart")
            if v1497 and v1498 and v1497.Health > 0 then
                v1497.CameraOffset = new(1.75, 0, 0)
                v1497.AutoRotate = false
                local LookVector = workspace.CurrentCamera.CFrame.LookVector
                v1498.CFrame = new2(v1498.Position, v1498.Position + new(LookVector.X, 0, LookVector.Z))
            end
        end)
    end)
end
t3.stopShiftLock = function()
    t2.Settings.ShiftLock = false
    if t2.Cn.shiftLock then
        t2.Cn.shiftLock:Disconnect()
        t2.Cn.shiftLock = nil
    end
    pcall(function()
        t1.UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        local Character = t1.LocalPlayer.Character
        local v1057 = Character and Character:FindFirstChildOfClass("Humanoid")
        if v1057 then
            v1057.CameraOffset = new(0, 0, 0)
            v1057.AutoRotate = true
        end
    end)
end
t3.restartEnabledCommands = function()
    local timestamp = tick()
    if timestamp - t2._restartCooldown < 1.5 then
        return
    end
    t2._restartCooldown = timestamp
    t3.stopAllActionsInternal()
    t2.cachedMap = nil
    t2._lockerCache.time = 0
    t2.Fl.farmPriority = 0
    t2.Fl.farmPaused = false
    t2.Fl.farmStoppedForRound = false
    t2.Fl.reviveSelfPaused = false
    t2.Fl.escapeTriggeredExternal = false
    t2.Fl.escapeCheckTimer = 0
    t3.clearTable(t2.reviveTracking)
    local v515 = t3.getMyTeamType()
    if v515 == "survivor" then
        if t2.Settings.AutoFarmLoot then
            t3.startAutoFarm()
        end
        if t2.Settings.AutoEscape then
            t3.startAutoEscape()
        end
        if t2.Settings.KillerSafety then
            t3.startKillerSafety()
        end
        if t2.Settings.AutoRevive then
            t3.startAutoRevive()
        end
        if t2.Settings.AutoSelfRevive then
            t3.startAutoSelfRevive()
        end
    elseif v515 == "killer" then
        if t2.Settings._killAll then
            t3.startKillAll()
        end
        if t2.Settings.Hitbox then
            t3.startHitbox()
        end
    end
    if t2.Settings.InfiniteJump then
        t3.startInfiniteJump()
    end
    if t2.Settings.AntiAFK then
        t3.startAntiAFK()
    end
    if t2.Settings.LootESP then
        t3.updateLootESP()
    end
    if t2.Settings.ExitESP then
        t3.updateExitESP()
    end
    if t2.Settings.JumpBoost then
        t3.startJumpBoost()
    end
    local v516 = t3.getActiveAnim()
    if v516 then
        t3.applyCustomAnim(t1.LocalPlayer.Character, v516)
    end
    if t2.Settings.GhostMode and v515 ~= "lobby" then
        t3.toggleGhostMode(true)
    end
end
    if t2.Settings.DoubleJump then t3.setupDoubleJump() end
    t1.LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function()
        local v1451 = t3.getMyTeamType()
        if v1451 == "lobby" then
            t3.stopAllActionsInternal()
            u43()
            t3.clearTable(t2.espColorCache)
            t2.cachedMap = nil
            t2._lockerCache.time = 0
            t2.Fl.escapeTriggeredExternal = false
            t2.Fl.farmPriority = 0
            t2.Fl.farmPaused = false
            t2.Fl.reviveSelfPaused = false
            t3.clearTable(t2.reviveTracking)
            t2.Fl.farmStoppedForRound = false
            for _, player in ipairs(t1.Players:GetPlayers()) do
                local v1454 = player
                if v1454 ~= t1.LocalPlayer then
                    local UserId = v1454.UserId
                    if not t2.livesData[UserId] then
                        t2.livesData[UserId] = {
                            lives = t2.LIVES_MAX,
                            heartImgs = {},
                            lastLoss = 0,
                        }
                    end
                    t2.livesData[UserId].lives = t2.LIVES_MAX
                    t2.livesData[UserId].lastLoss = 0
                    t2.livesDownState[UserId] = false
                    t3.updateHearts(UserId, t2.LIVES_MAX)
                    local v1456 = t2.livesData[UserId]
                    if v1456.bgui and v1456.bgui.Parent then
                        v1456.bgui.Enabled = false
                    end
                end
            end
        elseif v1451 == "survivor" or v1451 == "killer" then
            u44()
            if v1451 == "killer" and t3.getActiveAnim() then
                t3.stopCustomAnim(t1.LocalPlayer.Character, true)
            end
            task.spawn(function()
                task.wait(1.5)
                t3.restartEnabledCommands()
            end)
        end
    end)
    t1.LocalPlayer.CharacterAdded:Connect(function(character)
        t3.stopAllActionsInternal()
        t2.Fl.farmPriority = 0
        t2.Fl.farmPaused = false
        t2.Fl.farmStoppedForRound = false
        t2.Fl.reviveSelfPaused = false
        t2.Fl.escapeCheckTimer = 0
        t3.clearTable(t2.reviveTracking)
        task.wait(1.5)
        t2.cachedMap = nil
        t2.Fl.escapeTriggeredExternal = false
        t2._lockerCache.time = 0
        if t2.Settings.DoubleJump then
            t3.setupDoubleJump()
        end
        if t2.Settings.Noclip then
            t3.startNoclip()
        end
        if t2.Settings.FlyEnabled then
            t3.startFly()
        end
        if t2.Settings.SpeedEnabled then
            local Humanoid = character:FindFirstChildOfClass("Humanoid")
            if Humanoid then
                Humanoid.WalkSpeed = t2.Fl.currentSpeed
            end
        end
        local v1459 = t3.getMyTeamType()
        if v1459 == "survivor" then
            if t2.Settings.AutoHS then
                t3.startAutoHS()
            end
            if t2.Settings.AutoFarmLoot then
                t3.startAutoFarm()
            end
            if t2.Settings.AutoEscape then
                t3.startAutoEscape()
            end
            if t2.Settings.KillerSafety then
                t3.startKillerSafety()
            end
            if t2.Settings.AutoRevive then
                t3.startAutoRevive()
            end
            if t2.Settings.AutoSelfRevive then
                t3.startAutoSelfRevive()
            end
        elseif v1459 == "killer" and t2.Settings._killAll then
            t3.startKillAll()
        end
        if t2.Settings.InfiniteJump then
            t3.startInfiniteJump()
        end
        local v1460 = t3.getActiveAnim()
        if v1460 then
            t3.applyCustomAnim(character, v1460)
        end
        if t2.Settings.GhostMode and v1459 ~= "lobby" then
            t3.toggleGhostMode(true)
        end
        if t2.Settings.ShiftLock then
            t3.startShiftLock()
        end
        u44()
        t3.updateLootESP()
    end)
    task.spawn(function()
        t1.RunService.RenderStepped:Connect(function()
            local CurrentCamera = workspace.CurrentCamera
            if not CurrentCamera then
                return
            end
            local spectateTarget = t2.Fl.spectateTarget
            if spectateTarget then
                if spectateTarget.Parent then
                    local Character = spectateTarget.Character
                    local v1750 = Character and Character:FindFirstChildOfClass("Humanoid")
                    if v1750 and v1750 ~= CurrentCamera.CameraSubject then
                        CurrentCamera.CameraSubject = v1750
                    end
                else
                    t2.Fl.spectateTarget = nil
                    if t2.UIRefs.spectateUpdate then
                        t2.UIRefs.spectateUpdate(nil)
                    end
                end
            elseif t2.Fl.ghostActive and t2.Fl.fakeChar then
                local Humanoid = t2.Fl.fakeChar:FindFirstChildOfClass("Humanoid")
                if Humanoid and Humanoid ~= CurrentCamera.CameraSubject then
                    CurrentCamera.CameraSubject = Humanoid
                end
            else
                local Character = t1.LocalPlayer.Character
                local v1753 = Character and Character:FindFirstChildOfClass("Humanoid")
                if v1753 and v1753.Health > 0 and v1753 ~= CurrentCamera.CameraSubject then
                    CurrentCamera.CameraSubject = v1753
                end
            end
        end)
    end)
    t1.Players.PlayerRemoving:Connect(function(player)
        if player == t2.Fl.spectateTarget then
            t2.Fl.spectateTarget = nil
            if t2.UIRefs.spectateUpdate then
                t2.UIRefs.spectateUpdate(nil)
            end
        end
        u37 = true
        local UserId = player.UserId
        local u1463 = t2.Storage.Players[UserId]
        if u1463 then
            if u1463.colorDot then
                pcall(function()
                    u1463.colorDot:Destroy()
                end)
            end
            t3.safeDestroy(u1463.bgui)
            t3.safeDestroy(u1463.bguiDist)
            t3.safeDestroy(u1463.bguiBox)
            t3.safeDestroy(u1463.hl)
            if u1463.conn then
                u1463.conn:Disconnect()
            end
            t2.Storage.Players[UserId] = nil
        end
        local v1464 = t2.Storage.Lives[UserId]
        if v1464 then
            t3.safeDestroy(v1464.bgui)
            t2.Storage.Lives[UserId] = nil
        end
        if t2.Storage.TeamConns[UserId] then
            t2.Storage.TeamConns[UserId]:Disconnect()
            t2.Storage.TeamConns[UserId] = nil
        end
        t2.Storage.NameLabels[UserId] = nil
        t2.Storage.DistLabels[UserId] = nil
        t2.espColorCache[UserId] = nil
        t2.espColorCache["team_" .. UserId] = nil
        t2.reviveTracking[UserId] = nil
        t2.livesData[UserId] = nil
        t2.livesDownState[UserId] = nil
    end)
    for _, player in ipairs(t1.Players:GetPlayers()) do
        t3.createPlayerESP(player)
    end
    t1.Players.PlayerAdded:Connect(function(player)
        u37 = true
        t3.createPlayerESP(player)
    end)
    task.spawn(function()
        while task.wait(1) do
            if t2.Settings.LootESP then
                pcall(t3.updateLootESP)
            end
        end
    end)
    task.spawn(function()
        while task.wait(60) do
            if t3.getMyTeamType() == "survivor" then
                if t2.Settings.AutoHS and not t2.Fl.autoHSRunning then
                    t3.startAutoHS()
                end
                if t2.Settings.AutoFarmLoot and not t2.Fl.autoFarmRunning and not t2.Fl.farmStoppedForRound then
                    t2.Fl.lootCacheMap = nil
                    t3.clearTable(t2.collectedLoot)
                    t3.startAutoFarm()
                end
                if t2.Settings.AutoEscape and not t2.Fl.autoEscapeRunning and not t2.Fl.escapeTriggeredExternal then
                    t2.Fl.escapeCheckTimer = 0
                    t3.startAutoEscape()
                end
                if t2.Settings.KillerSafety and not t2.Cn.killerSafety then
                    t3.startKillerSafety()
                end
                if t2.Settings.AutoRevive and not t2.Fl.autoReviveRunning then
                    t3.startAutoRevive()
                end
                if t2.Settings.AutoSelfRevive and not t2.Cn.autoSelfRevive then
                    t3.startAutoSelfRevive()
                end
            end
        end
    end)
    t2.farmCollectDelay = t3.pctToDelay(t2.farmSpeedPct)
    return t1, t2, t3
end

-- Feature core (ported logic).
local coreOk, t1, t2, t3 = xpcall(loadCore, function(err)
	return tostring(err) .. "\n" .. debug.traceback()
end)

-- Show the failure inside the window instead of leaving it empty.
if not coreOk then
	warn("[Core] " .. tostring(t1))
	local ErrorTab = Window:Tab({ Title = "Error", Icon = "alert-triangle" })
	ErrorTab:Paragraph({ Title = "Core failed to load", Desc = tostring(t1):sub(1, 400) })
	ErrorTab:Button({ Title = "Copy error", Callback = function() setclipboard(tostring(t1)) end })
	ErrorTab:Select()
	do return end
end

local Registered = {}

-- Toggle helper: keeps Settings, toggleRefs and toggleCbs in sync with the core.
local function addToggle(tab, key, title, desc, callback)
	local silent = false
	local element = tab:Toggle({
		Title = title,
		Desc = desc,
		Value = t2.Settings[key] or false,
		Callback = function(value)
			if silent then return end
			t2.Settings[key] = value
			if callback then callback(value) end
		end,
	})
	Registered["Toggle_" .. key] = element
	t2.toggleRefs[key] = function(value)
		silent = true
		pcall(function() element:Set(value) end)
		task.defer(function() silent = false end)
	end
	t2.toggleCbs[key] = callback
	return element
end

-- Blocks a toggle while Auto Skill Check owns the character.
local function guarded(key, callback)
	return function(value)
		if value and t2.Fl.autoHSRunning then
			t2.Settings[key] = false
			if t2.toggleRefs[key] then t2.toggleRefs[key](false) end
			Notify("Auto Skill Check", "ปิด Auto Skill Check ก่อนใช้ฟังก์ชันนี้", "alert-triangle", 3, true)
			return
		end
		callback(value)
	end
end

local function addSlider(tab, title, min, max, default, step, callback)
	local element = tab:Slider({
		Title = title,
		Step = step or 1,
		Value = { Min = min, Max = max, Default = default },
		Callback = callback,
	})
	Registered["Slider_" .. title] = element
	return element
end
-- ========================================
-- UI Tabs (วางต่อจาก local t1, t2, t3 = loadCore())
-- ทุกปุ่มเขียนตรง ๆ: แก้ Title / Desc ได้เลย
-- =====================================================

-- ตัวช่วยเล็ก ๆ (ไม่ต้องแก้)
local Registered = {}

-- ผูก element เข้ากับ core (sync toggle จากระบบ auto + เซฟ config)
local function Link(id, element, key)
	Registered[id] = element
	if key then
		t2.toggleRefs[key] = function(value) pcall(function() element:Set(value) end) end
	end
end

-- กัน toggle ที่ชนกับ Auto Skill Check; คืน true ถ้าถูกบล็อก
local function Blocked(key, value, element)
	if value and t2.Fl.autoHSRunning then
		t2.Settings[key] = false
		task.defer(function() pcall(function() element:Set(false) end) end)
		Notify("Auto Skill Check", "ปิด Auto Skill Check ก่อน", "alert-triangle", 3, true)
		return true
	end
	return false
end

local fontNames = { "GothamBold", "Gotham", "GothamMedium", "SourceSansBold", "Arcade", "Code", "Fantasy", "Highway", "SciFi", "Bangers" }

-- Tabs
local InfoTab = Window:Tab({ Title = "Info", Icon = "info" })
local AutoTab = Window:Tab({ Title = "Automation", Icon = "bot" })
local EspTab = Window:Tab({ Title = "ESP", Icon = "eye" })
local MoveTab = Window:Tab({ Title = "Movement", Icon = "user" })
local CombatTab = Window:Tab({ Title = "Combat", Icon = "sword" })
local VisualTab = Window:Tab({ Title = "Visual", Icon = "sparkles" })
local SettingsTab = Window:Tab({ Title = "Settings", Icon = "settings" })

-- =====================================================
-- Info
-- =====================================================
InfoTab:Section({ Title = "Server Info", Icon = "server", Opened = true })
local infoFps = InfoTab:Input({ Title = "FPS", Placeholder = "...", Icon = "gauge" })
local infoPing = InfoTab:Input({ Title = "Ping (ms)", Placeholder = "...", Icon = "wifi" })
local infoTeam = InfoTab:Input({ Title = "Team", Placeholder = "...", Icon = "users" })
local infoJob = InfoTab:Input({ Title = "Server Job ID", Icon = "hash" })
pcall(function() infoJob:Set(tostring(game.JobId)) end)

RunService.RenderStepped:Connect(function(dt) t2.fps = math.floor(1 / math.max(dt, 1e-3)) end)
task.spawn(function()
	while task.wait(1) do
		pcall(function() infoFps:Set(tostring(t2.fps or "")) end)
		local ok, ping = pcall(function()
			return math.floor(StatsService.Network.ServerStatsItem["Data Ping"]:GetValue())
		end)
		pcall(function() infoPing:Set(ok and tostring(ping) or "N/A") end)
		pcall(function() infoTeam:Set(t3.getMyTeamType()) end)
	end
end)

InfoTab:Section({ Title = "Actions", Icon = "zap", Opened = true })
local infoRow = InfoTab:HStack()
infoRow:Button({
	Title = "Rejoin",
	Desc = "รีจอยออกเข้าใหม่",
	Justify = "Center",
	Icon = "rotate-cw",
	Callback = function()
		pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer) end)
	end,
})
infoRow:Button({
	Title = "Server Hop",
	Desc = "หาเชิฟใหม่",
	Justify = "Center",
	Icon = "shuffle",
	Callback = function() t3.serverHop() end,
})

-- =====================================================
-- ESP
-- =====================================================
EspTab:Section({ Title = "Player ESP", Icon = "eye", Opened = true })

Link("PlayerESP", EspTab:Toggle({
	Title = "Player ESP",
	Desc = "มองผู้เล่น",
	Value = t2.Settings.PlayerESP,
	Callback = function(v) t2.Settings.PlayerESP = v end,
}), "PlayerESP")

Link("ShowNames", EspTab:Toggle({
	Title = "Show Names",
	Desc = "มองชื่อผู้เล่น",
	Value = t2.Settings.ShowNames,
	Callback = function(v) t2.Settings.ShowNames = v end,
}), "ShowNames")

Link("NameOffset", EspTab:Slider({
	Title = "Name Offset",
	Desc = "",
	Step = 0.5,
	Value = { Min = -10, Max = 10, Default = t2.NameSettings.OffsetY },
	Callback = function(v) t3.applyNameOffset(v) end,
}))

EspTab:Dropdown({
	Title = "Name Font",
	Desc = "",
	Values = fontNames,
	Value = t2.NameSettings.Font.Name,
	Callback = function(v) t3.applyNameFont(Enum.Font[v]) end,
})

Link("ShowDistance", EspTab:Toggle({
	Title = "Show Distance",
	Desc = "โชว์ระยะห่างผู้เล่น",
	Value = t2.Settings.ShowDistance,
	Callback = function(v) t2.Settings.ShowDistance = v end,
}), "ShowDistance")

Link("DistOffset", EspTab:Slider({
	Title = "Distance Offset",
	Desc = "ปรับระยะ",
	Step = 0.5,
	Value = { Min = -10, Max = 10, Default = t2.DistSettings.OffsetY },
	Callback = function(v) t3.applyDistOffset(v) end,
}))

EspTab:Dropdown({
	Title = "Distance Font",
	Desc = "เลือกฟอนต์",
	Values = fontNames,
	Value = t2.DistSettings.Font.Name,
	Callback = function(v) t3.applyDistFont(Enum.Font[v]) end,
})
EspTab:Divider()

EspTab:Section({ Title = "Lives", Icon = "heart", Opened = true })

Link("LivesESP", EspTab:Toggle({
	Title = "Lives ESP",
	Desc = "มองชีวิตผู้เล่น",
	Value = t2.Settings.LivesESP,
	Callback = function(v)
		t2.Settings.LivesESP = v
		if v then return end
		for _, data in pairs(t2.livesData) do
			if data.bgui and data.bgui.Parent then data.bgui.Enabled = false end
		end
	end,
}), "LivesESP")

Link("HeartSize", EspTab:Slider({
	Title = "Heart Size",
	Desc = "ปรับระยุหัวใจ",
	Value = { Min = 6, Max = 20, Default = t2.LivesSettings.HeartSize },
	Callback = function(v) t3.applyLivesSize(v) end,
}))

Link("HeartHeight", EspTab:Slider({
	Title = "Heart Height",
	Desc = "ปรับความสูงหัวใจ",
	Value = { Min = -12, Max = 12, Default = t2.LivesSettings.OffsetY },
	Callback = function(v) t3.applyLivesOffsetY(v) end,
}))

Link("HeartTilt", EspTab:Slider({
	Title = "Heart Tilt",
	Desc = "ห่าไรไม่รู้",
	Value = { Min = -10, Max = 10, Default = t2.LivesSettings.OffsetX },
	Callback = function(v) t3.applyLivesOffsetX(v) end,
}))
EspTab:Divider()

EspTab:Section({ Title = "World", Icon = "map", Opened = true })

Link("ExitESP", EspTab:Toggle({
	Title = "Exit ESP",
	Desc = "มองทางออก",
	Value = t2.Settings.ExitESP,
	Callback = function(v)
		t2.Settings.ExitESP = v
		t3.updateExitESP()
	end,
}), "ExitESP")

Link("LootESP", EspTab:Toggle({
	Title = "Loot ESP",
	Desc = "มองขยะ",
	Value = t2.Settings.LootESP,
	Callback = function(v)
		t2.Settings.LootESP = v
		t3.updateLootESP()
	end,
}), "LootESP")

-- =====================================================
-- Auto
-- =====================================================
AutoTab:Section({ Title = "Auto Farm", Icon = "coins", Opened = true })

Link("AutoHS", AutoTab:Toggle({
	Title = "Auto Skill Check",
	Desc = "ออโต้เล่นเอง",
	Value = t2.Settings.AutoHS,
	Callback = function(v)
		if v then
			for _, key in ipairs({ "AutoFarmLoot", "AutoRevive", "AutoSelfRevive", "KillerSafety", "AutoEscape", "GhostMode" }) do
				t3.setToggleState(key, false)
			end
			t3.startAutoHS()
		else
			t3.stopAutoHS()
		end
	end,
}), "AutoHS")

local autoFarmToggle
autoFarmToggle = AutoTab:Toggle({
	Title = "Auto Farm Loot",
	Desc = "ออโต้ฟาร์มขยะ",
	Value = t2.Settings.AutoFarmLoot,
	Callback = function(v)
		if Blocked("AutoFarmLoot", v, autoFarmToggle) then return end
		t2.Settings.AutoFarmLoot = v
		if v then t3.startAutoFarm() else t2.Fl.autoFarmRunning = false end
	end,
})
Link("AutoFarmLoot", autoFarmToggle, "AutoFarmLoot")

Link("FarmSpeed", AutoTab:Slider({
	Title = "Farm Speed %",
	Desc = "ความเร็วการฟาร์ม",
	Value = { Min = 0, Max = 180, Default = t2.farmSpeedPct },
	Callback = function(v)
		t2.farmSpeedPct = v
		t2.farmCollectDelay = t3.pctToDelay(v)
	end,
}))
AutoTab:Divider()

AutoTab:Section({ Title = "Revive", Icon = "heart-pulse", Opened = true })

local autoReviveToggle
autoReviveToggle = AutoTab:Toggle({
	Title = "Auto Revive",
	Desc = "ออโต้ชุบเพื่อน",
	Value = t2.Settings.AutoRevive,
	Callback = function(v)
		if Blocked("AutoRevive", v, autoReviveToggle) then return end
		t2.Settings.AutoRevive = v
		if v then
			t3.startAutoRevive()
			if t2.Settings.KillerSafety and not t2.Cn.killerSafety then t3.startKillerSafety() end
		else
			t3.stopAutoRevive()
		end
	end,
})
Link("AutoRevive", autoReviveToggle, "AutoRevive")

local selfReviveToggle
selfReviveToggle = AutoTab:Toggle({
	Title = "Auto Self Revive",
	Desc = "ออโต้ชุบตัวเอง",
	Value = t2.Settings.AutoSelfRevive,
	Callback = function(v)
		if Blocked("AutoSelfRevive", v, selfReviveToggle) then return end
		t2.Settings.AutoSelfRevive = v
		if v then t3.startAutoSelfRevive() else t3.stopAutoSelfRevive() end
	end,
})
Link("AutoSelfRevive", selfReviveToggle, "AutoSelfRevive")

AutoTab:Button({
	Title = "Revive Myself",
	Desc = "ชุบตัวเองมั้ง",
	Icon = "heart-pulse",
	Justify = "Center",
	Callback = function() t3.reviveMySelf() end,
})
AutoTab:Divider()

AutoTab:Section({ Title = "Safety / Escape", Icon = "shield", Opened = true })

local killerSafetyToggle
killerSafetyToggle = AutoTab:Toggle({
	Title = "Killer Safety",
	Desc = "หนีจากนักฆ่า",
	Value = t2.Settings.KillerSafety,
	Callback = function(v)
		if Blocked("KillerSafety", v, killerSafetyToggle) then return end
		t2.Settings.KillerSafety = v
		if v then t3.startKillerSafety() else t3.stopKillerSafety() end
	end,
})
Link("KillerSafety", killerSafetyToggle, "KillerSafety")

Link("SafetyDistance", AutoTab:Slider({
	Title = "Safety Distance",
	Desc = "ปรับระยะ",
	Value = { Min = 0, Max = 150, Default = t2.Fl.killerSafetyDist },
	Callback = function(v) t2.Fl.killerSafetyDist = v end,
}))

local autoEscapeToggle
autoEscapeToggle = AutoTab:Toggle({
	Title = "Auto Escape",
	Desc = "ออโต้อะไรว่ะ",
	Value = t2.Settings.AutoEscape,
	Callback = function(v)
		if Blocked("AutoEscape", v, autoEscapeToggle) then return end
		t2.Settings.AutoEscape = v
		if v then t3.startAutoEscape() else t3.stopAutoEscape() end
	end,
})
Link("AutoEscape", autoEscapeToggle, "AutoEscape")

local escapeRow = AutoTab:HStack()
escapeRow:Button({
	Title = "TP to Exit",
	Desc = "วาร์ปเข้าประตูทางออก",
	Justify = "Center",
	Icon = "door-open",
	Callback = function() t3.teleportToNearestExit() end,
})
escapeRow:Button({
	Title = "TP to Survivor",
	Desc = "วาร์ปไปไหน",
	Justify = "Center",
	Icon = "users",
	Callback = function() t3.teleportToRandomSurvivor() end,
})
AutoTab:Divider()

AutoTab:Section({ Title = "Utility", Icon = "wrench", Opened = true })

Link("AntiAFK", AutoTab:Toggle({
	Title = "Anti AFK",
	Desc = "กันโดนเตะ",
	Value = t2.Settings.AntiAFK,
	Callback = function(v)
		t2.Settings.AntiAFK = v
		if v then t3.startAntiAFK() else t3.stopAntiAFK() end
	end,
}), "AntiAFK")

-- =====================================================
-- Movement
-- =====================================================
MoveTab:Section({ Title = "LocalPlayer", Icon = "user", Opened = true })

Link("SpeedEnabled", MoveTab:Toggle({
	Title = "Speed Boost",
	Desc = "เพิ่มความเร็ว",
	Value = t2.Settings.SpeedEnabled,
	Callback = function(v)
		t2.Settings.SpeedEnabled = v
		local character = t1.LocalPlayer.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if humanoid then humanoid.WalkSpeed = v and t2.Fl.currentSpeed or 16 end
		if t2.Cn.speed then
			t2.Cn.speed:Disconnect()
			t2.Cn.speed = nil
		end
		if not v then return end
		t2.Cn.speed = t1.RunService.Heartbeat:Connect(function()
			if not t2.Settings.SpeedEnabled then return end
			local char = t1.LocalPlayer.Character
			local hum = char and char:FindFirstChildOfClass("Humanoid")
			if hum and hum.WalkSpeed ~= t2.Fl.currentSpeed then hum.WalkSpeed = t2.Fl.currentSpeed end
		end)
	end,
}), "SpeedEnabled")

Link("WalkSpeed", MoveTab:Slider({
	Title = "Walk Speed",
	Desc = "ปรับความเร็ว",
	Value = { Min = 16, Max = 300, Default = t2.Fl.currentSpeed },
	Callback = function(v)
		t2.Fl.currentSpeed = v
		if not t2.Settings.SpeedEnabled then return end
		local character = t1.LocalPlayer.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if humanoid then humanoid.WalkSpeed = v end
	end,
}))

Link("JumpBoost", MoveTab:Toggle({
	Title = "Jump Boost",
	Desc = "เพิ่มกระโดดสูง",
	Value = t2.Settings.JumpBoost,
	Callback = function(v)
		t2.Settings.JumpBoost = v
		if v then t3.startJumpBoost() else t3.stopJumpBoost() end
	end,
}), "JumpBoost")

Link("JumpPower", MoveTab:Slider({
	Title = "Jump Power",
	Desc = "ปรับกระโดดสูง",
	Value = { Min = 1, Max = 300, Default = t2.Fl.jumpPower },
	Callback = function(v)
		t2.Fl.jumpPower = v
		if not t2.Settings.JumpBoost then return end
		local character = t1.LocalPlayer.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if humanoid then humanoid.JumpPower = v end
	end,
}))
MoveTab:Divider()

MoveTab:Section({ Title = "Flight & Jump", Icon = "plane", Opened = true })

Link("FlyEnabled", MoveTab:Toggle({
	Title = "Fly",
	Desc = "บิน",
	Value = t2.Settings.FlyEnabled,
	Callback = function(v)
		t2.Settings.FlyEnabled = v
		if v then t3.startFly() else t3.stopFly() end
	end,
}), "FlyEnabled")

Link("FlySpeed", MoveTab:Slider({
	Title = "Fly Speed",
	Desc = "ปรับความเร็วบิน",
	Value = { Min = 10, Max = 300, Default = t2.Fl.flySpeed },
	Callback = function(v) t2.Fl.flySpeed = v end,
}))

Link("InfiniteJump", MoveTab:Toggle({
	Title = "Infinite Jump",
	Desc = "กระโดดไม่จำกัด",
	Value = t2.Settings.InfiniteJump,
	Callback = function(v)
		t2.Settings.InfiniteJump = v
		if v then t3.startInfiniteJump() else t3.stopInfiniteJump() end
	end,
}), "InfiniteJump")

Link("DoubleJump", MoveTab:Toggle({
	Title = "Double Jump",
	Desc = "กระโดด2ครั้ง",
	Value = t2.Settings.DoubleJump,
	Callback = function(v)
		t2.Settings.DoubleJump = v
		if v then t3.setupDoubleJump() end
	end,
}), "DoubleJump")
MoveTab:Divider()

MoveTab:Section({ Title = "Other", Icon = "ghost", Opened = true })

Link("Noclip", MoveTab:Toggle({
	Title = "Noclip",
	Desc = "ทำลุกำแพง",
	Value = t2.Settings.Noclip,
	Callback = function(v)
		t2.Settings.Noclip = v
		if v then t3.startNoclip() else t3.stopNoclip() end
	end,
}), "Noclip")

local ghostToggle
ghostToggle = MoveTab:Toggle({
	Title = "Ghost Mode",
	Desc = "โหมดผี",
	Value = t2.Settings.GhostMode,
	Callback = function(v)
		if Blocked("GhostMode", v, ghostToggle) then return end
		t2.Settings.GhostMode = v
		t3.toggleGhostMode(v)
	end,
})
Link("GhostMode", ghostToggle, "GhostMode")

Link("ShiftLock", MoveTab:Toggle({
	Title = "Shift Lock",
	Desc = "ชิปล็อค",
	Value = t2.Settings.ShiftLock,
	Callback = function(v)
		t2.Settings.ShiftLock = v
		if v then t3.startShiftLock() else t3.stopShiftLock() end
	end,
}), "ShiftLock")

-- =====================================================
-- Combat
-- =====================================================
CombatTab:Section({ Title = "Killer", Icon = "sword", Opened = true })

Link("KillAll", CombatTab:Toggle({
	Title = "Kill All",
	Desc = "ฆ่าทั้งหมด",
	Value = t2.Settings._killAll,
	Callback = function(v)
		t2.Settings._killAll = v
		if v then t3.startKillAll() else t3.stopKillAll() end
	end,
}), "_killAll")

Link("Hitbox", CombatTab:Toggle({
	Title = "Hitbox Expander",
	Desc = "ขยาบระยะโจมตี",
	Value = t2.Settings.Hitbox,
	Callback = function(v)
		t2.Settings.Hitbox = v
		if v then t3.startHitbox() else t3.stopHitbox() end
	end,
}), "Hitbox")

Link("HitboxDistance", CombatTab:Slider({
	Title = "Hitbox Distance",
	Desc = "ปรับขนาดระยะโจมตี",
	Value = { Min = 5, Max = 50, Default = t2.Fl.hitboxRadius },
	Callback = function(v) t2.Fl.hitboxRadius = v end,
}))

-- =====================================================
-- Visual
-- =====================================================
VisualTab:Section({ Title = "Environment", Icon = "sun", Opened = true })

Link("RemoveFog", VisualTab:Toggle({
	Title = "Remove Fog",
	Desc = "ลบหมอก",
	Value = t2.Settings.RemoveFog,
	Callback = function(v)
		t2.Settings.RemoveFog = v
		if v then t3.enableFogRemoval() else t3.disableFogRemoval() end
	end,
}), "RemoveFog")

Link("FpsBoost", VisualTab:Toggle({
	Title = "FPS Boost",
	Desc = "บูสต์FPS",
	Value = t2.Settings.FpsBoost,
	Callback = function(v)
		t2.Settings.FpsBoost = v
		if v then t3.startFpsBoost() else t3.stopFpsBoost() end
	end,
}), "FpsBoost")
VisualTab:Divider()

VisualTab:Section({ Title = "Animations", Icon = "person-standing", Opened = true })

Link("SnowAnimation", VisualTab:Toggle({
	Title = "Snowman Animation",
	Desc = "อนิเมชั่นสโนว์แมน",
	Value = t2.Settings.SnowAnimation,
	Callback = function(v)
		t2.Settings.SnowAnimation = v
		t3.setActiveAnim(v and "Snowman" or nil)
	end,
}), "SnowAnimation")

Link("RoyalAnimation", VisualTab:Toggle({
	Title = "Royal Animation",
	Desc = "อนิเมชั่นรอยัล",
	Value = t2.Settings.RoyalAnimation,
	Callback = function(v)
		t2.Settings.RoyalAnimation = v
		t3.setActiveAnim(v and "Royal" or nil)
	end,
}), "RoyalAnimation")

Link("NinjaAnimation", VisualTab:Toggle({
	Title = "Ninja Animation",
	Desc = "อนิเมชั่นนินจา",
	Value = t2.Settings.NinjaAnimation,
	Callback = function(v)
		t2.Settings.NinjaAnimation = v
		t3.setActiveAnim(v and "Ninja" or nil)
	end,
}), "NinjaAnimation")

-- ==========================================
-- Settings Tab
-- ==========================================
SettingsTab:Section({ Title="Window", Icon="panel-top", Opened=true })

local WindowKeybind = SettingsTab:Keybind({
    Title="Open / Close Keybind", Desc="เปลี่ยนปุ่มที่ใช้เปิดปิดเมนู",
    Value=CurrentKey,
    Callback=function(value)
        if type(value) ~= "string" then return end
        local key = value:upper()
        if not Enum.KeyCode[key] then return end
        CurrentKey = key
        Window:SetToggleKey(Enum.KeyCode[key])
        Notify("Keybind Updated", 'WillowHub now uses "'..key..'".', "keyboard", 3)
    end,
})

SettingsTab:Button({ Title="Open Window", Desc="เปิดเมนูทันที", Icon="panel-top-open", Callback=function() Window:Open() end })
SettingsTab:Button({
    Title="Reset Keybind", Desc="รีเซ็ตปุ่มเปิดปิดกลับเป็น U", Icon="rotate-ccw",
    Callback=function()
        CurrentKey = DEFAULT_KEY
        Window:SetToggleKey(Enum.KeyCode.U)
        WindowKeybind:Set("U")
        Notify("Keybind Reset", 'WillowHub is now using "U".', "keyboard", 3)
    end,
})
SettingsTab:Divider()

SettingsTab:Section({ Title="Themes", Icon="palette", Opened=true })

local ThemeDropdown = SettingsTab:Dropdown({
    Title="Theme", Desc="เลือกธีมสีของเมนู",
    Values={"Willow Rose","Willow Noir","Willow Crimson","Willow Midnight","Willow Violet","Willow Ocean","Willow Emerald","Willow Ember"},
    Value=DEFAULT_THEME,
    Callback=function(value)
        if not Themes[value] then return end
        CurrentTheme = value
        WindUI:SetTheme(value)
        ApplyOpenButtonTheme(value)
        ApplyTagTheme(value)
        Notify("Theme Changed", value.." applied.", "palette", 3)
    end,
})

SettingsTab:Paragraph({ Title="Willow Glass", Desc="ทุกธีมใช้สไตล์กระจกโปร่งใสเหมือนกัน เปลี่ยนแค่สีหลัก", Icon="sparkles" })
SettingsTab:Divider()

SettingsTab:Section({ Title="Notifications", Icon="bell", Opened=true })

local SilenceToggle = SettingsTab:Toggle({
    Title="Silence Notifications", Desc="ปิดการแจ้งเตือนทั้งหมดของเมนู",
    Icon="bell-off", Value=false,
    Callback=function(value) NotificationsSilenced = value == true end,
})

SettingsTab:Paragraph({ Title="Reopen Notification", Desc="การแจ้งเตือนเปิดเมนูยังแสดงอยู่ เพื่อเตือนปุ่มที่ใช้", Icon="message-square-warning" })
SettingsTab:Divider()

SettingsTab:Section({ Title="Configs", Icon="folder-cog", Opened=true })

local ConfigManager = Window.ConfigManager
local ConfigName    = "Default"

local ConfigNameInput = SettingsTab:Input({
    Title="Config Name", Desc="ตั้งชื่อ Config ที่จะบันทึกหรือโหลด",
    Icon="file-cog", Value=ConfigName, Placeholder="MyConfig",
    Callback=function(value) if value and value ~= "" then ConfigName = value end end,
})

local function CreateConfig(name)
    local config = ConfigManager:CreateConfig(name)
    config:Register("WillowKeybind",          WindowKeybind)
    config:Register("SilenceNotifications",   SilenceToggle)
    return config
end

local function GetConfigs()
    local ok, configs = pcall(function() return ConfigManager:AllConfigs() end)
    if not ok or type(configs) ~= "table" or #configs == 0 then return {"No configs"} end
    table.sort(configs); return configs
end

local ConfigDropdown = SettingsTab:Dropdown({
    Title="Saved Configs", Desc="เลือก Config ที่บันทึกไว้",
    Values=GetConfigs(), Value="No configs",
    Callback=function(value)
        if value == "No configs" then SelectedConfig = nil; return end
        SelectedConfig = value; ConfigName = value; ConfigNameInput:Set(value)
    end,
})

local function RefreshConfigDropdown()
    pcall(function() ConfigDropdown:Refresh(GetConfigs()) end)
end

SettingsTab:Button({
    Title="Save Config", Desc="บันทึกการตั้งค่าปัจจุบัน", Icon="save",
    Callback=function()
        if not ConfigName or ConfigName == "" then Notify("Config", "Enter a config name first.", "triangle-alert", 3); return end
        local name = ConfigName:gsub("[^%w_%-%s]", "")
        if name == "" then Notify("Config", "Invalid config name.", "triangle-alert", 3); return end
        local ok, err = pcall(function() CreateConfig(name):Save() end)
        if not ok then Notify("Config Error", tostring(err), "triangle-alert", 4); return end
        SelectedConfig = name; RefreshConfigDropdown()
        Notify("Config Saved", "Saved "..name..".", "save", 3)
    end,
})
SettingsTab:Button({
    Title="Load Config", Desc="โหลด Config ที่เลือกไว้", Icon="folder-open",
    Callback=function()
        local name = SelectedConfig or ConfigName
        if not name or name == "" or name == "No configs" then Notify("Config", "Select or enter a config first.", "triangle-alert", 3); return end
        local ok, err = pcall(function() CreateConfig(name):Load() end)
        if not ok then Notify("Config Error", tostring(err), "triangle-alert", 4); return end
        CurrentKey = WindowKeybind.Value or CurrentKey
        if type(CurrentKey) == "string" and Enum.KeyCode[CurrentKey] then
            Window:SetToggleKey(Enum.KeyCode[CurrentKey])
        end
        NotificationsSilenced = SilenceToggle.Value == true
        Notify("Config Loaded", "Loaded "..name..".", "folder-open", 3)
    end,
})
SettingsTab:Button({
    Title="Delete Config", Desc="ลบ Config ที่เลือกไว้", Icon="trash-2",
    Callback=function()
        local name = SelectedConfig or ConfigName
        if not name or name == "" or name == "No configs" then Notify("Config", "Select a config first.", "triangle-alert", 3); return end
        local ok, err = pcall(function() CreateConfig(name):Delete() end)
        if not ok then Notify("Config Error", tostring(err), "triangle-alert", 4); return end
        SelectedConfig = nil; RefreshConfigDropdown()
        Notify("Config Deleted", "Deleted "..name..".", "trash-2", 3)
    end,
})
SettingsTab:Button({
    Title="Refresh Configs", Desc="รีเฟรชรายการ Config ที่บันทึกไว้", Icon="refresh-cw",
    Callback=function() RefreshConfigDropdown(); Notify("Configs", "Configuration list refreshed.", "refresh-cw", 3) end,
})  

Window:OnClose(function()
	task.delay(0.2, ReopenNotify)
end)

InfoTab:Select()
