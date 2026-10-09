local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local userInputService = game:GetService("UserInputService")
local soundService = game:GetService("SoundService")
local coreGui = game:GetService("CoreGui")
local teleportService = game:GetService("TeleportService")
local players = game:GetService("Players")
local count = 0
local connect = runService.Heartbeat:Connect(function()
    count = count + 1
end
)
while true do
    task.wait()
    if count >= 2 then
        break
    end
end
connect:Disconnect()
local localPlayer = players.LocalPlayer
local v2 = {
}
local function f1()
    local v3 = {
        [114234929420010] = "https://api.luarmor.net/files/v4/loaders/a6f8cbca903243bdb94b33abb91d79fe.lua",
        [87541610558346] = "https://api.luarmor.net/files/v4/loaders/20a9035862e40ad1b2594a92454330af.lua",
        [88844433068528] = "https://api.luarmor.net/files/v4/loaders/20a9035862e40ad1b2594a92454330af.lua",
    }
    local v4 = {
        [114234929420007] = "BloxStrike",
        [87541610558346] = "血债PVP",
        [88844433068528] = "血债PVP(移动端)",
    }
    local placeId = game.PlaceId
    return {
        loader = function()
            return v3[placeId] or v3[114234929420010]
        end
,
        gameName = function()
            return v4[placeId] or "未知服务器"
        end
,
        supported = function()
            return v3[placeId] ~=  nil
        end
,
        placeId = placeId,
    }
end
local v5 = f1()
local v6 = {
    {
        name = "His Theme",
        file = "His%20Theme.mp3",
        cache = "NERXLogin/bgm_1.mp3"
    },
    {
        name = "Hopes And",
        file = "Hopes%20And.mp3",
        cache = "NERXLogin/bgm_2.mp3"
    },
    {
        name = "Last Goodbye",
        file = "Last%20Goodbye.mp3",
        cache = "NERXLogin/bgm_3.mp3"
    },
    {
        name = "Once Upon A Time",
        file = "Once%20Upon%20A%20Time.mp3",
        cache = "NERXLogin/bgm_4.mp3",
    },
    {
        name = "Once Upon A Time2",
        file = "Once%20Upon%20A%20Time2.mp3",
        cache = "NERXLogin/bgm_5.mp3",
    },
}
local v7 = {
    {
        name = "Wec1",
        file = "Wec1.mp3",
        cache = "NERXLogin/wec_1.mp3"
    },
    {
        name = "Wec2",
        file = "Wec2.mp3",
        cache = "NERXLogin/wec_2.mp3"
    },
    {
        name = "Wec3",
        file = "Wec3.mp3",
        cache = "NERXLogin/wec_3.mp3"
    },
    {
        name = "Wec4",
        file = "Wec4.mp3",
        cache = "NERXLogin/wec_4.mp3"
    },
}
local v8 = {
}
for index, value in ipairs(v6) do
    v8[ # v8 + 1] = value
end
for index2, value2 in ipairs(v7) do
    v8[ # v8 + 1] = value2
end
local color = Color3.fromRGB(153, 196, 39)
local color2 = Color3.fromRGB(124, 158, 32)
local color3 = Color3.fromRGB(12, 12, 12)
local color4 = Color3.fromRGB(16, 16, 16)
local color5 = Color3.fromRGB(32, 32, 32)
local color6 = Color3.fromRGB(232, 232, 232)
local color7 = Color3.fromRGB(130, 130, 130)
local color8 = Color3.fromRGB(88, 88, 88)
local color9 = Color3.fromRGB(240, 90, 90)
local color10 = Color3.fromRGB(120, 220, 100)
local touchEnabled =  false
local v9, v10 = pcall(function()
    return userInputService:GetPlatform()
end
)
if v9 and v10 then
    touchEnabled = v10 == Enum.Platform.Android or v10 == Enum.Platform.IOS
end
if not touchEnabled then
    touchEnabled = userInputService.TouchEnabled and not userInputService.MouseEnabled
end
if type(_G.NERX_LOGIN_CLEANUP) == "function" then
    _G.NERX_LOGIN_CLEANUP =  nil
end
localPlayer:FindFirstChild("PlayerGui")
local function f2(p1, p2, p3)
    local create = tweenService:Create(p1, p2, p3)
    create:Play()
    return create
end
local function f3(p4, p5, p6, p7)
    return TweenInfo.new(p4, p5 or Enum.EasingStyle.Quad, p6 or Enum.EasingDirection.Out, p7 or 0,  false, 0)
end
local function f4(p8)
    task.spawn(function()
        local position = p8.Position
        local v11 = 6
        local v12 =  false
        local count2 = 0
        while true do
            count2 = 1 + count2
            if not(v12 and v11 <= count2 or not v12 and count2 <= v11) then
                break
            end
            p8.Position = position + UDim2.fromOffset(count2 % 2 == 0 and 7 or - 7, 0)
            task.wait(0.035)
        end
        p8.Position = position
    end
)
end
local f5
local function f6(p9, p10)
    local v13 = 0
    local function f7()
        if os.clock() - v13 < 0.3 then
            return
        end
        v13 = os.clock()
    end
    f5(p9.Activated, f7)
    f5(p9.InputBegan, function(p11)
        if p11.UserInputType == Enum.UserInputType.Touch or p11.UserInputType == Enum.UserInputType.MouseButton1 then
            f7()
        end
    end
)
end
function f5(p12, p13)
    local connect2 = p12:Connect(p13)
    table.insert(v2, connect2)
    return connect2
end
local color11 = Color3.fromRGB(238, 255, 205)
local function f8()
    local v14, v15 = pcall(function()
        return gethui and gethui()
    end
)
    local playerGui, playerGui2, v16, folder
    if v14 and v15 then
        return v15
    else
        local v17
        v17, v16 = pcall(function()
            return coreGui
        end
)
        if v17 and v16 then
            folder = Instance.new("Folder")
            if pcall(function()
                folder.Parent = v16
            end
) then
                folder:Destroy()
                return v16
            end
            playerGui = localPlayer:FindFirstChild("PlayerGui")
            playerGui2 = playerGui
            playerGui2 = playerGui or localPlayer:WaitForChild("PlayerGui")
            return playerGui2
        end
        playerGui = localPlayer:FindFirstChild("PlayerGui")
        playerGui2 = playerGui
        playerGui2 = playerGui or localPlayer:WaitForChild("PlayerGui")
        return playerGui2
    end
end
local v18 = {
}
local v19 =  false
local function f9()
    if v19 then
        return
    end
    v19 =  true
    task.spawn(function()
        while true do
            local v20 =  - 1 + os.clock() % 3.3 / 3.3 * 3
            local v21 =  # v18
            local v22 =  false
            local count3 = 0
            while true do
                count3 = 1 + count3
                if not(v22 and count3 >= v21 or not v22 and v21 >= count3) then
                    break
                end
                local v23 = v18[count3]
                if v23.g.Parent then
                    v23.g.Offset = Vector2.new(v20 - v23.lag, 0)
                end
            end
            task.wait()
        end
    end
)
end
local function f10(parent, p14)
    local uiGradient = Instance.new("UIGradient")
    uiGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,
        color),
        ColorSequenceKeypoint.new(0.5,
        color11),
        ColorSequenceKeypoint.new(1,
        color),
    }
)
    uiGradient.Offset = Vector2.new( - 1, 0)
    uiGradient.Parent = parent
    v18[ # v18 + 1] = {
        g = uiGradient,
        lag = p14 or 0
    }
    f9()
    return uiGradient
