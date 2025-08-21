-- Anerial.cc UI Library
-- Made functional by adding proper event handling and state management

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local Library = {}
Library.__index = Library

-- Added notification system
function Library.SendNotification(data)
    local title = data.title or "Notification"
    local text = data.text or "No message"
    local duration = data.duration or 5
    
    print("[" .. title .. "] " .. text)
    -- In a real implementation, you'd create a notification GUI here
end

-- Added main library constructor
function Library.new()
    local self = setmetatable({}, Library)
    
    
    -- Added state management
    self.tabs = {}
    self.currentTab = nil
    self.modules = {}
    self.flags = {}
    self.minimized = false
    
    -- Setup main UI with proper parenting
    self.main_UI = Instance.new("ScreenGui")
    self.main_UI.Name = "Main UI"
    self.main_UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    self.main_UI.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    
    -- Setup minimized UI
    self.minimized_ui = Instance.new("ScreenGui")
    self.minimized_ui.Name = "Minimized ui"
    self.minimized_ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    self.minimized_ui.Parent = self.main_UI
    self.minimized_ui.Enabled = false
    
    -- ... existing code for UI creation ...
    
    self:setupMainUI()
    self:setupMinimizedUI()
    self:setupEventHandlers()
    
    return self
end

-- Added main UI setup function
function Library:setupMainUI()
    local main = Instance.new("Frame")
    main.Name = "main"
    main.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
    main.Position = UDim2.new(0.227, 0, 0.198, 0)
    main.BorderColor3 = Color3.new()
    main.BorderSizePixel = 0
    main.Size = UDim2.new(0, 813, 0, 494)
    main.Parent = self.main_UI
    
    local uICorner = Instance.new("UICorner")
    uICorner.CornerRadius = UDim.new(0, 10)
    uICorner.Parent = main
    
    local uIStroke = Instance.new("UIStroke")
    uIStroke.Color = Color3.new(0.0667, 0.0667, 0.0824)
    uIStroke.Parent = main
    
    self.mainFrame = main
    self:createHeader()
    self:createTabSystem()
    self:createContentArea()
end

-- Added minimized UI setup
function Library:setupMinimizedUI()
    local minimized_ui_cro = Instance.new("Frame")
    minimized_ui_cro.Name = "Minimized ui cro"
    minimized_ui_cro.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
    minimized_ui_cro.Position = UDim2.new(0.459, 0, 0.0293, 0)
    minimized_ui_cro.BorderColor3 = Color3.new()
    minimized_ui_cro.BorderSizePixel = 0
    minimized_ui_cro.Size = UDim2.new(0, 120, 0, 31)
    minimized_ui_cro.Parent = self.minimized_ui
    
    local uICorner = Instance.new("UICorner")
    uICorner.CornerRadius = UDim.new(0, 4)
    uICorner.Parent = minimized_ui_cro
    
    local uIStroke = Instance.new("UIStroke")
    uIStroke.Color = Color3.new(0.0667, 0.0667, 0.0824)
    uIStroke.Parent = minimized_ui_cro
    
    local anerial_cc = Instance.new("TextLabel")
    anerial_cc.Name = "Anerial.cc"
    anerial_cc.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    anerial_cc.TextColor3 = Color3.new(1, 1, 1)
    anerial_cc.Text = "Anerial.cc"
    anerial_cc.BackgroundTransparency = 1
    anerial_cc.Position = UDim2.new(0.358, 0, 0.133, 0)
    anerial_cc.TextSize = 13
    anerial_cc.Size = UDim2.new(0, 69, 0, 21)
    anerial_cc.Parent = minimized_ui_cro
    
    local unminize_button = Instance.new("TextButton")
    unminize_button.Name = "Unminize button"
    unminize_button.Text = ""
    unminize_button.BackgroundTransparency = 1
    unminize_button.Size = UDim2.new(1, 0, 1, 0)
    unminize_button.Parent = minimized_ui_cro
    
    unminize_button.MouseButton1Click:Connect(function()
        self:toggleMinimize()
    end)
