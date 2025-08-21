-- Anerial UI Library
-- Created by v0rtexd & Lenny 

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local Library = {}
Library.__index = Library

-- Main Library Constructor
function Library.new()
    local self = setmetatable({}, Library)
    
    self.flags = {}
    self.tabs = {}
    self.currentTab = nil
    self.isMinimized = false
    self.modules = {}
    
    self:CreateUI()
    self:SetupEvents()
    
    return self
end

-- Create the main UI structure
function Library:CreateUI()
    -- Main UI ScreenGui
    local main_UI = Instance.new("ScreenGui")
    main_UI.Name = "Main UI"
    main_UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    main_UI.Parent = PlayerGui
    
    -- Minimized UI ScreenGui
    local minimized_ui = Instance.new("ScreenGui")
    minimized_ui.Name = "Minimized ui"
    minimized_ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    minimized_ui.Parent = main_UI
    minimized_ui.Enabled = false
    
    -- Minimized UI Frame
    local minimized_ui_cro = Instance.new("Frame")
    minimized_ui_cro.Name = "Minimized ui cro"
    minimized_ui_cro.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
    minimized_ui_cro.Position = UDim2.new(0.459, 0, 0.0293, 0)
    minimized_ui_cro.BorderColor3 = Color3.new()
    minimized_ui_cro.BorderSizePixel = 0
    minimized_ui_cro.Size = UDim2.new(0, 120, 0, 31)
    minimized_ui_cro.Parent = minimized_ui
    
    local uIStroke = Instance.new("UIStroke")
    uIStroke.Name = "UIStroke"
    uIStroke.Color = Color3.new(0.0667, 0.0667, 0.0824)
    uIStroke.Parent = minimized_ui_cro
    
    local unminize_button = Instance.new("TextButton")
    unminize_button.Name = "Unminize button"
    unminize_button.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
    unminize_button.TextColor3 = Color3.new()
    unminize_button.Text = ""
    unminize_button.BackgroundColor3 = Color3.new(1, 1, 1)
    unminize_button.BackgroundTransparency = 1
    unminize_button.Position = UDim2.new(-0.0687, 0, 0, 0)
    unminize_button.BorderSizePixel = 0
    unminize_button.BorderColor3 = Color3.new()
    unminize_button.TextSize = 14
    unminize_button.Size = UDim2.new(0, 128, 0, 27)
    unminize_button.Parent = minimized_ui_cro
    
    local frame = Instance.new("Frame")
    frame.Name = "Frame"
    frame.BackgroundColor3 = Color3.new(0.176, 0.176, 0.224)
    frame.Position = UDim2.new(0.298, 0, 0.133, 0)
    frame.BorderColor3 = Color3.new()
    frame.BorderSizePixel = 0
    frame.Size = UDim2.new(0, 1, 0, 23)
    frame.Parent = minimized_ui_cro
    
    local anerial_cc = Instance.new("TextLabel")
    anerial_cc.Name = "Anerial.cc"
    anerial_cc.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
    )
    anerial_cc.TextColor3 = Color3.new(1, 1, 1)
    anerial_cc.Text = "Anerial.cc"
    anerial_cc.BackgroundColor3 = Color3.new(1, 1, 1)
    anerial_cc.BackgroundTransparency = 1
    anerial_cc.Position = UDim2.new(0.358, 0, 0.133, 0)
    anerial_cc.BorderSizePixel = 0
    anerial_cc.BorderColor3 = Color3.new()
    anerial_cc.TextSize = 13
    anerial_cc.Size = UDim2.new(0, 69, 0, 21)
    anerial_cc.Parent = minimized_ui_cro
    
    local uIGradient = Instance.new("UIGradient")
    uIGradient.Name = "UIGradient"
    uIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
    ColorSequenceKeypoint.new(1, Color3.new(0.392, 0.392, 0.392))
    })
    uIGradient.Parent = anerial_cc
    
    local uICorner = Instance.new("UICorner")
    uICorner.Name = "UICorner"
    uICorner.CornerRadius = UDim.new(0, 4)
    uICorner.Parent = minimized_ui_cro
    
    local cat_gif = Instance.new("ImageLabel")
    cat_gif.Name = "Cat gif"
    cat_gif.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    cat_gif.BackgroundColor3 = Color3.new(1, 1, 1)
    cat_gif.Position = UDim2.new(0.463, 0, 0.0355, 0)
    cat_gif.BorderColor3 = Color3.new()
    cat_gif.BorderSizePixel = 0
    cat_gif.Size = UDim2.new(0, 20, 0, 20)
    cat_gif.Parent = minimized_ui
    
    -- Main UI Frame
    local main = Instance.new("Frame")
    main.Name = "main"
    main.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
    main.Position = UDim2.new(0.227, 0, 0.198, 0)
    main.BorderColor3 = Color3.new()
    main.BorderSizePixel = 0
    main.Size = UDim2.new(0, 813, 0, 494)
    main.Parent = main_UI
    
    -- UI Corner and Stroke for main frame
    local uICorner_main = Instance.new("UICorner")
    uICorner_main.Name = "UICorner"
    uICorner_main.Parent = main
    
    local uIStroke_main = Instance.new("UIStroke")
    uIStroke_main.Name = "UIStroke"
    uIStroke_main.Color = Color3.new(0.0667, 0.0667, 0.0824)
    uIStroke_main.Parent = main
    
    -- Logo
    local logo = Instance.new("TextLabel")
    logo.Name = "Logo"
    logo.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.Bold
    )
    logo.TextColor3 = Color3.new(1, 1, 1)
    logo.Text = "Anerial.cc"
    logo.BackgroundColor3 = Color3.new(1, 1, 1)
    logo.BackgroundTransparency = 1
    logo.Position = UDim2.new(0.0382, 0, 0.0105, 0)
    logo.BorderSizePixel = 0
    logo.BorderColor3 = Color3.new()
    logo.TextSize = 33
    logo.Size = UDim2.new(0, 170, 0, 45)
    logo.Parent = main
    
    -- Credits
    local credits = Instance.new("TextLabel")
    credits.Name = "Credits"
    credits.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
    )
    credits.TextColor3 = Color3.new(0.42, 0.42, 0.424)
    credits.Text = "v0rtexd & Lenny"
    credits.BackgroundColor3 = Color3.new(1, 1, 1)
    credits.BackgroundTransparency = 1
    credits.Position = UDim2.new(0.075, 0, 0.0951, 0)
    credits.BorderSizePixel = 0
    credits.BorderColor3 = Color3.new()
    credits.TextSize = 14
    credits.Size = UDim2.new(0, 108, 0, 18)
    credits.Parent = main
    
    -- Player info
    local avatar_preview = Instance.new("Frame")
    avatar_preview.Name = "Avatar preview"
    avatar_preview.BackgroundColor3 = Color3.new(0.0902, 0.0902, 0.114)
    avatar_preview.Position = UDim2.new(0.0394, 0, 0.891, 0)
    avatar_preview.BorderColor3 = Color3.new()
    avatar_preview.BorderSizePixel = 0
    avatar_preview.Size = UDim2.new(0, 190, 0, 1)
    avatar_preview.Parent = main
    
    local player_skin = Instance.new("ImageLabel")
    player_skin.Name = "Player skin"
    player_skin.BackgroundColor3 = Color3.new(1, 1, 1)
    player_skin.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. Player.UserId .. "&width=420&height=420&format=png"
    player_skin.BackgroundTransparency = 1
    player_skin.Position = UDim2.new(-0.0541, 0, 7.65, 0)
    player_skin.BorderColor3 = Color3.new()
    player_skin.BorderSizePixel = 0
    player_skin.Size = UDim2.new(0, 40, 0, 40)
    player_skin.Parent = avatar_preview
    
    local uICorner_skin = Instance.new("UICorner")
    uICorner_skin.Name = "UICorner"
    uICorner_skin.CornerRadius = UDim.new(1, 10)
    uICorner_skin.Parent = player_skin
    
    local welcome_text = Instance.new("TextLabel")
    welcome_text.Name = "Welcome (and user of roblox player)"
    welcome_text.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
    )
    welcome_text.TextColor3 = Color3.new(1, 1, 1)
    welcome_text.Text = "Welcome " .. Player.Name
    welcome_text.BackgroundColor3 = Color3.new(1, 1, 1)
    welcome_text.BackgroundTransparency = 1
    welcome_text.Position = UDim2.new(0.416, 0, 18, 0)
    welcome_text.BorderSizePixel = 0
    welcome_text.BorderColor3 = Color3.new()
    welcome_text.TextSize = 16
    welcome_text.Size = UDim2.new(0, 77, 0, 19)
    welcome_text.Parent = avatar_preview
    
    -- Search Bar
    local search_Bar = Instance.new("Frame")
    search_Bar.Name = "Search Bar"
    search_Bar.BackgroundColor3 = Color3.new(0.0353, 0.0353, 0.051)
    search_Bar.Position = UDim2.new(0.329, 0, 0.0483, 0)
    search_Bar.BorderColor3 = Color3.new()
    search_Bar.BorderSizePixel = 0
    search_Bar.Size = UDim2.new(0, 115, 0, 27)
    search_Bar.Parent = main
    
    local uICorner_search = Instance.new("UICorner")
    uICorner_search.Name = "UICorner"
    uICorner_search.CornerRadius = UDim.new(0, 9)
    uICorner_search.Parent = search_Bar
    
    local uIStroke_search = Instance.new("UIStroke")
    uIStroke_search.Name = "UIStroke"
    uIStroke_search.Color = Color3.new(0.0667, 0.0667, 0.098)
    uIStroke_search.Parent = search_Bar
    
    local search_textbox = Instance.new("TextBox")
    search_textbox.Name = "Search for module"
    search_textbox.FontFace = Font.new(
    "rbxasset://fonts/families/SourceSansPro.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
    )
    search_textbox.TextDirection = Enum.TextDirection.LeftToRight
    search_textbox.TextColor3 = Color3.new(0.392, 0.392, 0.392)
    search_textbox.Text = ""
    search_textbox.PlaceholderText = "Search..."
    search_textbox.BackgroundTransparency = 1
    search_textbox.BackgroundColor3 = Color3.new(1, 1, 1)
    search_textbox.BorderSizePixel = 0
    search_textbox.BorderColor3 = Color3.new()
    search_textbox.TextSize = 14
    search_textbox.Size = UDim2.new(0, 80, 0, 24)
    search_textbox.Position = UDim2.new(0.05, 0, 0.1, 0)
    search_textbox.Parent = search_Bar
    
    local search_logo = Instance.new("ImageLabel")
    search_logo.Name = "Search logo"
    search_logo.ImageColor3 = Color3.new(0.455, 0.431, 0.863)
    search_logo.BorderColor3 = Color3.new()
    search_logo.Image = "rbxassetid://10734943674"
    search_logo.BackgroundTransparency = 1
    search_logo.Position = UDim2.new(0.78, 0, 0.24, 0)
    search_logo.BackgroundColor3 = Color3.new(1, 1, 1)
    search_logo.BorderSizePixel = 0
    search_logo.Size = UDim2.new(0, 13, 0, 13)
    search_logo.Parent = search_Bar
    
    -- Separator line
    local separator = Instance.new("Frame")
    separator.Name = "Frame"
    separator.BackgroundColor3 = Color3.new(0.0784, 0.0784, 0.0784)
    separator.Position = UDim2.new(0.311, 0, 0.133, 0)
    separator.BorderColor3 = Color3.new()
    separator.BorderSizePixel = 0
    separator.Size = UDim2.new(0, 560, 0, 1)
    separator.Parent = main
    
    -- Minimize button
    local minimize_frame = Instance.new("Frame")
    minimize_frame.Name = "Mimize frame"
    minimize_frame.BackgroundColor3 = Color3.new(1, 1, 1)
    minimize_frame.BackgroundTransparency = 1
    minimize_frame.Position = UDim2.new(0.911, 0, 0.0486, 0)
    minimize_frame.BorderColor3 = Color3.new()
    minimize_frame.BorderSizePixel = 0
    minimize_frame.Size = UDim2.new(0, 15, 0, 15)
    minimize_frame.Parent = main
    
    local minimize_button = Instance.new("TextButton")
    minimize_button.Name = "Button of minimize"
    minimize_button.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
    minimize_button.TextColor3 = Color3.new()
    minimize_button.Text = "_"
    minimize_button.BackgroundColor3 = Color3.new(1, 1, 1)
    minimize_button.BackgroundTransparency = 1
    minimize_button.Position = UDim2.new(0.367, 0, -0.0596, 0)
    minimize_button.BorderSizePixel = 0
    minimize_button.BorderColor3 = Color3.new()
    minimize_button.TextSize = 14
    minimize_button.Size = UDim2.new(0, 20, 0, 20)
    minimize_button.Parent = minimize_frame
    
    -- Close button
    local close_frame = Instance.new("Frame")
    close_frame.Name = "Close button"
    close_frame.BackgroundColor3 = Color3.new(1, 1, 1)
    close_frame.BackgroundTransparency = 1
    close_frame.Position = UDim2.new(0.958, 0, 0.048, 0)
    close_frame.BorderColor3 = Color3.new()
    close_frame.BorderSizePixel = 0
    close_frame.Size = UDim2.new(0, 18, 0, 20)
    close_frame.Parent = main
    
    local close_button = Instance.new("TextButton")
    close_button.Name = "Close button"
    close_button.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
    close_button.TextColor3 = Color3.new()
    close_button.Text = ""
    close_button.BackgroundColor3 = Color3.new(1, 1, 1)
    close_button.BackgroundTransparency = 1
    close_button.Position = UDim2.new(0.0467, 0, 0.00666, 0)
    close_button.BorderSizePixel = 0
    close_button.BorderColor3 = Color3.new()
    close_button.TextSize = 14
    close_button.Size = UDim2.new(0, 21, 0, 17)
    close_button.Parent = close_frame
    
    local close_icon = Instance.new("ImageLabel")
    close_icon.Name = "ImageLabel"
    close_icon.ImageColor3 = Color3.new(0.365, 0.365, 0.365)
    close_icon.Image = "rbxassetid://10747384394"
    close_icon.BackgroundTransparency = 1
    close_icon.BackgroundColor3 = Color3.new(1, 1, 1)
    close_icon.BorderColor3 = Color3.new()
    close_icon.BorderSizePixel = 0
    close_icon.Size = UDim2.new(0, 18, 0, 19)
    close_icon.Parent = close_frame
    
    -- Tabs System
    local tabs_system = Instance.new("Frame")
    tabs_system.Name = "Tabs System"
    tabs_system.BackgroundColor3 = Color3.new(1, 1, 1)
    tabs_system.BackgroundTransparency = 1
    tabs_system.Position = UDim2.new(0.00971, 0, 0.131, 0)
    tabs_system.BorderColor3 = Color3.new()
    tabs_system.BorderSizePixel = 0
    tabs_system.Size = UDim2.new(0, 211, 0, 387)
    tabs_system.Parent = main
    
    -- Vertical separator for tabs
    local tab_separator = Instance.new("Frame")
    tab_separator.Name = "Frame"
    tab_separator.BackgroundColor3 = Color3.new(0.0902, 0.0902, 0.114)
    tab_separator.Position = UDim2.new(0.309, 0, 0, 0)
    tab_separator.BorderColor3 = Color3.new()
    tab_separator.BorderSizePixel = 0
    tab_separator.Size = UDim2.new(0, 1, 0, 494)
    tab_separator.Parent = main
    
    -- Module sections
    local left_section = Instance.new("Frame")
    left_section.Name = "Left Section"
    left_section.BackgroundTransparency = 1
    left_section.Position = UDim2.new(0.328, 0, 0.174, 0)
    left_section.BorderColor3 = Color3.new()
    left_section.BorderSizePixel = 0
    left_section.Size = UDim2.new(0, 262, 0, 400)
    left_section.Parent = main
    
    local right_section = Instance.new("Frame")
    right_section.Name = "Right Section"
    right_section.BackgroundTransparency = 1
    right_section.Position = UDim2.new(0.668, 0, 0.174, 0)
    right_section.BorderColor3 = Color3.new()
    right_section.BorderSizePixel = 0
    right_section.Size = UDim2.new(0, 255, 0, 400)
    right_section.Parent = main
    
    -- Store references
    self.UI = main_UI
    self.MainFrame = main
    self.MinimizedUI = minimized_ui
    self.TabsSystem = tabs_system
    self.LeftSection = left_section
    self.RightSection = right_section
    self.SearchBox = search_textbox
    
    -- Button connections
    minimize_button.MouseButton1Click:Connect(function()
        self:ToggleMinimize()
    end)
    
    unminize_button.MouseButton1Click:Connect(function()
        self:ToggleMinimize()
    end)
    
    close_button.MouseButton1Click:Connect(function()
        self:Destroy()
    end)
