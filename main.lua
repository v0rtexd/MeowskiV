--[[
    Allusive Lite – Roblox UI Library
    ----------------------------------------------------
    • Single-file UI library inspired by the structure you referenced
    • Features: Window, Tabs, Sections, Toggle, Button, Slider, Dropdown,
      Textbox, Keybind, Label, Separator, Notifications, Config Save/Load
    • Works in vanilla Roblox LocalScripts (no external assets); file IO
      helpers auto-disable if the environment does not support them.

    Usage (example):

        local UI = loadstring(game:HttpGet("https://your.cdn/allusive_lite.lua"))()

        local win = UI:CreateWindow({
            Title = "Allusive Lite",
            SubTitle = "Example",
            Size = UDim2.fromOffset(700, 480),
            Keybind = Enum.KeyCode.RightControl, -- show/hide
        })

        local a = win:AddTab({ Title = "Main", Icon = "rbxassetid://3926305904" })
        local sec = a:AddSection("Features")

        sec:AddToggle({ Text = "Godmode", Default = false }, function(v)
            print("Godmode:", v)
        end)

        sec:AddSlider({ Text = "WalkSpeed", Min = 16, Max = 100, Default = 16, Suffix = " u/s" }, function(v)
            print("WalkSpeed:", v)
        end)

        sec:AddDropdown({ Text = "Team", Options = {"Red","Blue","Green"}, Default = "Red" }, function(v)
            print("Team:", v)
        end)

        sec:AddTextbox({ Text = "Nickname", Placeholder = "Type..." }, function(v)
            print("Nickname:", v)
        end)

        sec:AddKeybind({ Text = "Panic Key", Default = Enum.KeyCode.P }, function()
            print("Panic pressed!")
        end)

        sec:AddButton({ Text = "Notify" }, function()
            UI:Notify({ Title = "Hello", Text = "This is a test", Duration = 3 })
        end)

        -- Save & Load
        UI:SetFlag("walkspeed", 16)
        UI:SaveConfig("AllusiveLite.json")
        UI:LoadConfig("AllusiveLite.json")

    ----------------------------------------------------
]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer and LocalPlayer:GetMouse()

-- Utility & safe environment wrappers
local function safe_call(fn, ...)
    local ok, res = pcall(fn, ...)
    if ok then return true, res end
    warn("Allusive Lite:", res)
    return false, res
end

local hasFileIO = (writefile and readfile and isfile) and true or false

local Util = {}
function Util:Round(n, dec)
    local m = 10 ^ (dec or 0)
    return math.floor(n * m + 0.5) / m
end
function Util:Clamp(x, a, b)
    return math.clamp(x, a, b)
end
function Util:Draggable(frame, dragHandle)
    dragHandle = dragHandle or frame
    local dragging = false
    local dragStart, startPos
    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

local Theme = {
    Bg = Color3.fromRGB(16, 16, 18),
    Panel = Color3.fromRGB(22, 22, 26),
    Panel2 = Color3.fromRGB(28, 28, 34),
    Text = Color3.fromRGB(230, 230, 235),
    SubText = Color3.fromRGB(170, 170, 180),
    Accent = Color3.fromRGB(110, 170, 255),
    Accent2 = Color3.fromRGB(140, 110, 255),
    Stroke = Color3.fromRGB(60, 60, 68),
    Good = Color3.fromRGB(70, 210, 120),
    Warn = Color3.fromRGB(255, 180, 80),
    Bad = Color3.fromRGB(240, 85, 95),
}

-- Root UI container
local function createScreenGui()
    local sg = Instance.new("ScreenGui")
    sg.Name = "AllusiveLite"
    sg.ResetOnSpawn = false
    sg.ZIndexBehavior = Enum.ZIndexBehavior.Global
    sg.IgnoreGuiInset = true
    sg.Parent = (gethui and gethui()) or LocalPlayer:WaitForChild("PlayerGui")
    return sg
end

-- Text helper
local function newText(parent, text, size, bold, color)
    local l = Instance.new("TextLabel")
    l.BackgroundTransparency = 1
    l.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight[bold and "Bold" or "Regular"], Enum.FontStyle.Normal)
    l.Text = text or ""
    l.TextSize = size or 16
    l.TextColor3 = color or Theme.Text
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.TextYAlignment = Enum.TextYAlignment.Center
    l.RichText = true
    l.Parent = parent
    return l