end

-- Added header creation
function Library:createHeader()
    local logo = Instance.new("TextLabel")
    logo.Name = "Logo"
    logo.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.Bold)
    logo.TextColor3 = Color3.new(1, 1, 1)
    logo.Text = "Anerial.cc"
    logo.BackgroundTransparency = 1
    logo.Position = UDim2.new(0.0382, 0, 0.0105, 0)
    logo.TextSize = 33
    logo.Size = UDim2.new(0, 170, 0, 45)
    logo.Parent = self.mainFrame
    
    local credits = Instance.new("TextLabel")
    credits.Name = "Credits"
    credits.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    credits.TextColor3 = Color3.new(0.42, 0.42, 0.424)
    credits.Text = "v0rtexd & Lenny"
    credits.BackgroundTransparency = 1
    credits.Position = UDim2.new(0.075, 0, 0.0951, 0)
    credits.TextSize = 14
    credits.Size = UDim2.new(0, 108, 0, 18)
    credits.Parent = self.mainFrame
    
    -- Close button
    local close_button = Instance.new("TextButton")
    close_button.Name = "Close button"
    close_button.Text = "×"
    close_button.TextColor3 = Color3.new(0.7, 0.7, 0.7)
    close_button.FontSize = Enum.FontSize.Size18
    close_button.BackgroundTransparency = 1
    close_button.Position = UDim2.new(0.958, 0, 0.048, 0)
    close_button.Size = UDim2.new(0, 18, 0, 20)
    close_button.Parent = self.mainFrame
    
    close_button.MouseButton1Click:Connect(function()
        self.main_UI:Destroy()
    end)
    
    -- Minimize button
    local minimize_button = Instance.new("TextButton")
    minimize_button.Name = "Minimize button"
    minimize_button.Text = "−"
    minimize_button.TextColor3 = Color3.new(0.7, 0.7, 0.7)
    minimize_button.FontSize = Enum.FontSize.Size18
    minimize_button.BackgroundTransparency = 1
    minimize_button.Position = UDim2.new(0.911, 0, 0.048, 0)
    minimize_button.Size = UDim2.new(0, 15, 0, 15)
    minimize_button.Parent = self.mainFrame
    
    minimize_button.MouseButton1Click:Connect(function()
        self:toggleMinimize()
    end)
end

-- Added tab system creation
function Library:createTabSystem()
    local tabs_System = Instance.new("Frame")
    tabs_System.Name = "Tabs System"
    tabs_System.BackgroundTransparency = 1
    tabs_System.Position = UDim2.new(0.00971, 0, 0.131, 0)
    tabs_System.Size = UDim2.new(0, 211, 0, 387)
    tabs_System.Parent = self.mainFrame
    
    local tabList = Instance.new("UIListLayout")
    tabList.SortOrder = Enum.SortOrder.LayoutOrder
    tabList.Padding = UDim.new(0, 5)
    tabList.Parent = tabs_System
    
    self.tabContainer = tabs_System
end

-- Added content area creation
function Library:createContentArea()
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "Content"
    contentFrame.BackgroundTransparency = 1
    contentFrame.Position = UDim2.new(0.328, 0, 0.174, 0)
    contentFrame.Size = UDim2.new(0, 540, 0, 350)
    contentFrame.Parent = self.mainFrame
    
    self.contentFrame = contentFrame
end