end

-- Setup drag functionality and other events
function Library:SetupEvents()
    local dragging = false
    local dragInput, mousePos, framePos
    
    local function updateInput(input)
        local delta = input.Position - mousePos
        self.MainFrame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
    end
    
    self.MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = self.MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    self.MainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateInput(input)
        end
    end)
    
    -- Search functionality
    self.SearchBox.Changed:Connect(function(property)
        if property == "Text" then
            self:FilterModules(self.SearchBox.Text:lower())
        end
    end)
end

-- Filter modules based on search
function Library:FilterModules(searchText)
    for _, tab in pairs(self.tabs) do
        for _, module in pairs(tab.modules) do
            if searchText == "" or module.title:lower():find(searchText) then
                module.frame.Visible = true
            else
                module.frame.Visible = false
            end
        end
    end
end

-- Toggle minimize state
function Library:ToggleMinimize()
    self.isMinimized = not self.isMinimized
    self.MainFrame.Visible = not self.isMinimized
    self.MinimizedUI.Enabled = self.isMinimized
end

-- Create a new tab
function Library:create_tab(name, icon)
    local tab = {
        name = name,
        icon = icon,
        modules = {},
        leftModules = {},
        rightModules = {},
        isSelected = false
    }
    
    -- Create tab frame
    local tab_frame = Instance.new("Frame")
    tab_frame.Name = name .. " Tab"
    tab_frame.BackgroundColor3 = Color3.new(0.0392, 0.0392, 0.0588)
    tab_frame.BackgroundTransparency = 1
    tab_frame.Position = UDim2.new(0.0621, 0, (#self.tabs * 0.12) + 0.025, 0)
    tab_frame.BorderColor3 = Color3.new()
    tab_frame.BorderSizePixel = 0
    tab_frame.Size = UDim2.new(0, 200, 0, 36)
    tab_frame.Parent = self.TabsSystem
    
    local tab_icon = Instance.new("ImageLabel")
    tab_icon.Name = "Tab Icon"
    tab_icon.BackgroundTransparency = 1
    tab_icon.Image = icon
    tab_icon.Position = UDim2.new(0, 0, 0.188, 0)
    tab_icon.Size = UDim2.new(0, 20, 0, 20)
    tab_icon.Parent = tab_frame
    
    local tab_label = Instance.new("TextLabel")
    tab_label.Name = "Tab Name"
    tab_label.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontStyle.Normal,
        Enum.FontWeight.SemiBold
    )
    tab_label.TextColor3 = Color3.new(1, 1, 1)
    tab_label.Text = name
    tab_label.BackgroundTransparency = 1
    tab_label.Position = UDim2.new(0.15, 0, 0.184, 0)
    tab_label.Size = UDim2.new(0, 100, 0, 21)
    tab_label.TextSize = 16
    tab_label.Parent = tab_frame
    
    local tab_button = Instance.new("TextButton")
    tab_button.Name = "Tab Button"
    tab_button.Text = ""
    tab_button.BackgroundTransparency = 1
    tab_button.Size = UDim2.new(1, 0, 1, 0)
    tab_button.Parent = tab_frame
    
    -- Tab selection logic
    tab_button.MouseButton1Click:Connect(function()
        self:SelectTab(tab)
    end)
    
    tab.frame = tab_frame
    tab.icon_obj = tab_icon
    tab.label = tab_label
    tab.button = tab_button
    
    -- Add create_module method to tab
    tab.create_module = function(self, options)
        return tab:CreateModule(options)
    end
    
    function tab:CreateModule(options)
        local module = {
            title = options.title or "Module",
            description = options.description or "",
            flag = options.flag or options.title,
            section = options.section or "left",
            callback = options.callback or function() end,
            enabled = false,
            elements = {}
        }
        
        -- Determine section and position
        local section = module.section == "left" and Library.LeftSection or Library.RightSection
        local moduleList = module.section == "left" and tab.leftModules or tab.rightModules
        local yOffset = #moduleList * 240
        
        -- Create module frame
        local module_frame = Instance.new("Frame")
        module_frame.Name = module.title .. " Module"
        module_frame.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
        module_frame.Position = UDim2.new(0, 0, 0, yOffset)
        module_frame.BorderSizePixel = 0
        module_frame.Size = UDim2.new(0, module.section == "left" and 262 or 255, 0, 226)
        module_frame.Parent = section
        module_frame.Visible = tab.isSelected
        
        local module_corner = Instance.new("UICorner")
        module_corner.Parent = module_frame
        
        local module_stroke = Instance.new("UIStroke")
        module_stroke.Color = Color3.new(0.0902, 0.0902, 0.114)
        module_stroke.Parent = module_frame
        
        -- Module title
        local module_title = Instance.new("TextLabel")
        module_title.Name = "Module Title"
        module_title.FontFace = Font.new(
            "rbxasset://fonts/families/GothamSSm.json",
            Enum.FontStyle.Normal,
            Enum.FontWeight.SemiBold
        )
        module_title.TextColor3 = Color3.new(1, 1, 1)
        module_title.Text = module.title
        module_title.BackgroundTransparency = 1
        module_title.Position = UDim2.new(0.02, 0, 0.02, 0)
        module_title.Size = UDim2.new(0, 200, 0, 21)
        module_title.TextSize = 15
        module_title.TextXAlignment = Enum.TextXAlignment.Left
        module_title.Parent = module_frame
        
        -- Module description
        local module_desc = Instance.new("TextLabel")
        module_desc.Name = "Module Description"
        module_desc.FontFace = Font.new(
            "rbxasset://fonts/families/SourceSansPro.json",
            Enum.FontStyle.Normal,
            Enum.FontWeight.SemiBold
        )
        module_desc.TextColor3 = Color3.new(0.42, 0.42, 0.424)
        module_desc.Text = module.description
        module_desc.BackgroundTransparency = 1
        module_desc.Position = UDim2.new(0.02, 0, 0.12, 0)
        module_desc.Size = UDim2.new(0, 200, 0, 17)
        module_desc.TextSize = 15
        module_desc.TextXAlignment = Enum.TextXAlignment.Left
        module_desc.Parent = module_frame
        
        -- Main module toggle
        local toggle_frame = Instance.new("Frame")
        toggle_frame.Name = "Main Toggle"
        toggle_frame.BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)
        toggle_frame.Position = UDim2.new(0.8, 0, 0.05, 0)
        toggle_frame.Size = UDim2.new(0, 36, 0, 20)
        toggle_frame.Parent = module_frame
        
        local toggle_corner = Instance.new("UICorner")
        toggle_corner.CornerRadius = UDim.new(0, 9)
        toggle_corner.Parent = toggle_frame
        
        local toggle_button = Instance.new("TextButton")
        toggle_button.Name = "Toggle Button"
        toggle_button.Text = ""
        toggle_button.BackgroundTransparency = 1
        toggle_button.Size = UDim2.new(1, 0, 1, 0)
        toggle_button.Parent = toggle_frame
        
        local toggle_slider = Instance.new("Frame")
        toggle_slider.Name = "Toggle Slider"
        toggle_slider.BackgroundColor3 = Color3.new(1, 1, 1)
        toggle_slider.Position = UDim2.new(0.167, 0, 0.25, 0)
        toggle_slider.Size = UDim2.new(0, 10, 0, 10)
        toggle_slider.Parent = toggle_frame
        
        local slider_corner = Instance.new("UICorner")
        slider_corner.Parent = toggle_slider
        
        -- Toggle functionality
        toggle_button.MouseButton1Click:Connect(function()
            module.enabled = not module.enabled
            Library.flags[module.flag] = module.enabled
            
            if module.enabled then
                toggle_frame.BackgroundColor3 = Color3.new(0.475, 0.451, 0.918)
                toggle_slider.Position = UDim2.new(0.5, 0, 0.25, 0)
            else
                toggle_frame.BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)
                toggle_slider.Position = UDim2.new(0.167, 0, 0.25, 0)
            end
            
            module.callback(module.enabled)
        end)
        
        -- Store references
        module.frame = module_frame
        module.tab = tab
        table.insert(moduleList, module)
        table.insert(tab.modules, module)
        
        -- Add element creation methods
        module.create_slider = function(self, options)
            return module:CreateSlider(options)
        end
        
        module.create_dropdown = function(self, options)
            return module:CreateDropdown(options)
        end
        
        module.create_checkbox = function(self, options)
            return module:CreateCheckbox(options)
        end
        
        module.create_textbox = function(self, options)
            return module:CreateTextbox(options)
        end
        
        module.create_paragraph = function(self, options)
            return module:CreateParagraph(options)
        end
        
        module.create_colorpicker = function(self, options)
            return module:CreateColorpicker(options)
        end
        
        return module
    end
    
    table.insert(self.tabs, tab)
    
    -- Select first tab by default
    if #self.tabs == 1 then
        self:SelectTab(tab)
    end
    
    return tab
