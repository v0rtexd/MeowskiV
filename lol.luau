-- Anerial UI Library (ModuleScript)
-- Drop this into a ModuleScript named "Anerial" and require it from a LocalScript.
-- API:
--   local ui = require(Anerial).new({title="Anerial.cc", author="v0rtexd & Lenny"})
--   local win = ui:Window("Combat")
--   local sec = win:Section("Main")
--   sec:Toggle("Auto Parry","Parry ball automatically", false, function(v) print("Auto Parry:", v) end)
--   sec:Slider("Ball Speed","", 0, 200, 100, 1, function(val) print("Speed:", val) end)
--   sec:Dropdown("Mode","", {"Legit","Rage","Silent"}, "Legit", function(opt) print("Mode:", opt) end)
--   sec:ColorPicker("Trail Color","", Color3.fromRGB(140,64,215), function(c) print("Color", c) end)
--   sec:Keybind("Parry Key","", Enum.KeyCode.E, function(held) print("Parry held:", held) end)
--   sec:Textbox("Custom Value","Type here", function(text) print("Text:", text) end)
--   ui:Notify("Loaded", "Anerial UI initialized") 
--   -- You can minimize with the top-right button or call ui:SetMinimized(true)
--   -- Destroy with ui:Destroy()

local Anerial = {}
Anerial.__index = Anerial

-- services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local function getParentGui()
    local suc, gui = pcall(function()
        return (gethui and gethui()) or Players.LocalPlayer:FindFirstChildOfClass("PlayerGui") or game:GetService("CoreGui")
    end)
    if suc and gui then return gui end
    return game:GetService("CoreGui")
end

-- tiny helpers
local function t(instance, props, children)
    for k,v in pairs(props or {}) do instance[k] = v end
    for _, child in ipairs(children or {}) do child.Parent = instance end
    return instance
end

local function round(n, step)
    step = step or 1
    return math.floor(n/step + 0.5) * step
end

local function tween(o, time, props, style, dir)
    return TweenService:Create(o, TweenInfo.new(time or .15, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out), props)
end

local function makeStroke(parent, thickness, color, transparency)
    local s = Instance.new("UIStroke")
    s.Thickness = thickness or 1
    s.Color = color or Color3.fromRGB(17,17,21)
    s.Transparency = transparency or 0
    s.Parent = parent
    return s
end

local THEME = {
    bg = Color3.fromRGB(18,18,28),
    panel = Color3.fromRGB(15,15,25),
    section = Color3.fromRGB(23,23,31),
    text = Color3.fromRGB(235,235,245),
    subtle = Color3.fromRGB(140,140,155),
    accent = Color3.fromRGB(141,69,219),
    stroke = Color3.fromRGB(24,24,30),
}

-- draggable logic
local function makeDraggable(frame, dragHandle)
    dragHandle = dragHandle or frame
    local dragging, startPos, startInput
    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            startPos = Vector2.new(input.Position.X, input.Position.Y)
            startInput = input
        end
    end)
    dragHandle.InputEnded:Connect(function(input)
        if input == startInput then dragging = false end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - startPos
            frame.Position = UDim2.fromOffset(frame.Position.X.Offset + delta.X, frame.Position.Y.Offset + delta.Y)
            startPos = Vector2.new(input.Position.X, input.Position.Y)
        end
    end)
end

-- == UI OBJECTS == --
local Window = {}
Window.__index = Window

local Section = {}
Section.__index = Section