-- Added tab creation function
function Library:create_tab(name, icon)
    local tab = {
        name = name,
        icon = icon or "rbxassetid://10747830374",
        modules = {},
        frame = nil,
        button = nil,
        active = false
    }
    
    -- Create tab button
    local tabButton = Instance.new("Frame")
    tabButton.Name = name .. " Tab"
    tabButton.BackgroundColor3 = Color3.new(0.0392, 0.0392, 0.0588)
    tabButton.BackgroundTransparency = 1
    tabButton.Size = UDim2.new(0, 162, 0, 34)
    tabButton.Parent = self.tabContainer
    
    local button = Instance.new("TextButton")
    button.Text = ""
    button.BackgroundTransparency = 1
    button.Size = UDim2.new(1, 0, 1, 0)
    button.Parent = tabButton
    
    local icon = Instance.new("ImageLabel")
    icon.Image = tab.icon
    icon.BackgroundTransparency = 1
    icon.Position = UDim2.new(0, 0, 0.104, 0)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Parent = tabButton
    
    local label = Instance.new("TextLabel")
    label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Text = name
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0.196, 0, 0.0896, 0)
    label.TextSize = 16
    label.Size = UDim2.new(0, 78, 0, 21)
    label.Parent = tabButton
    
    -- Create tab content frame
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = name .. " Content"
    contentFrame.BackgroundTransparency = 1
    contentFrame.Size = UDim2.new(1, 0, 1, 0)
    contentFrame.Visible = false
    contentFrame.Parent = self.contentFrame
    
    -- Create left and right sections
    local leftSection = Instance.new("ScrollingFrame")
    leftSection.Name = "Left Section"
    leftSection.BackgroundTransparency = 1
    leftSection.Position = UDim2.new(0, 0, 0, 0)
    leftSection.Size = UDim2.new(0, 260, 1, 0)
    leftSection.CanvasSize = UDim2.new(0, 0, 0, 0)
    leftSection.ScrollBarThickness = 4
    leftSection.Parent = contentFrame
    
    local rightSection = Instance.new("ScrollingFrame")
    rightSection.Name = "Right Section"
    rightSection.BackgroundTransparency = 1
    rightSection.Position = UDim2.new(0, 270, 0, 0)
    rightSection.Size = UDim2.new(0, 260, 1, 0)
    rightSection.CanvasSize = UDim2.new(0, 0, 0, 0)
    rightSection.ScrollBarThickness = 4
    rightSection.Parent = contentFrame
    
    -- Add layouts
    local leftLayout = Instance.new("UIListLayout")
    leftLayout.SortOrder = Enum.SortOrder.LayoutOrder
    leftLayout.Padding = UDim.new(0, 10)
    leftLayout.Parent = leftSection
    
    local rightLayout = Instance.new("UIListLayout")
    rightLayout.SortOrder = Enum.SortOrder.LayoutOrder
    rightLayout.Padding = UDim.new(0, 10)
    rightLayout.Parent = rightSection
    
    tab.frame = contentFrame
    tab.button = tabButton
    tab.leftSection = leftSection
    tab.rightSection = rightSection
    
    -- Tab click handler
    button.MouseButton1Click:Connect(function()
        self:selectTab(tab)
    end)
    
    table.insert(self.tabs, tab)
    
    -- Select first tab by default
    if #self.tabs == 1 then
        self:selectTab(tab)
    end
    
    return tab
end

-- Added tab selection function
function Library:selectTab(selectedTab)
    for _, tab in pairs(self.tabs) do
        if tab == selectedTab then
            tab.active = true
            tab.frame.Visible = true
            tab.button.BackgroundColor3 = Color3.new(0.0392, 0.0392, 0.0588)
            tab.button.BackgroundTransparency = 0
            
            -- Add corner and stroke to selected tab
            if not tab.button:FindFirstChild("UICorner") then
                local corner = Instance.new("UICorner")
                corner.CornerRadius = UDim.new(0, 9)
                corner.Parent = tab.button
                
                local stroke = Instance.new("UIStroke")
                stroke.Color = Color3.new(0.0667, 0.0667, 0.098)
                stroke.Thickness = 1.2
                stroke.Parent = tab.button
            end
        else
            tab.active = false
            tab.frame.Visible = false
            tab.button.BackgroundTransparency = 1
        end
    end
    self.currentTab = selectedTab
end

