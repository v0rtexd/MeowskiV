-- Anerial UI Library v1.0
-- Created by v0rtexd & Lenny

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local Library = {}
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- UI State Management
local isMinimized = false
local dragToggle = nil
local dragSpeed = 0.25
local dragStart = nil
local startPos = nil

-- Create main UI structure
local function createMainUI()
    local main_UI = Instance.new("ScreenGui")
    main_UI.Name = "Main UI"
    main_UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    main_UI.Parent = playerGui

    local minimized_ui = Instance.new("ScreenGui")
    minimized_ui.Name = "Minimized ui"
    minimized_ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    minimized_ui.Parent = main_UI

    local cat_gif = Instance.new("ImageLabel")
    cat_gif.Name = "Cat gif"
    cat_gif.BackgroundColor3 = Color3.new(1, 1, 1)
    cat_gif.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    cat_gif.Position = UDim2.new(0.463, 0, 0.0355, 0)
    cat_gif.BorderColor3 = Color3.new()
    cat_gif.BorderSizePixel = 0
    cat_gif.Size = UDim2.new(0, 20, 0, 20)
    cat_gif.Parent = minimized_ui

    local minimized_ui_cro = Instance.new("Frame")
    minimized_ui_cro.Name = "Minimized ui cro"
    minimized_ui_cro.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
    minimized_ui_cro.Position = UDim2.new(0.459, 0, 0.0293, 0)
    minimized_ui_cro.BorderColor3 = Color3.new()
    minimized_ui_cro.BorderSizePixel = 0
    minimized_ui_cro.Size = UDim2.new(0, 120, 0, 31)
    minimized_ui_cro.Parent = minimized_ui

    local frame = Instance.new("Frame")
    frame.Name = "Frame"
    frame.BackgroundColor3 = Color3.new(0.176, 0.176, 0.224)
    frame.Position = UDim2.new(0.298, 0, 0.133, 0)
    frame.BorderColor3 = Color3.new()
    frame.BorderSizePixel = 0
    frame.Size = UDim2.new(0, 1, 0, 23)
    frame.Parent = minimized_ui_cro

    local uIStroke = Instance.new("UIStroke")
    uIStroke.Name = "UIStroke"
    uIStroke.Color = Color3.new(0.0667, 0.0667, 0.0824)
    uIStroke.Parent = minimized_ui_cro

    local uICorner = Instance.new("UICorner")
    uICorner.Name = "UICorner"
    uICorner.CornerRadius = UDim.new(0, 4)
    uICorner.Parent = minimized_ui_cro

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

    local unminize_button = Instance.new("TextButton")
    unminize_button.Name = "Unminize button"
    unminize_button.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
    unminize_button.TextColor3 = Color3.new()
    unminize_button.BorderColor3 = Color3.new()
    unminize_button.Text = ""
    unminize_button.BackgroundColor3 = Color3.new(1, 1, 1)
    unminize_button.BackgroundTransparency = 1
    unminize_button.Position = UDim2.new(-0.0687, 0, 0, 0)
    unminize_button.BorderSizePixel = 0
    unminize_button.TextSize = 14
    unminize_button.Size = UDim2.new(0, 128, 0, 27)
    unminize_button.Parent = minimized_ui_cro

    local main = Instance.new("Frame")
    main.Name = "main"
    main.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
    main.Position = UDim2.new(0.227, 0, 0.198, 0)
    main.BorderColor3 = Color3.new()
    main.BorderSizePixel = 0
    main.Size = UDim2.new(0, 813, 0, 494)
    main.Parent = main_UI

    -- Add UICorner to main frame
    local uICorner_main = Instance.new("UICorner")
    uICorner_main.Name = "UICorner"
    uICorner_main.Parent = main

    -- Add UIStroke to main frame
    local uIStroke_main = Instance.new("UIStroke")
    uIStroke_main.Name = "UIStroke"
    uIStroke_main.Color = Color3.new(0.0667, 0.0667, 0.0824)
    uIStroke_main.Parent = main

    -- Continue with the rest of your UI elements...
    local frame_2 = Instance.new("Frame")
    frame_2.Name = "Frame"
    frame_2.BackgroundColor3 = Color3.new(0.0902, 0.0902, 0.114)
    frame_2.Position = UDim2.new(0.309, 0, 0, 0)
    frame_2.BorderColor3 = Color3.new()
    frame_2.BorderSizePixel = 0
    frame_2.Size = UDim2.new(0, 1, 0, 494)
    frame_2.Parent = main

    local tabs_System = Instance.new("Frame")
    tabs_System.Name = "Tabs System"
    tabs_System.BackgroundColor3 = Color3.new(1, 1, 1)
    tabs_System.BackgroundTransparency = 1
    tabs_System.Position = UDim2.new(0.00971, 0, 0.131, 0)
    tabs_System.BorderColor3 = Color3.new()
    tabs_System.BorderSizePixel = 0
    tabs_System.Size = UDim2.new(0, 211, 0, 387)
    tabs_System.Parent = main

    local search_Bar = Instance.new("Frame")
    search_Bar.Name = "Search Bar"
    search_Bar.BackgroundColor3 = Color3.new(0.0353, 0.0353, 0.051)
    search_Bar.Position = UDim2.new(0.329, 0, 0.0483, 0)
    search_Bar.BorderColor3 = Color3.new()
    search_Bar.BorderSizePixel = 0
    search_Bar.Size = UDim2.new(0, 115, 0, 27)
    search_Bar.Parent = main

    local search_logo = Instance.new("ImageLabel")
    search_logo.Name = "Search logo"
    search_logo.ImageColor3 = Color3.new(0.455, 0.431, 0.863)
    search_logo.BackgroundColor3 = Color3.new(1, 1, 1)
    search_logo.Image = "rbxassetid://10734943674"
    search_logo.BackgroundTransparency = 1
    search_logo.Position = UDim2.new(0.78, 0, 0.24, 0)
    search_logo.BorderColor3 = Color3.new()
    search_logo.BorderSizePixel = 0
    search_logo.Size = UDim2.new(0, 13, 0, 13)
    search_logo.Parent = search_Bar

    local uIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
    uIAspectRatioConstraint_5.Name = "UIAspectRatioConstraint"
    uIAspectRatioConstraint_5.Parent = search_logo

    local uICorner_9 = Instance.new("UICorner")
    uICorner_9.Name = "UICorner"
    uICorner_9.CornerRadius = UDim.new(0, 9)
    uICorner_9.Parent = search_Bar

    local search_for_module = Instance.new("TextBox")
    search_for_module.Name = "Search for module"
    search_for_module.FontFace = Font.new(
        "rbxasset://fonts/families/SourceSansPro.json",
        Enum.FontStyle.Normal,
        Enum.FontWeight.SemiBold
    )
    search_for_module.TextDirection = Enum.TextDirection.LeftToRight
    search_for_module.TextColor3 = Color3.new(0.392, 0.392, 0.392)
    search_for_module.Text = ""
    search_for_module.PlaceholderText = "Search..."
    search_for_module.BackgroundTransparency = 1
    search_for_module.BackgroundColor3 = Color3.new(1, 1, 1)
    search_for_module.BorderSizePixel = 0
    search_for_module.BorderColor3 = Color3.new()
    search_for_module.TextSize = 14
    search_for_module.Size = UDim2.new(0, 90, 0, 24)
    search_for_module.Position = UDim2.new(0.05, 0, 0.11, 0)
    search_for_module.Parent = search_Bar

    local uIStroke_7 = Instance.new("UIStroke")
    uIStroke_7.Name = "UIStroke"
    uIStroke_7.Color = Color3.new(0.0667, 0.0667, 0.098)
    uIStroke_7.Parent = search_Bar

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

    local credits = Instance.new("TextLabel")
    credits.Name = "Credits"
    credits.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontStyle.Normal,
        Enum.FontWeight.SemiBold
    )
    credits.TextColor3 = Color3.new(0.42, 0.42, 0.424)
    credits.Text = "v0rtexd  & Lenny"
    credits.BackgroundColor3 = Color3.new(1, 1, 1)
    credits.BackgroundTransparency = 1
    credits.Position = UDim2.new(0.075, 0, 0.0951, 0)
    credits.BorderSizePixel = 0
    credits.BorderColor3 = Color3.new()
    credits.TextSize = 14
    credits.Size = UDim2.new(0, 108, 0, 18)
    credits.Parent = main

    local close_button = Instance.new("Frame")
    close_button.Name = "Close button"
    close_button.BackgroundColor3 = Color3.new(1, 1, 1)
    close_button.BackgroundTransparency = 1
    close_button.Position = UDim2.new(0.958, 0, 0.048, 0)
    close_button.BorderColor3 = Color3.new()
    close_button.BorderSizePixel = 0
    close_button.Size = UDim2.new(0, 18, 0, 20)
    close_button.Parent = main

    local imageLabel_2 = Instance.new("ImageLabel")
    imageLabel_2.Name = "ImageLabel"
    imageLabel_2.ImageColor3 = Color3.new(0.365, 0.365, 0.365)
    imageLabel_2.BorderColor3 = Color3.new()
    imageLabel_2.Image = "rbxassetid://10747384394"
    imageLabel_2.BackgroundTransparency = 1
    imageLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
    imageLabel_2.BorderSizePixel = 0
    imageLabel_2.Size = UDim2.new(0, 18, 0, 19)
    imageLabel_2.Parent = close_button

    local uIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
    uIAspectRatioConstraint_6.Name = "UIAspectRatioConstraint"
    uIAspectRatioConstraint_6.Parent = imageLabel_2

    local close_button_2 = Instance.new("TextButton")
    close_button_2.Name = "Close button"
    close_button_2.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
    close_button_2.TextColor3 = Color3.new()
    close_button_2.BorderColor3 = Color3.new()
    close_button_2.Text = ""
    close_button_2.BackgroundColor3 = Color3.new(1, 1, 1)
    close_button_2.BackgroundTransparency = 1
    close_button_2.Position = UDim2.new(0.0467, 0, 0.00666, 0)
    close_button_2.BorderSizePixel = 0
    close_button_2.TextSize = 14
    close_button_2.Size = UDim2.new(0, 21, 0, 17)
    close_button_2.Parent = close_button

    local frame_3 = Instance.new("Frame")
    frame_3.Name = "Frame"
    frame_3.BackgroundColor3 = Color3.new(0.0784, 0.0784, 0.0784)
    frame_3.Position = UDim2.new(0.311, 0, 0.133, 0)
    frame_3.BorderColor3 = Color3.new()
    frame_3.BorderSizePixel = 0
    frame_3.Size = UDim2.new(0, 560, 0, 1)
    frame_3.Parent = main

    local mimize_frame = Instance.new("Frame")
    mimize_frame.Name = "Mimize frame"
    mimize_frame.BackgroundColor3 = Color3.new(1, 1, 1)
    mimize_frame.BackgroundTransparency = 1
    mimize_frame.Position = UDim2.new(0.911, 0, 0.0486, 0)
    mimize_frame.BorderColor3 = Color3.new()
    mimize_frame.BorderSizePixel = 0
    mimize_frame.Size = UDim2.new(0, 15, 0, 15)
    mimize_frame.Parent = main

    local button_of_minimize = Instance.new("TextButton")
    button_of_minimize.Name = "Button of minimize"
    button_of_minimize.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
    button_of_minimize.TextColor3 = Color3.new()
    button_of_minimize.BorderColor3 = Color3.new()
    button_of_minimize.Text = ""
    button_of_minimize.BackgroundColor3 = Color3.new(1, 1, 1)
    button_of_minimize.BackgroundTransparency = 1
    button_of_minimize.Position = UDim2.new(0.367, 0, -0.0596, 0)
    button_of_minimize.BorderSizePixel = 0
    button_of_minimize.TextSize = 14
    button_of_minimize.Size = UDim2.new(0, 20, 0, 20)
    button_of_minimize.Parent = mimize_frame

    local minimize_icon = Instance.new("ImageLabel")
    minimize_icon.Name = "minimize icon"
    minimize_icon.ImageColor3 = Color3.new(0.365, 0.365, 0.365)
    minimize_icon.BackgroundColor3 = Color3.new(1, 1, 1)
    minimize_icon.Image = "rbxassetid://10734896206"
    minimize_icon.BackgroundTransparency = 1
    minimize_icon.Position = UDim2.new(0.367, 0, -0.0596, 0)
    minimize_icon.BorderColor3 = Color3.new()
    minimize_icon.BorderSizePixel = 0
    minimize_icon.Size = UDim2.new(0, 20, 0, 20)
    minimize_icon.Parent = mimize_frame

    local uIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")
    uIAspectRatioConstraint_7.Name = "UIAspectRatioConstraint"
    uIAspectRatioConstraint_7.Parent = minimize_icon

    -- Avatar preview section
    local avatar_preview = Instance.new("Frame")
    avatar_preview.Name = "Avatar preview"
    avatar_preview.BackgroundColor3 = Color3.new(0.0902, 0.0902, 0.114)
    avatar_preview.Position = UDim2.new(0.0394, 0, 0.891, 0)
    avatar_preview.BorderColor3 = Color3.new()
    avatar_preview.BorderSizePixel = 0
    avatar_preview.Size = UDim2.new(0, 190, 0, 1)
    avatar_preview.Parent = main

    local welcome_text = Instance.new("TextLabel")
    welcome_text.Name = "Welcome text"
    welcome_text.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontStyle.Normal,
        Enum.FontWeight.SemiBold
    )
    welcome_text.TextColor3 = Color3.new(1, 1, 1)
    welcome_text.Text = "Welcome " .. player.Name
    welcome_text.BackgroundColor3 = Color3.new(1, 1, 1)
    welcome_text.BackgroundTransparency = 1
    welcome_text.Position = UDim2.new(0.416, 0, 18, 0)
    welcome_text.BorderSizePixel = 0
    welcome_text.BorderColor3 = Color3.new()
    welcome_text.TextSize = 16
    welcome_text.Size = UDim2.new(0, 150, 0, 19)
    welcome_text.Parent = avatar_preview

    local player_skin = Instance.new("ImageLabel")
    player_skin.Name = "Player skin"
    player_skin.BorderColor3 = Color3.new()
    player_skin.BackgroundColor3 = Color3.new(1, 1, 1)
    player_skin.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"
    player_skin.BackgroundTransparency = 1
    player_skin.Position = UDim2.new(-0.0541, 0, 7.65, 0)
    player_skin.BorderSizePixel = 0
    player_skin.Size = UDim2.new(0, 40, 0, 40)
    player_skin.Parent = avatar_preview

    local uICorner_18 = Instance.new("UICorner")
    uICorner_18.Name = "UICorner"
    uICorner_18.CornerRadius = UDim.new(1, 10)
    uICorner_18.Parent = player_skin

    return main_UI, main, tabs_System, minimized_ui, unminize_button, close_button_2, button_of_minimize, search_for_module