end

-- Select a tab
function Library:SelectTab(tab)
    -- Hide all tabs content
    for _, t in pairs(self.tabs) do
        t.isSelected = false
        t.frame.BackgroundTransparency = 1
        t.label.TextColor3 = Color3.new(1, 1, 1)
        t.icon_obj.ImageColor3 = Color3.new(1, 1, 1)
        
        -- Hide all modules in this tab
        for _, module in pairs(t.modules) do
            module.frame.Visible = false
        end
    end
    
    -- Show selected tab
    tab.isSelected = true
    tab.frame.BackgroundTransparency = 0
    tab.frame.BackgroundColor3 = Color3.new(0.0392, 0.0392, 0.0588)
    tab.label.TextColor3 = Color3.new(0.475, 0.451, 0.902)
    tab.icon_obj.ImageColor3 = Color3.new(0.435, 0.416, 0.831)
    
    -- Show all modules in this tab
    for _, module in pairs(tab.modules) do
        module.frame.Visible = true
    end
    
    self.currentTab = tab
end

-- Create slider for module
function Library:CreateSlider(module, options)
    local slider = {
        title = options.title or "Slider",
        flag = options.flag or options.title,
        minimum_value = options.minimum_value or 0,
        maximum_value = options.maximum_value or 100,
        value = options.value or 50,
        round_number = options.round_number or false,
        callback = options.callback or function() end
    }
    
    local yOffset = #module.elements * 70 + 100
    
    -- Slider title
    local slider_title = Instance.new("TextLabel")
    slider_title.Name = "Slider Title"
    slider_title.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontStyle.Normal,
        Enum.FontWeight.SemiBold
    )
    slider_title.TextColor3 = Color3.new(0.992, 0.992, 0.992)
    slider_title.Text = slider.title
    slider_title.BackgroundTransparency = 1
    slider_title.Position = UDim2.new(0.02, 0, 0, yOffset)
    slider_title.Size = UDim2.new(0, 200, 0, 14)
    slider_title.TextSize = 15
    slider_title.TextXAlignment = Enum.TextXAlignment.Left
    slider_title.Parent = module.frame
    
    -- Slider track
    local slider_track = Instance.new("Frame")
    slider_track.Name = "Slider Track"
    slider_track.BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)
    slider_track.Position = UDim2.new(0.06, 0, 0, yOffset + 20)
    slider_track.Size = UDim2.new(0, 180, 0, 7)
    slider_track.Parent = module.frame
    
    local track_corner = Instance.new("UICorner")
    track_corner.CornerRadius = UDim.new(0, 3)
    track_corner.Parent = slider_track
    
    -- Slider fill
    local slider_fill = Instance.new("Frame")
    slider_fill.Name = "Slider Fill"
    slider_fill.BackgroundColor3 = Color3.new(0.475, 0.451, 0.918)
    slider_fill.Position = UDim2.new(0, 0, 0, 0)
    slider_fill.Size = UDim2.new(0.5, 0, 1, 0)
    slider_fill.Parent = slider_track
    
    local fill_corner = Instance.new("UICorner")
    fill_corner.CornerRadius = UDim.new(0, 3)
    fill_corner.Parent = slider_fill
    
    -- Slider handle
    local slider_handle = Instance.new("Frame")
    slider_handle.Name = "Slider Handle"
    slider_handle.BackgroundColor3 = Color3.new(1, 1, 1)
    slider_handle.Position = UDim2.new(0.5, -5, -0.3, 0)
    slider_handle.Size = UDim2.new(0, 11, 0, 11)
    slider_handle.Parent = slider_track
    
    local handle_corner = Instance.new("UICorner")
    handle_corner.CornerRadius = UDim.new(0, 3)
    handle_corner.Parent = slider_handle
    
    -- Value display
    local value_label = Instance.new("TextLabel")
    value_label.Name = "Value Label"
    value_label.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontStyle.Normal,
        Enum.FontWeight.SemiBold
    )
    value_label.TextColor3 = Color3.new(1, 1, 1)
    value_label.Text = tostring(slider.value)
    value_label.BackgroundTransparency = 1
    value_label.Position = UDim2.new(0.85, 0, 0, yOffset + 10)
    value_label.Size = UDim2.new(0, 40, 0, 20)
    value_label.TextSize = 14
    value_label.Parent = module.frame
    
    -- Slider button for interaction
    local slider_button = Instance.new("TextButton")
    slider_button.Name = "Slider Button"
    slider_button.Text = ""
    slider_button.BackgroundTransparency = 1
    slider_button.Size = UDim2.new(1, 0, 1, 0)
    slider_button.Parent = slider_track
    
    -- Slider functionality
    local dragging = false
    
    local function updateSlider(input)
        local percentage = math.clamp((input.Position.X - slider_track.AbsolutePosition.X) / slider_track.AbsoluteSize.X, 0, 1)
        local value = slider.minimum_value + (slider.maximum_value - slider.minimum_value) * percentage
        
        if slider.round_number then
            value = math.floor(value + 0.5)
        end
        
        slider.value = value
        Library.flags[slider.flag] = value
        value_label.Text = tostring(value)
        slider_fill.Size = UDim2.new(percentage, 0, 1, 0)
        slider_handle.Position = UDim2.new(percentage, -5, -0.3, 0)
        
        slider.callback(value)
    end
    
    slider_button.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateSlider(input)
        end
    end)
    
    slider_button.MouseButton1Click:Connect(function()
        updateSlider(UserInputService:GetMouseLocation())
    end)
    
    -- Initialize slider
    local initial_percentage = (slider.value - slider.minimum_value) / (slider.maximum_value - slider.minimum_value)
    slider_fill.Size = UDim2.new(initial_percentage, 0, 1, 0)
    slider_handle.Position = UDim2.new(initial_percentage, -5, -0.3, 0)
    Library.flags[slider.flag] = slider.value
    
    table.insert(module.elements, slider)
    return slider