-- Added module creation function
function Library:create_module(data)
    local title = data.title or "Module"
    local flag = data.flag or title
    local description = data.description or ""
    local section = data.section or "left"
    local callback = data.callback or function() end
    
    local tab = self.currentTab
    if not tab then return end
    
    local targetSection = section == "left" and tab.leftSection or tab.rightSection
    
    -- Create module frame
    local moduleFrame = Instance.new("Frame")
    moduleFrame.Name = title .. " Module"
    moduleFrame.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
    moduleFrame.Size = UDim2.new(1, -10, 0, 200)
    moduleFrame.Parent = targetSection
    
    local corner = Instance.new("UICorner")
    corner.Parent = moduleFrame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.new(0.0902, 0.0902, 0.114)
    stroke.Parent = moduleFrame
    
    -- Module header
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.BackgroundTransparency = 1
    header.Size = UDim2.new(1, 0, 0, 40)
    header.Parent = moduleFrame
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.Text = title
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0, 10, 0, 5)
    titleLabel.TextSize = 15
    titleLabel.Size = UDim2.new(0, 200, 0, 20)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = header
    
    local descLabel = Instance.new("TextLabel")
    descLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    descLabel.TextColor3 = Color3.new(0.42, 0.42, 0.424)
    descLabel.Text = description
    descLabel.BackgroundTransparency = 1
    descLabel.Position = UDim2.new(0, 10, 0, 25)
    descLabel.TextSize = 12
    descLabel.Size = UDim2.new(0, 200, 0, 15)
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.Parent = header
    
    -- Content area for module elements
    local content = Instance.new("Frame")
    content.Name = "Content"
    content.BackgroundTransparency = 1
    content.Position = UDim2.new(0, 0, 0, 45)
    content.Size = UDim2.new(1, 0, 1, -45)
    content.Parent = moduleFrame
    
    local contentLayout = Instance.new("UIListLayout")
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.Padding = UDim.new(0, 5)
    contentLayout.Parent = content
    
    local module = {
        title = title,
        flag = flag,
        description = description,
        callback = callback,
        frame = moduleFrame,
        content = content,
        elements = {},
        enabled = false
    }
    
    -- Module toggle (main functionality)
    local toggle = self:createToggle(module, {
        title = "Enable " .. title,
        flag = flag,
        callback = function(value)
            module.enabled = value
            callback(value)
        end
    })
    
    table.insert(tab.modules, module)
    self.modules[flag] = module
    
    return module
end

-- Added toggle creation function
function Library:createToggle(module, data)
    local title = data.title or "Toggle"
    local flag = data.flag or title
    local callback = data.callback or function() end
    
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = title .. " Toggle"
    toggleFrame.BackgroundTransparency = 1
    toggleFrame.Size = UDim2.new(1, -20, 0, 30)
    toggleFrame.Parent = module.content
    
    local label = Instance.new("TextLabel")
    label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Text = title
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 10, 0, 0)
    label.TextSize = 14
    label.Size = UDim2.new(0, 150, 1, 0)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = toggleFrame
    
    -- Toggle switch
    local switchFrame = Instance.new("Frame")
    switchFrame.Name = "Switch"
    switchFrame.BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)
    switchFrame.Position = UDim2.new(1, -46, 0.5, -10)
    switchFrame.Size = UDim2.new(0, 36, 0, 20)
    switchFrame.Parent = toggleFrame
    
    local switchCorner = Instance.new("UICorner")
    switchCorner.CornerRadius = UDim.new(0, 9)
    switchCorner.Parent = switchFrame
    
    local switcher = Instance.new("Frame")
    switcher.Name = "Switcher"
    switcher.BackgroundColor3 = Color3.new(1, 1, 1)
    switcher.Position = UDim2.new(0, 3, 0.5, -5)
    switcher.Size = UDim2.new(0, 10, 0, 10)
    switcher.Parent = switchFrame
    
    local switcherCorner = Instance.new("UICorner")
    switcherCorner.Parent = switcher
    
    local button = Instance.new("TextButton")
    button.Text = ""
    button.BackgroundTransparency = 1
    button.Size = UDim2.new(1, 0, 1, 0)
    button.Parent = switchFrame
    
    local enabled = false
    
    local function updateToggle()
        if enabled then
            switchFrame.BackgroundColor3 = Color3.new(0.475, 0.451, 0.918)
            switcher.Position = UDim2.new(1, -13, 0.5, -5)
        else
            switchFrame.BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)
            switcher.Position = UDim2.new(0, 3, 0.5, -5)
        end
    end
    
    button.MouseButton1Click:Connect(function()
        enabled = not enabled
        updateToggle()
        self.flags[flag] = enabled
        callback(enabled)
    end)
    
    local element = {
        type = "toggle",
        flag = flag,
        callback = callback,
        frame = toggleFrame,
        getValue = function() return enabled end,
        setValue = function(value) 
            enabled = value
            updateToggle()
            self.flags[flag] = enabled
        end
    }
    
    table.insert(module.elements, element)
    return element