end

-- Button helper
local function newButton(parent, text)
    local b = Instance.new("TextButton")
    b.BackgroundColor3 = Theme.Panel2
    b.AutoButtonColor = false
    b.Size = UDim2.new(0, 120, 0, 32)
    b.Text = ""

    local uic = Instance.new("UICorner", b); uic.CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new("UIStroke", b); stroke.Color = Theme.Stroke; stroke.Thickness = 1

    local t = newText(b, text, 16, true)
    t.Size = UDim2.new(1, -16, 1, 0); t.Position = UDim2.fromOffset(8, 0)

    b.MouseEnter:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.12), { BackgroundColor3 = Theme.Panel }):Play()
    end)
    b.MouseLeave:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.12), { BackgroundColor3 = Theme.Panel2 }):Play()
    end)
    return b
end

-- Toggle helper
local function newToggle(parent)
    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(1, 0, 0, 34)
    holder.BackgroundTransparency = 1
    holder.Parent = parent

    local box = Instance.new("Frame")
    box.Size = UDim2.fromOffset(22, 22)
    box.Position = UDim2.fromOffset(8, 6)
    box.BackgroundColor3 = Theme.Panel2
    box.Parent = holder
    local uic = Instance.new("UICorner", box); uic.CornerRadius = UDim.new(0, 6)
    local stroke = Instance.new("UIStroke", box); stroke.Color = Theme.Stroke; stroke.Thickness = 1

    local dot = Instance.new("Frame", box)
    dot.BackgroundColor3 = Theme.Accent
    dot.BackgroundTransparency = 1
    dot.Size = UDim2.fromOffset(14, 14)
    dot.Position = UDim2.fromOffset(4, 4)
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

    local t = newText(holder, "Toggle", 16, false)
    t.Size = UDim2.new(1, -40, 1, 0)
    t.Position = UDim2.fromOffset(36, 0)

    return holder, box, dot, t
end

-- Slider helper
local function newSlider(parent)
    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(1, 0, 0, 46)
    holder.BackgroundTransparency = 1
    holder.Parent = parent

    local label = newText(holder, "Slider", 16, false)
    label.Size = UDim2.new(1, -10, 0, 22)
    label.Position = UDim2.fromOffset(8, 0)

    local back = Instance.new("Frame", holder)
    back.Size = UDim2.new(1, -16, 0, 8)
    back.Position = UDim2.fromOffset(8, 28)
    back.BackgroundColor3 = Theme.Panel2
    Instance.new("UICorner", back).CornerRadius = UDim.new(0, 6)
    local stroke = Instance.new("UIStroke", back); stroke.Color = Theme.Stroke; stroke.Thickness = 1

    local fill = Instance.new("Frame", back)
    fill.Size = UDim2.fromScale(0, 1)
    fill.BackgroundColor3 = Theme.Accent
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 6)

    local valueText = newText(holder, "0", 14, true, Theme.SubText)
    valueText.Size = UDim2.fromOffset(100, 20)
    valueText.Position = UDim2.new(1, -108, 0, 0)
    valueText.TextXAlignment = Enum.TextXAlignment.Right

    return holder, label, back, fill, valueText
end

