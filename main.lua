--[[
    Allusive Lite — Skinned to Your Uploaded Design
    ----------------------------------------------------
    • Same features as before (Window, Tabs, Sections, Toggle, Button, Slider,
      Dropdown, Textbox, Keybind, Label, Separator, Notifications, Config)
    • Visuals now match the design from your uploaded `ui` file:
        - Dark layered panels (10,10,15 • 16,15,22 • 23,22,32)
        - GothamSSm typography
        - Rounded corners (3–9px), thin strokes (17,17,21 / 23,23,29)
        - Accent purple (121,115,234) with variants
    • Pure single-file library for LocalScripts; file I/O safe-guarded.

    Usage (unchanged):

        local UI = loadstring(game:HttpGet("https://your.cdn/allusive_lite.lua"))()
        local win = UI:CreateWindow({
            Title = "Allusive Lite",
            SubTitle = "Skinned",
            Size = UDim2.fromOffset(720, 498),
            Keybind = Enum.KeyCode.RightControl,
        })
        local tab = win:AddTab({ Title = "Main", Icon = "rbxassetid://3926305904" })
        local sec = tab:AddSection("Features")
        sec:AddToggle({ Text = "Godmode" }, function(v) print("Godmode:", v) end)
        sec:AddSlider({ Text="WalkSpeed", Min=16, Max=100, Default=16, Suffix=" u/s" }, function(v) print(v) end)
        sec:AddDropdown({ Text="Team", Options={"Red","Blue","Green"}, Default="Red" }, function(v) print(v) end)
        sec:AddTextbox({ Text="Nickname", Placeholder="Type..." }, function(v) print(v) end)
        sec:AddKeybind({ Text="Panic", Default=Enum.KeyCode.P }, function() print("PANIC") end)
        sec:AddButton({ Text="Notify" }, function() UI:Notify({ Title="Hello", Text="It works", Duration=3 }) end)

        UI:SetFlag("walkspeed", 16)
        UI:SaveConfig("AllusiveLite.json")
        UI:LoadConfig("AllusiveLite.json")

    ----------------------------------------------------
]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer

-- Utility & safe environment wrappers
local function safe_call(fn, ...)
    local ok, res = pcall(fn, ...)
    if ok then return true, res end
    warn("Allusive Lite:", res)
    return false, res
end

local hasFileIO = (writefile and readfile and isfile) and true or false

-- =========================
-- THEME • From uploaded UI
-- =========================
local Theme = {
    -- Layered backgrounds
    Bg0   = Color3.fromRGB(10, 10, 15),  -- window outer
    Bg1   = Color3.fromRGB(16, 15, 22),  -- main body
    Bg2   = Color3.fromRGB(20, 20, 29),  -- panels
    Bg3   = Color3.fromRGB(23, 22, 32),  -- headers / inputs

    -- Text
    Text      = Color3.fromRGB(204, 204, 204),
    SubText   = Color3.fromRGB(127, 127, 127),
    Muted     = Color3.fromRGB(93, 93, 93),

    -- Accent & states
    Accent    = Color3.fromRGB(121, 115, 234), -- purple
    Accent2   = Color3.fromRGB(165, 43, 165),  -- deep violet
    Good      = Color3.fromRGB(115, 234, 115),
    Warn      = Color3.fromRGB(234, 234, 115),
    Bad       = Color3.fromRGB(234, 115, 115),
    Info      = Color3.fromRGB(115, 234, 234),

    -- Strokes (thin)
    Stroke0   = Color3.fromRGB(17, 17, 21),
    Stroke1   = Color3.fromRGB(17, 17, 25),
    Stroke2   = Color3.fromRGB(23, 23, 29),
    Stroke3   = Color3.fromRGB(22, 22, 22),

    -- Radii
    R3 = UDim.new(0, 3),  R4 = UDim.new(0, 4),  R9 = UDim.new(0, 9),  Round = UDim.new(1, 0),
}

-- Typography (GothamSSm primary; SourceSansPro fallback for some labels)
local function fontGotham(weight)
    weight = weight or Enum.FontWeight.Medium
    return Font.new("rbxasset://fonts/families/GothamSSm.json", weight, Enum.FontStyle.Normal)
end
local function fontSource(weight)
    weight = weight or Enum.FontWeight.Regular
    return Font.new("rbxasset://fonts/families/SourceSansPro.json", weight, Enum.FontStyle.Normal)
end

-- Build helpers
local function stroke(parent, color, thickness, transparency)
    local s = Instance.new("UIStroke")
    s.Color = color or Theme.Stroke2
    s.Thickness = thickness or 1
    s.Transparency = transparency or 0
    s.Parent = parent
    return s
end

local function corner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = radius or Theme.R9
    c.Parent = parent
    return c
end

local function padding(parent, t, r, b, l)
    local p = Instance.new("UIPadding")
    p.PaddingTop = UDim.new(0, t or 0)
    p.PaddingRight = UDim.new(0, r or 0)
    p.PaddingBottom = UDim.new(0, b or 0)
    p.PaddingLeft = UDim.new(0, l or 0)
    p.Parent = parent
    return p
end

-- Text helper (Gotham)
local function newText(parent, text, size, weight, color)
    local l = Instance.new("TextLabel")
    l.BackgroundTransparency = 1
    l.FontFace = fontGotham(weight or Enum.FontWeight.Medium)
    l.Text = text or ""
    l.TextSize = size or 16
    l.TextColor3 = color or Theme.Text
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.TextYAlignment = Enum.TextYAlignment.Center
    l.RichText = true
    l.Parent = parent
    return l
end

-- Button helper (matches uploaded UI: Bg3 body, Stroke2, R4/R9 corners)
local function newButton(parent, text)
    local b = Instance.new("TextButton")
    b.BackgroundColor3 = Theme.Bg3
    b.AutoButtonColor = false
    b.Size = UDim2.new(0, 120, 0, 32)
    b.Text = ""
    corner(b, Theme.R9)
    stroke(b, Theme.Stroke3, 1)

    local t = newText(b, text, 16, Enum.FontWeight.SemiBold)
    t.Size = UDim2.new(1, -16, 1, 0)
    t.Position = UDim2.fromOffset(10, 0)

    b.MouseEnter:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.12), { BackgroundColor3 = Theme.Bg2 }):Play()
    end)
    b.MouseLeave:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.12), { BackgroundColor3 = Theme.Bg3 }):Play()
    end)
    return b