-- main constructor
function Anerial.new(opts)
    opts = opts or {}
    local self = setmetatable({}, Anerial)

    local root = t(Instance.new("ScreenGui"), {
        Name = "AnerialUI",
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        ResetOnSpawn = false,
        Parent = getParentGui()
    })

    -- top mini bar (minimized state)
    local mini = t(Instance.new("Frame"), {
        Name = "Mini",
        BackgroundColor3 = THEME.bg,
        Size = UDim2.fromOffset(130, 32),
        Position = UDim2.fromOffset(100, 80),
        Visible = false,
        Parent = root
    }, {
        t(Instance.new("UICorner"), {CornerRadius = UDim.new(0,8)}),
        makeStroke(nil,1,THEME.stroke),
    })
    makeStroke(mini, 1, THEME.stroke)
    local miniBtn = t(Instance.new("TextButton"), {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1,1),
        Text = (opts.title or "Anerial.cc"),
        TextColor3 = THEME.text,
        Font = Enum.Font.GothamSemibold,
        TextSize = 14,
        Parent = mini
    })
    miniBtn.MouseButton1Click:Connect(function()
        self:SetMinimized(false)
    end)

    -- main root window
    local main = t(Instance.new("Frame"), {
        Name = "Main",
        BackgroundColor3 = THEME.bg,
        Size = UDim2.fromOffset(930, 560),
        Position = UDim2.fromOffset(200, 150),
        Parent = root
    }, {
        t(Instance.new("UICorner"), {CornerRadius = UDim.new(0,12)}),
    })
    makeStroke(main, 1, THEME.stroke)

    -- left sidebar
    local side = t(Instance.new("Frame"), {
        Name = "Sidebar",
        BackgroundColor3 = THEME.panel,
        Size = UDim2.new(0, 270, 1, 0),
        Parent = main
    }, { t(Instance.new("UICorner"), {CornerRadius = UDim.new(0,12)}), })
    makeStroke(side, 1, THEME.stroke)

    local title = t(Instance.new("TextLabel"), {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(24, 18),
        Size = UDim2.fromOffset(200, 32),
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = (opts.title or "Anerial.cc"),
        Font = Enum.Font.GothamSemibold,
        TextSize = 24,
        TextColor3 = THEME.text,
        Parent = side
    })
    local sub = t(Instance.new("TextLabel"), {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(24, 48),
        Size = UDim2.fromOffset(200, 18),
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = (opts.author or "v0rtexd & Lenny"),
        Font = Enum.Font.Gotham,
        TextSize = 14,
        TextColor3 = THEME.subtle,
        Parent = side
    })

    local tabList = t(Instance.new("ScrollingFrame"), {
        Position = UDim2.fromOffset(16, 92),
        Size = UDim2.new(1, -32, 1, -140),
        BackgroundTransparency = 1,
        ScrollBarThickness = 2,
        CanvasSize = UDim2.fromOffset(0,0),
        Parent = side
    }, {
        t(Instance.new("UIListLayout"), {Padding = UDim.new(0,8)})
    })

    local footer = t(Instance.new("TextLabel"), {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0,1),
        Position = UDim2.new(0, 24, 1, -16),
        Size = UDim2.fromOffset(220, 18),
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = ("Welcome %s"):format(Players.LocalPlayer and Players.LocalPlayer.Name or "{Username}"),
        Font = Enum.Font.Gotham,
        TextSize = 14,
        TextColor3 = THEME.subtle,
        Parent = side
    })

    -- right content container
    local content = t(Instance.new("Frame"), {
        Name = "Content",
        BackgroundColor3 = THEME.bg,
        Size = UDim2.new(1, -286, 1, -16),
        Position = UDim2.fromOffset(286, 8),
        Parent = main
    })

    -- top bar w/ search + minimize
    local topbar = t(Instance.new("Frame"), {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 48),
        Parent = content
    })
    local searchBox = t(Instance.new("TextBox"), {
        PlaceholderText = "Search",
        Text = "",
        Position = UDim2.fromOffset(8, 8),
        Size = UDim2.new(0, 240, 0, 32),
        BackgroundColor3 = THEME.panel,
        Font = Enum.Font.Gotham,
        TextSize = 14,
        TextColor3 = THEME.text,
        Parent = topbar
    }, {
        t(Instance.new("UICorner"), {CornerRadius = UDim.new(0,10)})
    })
    makeStroke(searchBox, 1, THEME.stroke)

    local minimizeBtn = t(Instance.new("TextButton"), {
        AnchorPoint = Vector2.new(1,0),
        Position = UDim2.new(1, -8, 0, 8),
        Size = UDim2.fromOffset(90, 32),
        BackgroundColor3 = THEME.panel,
        Text = "Minimize",
        Font = Enum.Font.Gotham,
        TextSize = 14,
        TextColor3 = THEME.text,
        Parent = topbar
    }, { t(Instance.new("UICorner"), {CornerRadius = UDim.new(0,10)}) })
    makeStroke(minimizeBtn, 1, THEME.stroke)

    minimizeBtn.MouseButton1Click:Connect(function()
        self:SetMinimized(true)
    end)

    local tabPages = t(Instance.new("Folder"), {Name = "TabPages", Parent = content})

    self._root = root
    self._main = main
    self._mini = mini
    self._tabList = tabList
    self._tabPages = tabPages
    self._windows = {}
    self._connections = {}
    self._searchBox = searchBox
    self._theme = THEME

    makeDraggable(main, side)

    -- search filtering
    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local q = string.lower(searchBox.Text)
        for _, win in ipairs(self._windows) do
            for _, sec in ipairs(win._sections) do
                for _, row in ipairs(sec._rows) do
                    local ok = (q == "" or string.find(string.lower(row.Name), q, 1, true) ~= nil)
                    row.Visible = ok
                end
            end
        end
    end)

    return self
