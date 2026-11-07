local XiuxianUI = {}
XiuxianUI.__index = XiuxianUI
local inst, ud2, ud, c3, v2 = Instance.new, UDim2.new, UDim.new, Color3.fromRGB, Vector2.new
local ti, cseq, csk = TweenInfo.new, ColorSequence.new, ColorSequenceKeypoint.new
local ts, uis, rs = game:GetService("TweenService"), game:GetService("UserInputService"), game:GetService("RunService")
local cp, plrs, txtSvc, hs, mps = game:GetService("ContentProvider"), game:GetService("Players"), game:GetService("TextService"), game:GetService("HttpService"), game:GetService("MarketplaceService")
local lplr = plrs.LocalPlayer
local core = (gethui and gethui()) or game:GetService("CoreGui")
local function genHash() return hs:GenerateGUID(false):gsub("-", "") end
local Colors = {Background=c3(15,12,22),SecondaryBg=c3(10,8,15),SectionBg=c3(15,12,22),Border=c3(120,40,220),Accent=c3(100,30,150),Text=c3(255,255,255),TextInactive=c3(200,150,255),Disabled=c3(120,100,160),Hover=c3(50,20,80),Button=c3(30,15,40),Slider=c3(150,40,255),ToggleOn=c3(150,40,255),ToggleOff=c3(40,15,70),TabActive=c3(100,30,150),TabInactive=c3(40,15,70),ControlButton=c3(30,15,45),CloseButton=c3(180,40,40)}
local RGBColors = {c3(180,50,220),c3(150,50,200),c3(200,60,230),c3(170,40,210),c3(190,70,240),c3(160,30,190)}
local Themes = {
["black"]={Background=c3(8,8,8),SecondaryBg=c3(5,5,5),SectionBg=c3(10,10,10),Border=c3(60,60,60),Accent=c3(150,150,150),TextInactive=c3(150,150,150),Disabled=c3(40,40,40),Hover=c3(20,20,20),Button=c3(15,15,15),Slider=c3(200,200,200),ToggleOn=c3(200,200,200),ToggleOff=c3(30,30,30),TabActive=c3(150,150,150),TabInactive=c3(20,20,20),ControlButton=c3(25,25,25),Text=c3(255,255,255),RGB={c3(120,120,120),c3(100,100,100),c3(140,140,140),c3(90,90,90),c3(150,150,150),c3(110,110,110)}},
["grey"]={Background=c3(35,35,40),SecondaryBg=c3(25,25,30),SectionBg=c3(35,35,40),Border=c3(120,120,130),Accent=c3(160,160,170),TextInactive=c3(180,180,190),Disabled=c3(80,80,90),Hover=c3(60,60,70),Button=c3(45,45,50),Slider=c3(180,180,190),ToggleOn=c3(180,180,190),ToggleOff=c3(50,50,60),TabActive=c3(140,140,150),TabInactive=c3(40,40,45),ControlButton=c3(50,50,55),Text=c3(255,255,255),RGB={c3(150,150,160),c3(130,130,140),c3(170,170,180),c3(110,110,120),c3(190,190,200),c3(140,140,150)}},
["red"]={Background=c3(22,12,12),SecondaryBg=c3(15,8,8),SectionBg=c3(22,12,12),Border=c3(220,40,40),Accent=c3(180,30,30),TextInactive=c3(255,150,150),Disabled=c3(160,100,100),Hover=c3(80,20,20),Button=c3(40,15,15),Slider=c3(255,40,40),ToggleOn=c3(255,40,40),ToggleOff=c3(70,15,15),TabActive=c3(180,30,30),TabInactive=c3(70,15,15),ControlButton=c3(45,15,15),Text=c3(255,255,255),RGB={c3(220,50,50),c3(200,50,50),c3(230,60,60),c3(210,40,40),c3(240,70,70),c3(190,30,30)}},
["blue"]={Background=c3(10,20,22),SecondaryBg=c3(5,12,15),SectionBg=c3(10,20,22),Border=c3(0,200,200),Accent=c3(0,180,180),TextInactive=c3(150,255,255),Disabled=c3(50,100,100),Hover=c3(15,60,60),Button=c3(10,30,30),Slider=c3(0,255,255),ToggleOn=c3(0,255,255),ToggleOff=c3(10,40,40),TabActive=c3(0,200,200),TabInactive=c3(10,40,40),ControlButton=c3(10,45,45),Text=c3(255,255,255),RGB={c3(0,255,255),c3(0,200,200),c3(50,255,255),c3(0,180,180),c3(100,255,255),c3(0,220,220)}},
["green"]={Background=c3(10,22,10),SecondaryBg=c3(5,15,5),SectionBg=c3(10,22,10),Border=c3(0,200,0),Accent=c3(0,180,0),TextInactive=c3(150,255,150),Disabled=c3(50,100,50),Hover=c3(15,60,15),Button=c3(10,30,10),Slider=c3(0,255,0),ToggleOn=c3(0,255,0),ToggleOff=c3(10,40,10),TabActive=c3(0,200,0),TabInactive=c3(10,40,10),ControlButton=c3(10,45,10),Text=c3(255,255,255),RGB={c3(0,255,0),c3(0,200,0),c3(50,255,50),c3(0,180,0),c3(100,255,100),c3(0,220,0)}},
["pink"]={Background=c3(22,10,16),SecondaryBg=c3(15,5,10),SectionBg=c3(22,10,16),Border=c3(255,20,147),Accent=c3(200,10,110),TextInactive=c3(255,150,200),Disabled=c3(120,50,80),Hover=c3(80,10,40),Button=c3(40,10,20),Slider=c3(255,20,147),ToggleOn=c3(255,20,147),ToggleOff=c3(50,10,25),TabActive=c3(255,20,147),TabInactive=c3(50,10,25),ControlButton=c3(45,15,25),Text=c3(255,255,255),RGB={c3(255,20,147),c3(230,10,120),c3(255,50,160),c3(200,0,100),c3(255,80,180),c3(220,15,130)}},
["orange"]={Background=c3(22,12,10),SecondaryBg=c3(15,8,5),SectionBg=c3(22,12,10),Border=c3(255,69,0),Accent=c3(200,50,0),TextInactive=c3(255,180,150),Disabled=c3(120,60,40),Hover=c3(80,25,10),Button=c3(40,15,10),Slider=c3(255,69,0),ToggleOn=c3(255,69,0),ToggleOff=c3(50,15,10),TabActive=c3(255,69,0),TabInactive=c3(50,15,10),ControlButton=c3(45,20,15),Text=c3(255,255,255),RGB={c3(255,69,0),c3(230,50,0),c3(255,90,30),c3(200,40,0),c3(255,120,50),c3(220,60,0)}},
["yellow"]={Background=c3(22,22,8),SecondaryBg=c3(15,15,5),SectionBg=c3(22,22,8),Border=c3(200,200,0),Accent=c3(180,180,0),TextInactive=c3(255,255,150),Disabled=c3(100,100,40),Hover=c3(80,80,10),Button=c3(40,40,10),Slider=c3(255,255,0),ToggleOn=c3(255,255,0),ToggleOff=c3(50,50,10),TabActive=c3(200,200,0),TabInactive=c3(50,50,10),ControlButton=c3(45,45,15),Text=c3(255,255,255),RGB={c3(255,255,0),c3(230,230,0),c3(255,255,50),c3(200,200,0),c3(255,255,100),c3(220,220,0)}}
}
local Fonts = {Title=Enum.Font.Arcade,Normal=Enum.Font.Arcade,Tab=Enum.Font.Arcade,Button=Enum.Font.Arcade,Bold=Enum.Font.Arcade}
local UI_SIZE = {Width=260,Height=280}
local ELEMENT_SIZES = {TitleBar=30,TabHeight=32,ButtonHeight=32,SliderHeight=45,ToggleHeight=32,TextboxHeight=32,DropdownHeight=32,SectionSpacing=6}
local IconMap = {}
local IconPacks = {
    lucide = "https://raw.githubusercontent.com/Footagesus/Icons/refs/heads/main/lucide/dist/Icons.lua",
    geist = "https://raw.githubusercontent.com/Footagesus/Icons/refs/heads/main/geist/dist/Icons.lua",
    gravity = "https://raw.githubusercontent.com/Footagesus/Icons/refs/heads/main/gravity/dist/Icons.lua",
    sfsymbols = "https://raw.githubusercontent.com/Footagesus/Icons/refs/heads/main/sfsymbols/dist/Icons.lua"
}
local LoadedIconPacks = {}
local IconPackOrder = {"lucide", "gravity", "geist", "sfsymbols"}
local function LoadIconPack(packName)
    if LoadedIconPacks[packName] ~= nil then
        return LoadedIconPacks[packName] or nil
    end
    local url = IconPacks[packName]
    if not url then return nil end
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    LoadedIconPacks[packName] = success and result or false
    return success and result or nil
end
local function TryResolveFromPack(imageLabel, packName, name)
    local data = LoadIconPack(packName)
    if not data then return false end
    if packName == "geist" then
        local iconData = data.Icons and data.Icons[name]
        if iconData then
            imageLabel.Image = data.Spritesheets[tostring(iconData.Image)]
            imageLabel.ImageRectOffset = iconData.ImageRectPosition
            imageLabel.ImageRectSize = iconData.ImageRectSize
            return true
        end
    else
        local id = data[name]
        if id then
            imageLabel.Image = id
            return true
        end
    end
    return false
end
local function ApplyIcon(imageLabel, icon, packName)
    if type(icon) == "string" and IconMap[icon] then
        icon = IconMap[icon]
    end
    if type(icon) == "number" then
        imageLabel.Image = "rbxassetid://" .. icon
        return
    end
    if type(icon) ~= "string" then return end
    if tonumber(icon) then
        imageLabel.Image = "rbxassetid://" .. icon
        return
    end
    if icon:match("^rbx") or icon:match("^http") then
        imageLabel.Image = icon
        return
    end
    for _, p in ipairs(packName and {packName} or IconPackOrder) do
        if TryResolveFromPack(imageLabel, p, icon) then return end
    end