end

-- Toggle control (box Bg3 + inner round dot accent)
local function newToggle(parent)
    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(1, 0, 0, 34)
    holder.BackgroundTransparency = 1
    holder.Parent = parent

    local box = Instance.new("Frame")
    box.Size = UDim2.fromOffset(22, 22)
    box.Position = UDim2.fromOffset(8, 6)
    box.BackgroundColor3 = Theme.Bg3
    box.Parent = holder
    corner(box, Theme.R9); stroke(box, Theme.Stroke2, 1)

    local dot = Instance.new("Frame", box)
    dot.BackgroundColor3 = Theme.Accent
    dot.BackgroundTransparency = 1
    dot.Size = UDim2.fromOffset(14, 14)
    dot.Position = UDim2.fromOffset(4, 4)
    corner(dot, Theme.Round)

    local t = newText(holder, "Toggle", 16, Enum.FontWeight.Medium)
    t.Size = UDim2.new(1, -40, 1, 0)
    t.Position = UDim2.fromOffset(36, 0)

    return holder, box, dot, t
end

-- Slider control (track Bg3, stroke, fill Accent)
local function newSlider(parent)
    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(1, 0, 0, 46)
    holder.BackgroundTransparency = 1
    holder.Parent = parent

    local label = newText(holder, "Slider", 16, Enum.FontWeight.Medium)
    label.Size = UDim2.new(1, -10, 0, 22)
    label.Position = UDim2.fromOffset(8, 0)

    local back = Instance.new("Frame", holder)
    back.Size = UDim2.new(1, -16, 0, 8)
    back.Position = UDim2.fromOffset(8, 28)
    back.BackgroundColor3 = Theme.Bg3
    corner(back, Theme.R4); stroke(back, Theme.Stroke2, 1)

    local fill = Instance.new("Frame", back)
    fill.Size = UDim2.fromScale(0, 1)
    fill.BackgroundColor3 = Theme.Accent
    corner(fill, Theme.R4)

    local valueText = newText(holder, "0", 14, Enum.FontWeight.SemiBold, Theme.SubText)
    valueText.Size = UDim2.fromOffset(100, 20)
    valueText.Position = UDim2.new(1, -108, 0, 0)
    valueText.TextXAlignment = Enum.TextXAlignment.Right

    return holder, label, back, fill, valueText