end

-- Added dropdown creation function
function Library:create_dropdown(module, data)
    local title = data.title or "Dropdown"
    local flag = data.flag or title
    local options = data.options or {"Option 1", "Option 2", "Option 3"}
    local multi_dropdown = data.multi_dropdown or false
    local maximum_options = data.maximum_options or 1
    local callback = data.callback or function() end
    
    local dropdownFrame = Instance.new("Frame")
    dropdownFrame.Name = title .. " Dropdown"
    dropdownFrame.BackgroundTransparency = 1
    dropdownFrame.Size = UDim2.new(1, -20, 0, 60)
    dropdownFrame.Parent = module.content
    
    local label = Instance.new("TextLabel")
    label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Text = title
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 10, 0, 0)
    label.TextSize = 14
    label.Size = UDim2.new(0, 150, 0, 20)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = dropdownFrame
    
    -- Dropdown button
    local dropdownButton = Instance.new("Frame")
    dropdownButton.Name = "DropdownButton"
    dropdownButton.BackgroundColor3 = Color3.new(0.0627, 0.0588, 0.0863)
    dropdownButton.Position = UDim2.new(1, -89, 0, 25)
    dropdownButton.Size = UDim2.new(0, 79, 0, 29)
    dropdownButton.Parent = dropdownFrame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 4)
    buttonCorner.Parent = dropdownButton
    
    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Color = Color3.new(0.0863, 0.0863, 0.0863)
    buttonStroke.Parent = dropdownButton
    
    local selectedLabel = Instance.new("TextLabel")
    selectedLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    selectedLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    selectedLabel.Text = options[1] or "Select..."
    selectedLabel.BackgroundTransparency = 1
    selectedLabel.Position = UDim2.new(0, 5, 0, 0)
    selectedLabel.TextSize = 12
    selectedLabel.Size = UDim2.new(1, -20, 1, 0)
    selectedLabel.TextXAlignment = Enum.TextXAlignment.Left
    selectedLabel.Parent = dropdownButton
    
    local arrow = Instance.new("ImageLabel")
    arrow.Image = "rbxassetid://10709790948"
    arrow.BackgroundTransparency = 1
    arrow.Position = UDim2.new(1, -18, 0.5, -7)
    arrow.Size = UDim2.new(0, 15, 0, 15)
    arrow.Parent = dropdownButton
    
    local button = Instance.new("TextButton")
    button.Text = ""
    button.BackgroundTransparency = 1
    button.Size = UDim2.new(1, 0, 1, 0)
    button.Parent = dropdownButton
    
    -- Dropdown list
    local dropdownList = Instance.new("Frame")
    dropdownList.Name = "DropdownList"
    dropdownList.BackgroundColor3 = Color3.new(0.0627, 0.0588, 0.0863)
    dropdownList.Position = UDim2.new(0, 0, 1, 5)
    dropdownList.Size = UDim2.new(1, 0, 0, #options * 25)
    dropdownList.Visible = false
    dropdownList.ZIndex = 10
    dropdownList.Parent = dropdownButton
    
    local listCorner = Instance.new("UICorner")
    listCorner.CornerRadius = UDim.new(0, 4)
    listCorner.Parent = dropdownList
    
    local listStroke = Instance.new("UIStroke")
    listStroke.Color = Color3.new(0.0863, 0.0863, 0.0863)
    listStroke.Parent = dropdownList
    
    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = dropdownList
    
    local selectedValue = options[1]
    local isOpen = false
    
    -- Create option buttons
    for i, option in ipairs(options) do
        local optionButton = Instance.new("TextButton")
        optionButton.Name = "Option" .. i
        optionButton.Text = ""
        optionButton.BackgroundTransparency = 1
        optionButton.Size = UDim2.new(1, 0, 0, 25)
        optionButton.Parent = dropdownList
        
        local optionLabel = Instance.new("TextLabel")
        optionLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
        optionLabel.TextColor3 = Color3.new(0.498, 0.498, 0.498)
        optionLabel.Text = option
        optionLabel.BackgroundTransparency = 1
        optionLabel.Position = UDim2.new(0, 5, 0, 0)
        optionLabel.TextSize = 12
        optionLabel.Size = UDim2.new(1, -10, 1, 0)
        optionLabel.TextXAlignment = Enum.TextXAlignment.Left
        optionLabel.Parent = optionButton
        
        optionButton.MouseButton1Click:Connect(function()
            selectedValue = option
            selectedLabel.Text = option
            dropdownList.Visible = false
            isOpen = false
            arrow.Rotation = 0
            self.flags[flag] = selectedValue
            callback(selectedValue)
        end)
    end
    
    button.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        dropdownList.Visible = isOpen
        arrow.Rotation = isOpen and 180 or 0
    end)
    
    local element = {
        type = "dropdown",
        flag = flag,
        callback = callback,
        frame = dropdownFrame,
        getValue = function() return selectedValue end,
        setValue = function(value) 
            selectedValue = value
            selectedLabel.Text = value
            self.flags[flag] = selectedValue
        end
    }
    
    table.insert(module.elements, element)
    return element
