-- Anerial UI Library
local Library = {}
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Utility Functions
local function tween(object, properties, duration, style, direction)
    local tweenInfo = TweenInfo.new(duration or 0.3, style or Enum.EasingStyle.Quad, direction or Enum.EasingDirection.Out)
    local tween = TweenService:Create(object, tweenInfo, properties)
    tween:Play()
    return tween
end

local function createNotification(data)
    -- Simple notification system
    local notification = Instance.new("Frame")
    notification.Name = "Notification"
    notification.BackgroundColor3 = Color3.fromRGB(5, 5, 8)
    notification.BorderSizePixel = 0
    notification.Position = UDim2.new(1, 20, 0, 50)
    notification.Size = UDim2.new(0, 300, 0, 60)
    notification.Parent = PlayerGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = notification
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(17, 17, 21)
    stroke.Parent = notification
    
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.BackgroundTransparency = 1
    title.Position = UDim2.new(0, 10, 0, 5)
    title.Size = UDim2.new(1, -20, 0, 20)
    title.Font = Enum.Font.GothamBold
    title.Text = data.title or "Notification"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = notification
    
    local text = Instance.new("TextLabel")
    text.Name = "Text"
    text.BackgroundTransparency = 1
    text.Position = UDim2.new(0, 10, 0, 25)
    text.Size = UDim2.new(1, -20, 0, 20)
    text.Font = Enum.Font.Gotham
    text.Text = data.text or ""
    text.TextColor3 = Color3.fromRGB(170, 170, 170)
    text.TextSize = 12
    text.TextXAlignment = Enum.TextXAlignment.Left
    text.Parent = notification
    
    -- Animate in
    tween(notification, {Position = UDim2.new(1, -320, 0, 50)}, 0.5)
    
    -- Auto remove
    task.wait(data.duration or 3)
    tween(notification, {Position = UDim2.new(1, 20, 0, 50)}, 0.5)
    task.wait(0.5)
    notification:Destroy()
end