end

-- Dropdown (button Bg3, list Bg2, strokes from file)
local function newDropdown(parent)
    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(1, 0, 0, 34)
    holder.BackgroundTransparency = 1
    holder.Parent = parent

    local box = Instance.new("Frame")
    box.Size = UDim2.new(1, -16, 0, 30)
    box.Position = UDim2.fromOffset(8, 2)
    box.BackgroundColor3 = Theme.Bg3
    box.Parent = holder
    corner(box, Theme.R9); stroke(box, Theme.Stroke3, 1)

    local t = newText(box, "Select", 16, Enum.FontWeight.Medium)
    t.Size = UDim2.new(1, -30, 1, 0)
    t.Position = UDim2.fromOffset(10, 0)

    local arrow = newText(box, "▼", 16, Enum.FontWeight.Bold, Theme.Muted)
    arrow.Size = UDim2.fromOffset(20, 30)
    arrow.Position = UDim2.new(1, -22, 0, 0)
    arrow.TextXAlignment = Enum.TextXAlignment.Right

    local list = Instance.new("Frame")
    list.Visible = false
    list.BackgroundColor3 = Theme.Bg2
    list.Parent = holder
    list.Position = UDim2.new(0, 8, 1, 4)
    list.Size = UDim2.new(1, -16, 0, 0)
    corner(list, Theme.R9); stroke(list, Theme.Stroke3, 1)

    local uiList = Instance.new("UIListLayout", list)
    uiList.Padding = UDim.new(0, 4)
    uiList.FillDirection = Enum.FillDirection.Vertical
    uiList.SortOrder = Enum.SortOrder.LayoutOrder

    return holder, box, list, t, arrow, uiList
end

-- Textbox (Bg3, stroke1)
local function newTextbox(parent)
    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(1, 0, 0, 50)
    holder.BackgroundTransparency = 1
    holder.Parent = parent

    local label = newText(holder, "Input", 16, Enum.FontWeight.Medium)
    label.Size = UDim2.new(1, -10, 0, 20)
    label.Position = UDim2.fromOffset(8, 0)

    local box = Instance.new("TextBox")
    box.BackgroundColor3 = Theme.Bg3
    box.Size = UDim2.new(1, -16, 0, 30)
    box.Position = UDim2.fromOffset(8, 20)
    box.ClearTextOnFocus = false
    box.FontFace = fontGotham(Enum.FontWeight.Medium)
    box.TextSize = 16
    box.TextColor3 = Theme.Text
    box.PlaceholderColor3 = Theme.SubText
    box.Parent = holder
    corner(box, Theme.R9); stroke(box, Theme.Stroke2, 1)

    return holder, box, label
end

-- Keybind (Bg3, small chip)
local function newKeybind(parent)
    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(1, 0, 0, 34)
    holder.BackgroundTransparency = 1
    holder.Parent = parent

    local box = Instance.new("Frame")
    box.BackgroundColor3 = Theme.Bg3
    box.Size = UDim2.new(0, 160, 0, 30)
    box.Position = UDim2.fromOffset(8, 2)
    box.Parent = holder
    corner(box, Theme.R9); stroke(box, Theme.Stroke2, 1)

    local t = newText(box, "None", 16, Enum.FontWeight.Medium)
    t.Size = UDim2.new(1, -10, 1, 0)
    t.Position = UDim2.fromOffset(8, 0)

    return holder, box, t
end

-- Scroll container
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

-- ScreenGui root
local function createScreenGui()
    local sg = Instance.new("ScreenGui")
    sg.Name = "AllusiveLite"
    sg.ResetOnSpawn = false
    sg.ZIndexBehavior = Enum.ZIndexBehavior.Global
    sg.IgnoreGuiInset = true
    sg.Parent = (gethui and gethui()) or LocalPlayer:WaitForChild("PlayerGui")
    return sg
end