end

-- Added slider creation function
function Library:create_slider(module, data)
    local title = data.title or "Slider"
    local flag = data.flag or title
    local maximum_value = data.maximum_value or 100
    local minimum_value = data.minimum_value or 0
    local value = data.value or minimum_value
    local round_number = data.round_number or false
    local callback = data.callback or function() end
    
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Name = title .. " Slider"
    sliderFrame.BackgroundTransparency = 1
    sliderFrame.Size = UDim2.new(1, -20, 0, 50)
    sliderFrame.Parent = module.content
    
    local label = Instance.new("TextLabel")
    label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Text = title
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 10, 0, 0)
    label.TextSize = 14
    label.Size = UDim2.new(0, 150, 0, 20)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = sliderFrame
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    valueLabel.TextColor3 = Color3.new(1, 1, 1)
    valueLabel.Text = tostring(value)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Position = UDim2.new(1, -50, 0, 0)
    valueLabel.TextSize = 14
    valueLabel.Size = UDim2.new(0, 40, 0, 20)
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.Parent = sliderFrame
    
    -- Slider track
    local sliderTrack = Instance.new("Frame")
    sliderTrack.Name = "SliderTrack"
    sliderTrack.BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)
    sliderTrack.Position = UDim2.new(0, 10, 0, 25)
    sliderTrack.Size = UDim2.new(1, -20, 0, 7)
    sliderTrack.Parent = sliderFrame
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(0, 3)
    trackCorner.Parent = sliderTrack
    
    local trackStroke = Instance.new("UIStroke")
    trackStroke.Color = Color3.new(0.0902, 0.0902, 0.114)
    trackStroke.Parent = sliderTrack
    
    -- Slider fill
    local sliderFill = Instance.new("Frame")
    sliderFill.Name = "SliderFill"
    sliderFill.BackgroundColor3 = Color3.new(0.475, 0.451, 0.918)
    sliderFill.Size = UDim2.new((value - minimum_value) / (maximum_value - minimum_value), 0, 1, 0)
    sliderFill.Parent = sliderTrack
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 3)
    fillCorner.Parent = sliderFill
    
    -- Slider handle
    local sliderHandle = Instance.new("Frame")
    sliderHandle.Name = "SliderHandle"
    sliderHandle.BackgroundColor3 = Color3.new(1, 1, 1)
    sliderHandle.Position = UDim2.new((value - minimum_value) / (maximum_value - minimum_value), -5, 0.5, -5)
    sliderHandle.Size = UDim2.new(0, 11, 0, 11)
    sliderHandle.Parent = sliderTrack
    
    local handleCorner = Instance.new("UICorner")
    handleCorner.CornerRadius = UDim.new(0, 3)
    handleCorner.Parent = sliderHandle
    
    local dragging = false
    local currentValue = value
    
    local function updateSlider(newValue)
        newValue = math.clamp(newValue, minimum_value, maximum_value)
        if round_number then
            newValue = math.floor(newValue + 0.5)
        end
        
        currentValue = newValue
        local percentage = (newValue - minimum_value) / (maximum_value - minimum_value)
        
        sliderFill.Size = UDim2.new(percentage, 0, 1, 0)
        sliderHandle.Position = UDim2.new(percentage, -5, 0.5, -5)
        valueLabel.Text = tostring(newValue)
        
        self.flags[flag] = currentValue
        callback(currentValue)
    end
    
    sliderTrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            local percentage = math.clamp((input.Position.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X, 0, 1)
            local newValue = minimum_value + (maximum_value - minimum_value) * percentage
            updateSlider(newValue)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local percentage = math.clamp((input.Position.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X, 0, 1)
            local newValue = minimum_value + (maximum_value - minimum_value) * percentage
            updateSlider(newValue)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    local element = {
        type = "slider",
        flag = flag,
        callback = callback,
        frame = sliderFrame,
        getValue = function() return currentValue end,
        setValue = function(newValue) updateSlider(newValue) end
    }
    
    table.insert(module.elements, element)
    updateSlider(value)
    return element
end

-- Added checkbox creation function
function Library:create_checkbox(module, data)
    local title = data.title or "Checkbox"
    local flag = data.flag or title
    local callback = data.callback or function() end
    
    return self:createToggle(module, {
        title = title,
        flag = flag,
        callback = callback
    })
end

-- Added paragraph creation function
function Library:create_paragraph(module, data)
    local title = data.title or "Paragraph"
    local text = data.text or "No text provided"
    
    local paragraphFrame = Instance.new("Frame")
    paragraphFrame.Name = title .. " Paragraph"
    paragraphFrame.BackgroundTransparency = 1
    paragraphFrame.Size = UDim2.new(1, -20, 0, 40)
    paragraphFrame.Parent = module.content
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.Text = title
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.TextSize = 14
    titleLabel.Size = UDim2.new(1, -20, 0, 20)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = paragraphFrame
    
    local textLabel = Instance.new("TextLabel")
    textLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontStyle.Normal, Enum.FontWeight.Normal)
    textLabel.TextColor3 = Color3.new(0.7, 0.7, 0.7)
    textLabel.Text = text
    textLabel.BackgroundTransparency = 1
    textLabel.Position = UDim2.new(0, 10, 0, 20)
    textLabel.TextSize = 12
    textLabel.Size = UDim2.new(1, -20, 0, 20)
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextWrapped = true
    textLabel.Parent = paragraphFrame
    
    local element = {
        type = "paragraph",
        frame = paragraphFrame,
        updateText = function(newText) textLabel.Text = newText end
    }
    
    table.insert(module.elements, element)
    return element
end

-- Added textbox creation function
function Library:create_textbox(module, data)
    local title = data.title or "Textbox"
    local placeholder = data.placeholder or "Enter text..."
    local flag = data.flag or title
    local callback = data.callback or function() end
    
    local textboxFrame = Instance.new("Frame")
    textboxFrame.Name = title .. " Textbox"
    textboxFrame.BackgroundTransparency = 1
    textboxFrame.Size = UDim2.new(1, -20, 0, 50)
    textboxFrame.Parent = module.content
    
    local label = Instance.new("TextLabel")
    label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Text = title
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 10, 0, 0)
    label.TextSize = 14
    label.Size = UDim2.new(0, 150, 0, 20)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = textboxFrame
    
    local textbox = Instance.new("TextBox")
    textbox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontStyle.Normal, Enum.FontWeight.Normal)
    textbox.TextColor3 = Color3.new(1, 1, 1)
    textbox.PlaceholderText = placeholder
    textbox.Text = ""
    textbox.BackgroundColor3 = Color3.new(0.0627, 0.0588, 0.0863)
    textbox.Position = UDim2.new(0, 10, 0, 25)
    textbox.TextSize = 12
    textbox.Size = UDim2.new(1, -20, 0, 25)
    textbox.TextXAlignment = Enum.TextXAlignment.Left
    textbox.Parent = textboxFrame
    
    local textboxCorner = Instance.new("UICorner")
    textboxCorner.CornerRadius = UDim.new(0, 4)
    textboxCorner.Parent = textbox
    
    local textboxStroke = Instance.new("UIStroke")
    textboxStroke.Color = Color3.new(0.0863, 0.0863, 0.0863)
    textboxStroke.Parent = textbox
    
    textbox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            self.flags[flag] = textbox.Text
            callback(textbox.Text)
        end
    end)
    
    local element = {
        type = "textbox",
        flag = flag,
        callback = callback,
        frame = textboxFrame,
        getValue = function() return textbox.Text end,
        setValue = function(value) 
            textbox.Text = value
            self.flags[flag] = value
        end
    }
    
    table.insert(module.elements, element)
    return element