end
local nerxLoginGUI = Instance.new("ScreenGui")
nerxLoginGUI.Name = "NERXLoginGUI"
nerxLoginGUI.ResetOnSpawn =  false
nerxLoginGUI.IgnoreGuiInset =  true
nerxLoginGUI.DisplayOrder = 99999
nerxLoginGUI.ZIndexBehavior = Enum.ZIndexBehavior.Global
if not pcall(function()
    nerxLoginGUI.Parent = f8()
end
) then
    nerxLoginGUI.Parent = localPlayer:WaitForChild("PlayerGui")
end
local function f11(p15, p16, p17)
    local v24 = p16
    v24 = v24 or 0.45
    pcall(function()
        f2(p15, f3(v24), {
            BackgroundTransparency = 1
        }
)
    end
)
    pcall(function()
        for index3, value3 in ipairs(p15:GetDescendants()) do
            if value3:IsA("TextLabel") or value3:IsA("TextButton") or value3:IsA("TextBox") then
                f2(value3, f3(v24), {
                    BackgroundTransparency = 1,
                    TextTransparency = 1
                }
)
            elseif value3:IsA("UIStroke") then
                f2(value3, f3(v24), {
                    Transparency = 1
                }
)
            elseif value3:IsA("ImageLabel") or value3:IsA("ImageButton") then
                f2(value3, f3(v24), {
                    ImageTransparency = 1
                }
)
            elseif value3:IsA("Frame") then
                f2(value3, f3(v24), {
                    BackgroundTransparency = 1
                }
)
            end
        end
    end
)
    if p17 then
        task.delay(v24, p17)
    end
end
local v25 = pcall(function()
    Instance.new("CanvasGroup"):Destroy()
end
)
local function f12(name, parent2, p18)
    if v25 and not p18 then
        local canvasGroup = Instance.new("CanvasGroup")
        canvasGroup.Name = name
        canvasGroup.BackgroundTransparency = 1
        canvasGroup.Parent = parent2
        return canvasGroup
    else
        local frame = Instance.new("Frame")
        frame.Name = name
        frame.BackgroundTransparency = 1
        frame.Parent = parent2
        return frame
    end
end
local currentCamera = workspace.CurrentCamera
local viewportSize = currentCamera and currentCamera.ViewportSize
local vector = viewportSize
vector = viewportSize or Vector2.new(1170, 2532)
local v26 = 232
local v27 = 400
if touchEnabled then
    v27 = math.min(400, math.floor(vector.X * 0.92))
    if v26 > vector.Y * 0.8 then
        v26 = math.floor(vector.Y * 0.8)
    end
