-- UI Library by v0rtexd & Lenny
-- Complete functional UI library for Roblox

local Library = {}
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Utility Functions
local function CreateTween(object, info, properties)
    return TweenService:Create(object, info, properties)
end

local function SendNotification(data)
    local title = data.title or "Notification"
    local text = data.text or "No message provided"
    local duration = data.duration or 3
    
    print("[" .. title .. "] " .. text)
    -- You can expand this to create actual notification UI
end

-- Main Library Constructor
function Library.new()
    local self = {}
    self.tabs = {}
    self.currentTab = nil
    self.isMinimized = false
    
    -- Create main UI structure
    local main_UI = Instance.new("ScreenGui")
    main_UI.Name = "Main UI"
    main_UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    main_UI.Parent = PlayerGui
    
    local minimized_ui = Instance.new("ScreenGui")
    minimized_ui.Name = "Minimized ui"
    minimized_ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    minimized_ui.Parent = main_UI
    minimized_ui.Enabled = false
    
    -- Main frame
    local main = Instance.new("Frame")
    main.Name = "main"
    main.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
    main.Position = UDim2.new(0.227, 0, 0.198, 0)
    main.BorderColor3 = Color3.new()
    main.BorderSizePixel = 0
    main.Size = UDim2.new(0, 813, 0, 494)
    main.Parent = main_UI
    
    local uICorner = Instance.new("UICorner")
    uICorner.CornerRadius = UDim.new(0, 10)
    uICorner.Parent = main
    
    local uIStroke = Instance.new("UIStroke")
    uIStroke.Color = Color3.new(0.0667, 0.0667, 0.0824)
    uIStroke.Parent = main
    
    -- Create minimized UI
    local minimized_frame = Instance.new("Frame")
    minimized_frame.Name = "Minimized ui cro"
    minimized_frame.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
    minimized_frame.Position = UDim2.new(0.459, 0, 0.0293, 0)
    minimized_frame.BorderColor3 = Color3.new()
    minimized_frame.BorderSizePixel = 0
    minimized_frame.Size = UDim2.new(0, 120, 0, 31)
    minimized_frame.Parent = minimized_ui
    
    local minimized_corner = Instance.new("UICorner")
    minimized_corner.CornerRadius = UDim.new(0, 4)
    minimized_corner.Parent = minimized_frame
    
    local minimized_stroke = Instance.new("UIStroke")
    minimized_stroke.Color = Color3.new(0.0667, 0.0667, 0.0824)
    minimized_stroke.Parent = minimized_frame
    
    local minimized_label = Instance.new("TextLabel")
    minimized_label.Name = "Anerial.cc"
    minimized_label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
    minimized_label.TextColor3 = Color3.new(1, 1, 1)
    minimized_label.Text = "Anerial.cc"
    minimized_label.BackgroundTransparency = 1
    minimized_label.Position = UDim2.new(0.358, 0, 0.133, 0)
    minimized_label.TextSize = 13
    minimized_label.Size = UDim2.new(0, 69, 0, 21)
    minimized_label.Parent = minimized_frame
    
    local unminimize_btn = Instance.new("TextButton")
    unminimize_btn.Name = "Unminize button"
    unminimize_btn.Text = ""
    unminimize_btn.BackgroundTransparency = 1
    unminimize_btn.Size = UDim2.new(1, 0, 1, 0)
    unminimize_btn.Parent = minimized_frame
    
    -- Logo
    local logo = Instance.new("TextLabel")
    logo.Name = "Logo"
    logo.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
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
    credits.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
    credits.TextColor3 = Color3.new(0.42, 0.42, 0.424)
    credits.Text = "v0rtexd & Lenny"
    credits.BackgroundTransparency = 1
    credits.Position = UDim2.new(0.075, 0, 0.0951, 0)
    credits.TextSize = 14
    credits.Size = UDim2.new(0, 108, 0, 18)
    credits.Parent = main
    
    -- Welcome text
    local welcome = Instance.new("TextLabel")
    welcome.Name = "Welcome"
    welcome.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
    welcome.TextColor3 = Color3.new(1, 1, 1)
    welcome.Text = "Welcome " .. Player.Name
    welcome.BackgroundTransparency = 1
    welcome.Position = UDim2.new(0.416, 0, 0.92, 0)
    welcome.TextSize = 16
    welcome.Size = UDim2.new(0, 200, 0, 19)
    welcome.Parent = main
    
    -- Player avatar
    local avatar = Instance.new("ImageLabel")
    avatar.Name = "Player skin"
    avatar.Image = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size100x100)
    avatar.BackgroundTransparency = 1
    avatar.Position = UDim2.new(0.035, 0, 0.91, 0)
    avatar.Size = UDim2.new(0, 40, 0, 40)
    avatar.Parent = main
    
    local avatar_corner = Instance.new("UICorner")
    avatar_corner.CornerRadius = UDim.new(1, 0)
    avatar_corner.Parent = avatar
    
    -- Close button
    local close_btn = Instance.new("TextButton")
    close_btn.Name = "Close button"
    close_btn.Text = "×"
    close_btn.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold)
    close_btn.TextColor3 = Color3.new(0.7, 0.7, 0.7)
    close_btn.BackgroundTransparency = 1
    close_btn.Position = UDim2.new(0.958, 0, 0.048, 0)
    close_btn.TextSize = 18
    close_btn.Size = UDim2.new(0, 18, 0, 20)
    close_btn.Parent = main
    
    -- Minimize button
    local minimize_btn = Instance.new("TextButton")
    minimize_btn.Name = "Minimize button"
    minimize_btn.Text = "-"
    minimize_btn.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold)
    minimize_btn.TextColor3 = Color3.new(0.7, 0.7, 0.7)
    minimize_btn.BackgroundTransparency = 1
    minimize_btn.Position = UDim2.new(0.911, 0, 0.0486, 0)
    minimize_btn.TextSize = 18
    minimize_btn.Size = UDim2.new(0, 15, 0, 15)
    minimize_btn.Parent = main
    
    -- Separator lines
    local separator1 = Instance.new("Frame")
    separator1.BackgroundColor3 = Color3.new(0.0902, 0.0902, 0.114)
    separator1.Position = UDim2.new(0.309, 0, 0, 0)
    separator1.Size = UDim2.new(0, 1, 0, 494)
    separator1.BorderSizePixel = 0
    separator1.Parent = main
    
    local separator2 = Instance.new("Frame")
    separator2.BackgroundColor3 = Color3.new(0.0784, 0.0784, 0.0784)
    separator2.Position = UDim2.new(0.311, 0, 0.133, 0)
    separator2.Size = UDim2.new(0, 560, 0, 1)
    separator2.BorderSizePixel = 0
    separator2.Parent = main
    
    -- Tabs system
    local tabs_frame = Instance.new("Frame")
    tabs_frame.Name = "Tabs System"
    tabs_frame.BackgroundTransparency = 1
    tabs_frame.Position = UDim2.new(0.00971, 0, 0.131, 0)
    tabs_frame.Size = UDim2.new(0, 211, 0, 387)
    tabs_frame.Parent = main
    
    local tabs_list = Instance.new("UIListLayout")
    tabs_list.SortOrder = Enum.SortOrder.LayoutOrder
    tabs_list.Padding = UDim.new(0, 5)
    tabs_list.Parent = tabs_frame
    
    -- Search bar
    local search_frame = Instance.new("Frame")
    search_frame.Name = "Search Bar"
    search_frame.BackgroundColor3 = Color3.new(0.0353, 0.0353, 0.051)
    search_frame.Position = UDim2.new(0.329, 0, 0.0483, 0)
    search_frame.Size = UDim2.new(0, 115, 0, 27)
    search_frame.Parent = main
    
    local search_corner = Instance.new("UICorner")
    search_corner.CornerRadius = UDim.new(0, 9)
    search_corner.Parent = search_frame
    
    local search_stroke = Instance.new("UIStroke")
    search_stroke.Color = Color3.new(0.0667, 0.0667, 0.098)
    search_stroke.Parent = search_frame
    
    local search_box = Instance.new("TextBox")
    search_box.Name = "Search for module"
    search_box.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold)
    search_box.TextColor3 = Color3.new(0.7, 0.7, 0.7)
    search_box.PlaceholderText = "Search..."
    search_box.Text = ""
    search_box.BackgroundTransparency = 1
    search_box.Position = UDim2.new(0.1, 0, 0, 0)
    search_box.TextSize = 14
    search_box.Size = UDim2.new(0.8, 0, 1, 0)
    search_box.Parent = search_frame
    
    -- Content frames
    local left_content = Instance.new("Frame")
    left_content.Name = "Left Content"
    left_content.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
    left_content.Position = UDim2.new(0.328, 0, 0.174, 0)
    left_content.Size = UDim2.new(0, 262, 0, 350)
    left_content.BorderSizePixel = 0
    left_content.Parent = main
    
    local left_corner = Instance.new("UICorner")
    left_corner.Parent = left_content
    
    local left_stroke = Instance.new("UIStroke")
    left_stroke.Color = Color3.new(0.0902, 0.0902, 0.114)
    left_stroke.Parent = left_content
    
    local right_content = Instance.new("Frame")
    right_content.Name = "Right Content"
    right_content.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
    right_content.Position = UDim2.new(0.668, 0, 0.174, 0)
    right_content.Size = UDim2.new(0, 255, 0, 350)
    right_content.BorderSizePixel = 0
    right_content.Parent = main
    
    local right_corner = Instance.new("UICorner")
    right_corner.Parent = right_content
    
    local right_stroke = Instance.new("UIStroke")
    right_stroke.Color = Color3.new(0.0902, 0.0902, 0.114)
    right_stroke.Parent = right_content
    
    -- Create scroll frames for content
    local left_scroll = Instance.new("ScrollingFrame")
    left_scroll.Name = "Left Scroll"
    left_scroll.BackgroundTransparency = 1
    left_scroll.Size = UDim2.new(1, 0, 1, 0)
    left_scroll.ScrollBarThickness = 6
    left_scroll.ScrollBarImageColor3 = Color3.new(0.3, 0.3, 0.3)
    left_scroll.Parent = left_content
    
    local left_layout = Instance.new("UIListLayout")
    left_layout.SortOrder = Enum.SortOrder.LayoutOrder
    left_layout.Padding = UDim.new(0, 10)
    left_layout.Parent = left_scroll
    
    local right_scroll = Instance.new("ScrollingFrame")
    right_scroll.Name = "Right Scroll"
    right_scroll.BackgroundTransparency = 1
    right_scroll.Size = UDim2.new(1, 0, 1, 0)
    right_scroll.ScrollBarThickness = 6
    right_scroll.ScrollBarImageColor3 = Color3.new(0.3, 0.3, 0.3)
    right_scroll.Parent = right_content
    
    local right_layout = Instance.new("UIListLayout")
    right_layout.SortOrder = Enum.SortOrder.LayoutOrder
    right_layout.Padding = UDim.new(0, 10)
    right_layout.Parent = right_scroll
    
    -- Store references
    self.main_ui = main_UI
    self.minimized_ui = minimized_ui
    self.main_frame = main
    self.tabs_frame = tabs_frame
    self.left_scroll = left_scroll
    self.right_scroll = right_scroll
    self.search_box = search_box
    
    -- Button connections
    close_btn.MouseButton1Click:Connect(function()
        main_UI:Destroy()
    end)
    
    minimize_btn.MouseButton1Click:Connect(function()
        self:toggle_minimize()
    end)
    
    unminimize_btn.MouseButton1Click:Connect(function()
        self:toggle_minimize()
    end)
    
    -- Make draggable
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    function self:toggle_minimize()
        self.isMinimized = not self.isMinimized
        main_UI.Enabled = not self.isMinimized
        minimized_ui.Enabled = self.isMinimized
    end
    
    function self:create_tab(title, icon)
        local tab = {}
        tab.title = title
        tab.icon = icon or "rbxassetid://10747830374"
        tab.modules = {}
        tab.active = false
        
        -- Create tab button
        local tab_btn = Instance.new("Frame")
        tab_btn.Name = title .. "_Tab"
        tab_btn.BackgroundColor3 = Color3.new(0.0392, 0.0392, 0.0588)
        tab_btn.BackgroundTransparency = 1
        tab_btn.Size = UDim2.new(0, 186, 0, 36)
        tab_btn.Parent = tabs_frame
        
        local tab_button = Instance.new("TextButton")
        tab_button.Text = ""
        tab_button.BackgroundTransparency = 1
        tab_button.Size = UDim2.new(1, 0, 1, 0)
        tab_button.Parent = tab_btn
        
        local tab_icon = Instance.new("ImageLabel")
        tab_icon.Image = icon
        tab_icon.BackgroundTransparency = 1
        tab_icon.Position = UDim2.new(0.047, 0, 0.188, 0)
        tab_icon.Size = UDim2.new(0, 20, 0, 20)
        tab_icon.ImageColor3 = Color3.new(1, 1, 1)
        tab_icon.Parent = tab_btn
        
        local tab_label = Instance.new("TextLabel")
        tab_label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
        tab_label.TextColor3 = Color3.new(1, 1, 1)
        tab_label.Text = title
        tab_label.BackgroundTransparency = 1
        tab_label.Position = UDim2.new(0.185, 0, 0.184, 0)
        tab_label.TextSize = 16
        tab_label.Size = UDim2.new(0, 78, 0, 21)
        tab_label.Parent = tab_btn
        
        local tab_corner = Instance.new("UICorner")
        tab_corner.CornerRadius = UDim.new(0, 9)
        tab_corner.Parent = tab_btn
        
        local tab_stroke = Instance.new("UIStroke")
        tab_stroke.Color = Color3.new(0.0667, 0.0667, 0.098)
        tab_stroke.Thickness = 1.2
        tab_stroke.Transparency = 1
        tab_stroke.Parent = tab_btn
        
        tab.frame = tab_btn
        tab.icon_obj = tab_icon
        tab.label_obj = tab_label
        tab.stroke_obj = tab_stroke
        
        function tab:activate()
            if self.active then return end
            
            -- Deactivate all other tabs
            for _, other_tab in pairs(self.tabs) do
                other_tab:deactivate()
            end
            
            -- Activate this tab
            self.active = true
            tab_btn.BackgroundColor3 = Color3.new(0.0392, 0.0392, 0.0588)
            tab_btn.BackgroundTransparency = 0
            tab_stroke.Transparency = 0
            tab_icon.ImageColor3 = Color3.new(0.435, 0.416, 0.831)
            tab_label.TextColor3 = Color3.new(0.475, 0.451, 0.902)
            
            -- Clear content
            for _, child in pairs(self.left_scroll:GetChildren()) do
                if child:IsA("Frame") then child:Destroy() end
            end
            for _, child in pairs(self.right_scroll:GetChildren()) do
                if child:IsA("Frame") then child:Destroy() end
            end
            
            -- Show modules
            for _, module in pairs(self.modules) do
                module:show()
            end
            
            self.currentTab = self
        end
        
        function tab:deactivate()
            if not self.active then return end
            
            self.active = false
            tab_btn.BackgroundTransparency = 1
            tab_stroke.Transparency = 1
            tab_icon.ImageColor3 = Color3.new(1, 1, 1)
            tab_label.TextColor3 = Color3.new(1, 1, 1)
        end
        
        function tab:create_module(config)
            local module = {}
            module.title = config.title or "Module"
            module.flag = config.flag or "module_flag"
            module.description = config.description or "Description"
            module.section = config.section or "left"
            module.callback = config.callback or function() end
            module.elements = {}
            module.enabled = false
            
            local parent_scroll = (module.section == "left") and self.left_scroll or self.right_scroll
            
            -- Create module frame
            local module_frame = Instance.new("Frame")
            module_frame.Name = module.title .. "_Module"
            module_frame.BackgroundTransparency = 1
            module_frame.Size = UDim2.new(1, -20, 0, 200)
            module_frame.LayoutOrder = #tab.modules + 1
            module_frame.Parent = parent_scroll
            
            local module_layout = Instance.new("UIListLayout")
            module_layout.SortOrder = Enum.SortOrder.LayoutOrder
            module_layout.Padding = UDim.new(0, 8)
            module_layout.Parent = module_frame
            
            -- Module header
            local header = Instance.new("Frame")
            header.Name = "Header"
            header.BackgroundTransparency = 1
            header.Size = UDim2.new(1, 0, 0, 60)
            header.LayoutOrder = 1
            header.Parent = module_frame
            
            local title_label = Instance.new("TextLabel")
            title_label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
            title_label.TextColor3 = Color3.new(1, 1, 1)
            title_label.Text = module.title
            title_label.BackgroundTransparency = 1
            title_label.Position = UDim2.new(0, 10, 0, 5)
            title_label.TextSize = 15
            title_label.Size = UDim2.new(0.7, 0, 0, 21)
            title_label.TextXAlignment = Enum.TextXAlignment.Left
            title_label.Parent = header
            
            local desc_label = Instance.new("TextLabel")
            desc_label.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold)
            desc_label.TextColor3 = Color3.new(0.42, 0.42, 0.424)
            desc_label.Text = module.description
            desc_label.BackgroundTransparency = 1
            desc_label.Position = UDim2.new(0, 10, 0, 28)
            desc_label.TextSize = 13
            desc_label.Size = UDim2.new(0.7, 0, 0, 17)
            desc_label.TextXAlignment = Enum.TextXAlignment.Left
            desc_label.Parent = header
            
            -- Module toggle
            local toggle_frame = Instance.new("Frame")
            toggle_frame.BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)
            toggle_frame.Position = UDim2.new(0.8, 0, 0.2, 0)
            toggle_frame.Size = UDim2.new(0, 36, 0, 20)
            toggle_frame.Parent = header
            
            local toggle_corner = Instance.new("UICorner")
            toggle_corner.CornerRadius = UDim.new(0, 9)
            toggle_corner.Parent = toggle_frame
            
            local toggle_knob = Instance.new("Frame")
            toggle_knob.BackgroundColor3 = Color3.new(1, 1, 1)
            toggle_knob.Position = UDim2.new(0.167, 0, 0.25, 0)
            toggle_knob.Size = UDim2.new(0, 10, 0, 10)
            toggle_knob.Parent = toggle_frame
            
            local knob_corner = Instance.new("UICorner")
            knob_corner.Parent = toggle_knob
            
            local toggle_btn = Instance.new("TextButton")
            toggle_btn.Text = ""
            toggle_btn.BackgroundTransparency = 1
            toggle_btn.Size = UDim2.new(1, 0, 1, 0)
            toggle_btn.Parent = toggle_frame
            
            module.frame = module_frame
            module.toggle_frame = toggle_frame
            module.toggle_knob = toggle_knob
            
            local function update_toggle()
                local tween_info = TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
                if module.enabled then
                    CreateTween(toggle_frame, tween_info, {BackgroundColor3 = Color3.new(0.475, 0.451, 0.918)}):Play()
                    CreateTween(toggle_knob, tween_info, {Position = UDim2.new(0.5, 0, 0.25, 0)}):Play()
                else
                    CreateTween(toggle_frame, tween_info, {BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)}):Play()
                    CreateTween(toggle_knob, tween_info, {Position = UDim2.new(0.167, 0, 0.25, 0)}):Play()
                end
            end
            
            toggle_btn.MouseButton1Click:Connect(function()
                module.enabled = not module.enabled
                update_toggle()
                module.callback(module.enabled)
            end)
            
            -- Separator
            local separator = Instance.new("Frame")
            separator.BackgroundColor3 = Color3.new(0.0902, 0.0902, 0.114)
            separator.Size = UDim2.new(1, -20, 0, 1)
            separator.BorderSizePixel = 0
            separator.LayoutOrder = 2
            separator.Parent = module_frame
            
            function module:show()
                module_frame.Parent = parent_scroll
                -- Update canvas size
                parent_scroll.CanvasSize = UDim2.new(0, 0, 0, parent_scroll.UIListLayout.AbsoluteContentSize.Y)
            end
            
            function module:create_slider(config)
                local slider = {}
                slider.title = config.title or "Slider"
                slider.flag = config.flag or "slider_flag"
                slider.minimum_value = config.minimum_value or 0
                slider.maximum_value = config.maximum_value or 100
                slider.value = config.value or 50
                slider.round_number = config.round_number or false
                slider.callback = config.callback or function() end
                
                local container = Instance.new("Frame")
                container.BackgroundTransparency = 1
                container.Size = UDim2.new(1, 0, 0, 60)
                container.LayoutOrder = #module.elements + 3
                container.Parent = module_frame
                
                local label = Instance.new("TextLabel")
                label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
                label.TextColor3 = Color3.new(0.992, 0.992, 0.992)
                label.Text = slider.title
                label.BackgroundTransparency = 1
                label.Position = UDim2.new(0, 10, 0, 0)
                label.TextSize = 15
                label.Size = UDim2.new(0, 79, 0, 14)
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.Parent = container
                
                local value_label = Instance.new("TextLabel")
                value_label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
                value_label.TextColor3 = Color3.new(1, 1, 1)
                value_label.Text = tostring(slider.value)
                value_label.BackgroundTransparency = 1
                value_label.Position = UDim2.new(0.8, 0, 0, 0)
                value_label.TextSize = 14
                value_label.Size = UDim2.new(0, 65, 0, 28)
                value_label.TextXAlignment = Enum.TextXAlignment.Center
                value_label.Parent = container
                
                -- Slider track
                local track = Instance.new("Frame")
                track.BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)
                track.Position = UDim2.new(0, 15, 0, 35)
                track.Size = UDim2.new(0, 180, 0, 7)
                track.BorderSizePixel = 0
                track.Parent = container
                
                local track_corner = Instance.new("UICorner")
                track_corner.CornerRadius = UDim.new(0, 3)
                track_corner.Parent = track
                
                local track_stroke = Instance.new("UIStroke")
                track_stroke.Color = Color3.new(0.0902, 0.0902, 0.114)
                track_stroke.Parent = track
                
                -- Filled portion
                local fill = Instance.new("Frame")
                fill.BackgroundColor3 = Color3.new(0.475, 0.451, 0.918)
                fill.Size = UDim2.new(0.5, 0, 1, 0)
                fill.BorderSizePixel = 0
                fill.Parent = track
                
                local fill_corner = Instance.new("UICorner")
                fill_corner.CornerRadius = UDim.new(0, 3)
                fill_corner.Parent = fill
                
                local fill_gradient = Instance.new("UIGradient")
                fill_gradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                    ColorSequenceKeypoint.new(1, Color3.new(0.314, 0.314, 0.314))
                })
                fill_gradient.Parent = fill
                
                -- Knob
                local knob = Instance.new("Frame")
                knob.BackgroundColor3 = Color3.new(1, 1, 1)
                knob.Position = UDim2.new(0.45, 0, -0.3, 0)
                knob.Size = UDim2.new(0, 11, 0, 11)
                knob.BorderSizePixel = 0
                knob.Parent = track
                
                local knob_corner = Instance.new("UICorner")
                knob_corner.CornerRadius = UDim.new(0, 3)
                knob_corner.Parent = knob
                
                local knob_btn = Instance.new("TextButton")
                knob_btn.Text = ""
                knob_btn.BackgroundTransparency = 1
                knob_btn.Size = UDim2.new(1, 0, 1, 0)
                knob_btn.Parent = knob
                
                local function update_slider(new_value)
                    new_value = math.clamp(new_value, slider.minimum_value, slider.maximum_value)
                    if slider.round_number then
                        new_value = math.floor(new_value + 0.5)
                    end
                    slider.value = new_value
                    
                    local percent = (slider.value - slider.minimum_value) / (slider.maximum_value - slider.minimum_value)
                    fill.Size = UDim2.new(percent, 0, 1, 0)
                    knob.Position = UDim2.new(percent, -5, -0.3, 0)
                    value_label.Text = tostring(slider.value)
                    
                    slider.callback(slider.value)
                end
                
                local dragging = false
                knob_btn.MouseButton1Down:Connect(function()
                    dragging = true
                end)
                
                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)
                
                UserInputService.InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        local mouse_x = input.Position.X
                        local track_x = track.AbsolutePosition.X
                        local relative_x = mouse_x - track_x
                        local percent = math.clamp(relative_x / track.AbsoluteSize.X, 0, 1)
                        local new_value = slider.minimum_value + (percent * (slider.maximum_value - slider.minimum_value))
                        update_slider(new_value)
                    end
                end)
                
                -- Initialize
                update_slider(slider.value)
                table.insert(module.elements, slider)
                return slider
            end
            
            function module:create_dropdown(config)
                local dropdown = {}
                dropdown.title = config.title or "Dropdown"
                dropdown.flag = config.flag or "dropdown_flag"
                dropdown.options = config.options or {"Option 1", "Option 2", "Option 3"}
                dropdown.multi_dropdown = config.multi_dropdown or false
                dropdown.maximum_options = config.maximum_options or 1
                dropdown.selected = {}
                dropdown.callback = config.callback or function() end
                dropdown.open = false
                
                local container = Instance.new("Frame")
                container.BackgroundTransparency = 1
                container.Size = UDim2.new(1, 0, 0, 40)
                container.LayoutOrder = #module.elements + 3
                container.Parent = module_frame
                
                local label = Instance.new("TextLabel")
                label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
                label.TextColor3 = Color3.new(1, 1, 1)
                label.Text = dropdown.title
                label.BackgroundTransparency = 1
                label.Position = UDim2.new(0, 10, 0, 0)
                label.TextSize = 15
                label.Size = UDim2.new(0.6, 0, 0, 21)
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.Parent = container
                
                -- Dropdown frame
                local dropdown_frame = Instance.new("Frame")
                dropdown_frame.BackgroundColor3 = Color3.new(0.0627, 0.0588, 0.0863)
                dropdown_frame.Position = UDim2.new(0.65, 0, 0, 5)
                dropdown_frame.Size = UDim2.new(0, 90, 0, 29)
                dropdown_frame.BorderSizePixel = 0
                dropdown_frame.Parent = container
                
                local dropdown_corner = Instance.new("UICorner")
                dropdown_corner.CornerRadius = UDim.new(0, 4)
                dropdown_corner.Parent = dropdown_frame
                
                local dropdown_stroke = Instance.new("UIStroke")
                dropdown_stroke.Color = Color3.new(0.0863, 0.0863, 0.0863)
                dropdown_stroke.Parent = dropdown_frame
                
                local selected_label = Instance.new("TextLabel")
                selected_label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
                selected_label.TextColor3 = Color3.new(0.8, 0.8, 0.8)
                selected_label.Text = dropdown.options[1] or "None"
                selected_label.BackgroundTransparency = 1
                selected_label.Position = UDim2.new(0, 8, 0, 2)
                selected_label.TextSize = 12
                selected_label.Size = UDim2.new(0.7, 0, 1, 0)
                selected_label.TextXAlignment = Enum.TextXAlignment.Left
                selected_label.Parent = dropdown_frame
                
                local arrow = Instance.new("TextLabel")
                arrow.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold)
                arrow.TextColor3 = Color3.new(0.7, 0.7, 0.7)
                arrow.Text = "▼"
                arrow.BackgroundTransparency = 1
                arrow.Position = UDim2.new(0.75, 0, 0, 0)
                arrow.TextSize = 10
                arrow.Size = UDim2.new(0.25, 0, 1, 0)
                arrow.Parent = dropdown_frame
                
                local main_btn = Instance.new("TextButton")
                main_btn.Text = ""
                main_btn.BackgroundTransparency = 1
                main_btn.Size = UDim2.new(1, 0, 1, 0)
                main_btn.Parent = dropdown_frame
                
                -- Options list
                local options_frame = Instance.new("Frame")
                options_frame.BackgroundColor3 = Color3.new(0.0627, 0.0588, 0.0863)
                options_frame.Position = UDim2.new(0, 0, 1.1, 0)
                options_frame.Size = UDim2.new(1, 0, 0, #dropdown.options * 25)
                options_frame.BorderSizePixel = 0
                options_frame.Visible = false
                options_frame.Parent = dropdown_frame
                
                local options_corner = Instance.new("UICorner")
                options_corner.CornerRadius = UDim.new(0, 4)
                options_corner.Parent = options_frame
                
                local options_stroke = Instance.new("UIStroke")
                options_stroke.Color = Color3.new(0.0863, 0.0863, 0.0863)
                options_stroke.Parent = options_frame
                
                local options_layout = Instance.new("UIListLayout")
                options_layout.SortOrder = Enum.SortOrder.LayoutOrder
                options_layout.Parent = options_frame
                
                for i, option in ipairs(dropdown.options) do
                    local option_btn = Instance.new("TextButton")
                    option_btn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
                    option_btn.TextColor3 = Color3.new(0.498, 0.498, 0.498)
                    option_btn.Text = option
                    option_btn.BackgroundTransparency = 1
                    option_btn.TextSize = 12
                    option_btn.Size = UDim2.new(1, 0, 0, 25)
                    option_btn.LayoutOrder = i
                    option_btn.Parent = options_frame
                    
                    option_btn.MouseButton1Click:Connect(function()
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
                            dropdown.open = false
                            options_frame.Visible = false
                            arrow.Text = "▼"
                        end
                        dropdown.callback(dropdown.multi_dropdown and dropdown.selected or option)
                    end)
                end
                
                main_btn.MouseButton1Click:Connect(function()
                    dropdown.open = not dropdown.open
                    options_frame.Visible = dropdown.open
                    arrow.Text = dropdown.open and "▲" or "▼"
                    
                    if dropdown.open then
                        container.Size = UDim2.new(1, 0, 0, 40 + #dropdown.options * 25)
                    else
                        container.Size = UDim2.new(1, 0, 0, 40)
                    end
                end)
                
                -- Initialize
                dropdown.selected = {dropdown.options[1]}
                table.insert(module.elements, dropdown)
                return dropdown
            end
            
            function module:create_checkbox(config)
                local checkbox = {}
                checkbox.title = config.title or "Checkbox"
                checkbox.flag = config.flag or "checkbox_flag"
                checkbox.callback = config.callback or function() end
                checkbox.checked = false
                
                local container = Instance.new("Frame")
                container.BackgroundTransparency = 1
                container.Size = UDim2.new(1, 0, 0, 30)
                container.LayoutOrder = #module.elements + 3
                container.Parent = module_frame
                
                local checkbox_frame = Instance.new("Frame")
                checkbox_frame.BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)
                checkbox_frame.Position = UDim2.new(0, 10, 0, 5)
                checkbox_frame.Size = UDim2.new(0, 20, 0, 20)
                checkbox_frame.BorderSizePixel = 0
                checkbox_frame.Parent = container
                
                local checkbox_corner = Instance.new("UICorner")
                checkbox_corner.CornerRadius = UDim.new(0, 3)
                checkbox_corner.Parent = checkbox_frame
                
                local checkmark = Instance.new("TextLabel")
                checkmark.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold)
                checkmark.TextColor3 = Color3.new(1, 1, 1)
                checkmark.Text = "✓"
                checkmark.BackgroundTransparency = 1
                checkmark.TextSize = 14
                checkmark.Size = UDim2.new(1, 0, 1, 0)
                checkmark.Visible = false
                checkmark.Parent = checkbox_frame
                
                local label = Instance.new("TextLabel")
                label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
                label.TextColor3 = Color3.new(1, 1, 1)
                label.Text = checkbox.title
                label.BackgroundTransparency = 1
                label.Position = UDim2.new(0, 40, 0, 5)
                label.TextSize = 14
                label.Size = UDim2.new(0.8, 0, 0, 20)
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.Parent = container
                
                local btn = Instance.new("TextButton")
                btn.Text = ""
                btn.BackgroundTransparency = 1
                btn.Size = UDim2.new(1, 0, 1, 0)
                btn.Parent = container
                
                btn.MouseButton1Click:Connect(function()
                    checkbox.checked = not checkbox.checked
                    checkmark.Visible = checkbox.checked
                    
                    local tween_info = TweenInfo.new(0.15, Enum.EasingStyle.Quint)
                    if checkbox.checked then
                        CreateTween(checkbox_frame, tween_info, {BackgroundColor3 = Color3.new(0.475, 0.451, 0.918)}):Play()
                    else
                        CreateTween(checkbox_frame, tween_info, {BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)}):Play()
                    end
                    
                    checkbox.callback(checkbox.checked)
                end)
                
                table.insert(module.elements, checkbox)
                return checkbox
            end
            
            function module:create_textbox(config)
                local textbox = {}
                textbox.title = config.title or "Textbox"
                textbox.flag = config.flag or "textbox_flag"
                textbox.placeholder = config.placeholder or "Enter text..."
                textbox.callback = config.callback or function() end
                textbox.text = ""
                
                local container = Instance.new("Frame")
                container.BackgroundTransparency = 1
                container.Size = UDim2.new(1, 0, 0, 60)
                container.LayoutOrder = #module.elements + 3
                container.Parent = module_frame
                
                local label = Instance.new("TextLabel")
                label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
                label.TextColor3 = Color3.new(1, 1, 1)
                label.Text = textbox.title
                label.BackgroundTransparency = 1
                label.Position = UDim2.new(0, 10, 0, 0)
                label.TextSize = 14
                label.Size = UDim2.new(1, 0, 0, 20)
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.Parent = container
                
                local textbox_frame = Instance.new("Frame")
                textbox_frame.BackgroundColor3 = Color3.new(0.0353, 0.0353, 0.051)
                textbox_frame.Position = UDim2.new(0, 10, 0, 25)
                textbox_frame.Size = UDim2.new(1, -20, 0, 30)
                textbox_frame.BorderSizePixel = 0
                textbox_frame.Parent = container
                
                local textbox_corner = Instance.new("UICorner")
                textbox_corner.CornerRadius = UDim.new(0, 4)
                textbox_corner.Parent = textbox_frame
                
                local textbox_stroke = Instance.new("UIStroke")
                textbox_stroke.Color = Color3.new(0.0667, 0.0667, 0.098)
                textbox_stroke.Parent = textbox_frame
                
                local input_box = Instance.new("TextBox")
                input_box.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold)
                input_box.TextColor3 = Color3.new(0.7, 0.7, 0.7)
                input_box.PlaceholderText = textbox.placeholder
                input_box.Text = ""
                input_box.BackgroundTransparency = 1
                input_box.Position = UDim2.new(0, 8, 0, 0)
                input_box.TextSize = 14
                input_box.Size = UDim2.new(1, -16, 1, 0)
                input_box.TextXAlignment = Enum.TextXAlignment.Left
                input_box.Parent = textbox_frame
                
                input_box.Changed:Connect(function(property)
                    if property == "Text" then
                        textbox.text = input_box.Text
                        textbox.callback(input_box.Text)
                    end
                end)
                
                input_box.Focused:Connect(function()
                    CreateTween(textbox_stroke, TweenInfo.new(0.2), {Color = Color3.new(0.475, 0.451, 0.918)}):Play()
                end)
                
                input_box.FocusLost:Connect(function()
                    CreateTween(textbox_stroke, TweenInfo.new(0.2), {Color = Color3.new(0.0667, 0.0667, 0.098)}):Play()
                end)
                
                table.insert(module.elements, textbox)
                return textbox
            end
            
            function module:create_paragraph(config)
                local paragraph = {}
                paragraph.title = config.title or "Info"
                paragraph.text = config.text or "Information text here."
                
                local container = Instance.new("Frame")
                container.BackgroundTransparency = 1
                container.Size = UDim2.new(1, 0, 0, 50)
                container.LayoutOrder = #module.elements + 3
                container.Parent = module_frame
                
                local title_label = Instance.new("TextLabel")
                title_label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
                title_label.TextColor3 = Color3.new(1, 1, 1)
                title_label.Text = paragraph.title
                title_label.BackgroundTransparency = 1
                title_label.Position = UDim2.new(0, 10, 0, 0)
                title_label.TextSize = 14
                title_label.Size = UDim2.new(1, 0, 0, 18)
                title_label.TextXAlignment = Enum.TextXAlignment.Left
                title_label.Parent = container
                
                local text_label = Instance.new("TextLabel")
                text_label.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold)
                text_label.TextColor3 = Color3.new(0.6, 0.6, 0.6)
                text_label.Text = paragraph.text
                text_label.BackgroundTransparency = 1
                text_label.Position = UDim2.new(0, 10, 0, 20)
                text_label.TextSize = 13
                text_label.Size = UDim2.new(1, -20, 0, 25)
                text_label.TextXAlignment = Enum.TextXAlignment.Left
                text_label.TextWrapped = true
                text_label.Parent = container
                
                table.insert(module.elements, paragraph)
                return paragraph
            end
            
            table.insert(tab.modules, module)
            return module
        end
        
        tab_button.MouseButton1Click:Connect(function()
            tab:activate()
        end)
        
        table.insert(self.tabs, tab)
        
        -- Activate first tab
        if #self.tabs == 1 then
            tab:activate()
        end
        
        return tab
    end
    
    function self:load()
        -- Auto-resize scroll frames
        spawn(function()
            while self.main_ui.Parent do
                wait(0.1)
                if self.left_scroll.UIListLayout then
                    self.left_scroll.CanvasSize = UDim2.new(0, 0, 0, self.left_scroll.UIListLayout.AbsoluteContentSize.Y + 20)
                end
                if self.right_scroll.UIListLayout then
                    self.right_scroll.CanvasSize = UDim2.new(0, 0, 0, self.right_scroll.UIListLayout.AbsoluteContentSize.Y + 20)
                end
            end
        end)
        
        -- Search functionality
        self.search_box.Changed:Connect(function(property)
            if property == "Text" then
                local query = self.search_box.Text:lower()
                if self.currentTab then
                    for _, module in pairs(self.currentTab.modules) do
                        local visible = query == "" or module.title:lower():find(query)
                        module.frame.Visible = visible
                    end
                end
            end
        end)
        
        print("UI Library loaded successfully!")
    end
    
    return self
end

-- Notification system
Library.SendNotification = SendNotification

return Library