end

function Anerial:Destroy()
    for _, con in ipairs(self._connections) do
        pcall(function() con:Disconnect() end)
    end
    if self._root then self._root:Destroy() end
end

function Anerial:SetMinimized(state)
    self._mini.Visible = state
    self._main.Visible = not state
end

function Anerial:Window(name)
    local button = t(Instance.new("TextButton"), {
        BackgroundColor3 = THEME.section,
        Text = name or "Tab",
        Size = UDim2.new(1, -0, 0, 38),
        TextColor3 = THEME.text,
        Font = Enum.Font.Gotham,
        TextSize = 16,
        Parent = self._tabList
    }, { t(Instance.new("UICorner"), {CornerRadius = UDim.new(0,10)})})
    makeStroke(button,1,THEME.stroke)

    local page = t(Instance.new("ScrollingFrame"), {
        Name = name or "Tab",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, -56),
        Position = UDim2.fromOffset(0, 56),
        ScrollBarThickness = 2,
        CanvasSize = UDim2.fromOffset(0,0),
        Visible = false,
        Parent = self._tabPages
    }, { t(Instance.new("UIGridLayout"), {
            CellPadding = UDim2.fromOffset(16,16),
            CellSize = UDim2.new(0.5, -16, 0, 214),
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    })

    local win = setmetatable({
        _lib = self, _button = button, _page = page, _sections = {}
    }, Window)

    button.MouseButton1Click:Connect(function()
        for _, w in ipairs(self._windows) do
            w._page.Visible = false
        end
        page.Visible = true
    end)

    if #self._windows == 0 then
        page.Visible = true
    end

    table.insert(self._windows, win)
    return win
end

function Window:Section(title)
    local card = t(Instance.new("Frame"), {
        BackgroundColor3 = THEME.section,
        Size = UDim2.new(0, 430, 0, 214),
        Parent = self._page
    }, { t(Instance.new("UICorner"), {CornerRadius = UDim.new(0,12)}), })
    makeStroke(card,1,THEME.stroke)

    local header = t(Instance.new("TextLabel"), {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(14, 12),
        Size = UDim2.fromOffset(300, 20),
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = title or "Section",
        Font = Enum.Font.GothamSemibold,
        TextSize = 16,
        TextColor3 = THEME.text,
        Parent = card
    })

    local list = t(Instance.new("Frame"), {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(12, 40),
        Size = UDim2.new(1, -24, 1, -52),
        Parent = card
    }, {
        t(Instance.new("UIListLayout"), {Padding = UDim.new(0,10)})
    })

    local sec = setmetatable({
        _lib = self._lib, _card = card, _list = list, _rows = {}
    }, Section)

    return sec
end

local function addRow(sec, name, desc)
    local row = t(Instance.new("Frame"), {
        Name = name,
        BackgroundColor3 = THEME.section,
        BackgroundTransparency = 1,
        Size = UDim2.new(1,0,0,40),
        Parent = sec._list
    })
    t(Instance.new("UIListLayout"), {Parent = row, FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0,10)})
    local left = t(Instance.new("Frame"), {
        Size = UDim2.new(1, -200, 1, 0),
        BackgroundTransparency = 1,
        Parent = row
    }, {
        t(Instance.new("UIListLayout"), {Padding = UDim.new(0,2)})
    })
    t(Instance.new("TextLabel"), {
        BackgroundTransparency = 1,
        Size = UDim2.new(1,0,0,18),
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = name,
        Font = Enum.Font.Gotham,
        TextSize = 14,
        TextColor3 = THEME.text,
        Parent = left
    })
    t(Instance.new("TextLabel"), {
        BackgroundTransparency = 1,
        Size = UDim2.new(1,0,0,16),
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = desc or "Description",
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextColor3 = THEME.subtle,
        Parent = left
    })

    table.insert(sec._rows, row)
    return row