end
local IconKeyCache = {}
local function GetRandomIcon()
    local packs = {"lucide", "gravity", "sfsymbols", "geist"}
    for _ = 1, 8 do
        local p = packs[math.random(#packs)]
        local data = LoadIconPack(p)
        if data then
            if not IconKeyCache[p] then
                local keys = {}
                local source = (p == "geist") and (data.Icons or {}) or data
                for k in pairs(source) do keys[#keys + 1] = k end
                IconKeyCache[p] = keys
            end
            local keys = IconKeyCache[p]
            if #keys > 0 then
                local k = keys[math.random(#keys)]
                if p == "geist" then
                    local d = data.Icons[k]
                    local sheet = data.Spritesheets and data.Spritesheets[tostring(d.Image)]
                    if sheet then return sheet, d.ImageRectPosition, d.ImageRectSize end
                else
                    return data[k]
                end
            end
        end
    end
end
local function parseSmartArgs(...)
    local id, shape, theme
    for _, arg in ipairs({...}) do
        if type(arg) == "number" then
            if arg == 1 or arg == 2 then shape = arg
            elseif arg > 999 then id = arg end
        elseif type(arg) == "string" then
            local l = string.lower(arg)
            if Themes[l] then theme = l
            elseif tonumber(arg) then
                local num = tonumber(arg)
                if num == 1 or num == 2 then shape = num
                elseif num > 999 then id = num end
            elseif arg:match("rbxassetid") or arg:match("rbxthumb") then id = arg end
        end
    end
    return id, shape, theme
end
local strokeGrads = {}
local strokeConn
local function BorderSequence()
    return cseq({
        csk(0, Colors.Background),
        csk(0.25, Colors.Accent),
        csk(0.45, Colors.Slider),
        csk(0.55, Colors.Slider),
        csk(0.75, Colors.Accent),
        csk(1, Colors.Background),
    })
end
local function AddStroke(parent, thick)
    local s = inst("UIStroke")
    s.Color = c3(255, 255, 255)
    s.Thickness = thick or 1
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = parent
    local g = inst("UIGradient")
    g.Color = BorderSequence()
    g.Parent = s
    table.insert(strokeGrads, g)
    if not strokeConn then
        strokeConn = rs.RenderStepped:Connect(function()
            local rot = (tick() * 90) % 360
            for i = #strokeGrads, 1, -1 do
                local gr = strokeGrads[i]
                if gr:IsDescendantOf(game) then
                    gr.Rotation = rot
                else
                    table.remove(strokeGrads, i)
                end
            end
        end)
    end
    return s
end
local function AddSubtleGradient(parent)
    local g = inst("UIGradient")
    g.Color = cseq({csk(0, c3(255, 255, 255)), csk(1, c3(215, 215, 215))})
    g.Rotation = 90
    g.Parent = parent
    return g
end
local function MakeLeftIcon(parent, icon, z, yScale, yOffset)
    if not icon then return nil end
    local img = inst("ImageLabel")
    img.Name = "LeftIcon"
    img.AnchorPoint = Vector2.new(0, 0.5)
    img.Position = ud2(0, 8, yScale or 0.5, yOffset or 0)
    img.Size = ud2(0, 16, 0, 16)
    img.BackgroundTransparency = 1
    img.ImageColor3 = Colors.TextInactive
    img.ScaleType = Enum.ScaleType.Fit
    img.ZIndex = z or 1
    ApplyIcon(img, icon)
    img.Parent = parent
    return img
end
function XiuxianUI:SendNotification(title, text, duration, ...)
    local icon, shape, themeName = parseSmartArgs(...)
    local iconName
    for _, a in ipairs({...}) do
        if type(a) == "string" and not Themes[string.lower(a)] and not tonumber(a) and not a:match("rbx") and not a:match("^http") then
            iconName = a
        end
    end
    local hasIcon = icon ~= nil or iconName ~= nil
    duration = duration or 3
    local nCol = Colors
    if themeName and Themes[themeName] then
        nCol = {}
        for k, v in pairs(Colors) do nCol[k] = v end
        for k, v in pairs(Themes[themeName]) do if k ~= "RGB" then nCol[k] = v end end
    end
    local pg = lplr:FindFirstChild("PlayerGui")
    local targetGui
    for _, v in pairs(core:GetChildren()) do if v:GetAttribute("OxNotif") then targetGui = v break end end
    if not targetGui and pg then
        for _, v in pairs(pg:GetChildren()) do if v:GetAttribute("OxNotif") then targetGui = v break end end
    end
    if not targetGui then
        targetGui = inst("ScreenGui")
        targetGui.Name = genHash()
        targetGui:SetAttribute("OxNotif", true)
        targetGui.ResetOnSpawn = false
        targetGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        targetGui.DisplayOrder = 101
        pcall(function() targetGui.Parent = core end)
        if not targetGui.Parent and pg then targetGui.Parent = pg end
    end
    local NotifContainer = targetGui:FindFirstChild("Container")
    if not NotifContainer then
        NotifContainer = inst("Frame")
        NotifContainer.Name = "Container"
        NotifContainer.Size = ud2(0, 250, 1, -50)
        NotifContainer.Position = ud2(1, -270, 0, 20)
        NotifContainer.BackgroundTransparency = 1
        local list = inst("UIListLayout")
        list.SortOrder = Enum.SortOrder.LayoutOrder
        list.VerticalAlignment = Enum.VerticalAlignment.Bottom
        list.Padding = ud(0, 10)
        list.Parent = NotifContainer
        NotifContainer.Parent = targetGui
    end
    local textOffset = hasIcon and 50 or 10
    local availableWidth = 250 - textOffset - 15
    local bounds = txtSvc:GetTextSize(text or "Message", 12, Fonts.Normal, v2(availableWidth, 9000))
    local textHeight = math.clamp(bounds.Y, 20, 400)
    local frameHeight = math.max(60, 26 + textHeight + 20)

    local Holder = inst("Frame")
    Holder.Name = "Holder"
    Holder.Size = ud2(1, 0, 0, frameHeight)
    Holder.BackgroundTransparency = 1
    Holder.ClipsDescendants = true
    Holder.Parent = NotifContainer

    local Card = inst("Frame")
    Card.Name = "Card"
    Card.Size = ud2(1, 0, 1, 0)
    Card.Position = ud2(1, 30, 0, 0)
    Card.BackgroundColor3 = nCol.Background
    Card.BackgroundTransparency = 1
    Card.BorderSizePixel = 0
    inst("UICorner", Card).CornerRadius = ud(0, 8)
    local cardGrad = inst("UIGradient")
    cardGrad.Color = cseq({csk(0, nCol.Hover), csk(1, nCol.Background)})
    cardGrad.Rotation = 90
    cardGrad.Parent = Card
    local stroke = AddStroke(Card, 1.5)
    stroke.Transparency = 1
    Card.Parent = Holder

    local img
    if hasIcon then
        img = inst("ImageLabel")
        img.Size = ud2(0, 30, 0, 30)
        img.Position = ud2(0, 10, 0, 12)
        img.BackgroundTransparency = 1
        img.ScaleType = Enum.ScaleType.Fit
        if icon then
            img.Image = tonumber(icon) and "rbxthumb://type=Asset&id="..icon.."&w=150&h=150" or icon
        else
            ApplyIcon(img, iconName)
        end
        img.ImageTransparency = 1
        if shape == 2 then inst("UICorner", img).CornerRadius = ud(0, 6)
        else inst("UICorner", img).CornerRadius = ud(1, 0) end
        img.Parent = Card
    end

    local TitleLabel = inst("TextLabel")
    TitleLabel.Size = ud2(1, -textOffset - 10, 0, 20)
    TitleLabel.Position = ud2(0, textOffset, 0, 6)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title or "Notification"
    TitleLabel.TextColor3 = nCol.Text
    TitleLabel.TextSize = 14
    TitleLabel.Font = Fonts.Bold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.TextTransparency = 1
    TitleLabel.TextScaled = true
    TitleLabel.TextWrapped = true
    local nTitleConst = inst("UITextSizeConstraint")
    nTitleConst.MaxTextSize = 14
    nTitleConst.MinTextSize = 9
    nTitleConst.Parent = TitleLabel
    TitleLabel.Parent = Card

    local TextLabel = inst("TextLabel")
    TextLabel.Size = ud2(1, -textOffset - 10, 0, textHeight)
    TextLabel.Position = ud2(0, textOffset, 0, 26)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = text or "Message"
    TextLabel.TextColor3 = nCol.TextInactive
    TextLabel.TextSize = 12
    TextLabel.Font = Fonts.Normal
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.TextTransparency = 1
    TextLabel.TextWrapped = true
    TextLabel.Parent = Card

    local BarBg = inst("Frame")
    BarBg.Size = ud2(1, -20, 0, 4)
    BarBg.Position = ud2(0, 10, 1, -10)
    BarBg.BackgroundColor3 = nCol.SecondaryBg
    BarBg.BorderSizePixel = 0
    BarBg.BackgroundTransparency = 1
    inst("UICorner", BarBg).CornerRadius = ud(1, 0)
    BarBg.Parent = Card

    local Bar = inst("Frame")
    Bar.Size = ud2(1, 0, 1, 0)
    Bar.BackgroundColor3 = c3(255, 255, 255)
    Bar.BorderSizePixel = 0
    Bar.BackgroundTransparency = 1
    inst("UICorner", Bar).CornerRadius = ud(1, 0)
    local barGrad = inst("UIGradient")
    barGrad.Color = cseq({csk(0, nCol.Slider), csk(1, nCol.Border)})
    barGrad.Parent = Bar
    Bar.Parent = BarBg

    local tIn = ti(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    ts:Create(Card, tIn, {Position = ud2(0, 0, 0, 0), BackgroundTransparency = 0.1}):Play()
    ts:Create(stroke, tIn, {Transparency = 0}):Play()
    ts:Create(TitleLabel, tIn, {TextTransparency = 0}):Play()
    ts:Create(TextLabel, tIn, {TextTransparency = 0}):Play()
    ts:Create(BarBg, tIn, {BackgroundTransparency = 0.4}):Play()
    ts:Create(Bar, tIn, {BackgroundTransparency = 0}):Play()
    if img then ts:Create(img, tIn, {ImageTransparency = 0}):Play() end
    task.delay(0.8, function()
        ts:Create(Bar, ti(duration, Enum.EasingStyle.Linear), {Size = ud2(0, 0, 1, 0)}):Play()
    end)
    task.delay(duration + 0.8, function()
        local tOut = ti(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
        ts:Create(Card, tOut, {Position = ud2(1, 30, 0, 0), BackgroundTransparency = 1}):Play()
        ts:Create(stroke, tOut, {Transparency = 1}):Play()
        ts:Create(TitleLabel, tOut, {TextTransparency = 1}):Play()
        ts:Create(TextLabel, tOut, {TextTransparency = 1}):Play()
        ts:Create(BarBg, tOut, {BackgroundTransparency = 1}):Play()
        ts:Create(Bar, tOut, {BackgroundTransparency = 1}):Play()
        if img then ts:Create(img, tOut, {ImageTransparency = 1}):Play() end
        task.wait(0.6)
        Holder:Destroy()
    end)
end
local function SpawnOrb(layer)
    local img, rectPos, rectSize = GetRandomIcon()
    if not img then return end
    local o = inst("ImageLabel")
    local s = math.random(16, 34)
    o.Size = ud2(0, s, 0, s)
    o.AnchorPoint = Vector2.new(0.5, 0.5)
    local startX = math.random() * 0.9 + 0.05
    o.Position = ud2(startX, 0, 1.1, 0)
    o.BackgroundTransparency = 1
    o.Image = img
    if rectPos then
        o.ImageRectOffset = rectPos
        o.ImageRectSize = rectSize
    end
    o.ImageColor3 = RGBColors[math.random(#RGBColors)]
    o.ImageTransparency = 0.5 + math.random() * 0.3
    o.Parent = layer
    local dur = 6 + math.random() * 5
    local drift = (math.random() - 0.5) * 0.25
    local endX = math.clamp(startX + drift, 0, 1)
    local info = ti(dur, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    ts:Create(o, info, {Position = ud2(endX, 0, -0.1, 0), Rotation = math.random(-180, 180)}):Play()
    task.delay(dur, function() o:Destroy() end)
end
local function FadeAll(obj, info)
    for _, d in ipairs(obj:GetDescendants()) do
        if d:IsA("GuiObject") and d.BackgroundTransparency < 1 then
            ts:Create(d, info, {BackgroundTransparency = 1}):Play()
        end
        if d:IsA("TextLabel") or d:IsA("TextButton") then
            ts:Create(d, info, {TextTransparency = 1}):Play()
        end
        if d:IsA("ImageLabel") or d:IsA("ImageButton") then
            ts:Create(d, info, {ImageTransparency = 1}):Play()
        end
    end
    if obj:IsA("GuiObject") then
        ts:Create(obj, info, {BackgroundTransparency = 1}):Play()
    end
end
local function RunIntro(Window, MainFrame)
    local loaderGui = inst("ScreenGui")
    loaderGui.Name = genHash()
    loaderGui:SetAttribute("OxLoader", true)
    loaderGui.ResetOnSpawn = false
    loaderGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    loaderGui.DisplayOrder = 200
    pcall(function() loaderGui.Parent = core end)
    if not loaderGui.Parent then loaderGui.Parent = lplr:WaitForChild("PlayerGui") end

    local root = inst("Frame")
    root.Size = ud2(1, 0, 1, 0)
    root.BackgroundColor3 = Colors.Background
    root.BackgroundTransparency = 0.2
    root.BorderSizePixel = 0
    root.Parent = loaderGui

    local orbLayer = inst("Frame")
    orbLayer.Size = ud2(1, 0, 1, 0)
    orbLayer.BackgroundTransparency = 1
    orbLayer.ClipsDescendants = true
    orbLayer.Parent = root

    local leftPanel = inst("Frame")
    leftPanel.Size = ud2(0, 220, 1, -120)
    leftPanel.Position = ud2(0, 14, 0, 14)
    leftPanel.BackgroundTransparency = 1
    leftPanel.ClipsDescendants = true
    leftPanel.Parent = root
    local leftList = inst("UIListLayout")
    leftList.Padding = ud(0, 6)
    leftList.SortOrder = Enum.SortOrder.LayoutOrder
    leftList.Parent = leftPanel

    local center = inst("Frame")
    center.AnchorPoint = Vector2.new(0.5, 0.5)
    center.Position = ud2(0.5, 0, 0.5, 0)
    center.Size = ud2(0, 320, 0, 80)
    center.BackgroundTransparency = 1
    center.Parent = root
    local centerScale = inst("UIScale")
    centerScale.Scale = 1
    centerScale.Parent = center

    local styles = {"Pop", "Slide", "Spin", "Typewriter"}
    local style = styles[math.random(#styles)]

    local titleLbl = inst("TextLabel")
    titleLbl.Size = ud2(1, 0, 0, 52)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text = style == "Typewriter" and "" or Window.Title
    titleLbl.TextColor3 = Colors.Text
    titleLbl.TextScaled = true
    titleLbl.Font = Fonts.Title
    titleLbl.Parent = center
    local titleConst = inst("UITextSizeConstraint")
    titleConst.MaxTextSize = 40
    titleConst.MinTextSize = 14
    titleConst.Parent = titleLbl

    local subLbl = inst("TextLabel")
    subLbl.Size = ud2(1, 0, 0, 20)
    subLbl.Position = ud2(0, 0, 0, 56)
    subLbl.BackgroundTransparency = 1
    subLbl.Text = "Loading..."
    subLbl.TextColor3 = Colors.TextInactive
    subLbl.TextSize = 12
    subLbl.Font = Fonts.Normal
    subLbl.Parent = center

    local bottom = inst("Frame")
    bottom.AnchorPoint = Vector2.new(0.5, 1)
    bottom.Position = ud2(0.5, 0, 1, -18)
    bottom.Size = ud2(0, 280, 0, 50)
    bottom.BackgroundTransparency = 1
    bottom.Parent = root

    local gameIcon = inst("ImageLabel")
    gameIcon.Size = ud2(0, 40, 0, 40)
    gameIcon.Position = ud2(0, 0, 0.5, -20)
    gameIcon.BackgroundColor3 = Colors.SecondaryBg
    gameIcon.Image = "rbxthumb://type=GameIcon&id="..game.GameId.."&w=150&h=150"
    inst("UICorner", gameIcon).CornerRadius = ud(0, 8)
    gameIcon.Parent = bottom

    local gameName = "Game"
    local okInfo, info = pcall(function() return mps:GetProductInfo(game.PlaceId) end)
    if okInfo and info and info.Name then gameName = info.Name elseif game.Name then gameName = game.Name end

    local gName = inst("TextLabel")
    gName.Position = ud2(0, 50, 0, 4)
    gName.Size = ud2(1, -50, 0, 22)
    gName.BackgroundTransparency = 1
    gName.Text = gameName
    gName.TextColor3 = Colors.Text
    gName.TextScaled = true
    gName.Font = Fonts.Bold
    gName.TextXAlignment = Enum.TextXAlignment.Left
    local gNameConst = inst("UITextSizeConstraint")
    gNameConst.MaxTextSize = 14
    gNameConst.MinTextSize = 8
    gNameConst.Parent = gName
    gName.Parent = bottom

    local gId = inst("TextLabel")
    gId.Position = ud2(0, 50, 0, 26)
    gId.Size = ud2(1, -50, 0, 18)
    gId.BackgroundTransparency = 1
    gId.Text = "ID: " .. tostring(game.PlaceId)
    gId.TextColor3 = Colors.TextInactive
    gId.TextSize = 11
    gId.Font = Fonts.Normal
    gId.TextXAlignment = Enum.TextXAlignment.Left
    gId.Parent = bottom

    for i, p in ipairs(plrs:GetPlayers()) do
        local row = inst("Frame")
        row.Size = ud2(1, 0, 0, 40)
        row.BackgroundTransparency = 1
        row.LayoutOrder = i
        row.Parent = leftPanel
        local content = inst("Frame")
        content.Size = ud2(1, 0, 1, 0)
        content.Position = ud2(0, -240, 0, 0)
        content.BackgroundTransparency = 1
        content.Parent = row
        local av = inst("ImageLabel")
        av.Size = ud2(0, 32, 0, 32)
        av.Position = ud2(0, 0, 0.5, -16)
        av.BackgroundColor3 = Colors.SecondaryBg
        av.Image = "rbxthumb://type=AvatarHeadShot&id="..p.UserId.."&w=150&h=150"
        inst("UICorner", av).CornerRadius = ud(1, 0)
        av.Parent = content
        local dn = inst("TextLabel")
        dn.Position = ud2(0, 40, 0, 2)
        dn.Size = ud2(1, -40, 0, 20)
        dn.BackgroundTransparency = 1
        dn.Text = p.DisplayName
        dn.TextColor3 = Colors.Text
        dn.TextSize = 13
        dn.Font = Fonts.Bold
        dn.TextXAlignment = Enum.TextXAlignment.Left
        dn.TextTruncate = Enum.TextTruncate.AtEnd
        dn.Parent = content
        local un = inst("TextLabel")
        un.Position = ud2(0, 40, 0, 20)
        un.Size = ud2(1, -40, 0, 16)
        un.BackgroundTransparency = 1
        un.Text = "@" .. p.Name
        un.TextColor3 = Colors.TextInactive
        un.TextSize = 11
        un.Font = Fonts.Normal
        un.TextXAlignment = Enum.TextXAlignment.Left
        un.TextTruncate = Enum.TextTruncate.AtEnd
        un.Parent = content
        task.delay(0.2 + i * 0.12, function()
            ts:Create(content, ti(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = ud2(0, 0, 0, 0)}):Play()
        end)
    end

    local running = true
    task.spawn(function()
        while running do
            SpawnOrb(orbLayer)
            task.wait(0.25)
        end
    end)

    local packsReady = false
    task.spawn(function()
        for _, p in ipairs(IconPackOrder) do pcall(LoadIconPack, p) end
        packsReady = true
    end)

    local enterInfo = ti(0.9, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    if style == "Pop" then
        centerScale.Scale = 0.01
        ts:Create(centerScale, ti(0.9, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
    elseif style == "Slide" then
        center.Position = ud2(0.5, 0, 0.5, 80)
        ts:Create(center, ti(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = ud2(0.5, 0, 0.5, 0)}):Play()
    elseif style == "Spin" then
        center.Rotation = -180
        ts:Create(center, ti(1.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Rotation = 0}):Play()
    else
        task.spawn(function()
            for i = 1, #Window.Title do
                titleLbl.Text = string.sub(Window.Title, 1, i)
                task.wait(0.07)
            end
        end)
    end

    local t0 = os.clock()
    repeat task.wait(0.05) until packsReady and (os.clock() - t0 >= 3.2)
    running = false

    local tOut = ti(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
    if style == "Pop" then
        ts:Create(centerScale, tOut, {Scale = 0.01}):Play()
    elseif style == "Slide" then
        ts:Create(center, tOut, {Position = ud2(0.5, 0, 0.5, -80)}):Play()
    elseif style == "Spin" then
        ts:Create(center, tOut, {Rotation = 180}):Play()
    end
    FadeAll(root, tOut)
    task.wait(0.65)
    loaderGui:Destroy()

    local target = MainFrame.Position
    MainFrame.Visible = true
    MainFrame.Position = ud2(target.X.Scale, target.X.Offset, target.Y.Scale, target.Y.Offset + 40)
    ts:Create(MainFrame, ti(1.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = target}):Play()
end
function XiuxianUI.new()
    local self = setmetatable({}, XiuxianUI)
    self.Windows = {}
    return self
end
function XiuxianUI:NewWindow(title, ...)
    local logoId, shape, themeName = parseSmartArgs(...)
    local titleIcon
    for _, a in ipairs({...}) do
        if type(a) == "table" and a.Icon then titleIcon = a end
    end
    if themeName then
        local t = Themes[themeName]
        if t then
            for k, v in pairs(t) do if k ~= "RGB" then Colors[k] = v end end
            if t.RGB then for i, v in ipairs(t.RGB) do RGBColors[i] = v end end
        end
    end
    local allowMulti = _G.MultiGui or _G.MultiUI or _G.OxireunMulti
    if not allowMulti then
        for _, v in pairs(core:GetChildren()) do if v:GetAttribute("OxMain") then v:Destroy() end end
        local pg = lplr:FindFirstChild("PlayerGui")
        if pg then for _, v in pairs(pg:GetChildren()) do if v:GetAttribute("OxMain") then v:Destroy() end end end
    end
    local Window = {Title = title or "Xiuxian Ui", Sections = {}, CurrentSection = nil}
    local ScreenGui = inst("ScreenGui")
    ScreenGui.Name = genHash()
    ScreenGui:SetAttribute("OxMain", true)
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 10
    local MainFrame = inst("Frame")
    MainFrame.Name = "MainWindow"
    MainFrame.Size = ud2(0, UI_SIZE.Width, 0, UI_SIZE.Height)
    MainFrame.Position = ud2(0, 10, 0.5, -UI_SIZE.Height/2)
    MainFrame.BackgroundColor3 = c3(255, 255, 255)
    MainFrame.BackgroundTransparency = 0.3
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Active = true
    MainFrame.Visible = false
    local mainGradient = inst("UIGradient")
    mainGradient.Color = cseq({csk(0, Colors.Background), csk(0.4, Colors.Background), csk(0.5, Colors.Accent), csk(0.6, Colors.Background), csk(1, Colors.Background)})
    mainGradient.Rotation = 45
    mainGradient.Parent = MainFrame
    inst("UICorner", MainFrame).CornerRadius = ud(0, 8)
    AddStroke(MainFrame, 2)
    local ThemeImages = {red = "rbxassetid://137184743125361"}
    if themeName and ThemeImages[themeName] then
        local bgImg = inst("ImageLabel")
        bgImg.Name = "ThemeImage"
        bgImg.Size = ud2(1, 0, 1, 0)
        bgImg.BackgroundTransparency = 1
        bgImg.Image = ThemeImages[themeName]
        bgImg.ScaleType = Enum.ScaleType.Crop
        bgImg.ImageTransparency = 0.5
        bgImg.ZIndex = 0
        inst("UICorner", bgImg).CornerRadius = ud(0, 8)
        bgImg.Parent = MainFrame
    end
    local FloatingLogo
    local activeDropdowns = {}
    local guiHasBeenDragged = false
    if logoId then
        FloatingLogo = inst("ImageButton")
        FloatingLogo.Name = "FloatingLogo"
        FloatingLogo.Size = ud2(0, 46, 0, 46)
        FloatingLogo.Position = ud2(0, 20, 0.5, -23)
        FloatingLogo.BackgroundColor3 = Colors.Background
        FloatingLogo.Visible = true
        FloatingLogo.AutoButtonColor = false
        FloatingLogo.ClipsDescendants = true
        local logoCorner = inst("UICorner")
        if shape == 2 then logoCorner.CornerRadius = ud(0, 6)
        else logoCorner.CornerRadius = ud(1, 0) end
        logoCorner.Parent = FloatingLogo
        AddStroke(FloatingLogo, 2)
        local logoImg = inst("ImageLabel")
        logoImg.Size = ud2(1, 0, 1, 0)
        logoImg.Position = ud2(0, 0, 0, 0)
        logoImg.BackgroundTransparency = 1
        logoImg.Image = tonumber(logoId) and "rbxthumb://type=Asset&id="..logoId.."&w=150&h=150" or logoId
        logoImg.ScaleType = Enum.ScaleType.Crop
        logoImg.ClipsDescendants = true
        local innerCorner = inst("UICorner")
        innerCorner.CornerRadius = shape == 2 and ud(0, 6) or ud(1, 0)
        innerCorner.Parent = logoImg
        logoImg.Parent = FloatingLogo
        FloatingLogo.Parent = ScreenGui
        task.spawn(function()
            local tempImg = inst("ImageLabel")
            tempImg.Image = logoImg.Image
            tempImg.Visible = false
            tempImg.Parent = ScreenGui
            pcall(function() cp:PreloadAsync({tempImg}) end)
            tempImg:Destroy()
        end)
        local isGuiOpen = true
        task.spawn(function()
            task.wait()
            if FloatingLogo and MainFrame then
                local lx, ly = FloatingLogo.AbsolutePosition.X, FloatingLogo.AbsolutePosition.Y
                local lw, lh = FloatingLogo.AbsoluteSize.X, FloatingLogo.AbsoluteSize.Y
                local targetY = ly + (lh / 2) - (UI_SIZE.Height / 2)
                MainFrame.Position = ud2(0, lx + lw + 15, 0, targetY)
            end
        end)
        local dragL = false
        local dragStartL, startPosL, hasMovedL
        FloatingLogo.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragL = true
                hasMovedL = false
                dragStartL = input.Position
                startPosL = FloatingLogo.Position
                local conn
                conn = rs.Heartbeat:Connect(function()
                    if not dragL then return end
                    local delta = input.Position - dragStartL
                    if delta.Magnitude > 3 then hasMovedL = true end
                    FloatingLogo.Position = ud2(startPosL.X.Scale, startPosL.X.Offset + delta.X, startPosL.Y.Scale, startPosL.Y.Offset + delta.Y)
                end)
                local endConn
                endConn = uis.InputEnded:Connect(function(ie)
                    if ie.UserInputType == input.UserInputType then
                        dragL = false
                        if conn then conn:Disconnect() end
                        if endConn then endConn:Disconnect() end
                    end
                end)
            end
        end)
        FloatingLogo.MouseButton1Click:Connect(function()
            if not hasMovedL then
                isGuiOpen = not isGuiOpen
                MainFrame.Visible = isGuiOpen
                if not isGuiOpen then
                    for drop, _ in pairs(activeDropdowns) do
                        if drop and drop.Parent then drop.Parent:Destroy(); activeDropdowns[drop] = nil end
                    end
                end
            end
        end)
    end
    local FloatBtn = inst("ImageButton")
    FloatBtn.Name = "FloatBtn"
    FloatBtn.Size = ud2(0, 44, 0, 44)
    FloatBtn.Position = ud2(0, 16, 0.5, 40)
    FloatBtn.BackgroundColor3 = Colors.Background
    FloatBtn.BackgroundTransparency = 0.3
    FloatBtn.AutoButtonColor = false
    FloatBtn.ClipsDescendants = true
    FloatBtn.ScaleType = Enum.ScaleType.Fit
    FloatBtn.Image = tonumber("128185233852701") and "rbxthumb://type=Asset&id=128185233852701&w=150&h=150" or "128185233852701"
    local fbCorner = inst("UICorner")
    fbCorner.CornerRadius = ud(0, 14)
    fbCorner.Parent = FloatBtn
    local fbPad = inst("UIPadding")
    fbPad.PaddingTop = ud(0, 6)
    fbPad.PaddingBottom = ud(0, 6)
    fbPad.PaddingLeft = ud(0, 6)
    fbPad.PaddingRight = ud(0, 6)
    fbPad.Parent = FloatBtn
    local fbStroke = AddStroke(FloatBtn, 2)
    local fbStrokeGrad = fbStroke:FindFirstChildOfClass("UIGradient")
    rs.RenderStepped:Connect(function()
        if fbStrokeGrad and fbStrokeGrad:IsDescendantOf(game) then
            fbStrokeGrad.Rotation = (tick() * 90) % 360
        end
    end)
    FloatBtn.Parent = ScreenGui
    local fbDrag = false
    local fbDragStart, fbStartPos, fbMoved
    FloatBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            fbDrag = true
            fbMoved = false
            fbDragStart = input.Position
            fbStartPos = FloatBtn.Position
            local conn
            conn = rs.Heartbeat:Connect(function()
                if not fbDrag then return end
                local delta = input.Position - fbDragStart
                if delta.Magnitude > 3 then fbMoved = true end
                ts:Create(FloatBtn, ti(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = ud2(fbStartPos.X.Scale, fbStartPos.X.Offset + delta.X, fbStartPos.Y.Scale, fbStartPos.Y.Offset + delta.Y)}):Play()
            end)
            local endConn
            endConn = uis.InputEnded:Connect(function(ie)
                if ie.UserInputType == input.UserInputType then
                    fbDrag = false
                    if conn then conn:Disconnect() end
                    if endConn then endConn:Disconnect() end
                end
            end)
        end
    end)
    FloatBtn.MouseButton1Click:Connect(function()
        if not fbMoved then
            MainFrame.Visible = not MainFrame.Visible
            if not MainFrame.Visible then
                for drop, _ in pairs(activeDropdowns) do
                    if drop and drop.Parent then drop.Parent:Destroy(); activeDropdowns[drop] = nil end
                end
            end
        end
    end)
    local rgbAnimation
    rgbAnimation = rs.Heartbeat:Connect(function()
        local tTime = tick()
        mainGradient.Offset = v2(math.sin(tTime * 0.5) * 0.7, math.cos(tTime * 0.5) * 0.7)
    end)
    local TitleBar = inst("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = ud2(1, 0, 0, ELEMENT_SIZES.TitleBar)
    TitleBar.BackgroundColor3 = Colors.SecondaryBg
    TitleBar.BackgroundTransparency = 0.1
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    inst("UICorner", TitleBar).CornerRadius = ud(0, 8, 0, 0)
    local TitleLabel = inst("TextLabel")
    TitleLabel.Name = "Title"
    TitleLabel.Size = ud2(0.6, 0, 1, 0)
    TitleLabel.Position = ud2(0, 8, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = Window.Title
    TitleLabel.TextColor3 = Colors.Text
    TitleLabel.TextSize = 14
    TitleLabel.Font = Fonts.Bold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.TextScaled = true
    TitleLabel.TextWrapped = true
    local titleConst = inst("UITextSizeConstraint")
    titleConst.MaxTextSize = 14
    titleConst.MinTextSize = 8
    titleConst.Parent = TitleLabel
    TitleLabel.Parent = TitleBar
    if titleIcon then
        local TitleIcon = inst("ImageLabel")
        TitleIcon.Name = "TitleIcon"
        TitleIcon.Size = ud2(0, 14, 0, 14)
        TitleIcon.Position = ud2(0, 8, 0.5, -7)
        TitleIcon.BackgroundTransparency = 1
        TitleIcon.ImageColor3 = Colors.Text
        TitleIcon.ScaleType = Enum.ScaleType.Fit
        ApplyIcon(TitleIcon, titleIcon.Icon)
        TitleIcon.Parent = TitleBar
        TitleLabel.Position = ud2(0, 28, 0, 0)
        TitleLabel.Size = ud2(0.6, -20, 1, 0)
    end
    local Controls = inst("Frame")
    Controls.Name = "Controls"
    Controls.Size = ud2(0, 40, 1, 0)
    Controls.Position = ud2(1, -45, 0, 0)
    Controls.BackgroundTransparency = 1
    Controls.Parent = TitleBar
    local MinimizeButton = inst("TextButton")
    MinimizeButton.Name = "Minimize"
    MinimizeButton.Size = ud2(0, 18, 0, 18)
    MinimizeButton.Position = ud2(0, 0, 0.5, -9)
    MinimizeButton.BackgroundColor3 = Colors.ControlButton
    MinimizeButton.Text = "-"
    MinimizeButton.TextColor3 = Colors.TextInactive
    MinimizeButton.TextSize = 16
    MinimizeButton.Font = Fonts.Bold
    MinimizeButton.AutoButtonColor = false
    MinimizeButton:SetAttribute("IsMinimized", false)
    inst("UICorner", MinimizeButton).CornerRadius = ud(1, 0)
    AddStroke(MinimizeButton)
    MinimizeButton.Parent = Controls
    if logoId then MinimizeButton.Visible = false end
    local CloseButton = inst("TextButton")
    CloseButton.Name = "Close"
    CloseButton.Size = ud2(0, 18, 0, 18)
    CloseButton.Position = ud2(0, 22, 0.5, -9)
    CloseButton.BackgroundColor3 = Colors.ControlButton
    CloseButton.Text = ">"
    CloseButton.TextColor3 = Colors.TextInactive
    CloseButton.TextSize = 14
    CloseButton.Font = Fonts.Bold
    CloseButton.AutoButtonColor = false
    inst("UICorner", CloseButton).CornerRadius = ud(1, 0)
    AddStroke(CloseButton)
    CloseButton.Parent = Controls
    local TabsScrollFrame = inst("ScrollingFrame")
    TabsScrollFrame.Name = "TabsScroll"
    TabsScrollFrame.Size = ud2(1, 0, 0, ELEMENT_SIZES.TabHeight)
    TabsScrollFrame.Position = ud2(0, 0, 0, ELEMENT_SIZES.TitleBar + 8)
    TabsScrollFrame.BackgroundTransparency = 1
    TabsScrollFrame.BorderSizePixel = 0
    TabsScrollFrame.ScrollBarThickness = 0
    TabsScrollFrame.ScrollBarImageColor3 = Colors.Border
    TabsScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.X
    TabsScrollFrame.ScrollingDirection = Enum.ScrollingDirection.X
    TabsScrollFrame.ScrollingEnabled = true
    TabsScrollFrame.Parent = MainFrame
    local TabsContainer = inst("Frame")
    TabsContainer.Name = "TabsContainer"
    TabsContainer.Size = ud2(0, 0, 1, 0)
    TabsContainer.AutomaticSize = Enum.AutomaticSize.X
    TabsContainer.BackgroundTransparency = 1
    TabsContainer.Parent = TabsScrollFrame
    local TabsPadding = inst("UIPadding")
    TabsPadding.PaddingLeft = ud(0, 8)
    TabsPadding.PaddingRight = ud(0, 4)
    TabsPadding.Parent = TabsContainer
    local TabsList = inst("UIListLayout")
    TabsList.FillDirection = Enum.FillDirection.Horizontal
    TabsList.Padding = ud(0, 4)
    TabsList.SortOrder = Enum.SortOrder.LayoutOrder
    TabsList.VerticalAlignment = Enum.VerticalAlignment.Center
    TabsList.Parent = TabsContainer
    local ContentArea = inst("Frame")
    ContentArea.Name = "ContentArea"
    ContentArea.Size = ud2(1, -16, 1, -(ELEMENT_SIZES.TitleBar + ELEMENT_SIZES.TabHeight + 20))
    ContentArea.Position = ud2(0, 8, 0, ELEMENT_SIZES.TitleBar + ELEMENT_SIZES.TabHeight + 12)
    ContentArea.BackgroundColor3 = Colors.SecondaryBg
    ContentArea.BackgroundTransparency = 0.4
    ContentArea.ClipsDescendants = true
    ContentArea.Parent = MainFrame
    inst("UICorner", ContentArea).CornerRadius = ud(0, 6)
    local caStroke = AddStroke(ContentArea)
    caStroke.Transparency = 0.5
    function Window:SetFooter(...)
        local text = ""
        local icon, shape = nil, 1
        for _, arg in ipairs({...}) do
            if type(arg) == "number" then
                if arg == 1 or arg == 2 then shape = arg
                elseif arg > 999 then icon = arg end
            elseif type(arg) == "string" then
                if tonumber(arg) then
                    local num = tonumber(arg)
                    if num == 1 or num == 2 then shape = num
                    elseif num > 999 then icon = num end
                elseif arg:match("rbxassetid") or arg:match("rbxthumb") then icon = arg
                else text = arg end
            end
        end
        if MainFrame:FindFirstChild("FooterFrame") then MainFrame.FooterFrame:Destroy() end
        local FooterFrame = inst("Frame")
        FooterFrame.Name = "FooterFrame"
        FooterFrame.Size = ud2(1, -16, 0, 14)
        FooterFrame.Position = ud2(0, 8, 1, -16)
        FooterFrame.BackgroundTransparency = 1
        FooterFrame.Parent = MainFrame
        ContentArea.Size = ud2(1, -16, 1, -(ELEMENT_SIZES.TitleBar + ELEMENT_SIZES.TabHeight + 30))
        local tOff = 8
        if icon then
            tOff = 20
            local img = inst("ImageLabel")
            img.Size = ud2(0, 12, 0, 12)
            img.Position = ud2(0, 4, 0.5, -6)
            img.BackgroundTransparency = 1
            img.Image = tonumber(icon) and "rbxthumb://type=Asset&id="..icon.."&w=150&h=150" or icon
            img.ScaleType = Enum.ScaleType.Fit
            inst("UICorner", img).CornerRadius = shape == 2 and ud(0,4) or ud(1,0)
            img.Parent = FooterFrame
            task.spawn(function() pcall(function() cp:PreloadAsync({img}) end) end)
        end
        local lbl = inst("TextLabel")
        lbl.Size = ud2(1, -tOff - 4, 1, 0)
        lbl.Position = ud2(0, tOff, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = text or ""
        lbl.TextColor3 = Colors.TextInactive
        lbl.TextSize = 10
        lbl.Font = Fonts.Normal
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.TextScaled = true
        lbl.TextWrapped = true
        local const = inst("UITextSizeConstraint")
        const.MaxTextSize = 10
        const.MinTextSize = 8
        const.Parent = lbl
        lbl.Parent = FooterFrame
    end
    local function CreateClickEffect(button)
        local eff = inst("Frame")
        eff.Name = "ClickEffect"
        eff.Size = ud2(1, 0, 1, 0)
        eff.BackgroundColor3 = Colors.Accent
        eff.BackgroundTransparency = 0.7
        eff.ZIndex = -1
        local c = button:FindFirstChildWhichIsA("UICorner")
        inst("UICorner", eff).CornerRadius = c and c.CornerRadius or ud(0, 6)
        eff.Parent = button
        ts:Create(eff, ti(0.3), { BackgroundTransparency = 1 }):Play()
        task.delay(0.3, function() eff:Destroy() end)
    end
    local function SetupButtonHover(btn, isCtrl)
        if isCtrl then
            btn.MouseEnter:Connect(function()
                btn.BackgroundColor3 = (btn.Name == "Close") and Colors.CloseButton or Colors.Hover
                btn.TextColor3 = Colors.Text
            end)
            btn.MouseLeave:Connect(function()
                btn.BackgroundColor3 = Colors.ControlButton
                btn.TextColor3 = Colors.TextInactive
            end)
            return
        end
        btn.MouseEnter:Connect(function() ts:Create(btn, ti(0.2), {BackgroundColor3 = Colors.Hover}):Play() end)
        btn.MouseLeave:Connect(function() ts:Create(btn, ti(0.2), {BackgroundColor3 = Colors.Button}):Play() end)
    end
    SetupButtonHover(CloseButton, true)
    SetupButtonHover(MinimizeButton, true)
    local dragging = false
    local dragStart, startPos
    local function update(input)
        if not dragging then return end
        guiHasBeenDragged = true
        local delta = input.Position - dragStart
        ts:Create(MainFrame, ti(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = ud2(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}):Play()
        for drop, _ in pairs(activeDropdowns) do
            if drop then drop.Position = ud2(0, MainFrame.AbsolutePosition.X + MainFrame.AbsoluteSize.X + 10, 0, MainFrame.AbsolutePosition.Y + MainFrame.AbsoluteSize.Y - drop.Size.Y.Offset) end
        end
    end
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            if input.UserInputType == Enum.UserInputType.Touch then MainFrame.Active = true end
            local conn
            conn = rs.Heartbeat:Connect(function() update(input) end)
            local function onInputEnded(inputEnded)
                if inputEnded.UserInputType == input.UserInputType then
                    dragging = false
                    if conn then conn:Disconnect() end
                end
            end
            uis.InputEnded:Connect(onInputEnded)
        end
    end)
    CloseButton.MouseButton1Click:Connect(function()
        CreateClickEffect(CloseButton)
        if rgbAnimation then rgbAnimation:Disconnect() end
        ScreenGui:Destroy()
    end)
    local minTween
    MinimizeButton.MouseButton1Click:Connect(function()
        CreateClickEffect(MinimizeButton)
        local isMin = MinimizeButton:GetAttribute("IsMinimized")
        if minTween then minTween:Cancel() end
        if not isMin then
            MinimizeButton:SetAttribute("IsMinimized", true)
            MinimizeButton.Text = "+"
            for drop, _ in pairs(activeDropdowns) do
                if drop and drop.Parent then drop.Parent:Destroy(); activeDropdowns[drop] = nil end
            end
            minTween = ts:Create(MainFrame, ti(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = ud2(0, UI_SIZE.Width, 0, ELEMENT_SIZES.TitleBar)})
            minTween.Completed:Connect(function(state)
                if state == Enum.PlaybackState.Completed and MinimizeButton:GetAttribute("IsMinimized") then
                    TabsScrollFrame.Visible = false
                    ContentArea.Visible = false
                    if MainFrame:FindFirstChild("FooterFrame") then MainFrame.FooterFrame.Visible = false end
                end
            end)
            minTween:Play()
        else
            MinimizeButton:SetAttribute("IsMinimized", false)
            MinimizeButton.Text = "-"
            TabsScrollFrame.Visible = true
            ContentArea.Visible = true
            if MainFrame:FindFirstChild("FooterFrame") then MainFrame.FooterFrame.Visible = true end
            minTween = ts:Create(MainFrame, ti(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = ud2(0, UI_SIZE.Width, 0, UI_SIZE.Height)})
            minTween:Play()
        end
    end)
    function Window:NewSection(name, icon, packName)
        local Section = {Name = name}
        local hasIcon = icon ~= nil
        local TabBtn = inst("TextButton")
        TabBtn.Name = name .. "_Tab"
        TabBtn.Size = ud2(0, 0, 0, 24)
        TabBtn.AutomaticSize = Enum.AutomaticSize.X
        TabBtn.BackgroundColor3 = Colors.TabInactive
        TabBtn.Text = name
        TabBtn.TextColor3 = Colors.TextInactive
        TabBtn.TextSize = 11
        TabBtn.Font = Fonts.Bold
        TabBtn.AutoButtonColor = false
        TabBtn.LayoutOrder = #Window.Sections + 1
        TabBtn.TextXAlignment = Enum.TextXAlignment.Left
        inst("UICorner", TabBtn).CornerRadius = ud(0, 5)
        AddStroke(TabBtn)
        AddSubtleGradient(TabBtn)
        local tabPad = inst("UIPadding")
        tabPad.PaddingLeft = ud(0, hasIcon and 28 or 8)
        tabPad.PaddingRight = ud(0, 8)
        tabPad.Parent = TabBtn
        if hasIcon then
            local TabIcon = inst("ImageLabel")
            TabIcon.Name = "TabIcon"
            TabIcon.AnchorPoint = Vector2.new(0, 0.5)
            TabIcon.Size = ud2(0, 14, 0, 14)
            TabIcon.Position = ud2(0, -20, 0.5, 0)
            TabIcon.BackgroundTransparency = 1
            TabIcon.ImageColor3 = Colors.TextInactive
            TabIcon.ScaleType = Enum.ScaleType.Fit
            ApplyIcon(TabIcon, icon, packName)
            TabIcon.Parent = TabBtn
        end
        TabBtn.Parent = TabsContainer
        TabBtn.MouseEnter:Connect(function()
            if Window.CurrentSection ~= Section then ts:Create(TabBtn, ti(0.2), {BackgroundColor3 = Colors.Hover}):Play() end
        end)
        TabBtn.MouseLeave:Connect(function()
            if Window.CurrentSection ~= Section then ts:Create(TabBtn, ti(0.2), {BackgroundColor3 = Colors.TabInactive}):Play() end
        end)
        local SecFrame = inst("ScrollingFrame")
        SecFrame.Name = name .. "_Content"
        SecFrame.Size = ud2(1, 0, 1, 0)
        SecFrame.BackgroundTransparency = 1
        SecFrame.BorderSizePixel = 0
        SecFrame.ScrollBarThickness = 3
        SecFrame.ScrollBarImageColor3 = Colors.Disabled
        SecFrame.Visible = false
        SecFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
        SecFrame.CanvasSize = ud2(0, 0, 0, 0)
        inst("UICorner", SecFrame).CornerRadius = ud(0, 6)
        local secList = inst("UIListLayout")
        secList.Padding = ud(0, ELEMENT_SIZES.SectionSpacing)
        secList.SortOrder = Enum.SortOrder.LayoutOrder
        secList.Parent = SecFrame
        local secPad = inst("UIPadding")
        secPad.PaddingTop = ud(0, 6)
        secPad.PaddingBottom = ud(0, 6)
        secPad.PaddingLeft = ud(0, 8)
        secPad.PaddingRight = ud(0, 8)
        secPad.Parent = SecFrame
        SecFrame.Parent = ContentArea
        secList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            SecFrame.CanvasSize = ud2(0, 0, 0, secList.AbsoluteContentSize.Y + 12)
        end)
        if #Window.Sections == 0 then
            TabBtn.BackgroundColor3 = Colors.TabActive
            TabBtn.TextColor3 = Colors.Text
            local ic = TabBtn:FindFirstChild("TabIcon")
            if ic then ic.ImageColor3 = Colors.Text end
            SecFrame.Visible = true
            Window.CurrentSection = Section
        end
        TabBtn.MouseButton1Click:Connect(function()
            CreateClickEffect(TabBtn)
            for _, tab in pairs(TabsContainer:GetChildren()) do
                if tab:IsA("TextButton") then
                    tab.BackgroundColor3 = Colors.TabInactive
                    tab.TextColor3 = Colors.TextInactive
                    local ic = tab:FindFirstChild("TabIcon")
                    if ic then ic.ImageColor3 = Colors.TextInactive end
                end
            end
            for _, frame in pairs(ContentArea:GetChildren()) do
                if frame:IsA("ScrollingFrame") then frame.Visible = false end
            end
            TabBtn.BackgroundColor3 = Colors.TabActive
            TabBtn.TextColor3 = Colors.Text
            local ic = TabBtn:FindFirstChild("TabIcon")
            if ic then ic.ImageColor3 = Colors.Text end
            SecFrame.Visible = true
            Window.CurrentSection = Section
        end)
        function Section:CreateButton(bname, callback, icon)
            local Btn = inst("TextButton")
            Btn.Name = bname
            Btn.Size = ud2(1, 0, 0, ELEMENT_SIZES.ButtonHeight)
            Btn.BackgroundColor3 = Colors.Button
            Btn.Text = bname
            Btn.TextColor3 = Colors.Text
            Btn.TextSize = 13
            Btn.Font = Fonts.Bold
            Btn.AutoButtonColor = false
            Btn.LayoutOrder = #SecFrame:GetChildren()
            Btn.TextScaled = true
            Btn.TextWrapped = true
            local btnConst = inst("UITextSizeConstraint")
            btnConst.MaxTextSize = 13
            btnConst.MinTextSize = 8
            btnConst.Parent = Btn
            inst("UICorner", Btn).CornerRadius = ud(0, 5)
            AddStroke(Btn)
            AddSubtleGradient(Btn)
            Btn.Parent = SecFrame
            MakeLeftIcon(Btn, icon, 2)
            SetupButtonHover(Btn, false)
            Btn.MouseButton1Click:Connect(function() CreateClickEffect(Btn); if callback then callback() end end)
            return Btn
        end
        function Section:CreateToggle(tname, default, callback, icon)
            local Tgl = inst("Frame")
            Tgl.Name = tname
            Tgl.Size = ud2(1, 0, 0, ELEMENT_SIZES.ToggleHeight)
            Tgl.BackgroundTransparency = 1
            Tgl.LayoutOrder = #SecFrame:GetChildren()
            MakeLeftIcon(Tgl, icon)
            local Lbl = inst("TextLabel")
            Lbl.Position = ud2(0, icon and 28 or 0, 0, 0)
            Lbl.Size = ud2(0.7, icon and -28 or 0, 1, 0)
            Lbl.BackgroundTransparency = 1
            Lbl.Text = tname
            Lbl.TextColor3 = Colors.Text
            Lbl.TextSize = 13
            Lbl.Font = Fonts.Bold
            Lbl.TextXAlignment = Enum.TextXAlignment.Left
            Lbl.TextScaled = true
            Lbl.TextWrapped = true
            local tglConst = inst("UITextSizeConstraint")
            tglConst.MaxTextSize = 13
            tglConst.MinTextSize = 8
            tglConst.Parent = Lbl
            Lbl.Parent = Tgl
            local TglBtn = inst("TextButton")
            TglBtn.Name = "Toggle"
            TglBtn.Size = ud2(0, 40, 0, 20)
            TglBtn.Position = ud2(1, -42, 0.5, -10)
            TglBtn.BackgroundColor3 = default and Colors.ToggleOn or Colors.ToggleOff
            TglBtn.Text = ""
            TglBtn.AutoButtonColor = false
            inst("UICorner", TglBtn).CornerRadius = ud(1, 0)
            AddStroke(TglBtn)
            TglBtn.Parent = Tgl
            local Knob = inst("Frame")
            Knob.Name = "Knob"
            Knob.AnchorPoint = Vector2.new(0, 0.5)
            Knob.Size = ud2(0, 14, 0, 14)
            Knob.Position = default and ud2(1, -17, 0.5, 0) or ud2(0, 3, 0.5, 0)
            Knob.BackgroundColor3 = Colors.Text
            Knob.BorderSizePixel = 0
            inst("UICorner", Knob).CornerRadius = ud(1, 0)
            Knob.Parent = TglBtn
            Tgl.Parent = SecFrame
            local state = default or false
            local function RefreshToggle()
                local info = ti(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                ts:Create(TglBtn, info, {BackgroundColor3 = state and Colors.ToggleOn or Colors.ToggleOff}):Play()
                ts:Create(Knob, info, {Position = state and ud2(1, -17, 0.5, 0) or ud2(0, 3, 0.5, 0)}):Play()
            end
            TglBtn.MouseButton1Click:Connect(function()
                CreateClickEffect(TglBtn)
                state = not state
                RefreshToggle()
                if callback then callback(state) end
            end)
            return Tgl
        end
        function Section:CreateSlider(sname, min, max, default, callback, icon)
            local Sldr = inst("Frame")
            Sldr.Name = sname
            Sldr.Size = ud2(1, 0, 0, ELEMENT_SIZES.SliderHeight)
            Sldr.BackgroundTransparency = 1
            Sldr.LayoutOrder = #SecFrame:GetChildren()
            MakeLeftIcon(Sldr, icon, 1, 0, 9)
            local Lbl = inst("TextLabel")
            Lbl.Position = ud2(0, icon and 28 or 0, 0, 0)
            Lbl.Size = ud2(1, icon and -28 or 0, 0, 18)
            Lbl.BackgroundTransparency = 1
            Lbl.Text = sname .. ": " .. default
            Lbl.TextColor3 = Colors.Text
            Lbl.TextSize = 13
            Lbl.Font = Fonts.Bold
            Lbl.TextXAlignment = Enum.TextXAlignment.Left
            Lbl.TextScaled = true
            Lbl.TextWrapped = true
            local sldrConst = inst("UITextSizeConstraint")
            sldrConst.MaxTextSize = 13
            sldrConst.MinTextSize = 8
            sldrConst.Parent = Lbl
            Lbl.Parent = Sldr
            local Trk = inst("Frame")
            Trk.Name = "Track"
            Trk.Size = ud2(1, -16, 0, 4)
            Trk.Position = ud2(0, 8, 0, 22)
            Trk.BackgroundColor3 = Colors.ToggleOff
            inst("UICorner", Trk).CornerRadius = ud(1, 0)
            Trk.Parent = Sldr
            local Fill = inst("Frame")
            Fill.Name = "Fill"
            Fill.Size = ud2((default - min) / (max - min), 0, 1, 0)
            Fill.BackgroundColor3 = Colors.Slider
            inst("UICorner", Fill).CornerRadius = ud(1, 0)
            Fill.Parent = Trk
            local Btn = inst("TextButton")
            Btn.Name = "SliderButton"
            Btn.Size = ud2(0, 16, 0, 16)
            Btn.Position = ud2(Fill.Size.X.Scale, -8, 0.5, -8)
            Btn.BackgroundColor3 = Colors.Text
            Btn.Text = ""
            Btn.AutoButtonColor = false
            inst("UICorner", Btn).CornerRadius = ud(1, 0)
            Btn.Parent = Trk
            Sldr.Parent = SecFrame
            local draggingSldr = false
            local function SetSliderVisual(pct)
                local info = ti(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                ts:Create(Btn, info, {Position = ud2(pct, -8, 0.5, -8)}):Play()
                ts:Create(Fill, info, {Size = ud2(pct, 0, 1, 0)}):Play()
            end
            local function SetSliderValue(input)
                local pct = math.clamp((input.Position.X - Trk.AbsolutePosition.X) / Trk.AbsoluteSize.X, 0, 1)
                SetSliderVisual(pct)
                local val = math.floor(min + (pct * (max - min)))
                Lbl.Text = sname .. ": " .. val
                if callback then callback(val) end
            end
            Btn.MouseButton1Down:Connect(function() draggingSldr = true end)
            Trk.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    draggingSldr = true
                    SetSliderValue(input)
                end
            end)
            uis.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then draggingSldr = false end
            end)
            uis.InputChanged:Connect(function(input)
                if draggingSldr and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    SetSliderValue(input)
                end
            end)
            return Sldr
        end
        function Section:CreateDropdown(dname, opts, default, callback, icon)
            local Drop = inst("Frame")
            Drop.Name = dname
            Drop.Size = ud2(1, 0, 0, ELEMENT_SIZES.DropdownHeight)
            Drop.BackgroundTransparency = 1
            Drop.ClipsDescendants = false
            Drop.LayoutOrder = #SecFrame:GetChildren()
            local DBtn = inst("TextButton")
            DBtn.Name = "DropdownButton"
            DBtn.Size = ud2(1, 0, 0, ELEMENT_SIZES.DropdownHeight)
            DBtn.BackgroundColor3 = Colors.Button
            DBtn.Text = opts[default] or opts[1] or "Select"
            DBtn.TextColor3 = Colors.Text
            DBtn.TextSize = 13
            DBtn.Font = Fonts.Bold
            DBtn.AutoButtonColor = false
            DBtn.TextScaled = true
            DBtn.TextWrapped = true
            local dbtnConst = inst("UITextSizeConstraint")
            dbtnConst.MaxTextSize = 13
            dbtnConst.MinTextSize = 8
            dbtnConst.Parent = DBtn
            inst("UICorner", DBtn).CornerRadius = ud(0, 5)
            AddStroke(DBtn)
            AddSubtleGradient(DBtn)
            DBtn.Parent = Drop
            MakeLeftIcon(DBtn, icon, 2)
            local DIcon = inst("TextLabel")
            DIcon.Name = "Icon"
            DIcon.Size = ud2(0, 20, 1, 0)
            DIcon.Position = ud2(1, -25, 0, 0)
            DIcon.BackgroundTransparency = 1
            DIcon.Text = ">"
            DIcon.TextColor3 = Colors.TextInactive
            DIcon.TextSize = 16
            DIcon.Font = Fonts.Bold
            DIcon.Parent = DBtn
            Drop.Parent = SecFrame
            SetupButtonHover(DBtn, false)
            local open, OptCont, OptGui, clickConn, dropConn, sizeTween = false, nil, nil, nil, nil, nil
            local function CloseOptions()
                local cont, gui = OptCont, OptGui
                OptCont = nil
                OptGui = nil
                if cont then activeDropdowns[cont] = nil end
                if dropConn then dropConn:Disconnect(); dropConn = nil end
                if clickConn then clickConn:Disconnect(); clickConn = nil end
                if sizeTween then sizeTween:Cancel() end
                ts:Create(DIcon, ti(0.2), {Rotation = 0}):Play()
                open = false
                if cont and gui then
                    sizeTween = ts:Create(cont, ti(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = ud2(0, 160, 0, 0)})
                    sizeTween.Completed:Connect(function() gui:Destroy() end)
                    sizeTween:Play()
                end
            end
            DBtn.MouseButton1Click:Connect(function()
                CreateClickEffect(DBtn)
                if open then CloseOptions(); return end
                open = true
                ts:Create(DIcon, ti(0.2), {Rotation = 90}):Play()
                OptGui = inst("ScreenGui")
                OptGui.Name = genHash()
                OptGui:SetAttribute("OxDrop", true)
                OptGui.ResetOnSpawn = false
                OptGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                OptGui.DisplayOrder = 12
                OptGui.Parent = ScreenGui
                local h = math.clamp((#opts * 28) + ((#opts - 1) * 4) + 12, 40, 160)
                OptCont = inst("ScrollingFrame")
                OptCont.Name = "OptCont"
                OptCont.Size = ud2(0, 160, 0, 0)
                OptCont.Position = ud2(0, MainFrame.AbsolutePosition.X + MainFrame.AbsoluteSize.X + 10, 0, MainFrame.AbsolutePosition.Y + MainFrame.AbsoluteSize.Y)
                OptCont.BackgroundColor3 = c3(255, 255, 255)
                OptCont.BorderSizePixel = 0
                OptCont.ZIndex = 100
                OptCont.ScrollBarThickness = 3
                OptCont.ScrollBarImageColor3 = Colors.Disabled
                OptCont.AutomaticCanvasSize = Enum.AutomaticSize.Y
                OptCont.CanvasSize = ud2(0, 0, 0, 0)
                inst("UICorner", OptCont).CornerRadius = ud(0, 8)
                AddStroke(OptCont, 2)
                local dGrad = inst("UIGradient")
                dGrad.Color = mainGradient.Color
                dGrad.Rotation = 45
                dGrad.Parent = OptCont
                local l = inst("UIListLayout")
                l.SortOrder = Enum.SortOrder.LayoutOrder
                l.Padding = ud(0, 4)
                l.Parent = OptCont
                local pad = inst("UIPadding")
                pad.PaddingTop, pad.PaddingBottom, pad.PaddingLeft, pad.PaddingRight = ud(0,6), ud(0,6), ud(0,6), ud(0,6)
                pad.Parent = OptCont
                for _, opt in pairs(opts) do
                    local oBtn = inst("TextButton")
                    oBtn.Name = opt
                    oBtn.Size = ud2(1, 0, 0, 28)
                    oBtn.BackgroundColor3 = Colors.Button
                    oBtn.Text = opt
                    oBtn.TextColor3 = Colors.Text
                    oBtn.TextSize = 13
                    oBtn.TextScaled = true
                    oBtn.TextWrapped = true
                    oBtn.Font = Fonts.Bold
                    oBtn.AutoButtonColor = false
                    oBtn.ZIndex = 101
                    local con = inst("UITextSizeConstraint")
                    con.MaxTextSize = 13
                    con.MinTextSize = 8
                    con.Parent = oBtn
                    inst("UICorner", oBtn).CornerRadius = ud(0, 6)
                    AddStroke(oBtn)
                    AddSubtleGradient(oBtn)
                    oBtn.Parent = OptCont
                    oBtn.MouseEnter:Connect(function() oBtn.BackgroundColor3 = Colors.Hover end)
                    oBtn.MouseLeave:Connect(function() oBtn.BackgroundColor3 = Colors.Button end)
                    oBtn.MouseButton1Click:Connect(function()
                        CreateClickEffect(oBtn)
                        DBtn.Text = opt
                        if callback then callback(opt) end
                        CloseOptions()
                    end)
                end
                OptCont.Parent = OptGui
                activeDropdowns[OptCont] = true
                if sizeTween then sizeTween:Cancel() end
                sizeTween = ts:Create(OptCont, ti(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = ud2(0, 160, 0, h)})
                sizeTween:Play()
                dropConn = rs.Heartbeat:Connect(function()
                    if OptCont and open then
                        OptCont.Position = ud2(0, MainFrame.AbsolutePosition.X + MainFrame.AbsoluteSize.X + 10, 0, MainFrame.AbsolutePosition.Y + MainFrame.AbsoluteSize.Y - OptCont.Size.Y.Offset)
                        dGrad.Offset = v2(math.sin(tick() * 0.5) * 0.7, math.cos(tick() * 0.5) * 0.7)
                    end
                end)
                clickConn = uis.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        local m = input.Position
                        local bp, bs = DBtn.AbsolutePosition, DBtn.AbsoluteSize
                        local cp, cs = OptCont and OptCont.AbsolutePosition, OptCont and OptCont.AbsoluteSize
                        local inBtn = m.X >= bp.X and m.X <= bp.X + bs.X and m.Y >= bp.Y and m.Y <= bp.Y + bs.Y
                        local inCont = cp and cs and m.X >= cp.X and m.X <= cp.X + cs.X and m.Y >= cp.Y and m.Y <= cp.Y + cs.Y
                        if not inBtn and not inCont then CloseOptions() end
                    end
                end)
            end)
            return Drop
        end
        function Section:CreateDropdownMulti(dname, opts, defaults, callback, icon)
            local selected = {}
            if type(defaults) == "table" then
                for _, v in pairs(defaults) do selected[v] = true end
            end
            local function GetSelectedList()
                local list = {}
                for _, opt in ipairs(opts) do if selected[opt] then table.insert(list, opt) end end
                return list
            end
            local function DisplayText()
                local count = #GetSelectedList()
                if count == 0 then return "None Selected" end
                return count .. " Selected"
            end
            local Drop = inst("Frame")
            Drop.Name = dname
            Drop.Size = ud2(1, 0, 0, ELEMENT_SIZES.DropdownHeight)
            Drop.BackgroundTransparency = 1
            Drop.ClipsDescendants = false
            Drop.LayoutOrder = #SecFrame:GetChildren()
            local DBtn = inst("TextButton")
            DBtn.Name = "DropdownButton"
            DBtn.Size = ud2(1, 0, 0, ELEMENT_SIZES.DropdownHeight)
            DBtn.BackgroundColor3 = Colors.Button
            DBtn.Text = DisplayText()
            DBtn.TextColor3 = Colors.Text
            DBtn.TextSize = 13
            DBtn.Font = Fonts.Bold
            DBtn.AutoButtonColor = false
            DBtn.TextScaled = true
            DBtn.TextWrapped = true
            local dbtnConst = inst("UITextSizeConstraint")
            dbtnConst.MaxTextSize = 13
            dbtnConst.MinTextSize = 8
            dbtnConst.Parent = DBtn
            inst("UICorner", DBtn).CornerRadius = ud(0, 5)
            AddStroke(DBtn)
            AddSubtleGradient(DBtn)
            DBtn.Parent = Drop
            MakeLeftIcon(DBtn, icon, 2)
            local DIcon = inst("TextLabel")
            DIcon.Name = "Icon"
            DIcon.Size = ud2(0, 20, 1, 0)
            DIcon.Position = ud2(1, -25, 0, 0)
            DIcon.BackgroundTransparency = 1
            DIcon.Text = ">"
            DIcon.TextColor3 = Colors.TextInactive
            DIcon.TextSize = 16
            DIcon.Font = Fonts.Bold
            DIcon.Parent = DBtn
            Drop.Parent = SecFrame
            SetupButtonHover(DBtn, false)
            local function RefreshOption(oBtn, isOn)
                ts:Create(oBtn, ti(0.3), {BackgroundColor3 = isOn and Colors.ToggleOn or Colors.Button, TextColor3 = isOn and Colors.Text or Colors.TextInactive}):Play()
            end
            local open, OptCont, OptGui, clickConn, dropConn, sizeTween = false, nil, nil, nil, nil, nil
            local function CloseOptions()
                local cont, gui = OptCont, OptGui
                OptCont = nil
                OptGui = nil
                if cont then activeDropdowns[cont] = nil end
                if dropConn then dropConn:Disconnect(); dropConn = nil end
                if clickConn then clickConn:Disconnect(); clickConn = nil end
                if sizeTween then sizeTween:Cancel() end
                ts:Create(DIcon, ti(0.2), {Rotation = 0}):Play()
                open = false
                if cont and gui then
                    sizeTween = ts:Create(cont, ti(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = ud2(0, 160, 0, 0)})
                    sizeTween.Completed:Connect(function() gui:Destroy() end)
                    sizeTween:Play()
                end
            end
            DBtn.MouseButton1Click:Connect(function()
                CreateClickEffect(DBtn)
                if open then CloseOptions(); return end
                open = true
                ts:Create(DIcon, ti(0.2), {Rotation = 90}):Play()
                OptGui = inst("ScreenGui")
                OptGui.Name = genHash()
                OptGui:SetAttribute("OxDrop", true)
                OptGui.ResetOnSpawn = false
                OptGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                OptGui.DisplayOrder = 12
                OptGui.Parent = ScreenGui
                local h = math.clamp((#opts * 28) + ((#opts - 1) * 4) + 12, 40, 160)
                OptCont = inst("ScrollingFrame")
                OptCont.Name = "OptCont"
                OptCont.Size = ud2(0, 160, 0, 0)
                OptCont.Position = ud2(0, MainFrame.AbsolutePosition.X + MainFrame.AbsoluteSize.X + 10, 0, MainFrame.AbsolutePosition.Y + MainFrame.AbsoluteSize.Y)
                OptCont.BackgroundColor3 = c3(255, 255, 255)
                OptCont.BorderSizePixel = 0
                OptCont.ZIndex = 100
                OptCont.ScrollBarThickness = 3
                OptCont.ScrollBarImageColor3 = Colors.Disabled
                OptCont.AutomaticCanvasSize = Enum.AutomaticSize.Y
                OptCont.CanvasSize = ud2(0, 0, 0, 0)
                inst("UICorner", OptCont).CornerRadius = ud(0, 8)
                AddStroke(OptCont, 2)
                local dGrad = inst("UIGradient")
                dGrad.Color = mainGradient.Color
                dGrad.Rotation = 45
                dGrad.Parent = OptCont
                local l = inst("UIListLayout")
                l.SortOrder = Enum.SortOrder.LayoutOrder
                l.Padding = ud(0, 4)
                l.Parent = OptCont
                local pad = inst("UIPadding")
                pad.PaddingTop, pad.PaddingBottom, pad.PaddingLeft, pad.PaddingRight = ud(0,6), ud(0,6), ud(0,6), ud(0,6)
                pad.Parent = OptCont
                for _, opt in ipairs(opts) do
                    local oBtn = inst("TextButton")
                    oBtn.Name = opt
                    oBtn.Size = ud2(1, 0, 0, 28)
                    oBtn.BackgroundColor3 = Colors.Button
                    oBtn.Text = opt
                    oBtn.TextColor3 = Colors.TextInactive
                    oBtn.TextSize = 13
                    oBtn.TextScaled = true
                    oBtn.TextWrapped = true
                    oBtn.Font = Fonts.Bold
                    oBtn.AutoButtonColor = false
                    oBtn.ZIndex = 101
                    local con = inst("UITextSizeConstraint")
                    con.MaxTextSize = 13
                    con.MinTextSize = 8
                    con.Parent = oBtn
                    inst("UICorner", oBtn).CornerRadius = ud(0, 6)
                    AddStroke(oBtn)
                    AddSubtleGradient(oBtn)
                    oBtn.Parent = OptCont
                    if selected[opt] then RefreshOption(oBtn, true) end
                    oBtn.MouseEnter:Connect(function()
                        if not selected[opt] then ts:Create(oBtn, ti(0.2), {BackgroundColor3 = Colors.Hover}):Play() end
                    end)
                    oBtn.MouseLeave:Connect(function()
                        if not selected[opt] then ts:Create(oBtn, ti(0.2), {BackgroundColor3 = Colors.Button}):Play() end
                    end)
                    oBtn.MouseButton1Click:Connect(function()
                        CreateClickEffect(oBtn)
                        selected[opt] = (not selected[opt]) and true or nil
                        RefreshOption(oBtn, selected[opt] == true)
                        DBtn.Text = DisplayText()
                        if callback then callback(GetSelectedList()) end
                    end)
                end
                OptCont.Parent = OptGui
                activeDropdowns[OptCont] = true
                if sizeTween then sizeTween:Cancel() end
                sizeTween = ts:Create(OptCont, ti(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = ud2(0, 160, 0, h)})
                sizeTween:Play()
                dropConn = rs.Heartbeat:Connect(function()
                    if OptCont and open then
                        OptCont.Position = ud2(0, MainFrame.AbsolutePosition.X + MainFrame.AbsoluteSize.X + 10, 0, MainFrame.AbsolutePosition.Y + MainFrame.AbsoluteSize.Y - OptCont.Size.Y.Offset)
                        dGrad.Offset = v2(math.sin(tick() * 0.5) * 0.7, math.cos(tick() * 0.5) * 0.7)
                    end
                end)
                clickConn = uis.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        local m = input.Position
                        local bp, bs = DBtn.AbsolutePosition, DBtn.AbsoluteSize
                        local cp, cs = OptCont and OptCont.AbsolutePosition, OptCont and OptCont.AbsoluteSize
                        local inBtn = m.X >= bp.X and m.X <= bp.X + bs.X and m.Y >= bp.Y and m.Y <= bp.Y + bs.Y
                        local inCont = cp and cs and m.X >= cp.X and m.X <= cp.X + cs.X and m.Y >= cp.Y and m.Y <= cp.Y + cs.Y
                        if not inBtn and not inCont then CloseOptions() end
                    end
                end)
            end)
            return Drop
        end
        function Section:CreateTextbox(boxName, callback, icon)
            local Tbox = inst("Frame")
            Tbox.Name = boxName
            Tbox.Size = ud2(1, 0, 0, ELEMENT_SIZES.TextboxHeight)
            Tbox.BackgroundTransparency = 1
            Tbox.LayoutOrder = #SecFrame:GetChildren()
            MakeLeftIcon(Tbox, icon, 2)
            local Inp = inst("TextBox")
            Inp.Name = "Input"
            Inp.Position = ud2(0, icon and 26 or 0, 0, 0)
            Inp.Size = ud2(1, icon and -26 or 0, 1, 0)
            Inp.BackgroundColor3 = Colors.Button
            Inp.Text = ""
            Inp.PlaceholderText = "Type"
            Inp.TextColor3 = Colors.Text
            Inp.PlaceholderColor3 = Colors.TextInactive
            Inp.TextSize = 13
            Inp.Font = Fonts.Normal
            Inp.TextXAlignment = Enum.TextXAlignment.Center
            Inp.TextScaled = true
            Inp.TextWrapped = true
            local inpConst = inst("UITextSizeConstraint")
            inpConst.MaxTextSize = 13
            inpConst.MinTextSize = 8
            inpConst.Parent = Inp
            inst("UICorner", Inp).CornerRadius = ud(0, 5)
            AddStroke(Inp)
            AddSubtleGradient(Inp)
            Inp.Parent = Tbox
            local pad = inst("UIPadding")
            pad.PaddingLeft = ud(0, 10)
            pad.PaddingRight = ud(0, 10)
            pad.Parent = Inp
            Tbox.Parent = SecFrame
            Inp.FocusLost:Connect(function() if callback then callback(Inp.Text) end end)
            return Tbox
        end
        table.insert(Window.Sections, Section)
        return Section
    end
    MainFrame.Parent = ScreenGui
    pcall(function() ScreenGui.Parent = core end)
    if not ScreenGui.Parent then ScreenGui.Parent = lplr:WaitForChild("PlayerGui") end
    RunIntro(Window, MainFrame)
    table.insert(self.Windows, Window)
    return Window
end
return XiuxianUI.new()