end
local v28 = f12("Card", nerxLoginGUI)
v28.AnchorPoint = Vector2.new(0.5, 0.5)
v28.Position = UDim2.fromScale(0.5, 0.5)
v28.Size = UDim2.fromOffset(v27, v26)
v28.BackgroundColor3 = color3
v28.BackgroundTransparency = 0
v28.Visible =  false
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(28, 28, 28)
uiStroke.Thickness = 3
uiStroke.Parent = v28
local uiStroke2 = Instance.new("UIStroke")
uiStroke2.Color = Color3.fromRGB(58, 58, 58)
uiStroke2.Thickness = 1
uiStroke2.Transparency = 0.4
uiStroke2.Parent = v28
local uiStroke3 = Instance.new("UIStroke")
uiStroke3.Color = color
uiStroke3.Thickness = 1
uiStroke3.Transparency = 0.82
uiStroke3.Parent = v28
local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, 4)
topBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
topBar.BorderSizePixel = 0
topBar.ZIndex = 2
topBar.Parent = v28
local uiGradient2 = Instance.new("UIGradient")
uiGradient2.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0,
    Color3.fromRGB(255,
    80,
    80)),
    ColorSequenceKeypoint.new(0.17,
    Color3.fromRGB(255,
    200,
    70)),
    ColorSequenceKeypoint.new(0.33,
    Color3.fromRGB(110,
    230,
    110)),
    ColorSequenceKeypoint.new(0.5,
    Color3.fromRGB(70,
    200,
    255)),
    ColorSequenceKeypoint.new(0.67,
    Color3.fromRGB(140,
    110,
    255)),
    ColorSequenceKeypoint.new(0.83,
    Color3.fromRGB(255,
    90,
    200)),
    ColorSequenceKeypoint.new(1,
    Color3.fromRGB(255,
    80,
    80)),
}
)
uiGradient2.Offset = Vector2.new( - 1, 0)
uiGradient2.Parent = topBar
local header = Instance.new("Frame")
header.Name = "Header"
header.BackgroundTransparency = 1
header.Size = UDim2.new(1, 0, 0, 54)
header.ZIndex = 2
header.Parent = v28
local logo = Instance.new("TextLabel")
logo.Name = "Logo"
logo.BackgroundTransparency = 1
logo.Position = UDim2.fromOffset(20, 10)
logo.Size = UDim2.fromOffset(200, 34)
logo.Font = Enum.Font.GothamBlack
logo.RichText =  true
logo.Text = "NERX <font size=\"15\">beta</font> <font size=\"10\">V3.2</font>"
logo.TextColor3 = Color3.fromRGB(255, 255, 255)
logo.TextSize = 26
logo.TextXAlignment = Enum.TextXAlignment.Left
logo.ZIndex = 2
logo.Parent = header
f10(logo)
local textLabel = Instance.new("TextLabel")
textLabel.BackgroundTransparency = 1
textLabel.Position = UDim2.new(1,  - 20, 0, 0)
textLabel.AnchorPoint = Vector2.new(1, 0)
textLabel.Size = UDim2.fromOffset(230, 54)
textLabel.Font = Enum.Font.Gotham
textLabel.Text = "当前服务器: "..v5.gameName()
textLabel.TextColor3 = color8
textLabel.TextSize = 11
textLabel.TextXAlignment = Enum.TextXAlignment.Right
textLabel.TextTruncate = Enum.TextTruncate.AtEnd
textLabel.ZIndex = 2
textLabel.Parent = header
f10(textLabel, 0.12)
local frame2 = Instance.new("Frame")
frame2.BackgroundColor3 = color5
frame2.BorderSizePixel = 0
frame2.Position = UDim2.fromOffset(0, 54)
frame2.Size = UDim2.new(1, 0, 0, 1)
frame2.ZIndex = 2
frame2.Parent = v28
local textLabel2 = Instance.new("TextLabel")
textLabel2.BackgroundTransparency = 1
textLabel2.Position = UDim2.fromOffset(20, 62)
textLabel2.Size = UDim2.new(1,  - 40, 0, 18)
textLabel2.Font = Enum.Font.Gotham
textLabel2.Text = "请输入卡密以访问 NERX 服务"
textLabel2.TextColor3 = color7
textLabel2.TextSize = 12
textLabel2.TextXAlignment = Enum.TextXAlignment.Left
textLabel2.ZIndex = 2
textLabel2.Parent = v28
local function f13(p19)
end
local function f14()
    if not(readfile and isfile) then
        return ""
    else
        local v29, v30 = pcall(isfile, "NERXLogin/key.txt")
        if not(v29 and v30) then
            return ""
        else
            local v31, v32 = pcall(readfile, "NERXLogin/key.txt")
            if not(v31 and type(v32) == "string") then
                return ""
            end
            return tostring(v32):gsub("%s", "")
        end
    end
end
local inputBox = Instance.new("Frame")
inputBox.Name = "InputBox"
inputBox.Position = UDim2.fromOffset(20, 90)
inputBox.Size = UDim2.new(1,  - 40, 0, 40)
inputBox.BackgroundColor3 = color4
inputBox.BorderSizePixel = 0
inputBox.ZIndex = 2
inputBox.Parent = v28
local uiStroke4 = Instance.new("UIStroke")
uiStroke4.Color = color5
uiStroke4.Thickness = 1
uiStroke4.Parent = inputBox
local keyInput = Instance.new("TextBox")
keyInput.Name = "KeyInput"
keyInput.BackgroundTransparency = 1
keyInput.Position = UDim2.fromOffset(12, 0)
keyInput.Size = UDim2.new(1,  - 24, 1, 0)
keyInput.Font = Enum.Font.Code
keyInput.Text = ""
keyInput.PlaceholderText = "请粘贴卡密 (Key)"
keyInput.PlaceholderColor3 = Color3.fromRGB(80, 80, 80)
keyInput.TextColor3 = color6
keyInput.TextSize = 14
keyInput.TextXAlignment = Enum.TextXAlignment.Left
keyInput.ClearTextOnFocus =  false
keyInput.ClipsDescendants =  true
keyInput.ZIndex = 3
keyInput.Parent = inputBox
local v33 = f14()
if v33 ~= "" then
    keyInput.Text = v33