-- Basic draggable helper
local function makeDraggable(frame, handle)
    handle = handle or frame
    local dragging, startPos, startInput
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            startPos = frame.Position
            startInput = input
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - startInput.Position
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- Notifications (card Bg2, strokes)
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
        card.BackgroundColor3 = Theme.Bg2
        card.Size = UDim2.new(1, 0, 0, 0)
        card.Parent = container
        corner(card, Theme.R9); stroke(card, Theme.Stroke0, 1)

        padding(card, 10, 12, 10, 12)
        local t1 = newText(card, title, 16, Enum.FontWeight.SemiBold)
        t1.Size = UDim2.new(1, 0, 0, 20)
        local t2 = newText(card, text, 15, Enum.FontWeight.Medium, Theme.SubText)
        t2.Size = UDim2.new(1, 0, 0, 20)
        t2.Position = UDim2.fromOffset(0, 22)

        TweenService:Create(card, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(1, 0, 0, 60) }):Play()
        task.spawn(function()
            task.wait(duration)
            TweenService:Create(card, TweenInfo.new(0.18), { BackgroundTransparency = 1 }):Play()
            for _, v in ipairs(card:GetDescendants()) do
                if v:IsA("UIStroke") then TweenService:Create(v, TweenInfo.new(0.18), { Transparency = 1 }):Play()
                elseif v:IsA("TextLabel") then TweenService:Create(v, TweenInfo.new(0.18), { TextTransparency = 1 }):Play() end
            end
            task.wait(0.2)
            card:Destroy()
        end)
    end
    return notifier
end

-- Config manager
local Config = { Data = {} }
function Config:Set(key, value) self.Data[key] = value end
function Config:Get(key, default) local v = self.Data[key]; if v == nil then return default end; return v end
function Config:Save(filename)
    if not hasFileIO then return false, "File IO not supported" end
    local json = HttpService:JSONEncode(self.Data)
    return safe_call(writefile, filename, json)
end
function Config:Load(filename)
    if not hasFileIO or not isfile(filename) then return false, "No file" end
    local ok, content = safe_call(readfile, filename)
    if not ok then return false, content end
    local ok2, tbl = pcall(function() return HttpService:JSONDecode(content) end)
    if ok2 and type(tbl) == "table" then self.Data = tbl; return true end
    return false, "Invalid JSON"
end

-- Library core
local Library = {}
Library.__index = Library

function Library.new()
    local self = setmetatable({}, Library)
    self.Gui = createScreenGui()
    self.Notifier = createNotifier(self.Gui)
    self.Flags = {}
    self.Hidden = false
    self.ToggleKey = Enum.KeyCode.RightControl
    return self
end

function Library:SetFlag(key, value) self.Flags[key] = value end
function Library:GetFlag(key, default) local v = self.Flags[key]; if v == nil then return default end; return v end
function Library:SaveConfig(path) for k,v in pairs(self.Flags) do Config:Set(k,v) end; return Config:Save(path) end
function Library:LoadConfig(path) local ok = Config:Load(path); if ok then for k,v in pairs(Config.Data) do self.Flags[k]=v end end; return ok end
function Library:Notify(opts) self.Notifier:Push(opts) end