-- Dropdown helper
local function newDropdown(parent)
    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(1, 0, 0, 34)
    holder.BackgroundTransparency = 1
    holder.Parent = parent

    local box = Instance.new("Frame")
    box.Size = UDim2.new(1, -16, 0, 30)
    box.Position = UDim2.fromOffset(8, 2)
    box.BackgroundColor3 = Theme.Panel2
    box.Parent = holder
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", box); stroke.Color = Theme.Stroke; stroke.Thickness = 1

    local t = newText(box, "Select", 16, false)
    t.Size = UDim2.new(1, -30, 1, 0)
    t.Position = UDim2.fromOffset(10, 0)

    local arrow = newText(box, "▼", 16, true, Theme.SubText)
    arrow.Size = UDim2.fromOffset(20, 30)
    arrow.Position = UDim2.new(1, -22, 0, 0)
    arrow.TextXAlignment = Enum.TextXAlignment.Right

    local list = Instance.new("Frame")
    list.Visible = false
    list.BackgroundColor3 = Theme.Panel
    list.Parent = holder
    list.Position = UDim2.new(0, 8, 1, 4)
    list.Size = UDim2.new(1, -16, 0, 0)
    Instance.new("UICorner", list).CornerRadius = UDim.new(0, 8)
    local lstroke = Instance.new("UIStroke", list); lstroke.Color = Theme.Stroke

    local uiList = Instance.new("UIListLayout", list)
    uiList.Padding = UDim.new(0, 4)
    uiList.FillDirection = Enum.FillDirection.Vertical
    uiList.SortOrder = Enum.SortOrder.LayoutOrder

    return holder, box, list, t, arrow, uiList
end

-- Textbox helper
local function newTextbox(parent)
    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(1, 0, 0, 34)
    holder.BackgroundTransparency = 1
    holder.Parent = parent

    local box = Instance.new("TextBox")
    box.BackgroundColor3 = Theme.Panel2
    box.Size = UDim2.new(1, -16, 0, 30)
    box.Position = UDim2.fromOffset(8, 2)
    box.ClearTextOnFocus = false
    box.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
    box.TextSize = 16
    box.TextColor3 = Theme.Text
    box.PlaceholderColor3 = Theme.SubText
    box.Parent = holder
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", box); stroke.Color = Theme.Stroke

    return holder, box
end

-- Keybind helper
local function newKeybind(parent)
    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(1, 0, 0, 34)
    holder.BackgroundTransparency = 1
    holder.Parent = parent

    local box = Instance.new("Frame")
    box.BackgroundColor3 = Theme.Panel2
    box.Size = UDim2.new(0, 160, 0, 30)
    box.Position = UDim2.fromOffset(8, 2)
    box.Parent = holder
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", box); stroke.Color = Theme.Stroke

    local t = newText(box, "None", 16, false)
    t.Size = UDim2.new(1, -10, 1, 0)
    t.Position = UDim2.fromOffset(8, 0)

    return holder, box, t
end