end
local loginButton = Instance.new("TextButton")
loginButton.Name = "LoginButton"
loginButton.Position = UDim2.fromOffset(20, 136)
loginButton.Size = UDim2.new(1,  - 146, 0, 42)
loginButton.BackgroundColor3 = color
loginButton.Font = Enum.Font.GothamBold
loginButton.Text = "LOGIN"
loginButton.TextColor3 = Color3.fromRGB(10, 12, 6)
loginButton.TextSize = 15
loginButton.AutoButtonColor =  false
loginButton.BorderSizePixel = 0
loginButton.ZIndex = 2
loginButton.Parent = v28
local saveKeyButton = Instance.new("TextButton")
saveKeyButton.Name = "SaveKeyButton"
saveKeyButton.AnchorPoint = Vector2.new(1, 0)
saveKeyButton.Position = UDim2.new(1,  - 20, 0, 136)
saveKeyButton.Size = UDim2.fromOffset(96, 42)
saveKeyButton.BackgroundColor3 = color4
saveKeyButton.Font = Enum.Font.GothamBold
saveKeyButton.Text = "保存卡密"
saveKeyButton.TextColor3 = color7
saveKeyButton.TextSize = 12
saveKeyButton.AutoButtonColor =  false
saveKeyButton.BorderSizePixel = 0
saveKeyButton.ZIndex = 2
saveKeyButton.Parent = v28
local uiStroke5 = Instance.new("UIStroke")
uiStroke5.Color = color5
uiStroke5.Thickness = 1
uiStroke5.Parent = saveKeyButton
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 3)
uiCorner.Parent = saveKeyButton
local uiCorner2 = Instance.new("UICorner")
uiCorner2.CornerRadius = UDim.new(0, 3)
uiCorner2.Parent = loginButton
local uiGradient3 = Instance.new("UIGradient")
uiGradient3.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0,
    Color3.fromRGB(168,
    214,
    48)),
    ColorSequenceKeypoint.new(1,
    color2),
}
)
uiGradient3.Rotation = 90
uiGradient3.Parent = loginButton
local textLabel3 = Instance.new("TextLabel")
textLabel3.BackgroundTransparency = 1
textLabel3.Position = UDim2.fromOffset(20, 188)
textLabel3.Size = UDim2.new(1,  - 40, 0, 16)
textLabel3.Font = Enum.Font.Gotham
textLabel3.Text = ""
textLabel3.TextColor3 = color7
textLabel3.TextSize = 12
textLabel3.ZIndex = 2
textLabel3.Parent = v28
local textLabel4 = Instance.new("TextLabel")
textLabel4.BackgroundTransparency = 1
textLabel4.AnchorPoint = Vector2.new(1, 1)
textLabel4.Position = UDim2.new(1,  - 14, 1,  - 8)
textLabel4.Size = UDim2.fromOffset(240, 14)
textLabel4.Font = Enum.Font.Gotham
textLabel4.Text = "NERX (C) 2026 | Secure Loader"
textLabel4.TextColor3 = Color3.fromRGB(64, 64, 64)
textLabel4.TextSize = 10
textLabel4.TextXAlignment = Enum.TextXAlignment.Right
textLabel4.ZIndex = 2
textLabel4.Parent = v28
local v34 = touchEnabled and math.min(320, math.floor(vector.X * 0.9)) or 320
local serverPopup = Instance.new("Frame")
serverPopup.Name = "ServerPopup"
serverPopup.AnchorPoint = Vector2.new(0.5, 0.5)
serverPopup.Position = UDim2.new(0.5, 0, 0.5,  - 216)
serverPopup.Size = UDim2.fromOffset(v34, 176)
serverPopup.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
serverPopup.BorderColor3 = Color3.fromRGB(12, 12, 12)
serverPopup.BorderSizePixel = 1
serverPopup.ZIndex = 20
serverPopup.Visible =  false
serverPopup.Parent = nerxLoginGUI
local frame3 = Instance.new("Frame")
frame3.Position = UDim2.fromOffset(1, 1)
frame3.Size = UDim2.new(1,  - 2, 1,  - 2)
frame3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame3.BorderSizePixel = 0
frame3.ZIndex = 21
frame3.Parent = serverPopup
local frame4 = Instance.new("Frame")
frame4.Position = UDim2.fromOffset(1, 1)
frame4.Size = UDim2.new(1,  - 2, 1,  - 2)
frame4.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
frame4.BorderSizePixel = 0
frame4.ZIndex = 22
frame4.Parent = frame3
local imageLabel = Instance.new("ImageLabel")
imageLabel.Image = "rbxassetid://15453092054"
imageLabel.ScaleType = Enum.ScaleType.Tile
imageLabel.TileSize = UDim2.new(0, 4, 0, 548)
imageLabel.BackgroundTransparency = 1
imageLabel.Size = UDim2.new(1, 0, 1, 0)
imageLabel.ZIndex = 22
imageLabel.Parent = frame4
local frame5 = Instance.new("Frame")
frame5.Position = UDim2.fromOffset(1, 1)
frame5.Size = UDim2.new(1,  - 2, 0, 4)
frame5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame5.BorderSizePixel = 0
frame5.ZIndex = 24
frame5.Parent = serverPopup
local uiGradient4 = Instance.new("UIGradient")
uiGradient4.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0,
    Color3.fromRGB(255,
    80,
    80)),
    ColorSequenceKeypoint.new(0.17,
    Color3.fromRGB(255,
    200,
    70)),
    ColorSequenceKeypoint.new(0.33,
    Color3.fromRGB(110,
    230,
    110)),
    ColorSequenceKeypoint.new(0.5,
    Color3.fromRGB(70,
    200,
    255)),
    ColorSequenceKeypoint.new(0.67,
    Color3.fromRGB(140,
    110,
    255)),
    ColorSequenceKeypoint.new(0.83,
    Color3.fromRGB(255,
    90,
    200)),
    ColorSequenceKeypoint.new(1,
    Color3.fromRGB(255,
    80,
    80)),
}
)
uiGradient4.Offset = Vector2.new( - 1, 0)
uiGradient4.Parent = frame5
task.spawn(function()
    pcall(function()
        f2(uiGradient4, f3(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut,  - 1), {
            Offset = Vector2.new(1,
            0),
        }
)
    end
)
end
)
local textLabel5 = Instance.new("TextLabel")
textLabel5.BackgroundTransparency = 1
textLabel5.Position = UDim2.fromOffset(14, 10)
textLabel5.Size = UDim2.new(1,  - 28, 0, 20)
textLabel5.Font = Enum.Font.GothamBlack
textLabel5.RichText =  true
textLabel5.Text = "NERX <font size=\"11\">beta</font> <font size=\"9\">V3.2</font>"
textLabel5.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel5.TextSize = 15
textLabel5.TextXAlignment = Enum.TextXAlignment.Left
textLabel5.ZIndex = 23
textLabel5.Parent = frame4
f10(textLabel5, 0.06)
local textLabel6 = Instance.new("TextLabel")
textLabel6.BackgroundTransparency = 1
textLabel6.Position = UDim2.fromOffset(14, 36)
textLabel6.Size = UDim2.new(1,  - 28, 0, 52)
textLabel6.Font = Enum.Font.Gotham
textLabel6.Text = "您当前服务器不是我们所支持的服务器列表\n请选择下面两个服务器，点击即传送"
textLabel6.TextColor3 = color7
textLabel6.TextSize = 12
textLabel6.TextWrapped =  true
textLabel6.TextXAlignment = Enum.TextXAlignment.Left
textLabel6.TextYAlignment = Enum.TextYAlignment.Top
textLabel6.ZIndex = 23
textLabel6.Parent = frame4
local v35 = math.floor((v34 - 38) / 2)
local function f15(p20, p21, p22)
    local textButton = Instance.new("TextButton")
    textButton.Name = "Tp_"..p20
    textButton.Position = UDim2.new(0, 14 + p21, 0, 112)
    textButton.Size = UDim2.fromOffset(v35, 44)
    textButton.BackgroundColor3 = color4
    textButton.Font = Enum.Font.GothamBold
    textButton.Text = p20
    textButton.TextColor3 = color6
    textButton.TextSize = 13
    textButton.AutoButtonColor =  false
    textButton.BorderSizePixel = 0
    textButton.ZIndex = 23
    textButton.Parent = frame4
    local uiStroke6 = Instance.new("UIStroke")
    uiStroke6.Color = color5
    uiStroke6.Thickness = 1
    uiStroke6.Parent = textButton
    f6(textButton, function()
        textButton.Text = "正在传送..."
        task.delay(0.25, function()
            pcall(function()
                teleportService:Teleport(p22, localPlayer)
            end
)
            textButton.Text = "传送失败"
            task.delay(1.5, function()
                textButton.Text = p20
            end
)
        end
)
    end
)
    if not touchEnabled then
        f5(textButton.MouseEnter, function()
            f2(textButton, f3(0.15), {
                BackgroundColor3 = Color3.fromRGB(32,
                32,
                32)
            }
)
        end
)
        f5(textButton.MouseLeave, function()
            f2(textButton, f3(0.15), {
                BackgroundColor3 = color4
            }
)
        end
)
    end
