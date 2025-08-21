-- Anerial UI Library v1.0
-- Created by v0rtexd & Lenny

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local Library = {}
Library.__index = Library

-- Utility Functions
local function createTween(object, info, properties)
    return TweenService:Create(object, info, properties)
end

local function getPlayerHeadshot()
    local userId = player.UserId
    return "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
end

-- Main Library Constructor
function Library:CreateWindow(title, description)
    local window = {}
    window.tabs = {}
    window.currentTab = nil
    
    -- Create main UI
    local main_UI = Instance.new("ScreenGui")
    main_UI.Name = "Anerial_UI"
    main_UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    main_UI.Parent = playerGui
    
    -- Create minimized UI
    local minimized_ui = Instance.new("ScreenGui")
    minimized_ui.Name = "Minimized_UI"
    minimized_ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    minimized_ui.Parent = main_UI
    minimized_ui.Enabled = false
    
    -- Minimized UI Components
    local minimized_frame = Instance.new("Frame")
    minimized_frame.Name = "MinimizedFrame"
    minimized_frame.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
    minimized_frame.Position = UDim2.new(0.459, 0, 0.0293, 0)
    minimized_frame.Size = UDim2.new(0, 120, 0, 31)
    minimized_frame.Parent = minimized_ui
    
    local minimized_corner = Instance.new("UICorner")
    minimized_corner.CornerRadius = UDim.new(0, 4)
    minimized_corner.Parent = minimized_frame
    
    local minimized_stroke = Instance.new("UIStroke")
    minimized_stroke.Color = Color3.new(0.0667, 0.0667, 0.0824)
    minimized_stroke.Parent = minimized_frame
    
    local minimized_logo = Instance.new("TextLabel")
    minimized_logo.Name = "Logo"
    minimized_logo.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    minimized_logo.TextColor3 = Color3.new(1, 1, 1)
    minimized_logo.Text = title or "Anerial.cc"
    minimized_logo.BackgroundTransparency = 1
    minimized_logo.Position = UDim2.new(0.1, 0, 0.133, 0)
    minimized_logo.Size = UDim2.new(0, 69, 0, 21)
    minimized_logo.TextSize = 13
    minimized_logo.Parent = minimized_frame
    
    local unminimize_button = Instance.new("TextButton")
    unminimize_button.Name = "UnminimizeButton"
    unminimize_button.Text = ""
    unminimize_button.BackgroundTransparency = 1
    unminimize_button.Size = UDim2.new(1, 0, 1, 0)
    unminimize_button.Parent = minimized_frame
    
    -- Main window
    local main = Instance.new("Frame")
    main.Name = "MainWindow"
    main.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
    main.Position = UDim2.new(0.227, 0, 0.198, 0)
    main.Size = UDim2.new(0, 813, 0, 494)
    main.Parent = main_UI
    
    local main_corner = Instance.new("UICorner")
    main_corner.Parent = main
    
    local main_stroke = Instance.new("UIStroke")
    main_stroke.Color = Color3.new(0.0667, 0.0667, 0.0824)
    main_stroke.Parent = main
    
    -- Title
    local logo = Instance.new("TextLabel")
    logo.Name = "Logo"
    logo.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.Bold)
    logo.TextColor3 = Color3.new(1, 1, 1)
    logo.Text = title or "Anerial.cc"
    logo.BackgroundTransparency = 1
    logo.Position = UDim2.new(0.0382, 0, 0.0105, 0)
    logo.Size = UDim2.new(0, 170, 0, 45)
    logo.TextSize = 33
    logo.Parent = main
    
    -- Credits
    local credits = Instance.new("TextLabel")
    credits.Name = "Credits"
    credits.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    credits.TextColor3 = Color3.new(0.42, 0.42, 0.424)
    credits.Text = "v0rtexd & Lenny"
    credits.BackgroundTransparency = 1
    credits.Position = UDim2.new(0.075, 0, 0.0951, 0)
    credits.Size = UDim2.new(0, 108, 0, 18)
    credits.TextSize = 14
    credits.Parent = main
    
    -- Close button
    local close_frame = Instance.new("Frame")
    close_frame.Name = "CloseFrame"
    close_frame.BackgroundTransparency = 1
    close_frame.Position = UDim2.new(0.958, 0, 0.048, 0)
    close_frame.Size = UDim2.new(0, 18, 0, 20)
    close_frame.Parent = main
    
    local close_button = Instance.new("TextButton")
    close_button.Name = "CloseButton"
    close_button.Text = ""
    close_button.BackgroundTransparency = 1
    close_button.Size = UDim2.new(1, 0, 1, 0)
    close_button.Parent = close_frame
    
    local close_icon = Instance.new("ImageLabel")
    close_icon.Name = "CloseIcon"
    close_icon.ImageColor3 = Color3.new(0.365, 0.365, 0.365)
    close_icon.Image = "rbxassetid://10747384394"
    close_icon.BackgroundTransparency = 1
    close_icon.Size = UDim2.new(1, 0, 1, 0)
    close_icon.Parent = close_frame
    
    -- Minimize button
    local minimize_frame = Instance.new("Frame")
    minimize_frame.Name = "MinimizeFrame"
    minimize_frame.BackgroundTransparency = 1
    minimize_frame.Position = UDim2.new(0.911, 0, 0.0486, 0)
    minimize_frame.Size = UDim2.new(0, 15, 0, 15)
    minimize_frame.Parent = main
    
    local minimize_button = Instance.new("TextButton")
    minimize_button.Name = "MinimizeButton"
    minimize_button.Text = ""
    minimize_button.BackgroundTransparency = 1
    minimize_button.Size = UDim2.new(1, 0, 1, 0)
    minimize_button.Parent = minimize_frame
    
    local minimize_icon = Instance.new("ImageLabel")
    minimize_icon.Name = "MinimizeIcon"
    minimize_icon.ImageColor3 = Color3.new(0.365, 0.365, 0.365)
    minimize_icon.Image = "rbxassetid://10734896206"
    minimize_icon.BackgroundTransparency = 1
    minimize_icon.Size = UDim2.new(1, 0, 1, 0)
    minimize_icon.Parent = minimize_frame
    
    -- Search bar
    local search_bar = Instance.new("Frame")
    search_bar.Name = "SearchBar"
    search_bar.BackgroundColor3 = Color3.new(0.0353, 0.0353, 0.051)
    search_bar.Position = UDim2.new(0.329, 0, 0.0483, 0)
    search_bar.Size = UDim2.new(0, 115, 0, 27)
    search_bar.Parent = main
    
    local search_corner = Instance.new("UICorner")
    search_corner.CornerRadius = UDim.new(0, 9)
    search_corner.Parent = search_bar
    
    local search_stroke = Instance.new("UIStroke")
    search_stroke.Color = Color3.new(0.0667, 0.0667, 0.098)
    search_stroke.Parent = search_bar
    
    local search_textbox = Instance.new("TextBox")
    search_textbox.Name = "SearchTextBox"
    search_textbox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    search_textbox.TextColor3 = Color3.new(0.392, 0.392, 0.392)
    search_textbox.Text = "Search..."
    search_textbox.BackgroundTransparency = 1
    search_textbox.Position = UDim2.new(0.05, 0, 0, 0)
    search_textbox.Size = UDim2.new(0.75, 0, 1, 0)
    search_textbox.TextSize = 14
    search_textbox.Parent = search_bar
    
    local search_icon = Instance.new("ImageLabel")
    search_icon.Name = "SearchIcon"
    search_icon.ImageColor3 = Color3.new(0.455, 0.431, 0.863)
    search_icon.Image = "rbxassetid://10734943674"
    search_icon.BackgroundTransparency = 1
    search_icon.Position = UDim2.new(0.78, 0, 0.24, 0)
    search_icon.Size = UDim2.new(0, 13, 0, 13)
    search_icon.Parent = search_bar
    
    -- Divider
    local divider = Instance.new("Frame")
    divider.Name = "Divider"
    divider.BackgroundColor3 = Color3.new(0.0784, 0.0784, 0.0784)
    divider.Position = UDim2.new(0.311, 0, 0.133, 0)
    divider.Size = UDim2.new(0, 560, 0, 1)
    divider.BorderSizePixel = 0
    divider.Parent = main
    
    local vertical_divider = Instance.new("Frame")
    vertical_divider.Name = "VerticalDivider"
    vertical_divider.BackgroundColor3 = Color3.new(0.0902, 0.0902, 0.114)
    vertical_divider.Position = UDim2.new(0.309, 0, 0, 0)
    vertical_divider.Size = UDim2.new(0, 1, 0, 494)
    vertical_divider.BorderSizePixel = 0
    vertical_divider.Parent = main
    
    -- Tabs system
    local tabs_frame = Instance.new("Frame")
    tabs_frame.Name = "TabsFrame"
    tabs_frame.BackgroundTransparency = 1
    tabs_frame.Position = UDim2.new(0.00971, 0, 0.131, 0)
    tabs_frame.Size = UDim2.new(0, 211, 0, 387)
    tabs_frame.Parent = main
    
    -- Content frame
    local content_frame = Instance.new("Frame")
    content_frame.Name = "ContentFrame"
    content_frame.BackgroundTransparency = 1
    content_frame.Position = UDim2.new(0.328, 0, 0.174, 0)
    content_frame.Size = UDim2.new(0, 540, 0, 380)
    content_frame.Parent = main
    
    -- Avatar preview
    local avatar_frame = Instance.new("Frame")
    avatar_frame.Name = "AvatarFrame"
    avatar_frame.BackgroundColor3 = Color3.new(0.0902, 0.0902, 0.114)
    avatar_frame.Position = UDim2.new(0.0394, 0, 0.891, 0)
    avatar_frame.Size = UDim2.new(0, 190, 0, 1)
    avatar_frame.BorderSizePixel = 0
    avatar_frame.Parent = main
    
    local player_avatar = Instance.new("ImageLabel")
    player_avatar.Name = "PlayerAvatar"
    player_avatar.Image = "rbxassetid://81331039069318" -- Will be replaced with actual headshot
    player_avatar.BackgroundTransparency = 1
    player_avatar.Position = UDim2.new(-0.0541, 0, 7.65, 0)
    player_avatar.Size = UDim2.new(0, 40, 0, 40)
    player_avatar.Parent = avatar_frame
    
    local avatar_corner = Instance.new("UICorner")
    avatar_corner.CornerRadius = UDim.new(1, 10)
    avatar_corner.Parent = player_avatar
    
    local welcome_label = Instance.new("TextLabel")
    welcome_label.Name = "WelcomeLabel"
    welcome_label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    welcome_label.TextColor3 = Color3.new(1, 1, 1)
    welcome_label.Text = "Welcome " .. player.DisplayName
    welcome_label.BackgroundTransparency = 1
    welcome_label.Position = UDim2.new(0.416, 0, 18, 0)
    welcome_label.Size = UDim2.new(0, 120, 0, 19)
    welcome_label.TextSize = 16
    welcome_label.Parent = avatar_frame
    
    -- Window functions
    local minimized = false
    
    local function toggleMinimize()
        minimized = not minimized
        if minimized then
            main.Visible = false
            minimized_ui.Enabled = true
        else
            main.Visible = true
            minimized_ui.Enabled = false
        end
    end
    
    -- Connect events
    close_button.MouseButton1Click:Connect(function()
        main_UI:Destroy()
    end)
    
    minimize_button.MouseButton1Click:Connect(toggleMinimize)
    unminimize_button.MouseButton1Click:Connect(toggleMinimize)
    
    -- Dragging functionality
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    local function updateInput(input)
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    main.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if dragging then
                updateInput(input)
            end
        end
    end)
    
    -- Search functionality
    search_textbox.Focused:Connect(function()
        if search_textbox.Text == "Search..." then
            search_textbox.Text = ""
            search_textbox.TextColor3 = Color3.new(1, 1, 1)
        end
    end)
    
    search_textbox.FocusLost:Connect(function()
        if search_textbox.Text == "" then
            search_textbox.Text = "Search..."
            search_textbox.TextColor3 = Color3.new(0.392, 0.392, 0.392)
        end
    end)
    
    -- Window object
    window.main_ui = main_UI
    window.main_frame = main
    window.tabs_frame = tabs_frame
    window.content_frame = content_frame
    window.search_textbox = search_textbox
    
    function window:CreateTab(name, icon)
        local tab = {}
        tab.name = name
        tab.icon = icon or "rbxassetid://10747830374"
        tab.elements = {}
        tab.visible = false
        
        -- Create tab button
        local tab_button = Instance.new("Frame")
        tab_button.Name = name .. "_Tab"
        tab_button.BackgroundColor3 = Color3.new(0.0392, 0.0392, 0.0588)
        tab_button.BackgroundTransparency = 1
        tab_button.Position = UDim2.new(0.0621, 0, 0.02 + (#window.tabs * 0.12), 0)
        tab_button.Size = UDim2.new(0, 200, 0, 36)
        tab_button.Parent = self.tabs_frame
        
        local tab_corner = Instance.new("UICorner")
        tab_corner.CornerRadius = UDim.new(0, 9)
        tab_corner.Parent = tab_button
        
        local tab_stroke = Instance.new("UIStroke")
        tab_stroke.Color = Color3.new(0.0667, 0.0667, 0.098)
        tab_stroke.Thickness = 1.2
        tab_stroke.Parent = tab_button
        
        local tab_click_button = Instance.new("TextButton")
        tab_click_button.Name = "TabClickButton"
        tab_click_button.Text = ""
        tab_click_button.BackgroundTransparency = 1
        tab_click_button.Size = UDim2.new(1, 0, 1, 0)
        tab_click_button.Parent = tab_button
        
        local tab_icon = Instance.new("ImageLabel")
        tab_icon.Name = "TabIcon"
        tab_icon.Image = tab.icon
        tab_icon.BackgroundTransparency = 1
        tab_icon.Position = UDim2.new(0.05, 0, 0.188, 0)
        tab_icon.Size = UDim2.new(0, 20, 0, 20)
        tab_icon.Parent = tab_button
        
        local tab_label = Instance.new("TextLabel")
        tab_label.Name = "TabLabel"
        tab_label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
        tab_label.Text = name
        tab_label.BackgroundTransparency = 1
        tab_label.Position = UDim2.new(0.185, 0, 0.184, 0)
        tab_label.Size = UDim2.new(0, 78, 0, 21)
        tab_label.TextSize = 16
        tab_label.Parent = tab_button
        
        -- Create tab content
        local tab_content = Instance.new("ScrollingFrame")
        tab_content.Name = name .. "_Content"
        tab_content.BackgroundTransparency = 1
        tab_content.Position = UDim2.new(0, 0, 0, 0)
        tab_content.Size = UDim2.new(1, 0, 1, 0)
        tab_content.CanvasSize = UDim2.new(0, 0, 0, 0)
        tab_content.ScrollBarThickness = 4
        tab_content.ScrollBarImageColor3 = Color3.new(0.475, 0.451, 0.918)
        tab_content.Visible = false
        tab_content.Parent = self.content_frame
        
        local content_list = Instance.new("UIListLayout")
        content_list.SortOrder = Enum.SortOrder.LayoutOrder
        content_list.Padding = UDim.new(0, 15)
        content_list.Parent = tab_content
        
        -- Tab selection logic
        local function selectTab()
            -- Deselect all tabs
            for _, t in pairs(window.tabs) do
                t.button.BackgroundTransparency = 1
                t.label.TextColor3 = Color3.new(1, 1, 1)
                t.icon.ImageColor3 = Color3.new(1, 1, 1)
                t.content.Visible = false
            end
            
            -- Select this tab
            tab_button.BackgroundTransparency = 0
            tab_label.TextColor3 = Color3.new(0.475, 0.451, 0.902)
            tab_icon.ImageColor3 = Color3.new(0.435, 0.416, 0.831)
            tab_content.Visible = true
            window.currentTab = tab
        end
        
        tab_click_button.MouseButton1Click:Connect(selectTab)
        
        -- Set as first tab if none selected
        if #window.tabs == 0 then
            selectTab()
        end
        
        tab.button = tab_button
        tab.content = tab_content
        tab.label = tab_label
        tab.icon = tab_icon
        tab.list_layout = content_list
        
        -- Tab element creation functions
        function tab:CreateSection(name)
            local section = {}
            
            local section_frame = Instance.new("Frame")
            section_frame.Name = name .. "_Section"
            section_frame.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
            section_frame.Size = UDim2.new(1, -20, 0, 200)
            section_frame.Parent = self.content
            
            local section_corner = Instance.new("UICorner")
            section_corner.Parent = section_frame
            
            local section_stroke = Instance.new("UIStroke")
            section_stroke.Color = Color3.new(0.0902, 0.0902, 0.114)
            section_stroke.Parent = section_frame
            
            local elements_frame = Instance.new("Frame")
            elements_frame.Name = "ElementsFrame"
            elements_frame.BackgroundTransparency = 1
            elements_frame.Position = UDim2.new(0, 10, 0, 10)
            elements_frame.Size = UDim2.new(1, -20, 1, -20)
            elements_frame.Parent = section_frame
            
            local elements_list = Instance.new("UIListLayout")
            elements_list.SortOrder = Enum.SortOrder.LayoutOrder
            elements_list.Padding = UDim.new(0, 8)
            elements_list.Parent = elements_frame
            
            section.frame = section_frame
            section.elements_frame = elements_frame
            section.elements_list = elements_list
            
            -- Auto-resize section
            local function updateSize()
                local contentSize = elements_list.AbsoluteContentSize.Y
                section_frame.Size = UDim2.new(1, -20, 0, contentSize + 20)
                -- Update canvas size
                tab_content.CanvasSize = UDim2.new(0, 0, 0, content_list.AbsoluteContentSize.Y)
            end
            
            elements_list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateSize)
            
            function section:CreateToggle(name, description, default, callback)
                callback = callback or function() end
                local toggled = default or false
                
                local toggle_frame = Instance.new("Frame")
                toggle_frame.Name = name .. "_Toggle"
                toggle_frame.BackgroundTransparency = 1
                toggle_frame.Size = UDim2.new(1, 0, 0, 50)
                toggle_frame.Parent = self.elements_frame
                
                local toggle_title = Instance.new("TextLabel")
                toggle_title.Name = "Title"
                toggle_title.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
                toggle_title.TextColor3 = Color3.new(1, 1, 1)
                toggle_title.Text = name
                toggle_title.BackgroundTransparency = 1
                toggle_title.Position = UDim2.new(0, 0, 0, 0)
                toggle_title.Size = UDim2.new(1, -50, 0, 20)
                toggle_title.TextSize = 15
                toggle_title.TextXAlignment = Enum.TextXAlignment.Left
                toggle_title.Parent = toggle_frame
                
                local toggle_desc = Instance.new("TextLabel")
                toggle_desc.Name = "Description"
                toggle_desc.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
                toggle_desc.TextColor3 = Color3.new(0.42, 0.42, 0.424)
                toggle_desc.Text = description or "Description"
                toggle_desc.BackgroundTransparency = 1
                toggle_desc.Position = UDim2.new(0, 0, 0, 20)
                toggle_desc.Size = UDim2.new(1, -50, 0, 17)
                toggle_desc.TextSize = 14
                toggle_desc.TextXAlignment = Enum.TextXAlignment.Left
                toggle_desc.Parent = toggle_frame
                
                local toggle_button = Instance.new("Frame")
                toggle_button.Name = "ToggleButton"
                toggle_button.BackgroundColor3 = toggled and Color3.new(0.475, 0.451, 0.918) or Color3.new(0.0902, 0.0863, 0.125)
                toggle_button.Position = UDim2.new(1, -40, 0, 15)
                toggle_button.Size = UDim2.new(0, 36, 0, 20)
                toggle_button.Parent = toggle_frame
                
                local toggle_corner = Instance.new("UICorner")
                toggle_corner.CornerRadius = UDim.new(0, 9)
                toggle_corner.Parent = toggle_button
                
                local toggle_switch = Instance.new("Frame")
                toggle_switch.Name = "Switch"
                toggle_switch.BackgroundColor3 = Color3.new(1, 1, 1)
                toggle_switch.Position = toggled and UDim2.new(0, 18, 0, 5) or UDim2.new(0, 6, 0, 5)
                toggle_switch.Size = UDim2.new(0, 10, 0, 10)
                toggle_switch.Parent = toggle_button
                
                local switch_corner = Instance.new("UICorner")
                switch_corner.Parent = toggle_switch
                
                local toggle_click = Instance.new("TextButton")
                toggle_click.Name = "ToggleClick"
                toggle_click.Text = ""
                toggle_click.BackgroundTransparency = 1
                toggle_click.Size = UDim2.new(1, 0, 1, 0)
                toggle_click.Parent = toggle_button
                
                local function updateToggle()
                    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                    local colorTween = createTween(toggle_button, tweenInfo, {
                        BackgroundColor3 = toggled and Color3.new(0.475, 0.451, 0.918) or Color3.new(0.0902, 0.0863, 0.125)
                    })
                    local positionTween = createTween(toggle_switch, tweenInfo, {
                        Position = toggled and UDim2.new(0, 18, 0, 5) or UDim2.new(0, 6, 0, 5)
                    })
                    colorTween:Play()
                    positionTween:Play()
                    callback(toggled)
                end
                
                toggle_click.MouseButton1Click:Connect(function()
                    toggled = not toggled
                    updateToggle()
                end)
                
                updateToggle()
                
                return {
                    SetValue = function(value)
                        toggled = value
                        updateToggle()
                    end,
                    GetValue = function()
                        return toggled
                    end
                }
            end
            
            function section:CreateSlider(name, description, min, max, default, callback)
                callback = callback or function() end
                min = min or 0
                max = max or 100
                local value = default or min
                
                local slider_frame = Instance.new("Frame")
                slider_frame.Name = name .. "_Slider"
                slider_frame.BackgroundTransparency = 1
                slider_frame.Size = UDim2.new(1, 0, 0, 60)
                slider_frame.Parent = self.elements_frame
                
                local slider_title = Instance.new("TextLabel")
                slider_title.Name = "Title"
                slider_title.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
                slider_title.TextColor3 = Color3.new(1, 1, 1)
                slider_title.Text = name
                slider_title.BackgroundTransparency = 1
                slider_title.Position = UDim2.new(0, 0, 0, 0)
                slider_title.Size = UDim2.new(0.7, 0, 0, 20)
                slider_title.TextSize = 15
                slider_title.TextXAlignment = Enum.TextXAlignment.Left
                slider_title.Parent = slider_frame
                
                local slider_value = Instance.new("TextLabel")
                slider_value.Name = "Value"
                slider_value.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
                slider_value.TextColor3 = Color3.new(1, 1, 1)
                slider_value.Text = tostring(value)
                slider_value.BackgroundTransparency = 1
                slider_value.Position = UDim2.new(0.7, 0, 0, 0)
                slider_value.Size = UDim2.new(0.3, 0, 0, 20)
                slider_value.TextSize = 14
                slider_value.TextXAlignment = Enum.TextXAlignment.Right
                slider_value.Parent = slider_frame
                
                local slider_desc = Instance.new("TextLabel")
                slider_desc.Name = "Description"
                slider_desc.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
                slider_desc.TextColor3 = Color3.new(0.42, 0.42, 0.424)
                slider_desc.Text = description or "Description"
                slider_desc.BackgroundTransparency = 1
                slider_desc.Position = UDim2.new(0, 0, 0, 20)
                slider_desc.Size = UDim2.new(1, 0, 0, 17)
                slider_desc.TextSize = 14
                slider_desc.TextXAlignment = Enum.TextXAlignment.Left
                slider_desc.Parent = slider_frame
                
                local slider_background = Instance.new("Frame")
                slider_background.Name = "SliderBackground"
                slider_background.BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)
                slider_background.Position = UDim2.new(0, 0, 0, 40)
                slider_background.Size = UDim2.new(1, 0, 0, 7)
                slider_background.BorderSizePixel = 0
                slider_background.Parent = slider_frame
                
                local background_corner = Instance.new("UICorner")
                background_corner.CornerRadius = UDim.new(0, 3)
                background_corner.Parent = slider_background
                
                local slider_fill = Instance.new("Frame")
                slider_fill.Name = "SliderFill"
                slider_fill.BackgroundColor3 = Color3.new(0.475, 0.451, 0.918)
                slider_fill.Position = UDim2.new(0, 0, 0, 0)
                slider_fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
                slider_fill.BorderSizePixel = 0
                slider_fill.Parent = slider_background
                
                local fill_corner = Instance.new("UICorner")
                fill_corner.CornerRadius = UDim.new(0, 3)
                fill_corner.Parent = slider_fill
                
                local slider_button = Instance.new("Frame")
                slider_button.Name = "SliderButton"
                slider_button.BackgroundColor3 = Color3.new(1, 1, 1)
                slider_button.Position = UDim2.new((value - min) / (max - min), -5, 0, -2)
                slider_button.Size = UDim2.new(0, 11, 0, 11)
                slider_button.BorderSizePixel = 0
                slider_button.Parent = slider_background
                
                local button_corner = Instance.new("UICorner")
                button_corner.CornerRadius = UDim.new(0, 3)
                button_corner.Parent = slider_button
                
                local slider_input = Instance.new("TextButton")
                slider_input.Name = "SliderInput"
                slider_input.Text = ""
                slider_input.BackgroundTransparency = 1
                slider_input.Size = UDim2.new(1, 0, 1, 0)
                slider_input.Parent = slider_background
                
                local dragging = false
                
                local function updateSlider(input)
                    local mouse = input or UserInputService:GetMouseLocation()
                    local relativeX = mouse.X - slider_background.AbsolutePosition.X
                    local percentage = math.clamp(relativeX / slider_background.AbsoluteSize.X, 0, 1)
                    value = math.floor(min + (max - min) * percentage)
                    
                    slider_value.Text = tostring(value)
                    slider_fill.Size = UDim2.new(percentage, 0, 1, 0)
                    slider_button.Position = UDim2.new(percentage, -5, 0, -2)
                    
                    callback(value)
                end
                
                slider_input.MouseButton1Down:Connect(function()
                    dragging = true
                    updateSlider()
                end)
                
                UserInputService.InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        updateSlider()
                    end
                end)
                
                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)
                
                return {
                    SetValue = function(newValue)
                        value = math.clamp(newValue, min, max)
                        slider_value.Text = tostring(value)
                        local percentage = (value - min) / (max - min)
                        slider_fill.Size = UDim2.new(percentage, 0, 1, 0)
                        slider_button.Position = UDim2.new(percentage, -5, 0, -2)
                        callback(value)
                    end,
                    GetValue = function()
                        return value
                    end
                }
            end
            
            function section:CreateDropdown(name, description, options, default, callback)
                callback = callback or function() end
                options = options or {"Option 1", "Option 2", "Option 3"}
                local selected = default or options[1]
                local isOpen = false
                
                local dropdown_frame = Instance.new("Frame")
                dropdown_frame.Name = name .. "_Dropdown"
                dropdown_frame.BackgroundTransparency = 1
                dropdown_frame.Size = UDim2.new(1, 0, 0, 50)
                dropdown_frame.Parent = self.elements_frame
                
                local dropdown_title = Instance.new("TextLabel")
                dropdown_title.Name = "Title"
                dropdown_title.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
                dropdown_title.TextColor3 = Color3.new(1, 1, 1)
                dropdown_title.Text = name
                dropdown_title.BackgroundTransparency = 1
                dropdown_title.Position = UDim2.new(0, 0, 0, 0)
                dropdown_title.Size = UDim2.new(0.6, 0, 0, 20)
                dropdown_title.TextSize = 15
                dropdown_title.TextXAlignment = Enum.TextXAlignment.Left
                dropdown_title.Parent = dropdown_frame
                
                local dropdown_desc = Instance.new("TextLabel")
                dropdown_desc.Name = "Description"
                dropdown_desc.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
                dropdown_desc.TextColor3 = Color3.new(0.42, 0.42, 0.424)
                dropdown_desc.Text = description or "Description"
                dropdown_desc.BackgroundTransparency = 1
                dropdown_desc.Position = UDim2.new(0, 0, 0, 20)
                dropdown_desc.Size = UDim2.new(0.6, 0, 0, 17)
                dropdown_desc.TextSize = 14
                dropdown_desc.TextXAlignment = Enum.TextXAlignment.Left
                dropdown_desc.Parent = dropdown_frame
                
                local dropdown_button = Instance.new("Frame")
                dropdown_button.Name = "DropdownButton"
                dropdown_button.BackgroundColor3 = Color3.new(0.0627, 0.0588, 0.0863)
                dropdown_button.Position = UDim2.new(0.6, 10, 0, 10)
                dropdown_button.Size = UDim2.new(0, 120, 0, 29)
                dropdown_button.Parent = dropdown_frame
                
                local dropdown_corner = Instance.new("UICorner")
                dropdown_corner.CornerRadius = UDim.new(0, 4)
                dropdown_corner.Parent = dropdown_button
                
                local dropdown_stroke = Instance.new("UIStroke")
                dropdown_stroke.Color = Color3.new(0.0863, 0.0863, 0.0863)
                dropdown_stroke.Parent = dropdown_button
                
                local dropdown_label = Instance.new("TextLabel")
                dropdown_label.Name = "Label"
                dropdown_label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
                dropdown_label.TextColor3 = Color3.new(0.8, 0.8, 0.8)
                dropdown_label.Text = selected
                dropdown_label.BackgroundTransparency = 1
                dropdown_label.Position = UDim2.new(0, 5, 0, 0)
                dropdown_label.Size = UDim2.new(0.8, 0, 1, 0)
                dropdown_label.TextSize = 12
                dropdown_label.TextXAlignment = Enum.TextXAlignment.Left
                dropdown_label.Parent = dropdown_button
                
                local dropdown_arrow = Instance.new("ImageLabel")
                dropdown_arrow.Name = "Arrow"
                dropdown_arrow.Image = isOpen and "rbxassetid://10709791523" or "rbxassetid://10709790948"
                dropdown_arrow.BackgroundTransparency = 1
                dropdown_arrow.Position = UDim2.new(0.85, 0, 0.25, 0)
                dropdown_arrow.Size = UDim2.new(0, 15, 0, 15)
                dropdown_arrow.Parent = dropdown_button
                
                local dropdown_click = Instance.new("TextButton")
                dropdown_click.Name = "DropdownClick"
                dropdown_click.Text = ""
                dropdown_click.BackgroundTransparency = 1
                dropdown_click.Size = UDim2.new(1, 0, 1, 0)
                dropdown_click.Parent = dropdown_button
                
                local dropdown_list = Instance.new("Frame")
                dropdown_list.Name = "DropdownList"
                dropdown_list.BackgroundColor3 = Color3.new(0.0627, 0.0588, 0.0863)
                dropdown_list.Position = UDim2.new(0, 0, 1, 5)
                dropdown_list.Size = UDim2.new(1, 0, 0, #options * 25)
                dropdown_list.Visible = false
                dropdown_list.Parent = dropdown_button
                dropdown_list.ZIndex = 10
                
                local list_corner = Instance.new("UICorner")
                list_corner.CornerRadius = UDim.new(0, 4)
                list_corner.Parent = dropdown_list
                
                local list_stroke = Instance.new("UIStroke")
                list_stroke.Color = Color3.new(0.0863, 0.0863, 0.0863)
                list_stroke.Parent = dropdown_list
                
                local list_layout = Instance.new("UIListLayout")
                list_layout.SortOrder = Enum.SortOrder.LayoutOrder
                list_layout.Parent = dropdown_list
                
                local function toggleDropdown()
                    isOpen = not isOpen
                    dropdown_list.Visible = isOpen
                    dropdown_arrow.Image = isOpen and "rbxassetid://10709791523" or "rbxassetid://10709790948"
                    
                    if isOpen then
                        dropdown_frame.Size = UDim2.new(1, 0, 0, 50 + (#options * 25) + 10)
                    else
                        dropdown_frame.Size = UDim2.new(1, 0, 0, 50)
                    end
                end
                
                dropdown_click.MouseButton1Click:Connect(toggleDropdown)
                
                for i, option in ipairs(options) do
                    local option_button = Instance.new("TextButton")
                    option_button.Name = "Option_" .. i
                    option_button.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
                    option_button.TextColor3 = Color3.new(0.498, 0.498, 0.498)
                    option_button.Text = option
                    option_button.BackgroundTransparency = 1
                    option_button.Size = UDim2.new(1, 0, 0, 25)
                    option_button.TextSize = 12
                    option_button.TextXAlignment = Enum.TextXAlignment.Left
                    option_button.Parent = dropdown_list
                    
                    option_button.MouseButton1Click:Connect(function()
                        selected = option
                        dropdown_label.Text = selected
                        toggleDropdown()
                        callback(selected)
                    end)
                    
                    option_button.MouseEnter:Connect(function()
                        option_button.TextColor3 = Color3.new(0.8, 0.8, 0.8)
                    end)
                    
                    option_button.MouseLeave:Connect(function()
                        option_button.TextColor3 = Color3.new(0.498, 0.498, 0.498)
                    end)
                end
                
                return {
                    SetValue = function(value)
                        selected = value
                        dropdown_label.Text = selected
                        callback(selected)
                    end,
                    GetValue = function()
                        return selected
                    end,
                    SetOptions = function(newOptions)
                        options = newOptions
                        dropdown_list:ClearAllChildren()
                        
                        local new_layout = Instance.new("UIListLayout")
                        new_layout.SortOrder = Enum.SortOrder.LayoutOrder
                        new_layout.Parent = dropdown_list
                        
                        dropdown_list.Size = UDim2.new(1, 0, 0, #options * 25)
                        
                        for i, option in ipairs(options) do
                            local option_button = Instance.new("TextButton")
                            option_button.Name = "Option_" .. i
                            option_button.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
                            option_button.TextColor3 = Color3.new(0.498, 0.498, 0.498)
                            option_button.Text = option
                            option_button.BackgroundTransparency = 1
                            option_button.Size = UDim2.new(1, 0, 0, 25)
                            option_button.TextSize = 12
                            option_button.TextXAlignment = Enum.TextXAlignment.Left
                            option_button.Parent = dropdown_list
                            
                            option_button.MouseButton1Click:Connect(function()
                                selected = option
                                dropdown_label.Text = selected
                                toggleDropdown()
                                callback(selected)
                            end)
                            
                            option_button.MouseEnter:Connect(function()
                                option_button.TextColor3 = Color3.new(0.8, 0.8, 0.8)
                            end)
                            
                            option_button.MouseLeave:Connect(function()
                                option_button.TextColor3 = Color3.new(0.498, 0.498, 0.498)
                            end)
                        end
                    end
                }
            end
            
            function section:CreateColorPicker(name, description, default, callback)
                callback = callback or function() end
                local color = default or Color3.new(0.647, 0.169, 0.647)
                
                local colorpicker_frame = Instance.new("Frame")
                colorpicker_frame.Name = name .. "_ColorPicker"
                colorpicker_frame.BackgroundTransparency = 1
                colorpicker_frame.Size = UDim2.new(1, 0, 0, 50)
                colorpicker_frame.Parent = self.elements_frame
                
                local colorpicker_title = Instance.new("TextLabel")
                colorpicker_title.Name = "Title"
                colorpicker_title.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
                colorpicker_title.TextColor3 = Color3.new(1, 1, 1)
                colorpicker_title.Text = name
                colorpicker_title.BackgroundTransparency = 1
                colorpicker_title.Position = UDim2.new(0, 0, 0, 0)
                colorpicker_title.Size = UDim2.new(0.7, 0, 0, 20)
                colorpicker_title.TextSize = 15
                colorpicker_title.TextXAlignment = Enum.TextXAlignment.Left
                colorpicker_title.Parent = colorpicker_frame
                
                local colorpicker_desc = Instance.new("TextLabel")
                colorpicker_desc.Name = "Description"
                colorpicker_desc.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
                colorpicker_desc.TextColor3 = Color3.new(0.42, 0.42, 0.424)
                colorpicker_desc.Text = description or "Description"
                colorpicker_desc.BackgroundTransparency = 1
                colorpicker_desc.Position = UDim2.new(0, 0, 0, 20)
                colorpicker_desc.Size = UDim2.new(0.7, 0, 0, 17)
                colorpicker_desc.TextSize = 14
                colorpicker_desc.TextXAlignment = Enum.TextXAlignment.Left
                colorpicker_desc.Parent = colorpicker_frame
                
                local color_button = Instance.new("Frame")
                color_button.Name = "ColorButton"
                color_button.BackgroundColor3 = color
                color_button.Position = UDim2.new(0.7, 10, 0, 7.5)
                color_button.Size = UDim2.new(0, 35, 0, 35)
                color_button.Parent = colorpicker_frame
                
                local color_corner = Instance.new("UICorner")
                color_corner.CornerRadius = UDim.new(0, 5)
                color_corner.Parent = color_button
                
                local color_click = Instance.new("TextButton")
                color_click.Name = "ColorClick"
                color_click.Text = ""
                color_click.BackgroundTransparency = 1
                color_click.Size = UDim2.new(1, 0, 1, 0)
                color_click.Parent = color_button
                
                -- Simple color picker (cycles through predefined colors for demo)
                local colors = {
                    Color3.new(0.647, 0.169, 0.647), -- Purple
                    Color3.new(0.169, 0.647, 0.169), -- Green
                    Color3.new(0.647, 0.169, 0.169), -- Red
                    Color3.new(0.169, 0.169, 0.647), -- Blue
                    Color3.new(0.647, 0.647, 0.169), -- Yellow
                    Color3.new(0.647, 0.400, 0.169), -- Orange
                }
                local colorIndex = 1
                
                color_click.MouseButton1Click:Connect(function()
                    colorIndex = colorIndex % #colors + 1
                    color = colors[colorIndex]
                    color_button.BackgroundColor3 = color
                    callback(color)
                end)
                
                return {
                    SetValue = function(newColor)
                        color = newColor
                        color_button.BackgroundColor3 = color
                        callback(color)
                    end,
                    GetValue = function()
                        return color
                    end
                }
            end
            
            return section
        end
        
        table.insert(window.tabs, tab)
        return tab
    end
    
    return window
end

return Library