end

-- Add slider method to module
function Library:CreateSliderForModule(module, options)
    return self:CreateSlider(module, options)
end

-- Module methods
local Module = {}
Module.__index = Module

function Module:CreateSlider(options)
    return Library:CreateSlider(self, options)
end

function Module:CreateDropdown(options)
    local dropdown = {
        title = options.title or "Dropdown",
        flag = options.flag or options.title,
        options = options.options or {"Option 1", "Option 2", "Option 3"},
        multi_dropdown = options.multi_dropdown or false,
        maximum_options = options.maximum_options or 1,
        callback = options.callback or function() end,
        selected = {},
        opened = false
    }
    
    local yOffset = #self.elements * 70 + 100
    
    -- Dropdown title
    local dropdown_title = Instance.new("TextLabel")
    dropdown_title.Name = "Dropdown Title"
    dropdown_title.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontStyle.Normal,
        Enum.FontWeight.SemiBold
    )
    dropdown_title.TextColor3 = Color3.new(1, 1, 1)
    dropdown_title.Text = dropdown.title
    dropdown_title.BackgroundTransparency = 1
    dropdown_title.Position = UDim2.new(0.02, 0, 0, yOffset)
    dropdown_title.Size = UDim2.new(0, 200, 0, 14)
    dropdown_title.TextSize = 15
    dropdown_title.TextXAlignment = Enum.TextXAlignment.Left
    dropdown_title.Parent = self.frame
    
    -- Dropdown frame
    local dropdown_frame = Instance.new("Frame")
    dropdown_frame.Name = "Dropdown Frame"
    dropdown_frame.BackgroundColor3 = Color3.new(0.0627, 0.0588, 0.0863)
    dropdown_frame.Position = UDim2.new(0.6, 0, 0, yOffset + 15)
    dropdown_frame.Size = UDim2.new(0, 120, 0, 29)
    dropdown_frame.Parent = self.frame
    
    local dropdown_corner = Instance.new("UICorner")
    dropdown_corner.CornerRadius = UDim.new(0, 4)
    dropdown_corner.Parent = dropdown_frame
    
    local dropdown_stroke = Instance.new("UIStroke")
    dropdown_stroke.Color = Color3.new(0.0863, 0.0863, 0.0863)
    dropdown_stroke.Parent = dropdown_frame
    
    -- Selected option label
    local selected_label = Instance.new("TextLabel")
    selected_label.Name = "Selected Label"
    selected_label.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontStyle.Normal,
        Enum.FontWeight.SemiBold
    )
    selected_label.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    selected_label.Text = dropdown.options[1] or "None"
    selected_label.BackgroundTransparency = 1
    selected_label.Position = UDim2.new(0.05, 0, 0.1, 0)
    selected_label.Size = UDim2.new(0, 80, 0, 24)
    selected_label.TextSize = 12
    selected_label.TextXAlignment = Enum.TextXAlignment.Left
    selected_label.Parent = dropdown_frame
    
    -- Dropdown arrow
    local dropdown_arrow = Instance.new("ImageLabel")
    dropdown_arrow.Name = "Dropdown Arrow"
    dropdown_arrow.BackgroundTransparency = 1
    dropdown_arrow.Image = "rbxassetid://10709790948"
    dropdown_arrow.Position = UDim2.new(0.8, 0, 0.24, 0)
    dropdown_arrow.Size = UDim2.new(0, 15, 0, 15)
    dropdown_arrow.Parent = dropdown_frame
    
    -- Dropdown button
    local dropdown_button = Instance.new("TextButton")
    dropdown_button.Name = "Dropdown Button"
    dropdown_button.Text = ""
    dropdown_button.BackgroundTransparency = 1
    dropdown_button.Size = UDim2.new(1, 0, 1, 0)
    dropdown_button.Parent = dropdown_frame
    
    -- Options list
    local options_frame = Instance.new("Frame")
    options_frame.Name = "Options Frame"
    options_frame.BackgroundColor3 = Color3.new(0.0627, 0.0588, 0.0863)
    options_frame.Position = UDim2.new(0, 0, 1, 5)
    options_frame.Size = UDim2.new(0, 120, 0, #dropdown.options * 25)
    options_frame.Visible = false
    options_frame.Parent = dropdown_frame
    
    local options_corner = Instance.new("UICorner")
    options_corner.CornerRadius = UDim.new(0, 4)
    options_corner.Parent = options_frame
    
    local options_stroke = Instance.new("UIStroke")
    options_stroke.Color = Color3.new(0.0863, 0.0863, 0.0863)
    options_stroke.Parent = options_frame
    
    -- Create option buttons
    for i, option in ipairs(dropdown.options) do
        local option_button = Instance.new("TextButton")
        option_button.Name = "Option " .. i
        option_button.FontFace = Font.new(
            "rbxasset://fonts/families/GothamSSm.json",
            Enum.FontStyle.Normal,
            Enum.FontWeight.SemiBold
        )
        option_button.TextColor3 = Color3.new(0.498, 0.498, 0.498)
        option_button.Text = option
        option_button.BackgroundTransparency = 1
        option_button.Position = UDim2.new(0, 0, 0, (i - 1) * 25)
        option_button.Size = UDim2.new(1, 0, 0, 25)
        option_button.TextSize = 12
        option_button.Parent = options_frame
        
        option_button.MouseButton1Click:Connect(function()
            if dropdown.multi_dropdown then
                if table.find(dropdown.selected, option) then
                    table.remove(dropdown.selected, table.find(dropdown.selected, option))
                else
                    if #dropdown.selected < dropdown.maximum_options then
                        table.insert(dropdown.selected, option)
                    end
                end
                selected_label.Text = table.concat(dropdown.selected, ", ")
            else
                dropdown.selected = {option}
                selected_label.Text = option
            end
            
            Library.flags[dropdown.flag] = dropdown.multi_dropdown and dropdown.selected or dropdown.selected[1]
            dropdown.callback(dropdown.multi_dropdown and dropdown.selected or dropdown.selected[1])
            
            if not dropdown.multi_dropdown then
                dropdown.opened = false
                options_frame.Visible = false
                dropdown_arrow.Image = "rbxassetid://10709790948"
            end
        end)
    end
    
    -- Toggle dropdown
    dropdown_button.MouseButton1Click:Connect(function()
        dropdown.opened = not dropdown.opened
        options_frame.Visible = dropdown.opened
        dropdown_arrow.Image = dropdown.opened and "rbxassetid://10709791523" or "rbxassetid://10709790948"
    end)
    
    -- Initialize
    dropdown.selected = {dropdown.options[1] or "None"}
    Library.flags[dropdown.flag] = dropdown.multi_dropdown and dropdown.selected or dropdown.selected[1]
    
    table.insert(self.elements, dropdown)
    return dropdown
end

function Module:CreateCheckbox(options)
    local checkbox = {
        title = options.title or "Checkbox",
        flag = options.flag or options.title,
        callback = options.callback or function() end,
        enabled = false
    }
    
    local yOffset = #self.elements * 40 + 100
    
    -- Checkbox frame
    local checkbox_frame = Instance.new("Frame")
    checkbox_frame.Name = "Checkbox Frame"
    checkbox_frame.BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)
    checkbox_frame.Position = UDim2.new(0.8, 0, 0, yOffset)
    checkbox_frame.Size = UDim2.new(0, 36, 0, 20)
    checkbox_frame.Parent = self.frame
    
    local checkbox_corner = Instance.new("UICorner")
    checkbox_corner.CornerRadius = UDim.new(0, 9)
    checkbox_corner.Parent = checkbox_frame
    
    local checkbox_button = Instance.new("TextButton")
    checkbox_button.Name = "Checkbox Button"
    checkbox_button.Text = ""
    checkbox_button.BackgroundTransparency = 1
    checkbox_button.Size = UDim2.new(1, 0, 1, 0)
    checkbox_button.Parent = checkbox_frame
    
    local checkbox_slider = Instance.new("Frame")
    checkbox_slider.Name = "Checkbox Slider"
    checkbox_slider.BackgroundColor3 = Color3.new(1, 1, 1)
    checkbox_slider.Position = UDim2.new(0.167, 0, 0.25, 0)
    checkbox_slider.Size = UDim2.new(0, 10, 0, 10)
    checkbox_slider.Parent = checkbox_frame
    
    local slider_corner = Instance.new("UICorner")
    slider_corner.Parent = checkbox_slider
    
    -- Checkbox title
    local checkbox_title = Instance.new("TextLabel")
    checkbox_title.Name = "Checkbox Title"
    checkbox_title.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontStyle.Normal,
        Enum.FontWeight.SemiBold
    )
    checkbox_title.TextColor3 = Color3.new(1, 1, 1)
    checkbox_title.Text = checkbox.title
    checkbox_title.BackgroundTransparency = 1
    checkbox_title.Position = UDim2.new(0.02, 0, 0, yOffset)
    checkbox_title.Size = UDim2.new(0, 200, 0, 21)
    checkbox_title.TextSize = 15
    checkbox_title.TextXAlignment = Enum.TextXAlignment.Left
    checkbox_title.Parent = self.frame
    
    -- Toggle functionality
    checkbox_button.MouseButton1Click:Connect(function()
        checkbox.enabled = not checkbox.enabled
        Library.flags[checkbox.flag] = checkbox.enabled
        
        if checkbox.enabled then
            checkbox_frame.BackgroundColor3 = Color3.new(0.475, 0.451, 0.918)
            checkbox_slider.Position = UDim2.new(0.5, 0, 0.25, 0)
        else
            checkbox_frame.BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)
            checkbox_slider.Position = UDim2.new(0.167, 0, 0.25, 0)
        end
        
        checkbox.callback(checkbox.enabled)
    end)
    
    Library.flags[checkbox.flag] = checkbox.enabled
    table.insert(self.elements, checkbox)
    return checkbox