end
f15("BloxStrike", 0, 114234929420010)
f15("血债PVP", v35 + 10, 87541610558346)
local uiScale = Instance.new("UIScale")
uiScale.Scale = 0.5
uiScale.Parent = serverPopup
local function f16()
    if v5.supported() then
        return
    end
    if serverPopup.Visible then
        return
    end
    serverPopup.Visible =  true
    uiScale.Scale = 0.5
    pcall(function()
        f2(uiScale, f3(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Scale = 1
        }
)
    end
)
end
local v36 = f12("Cover", nerxLoginGUI,  true)
v36.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
v36.BackgroundTransparency = 0
v36.Size = UDim2.fromScale(1, 1)
v36.ZIndex = 10
local textLabel7 = Instance.new("TextLabel")
textLabel7.BackgroundTransparency = 1
textLabel7.AnchorPoint = Vector2.new(0.5, 0.5)
textLabel7.Position = UDim2.fromScale(0.5, 0.44)
textLabel7.Font = Enum.Font.GothamBlack
textLabel7.Text = "NERX"
textLabel7.RichText =  true
textLabel7.Text = "NERX <font size=\"36\">beta</font> <font size=\"24\">V3.2</font>"
textLabel7.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel7.TextSize = 64
textLabel7.Size = UDim2.fromOffset(560, 90)
textLabel7.ZIndex = 11
textLabel7.Parent = v36
f10(textLabel7)
local uiStroke7 = Instance.new("UIStroke")
uiStroke7.Color = color
uiStroke7.Thickness = 2
uiStroke7.Transparency = 0.15
uiStroke7.Parent = textLabel7
local uiScale2 = Instance.new("UIScale")
uiScale2.Scale = 0.4
uiScale2.Parent = textLabel7
local textLabel8 = Instance.new("TextLabel")
textLabel8.BackgroundTransparency = 1
textLabel8.AnchorPoint = Vector2.new(0.5, 0.5)
textLabel8.Position = UDim2.fromScale(0.5, 0.54)
textLabel8.Size = UDim2.fromOffset(500, 24)
textLabel8.Font = Enum.Font.Gotham
textLabel8.Text = "由 Nerx 团队倾力打造"
textLabel8.TextColor3 = color7
textLabel8.TextSize = 14
textLabel8.TextTransparency = 1
textLabel8.ZIndex = 11
textLabel8.Parent = v36
local textLabel9 = Instance.new("TextLabel")
textLabel9.BackgroundTransparency = 1
textLabel9.AnchorPoint = Vector2.new(0.5, 0.5)
textLabel9.Position = UDim2.fromScale(0.5, 0.62)
textLabel9.Size = UDim2.fromOffset(500, 20)
textLabel9.Font = Enum.Font.Gotham
textLabel9.Text = ""
textLabel9.TextColor3 = color8
textLabel9.TextSize = 12
textLabel9.ZIndex = 11
textLabel9.Parent = v36
local nerxLoginMusic = Instance.new("Sound")
nerxLoginMusic.Name = "NERXLoginMusic"
nerxLoginMusic.SoundId = "rbxassetid://"..tostring(15675069601)
nerxLoginMusic.Volume = 1
nerxLoginMusic.Looped =  true
nerxLoginMusic.Parent = soundService
local v37 = touchEnabled and math.min(320, math.floor(vector.X * 0.8)) or 320
local downloadBox = Instance.new("Frame")
downloadBox.Name = "DownloadBox"
downloadBox.AnchorPoint = Vector2.new(0.5, 0)
downloadBox.Position = UDim2.new(0.5, 0, 0.68, 0)
downloadBox.Size = UDim2.fromOffset(v37, 64)
downloadBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
downloadBox.BorderSizePixel = 0
downloadBox.ZIndex = 11
downloadBox.Parent = v36
local downloadMid = Instance.new("Frame")
downloadMid.Name = "DownloadMid"
downloadMid.Position = UDim2.fromOffset(6, 6)
downloadMid.Size = UDim2.new(1,  - 12, 1,  - 12)
downloadMid.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
downloadMid.BorderSizePixel = 0
downloadMid.ZIndex = 12
downloadMid.Parent = downloadBox
local downloadInner = Instance.new("Frame")
downloadInner.Name = "DownloadInner"
downloadInner.Position = UDim2.fromOffset(6, 6)
downloadInner.Size = UDim2.new(1,  - 12, 1,  - 12)
downloadInner.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
downloadInner.BorderSizePixel = 0
downloadInner.ZIndex = 13
downloadInner.Parent = downloadMid
local textLabel10 = Instance.new("TextLabel")
textLabel10.BackgroundTransparency = 1
textLabel10.Position = UDim2.fromOffset(10, 5)
textLabel10.Size = UDim2.new(1,  - 56, 0, 14)
textLabel10.Font = Enum.Font.Gotham
textLabel10.Text = "准备下载资源..."
textLabel10.TextColor3 = color7
textLabel10.TextSize = 11
textLabel10.TextXAlignment = Enum.TextXAlignment.Left
textLabel10.TextTruncate = Enum.TextTruncate.AtEnd
textLabel10.ZIndex = 14
textLabel10.Parent = downloadInner
local textLabel11 = Instance.new("TextLabel")
textLabel11.BackgroundTransparency = 1
textLabel11.AnchorPoint = Vector2.new(1, 0)
textLabel11.Position = UDim2.new(1,  - 10, 0, 5)
textLabel11.Size = UDim2.fromOffset(46, 14)
textLabel11.Font = Enum.Font.GothamBold
textLabel11.Text = "0%"
textLabel11.TextColor3 = color
textLabel11.TextSize = 11
textLabel11.TextXAlignment = Enum.TextXAlignment.Right
textLabel11.ZIndex = 14
textLabel11.Parent = downloadInner
local downloadBarBg = Instance.new("Frame")
downloadBarBg.Name = "DownloadBarBg"
downloadBarBg.Position = UDim2.fromOffset(10, 26)
downloadBarBg.Size = UDim2.new(1,  - 20, 0, 8)
downloadBarBg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
downloadBarBg.BorderSizePixel = 0
downloadBarBg.ZIndex = 14
downloadBarBg.Parent = downloadInner
local downloadFill = Instance.new("Frame")
downloadFill.Name = "DownloadFill"
downloadFill.Size = UDim2.new(0, 0, 1, 0)
downloadFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
downloadFill.BorderSizePixel = 0
downloadFill.ZIndex = 15
downloadFill.Parent = downloadBarBg
local uiGradient5 = Instance.new("UIGradient")
uiGradient5.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0,
    Color3.fromRGB(255,
    80,
    80)),
    ColorSequenceKeypoint.new(0.17,
    Color3.fromRGB(255,
    200,
    70)),
    ColorSequenceKeypoint.new(0.33,
    Color3.fromRGB(110,
    230,
    110)),
    ColorSequenceKeypoint.new(0.5,
    Color3.fromRGB(70,
    200,
    255)),
    ColorSequenceKeypoint.new(0.67,
    Color3.fromRGB(140,
    110,
    255)),
    ColorSequenceKeypoint.new(0.83,
    Color3.fromRGB(255,
    90,
    200)),
    ColorSequenceKeypoint.new(1,
    Color3.fromRGB(255,
    80,
    80)),
}
)
uiGradient5.Offset = Vector2.new( - 1, 0)
uiGradient5.Parent = downloadFill
task.spawn(function()
    pcall(function()
        f2(uiGradient5, f3(1.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut,  - 1), {
            Offset = Vector2.new(1,
            0),
        }
)
    end
)
end
)
local v38 = {
}
local v39 = getcustomasset and writefile and isfile and readfile and makefolder and true or false
local function f17(p23)
    local v40, v41 = pcall(isfile, p23.cache)
    if v40 and v41 then
        local v42, v43 = pcall(readfile, p23.cache)
        if v42 and type(v43) == "string" and # v43 > 10000 then
            local v44, v45 = pcall(getcustomasset, p23.cache)
            if v44 and type(v45) == "string" and # v45 > 0 then
                return v45
            end
        else
            pcall(delfile, p23.cache)
        end
    end
    local v46 = "https://raw.githubusercontent.com/1215203698741852/66666/main/"..p23.file
    for v1 = 1, 2 do
        local v47, v48 = pcall(function()
            return game:HttpGet(v46)
        end
)
        if v47 and type(v48) == "string" and # v48 > 10000 then
            if pcall(writefile, p23.cache, v48) then
                local v49, v50 = pcall(getcustomasset, p23.cache)
                if v49 and type(v50) == "string" and # v50 > 0 then
                    return v50
                end
            end
        end
        task.wait(0.3)
    end
    return nil