-- Main Library Functions
function Library.new()
    local self = {}
    self.tabs = {}
    self.currentTab = nil
    self.flags = {}
    
    -- Create main UI structure
    local main_UI = Instance.new("ScreenGui")
    main_UI.Name = "Main UI"
    main_UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    main_UI.Parent = PlayerGui
    
    -- Minimized UI
    local minimized_ui = Instance.new("ScreenGui")
    minimized_ui.Name = "Minimized ui"
    minimized_ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    minimized_ui.Parent = main_UI
    minimized_ui.Enabled = false
    
    local minimized_frame = Instance.new("Frame")
    minimized_frame.Name = "Minimized ui cro"
    minimized_frame.BackgroundColor3 = Color3.fromRGB(5, 5, 8)
    minimized_frame.Position = UDim2.new(0.459, 0, 0.0293, 0)
    minimized_frame.BorderSizePixel = 0
    minimized_frame.Size = UDim2.new(0, 120, 0, 31)
    minimized_frame.Parent = minimized_ui
    
    local corner1 = Instance.new("UICorner")
    corner1.CornerRadius = UDim.new(0, 4)
    corner1.Parent = minimized_frame
    
    local stroke1 = Instance.new("UIStroke")
    stroke1.Color = Color3.fromRGB(17, 17, 21)
    stroke1.Parent = minimized_frame
    
    local label = Instance.new("TextLabel")
    label.Text = "Anerial.cc"
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0.1, 0, 0, 0)
    label.Size = UDim2.new(0.8, 0, 1, 0)
    label.Font = Enum.Font.GothamBold
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextSize = 13
    label.Parent = minimized_frame
    
    local unminimize_button = Instance.new("TextButton")
    unminimize_button.Text = ""
    unminimize_button.BackgroundTransparency = 1
    unminimize_button.Size = UDim2.new(1, 0, 1, 0)
    unminimize_button.Parent = minimized_frame
    
    -- Main frame
    local main = Instance.new("Frame")
    main.Name = "main"
    main.BackgroundColor3 = Color3.fromRGB(5, 5, 8)
    main.Position = UDim2.new(0.227, 0, 0.198, 0)
    main.BorderSizePixel = 0
    main.Size = UDim2.new(0, 813, 0, 494)
    main.Parent = main_UI
    
    local main_corner = Instance.new("UICorner")
    main_corner.Parent = main
    
    local main_stroke = Instance.new("UIStroke")
    main_stroke.Color = Color3.fromRGB(17, 17, 21)
    main_stroke.Parent = main
    
    -- Logo
    local logo = Instance.new("TextLabel")
    logo.Name = "Logo"
    logo.Font = Enum.Font.GothamBold
    logo.TextColor3 = Color3.new(1, 1, 1)
    logo.Text = "Anerial.cc"
    logo.BackgroundTransparency = 1
    logo.Position = UDim2.new(0.0382, 0, 0.0105, 0)
    logo.TextSize = 33
    logo.Size = UDim2.new(0, 170, 0, 45)
    logo.Parent = main
    
    -- Credits
    local credits = Instance.new("TextLabel")
    credits.Name = "Credits"
    credits.Font = Enum.Font.GothamSemibold
    credits.TextColor3 = Color3.fromRGB(107, 107, 108)
    credits.Text = "v0rtexd & Lenny"
    credits.BackgroundTransparency = 1
    credits.Position = UDim2.new(0.075, 0, 0.0951, 0)
    credits.TextSize = 14
    credits.Size = UDim2.new(0, 108, 0, 18)
    credits.Parent = main
    
    -- Separator
    local separator = Instance.new("Frame")
    separator.BackgroundColor3 = Color3.fromRGB(23, 23, 29)
    separator.Position = UDim2.new(0.309, 0, 0, 0)
    separator.BorderSizePixel = 0
    separator.Size = UDim2.new(0, 1, 0, 494)
    separator.Parent = main
    
    -- Close button
    local close_frame = Instance.new("Frame")
    close_frame.BackgroundTransparency = 1
    close_frame.Position = UDim2.new(0.958, 0, 0.048, 0)
    close_frame.Size = UDim2.new(0, 18, 0, 20)
    close_frame.Parent = main
    
    local close_button = Instance.new("TextButton")
    close_button.Text = ""
    close_button.BackgroundTransparency = 1
    close_button.Size = UDim2.new(1, 0, 1, 0)
    close_button.Parent = close_frame
    
    local close_icon = Instance.new("ImageLabel")
    close_icon.Image = "rbxassetid://10747384394"
    close_icon.ImageColor3 = Color3.fromRGB(93, 93, 93)
    close_icon.BackgroundTransparency = 1
    close_icon.Size = UDim2.new(1, 0, 1, 0)
    close_icon.Parent = close_frame
    
    -- Minimize button
    local minimize_frame = Instance.new("Frame")
    minimize_frame.BackgroundTransparency = 1
    minimize_frame.Position = UDim2.new(0.911, 0, 0.0486, 0)
    minimize_frame.Size = UDim2.new(0, 15, 0, 15)
    minimize_frame.Parent = main
    
    local minimize_button = Instance.new("TextButton")
    minimize_button.Text = ""
    minimize_button.BackgroundTransparency = 1
    minimize_button.Size = UDim2.new(1, 0, 1, 0)
    minimize_button.Parent = minimize_frame
    
    local minimize_icon = Instance.new("ImageLabel")
    minimize_icon.Image = "rbxassetid://10734896206"
    minimize_icon.ImageColor3 = Color3.fromRGB(93, 93, 93)
    minimize_icon.BackgroundTransparency = 1
    minimize_icon.Size = UDim2.new(1, 0, 1, 0)
    minimize_icon.Parent = minimize_frame
    
    -- Tab system
    local tabs_frame = Instance.new("Frame")
    tabs_frame.Name = "Tabs System"
    tabs_frame.BackgroundTransparency = 1
    tabs_frame.Position = UDim2.new(0.00971, 0, 0.131, 0)
    tabs_frame.Size = UDim2.new(0, 211, 0, 387)
    tabs_frame.Parent = main
    
    -- Content frame
    local content_frame = Instance.new("Frame")
    content_frame.Name = "Content"
    content_frame.BackgroundTransparency = 1
    content_frame.Position = UDim2.new(0.328, 0, 0.174, 0)
    content_frame.Size = UDim2.new(0, 517, 0, 340)
    content_frame.Parent = main
    
    -- User info
    local user_frame = Instance.new("Frame")
    user_frame.BackgroundColor3 = Color3.fromRGB(23, 23, 29)
    user_frame.Position = UDim2.new(0.0394, 0, 0.891, 0)
    user_frame.BorderSizePixel = 0
    user_frame.Size = UDim2.new(0, 190, 0, 1)
    user_frame.Parent = main
    
    local player_image = Instance.new("ImageLabel")
    player_image.Image = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size100x100)
    player_image.BackgroundTransparency = 1
    player_image.Position = UDim2.new(-0.0541, 0, 7.65, 0)
    player_image.Size = UDim2.new(0, 40, 0, 40)
    player_image.Parent = user_frame
    
    local image_corner = Instance.new("UICorner")
    image_corner.CornerRadius = UDim.new(1, 0)
    image_corner.Parent = player_image
    
    local welcome_text = Instance.new("TextLabel")
    welcome_text.Font = Enum.Font.GothamSemibold
    welcome_text.TextColor3 = Color3.new(1, 1, 1)
    welcome_text.Text = "Welcome " .. Player.Name
    welcome_text.BackgroundTransparency = 1
    welcome_text.Position = UDim2.new(0.416, 0, 18, 0)
    welcome_text.TextSize = 16
    welcome_text.Size = UDim2.new(0, 150, 0, 19)
    welcome_text.Parent = user_frame
    
    -- Button connections
    close_button.MouseButton1Click:Connect(function()
        main_UI:Destroy()
    end)
    
    minimize_button.MouseButton1Click:Connect(function()
        main_UI.Enabled = false
        minimized_ui.Enabled = true
    end)
    
    unminimize_button.MouseButton1Click:Connect(function()
        minimized_ui.Enabled = false
        main_UI.Enabled = true
    end)
    
    -- Store references
    self.main_ui = main_UI
    self.minimized_ui = minimized_ui
    self.tabs_frame = tabs_frame
    self.content_frame = content_frame
    
    function self:create_tab(name, icon)
        local tab = {}
        tab.name = name
        tab.icon = icon or "rbxassetid://10747830374"
        tab.modules = {}
        tab.visible = false
        
        -- Create tab button
        local tab_button = Instance.new("Frame")
        tab_button.Name = name .. " Tab"
        tab_button.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
        tab_button.BackgroundTransparency = (#self.tabs == 0) and 0 or 1
        tab_button.Position = UDim2.new(0.013, 0, 0.0256 + (#self.tabs * 0.12), 0)
        tab_button.BorderSizePixel = 0
        tab_button.Size = UDim2.new(0, 231, 0, 36)
        tab_button.Parent = self.tabs_frame
        
        local tab_corner = Instance.new("UICorner")
        tab_corner.CornerRadius = UDim.new(0, 9)
        tab_corner.Parent = tab_button
        
        local tab_stroke = Instance.new("UIStroke")
        tab_stroke.Color = Color3.fromRGB(17, 17, 25)
        tab_stroke.Thickness = 1.2
        tab_stroke.Transparency = (#self.tabs == 0) and 0 or 1
        tab_stroke.Parent = tab_button
        
        local tab_icon = Instance.new("ImageLabel")
        tab_icon.Image = icon or "rbxassetid://10747830374"
        tab_icon.ImageColor3 = (#self.tabs == 0) and Color3.fromRGB(121, 115, 231) or Color3.new(1, 1, 1)
        tab_icon.BackgroundTransparency = 1
        tab_icon.Position = UDim2.new(0.0471, 0, 0.188, 0)
        tab_icon.Size = UDim2.new(0, 20, 0, 20)
        tab_icon.Parent = tab_button
        
        local tab_label = Instance.new("TextLabel")
        tab_label.Font = Enum.Font.GothamSemibold
        tab_label.TextColor3 = (#self.tabs == 0) and Color3.fromRGB(121, 115, 231) or Color3.new(1, 1, 1)
        tab_label.Text = name
        tab_label.BackgroundTransparency = 1
        tab_label.Position = UDim2.new(0.185, 0, 0.184, 0)
        tab_label.TextSize = 16
        tab_label.Size = UDim2.new(0, 78, 0, 21)
        tab_label.Parent = tab_button
        
        local tab_clickable = Instance.new("TextButton")
        tab_clickable.Text = ""
        tab_clickable.BackgroundTransparency = 1
        tab_clickable.Size = UDim2.new(1, 0, 1, 0)
        tab_clickable.Parent = tab_button
        
        -- Create tab content
        local tab_content = Instance.new("Frame")
        tab_content.Name = name .. " Content"
        tab_content.BackgroundTransparency = 1
        tab_content.Size = UDim2.new(1, 0, 1, 0)
        tab_content.Visible = (#self.tabs == 0)
        tab_content.Parent = self.content_frame
        
        -- Left section
        local left_section = Instance.new("Frame")
        left_section.Name = "Left Section"
        left_section.BackgroundTransparency = 1
        left_section.Size = UDim2.new(0, 255, 1, 0)
        left_section.Parent = tab_content
        
        -- Right section
        local right_section = Instance.new("Frame")
        right_section.Name = "Right Section"
        right_section.BackgroundTransparency = 1
        right_section.Position = UDim2.new(0, 262, 0, 0)
        right_section.Size = UDim2.new(0, 255, 1, 0)
        right_section.Parent = tab_content
        
        tab.left_section = left_section
        tab.right_section = right_section
        tab.tab_button = tab_button
        tab.tab_content = tab_content
        
        -- Tab selection logic
        tab_clickable.MouseButton1Click:Connect(function()
            for _, other_tab in pairs(self.tabs) do
                other_tab.tab_content.Visible = false
                other_tab.tab_button.BackgroundTransparency = 1
                other_tab.tab_button.UIStroke.Transparency = 1
                other_tab.tab_button.ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
                other_tab.tab_button.TextLabel.TextColor3 = Color3.new(1, 1, 1)
            end
            
            tab.tab_content.Visible = true
            tab.tab_button.BackgroundTransparency = 0
            tab.tab_button.UIStroke.Transparency = 0
            tab.tab_button.ImageLabel.ImageColor3 = Color3.fromRGB(121, 115, 231)
            tab.tab_button.TextLabel.TextColor3 = Color3.fromRGB(121, 115, 231)
            self.currentTab = tab
        end)
        
        if #self.tabs == 0 then
            self.currentTab = tab
            tab.visible = true
        end
        
        function tab:create_module(options)
            local module = {}
            module.title = options.title or "Module"
            module.flag = options.flag or module.title
            module.description = options.description or ""
            module.section = options.section or "left"
            module.callback = options.callback or function() end
            module.elements = {}
            
            local section_frame = (module.section == "left") and tab.left_section or tab.right_section
            local module_count = #tab.modules
            
            -- Create module frame
            local module_frame = Instance.new("Frame")
            module_frame.Name = module.title
            module_frame.BackgroundColor3 = Color3.fromRGB(5, 5, 8)
            module_frame.Position = UDim2.new(0, 0, 0, module_count * 250)
            module_frame.BorderSizePixel = 0
            module_frame.Size = UDim2.new(1, 0, 0, 226)
            module_frame.Parent = section_frame
            
            local module_corner = Instance.new("UICorner")
            module_corner.Parent = module_frame
            
            local module_stroke = Instance.new("UIStroke")
            module_stroke.Color = Color3.fromRGB(23, 23, 29)
            module_stroke.Parent = module_frame
            
            -- Module title
            local title_label = Instance.new("TextLabel")
            title_label.Font = Enum.Font.GothamSemibold
            title_label.TextColor3 = Color3.new(1, 1, 1)
            title_label.Text = module.title
            title_label.BackgroundTransparency = 1
            title_label.Position = UDim2.new(0, 8, 0, 8)
            title_label.TextSize = 15
            title_label.Size = UDim2.new(0, 87, 0, 21)
            title_label.TextXAlignment = Enum.TextXAlignment.Left
            title_label.Parent = module_frame
            
            -- Module description
            local desc_label = Instance.new("TextLabel")
            desc_label.Font = Enum.Font.SourceSansSemibold
            desc_label.TextColor3 = Color3.fromRGB(107, 107, 108)
            desc_label.Text = module.description
            desc_label.BackgroundTransparency = 1
            desc_label.Position = UDim2.new(0, 8, 0, 28)
            desc_label.TextSize = 15
            desc_label.Size = UDim2.new(0, 99, 0, 17)
            desc_label.TextXAlignment = Enum.TextXAlignment.Left
            desc_label.Parent = module_frame
            
            module.frame = module_frame
            module.elements_y_offset = 55
            
            function module:create_toggle(options)
                local toggle = {}
                toggle.title = options.title or "Toggle"
                toggle.flag = options.flag or toggle.title
                toggle.callback = options.callback or function() end
                toggle.value = options.value or false
                
                -- Store in flags
                self.flags[toggle.flag] = toggle.value
                
                -- Create toggle elements
                local toggle_label = Instance.new("TextLabel")
                toggle_label.Font = Enum.Font.GothamSemibold
                toggle_label.TextColor3 = Color3.new(1, 1, 1)
                toggle_label.Text = toggle.title
                toggle_label.BackgroundTransparency = 1
                toggle_label.Position = UDim2.new(0, 8, 0, module.elements_y_offset)
                toggle_label.TextSize = 15
                toggle_label.Size = UDim2.new(0, 87, 0, 21)
                toggle_label.TextXAlignment = Enum.TextXAlignment.Left
                toggle_label.Parent = module.frame
                
                local toggle_frame = Instance.new("Frame")
                toggle_frame.BackgroundColor3 = toggle.value and Color3.fromRGB(121, 115, 234) or Color3.fromRGB(23, 22, 32)
                toggle_frame.Position = UDim2.new(0, 205, 0, module.elements_y_offset + 2)
                toggle_frame.BorderSizePixel = 0
                toggle_frame.Size = UDim2.new(0, 36, 0, 20)
                toggle_frame.Parent = module.frame
                
                local toggle_corner = Instance.new("UICorner")
                toggle_corner.CornerRadius = UDim.new(0, 9)
                toggle_corner.Parent = toggle_frame
                
                local toggle_switch = Instance.new("Frame")
                toggle_switch.BackgroundColor3 = Color3.new(1, 1, 1)
                toggle_switch.Position = toggle.value and UDim2.new(0, 18, 0, 5) or UDim2.new(0, 6, 0, 5)
                toggle_switch.BorderSizePixel = 0
                toggle_switch.Size = UDim2.new(0, 10, 0, 10)
                toggle_switch.Parent = toggle_frame
                
                local switch_corner = Instance.new("UICorner")
                switch_corner.Parent = toggle_switch
                
                local toggle_button = Instance.new("TextButton")
                toggle_button.Text = ""
                toggle_button.BackgroundTransparency = 1
                toggle_button.Size = UDim2.new(1, 0, 1, 0)
                toggle_button.Parent = toggle_frame
                
                toggle_button.MouseButton1Click:Connect(function()
                    toggle.value = not toggle.value
                    self.flags[toggle.flag] = toggle.value
                    
                    tween(toggle_frame, {
                        BackgroundColor3 = toggle.value and Color3.fromRGB(121, 115, 234) or Color3.fromRGB(23, 22, 32)
                    })
                    tween(toggle_switch, {
                        Position = toggle.value and UDim2.new(0, 18, 0, 5) or UDim2.new(0, 6, 0, 5)
                    })
                    
                    toggle.callback(toggle.value)
                end)
                
                module.elements_y_offset = module.elements_y_offset + 40
                table.insert(module.elements, toggle)
                return toggle
            end
            
            function module:create_slider(options)
                local slider = {}
                slider.title = options.title or "Slider"
                slider.flag = options.flag or slider.title
                slider.minimum_value = options.minimum_value or 0
                slider.maximum_value = options.maximum_value or 100
                slider.value = options.value or slider.minimum_value
                slider.round_number = options.round_number or false
                slider.callback = options.callback or function() end
                
                -- Store in flags
                self.flags[slider.flag] = slider.value
                
                -- Create slider elements
                local slider_label = Instance.new("TextLabel")
                slider_label.Font = Enum.Font.GothamSemibold
                slider_label.TextColor3 = Color3.new(1, 1, 1)
                slider_label.Text = slider.title
                slider_label.BackgroundTransparency = 1
                slider_label.Position = UDim2.new(0, 8, 0, module.elements_y_offset)
                slider_label.TextSize = 15
                slider_label.Size = UDim2.new(0, 87, 0, 21)
                slider_label.TextXAlignment = Enum.TextXAlignment.Left
                slider_label.Parent = module.frame
                
                local value_label = Instance.new("TextLabel")
                value_label.Font = Enum.Font.GothamSemibold
                value_label.TextColor3 = Color3.new(1, 1, 1)
                value_label.Text = tostring(slider.value)
                value_label.BackgroundTransparency = 1
                value_label.Position = UDim2.new(0, 205, 0, module.elements_y_offset)
                value_label.TextSize = 14
                value_label.Size = UDim2.new(0, 36, 0, 21)
                value_label.Parent = module.frame
                
                local slider_bg = Instance.new("Frame")
                slider_bg.BackgroundColor3 = Color3.fromRGB(23, 22, 32)
                slider_bg.Position = UDim2.new(0, 15, 0, module.elements_y_offset + 35)
                slider_bg.BorderSizePixel = 0
                slider_bg.Size = UDim2.new(0, 226, 0, 7)
                slider_bg.Parent = module.frame
                
                local bg_corner = Instance.new("UICorner")
                bg_corner.CornerRadius = UDim.new(0, 3)
                bg_corner.Parent = slider_bg
                
                local slider_fill = Instance.new("Frame")
                slider_fill.BackgroundColor3 = Color3.fromRGB(121, 115, 234)
                slider_fill.BorderSizePixel = 0
                slider_fill.Size = UDim2.new((slider.value - slider.minimum_value) / (slider.maximum_value - slider.minimum_value), 0, 1, 0)
                slider_fill.Parent = slider_bg
                
                local fill_corner = Instance.new("UICorner")
                fill_corner.CornerRadius = UDim.new(0, 3)
                fill_corner.Parent = slider_fill
                
                local fill_gradient = Instance.new("UIGradient")
                fill_gradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 80, 80))
                })
                fill_gradient.Parent = slider_fill
                
                local slider_button = Instance.new("Frame")
                slider_button.BackgroundColor3 = Color3.new(1, 1, 1)
                slider_button.Position = UDim2.new((slider.value - slider.minimum_value) / (slider.maximum_value - slider.minimum_value), -5, 0, -2)
                slider_button.BorderSizePixel = 0
                slider_button.Size = UDim2.new(0, 11, 0, 11)
                slider_button.Parent = slider_bg
                
                local button_corner = Instance.new("UICorner")
                button_corner.CornerRadius = UDim.new(0, 3)
                button_corner.Parent = slider_button
                
                local slider_input = Instance.new("TextButton")
                slider_input.Text = ""
                slider_input.BackgroundTransparency = 1
                slider_input.Size = UDim2.new(1, 10, 1, 10)
                slider_input.Position = UDim2.new(0, -5, 0, -5)
                slider_input.Parent = slider_bg
                
                local dragging = false
                
                local function updateSlider(input)
                    local pos = math.clamp((input.Position.X - slider_bg.AbsolutePosition.X) / slider_bg.AbsoluteSize.X, 0, 1)
                    local newValue = slider.minimum_value + (pos * (slider.maximum_value - slider.minimum_value))
                    
                    if slider.round_number then
                        newValue = math.floor(newValue + 0.5)
                    end
                    
                    slider.value = newValue
                    self.flags[slider.flag] = slider.value
                    value_label.Text = tostring(slider.value)
                    
                    tween(slider_fill, {Size = UDim2.new(pos, 0, 1, 0)})
                    tween(slider_button, {Position = UDim2.new(pos, -5, 0, -2)})
                    
                    slider.callback(slider.value)
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
                
                slider_input.MouseButton1Click:Connect(function()
                    updateSlider(UserInputService:GetMouseLocation())
                end)
                
                module.elements_y_offset = module.elements_y_offset + 70
                table.insert(module.elements, slider)
                return slider
            end
            
            function module:create_dropdown(options)
                local dropdown = {}
                dropdown.title = options.title or "Dropdown"
                dropdown.flag = options.flag or dropdown.title
                dropdown.options = options.options or {"Option 1", "Option 2", "Option 3"}
                dropdown.multi_dropdown = options.multi_dropdown or false
                dropdown.maximum_options = options.maximum_options or #dropdown.options
                dropdown.callback = options.callback or function() end
                dropdown.value = dropdown.multi_dropdown and {} or dropdown.options[1]
                dropdown.open = false
                
                -- Store in flags
                self.flags[dropdown.flag] = dropdown.value
                
                -- Create dropdown elements
                local dropdown_label = Instance.new("TextLabel")
                dropdown_label.Font = Enum.Font.GothamSemibold
                dropdown_label.TextColor3 = Color3.new(1, 1, 1)
                dropdown_label.Text = dropdown.title
                dropdown_label.BackgroundTransparency = 1
                dropdown_label.Position = UDim2.new(0, 8, 0, module.elements_y_offset)
                dropdown_label.TextSize = 15
                dropdown_label.Size = UDim2.new(0, 87, 0, 21)
                dropdown_label.TextXAlignment = Enum.TextXAlignment.Left
                dropdown_label.Parent = module.frame
                
                local dropdown_frame = Instance.new("Frame")
                dropdown_frame.BackgroundColor3 = Color3.fromRGB(16, 15, 22)
                dropdown_frame.Position = UDim2.new(0, 158, 0, module.elements_y_offset + 2)
                dropdown_frame.BorderSizePixel = 0
                dropdown_frame.Size = UDim2.new(0, 79, 0, 29)
                dropdown_frame.Parent = module.frame
                
                local dropdown_corner = Instance.new("UICorner")
                dropdown_corner.CornerRadius = UDim.new(0, 4)
                dropdown_corner.Parent = dropdown_frame
                
                local dropdown_stroke = Instance.new("UIStroke")
                dropdown_stroke.Color = Color3.fromRGB(22, 22, 22)
                dropdown_stroke.Parent = dropdown_frame
                
                local current_label = Instance.new("TextLabel")
                current_label.Font = Enum.Font.GothamSemibold
                current_label.TextColor3 = Color3.fromRGB(204, 204, 204)
                current_label.Text = dropdown.multi_dropdown and "Multiple" or tostring(dropdown.value)
                current_label.BackgroundTransparency = 1
                current_label.Position = UDim2.new(0, 5, 0, 2)
                current_label.TextSize = 12
                current_label.Size = UDim2.new(0, 57, 0, 24)
                current_label.TextXAlignment = Enum.TextXAlignment.Left
                current_label.Parent = dropdown_frame
                
                local dropdown_arrow = Instance.new("ImageLabel")
                dropdown_arrow.Image = "rbxassetid://10709790948"
                dropdown_arrow.BackgroundTransparency = 1
                dropdown_arrow.Position = UDim2.new(0, 57, 0, 7)
                dropdown_arrow.Size = UDim2.new(0, 15, 0, 15)
                dropdown_arrow.Parent = dropdown_frame
                
                local dropdown_button = Instance.new("TextButton")
                dropdown_button.Text = ""
                dropdown_button.BackgroundTransparency = 1
                dropdown_button.Size = UDim2.new(1, 0, 1, 0)
                dropdown_button.Parent = dropdown_frame
                
                local options_frame = Instance.new("Frame")
                options_frame.BackgroundColor3 = Color3.fromRGB(16, 15, 22)
                options_frame.Position = UDim2.new(0, 0, 1, 5)
                options_frame.BorderSizePixel = 0
                options_frame.Size = UDim2.new(0, 79, 0, #dropdown.options * 25)
                options_frame.Visible = false
                options_frame.Parent = dropdown_frame
                
                local options_corner = Instance.new("UICorner")
                options_corner.CornerRadius = UDim.new(0, 4)
                options_corner.Parent = options_frame
                
                local options_stroke = Instance.new("UIStroke")
                options_stroke.Color = Color3.fromRGB(22, 22, 22)
                options_stroke.Parent = options_frame
                
                -- Create option buttons
                for i, option in ipairs(dropdown.options) do
                    local option_button = Instance.new("TextButton")
                    option_button.BackgroundTransparency = 1
                    option_button.Position = UDim2.new(0, 0, 0, (i-1) * 25)
                    option_button.Size = UDim2.new(1, 0, 0, 25)
                    option_button.Text = ""
                    option_button.Parent = options_frame
                    
                    local option_label = Instance.new("TextLabel")
                    option_label.Font = Enum.Font.GothamSemibold
                    option_label.TextColor3 = Color3.fromRGB(127, 127, 127)
                    option_label.Text = option
                    option_label.BackgroundTransparency = 1
                    option_label.Position = UDim2.new(0, 5, 0, 0)
                    option_label.TextSize = 12
                    option_label.Size = UDim2.new(0, 57, 1, 0)
                    option_label.TextXAlignment = Enum.TextXAlignment.Left
                    option_label.Parent = option_button
                    
                    option_button.MouseButton1Click:Connect(function()
                        if dropdown.multi_dropdown then
                            local selected = table.find(dropdown.value, option)
                            if selected then
                                table.remove(dropdown.value, selected)
                            else
                                if #dropdown.value < dropdown.maximum_options then
                                    table.insert(dropdown.value, option)
                                end
                            end
                            current_label.Text = #dropdown.value > 0 and table.concat(dropdown.value, ", ") or "None"
                        else
                            dropdown.value = option
                            current_label.Text = option
                            dropdown.open = false
                            options_frame.Visible = false
                            dropdown_arrow.Image = "rbxassetid://10709790948"
                        end
                        
                        self.flags[dropdown.flag] = dropdown.value
                        dropdown.callback(dropdown.value)
                    end)
                end
                
                dropdown_button.MouseButton1Click:Connect(function()
                    dropdown.open = not dropdown.open
                    options_frame.Visible = dropdown.open
                    dropdown_arrow.Image = dropdown.open and "rbxassetid://10709791523" or "rbxassetid://10709790948"
                end)
                
                module.elements_y_offset = module.elements_y_offset + 50
                table.insert(module.elements, dropdown)
                return dropdown
            end
            
            function module:create_colorpicker(options)
                local colorpicker = {}
                colorpicker.title = options.title or "Color"
                colorpicker.flag = options.flag or colorpicker.title
                colorpicker.value = options.value or Color3.fromRGB(165, 43, 165)
                colorpicker.callback = options.callback or function() end
                
                -- Store in flags
                self.flags[colorpicker.flag] = colorpicker.value
                
                -- Create colorpicker elements
                local color_label = Instance.new("TextLabel")
                color_label.Font = Enum.Font.GothamSemibold
                color_label.TextColor3 = Color3.new(1, 1, 1)
                color_label.Text = colorpicker.title
                color_label.BackgroundTransparency = 1
                color_label.Position = UDim2.new(0, 8, 0, module.elements_y_offset)
                color_label.TextSize = 15
                color_label.Size = UDim2.new(0, 87, 0, 21)
                color_label.TextXAlignment = Enum.TextXAlignment.Left
                color_label.Parent = module.frame
                
                local color_frame = Instance.new("Frame")
                color_frame.BackgroundColor3 = colorpicker.value
                color_frame.Position = UDim2.new(0, 205, 0, module.elements_y_offset)
                color_frame.BorderSizePixel = 0
                color_frame.Size = UDim2.new(0, 35, 0, 35)
                color_frame.Parent = module.frame
                
                local color_corner = Instance.new("UICorner")
                color_corner.CornerRadius = UDim.new(0, 5)
                color_corner.Parent = color_frame
                
                local color_button = Instance.new("TextButton")
                color_button.Text = ""
                color_button.BackgroundTransparency = 1
                color_button.Size = UDim2.new(1, 0, 1, 0)
                color_button.Parent = color_frame
                
                color_button.MouseButton1Click:Connect(function()
                    -- Simple color randomizer for demo (you can expand this to a full color picker)
                    colorpicker.value = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
                    color_frame.BackgroundColor3 = colorpicker.value
                    self.flags[colorpicker.flag] = colorpicker.value
                    colorpicker.callback(colorpicker.value)
                end)
                
                module.elements_y_offset = module.elements_y_offset + 50
                table.insert(module.elements, colorpicker)
                return colorpicker
            end
            
            function module:create_textbox(options)
                local textbox = {}
                textbox.title = options.title or "Textbox"
                textbox.flag = options.flag or textbox.title
                textbox.placeholder = options.placeholder or "Enter text..."
                textbox.callback = options.callback or function() end
                textbox.value = ""
                
                -- Store in flags
                self.flags[textbox.flag] = textbox.value
                
                -- Create textbox elements
                local textbox_label = Instance.new("TextLabel")
                textbox_label.Font = Enum.Font.GothamSemibold
                textbox_label.TextColor3 = Color3.new(1, 1, 1)
                textbox_label.Text = textbox.title
                textbox_label.BackgroundTransparency = 1
                textbox_label.Position = UDim2.new(0, 8, 0, module.elements_y_offset)
                textbox_label.TextSize = 15
                textbox_label.Size = UDim2.new(0, 87, 0, 21)
                textbox_label.TextXAlignment = Enum.TextXAlignment.Left
                textbox_label.Parent = module.frame
                
                local textbox_frame = Instance.new("Frame")
                textbox_frame.BackgroundColor3 = Color3.fromRGB(9, 9, 13)
                textbox_frame.Position = UDim2.new(0, 8, 0, module.elements_y_offset + 25)
                textbox_frame.BorderSizePixel = 0
                textbox_frame.Size = UDim2.new(0, 233, 0, 30)
                textbox_frame.Parent = module.frame
                
                local textbox_corner = Instance.new("UICorner")
                textbox_corner.CornerRadius = UDim.new(0, 4)
                textbox_corner.Parent = textbox_frame
                
                local textbox_stroke = Instance.new("UIStroke")
                textbox_stroke.Color = Color3.fromRGB(17, 17, 25)
                textbox_stroke.Parent = textbox_frame
                
                local textbox_input = Instance.new("TextBox")
                textbox_input.Font = Enum.Font.GothamSemibold
                textbox_input.PlaceholderText = textbox.placeholder
                textbox_input.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
                textbox_input.Text = ""
                textbox_input.TextColor3 = Color3.new(1, 1, 1)
                textbox_input.BackgroundTransparency = 1
                textbox_input.Position = UDim2.new(0, 10, 0, 0)
                textbox_input.Size = UDim2.new(1, -20, 1, 0)
                textbox_input.TextSize = 14
                textbox_input.TextXAlignment = Enum.TextXAlignment.Left
                textbox_input.Parent = textbox_frame
                
                textbox_input.FocusLost:Connect(function()
                    textbox.value = textbox_input.Text
                    self.flags[textbox.flag] = textbox.value
                    textbox.callback(textbox.value)
                end)
                
                module.elements_y_offset = module.elements_y_offset + 70
                table.insert(module.elements, textbox)
                return textbox
            end
            
            function module:create_paragraph(options)
                local paragraph = {}
                paragraph.title = options.title or "Info"
                paragraph.text = options.text or "This is a paragraph."
                
                -- Create paragraph elements
                local paragraph_label = Instance.new("TextLabel")
                paragraph_label.Font = Enum.Font.GothamSemibold
                paragraph_label.TextColor3 = Color3.new(1, 1, 1)
                paragraph_label.Text = paragraph.title
                paragraph_label.BackgroundTransparency = 1
                paragraph_label.Position = UDim2.new(0, 8, 0, module.elements_y_offset)
                paragraph_label.TextSize = 15
                paragraph_label.Size = UDim2.new(0, 87, 0, 21)
                paragraph_label.TextXAlignment = Enum.TextXAlignment.Left
                paragraph_label.Parent = module.frame
                
                local paragraph_text = Instance.new("TextLabel")
                paragraph_text.Font = Enum.Font.SourceSansSemibold
                paragraph_text.TextColor3 = Color3.fromRGB(170, 170, 170)
                paragraph_text.Text = paragraph.text
                paragraph_text.BackgroundTransparency = 1
                paragraph_text.Position = UDim2.new(0, 8, 0, module.elements_y_offset + 25)
                paragraph_text.TextSize = 14
                paragraph_text.Size = UDim2.new(1, -16, 0, 40)
                paragraph_text.TextXAlignment = Enum.TextXAlignment.Left
                paragraph_text.TextYAlignment = Enum.TextYAlignment.Top
                paragraph_text.TextWrapped = true
                paragraph_text.Parent = module.frame
                
                module.elements_y_offset = module.elements_y_offset + 70
                table.insert(module.elements, paragraph)
                return paragraph
            end
            
            function module:create_checkbox(options)
                local checkbox = {}
                checkbox.title = options.title or "Checkbox"
                checkbox.flag = options.flag or checkbox.title
                checkbox.callback = options.callback or function() end
                checkbox.value = options.value or false
                
                -- Store in flags
                self.flags[checkbox.flag] = checkbox.value
                
                -- Create checkbox elements
                local checkbox_frame = Instance.new("Frame")
                checkbox_frame.BackgroundColor3 = checkbox.value and Color3.fromRGB(121, 115, 234) or Color3.fromRGB(23, 22, 32)
                checkbox_frame.Position = UDim2.new(0, 8, 0, module.elements_y_offset)
                checkbox_frame.BorderSizePixel = 0
                checkbox_frame.Size = UDim2.new(0, 20, 0, 20)
                checkbox_frame.Parent = module.frame
                
                local checkbox_corner = Instance.new("UICorner")
                checkbox_corner.CornerRadius = UDim.new(0, 3)
                checkbox_corner.Parent = checkbox_frame
                
                local checkmark = Instance.new("ImageLabel")
                checkmark.Image = "rbxassetid://10709791523"
                checkmark.ImageColor3 = Color3.new(1, 1, 1)
                checkmark.BackgroundTransparency = 1
                checkmark.Position = UDim2.new(0, 2, 0, 2)
                checkmark.Size = UDim2.new(0, 16, 0, 16)
                checkmark.Visible = checkbox.value
                checkmark.Parent = checkbox_frame
                
                local checkbox_label = Instance.new("TextLabel")
                checkbox_label.Font = Enum.Font.GothamSemibold
                checkbox_label.TextColor3 = Color3.new(1, 1, 1)
                checkbox_label.Text = checkbox.title
                checkbox_label.BackgroundTransparency = 1
                checkbox_label.Position = UDim2.new(0, 35, 0, 0)
                checkbox_label.TextSize = 15
                checkbox_label.Size = UDim2.new(0, 200, 0, 20)
                checkbox_label.TextXAlignment = Enum.TextXAlignment.Left
                checkbox_label.Parent = module.frame
                
                local checkbox_button = Instance.new("TextButton")
                checkbox_button.Text = ""
                checkbox_button.BackgroundTransparency = 1
                checkbox_button.Position = UDim2.new(0, 8, 0, module.elements_y_offset)
                checkbox_button.Size = UDim2.new(1, -16, 0, 20)
                checkbox_button.Parent = module.frame
                
                checkbox_button.MouseButton1Click:Connect(function()
                    checkbox.value = not checkbox.value
                    self.flags[checkbox.flag] = checkbox.value
                    
                    tween(checkbox_frame, {
                        BackgroundColor3 = checkbox.value and Color3.fromRGB(121, 115, 234) or Color3.fromRGB(23, 22, 32)
                    })
                    checkmark.Visible = checkbox.value
                    
                    checkbox.callback(checkbox.value)
                end)
                
                module.elements_y_offset = module.elements_y_offset + 35
                table.insert(module.elements, checkbox)
                return checkbox
            end
            
            table.insert(tab.modules, module)
            return module
        end
        
        table.insert(self.tabs, tab)
        return tab
    end
    
    function self:load()
        -- Make UI draggable
        local dragging = false
        local dragStart = nil
        local startPos = nil
        
        logo.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                dragStart = input.Position
                startPos = main.Position
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = input.Position - dragStart
                main.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
    end
    
    return self
end

-- Notification function
function Library.SendNotification(data)
    spawn(function()
        createNotification(data)
    end)
end

return Library