function Library:CreateWindow(opts)
    opts = opts or {}
    local title = opts.Title or "Allusive"
    local subtitle = opts.SubTitle or "UI"
    local size = opts.Size or UDim2.fromOffset(760, 520)
    self.ToggleKey = opts.Keybind or self.ToggleKey

    -- Screen-wide container (Bg0 rim)
    local root = Instance.new("Frame")
    root.Name = "Window"
    root.Size = size
    root.Position = UDim2.new(0.5, -size.X.Offset/2, 0.5, -size.Y.Offset/2)
    root.BackgroundColor3 = Theme.Bg0
    root.Parent = self.Gui
    corner(root, Theme.R9); stroke(root, Theme.Stroke0, 1)

    -- Inner body (Bg1)
    local body = Instance.new("Frame", root)
    body.Size = UDim2.new(1, -8, 1, -8)
    body.Position = UDim2.fromOffset(4, 4)
    body.BackgroundColor3 = Theme.Bg1
    corner(body, Theme.R9); stroke(body, Theme.Stroke0, 1)

    -- Topbar (Bg2/3 + small search look)
    local topbar = Instance.new("Frame", body)
    topbar.Size = UDim2.new(1, -8, 0, 46)
    topbar.Position = UDim2.fromOffset(4, 4)
    topbar.BackgroundColor3 = Theme.Bg3
    corner(topbar, Theme.R9); stroke(topbar, Theme.Stroke1, 1)

    local titleL = newText(topbar, title, 18, Enum.FontWeight.Bold)
    titleL.Position = UDim2.fromOffset(12, 0)
    titleL.Size = UDim2.new(0, 300, 1, 0)

    local subL = newText(topbar, subtitle, 14, Enum.FontWeight.Medium, Theme.SubText)
    subL.Position = UDim2.fromOffset(12, 20)
    subL.Size = UDim2.new(0, 300, 1, 0)

    -- Sidebar (Bg2)
    local sidebar = Instance.new("Frame", body)
    sidebar.Size = UDim2.new(0, 188, 1, -58)
    sidebar.Position = UDim2.fromOffset(4, 54)
    sidebar.BackgroundColor3 = Theme.Bg2
    corner(sidebar, Theme.R9); stroke(sidebar, Theme.Stroke0, 1)

    local sideList = Instance.new("UIListLayout", sidebar)
    sideList.FillDirection = Enum.FillDirection.Vertical
    sideList.SortOrder = Enum.SortOrder.LayoutOrder
    sideList.Padding = UDim.new(0, 6)
    padding(sidebar, 8, 8, 8, 8)

    -- Content area
    local content = Instance.new("Frame", body)
    content.Size = UDim2.new(1, -200, 1, -66)
    content.Position = UDim2.fromOffset(196, 62)
    content.BackgroundTransparency = 1

    local pages = Instance.new("Folder", content)

    -- Toggle visibility key
    game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if input.KeyCode == self.ToggleKey then
            self.Gui.Enabled = not self.Gui.Enabled
        end
    end)

    -- Draggable window by topbar
    makeDraggable(root, topbar)

    -- Window API
    local window = {}
    window._tabs = {}
    window._pages = pages

    local function styleTabButton(btn, active)
        TweenService:Create(btn, TweenInfo.new(0.12), {
            BackgroundColor3 = active and Theme.Bg1 or Theme.Bg3
        }):Play()
    end

    function window:AddTab(opts2)
        opts2 = opts2 or {}
        local tTitle = opts2.Title or "Tab"
        local icon = opts2.Icon

        local tabBtn = Instance.new("TextButton")
        tabBtn.BackgroundColor3 = Theme.Bg3
        tabBtn.AutoButtonColor = false
        tabBtn.Size = UDim2.new(1, 0, 0, 36)
        tabBtn.Text = ""
        corner(tabBtn, Theme.R9); stroke(tabBtn, Theme.Stroke3, 1)

        local lbl = newText(tabBtn, tTitle, 16, Enum.FontWeight.SemiBold)
        lbl.Size = UDim2.new(1, -16, 1, 0)
        lbl.Position = UDim2.fromOffset(10, 0)

        if icon then
            local img = Instance.new("ImageLabel", tabBtn)
            img.BackgroundTransparency = 1
            img.Size = UDim2.fromOffset(20, 20)
            img.Position = UDim2.fromOffset(10, 8)
            img.Image = icon
            lbl.Position = UDim2.fromOffset(36, 0)
        end

        tabBtn.Parent = sidebar

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
                styleTabButton(t._btn, false)
            end
            page.Visible = true
            styleTabButton(tabBtn, true)
        end

        tabBtn.MouseButton1Click:Connect(select)
        if #window._tabs == 1 then select() end

        function tab:AddSection(title3, side)
            side = string.lower(side or "left")
            local parentList = (side == "right") and rightList or leftList

            local group = Instance.new("Frame", parentList)
            group.BackgroundColor3 = Theme.Bg2
            group.Size = UDim2.new(1, -8, 0, 44)
            corner(group, Theme.R9); stroke(group, Theme.Stroke0, 1)

            local titleL = newText(group, title3 or "Section", 16, Enum.FontWeight.SemiBold)
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
                local l = newText(container, text or "Label", 15, Enum.FontWeight.Medium, Theme.SubText)
                l.Size = UDim2.new(1, -10, 0, 20)
                return l
            end
            function section:AddSeparator()
                local line = Instance.new("Frame", container)
                line.BackgroundColor3 = Theme.Stroke2
                line.Size = UDim2.new(1, 0, 0, 1)
                return line
            end
            function section:AddButton(optsB, cb)
                local b = newButton(container, (optsB and optsB.Text) or "Button")
                b.Size = UDim2.new(1, -10, 0, 32)
                b.MouseButton1Click:Connect(function() if cb then cb() end end)
                return b
            end
            function section:AddToggle(optsT, cb)
                optsT = optsT or {}
                local holder, box, dot, label = newToggle(container)
                label.Text = optsT.Text or "Toggle"
                local state = optsT.Default and true or false
                local function set(v)
                    state = (v == true)
                    TweenService:Create(dot, TweenInfo.new(0.12), { BackgroundTransparency = state and 0 or 1 }):Play()
                    if cb then cb(state) end
                end
                holder.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then set(not state) end
                end)
                set(state)
                return { Set = set, Get = function() return state end }
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
                    alpha = math.clamp(alpha, 0, 1)
                    fill.Size = UDim2.fromScale(alpha, 1)
                    valueText.Text = string.format("%s%s", tostring(math.floor(value * 100 + 0.5) / 100), suffix ~= "" and (" "..suffix) or "")
                end
                local dragging = false
                local function setFromX(x)
                    local rel = math.clamp((x - back.AbsolutePosition.X) / back.AbsoluteSize.X, 0, 1)
                    value = min + (max - min) * rel
                    value = tonumber(string.format("%.2f", value))
                    render(); if cb then cb(value) end
                end
                back.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true; setFromX(input.Position.X) end
                end)
                back.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
                end)
                game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then setFromX(input.Position.X) end
                end)
                render()
                return { Set = function(v) value = math.clamp(tonumber(v) or value, min, max); render(); if cb then cb(value) end end, Get = function() return value end }
            end
            function section:AddDropdown(optsD, cb)
                optsD = optsD or {}
                local holder, box, list, t, arrow, uiList = newDropdown(container)
                t.Text = optsD.Text or "Select"
                local options = optsD.Options or {}
                local current = optsD.Default
                local open = false
                local function set(v) current = v; if v ~= nil then t.Text = tostring(v) end; if cb then cb(current) end end
                local function rebuild()
                    list:ClearAllChildren(); uiList.Parent = list
                    for _, opt in ipairs(options) do
                        local btn = newButton(list, tostring(opt))
                        btn.Size = UDim2.new(1, -10, 0, 28)
                        btn.MouseButton1Click:Connect(function()
                            set(opt); open = false; list.Visible = false; list.Size = UDim2.new(1, -16, 0, 0)
                        end)
                    end
                    task.wait(); list.Size = UDim2.new(1, -16, 0, math.min(#options * 32 + 8, 180))
                end
                box.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then open = not open; list.Visible = open; if open then rebuild() end end
                end)
                if current ~= nil then set(current) end
                return { Set = set, Get = function() return current end, SetOptions = function(newOpts) options = newOpts or {}; if open then rebuild() end end }
            end
            function section:AddTextbox(optsX, cb)
                optsX = optsX or {}
                local holder, box, label = newTextbox(container)
                label.Text = optsX.Text or "Input"
                box.PlaceholderText = optsX.Placeholder or ""
                box.Text = optsX.Default or ""
                box.FocusLost:Connect(function() if cb then cb(box.Text) end end)
                return box
            end
            function section:AddKeybind(optsK, cb)
                optsK = optsK or {}
                local holder, box, label = newKeybind(container)
                local current = optsK.Default or Enum.KeyCode.Unknown
                local listening = false
                local function render() label.Text = (current ~= Enum.KeyCode.Unknown) and current.Name or "None" end
                box.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then listening = true; label.Text = "Press any key..." end
                end)
                game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
                    if listening and not gpe and input.UserInputType == Enum.UserInputType.Keyboard then
                        current = input.KeyCode; listening = false; render(); if cb then cb() end
                    elseif not listening and input.KeyCode == current then if cb then cb() end end
                end)
                render(); return { Set = function(k) current = k or current; render() end, Get = function() return current end }
            end
            return section
        end
        return tab
    end
    return window
end

-- Factory / exported API (callable)
local function init() return Library.new() end
return setmetatable({
    CreateWindow = function(self, opts) return self:_inst():CreateWindow(opts) end,
    Notify      = function(self, opts) return self:_inst():Notify(opts) end,
    SetFlag     = function(self, k, v) return self:_inst():SetFlag(k, v) end,
    GetFlag     = function(self, k, d) return self:_inst():GetFlag(k, d) end,
    SaveConfig  = function(self, p) return self:_inst():SaveConfig(p) end,
    LoadConfig  = function(self, p) return self:_inst():LoadConfig(p) end,
    _inst       = function(self) if not rawget(self, "__inst") then rawset(self, "__inst", init()) end; return rawget(self, "__inst") end
}, { __call = function() return init() end })