end

-- Controls
function Section:Toggle(name, desc, default, callback)
    callback = callback or function() end
    local row = addRow(self, name, desc)
    local btn = t(Instance.new("TextButton"), {
        BackgroundColor3 = THEME.panel,
        Size = UDim2.fromOffset(56, 28),
        Text = "",
        Parent = row
    }, { t(Instance.new("UICorner"), {CornerRadius = UDim.new(0,12)}) })
    makeStroke(btn,1,THEME.stroke)
    local dot = t(Instance.new("Frame"), {
        BackgroundColor3 = THEME.subtle,
        Size = UDim2.fromOffset(22,22),
        Position = UDim2.fromOffset(4,3),
        Parent = btn
    }, { t(Instance.new("UICorner"), {CornerRadius = UDim.new(1,100)}) })

    local state = not not default
    local function render()
        if state then
            tween(dot,.12,{Position = UDim2.fromOffset(30,3), BackgroundColor3 = THEME.accent}):Play()
        else
            tween(dot,.12,{Position = UDim2.fromOffset(4,3), BackgroundColor3 = THEME.subtle}):Play()
        end
    end
    render()
    btn.MouseButton1Click:Connect(function()
        state = not state
        render()
        task.spawn(callback, state)
    end)
    return {
        Set = function(_, v) state = not not v; render(); end,
        Get = function() return state end
    }
end

function Section:Slider(name, desc, min, max, default, step, callback)
    callback = callback or function() end
    min, max, step = min or 0, max or 100, step or 1
    local row = addRow(self, name, desc)

    local bar = t(Instance.new("Frame"), {
        BackgroundColor3 = THEME.panel,
        Size = UDim2.new(0, 220, 0, 8),
        AnchorPoint = Vector2.new(0, .5),
        Position = UDim2.new(0, 0, .5, 0),
        Parent = row
    }, { t(Instance.new("UICorner"), {CornerRadius = UDim.new(1, 100)}) })
    makeStroke(bar,1,THEME.stroke)
    local fill = t(Instance.new("Frame"), {
        BackgroundColor3 = THEME.accent,
        Size = UDim2.new(0,0,1,0),
        Parent = bar
    }, { t(Instance.new("UICorner"), {CornerRadius = UDim.new(1, 100)}) })

    local knob = t(Instance.new("Frame"), {
        BackgroundColor3 = THEME.text,
        Size = UDim2.fromOffset(12,12),
        AnchorPoint = Vector2.new(.5,.5),
        Position = UDim2.new(0,0,.5,0),
        Parent = bar
    }, { t(Instance.new("UICorner"), {CornerRadius = UDim.new(1, 100)}) })

    local value = math.clamp(default or min, min, max)
    local dragging = false

    local function setFromX(x)
        local rel = math.clamp((x - bar.AbsolutePosition.X)/bar.AbsoluteSize.X, 0, 1)
        local val = round(min + (max-min)*rel, step)
        value = math.clamp(val, min, max)
        local r = (value-min)/(max-min)
        fill.Size = UDim2.new(r,0,1,0)
        knob.Position = UDim2.new(r,0,.5,0)
        callback(value)
    end

    setFromX(bar.AbsolutePosition.X + bar.AbsoluteSize.X * ((value-min)/(max-min)))

    bar.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            setFromX(i.Position.X)
        end
    end)
    bar.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
    UserInputService.InputChanged:Connect(function(i)
        if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
            setFromX(i.Position.X)
        end
    end)

    return {
        Set = function(_, v) setFromX(bar.AbsolutePosition.X + bar.AbsoluteSize.X * ((math.clamp(v,min,max)-min)/(max-min))) end,
        Get = function() return value end
    }