end

-- Library functions
function Library:CreateWindow(title)
    local main_UI, main, tabs_System, minimized_ui, unminize_button, close_button, minimize_button, search_bar = createMainUI()
    
    -- Update title if provided
    if title then
        main.Logo.Text = title
        minimized_ui["Minimized ui cro"]["Anerial.cc"].Text = title
    end
    
    local WindowLib = {}
    WindowLib.Tabs = {}
    WindowLib.CurrentTab = nil
    WindowLib.TabCount = 0
    
    -- Window dragging functionality
    local function updateInput(input)
        local delta = input.Position - dragStart
        local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        TweenService:Create(main, TweenInfo.new(dragSpeed), {Position = position}):Play()
    end
    
    main.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragToggle = true
            dragStart = input.Position
            startPos = main.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    
    main.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragToggle then
            updateInput(input)
        end
    end)
    
    -- Close button functionality
    close_button.MouseButton1Click:Connect(function()
        main_UI:Destroy()
    end)
    
    -- Minimize/Maximize functionality
    minimize_button.MouseButton1Click:Connect(function()
        isMinimized = true
        TweenService:Create(main, TweenInfo.new(0.3), {Position = UDim2.new(0, -1000, 0, 0)}):Play()
        minimized_ui.Visible = true
    end)
    
    unminize_button.MouseButton1Click:Connect(function()
        isMinimized = false
        TweenService:Create(main, TweenInfo.new(0.3), {Position = UDim2.new(0.227, 0, 0.198, 0)}):Play()
        minimized_ui.Visible = false
    end)
    
    -- Search functionality
    search_bar.FocusLost:Connect(function()
        local searchText = search_bar.Text:lower()
        for _, tab in pairs(WindowLib.Tabs) do
            for _, element in pairs(tab.Elements) do
                if element.Frame and element.Name then
                    if searchText == "" or element.Name:lower():find(searchText) then
                        element.Frame.Visible = true
                    else
                        element.Frame.Visible = false
                    end
                end
            end
        end
    end)
    
    -- Tab creation function
    function WindowLib:CreateTab(name, icon)
        self.TabCount = self.TabCount + 1
        local tabIndex = self.TabCount
        
        local tab = {}
        tab.Elements = {}
        tab.ElementCount = 0
        
        -- Create tab button
        local tab_frame = Instance.new("Frame")
        tab_frame.Name = name .. " Tab"
        tab_frame.BackgroundColor3 = Color3.new(0.0392, 0.0392, 0.0588)
        tab_frame.BackgroundTransparency = 1
        tab_frame.Position = UDim2.new(0.0621, 0, 0.0256 + (tabIndex - 1) * 0.13, 0)
        tab_frame.BorderColor3 = Color3.new()
        tab_frame.BorderSizePixel = 0
        tab_frame.Size = UDim2.new(0, 162, 0, 34)
        tab_frame.Parent = tabs_System

        local tab_button = Instance.new("TextButton")
        tab_button.Name = "TabButton"
        tab_button.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
        tab_button.TextColor3 = Color3.new()
        tab_button.Text = ""
        tab_button.BackgroundTransparency = 1
        tab_button.BackgroundColor3 = Color3.new(1, 1, 1)
        tab_button.TextSize = 14
        tab_button.BorderColor3 = Color3.new()
        tab_button.BorderSizePixel = 0
        tab_button.Size = UDim2.new(0, 186, 0, 31)
        tab_button.Parent = tab_frame

        local tab_icon = Instance.new("ImageLabel")
        tab_icon.Name = "TabIcon"
        tab_icon.BorderColor3 = Color3.new()
        tab_icon.BackgroundColor3 = Color3.new(1, 1, 1)
        tab_icon.Image = icon or "rbxassetid://10747830374"
        tab_icon.BackgroundTransparency = 1
        tab_icon.Position = UDim2.new(0, 0, 0.104, 0)
        tab_icon.BorderSizePixel = 0
        tab_icon.Size = UDim2.new(0, 20, 0, 20)
        tab_icon.Parent = tab_frame

        local uIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
        uIAspectRatioConstraint.Parent = tab_icon

        local tab_name = Instance.new("TextLabel")
        tab_name.Name = "TabName"
        tab_name.FontFace = Font.new(
            "rbxasset://fonts/families/GothamSSm.json",
            Enum.FontStyle.Normal,
            Enum.FontWeight.SemiBold
        )
        tab_name.TextColor3 = Color3.new(1, 1, 1)
        tab_name.Text = name
        tab_name.BackgroundColor3 = Color3.new(1, 1, 1)
        tab_name.BackgroundTransparency = 1
        tab_name.Position = UDim2.new(0.196, 0, 0.0896, 0)
        tab_name.BorderSizePixel = 0
        tab_name.BorderColor3 = Color3.new()
        tab_name.TextSize = 16
        tab_name.Size = UDim2.new(0, 78, 0, 21)
        tab_name.Parent = tab_frame

        -- Create tab content frame
        local tab_content = Instance.new("ScrollingFrame")
        tab_content.Name = name .. " Content"
        tab_content.BackgroundColor3 = Color3.new(1, 1, 1)
        tab_content.BackgroundTransparency = 1
        tab_content.Position = UDim2.new(0.328, 0, 0.174, 0)
        tab_content.Size = UDim2.new(0, 560, 0, 350)
        tab_content.ScrollBarThickness = 3
        tab_content.ScrollBarImageColor3 = Color3.new(0.475, 0.451, 0.918)
        tab_content.CanvasSize = UDim2.new(0, 0, 0, 0)
        tab_content.Visible = false
        tab_content.Parent = main

        local content_layout = Instance.new("UIListLayout")
        content_layout.SortOrder = Enum.SortOrder.LayoutOrder
        content_layout.Padding = UDim.new(0, 10)
        content_layout.Parent = tab_content

        tab.Frame = tab_frame
        tab.Content = tab_content
        tab.Layout = content_layout

        -- Tab selection logic
        local function selectTab()
            -- Deselect all tabs
            for _, otherTab in pairs(self.Tabs) do
                otherTab.Frame.BackgroundTransparency = 1
                otherTab.Frame.TabIcon.ImageColor3 = Color3.new(1, 1, 1)
                otherTab.Frame.TabName.TextColor3 = Color3.new(1, 1, 1)
                otherTab.Content.Visible = false
                
                -- Remove stroke if exists
                local stroke = otherTab.Frame:FindFirstChild("UIStroke")
                if stroke then stroke:Destroy() end
                
                -- Remove corner if exists
                local corner = otherTab.Frame:FindFirstChild("UICorner")
                if corner then corner:Destroy() end
            end
            
            -- Select this tab
            tab_frame.BackgroundTransparency = 0
            tab_frame.BackgroundColor3 = Color3.new(0.0392, 0.0392, 0.0588)
            tab_icon.ImageColor3 = Color3.new(0.435, 0.416, 0.831)
            tab_name.TextColor3 = Color3.new(0.475, 0.451, 0.902)
            tab_content.Visible = true
            
            -- Add stroke
            local uIStroke = Instance.new("UIStroke")
            uIStroke.Thickness = 1.2
            uIStroke.Color = Color3.new(0.0667, 0.0667, 0.098)
            uIStroke.Parent = tab_frame
            
            -- Add corner
            local uICorner = Instance.new("UICorner")
            uICorner.CornerRadius = UDim.new(0, 9)
            uICorner.Parent = tab_frame
            
            self.CurrentTab = tab
        end

        tab_button.MouseButton1Click:Connect(selectTab)

        -- Select first tab by default
        if tabIndex == 1 then
            selectTab()
        end

        -- Toggle creation function
        function tab:CreateToggle(name, description, default, callback)
            self.ElementCount = self.ElementCount + 1
            local elementPos = (self.ElementCount - 1) * 80
            
            callback = callback or function() end
            local toggled = default or false
            
            local toggle_frame = Instance.new("Frame")
            toggle_frame.Name = name .. " Toggle"
            toggle_frame.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
            toggle_frame.Position = UDim2.new(0, 0, 0, elementPos)
            toggle_frame.Size = UDim2.new(1, -10, 0, 70)
            toggle_frame.Parent = self.Content

            local uIStroke = Instance.new("UIStroke")
            uIStroke.Color = Color3.new(0.0902, 0.0902, 0.114)
            uIStroke.Parent = toggle_frame

            local uICorner = Instance.new("UICorner")
            uICorner.Parent = toggle_frame

            local toggle_name = Instance.new("TextLabel")
            toggle_name.Name = "ToggleName"
            toggle_name.FontFace = Font.new(
                "rbxasset://fonts/families/GothamSSm.json",
                Enum.FontStyle.Normal,
                Enum.FontWeight.SemiBold
            )
            toggle_name.TextColor3 = Color3.new(1, 1, 1)
            toggle_name.Text = name
            toggle_name.BackgroundTransparency = 1
            toggle_name.Position = UDim2.new(0.05, 0, 0.1, 0)
            toggle_name.TextSize = 15
            toggle_name.Size = UDim2.new(0, 200, 0, 21)
            toggle_name.TextXAlignment = Enum.TextXAlignment.Left
            toggle_name.Parent = toggle_frame

            local toggle_desc = Instance.new("TextLabel")
            toggle_desc.Name = "ToggleDesc"
            toggle_desc.FontFace = Font.new(
                "rbxasset://fonts/families/SourceSansPro.json",
                Enum.FontStyle.Normal,
                Enum.FontWeight.SemiBold
            )
            toggle_desc.TextColor3 = Color3.new(0.42, 0.42, 0.424)
            toggle_desc.Text = description or "No description"
            toggle_desc.BackgroundTransparency = 1
            toggle_desc.Position = UDim2.new(0.05, 0, 0.45, 0)
            toggle_desc.TextSize = 13
            toggle_desc.Size = UDim2.new(0, 200, 0, 17)
            toggle_desc.TextXAlignment = Enum.TextXAlignment.Left
            toggle_desc.Parent = toggle_frame

            local toggle_button_frame = Instance.new("Frame")
            toggle_button_frame.Name = "ToggleButton"
            toggle_button_frame.BackgroundColor3 = toggled and Color3.new(0.475, 0.451, 0.918) or Color3.new(0.0902, 0.0863, 0.125)
            toggle_button_frame.Position = UDim2.new(0.85, 0, 0.3, 0)
            toggle_button_frame.Size = UDim2.new(0, 36, 0, 20)
            toggle_button_frame.Parent = toggle_frame

            local toggle_corner = Instance.new("UICorner")
            toggle_corner.CornerRadius = UDim.new(0, 9)
            toggle_corner.Parent = toggle_button_frame

            local toggle_switcher = Instance.new("Frame")
            toggle_switcher.Name = "Switcher"
            toggle_switcher.BackgroundColor3 = Color3.new(1, 1, 1)
            toggle_switcher.Position = toggled and UDim2.new(0.5, 0, 0.25, 0) or UDim2.new(0.167, 0, 0.25, 0)
            toggle_switcher.Size = UDim2.new(0, 11, 0, 10)
            toggle_switcher.Parent = toggle_button_frame

            local switcher_corner = Instance.new("UICorner")
            switcher_corner.Parent = toggle_switcher

            local toggle_input = Instance.new("TextButton")
            toggle_input.Name = "ToggleInput"
            toggle_input.BackgroundTransparency = 1
            toggle_input.Text = ""
            toggle_input.Size = UDim2.new(1, 0, 1, 0)
            toggle_input.Parent = toggle_button_frame

            local function updateToggle()
                toggled = not toggled
                
                local button_tween = TweenService:Create(toggle_button_frame, TweenInfo.new(0.2), {
                    BackgroundColor3 = toggled and Color3.new(0.475, 0.451, 0.918) or Color3.new(0.0902, 0.0863, 0.125)
                })
                
                local switcher_tween = TweenService:Create(toggle_switcher, TweenInfo.new(0.2), {
                    Position = toggled and UDim2.new(0.5, 0, 0.25, 0) or UDim2.new(0.167, 0, 0.25, 0)
                })
                
                button_tween:Play()
                switcher_tween:Play()
                
                callback(toggled)
            end

            toggle_input.MouseButton1Click:Connect(updateToggle)

            -- Update canvas size
            self.Content.CanvasSize = UDim2.new(0, 0, 0, self.ElementCount * 80)
            
            local element = {
                Frame = toggle_frame,
                Name = name,
                Type = "Toggle",
                Value = toggled,
                SetValue = function(value) 
                    if value ~= toggled then updateToggle() end 
                end
            }
            
            table.insert(self.Elements, element)
            return element
        end

        -- Slider creation function
        function tab:CreateSlider(name, description, min, max, default, callback)
            self.ElementCount = self.ElementCount + 1
            local elementPos = (self.ElementCount - 1) * 80
            
            callback = callback or function() end
            min = min or 0
            max = max or 100
            default = default or min
            local value = default
            
            local slider_frame = Instance.new("Frame")
            slider_frame.Name = name .. " Slider"
            slider_frame.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
            slider_frame.Position = UDim2.new(0, 0, 0, elementPos)
            slider_frame.Size = UDim2.new(1, -10, 0, 70)
            slider_frame.Parent = self.Content

            local uIStroke = Instance.new("UIStroke")
            uIStroke.Color = Color3.new(0.0902, 0.0902, 0.114)
            uIStroke.Parent = slider_frame

            local uICorner = Instance.new("UICorner")
            uICorner.Parent = slider_frame

            local slider_name = Instance.new("TextLabel")
            slider_name.Name = "SliderName"
            slider_name.FontFace = Font.new(
                "rbxasset://fonts/families/GothamSSm.json",
                Enum.FontStyle.Normal,
                Enum.FontWeight.SemiBold
            )
            slider_name.TextColor3 = Color3.new(1, 1, 1)
            slider_name.Text = name
            slider_name.BackgroundTransparency = 1
            slider_name.Position = UDim2.new(0.05, 0, 0.1, 0)
            slider_name.TextSize = 15
            slider_name.Size = UDim2.new(0, 200, 0, 21)
            slider_name.TextXAlignment = Enum.TextXAlignment.Left
            slider_name.Parent = slider_frame

            local slider_desc = Instance.new("TextLabel")
            slider_desc.Name = "SliderDesc"
            slider_desc.FontFace = Font.new(
                "rbxasset://fonts/families/SourceSansPro.json",
                Enum.FontStyle.Normal,
                Enum.FontWeight.SemiBold
            )
            slider_desc.TextColor3 = Color3.new(0.42, 0.42, 0.424)
            slider_desc.Text = description or "No description"
            slider_desc.BackgroundTransparency = 1
            slider_desc.Position = UDim2.new(0.05, 0, 0.45, 0)
            slider_desc.TextSize = 13
            slider_desc.Size = UDim2.new(0, 200, 0, 17)
            slider_desc.TextXAlignment = Enum.TextXAlignment.Left
            slider_desc.Parent = slider_frame

            local slider_value = Instance.new("TextLabel")
            slider_value.Name = "SliderValue"
            slider_value.FontFace = Font.new(
                "rbxasset://fonts/families/GothamSSm.json",
                Enum.FontStyle.Normal,
                Enum.FontWeight.SemiBold
            )
            slider_value.TextColor3 = Color3.new(1, 1, 1)
            slider_value.Text = tostring(value)
            slider_value.BackgroundTransparency = 1
            slider_value.Position = UDim2.new(0.8, 0, 0.1, 0)
            slider_value.TextSize = 14
            slider_value.Size = UDim2.new(0, 65, 0, 28)
            slider_value.Parent = slider_frame

            local slider_back = Instance.new("Frame")
            slider_back.Name = "SliderBack"
            slider_back.BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)
            slider_back.Position = UDim2.new(0.05, 0, 0.7, 0)
            slider_back.Size = UDim2.new(0.7, 0, 0, 7)
            slider_back.Parent = slider_frame

            local slider_back_corner = Instance.new("UICorner")
            slider_back_corner.CornerRadius = UDim.new(0, 3)
            slider_back_corner.Parent = slider_back

            local slider_fill = Instance.new("Frame")
            slider_fill.Name = "SliderFill"
            slider_fill.BackgroundColor3 = Color3.new(0.475, 0.451, 0.918)
            slider_fill.Position = UDim2.new(0, 0, 0, 0)
            slider_fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
            slider_fill.Parent = slider_back

            local slider_fill_corner = Instance.new("UICorner")
            slider_fill_corner.CornerRadius = UDim.new(0, 3)
            slider_fill_corner.Parent = slider_fill

            local slider_button = Instance.new("Frame")
            slider_button.Name = "SliderButton"
            slider_button.BackgroundColor3 = Color3.new(1, 1, 1)
            slider_button.Position = UDim2.new((value - min) / (max - min), -5, -0.5, 0)
            slider_button.Size = UDim2.new(0, 11, 0, 11)
            slider_button.Parent = slider_back

            local slider_button_corner = Instance.new("UICorner")
            slider_button_corner.CornerRadius = UDim.new(0, 3)
            slider_button_corner.Parent = slider_button

            local slider_input = Instance.new("TextButton")
            slider_input.Name = "SliderInput"
            slider_input.BackgroundTransparency = 1
            slider_input.Text = ""
            slider_input.Size = UDim2.new(1, 10, 1, 10)
            slider_input.Position = UDim2.new(0, -5, 0, -5)
            slider_input.Parent = slider_back

            local dragging = false
            
            local function updateSlider(input)
                local pos = math.clamp((input.Position.X - slider_back.AbsolutePosition.X) / slider_back.AbsoluteSize.X, 0, 1)
                value = math.floor(min + (max - min) * pos)
                
                slider_value.Text = tostring(value)
                slider_fill.Size = UDim2.new(pos, 0, 1, 0)
                slider_button.Position = UDim2.new(pos, -5, -0.5, 0)
                
                callback(value)
            end

            slider_input.MouseButton1Down:Connect(function()
                dragging = true
            end)

            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    updateSlider(input)
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)

            -- Update canvas size
            self.Content.CanvasSize = UDim2.new(0, 0, 0, self.ElementCount * 80)
            
            local element = {
                Frame = slider_frame,
                Name = name,
                Type = "Slider",
                Value = value,
                SetValue = function(newValue)
                    value = math.clamp(newValue, min, max)
                    local pos = (value - min) / (max - min)
                    slider_value.Text = tostring(value)
                    slider_fill.Size = UDim2.new(pos, 0, 1, 0)
                    slider_button.Position = UDim2.new(pos, -5, -0.5, 0)
                    callback(value)
                end
            }
            
            table.insert(self.Elements, element)
            return element
        end

        -- Dropdown creation function
        function tab:CreateDropdown(name, description, options, default, callback)
            self.ElementCount = self.ElementCount + 1
            local elementPos = (self.ElementCount - 1) * 80
            
            callback = callback or function() end
            options = options or {}
            default = default or (options[1] or "None")
            local selected = default
            local isOpen = false
            
            local dropdown_frame = Instance.new("Frame")
            dropdown_frame.Name = name .. " Dropdown"
            dropdown_frame.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
            dropdown_frame.Position = UDim2.new(0, 0, 0, elementPos)
            dropdown_frame.Size = UDim2.new(1, -10, 0, 70)
            dropdown_frame.Parent = self.Content

            local uIStroke = Instance.new("UIStroke")
            uIStroke.Color = Color3.new(0.0902, 0.0902, 0.114)
            uIStroke.Parent = dropdown_frame

            local uICorner = Instance.new("UICorner")
            uICorner.Parent = dropdown_frame

            local dropdown_name = Instance.new("TextLabel")
            dropdown_name.Name = "DropdownName"
            dropdown_name.FontFace = Font.new(
                "rbxasset://fonts/families/GothamSSm.json",
                Enum.FontStyle.Normal,
                Enum.FontWeight.SemiBold
            )
            dropdown_name.TextColor3 = Color3.new(1, 1, 1)
            dropdown_name.Text = name
            dropdown_name.BackgroundTransparency = 1
            dropdown_name.Position = UDim2.new(0.05, 0, 0.1, 0)
            dropdown_name.TextSize = 15
            dropdown_name.Size = UDim2.new(0, 200, 0, 21)
            dropdown_name.TextXAlignment = Enum.TextXAlignment.Left
            dropdown_name.Parent = dropdown_frame

            local dropdown_desc = Instance.new("TextLabel")
            dropdown_desc.Name = "DropdownDesc"
            dropdown_desc.FontFace = Font.new(
                "rbxasset://fonts/families/SourceSansPro.json",
                Enum.FontStyle.Normal,
                Enum.FontWeight.SemiBold
            )
            dropdown_desc.TextColor3 = Color3.new(0.42, 0.42, 0.424)
            dropdown_desc.Text = description or "No description"
            dropdown_desc.BackgroundTransparency = 1
            dropdown_desc.Position = UDim2.new(0.05, 0, 0.45, 0)
            dropdown_desc.TextSize = 13
            dropdown_desc.Size = UDim2.new(0, 200, 0, 17)
            dropdown_desc.TextXAlignment = Enum.TextXAlignment.Left
            dropdown_desc.Parent = dropdown_frame

            local dropdown_main = Instance.new("Frame")
            dropdown_main.Name = "DropdownMain"
            dropdown_main.BackgroundColor3 = Color3.new(0.0627, 0.0588, 0.0863)
            dropdown_main.Position = UDim2.new(0.65, 0, 0.3, 0)
            dropdown_main.Size = UDim2.new(0, 120, 0, 29)
            dropdown_main.Parent = dropdown_frame

            local dropdown_main_corner = Instance.new("UICorner")
            dropdown_main_corner.CornerRadius = UDim.new(0, 4)
            dropdown_main_corner.Parent = dropdown_main

            local dropdown_main_stroke = Instance.new("UIStroke")
            dropdown_main_stroke.Color = Color3.new(0.0863, 0.0863, 0.0863)
            dropdown_main_stroke.Parent = dropdown_main

            local dropdown_label = Instance.new("TextLabel")
            dropdown_label.Name = "DropdownLabel"
            dropdown_label.FontFace = Font.new(
                "rbxasset://fonts/families/GothamSSm.json",
                Enum.FontStyle.Normal,
                Enum.FontWeight.SemiBold
            )
            dropdown_label.TextColor3 = Color3.new(0.8, 0.8, 0.8)
            dropdown_label.Text = selected
            dropdown_label.BackgroundTransparency = 1
            dropdown_label.Position = UDim2.new(0.08, 0, 0.1, 0)
            dropdown_label.TextSize = 12
            dropdown_label.Size = UDim2.new(0.8, 0, 0.8, 0)
            dropdown_label.TextXAlignment = Enum.TextXAlignment.Left
            dropdown_label.Parent = dropdown_main

            local dropdown_arrow = Instance.new("ImageLabel")
            dropdown_arrow.Name = "DropdownArrow"
            dropdown_arrow.BackgroundTransparency = 1
            dropdown_arrow.Image = "rbxassetid://10709790948"
            dropdown_arrow.Position = UDim2.new(0.85, 0, 0.24, 0)
            dropdown_arrow.Size = UDim2.new(0, 15, 0, 15)
            dropdown_arrow.Parent = dropdown_main

            local dropdown_button = Instance.new("TextButton")
            dropdown_button.Name = "DropdownButton"
            dropdown_button.BackgroundTransparency = 1
            dropdown_button.Text = ""
            dropdown_button.Size = UDim2.new(1, 0, 1, 0)
            dropdown_button.Parent = dropdown_main

            local dropdown_list = Instance.new("Frame")
            dropdown_list.Name = "DropdownList"
            dropdown_list.BackgroundColor3 = Color3.new(0.0627, 0.0588, 0.0863)
            dropdown_list.Position = UDim2.new(0, 0, 1.1, 0)
            dropdown_list.Size = UDim2.new(1, 0, 0, #options * 25)
            dropdown_list.Visible = false
            dropdown_list.Parent = dropdown_main

            local dropdown_list_corner = Instance.new("UICorner")
            dropdown_list_corner.CornerRadius = UDim.new(0, 4)
            dropdown_list_corner.Parent = dropdown_list

            local dropdown_list_stroke = Instance.new("UIStroke")
            dropdown_list_stroke.Color = Color3.new(0.0863, 0.0863, 0.0863)
            dropdown_list_stroke.Parent = dropdown_list

            local list_layout = Instance.new("UIListLayout")
            list_layout.SortOrder = Enum.SortOrder.LayoutOrder
            list_layout.Parent = dropdown_list

            for i, option in ipairs(options) do
                local option_button = Instance.new("TextButton")
                option_button.Name = "Option" .. i
                option_button.BackgroundTransparency = 1
                option_button.Size = UDim2.new(1, 0, 0, 25)
                option_button.Text = ""
                option_button.Parent = dropdown_list

                local option_label = Instance.new("TextLabel")
                option_label.Name = "OptionLabel"
                option_label.FontFace = Font.new(
                    "rbxasset://fonts/families/GothamSSm.json",
                    Enum.FontStyle.Normal,
                    Enum.FontWeight.SemiBold
                )
                option_label.TextColor3 = Color3.new(0.498, 0.498, 0.498)
                option_label.Text = option
                option_label.BackgroundTransparency = 1
                option_label.Size = UDim2.new(1, 0, 1, 0)
                option_label.TextSize = 12
                option_label.TextXAlignment = Enum.TextXAlignment.Left
                option_label.TextXAlignment = Enum.TextXAlignment.Center
                option_label.Parent = option_button

                option_button.MouseButton1Click:Connect(function()
                    selected = option
                    dropdown_label.Text = selected
                    isOpen = false
                    dropdown_list.Visible = false
                    dropdown_arrow.Image = "rbxassetid://10709790948"
                    callback(selected)
                end)
            end

            dropdown_button.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                dropdown_list.Visible = isOpen
                dropdown_arrow.Image = isOpen and "rbxassetid://10709791523" or "rbxassetid://10709790948"
            end)

            -- Update canvas size
            self.Content.CanvasSize = UDim2.new(0, 0, 0, self.ElementCount * 80)
            
            local element = {
                Frame = dropdown_frame,
                Name = name,
                Type = "Dropdown",
                Value = selected,
                SetValue = function(newValue)
                    if table.find(options, newValue) then
                        selected = newValue
                        dropdown_label.Text = selected
                        callback(selected)
                    end
                end
            }
            
            table.insert(self.Elements, element)
            return element
        end

        -- Color Picker creation function
        function tab:CreateColorPicker(name, description, default, callback)
            self.ElementCount = self.ElementCount + 1
            local elementPos = (self.ElementCount - 1) * 80
            
            callback = callback or function() end
            default = default or Color3.new(1, 0, 1)
            local color = default
            
            local colorpicker_frame = Instance.new("Frame")
            colorpicker_frame.Name = name .. " ColorPicker"
            colorpicker_frame.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
            colorpicker_frame.Position = UDim2.new(0, 0, 0, elementPos)
            colorpicker_frame.Size = UDim2.new(1, -10, 0, 70)
            colorpicker_frame.Parent = self.Content

            local uIStroke = Instance.new("UIStroke")
            uIStroke.Color = Color3.new(0.0902, 0.0902, 0.114)
            uIStroke.Parent = colorpicker_frame

            local uICorner = Instance.new("UICorner")
            uICorner.Parent = colorpicker_frame

            local colorpicker_name = Instance.new("TextLabel")
            colorpicker_name.Name = "ColorPickerName"
            colorpicker_name.FontFace = Font.new(
                "rbxasset://fonts/families/GothamSSm.json",
                Enum.FontStyle.Normal,
                Enum.FontWeight.SemiBold
            )
            colorpicker_name.TextColor3 = Color3.new(1, 1, 1)
            colorpicker_name.Text = name
            colorpicker_name.BackgroundTransparency = 1
            colorpicker_name.Position = UDim2.new(0.05, 0, 0.1, 0)
            colorpicker_name.TextSize = 15
            colorpicker_name.Size = UDim2.new(0, 200, 0, 21)
            colorpicker_name.TextXAlignment = Enum.TextXAlignment.Left
            colorpicker_name.Parent = colorpicker_frame

            local colorpicker_desc = Instance.new("TextLabel")
            colorpicker_desc.Name = "ColorPickerDesc"
            colorpicker_desc.FontFace = Font.new(
                "rbxasset://fonts/families/SourceSansPro.json",
                Enum.FontStyle.Normal,
                Enum.FontWeight.SemiBold
            )
            colorpicker_desc.TextColor3 = Color3.new(0.42, 0.42, 0.424)
            colorpicker_desc.Text = description or "No description"
            colorpicker_desc.BackgroundTransparency = 1
            colorpicker_desc.Position = UDim2.new(0.05, 0, 0.45, 0)
            colorpicker_desc.TextSize = 13
            colorpicker_desc.Size = UDim2.new(0, 200, 0, 17)
            colorpicker_desc.TextXAlignment = Enum.TextXAlignment.Left
            colorpicker_desc.Parent = colorpicker_frame

            local color_preview = Instance.new("Frame")
            color_preview.Name = "ColorPreview"
            color_preview.BackgroundColor3 = color
            color_preview.Position = UDim2.new(0.85, 0, 0.25, 0)
            color_preview.Size = UDim2.new(0, 35, 0, 35)
            color_preview.Parent = colorpicker_frame

            local color_corner = Instance.new("UICorner")
            color_corner.CornerRadius = UDim.new(0, 5)
            color_corner.Parent = color_preview

            local color_button = Instance.new("TextButton")
            color_button.Name = "ColorButton"
            color_button.BackgroundTransparency = 1
            color_button.Text = ""
            color_button.Size = UDim2.new(1, 0, 1, 0)
            color_button.Parent = color_preview

            color_button.MouseButton1Click:Connect(function()
                -- Simple color cycling for demo (in a real implementation, you'd want a proper color picker)
                local colors = {
                    Color3.new(1, 0, 0),    -- Red
                    Color3.new(0, 1, 0),    -- Green  
                    Color3.new(0, 0, 1),    -- Blue
                    Color3.new(1, 1, 0),    -- Yellow
                    Color3.new(1, 0, 1),    -- Magenta
                    Color3.new(0, 1, 1),    -- Cyan
                    Color3.new(1, 1, 1),    -- White
                    Color3.new(0.5, 0.5, 0.5) -- Gray
                }
                
                local currentIndex = 1
                for i, c in ipairs(colors) do
                    if color == c then
                        currentIndex = i
                        break
                    end
                end
                
                currentIndex = currentIndex % #colors + 1
                color = colors[currentIndex]
                color_preview.BackgroundColor3 = color
                callback(color)
            end)

            -- Update canvas size
            self.Content.CanvasSize = UDim2.new(0, 0, 0, self.ElementCount * 80)
            
            local element = {
                Frame = colorpicker_frame,
                Name = name,
                Type = "ColorPicker",
                Value = color,
                SetValue = function(newColor)
                    color = newColor
                    color_preview.BackgroundColor3 = color
                    callback(color)
                end
            }
            
            table.insert(self.Elements, element)
            return element
        end

        self.Tabs[name] = tab
        return tab
    end
    
    -- Window utility functions
    function WindowLib:Destroy()
        main_UI:Destroy()
    end
    
    function WindowLib:SetVisible(visible)
        main_UI.Enabled = visible
    end
    
    function WindowLib:Minimize()
        if not isMinimized then
            minimize_button.MouseButton1Click:Fire()
        end
    end
    
    function WindowLib:Maximize()
        if isMinimized then
            unminize_button.MouseButton1Click:Fire()
        end
    end
    
    return WindowLib
end

return Library