-- List container for sections
local function newSectionContainer(parent)
    local frame = Instance.new("ScrollingFrame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.CanvasSize = UDim2.new(0, 0, 0, 0)
    frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    frame.BackgroundTransparency = 1
    frame.ScrollBarThickness = 4
    frame.ScrollBarImageTransparency = 0.3
    frame.Parent = parent

    local uiList = Instance.new("UIListLayout", frame)
    uiList.Padding = UDim.new(0, 10)
    uiList.FillDirection = Enum.FillDirection.Vertical
    uiList.HorizontalAlignment = Enum.HorizontalAlignment.Left
    uiList.SortOrder = Enum.SortOrder.LayoutOrder

    return frame
end

-- Notification manager
local function createNotifier(root)
    local container = Instance.new("Frame")
    container.BackgroundTransparency = 1
    container.Size = UDim2.new(0, 320, 1, -20)
    container.Position = UDim2.new(1, -340, 0, 10)
    container.Parent = root

    local list = Instance.new("UIListLayout", container)
    list.Padding = UDim.new(0, 8)
    list.FillDirection = Enum.FillDirection.Vertical
    list.HorizontalAlignment = Enum.HorizontalAlignment.Right
    list.SortOrder = Enum.SortOrder.LayoutOrder

    local notifier = {}
    function notifier:Push(opts)
        opts = opts or {}
        local title = opts.Title or "Notice"
        local text = opts.Text or ""
        local duration = tonumber(opts.Duration) or 3

        local card = Instance.new("Frame")
        card.BackgroundColor3 = Theme.Panel
        card.Size = UDim2.new(1, 0, 0, 0)
        card.Parent = container
        Instance.new("UICorner", card).CornerRadius = UDim.new(0, 12)
        local stroke = Instance.new("UIStroke", card); stroke.Color = Theme.Stroke

        local pad = Instance.new("UIPadding", card)
        pad.PaddingTop = UDim.new(0, 10)
        pad.PaddingBottom = UDim.new(0, 10)
        pad.PaddingLeft = UDim.new(0, 12)
        pad.PaddingRight = UDim.new(0, 12)

        local t1 = newText(card, title, 16, true)
        t1.Size = UDim2.new(1, 0, 0, 20)
        local t2 = newText(card, text, 15, false, Theme.SubText)
        t2.Size = UDim2.new(1, 0, 0, 20)
        t2.Position = UDim2.fromOffset(0, 22)

        card.Size = UDim2.new(1, 0, 0, 0)
        TweenService:Create(card, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(1, 0, 0, 60) }):Play()

        task.spawn(function()
            task.wait(duration)
            TweenService:Create(card, TweenInfo.new(0.18), { BackgroundTransparency = 1 }):Play()
            for _, v in ipairs(card:GetDescendants()) do
                if v:IsA("UIStroke") then
                    TweenService:Create(v, TweenInfo.new(0.18), { Transparency = 1 }):Play()
                elseif v:IsA("TextLabel") then
                    TweenService:Create(v, TweenInfo.new(0.18), { TextTransparency = 1 }):Play()
                end
            end
            task.wait(0.2)
            card:Destroy()
        end)
    end
    return notifier
end

-- Config manager
local Config = { Data = {} }
function Config:Set(key, value)
    self.Data[key] = value
end
function Config:Get(key, default)
    local v = self.Data[key]
    if v == nil then return default end
    return v
end
function Config:Save(filename)
    if not hasFileIO then return false, "File IO not supported" end
    local json = HttpService:JSONEncode(self.Data)
    return safe_call(writefile, filename, json)
end
function Config:Load(filename)
    if not hasFileIO or not isfile(filename) then return false, "No file" end
    local ok, content = safe_call(readfile, filename)
    if not ok then return false, content end
    local ok2, tbl = pcall(function()
        return HttpService:JSONDecode(content)
    end)
    if ok2 and type(tbl) == "table" then
        self.Data = tbl
        return true
    end
    return false, "Invalid JSON"
end

-- Library
local Library = {}
Library.__index = Library

function Library.new()
    local self = setmetatable({}, Library)
    self.Gui = createScreenGui()
    self.Notifier = createNotifier(self.Gui)
    self.Flags = {}
    self.Hidden = false
    self.ToggleKey = Enum.KeyCode.RightControl

    UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if input.KeyCode == self.ToggleKey then
            self.Hidden = not self.Hidden
            self.Gui.Enabled = not self.Hidden
        end
    end)

    return self
end

function Library:SetFlag(key, value)
    self.Flags[key] = value
end
function Library:GetFlag(key, default)
    local v = self.Flags[key]
    if v == nil then return default end
    return v
end
function Library:SaveConfig(path)
    for k, v in pairs(self.Flags) do
        Config:Set(k, v)
    end
    return Config:Save(path)
end
function Library:LoadConfig(path)
    local ok = Config:Load(path)
    if ok then
        for k, v in pairs(Config.Data) do
            self.Flags[k] = v
        end
    end
    return ok
end

function Library:Notify(opts)
    self.Notifier:Push(opts)
end