end

-- Added event handlers setup
function Library:setupEventHandlers()
    -- Make UI draggable
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    self.mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = self.mainFrame.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            self.mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

-- Added minimize toggle function
function Library:toggleMinimize()
    self.minimized = not self.minimized
    self.main_UI.Enabled = not self.minimized
    self.minimized_ui.Enabled = self.minimized
end

-- Added load function
function Library:load()
    -- Update username
    local player = Players.LocalPlayer
    if self.mainFrame:FindFirstChild("Avatar preview") then
        local welcomeLabel = self.mainFrame["Avatar preview"]:FindFirstChild("Welcome (and user of roblox player)")
        if welcomeLabel then
            welcomeLabel.Text = "Welcome " .. player.Name
        end
        
        local playerSkin = self.mainFrame["Avatar preview"]:FindFirstChild("Player skin")
        if playerSkin then
            playerSkin.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"
        end
    end
    
    print("Anerial.cc UI Library loaded successfully!")
end

-- Added utility functions for module elements
function Library:create_dropdown(module, data)
    return module:create_dropdown(data)
end

function Library:create_slider(module, data)
    return module:create_slider(data)
end

function Library:create_checkbox(module, data)
    return module:create_checkbox(data)
end

function Library:create_paragraph(module, data)
    return module:create_paragraph(data)
end

function Library:create_textbox(module, data)
    return module:create_textbox(data)
end

-- Added module methods
local ModuleMethods = {}
ModuleMethods.__index = ModuleMethods

function ModuleMethods:create_dropdown(data)
    return Library:create_dropdown(self, data)
end

function ModuleMethods:create_slider(data)
    return Library:create_slider(self, data)
end

function ModuleMethods:create_checkbox(data)
    return Library:create_checkbox(self, data)
end

function ModuleMethods:create_paragraph(data)
    return Library:create_paragraph(self, data)
end

function ModuleMethods:create_textbox(data)
    return Library:create_textbox(self, data)
end

-- Apply module methods to created modules
local originalCreateModule = Library.create_module
function Library:create_module(data)
    local module = originalCreateModule(self, data)
    setmetatable(module, ModuleMethods)
    return module
end

return Library