end

function Module:CreateTextbox(options)
    local textbox = {
        title = options.title or "Textbox",
        placeholder = options.placeholder or "Enter text...",
        flag = options.flag or options.title,
        callback = options.callback or function() end,
        text = ""
    }
    
    local yOffset = #self.elements * 50 + 100
    
    -- Textbox title
    local textbox_title = Instance.new("TextLabel")
    textbox_title.Name = "Textbox Title"
    textbox_title.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontStyle.Normal,
        Enum.FontWeight.SemiBold
    )
    textbox_title.TextColor3 = Color3.new(1, 1, 1)
    textbox_title.Text = textbox.title
    textbox_title.BackgroundTransparency = 1
    textbox_title.Position = UDim2.new(0.02, 0, 0, yOffset)
    textbox_title.Size = UDim2.new(0, 200, 0, 14)
    textbox_title.TextSize = 15
    textbox_title.TextXAlignment = Enum.TextXAlignment.Left
    textbox_title.Parent = self.frame
    
    -- Textbox frame
    local textbox_frame = Instance.new("Frame")
    textbox_frame.Name = "Textbox Frame"
    textbox_frame.BackgroundColor3 = Color3.new(0.0353, 0.0353, 0.051)
    textbox_frame.Position = UDim2.new(0.05, 0, 0, yOffset + 20)
    textbox_frame.Size = UDim2.new(0, 200, 0, 25)
    textbox_frame.Parent = self.frame
    
    local textbox_corner = Instance.new("UICorner")
    textbox_corner.CornerRadius = UDim.new(0, 4)
    textbox_corner.Parent = textbox_frame
    
    local textbox_stroke = Instance.new("UIStroke")
    textbox_stroke.Color = Color3.new(0.0667, 0.0667, 0.098)
    textbox_stroke.Parent = textbox_frame
    
    -- Actual textbox
    local textbox_input = Instance.new("TextBox")
    textbox_input.Name = "Textbox Input"
    textbox_input.FontFace = Font.new(
        "rbxasset://fonts/families/SourceSansPro.json",
        Enum.FontStyle.Normal,
        Enum.FontWeight.SemiBold
    )
    textbox_input.TextColor3 = Color3.new(1, 1, 1)
    textbox_input.PlaceholderText = textbox.placeholder
    textbox_input.Text = ""
    textbox_input.BackgroundTransparency = 1
    textbox_input.Position = UDim2.new(0.05, 0, 0, 0)
    textbox_input.Size = UDim2.new(0.9, 0, 1, 0)
    textbox_input.TextSize = 14
    textbox_input.TextXAlignment = Enum.TextXAlignment.Left
    textbox_input.Parent = textbox_frame
    
    -- Textbox functionality
    textbox_input.FocusLost:Connect(function()
        textbox.text = textbox_input.Text
        Library.flags[textbox.flag] = textbox.text
        textbox.callback(textbox.text)
    end)
    
    Library.flags[textbox.flag] = textbox.text
    table.insert(self.elements, textbox)
    return textbox