end

function Section:Dropdown(name, desc, options, default, callback)
    options = options or {}
    callback = callback or function() end
    local row = addRow(self, name, desc)

    local holder = t(Instance.new("Frame"), {
        BackgroundColor3 = THEME.panel,
        Size = UDim2.fromOffset(180, 32),
        Parent = row
    }, { t(Instance.new("UICorner"), {CornerRadius = UDim.new(0,10)}) })
    makeStroke(holder,1,THEME.stroke)
    local label = t(Instance.new("TextLabel"), {
        BackgroundTransparency = 1, Size = UDim2.new(1, -28, 1, 0),
        Text = default or (options[1] or ""),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = THEME.text, Font = Enum.Font.Gotham, TextSize = 14,
        Position = UDim2.fromOffset(10,0),
        Parent = holder
    })
    local openBtn = t(Instance.new("TextButton"), {
        BackgroundTransparency = 1, Size = UDim2.fromOffset(28, 28),
        AnchorPoint = Vector2.new(1,.5), Position = UDim2.new(1,-2,.5,0), Text = "▼",
        TextSize = 12, TextColor3 = THEME.subtle, Font = Enum.Font.Gotham,
        Parent = holder
    })

    local list = t(Instance.new("Frame"), {
        BackgroundColor3 = THEME.panel, Size = UDim2.fromOffset(180, 0),
        Position = UDim2.fromOffset(0, 34), Parent = holder, ClipsDescendants = true, Visible = false
    }, { t(Instance.new("UICorner"), {CornerRadius = UDim.new(0,10)}), t(Instance.new("UIListLayout"), {Padding = UDim.new(0,4)})})
    makeStroke(list,1,THEME.stroke)

    local function setOpt(opt)
        label.Text = opt
        callback(opt)
    end
    setOpt(default or options[1] or "")

    local function rebuild()
        for _, c in ipairs(list:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
        for _, opt in ipairs(options) as ipairs do end
    end

    for _, opt in ipairs(options) do
        local b = t(Instance.new("TextButton"), {
            BackgroundColor3 = THEME.section, Size = UDim2.new(1,-8,0,28), Position = UDim2.fromOffset(4,0),
            Text = opt, Font = Enum.Font.Gotham, TextSize = 14, TextColor3 = THEME.text, Parent = list
        }, { t(Instance.new("UICorner"), {CornerRadius = UDim.new(0,8)}) })
        b.MouseButton1Click:Connect(function()
            setOpt(opt); list.Visible=false; list.Size=UDim2.fromOffset(180,0)
        end)
    end

    local open = false
    local function toggleOpen()
        open = not open
        list.Visible = true
        tween(list,.15,{Size = UDim2.fromOffset(180, open and (#options*32 + 8) or 0)}):Play()
        if not open then
            task.delay(.18, function() list.Visible = false end)
        end
    end
    openBtn.MouseButton1Click:Connect(toggleOpen)

    return {
        Set = function(_, opt) setOpt(opt) end,
        Options = function(_, new) options = new; toggleOpen(); toggleOpen(); end
    }
end

function Section:ColorPicker(name, desc, default, callback)
    callback = callback or function() end
    local row = addRow(self, name, desc)
    local btn = t(Instance.new("TextButton"), {
        BackgroundColor3 = default or THEME.accent,
        Size = UDim2.fromOffset(32, 32),
        Text = "",
        Parent = row
    }, { t(Instance.new("UICorner"), {CornerRadius = UDim.new(0,8)}) })
    makeStroke(btn,1,THEME.stroke)

    local value = default or THEME.accent
    btn.MouseButton1Click:Connect(function()
        -- simple cycle between a few nice colors
        local choices = {
            Color3.fromRGB(141,69,219), Color3.fromRGB(87, 124, 255),
            Color3.fromRGB(255, 95, 95), Color3.fromRGB(80, 200, 120),
            Color3.fromRGB(255, 199, 95)
        }
        local idx = 1
        for i, c in ipairs(choices) do if c == value then idx = i end end
        idx = (idx % #choices) + 1
        value = choices[idx]
        tween(btn,.12,{BackgroundColor3=value}):Play()
        callback(value)
    end)

    return {
        Set = function(_, c) value = c; btn.BackgroundColor3 = c; callback(value) end,
        Get = function() return value end
    }
end

function Section:Keybind(name, desc, default, callback)
    callback = callback or function() end
    local row = addRow(self, name, desc)
    local holder = t(Instance.new("TextButton"), {
        BackgroundColor3 = THEME.panel,
        Size = UDim2.fromOffset(120, 32),
        Text = default and default.Name or "Bind",
        TextColor3 = THEME.text,
        Font = Enum.Font.Gotham, TextSize = 14,
        Parent = row
    }, { t(Instance.new("UICorner"), {CornerRadius = UDim.new(0,10)}) })
    makeStroke(holder,1,THEME.stroke)

    local key = default or Enum.KeyCode.Unknown
    local listening = false

    holder.MouseButton1Click:Connect(function()
        holder.Text = "..."
        listening = true
    end)

    UserInputService.InputBegan:Connect(function(i, gpe)
        if gpe then return end
        if listening then
            listening = false
            if i.UserInputType == Enum.UserInputType.Keyboard then
                key = i.KeyCode
                holder.Text = key.Name
            elseif i.UserInputType == Enum.UserInputType.MouseButton1 then
                key = Enum.KeyCode.MouseButton1; holder.Text = "Mouse1"
            elseif i.UserInputType == Enum.UserInputType.MouseButton2 then
                key = Enum.KeyCode.MouseButton2; holder.Text = "Mouse2"
            else
                holder.Text = "Bind"
            end
        elseif (i.KeyCode == key) or (key == Enum.KeyCode.MouseButton1 and i.UserInputType==Enum.UserInputType.MouseButton1) or (key == Enum.KeyCode.MouseButton2 and i.UserInputType==Enum.UserInputType.MouseButton2) then
            task.spawn(callback, true)
        end
    end)
    UserInputService.InputEnded:Connect(function(i, gpe)
        if gpe then return end
        if (i.KeyCode == key) or (key == Enum.KeyCode.MouseButton1 and i.UserInputType==Enum.UserInputType.MouseButton1) or (key == Enum.KeyCode.MouseButton2 and i.UserInputType==Enum.UserInputType.MouseButton2) then
            task.spawn(callback, false)
        end
    end)

    return {
        Set = function(_, kc) key = kc; holder.Text = kc.Name end,
        Get = function() return key end
    }
end

function Section:Textbox(name, placeholder, callback)
    callback = callback or function() end
    local row = addRow(self, name, " ")
    local box = t(Instance.new("TextBox"), {
        BackgroundColor3 = THEME.panel,
        Size = UDim2.fromOffset(220, 32),
        Text = "",
        PlaceholderText = placeholder or "Type...",
        TextColor3 = THEME.text,
        Font = Enum.Font.Gotham, TextSize = 14,
        Parent = row
    }, { t(Instance.new("UICorner"), {CornerRadius = UDim.new(0,10)}) })
    makeStroke(box,1,THEME.stroke)
    box.FocusLost:Connect(function(enter)
        if enter then callback(box.Text) end
    end)
    return {
        Set = function(_, t) box.Text = t end,
        Get = function() return box.Text end
    }
end

function Anerial:Notify(title, message, duration)
    duration = duration or 2
    local toast = t(Instance.new("TextLabel"), {
        BackgroundColor3 = THEME.panel, Text = title..": "..(message or ""),
        TextColor3 = THEME.text, Font = Enum.Font.Gotham, TextSize = 14,
        AnchorPoint = Vector2.new(1,1),
        Size = UDim2.fromOffset(280, 36),
        Position = UDim2.new(1,-20,1,-20),
        Parent = self._root
    }, { t(Instance.new("UICorner"), {CornerRadius = UDim.new(0,10)}) })
    makeStroke(toast,1,THEME.stroke)
    toast.TextWrapped = true
    toast.BackgroundTransparency = 1
    tween(toast,.15,{BackgroundTransparency = 0}):Play()
    task.delay(duration, function()
        tween(toast,.15,{BackgroundTransparency = 1}):Play()
        task.delay(.16, function() toast:Destroy() end)
    end)
end

return Anerial