-- Window
function Library:CreateWindow(opts)
    opts = opts or {}
    local title = opts.Title or "Allusive"
    local subtitle = opts.SubTitle or "UI"
    local size = opts.Size or UDim2.fromOffset(760, 520)
    self.ToggleKey = opts.Keybind or self.ToggleKey

    local root = Instance.new("Frame")
    root.Name = "Window"
    root.Size = size
    root.Position = UDim2.new(0.5, -size.X.Offset/2, 0.5, -size.Y.Offset/2)
    root.BackgroundColor3 = Theme.Bg
    root.Parent = self.Gui

    local uic = Instance.new("UICorner", root); uic.CornerRadius = UDim.new(0, 16)
    local stroke = Instance.new("UIStroke", root); stroke.Color = Theme.Stroke; stroke.Thickness = 1

    local topbar = Instance.new("Frame", root)
    topbar.Size = UDim2.new(1, 0, 0, 46)
    topbar.BackgroundColor3 = Theme.Panel
    Instance.new("UICorner", topbar).CornerRadius = UDim.new(0, 16)
    local sep = Instance.new("Frame", root)
    sep.Size = UDim2.new(1, 0, 0, 1)
    sep.Position = UDim2.fromOffset(0, 46)
    sep.BackgroundColor3 = Theme.Stroke

    local titleL = newText(topbar, title, 18, true)
    titleL.Position = UDim2.fromOffset(14, 0)
    titleL.Size = UDim2.new(0, 300, 1, 0)

    local subL = newText(topbar, subtitle, 14, false, Theme.SubText)
    subL.Position = UDim2.fromOffset(14, 20)
    subL.Size = UDim2.new(0, 300, 1, 0)

    -- Dragging
    Util:Draggable(root, topbar)

    -- Sidebar
    local sidebar = Instance.new("Frame", root)
    sidebar.Size = UDim2.new(0, 180, 1, -47)
    sidebar.Position = UDim2.fromOffset(0, 47)
    sidebar.BackgroundColor3 = Theme.Panel

    local sideList = Instance.new("UIListLayout", sidebar)
    sideList.FillDirection = Enum.FillDirection.Vertical
    sideList.SortOrder = Enum.SortOrder.LayoutOrder
    sideList.Padding = UDim.new(0, 6)

    local sidePad = Instance.new("UIPadding", sidebar)
    sidePad.PaddingTop = UDim.new(0, 8)
    sidePad.PaddingLeft = UDim.new(0, 8)
    sidePad.PaddingRight = UDim.new(0, 8)

    -- Content area
    local content = Instance.new("Frame", root)
    content.Size = UDim2.new(1, -192, 1, -58)
    content.Position = UDim2.fromOffset(188, 54)
    content.BackgroundTransparency = 1

    local pages = Instance.new("Folder", content)

    local window = {}
    window._tabs = {}
    window._pages = pages

    function window:AddTab(opts2)
        opts2 = opts2 or {}
        local tTitle = opts2.Title or "Tab"
        local icon = opts2.Icon -- optional asset id string

        local tabBtn = newButton(sidebar, tTitle)
        tabBtn.Size = UDim2.new(1, 0, 0, 36)

        if icon then
            local img = Instance.new("ImageLabel", tabBtn)
            img.BackgroundTransparency = 1
            img.Size = UDim2.fromOffset(20, 20)
            img.Position = UDim2.fromOffset(10, 8)
            img.Image = icon
            local lbl = tabBtn:FindFirstChildOfClass("TextLabel")
            if lbl then lbl.Position = UDim2.fromOffset(36, 0) end
        end

        local page = Instance.new("Frame", pages)
        page.Size = UDim2.new(1, 0, 1, 0)
        page.BackgroundTransparency = 1
        page.Visible = false

        local left = Instance.new("Frame", page)
        left.Size = UDim2.new(0.5, -6, 1, 0)
        left.BackgroundTransparency = 1

        local right = Instance.new("Frame", page)
        right.Size = UDim2.new(0.5, -6, 1, 0)
        right.Position = UDim2.new(0.5, 12, 0, 0)
        right.BackgroundTransparency = 1

        local leftList = newSectionContainer(left)
        local rightList = newSectionContainer(right)

        local tab = { _page = page, _btn = tabBtn, _sections = { left = leftList, right = rightList } }
        table.insert(window._tabs, tab)

        local function select()
            for _, t in ipairs(window._tabs) do
                t._page.Visible = false
                TweenService:Create(t._btn, TweenInfo.new(0.12), { BackgroundColor3 = Theme.Panel2 }):Play()
            end
            page.Visible = true
            TweenService:Create(tabBtn, TweenInfo.new(0.12), { BackgroundColor3 = Theme.Panel }):Play()
        end

        tabBtn.MouseButton1Click:Connect(select)
        if #window._tabs == 1 then select() end

        function tab:AddSection(title3, side)
            side = string.lower(side or "left")
            local parentList = (side == "right") and rightList or leftList

            local group = Instance.new("Frame", parentList)
            group.BackgroundColor3 = Theme.Panel
            group.Size = UDim2.new(1, -8, 0, 44)
            Instance.new("UICorner", group).CornerRadius = UDim.new(0, 12)
            local stroke = Instance.new("UIStroke", group); stroke.Color = Theme.Stroke

            local titleL = newText(group, title3 or "Section", 16, true)
            titleL.Size = UDim2.new(1, -16, 0, 24)
            titleL.Position = UDim2.fromOffset(10, 8)

            local container = Instance.new("Frame", group)
            container.Name = "Container"
            container.Size = UDim2.new(1, -16, 0, 0)
            container.Position = UDim2.fromOffset(8, 36)
            container.BackgroundTransparency = 1

            local list = Instance.new("UIListLayout", container)
            list.Padding = UDim.new(0, 8)
            list.FillDirection = Enum.FillDirection.Vertical
            list.SortOrder = Enum.SortOrder.LayoutOrder

            group.AutomaticSize = Enum.AutomaticSize.Y
            container.AutomaticSize = Enum.AutomaticSize.Y

            local section = {}
            section._container = container

            function section:AddLabel(text)
                local l = newText(container, text or "Label", 15, false, Theme.SubText)
                l.Size = UDim2.new(1, -10, 0, 20)
                return l
            end
            function section:AddSeparator()
                local line = Instance.new("Frame", container)
                line.BackgroundColor3 = Theme.Stroke
                line.Size = UDim2.new(1, 0, 0, 1)
                return line
            end
            function section:AddButton(optsB, cb)
                local b = newButton(container, (optsB and optsB.Text) or "Button")
                b.Size = UDim2.new(1, -10, 0, 32)
                b.MouseButton1Click:Connect(function()
                    if cb then cb() end
                end)
                return b
            end
            function section:AddToggle(optsT, cb)
                optsT = optsT or {}
                local holder, box, dot, label = newToggle(container)
                label.Text = optsT.Text or "Toggle"
                local state = optsT.Default and true or false

                local function set(v)
                    state = (v == true)
                    TweenService:Create(dot, TweenInfo.new(0.12), {
                        BackgroundTransparency = state and 0 or 1
                    }):Play()
                    if cb then cb(state) end
                end

                holder.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        set(not state)
                    end
                end)

                set(state)
                return {
                    Set = set,
                    Get = function() return state end,
                }
            end
            function section:AddSlider(optsS, cb)
                optsS = optsS or {}
                local holder, label, back, fill, valueText = newSlider(container)
                label.Text = optsS.Text or "Slider"
                local min = tonumber(optsS.Min) or 0
                local max = tonumber(optsS.Max) or 100
                local value = tonumber(optsS.Default) or min
                local suffix = optsS.Suffix or ""

                local function render()
                    local alpha = (value - min) / (max - min)
                    alpha = Util:Clamp(alpha, 0, 1)
                    fill.Size = UDim2.fromScale(alpha, 1)
                    valueText.Text = tostring(Util:Round(value, 2)) .. (suffix and (" "..suffix) or "")
                end

                local dragging = false
                local function setFromX(x)
                    local rel = math.clamp((x - back.AbsolutePosition.X) / back.AbsoluteSize.X, 0, 1)
                    value = min + (max - min) * rel
                    value = tonumber(string.format("%.2f", value))
                    render()
                    if cb then cb(value) end
                end

                back.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        setFromX(input.Position.X)
                    end
                end)
                back.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)
                UserInputService.InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        setFromX(input.Position.X)
                    end
                end)

                render()
                return {
                    Set = function(v) value = Util:Clamp(tonumber(v) or value, min, max); render(); if cb then cb(value) end end,
                    Get = function() return value end,
                }
            end
            function section:AddDropdown(optsD, cb)
                optsD = optsD or {}
                local holder, box, list, t, arrow, uiList = newDropdown(container)
                t.Text = optsD.Text or "Select"
                local options = optsD.Options or {}
                local current = optsD.Default
                local open = false

                local function set(v)
                    current = v
                    if v ~= nil then
                        t.Text = tostring(v)
                    end
                    if cb then cb(current) end
                end

                local function rebuild()
                    list:ClearAllChildren()
                    uiList.Parent = list -- reparent to persist
                    for _, opt in ipairs(options) do
                        local btn = newButton(list, tostring(opt))
                        btn.Size = UDim2.new(1, -10, 0, 28)
                        btn.MouseButton1Click:Connect(function()
                            set(opt)
                            open = false
                            list.Visible = false
                            list.Size = UDim2.new(1, -16, 0, 0)
                        end)
                    end
                    task.wait()
                    list.Size = UDim2.new(1, -16, 0, math.min(#options * 32 + 8, 180))
                end

                box.MouseButton1Click:Connect(function()
                    open = not open
                    list.Visible = open
                    if open then rebuild() end
                end)

                if current ~= nil then set(current) end

                return {
                    Set = set,
                    Get = function() return current end,
                    SetOptions = function(newOpts)
                        options = newOpts or {}
                        if open then rebuild() end
                    end
                }
            end
            function section:AddTextbox(optsX, cb)
                optsX = optsX or {}
                local holder, box = newTextbox(container)
                box.PlaceholderText = optsX.Placeholder or ""
                box.Text = optsX.Default or ""
                local label = newText(holder, optsX.Text or "Input", 16, false)
                label.Size = UDim2.new(1, -10, 0, 20)
                label.Position = UDim2.fromOffset(8, -18)

                box.FocusLost:Connect(function(enter)
                    if cb then cb(box.Text) end
                end)
                return box
            end
            function section:AddKeybind(optsK, cb)
                optsK = optsK or {}
                local holder, box, label = newKeybind(container)
                local current = optsK.Default or Enum.KeyCode.Unknown
                local listening = false

                local function render()
                    label.Text = (current ~= Enum.KeyCode.Unknown) and current.Name or "None"
                end

                box.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        listening = true
                        label.Text = "Press any key..."
                    end
                end)

                UserInputService.InputBegan:Connect(function(input, gpe)
                    if listening and not gpe and input.UserInputType == Enum.UserInputType.Keyboard then
                        current = input.KeyCode
                        listening = false
                        render()
                        if cb then cb() end
                    elseif not listening and input.KeyCode == current then
                        if cb then cb() end
                    end
                end)

                render()
                return {
                    Set = function(k) current = k or current; render() end,
                    Get = function() return current end,
                }
            end

            return section
        end

        return tab
    end

    return window
end

-- Factory
local function init()
    return Library.new()
end

return setmetatable({
    CreateWindow = function(self, opts) return self:_inst():CreateWindow(opts) end,
    Notify = function(self, opts) return self:_inst():Notify(opts) end,
    SetFlag = function(self, k, v) return self:_inst():SetFlag(k, v) end,
    GetFlag = function(self, k, d) return self:_inst():GetFlag(k, d) end,
    SaveConfig = function(self, p) return self:_inst():SaveConfig(p) end,
    LoadConfig = function(self, p) return self:_inst():LoadConfig(p) end,
    _inst = function(self)
        if not rawget(self, "__inst") then rawset(self, "__inst", init()) end
        return rawget(self, "__inst")
    end
}, {
    __call = function()
        return init()
    end
})