end

function Module:CreateParagraph(options)
    local paragraph = {
        title = options.title or "Paragraph",
        text = options.text or "This is a paragraph."
    }
    
    local yOffset = #self.elements * 50 + 100
    
    -- Paragraph title
    local paragraph_title = Instance.new("TextLabel")
    paragraph_title.Name = "Paragraph Title"
    paragraph_title.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontStyle.Normal,
        Enum.FontWeight.SemiBold
    )
    paragraph_title.TextColor3 = Color3.new(1, 1, 1)
    paragraph_title.Text = paragraph.title
    paragraph_title.BackgroundTransparency = 1
    paragraph_title.Position = UDim2.new(0.02, 0, 0, yOffset)
    paragraph_title.Size = UDim2.new(0, 200, 0, 14)
    paragraph_title.TextSize = 15
    paragraph_title.TextXAlignment = Enum.TextXAlignment.Left
    paragraph_title.Parent = self.frame
    
    -- Paragraph text
    local paragraph_text = Instance.new("TextLabel")
    paragraph_text.Name = "Paragraph Text"
    paragraph_text.FontFace = Font.new(
        "rbxasset://fonts/families/SourceSansPro.json",
        Enum.FontStyle.Normal,
        Enum.FontWeight.SemiBold
    )
    paragraph_text.TextColor3 = Color3.new(0.42, 0.42, 0.424)
    paragraph_text.Text = paragraph.text
    paragraph_text.BackgroundTransparency = 1
    paragraph_text.Position = UDim2.new(0.02, 0, 0, yOffset + 20)
    paragraph_text.Size = UDim2.new(0.9, 0, 0, 30)
    paragraph_text.TextSize = 13
    paragraph_text.TextXAlignment = Enum.TextXAlignment.Left
    paragraph_text.TextYAlignment = Enum.TextYAlignment.Top
    paragraph_text.TextWrapped = true
    paragraph_text.Parent = self.frame
    
    table.insert(self.elements, paragraph)
    return paragraph