end
local function f18(p24, p25, p26)
    textLabel10.Text = p25 > 0 and "正在下载资源 "..p24.. "/"..p25..(p26 ~= "" and " · "..p26 or "") or "资源已就绪"
    local v51 = p25 > 0 and math.clamp(p24 / p25, 0, 1) or 1
    pcall(function()
        f2(downloadFill, f3(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(v51,
            0,
            1,
            0),
        }
)
    end
)
    textLabel11.Text = tostring(math.floor(v51 * 100 + 0.5)).. "%"
end
local function f19()
    if not v39 then
        f18(1, 1, "")
        task.wait(0.4)
        return
    else
        local v52 =  # v8
        f18(0, v52, "")
        for index4, value4 in ipairs(v8) do
            textLabel10.Text = "正在下载资源 "..index4.. "/"..v52.. " · "..value4.name
            local v53 = f17(value4)
            if v53 then
                v38[value4.cache] = v53
            end
            f18(index4, v52, "")
            task.wait(0.05)
        end
        return
    end
end
local function f20(p27)
    local v54 = {
    }
    for index5, value5 in ipairs(p27) do
        local v55 = v38[value5.cache]
        if v55 then
            v54[ # v54 + 1] = v55
        end
    end
    if # v54 == 0 then
        return nil
    end
    return v54[math.random(1,  # v54)]
end
local function f21()
    return f20(v6)
end
local function f22()
    return f20(v7)
end
local count4 = 0
local function f23()
    count4 = count4 + 1
end
local function f24(p28, p29, p30)
    count4 = count4 + 1
    local v56 = count4
    p29.TextColor3 = p30 or color7
    task.spawn(function()
        local count5 = 0
        while v56 == count4 and p29.Parent do
            count5 = count5 + 1
            p29.Text = p28..string.rep(".", count5 % 4)
            task.wait(0.4)
        end
    end
)
end
local function f25(text, p31)
    f23()
    textLabel3.Text = text
    textLabel3.TextColor3 = p31 or color7
end
local v57 =  false
local position2, position3
f5(header.InputBegan, function(p32)
    if p32.UserInputType == Enum.UserInputType.MouseButton1 or p32.UserInputType == Enum.UserInputType.Touch then
        local v58, v59 = pcall(function()
            return userInputService:GetGuiObjectsAtPosition(p32.Position.X, p32.Position.Y)
        end
)
        if v58 and v59 then
            for index6, value6 in ipairs(v59) do
                if value6 ~= header and value6:IsDescendantOf(v28) and(value6:IsA("TextBox") or value6:IsA("TextButton") or value6:IsA("ImageButton")) then
                    return
                end
            end
        end
        v57 =  true
        position2 = p32.Position
        position3 = v28.Position
        return
    end
end
)
f5(userInputService.InputChanged, function(p33)
    if v57 and(p33.UserInputType == Enum.UserInputType.MouseMovement or p33.UserInputType == Enum.UserInputType.Touch) then
        local v60 = p33.Position - position2
        v28.Position = UDim2.new(position3.X.Scale, position3.X.Offset + v60.X, position3.Y.Scale, position3.Y.Offset + v60.Y)
    end
end
)
f5(userInputService.InputEnded, function(p34)
    if p34.UserInputType == Enum.UserInputType.MouseButton1 or p34.UserInputType == Enum.UserInputType.Touch then
        v57 =  false
    end
end
)
local v61 =  false
local nerxWelcomeAudio
local function f26()
    if v61 then
        return
    end
    local gsub = tostring(keyInput.Text or ""):gsub("%s", "")
    if # gsub == 0 then
        f25("请输入卡密", color9)
        f4(inputBox)
        return
    end
    v61 =  true
    loginButton.Text = "正在验证"
    textLabel3.Text = "正在验证卡密..."
    textLabel3.TextColor3 = color7
    task.spawn(function()
        f24("正在连接 luarmor 服务器", textLabel3, color7)
        local v62 =  nil
        local v63
        local v64, v65 = pcall(function()
            if getgenv then
                getgenv().script_key = gsub
            else
                script_key = gsub
            end
            local v66
            v63, v66 = loadstring((game:HttpGet(v5.loader())))
            v62 = v66
            if not v63 then
                error("加载器编译失败: "..tostring(v62))
            end
        end
)
        local v67
        if v64 then
            f13(gsub)
            loginButton.Text = "正在验证"
            f24("正在验证中", textLabel3, color7)
            v67 =  true
            task.spawn(function()
                local v68, v69 = pcall(v63)
                if not v68 then
                    v67 =  false
                    f23()
                    pcall(function()
                        textLabel3.Text = "启动失败: "..tostring(v69):sub(1, 80)
                        textLabel3.TextColor3 = color9
                    end
)
                    v61 =  false
                end
            end
)
            task.delay(5, function()
                if not v67 then
                    return
                end
                if localPlayer.Parent ==  nil then
                    return
                end
                f23()
                textLabel3.Text = "验证通过"
                textLabel3.TextColor3 = color10
                pcall(function()
                    if nerxLoginMusic.IsPlaying then
                        f2(nerxLoginMusic, f3(0.5, Enum.EasingStyle.Linear), {
                            Volume = 0
                        }
)
                    end
                end
)
                task.spawn(function()
                    pcall(function()
                        local v70 = f22()
                        if v70 then
                            nerxWelcomeAudio = Instance.new("Sound")
                            nerxWelcomeAudio.Name = "NERXWelcomeAudio"
                            nerxWelcomeAudio.SoundId = v70
                            nerxWelcomeAudio.Volume = 1
                            nerxWelcomeAudio.Parent = soundService
                            nerxWelcomeAudio.Ended:Once(function()
                                pcall(function()
                                    nerxWelcomeAudio:Destroy()
                                end
)
                                nerxWelcomeAudio =  nil
                            end
)
                            nerxWelcomeAudio:Play()
                        end
                    end
)
                end
)
                task.wait(2)
                f11(nerxLoginGUI, 0.6)
                task.wait(0.7)
                pcall(function()
                    _G.NERX_LOGIN_CLEANUP()
                end
)
            end
)
        else
            v61 =  false
            loginButton.Text = "LOGIN"
            local v71 = tostring(v65)
            if v71:find("nvalid", 1,  true) or v71:find("key", 1,  true) or v71:find("Key", 1,  true) or v71:find("禁", 1,  true) then
                f25("卡密无效或已过期，请检查后重试", color9)
            else
                f25("启动失败: "..v71:sub(1, 90), color9)
            end
            f4(inputBox)
        end
    end
)
end
f6(loginButton, f26)
f6(saveKeyButton, function()
    local gsub2 = tostring(keyInput.Text or ""):gsub("%s", "")
    if # gsub2 == 0 then
        f25("请先输入卡密再保存", color9)
        f4(inputBox)
        return
    end
    f13(gsub2)
    saveKeyButton.Text = "已保存"
    task.delay(1.5, function()
        pcall(function()
            saveKeyButton.Text = "保存卡密"
        end
)
    end
)
    f26()
end
)
f5(keyInput.Focused, function()
    f2(uiStroke4, f3(0.18), {
        Color = color
    }
)
end
)
f5(keyInput.FocusLost, function(p35)
    f2(uiStroke4, f3(0.18), {
        Color = color5
    }
)
    if p35 then
        f26()
    end
end
)
if not touchEnabled then
    f5(loginButton.MouseEnter, function()
        if not v61 then
            f2(loginButton, f3(0.15), {
                BackgroundColor3 = Color3.fromRGB(178,
                222,
                62)
            }
)
        end
    end
)
    f5(loginButton.MouseLeave, function()
        f2(loginButton, f3(0.15), {
            BackgroundColor3 = color
        }
)
    end
)
end
task.spawn(function()
    pcall(function()
        f2(uiGradient2, f3(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut,  - 1), {
            Offset = Vector2.new(1,
            0),
        }
)
    end
)
end
)
task.spawn(function()
    if not pcall(function()
        f2(uiScale2, f3(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Scale = 1
        }
)
        task.spawn(function()
            local v72 = 3
            local v73 =  false
            local count6 = 0
            while true do
                count6 = 1 + count6
                if not(v73 and v72 <= count6 or not v73 and v72 >= count6) then
                    break
                end
                f2(uiStroke7, f3(0.3), {
                    Transparency = 0.75
                }
)
                task.wait(0.3)
                f2(uiStroke7, f3(0.3), {
                    Transparency = 0.15
                }
)
                task.wait(0.3)
            end
        end
)
        task.wait(0.45)
        f2(textLabel8, f3(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            TextTransparency = 0.1,
        }
)
        f19()
        task.wait(0.35)
        f11(v36, 0.5)
        task.wait(0.6)
        pcall(function()
            v36:Destroy()
        end
)
        v28.Visible =  true
        local position4 = v28.Position
        v28.Position = position4 + UDim2.fromOffset(0, 36)
        f2(v28, f3(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = position4
        }
)
        task.delay(0.35, f16)
        pcall(function()
            local v74 = f21()
            if v74 then
                nerxLoginMusic.SoundId = v74
            end
            nerxLoginMusic.Volume = 0
            nerxLoginMusic:Play()
            f2(nerxLoginMusic, f3(2.5, Enum.EasingStyle.Linear), {
                Volume = 0.45
            }
)
        end
)
        if not touchEnabled then
            task.delay(0.6, function()
                pcall(function()
                    keyInput:CaptureFocus()
                end
)
            end
)
        end
    end
) then
        pcall(function()
            f23()
            pcall(function()
                v36:Destroy()
            end
)
            v28.Visible =  true
        end
)
    end
end
)
function _G.NERX_LOGIN_CLEANUP()
    for index7, value7 in ipairs(v2) do
    end
    table.clear(v2)
    pcall(function()
        if nerxWelcomeAudio and not nerxWelcomeAudio.IsPlaying then
            nerxWelcomeAudio:Destroy()
            nerxWelcomeAudio =  nil
        end
    end
)
    pcall(function()
        nerxLoginMusic:Destroy()
    end
)
    pcall(function()
        nerxLoginGUI:Destroy()
    end
)
end