end

function Module:CreateColorpicker(options)
    local colorpicker = {
        title = options.title or "Color",
        flag = options.flag or options.title,
        color = options.color or Color3.new(0.647, 0.169, 0.647),
        callback = options.callback or function() end
    }
    
    local yOffset = #self.elements * 50 + 100
    
    -- Colorpicker title
    local colorpicker_title = Instance.new("TextLabel")
    colorpicker_title.Name = "Colorpicker Title"
    colorpicker_title.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontStyle.Normal,
        Enum.FontWeight.SemiBold
    )
    colorpicker_title.TextColor3 = Color3.new(1, 1, 1)
    colorpicker_title.Text = colorpicker.title
    colorpicker_title.BackgroundTransparency = 1
    colorpicker_title.Position = UDim2.new(0.02, 0, 0, yOffset)
    colorpicker_title.Size = UDim2.new(0, 200, 0, 14)
    colorpicker_title.TextSize = 14
    colorpicker_title.TextXAlignment = Enum.TextXAlignment.Left
    colorpicker_title.Parent = self.frame
    
    -- Color preview
    local color_frame = Instance.new("Frame")
    color_frame.Name = "Color Frame"
    color_frame.BackgroundColor3 = colorpicker.color
    color_frame.Position = UDim2.new(0.8, 0, 0, yOffset + 15)
    color_frame.Size = UDim2.new(0, 35, 0, 35)
    color_frame.Parent = self.frame
    
    local color_corner = Instance.new("UICorner")
    color_corner.CornerRadius = UDim.new(0, 5)
    color_corner.Parent = color_frame
    
    local color_button = Instance.new("TextButton")
    color_button.Name = "Color Button"
    color_button.Text = ""
    color_button.BackgroundTransparency = 1
    color_button.Size = UDim2.new(1, 0, 1, 0)
    color_button.Parent = color_frame
    
    -- Simple color cycling for demo (in real implementation you'd want a proper color picker)
    local colors = {
        Color3.new(1, 0, 0), -- Red
        Color3.new(0, 1, 0), -- Green
        Color3.new(0, 0, 1), -- Blue
        Color3.new(1, 1, 0), -- Yellow
        Color3.new(1, 0, 1), -- Magenta
        Color3.new(0, 1, 1), -- Cyan
        Color3.new(0.647, 0.169, 0.647) -- Purple
    }
    
    local colorIndex = 7
    
    color_button.MouseButton1Click:Connect(function()
        colorIndex = colorIndex % #colors + 1
        colorpicker.color = colors[colorIndex]
        color_frame.BackgroundColor3 = colorpicker.color
        Library.flags[colorpicker.flag] = colorpicker.color
        colorpicker.callback(colorpicker.color)
    end)
    
    Library.flags[colorpicker.flag] = colorpicker.color
    table.insert(self.elements, colorpicker)
    return colorpicker
end

-- Load the UI
function Library:load()
    self.UI.Parent = PlayerGui
end

-- SendNotification function
function Library.SendNotification(options)
    local title = options.title or "Notification"
    local text = options.text or "This is a notification"
    local duration = options.duration or 3
    
    -- Create notification
    local notification = Instance.new("Frame")
    notification.Name = "Notification"
    notification.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
    notification.Position = UDim2.new(1, -250, 0, 50)
    notification.Size = UDim2.new(0, 240, 0, 80)
    notification.Parent = PlayerGui
    
    local notif_corner = Instance.new("UICorner")
    notif_corner.CornerRadius = UDim.new(0, 6)
    notif_corner.Parent = notification
    
    local notif_stroke = Instance.new("UIStroke")
    notif_stroke.Color = Color3.new(0.0667, 0.0667, 0.0824)
    notif_stroke.Parent = notification
    
    local notif_title = Instance.new("TextLabel")
    notif_title.Name = "Notification Title"
    notif_title.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontStyle.Normal,
        Enum.FontWeight.Bold
    )
    notif_title.TextColor3 = Color3.new(1, 1, 1)
    notif_title.Text = title
    notif_title.BackgroundTransparency = 1
    notif_title.Position = UDim2.new(0.05, 0, 0.1, 0)
    notif_title.Size = UDim2.new(0.9, 0, 0, 20)
    notif_title.TextSize = 16
    notif_title.TextXAlignment = Enum.TextXAlignment.Left
    notif_title.Parent = notification
    
    local notif_text = Instance.new("TextLabel")
    notif_text.Name = "Notification Text"
    notif_text.FontFace = Font.new(
        "rbxasset://fonts/families/SourceSansPro.json",
        Enum.FontStyle.Normal,
        Enum.FontWeight.SemiBold
    )
    notif_text.TextColor3 = Color3.new(0.7, 0.7, 0.7)
    notif_text.Text = text
    notif_text.BackgroundTransparency = 1
    notif_text.Position = UDim2.new(0.05, 0, 0.4, 0)
    notif_text.Size = UDim2.new(0.9, 0, 0, 30)
    notif_text.TextSize = 14
    notif_text.TextXAlignment = Enum.TextXAlignment.Left
    notif_text.TextWrapped = true
    notif_text.Parent = notification
    
    -- Slide in animation
    notification:TweenPosition(UDim2.new(1, -250, 0, 50), "Out", "Quad", 0.3, true)
    
    -- Auto dismiss
    wait(duration)
    
    -- Slide out animation
    notification:TweenPosition(UDim2.new(1, 0, 0, 50), "Out", "Quad", 0.3, true, function()
        notification:Destroy()
    end)
end

-- Destroy function
function Library:Destroy()
    if self.UI then
        self.UI:Destroy()
    end
end

return Library
