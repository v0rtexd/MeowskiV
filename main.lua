-- Anerial UI Library by v0rtexd & Lenny
-- Enhanced with functional components

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- UI Library
local Library = {}
Library.__index = Library

-- Configuration
local Config = {
    MainColor = Color3.fromRGB(121, 115, 234),
    BackgroundColor = Color3.fromRGB(5, 5, 8),
    SecondaryColor = Color3.fromRGB(23, 23, 57),
    TextColor = Color3.fromRGB(255, 255, 255),
    DescriptionColor = Color3.fromRGB(107, 107, 108)
}

-- Animation functions
local function CreateTween(obj, props, duration, style, direction)
    duration = duration or 0.3
    style = style or Enum.EasingStyle.Quad
    direction = direction or Enum.EasingDirection.Out
    
    local tween = TweenService:Create(obj, TweenInfo.new(duration, style, direction), props)
    tween:Play()
    return tween
end

-- Main Library Constructor
function Library:CreateWindow(title)
    local window = {}
    window.tabs = {}
    window.currentTab = nil
    
    -- Create main UI structure
    local main_UI = Instance.new("ScreenGui")
    main_UI.Name = "Anerial_UI"
    main_UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    main_UI.Parent = playerGui
    
    -- Minimized UI
    local minimized_ui = Instance.new("ScreenGui")
    minimized_ui.Name = "Minimized_UI"
    minimized_ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    minimized_ui.Parent = main_UI
    minimized_ui.Enabled = false
    
    -- Main frame
    local main = Instance.new("Frame")
    main.Name = "Main"
    main.BackgroundColor3 = Config.BackgroundColor
    main.Position = UDim2.new(0.5, -406, 0.5, -247)
    main.Size = UDim2.new(0, 813, 0, 494)
    main.Parent = main_UI
    
    local mainCorner = Instance.new("UICorner")
    mainCorner.Parent = main
    
    local mainStroke = Instance.new("UIStroke")
    mainStroke.Color = Color3.fromRGB(17, 17, 21)
    mainStroke.Parent = main
    
    -- Title
    local logo = Instance.new("TextLabel")
    logo.Name = "Logo"
    logo.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
    logo.TextColor3 = Config.TextColor
    logo.Text = title or "Anerial.cc"
    logo.BackgroundTransparency = 1
    logo.Position = UDim2.new(0.038, 0, 0.01, 0)
    logo.Size = UDim2.new(0, 170, 0, 45)
    logo.TextSize = 33
    logo.Parent = main
    
    -- Credits
    local credits = Instance.new("TextLabel")
    credits.Name = "Credits"
    credits.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
    credits.TextColor3 = Config.DescriptionColor
    credits.Text = "v0rtexd & Lenny"
    credits.BackgroundTransparency = 1
    credits.Position = UDim2.new(0.075, 0, 0.095, 0)
    credits.Size = UDim2.new(0, 108, 0, 18)
    credits.TextSize = 14
    credits.Parent = main
    
    -- Close button
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Text = "×"
    closeButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
    closeButton.TextColor3 = Color3.fromRGB(93, 93, 93)
    closeButton.BackgroundTransparency = 1
    closeButton.Position = UDim2.new(0.958, 0, 0.048, 0)
    closeButton.Size = UDim2.new(0, 18, 0, 20)
    closeButton.TextSize = 18
    closeButton.Parent = main
    
    -- Minimize button
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Name = "MinimizeButton"
    minimizeButton.Text = "−"
    minimizeButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
    minimizeButton.TextColor3 = Color3.fromRGB(93, 93, 93)
    minimizeButton.BackgroundTransparency = 1
    minimizeButton.Position = UDim2.new(0.911, 0, 0.048, 0)
    minimizeButton.Size = UDim2.new(0, 15, 0, 15)
    minimizeButton.TextSize = 16
    minimizeButton.Parent = main
    
    -- Tabs system
    local tabsFrame = Instance.new("Frame")
    tabsFrame.Name = "TabsSystem"
    tabsFrame.BackgroundTransparency = 1
    tabsFrame.Position = UDim2.new(0.01, 0, 0.131, 0)
    tabsFrame.Size = UDim2.new(0, 211, 0, 387)
    tabsFrame.Parent = main
    
    -- Content area
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.BackgroundTransparency = 1
    contentFrame.Position = UDim2.new(0.31, 0, 0.174, 0)
    contentFrame.Size = UDim2.new(0, 550, 0, 360)
    contentFrame.Parent = main
    
    -- Separator
    local separator = Instance.new("Frame")
    separator.Name = "Separator"
    separator.BackgroundColor3 = Color3.fromRGB(20, 20, 29)
    separator.Position = UDim2.new(0.309, 0, 0, 0)
    separator.Size = UDim2.new(0, 1, 0, 494)
    separator.BorderSizePixel = 0
    separator.Parent = main
    
    -- Search bar
    local searchBar = Instance.new("Frame")
    searchBar.Name = "SearchBar"
    searchBar.BackgroundColor3 = Color3.fromRGB(9, 9, 13)
    searchBar.Position = UDim2.new(0.329, 0, 0.048, 0)
    searchBar.Size = UDim2.new(0, 115, 0, 27)
    searchBar.Parent = main
    
    local searchCorner = Instance.new("UICorner")
    searchCorner.CornerRadius = UDim.new(0, 9)
    searchCorner.Parent = searchBar
    
    local searchStroke = Instance.new("UIStroke")
    searchStroke.Color = Color3.fromRGB(17, 17, 25)
    searchStroke.Parent = searchBar
    
    local searchBox = Instance.new("TextBox")
    searchBox.Name = "SearchBox"
    searchBox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold)
    searchBox.TextColor3 = Color3.fromRGB(100, 100, 100)
    searchBox.PlaceholderText = "Search..."
    searchBox.Text = ""
    searchBox.BackgroundTransparency = 1
    searchBox.Position = UDim2.new(0.1, 0, 0, 0)
    searchBox.Size = UDim2.new(0.7, 0, 1, 0)
    searchBox.TextSize = 14
    searchBox.Parent = searchBar
    
    -- Player info
    local playerInfo = Instance.new("Frame")
    playerInfo.Name = "PlayerInfo"
    playerInfo.BackgroundTransparency = 1
    playerInfo.Position = UDim2.new(0.04, 0, 0.89, 0)
    playerInfo.Size = UDim2.new(0, 190, 0, 40)
    playerInfo.Parent = main
    
    local playerImage = Instance.new("ImageLabel")
    playerImage.Name = "PlayerImage"
    playerImage.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    playerImage.BackgroundTransparency = 1
    playerImage.Size = UDim2.new(0, 40, 0, 40)
    playerImage.Parent = playerInfo
    
    local playerImageCorner = Instance.new("UICorner")
    playerImageCorner.CornerRadius = UDim.new(1, 0)
    playerImageCorner.Parent = playerImage
    
    local welcomeText = Instance.new("TextLabel")
    welcomeText.Name = "WelcomeText"
    welcomeText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
    welcomeText.TextColor3 = Config.TextColor
    welcomeText.Text = "Welcome " .. player.Name
    welcomeText.BackgroundTransparency = 1
    welcomeText.Position = UDim2.new(0, 50, 0, 10)
    welcomeText.Size = UDim2.new(0, 130, 0, 20)
    welcomeText.TextSize = 16
    welcomeText.TextXAlignment = Enum.TextXAlignment.Left
    welcomeText.Parent = playerInfo
    
    -- Minimized UI elements
    local minimizedFrame = Instance.new("Frame")
    minimizedFrame.Name = "MinimizedFrame"
    minimizedFrame.BackgroundColor3 = Config.BackgroundColor
    minimizedFrame.Position = UDim2.new(0.459, 0, 0.029, 0)
    minimizedFrame.Size = UDim2.new(0, 120, 0, 31)
    minimizedFrame.Parent = minimized_ui
    
    local minimizedCorner = Instance.new("UICorner")
    minimizedCorner.CornerRadius = UDim.new(0, 4)
    minimizedCorner.Parent = minimizedFrame
    
    local minimizedStroke = Instance.new("UIStroke")
    minimizedStroke.Color = Color3.fromRGB(17, 17, 21)
    minimizedStroke.Parent = minimizedFrame
    
    local restoreButton = Instance.new("TextButton")
    restoreButton.Name = "RestoreButton"
    restoreButton.Text = ""
    restoreButton.BackgroundTransparency = 1
    restoreButton.Size = UDim2.new(1, 0, 1, 0)
    restoreButton.Parent = minimizedFrame
    
    local minimizedText = Instance.new("TextLabel")
    minimizedText.Name = "MinimizedText"
    minimizedText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
    minimizedText.TextColor3 = Config.TextColor
    minimizedText.Text = title or "Anerial.cc"
    minimizedText.BackgroundTransparency = 1
    minimizedText.Position = UDim2.new(0.35, 0, 0.13, 0)
    minimizedText.Size = UDim2.new(0, 69, 0, 21)
    minimizedText.TextSize = 13
    minimizedText.Parent = minimizedFrame
    
    -- Button connections
    closeButton.MouseButton1Click:Connect(function()
        main_UI:Destroy()
    end)
    
    minimizeButton.MouseButton1Click:Connect(function()
        main_UI.Enabled = false
        minimized_ui.Enabled = true
    end)
    
    restoreButton.MouseButton1Click:Connect(function()
        main_UI.Enabled = true
        minimized_ui.Enabled = false
    end)
    
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
    
    -- Tab creation function
    function window:CreateTab(name, icon)
        local tab = {}
        tab.name = name
        tab.elements = {}
        tab.visible = false
        
        -- Tab button
        local tabButton = Instance.new("Frame")
        tabButton.Name = name .. "Tab"
        tabButton.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
        tabButton.BackgroundTransparency = 1
        tabButton.Position = UDim2.new(0.06, 0, 0, #window.tabs * 50)
        tabButton.Size = UDim2.new(0, 162, 0, 34)
        tabButton.Parent = tabsFrame
        
        local tabCorner = Instance.new("UICorner")
        tabCorner.CornerRadius = UDim.new(0, 9)
        tabCorner.Parent = tabButton
        
        local tabClickButton = Instance.new("TextButton")
        tabClickButton.Name = "ClickButton"
        tabClickButton.Text = ""
        tabClickButton.BackgroundTransparency = 1
        tabClickButton.Size = UDim2.new(1, 0, 1, 0)
        tabClickButton.Parent = tabButton
        
        local tabIcon = Instance.new("ImageLabel")
        tabIcon.Name = "TabIcon"
        tabIcon.Image = icon or "rbxassetid://10747830374"
        tabIcon.ImageColor3 = Config.TextColor
        tabIcon.BackgroundTransparency = 1
        tabIcon.Position = UDim2.new(0.047, 0, 0.18, 0)
        tabIcon.Size = UDim2.new(0, 20, 0, 20)
        tabIcon.Parent = tabButton
        
        local tabLabel = Instance.new("TextLabel")
        tabLabel.Name = "TabLabel"
        tabLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
        tabLabel.TextColor3 = Config.TextColor
        tabLabel.Text = name
        tabLabel.BackgroundTransparency = 1
        tabLabel.Position = UDim2.new(0.185, 0, 0.18, 0)
        tabLabel.Size = UDim2.new(0, 78, 0, 21)
        tabLabel.TextSize = 16
        tabLabel.TextXAlignment = Enum.TextXAlignment.Left
        tabLabel.Parent = tabButton
        
        -- Tab content frame
        local tabContent = Instance.new("ScrollingFrame")
        tabContent.Name = name .. "Content"
        tabContent.BackgroundTransparency = 1
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        tabContent.ScrollBarThickness = 4
        tabContent.ScrollBarImageColor3 = Config.MainColor
        tabContent.Parent = contentFrame
        tabContent.Visible = false
        
        -- Auto-resize canvas
        local function updateCanvasSize()
            local contentSize = 0
            for _, child in pairs(tabContent:GetChildren()) do
                if child:IsA("GuiObject") and child.Visible then
                    contentSize = contentSize + child.AbsoluteSize.Y + 10
                end
            end
            tabContent.CanvasSize = UDim2.new(0, 0, 0, contentSize + 20)
        end
        
        tabContent.ChildAdded:Connect(updateCanvasSize)
        tabContent.ChildRemoved:Connect(updateCanvasSize)
        
        -- Tab selection logic
        local function selectTab()
            -- Deselect all tabs
            for _, otherTab in pairs(window.tabs) do
                otherTab.button.BackgroundTransparency = 1
                otherTab.content.Visible = false
                otherTab.icon.ImageColor3 = Config.TextColor
                otherTab.label.TextColor3 = Config.TextColor
            end
            
            -- Select this tab
            CreateTween(tabButton, {BackgroundTransparency = 0}, 0.2)
            tabContent.Visible = true
            CreateTween(tabIcon, {ImageColor3 = Config.MainColor}, 0.2)
            CreateTween(tabLabel, {TextColor3 = Config.MainColor}, 0.2)
            
            window.currentTab = tab
        end
        
        tabClickButton.MouseButton1Click:Connect(selectTab)
        
        -- Store references
        tab.button = tabButton
        tab.content = tabContent
        tab.icon = tabIcon
        tab.label = tabLabel
        tab.updateCanvas = updateCanvasSize
        
        -- Element creation functions
        function tab:CreateToggle(options)
            options = options or {}
            local name = options.Name or "Toggle"
            local description = options.Description or "Description"
            local default = options.Default or false
            local callback = options.Callback or function() end
            
            local toggleFrame = Instance.new("Frame")
            toggleFrame.Name = name .. "Toggle"
            toggleFrame.BackgroundColor3 = Config.BackgroundColor
            toggleFrame.Position = UDim2.new(0, 10, 0, #tab.elements * 80 + 10)
            toggleFrame.Size = UDim2.new(1, -20, 0, 70)
            toggleFrame.Parent = tabContent
            
            local toggleCorner = Instance.new("UICorner")
            toggleCorner.Parent = toggleFrame
            
            local toggleStroke = Instance.new("UIStroke")
            toggleStroke.Color = Color3.fromRGB(23, 23, 29)
            toggleStroke.Parent = toggleFrame
            
            local toggleLabel = Instance.new("TextLabel")
            toggleLabel.Name = "Label"
            toggleLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
            toggleLabel.TextColor3 = Config.TextColor
            toggleLabel.Text = name
            toggleLabel.BackgroundTransparency = 1
            toggleLabel.Position = UDim2.new(0, 15, 0, 10)
            toggleLabel.Size = UDim2.new(0, 200, 0, 21)
            toggleLabel.TextSize = 15
            toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            toggleLabel.Parent = toggleFrame
            
            local toggleDesc = Instance.new("TextLabel")
            toggleDesc.Name = "Description"
            toggleDesc.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold)
            toggleDesc.TextColor3 = Config.DescriptionColor
            toggleDesc.Text = description
            toggleDesc.BackgroundTransparency = 1
            toggleDesc.Position = UDim2.new(0, 15, 0, 35)
            toggleDesc.Size = UDim2.new(0, 200, 0, 20)
            toggleDesc.TextSize = 15
            toggleDesc.TextXAlignment = Enum.TextXAlignment.Left
            toggleDesc.Parent = toggleFrame
            
            local toggleButton = Instance.new("Frame")
            toggleButton.Name = "ToggleButton"
            toggleButton.BackgroundColor3 = default and Config.MainColor or Color3.fromRGB(23, 22, 32)
            toggleButton.Position = UDim2.new(1, -60, 0, 25)
            toggleButton.Size = UDim2.new(0, 36, 0, 20)
            toggleButton.Parent = toggleFrame
            
            local toggleButtonCorner = Instance.new("UICorner")
            toggleButtonCorner.CornerRadius = UDim.new(0, 9)
            toggleButtonCorner.Parent = toggleButton
            
            local toggleSwitch = Instance.new("Frame")
            toggleSwitch.Name = "Switch"
            toggleSwitch.BackgroundColor3 = Config.TextColor
            toggleSwitch.Position = default and UDim2.new(0, 18, 0, 5) or UDim2.new(0, 6, 0, 5)
            toggleSwitch.Size = UDim2.new(0, 10, 0, 10)
            toggleSwitch.Parent = toggleButton
            
            local toggleSwitchCorner = Instance.new("UICorner")
            toggleSwitchCorner.Parent = toggleSwitch
            
            local clickButton = Instance.new("TextButton")
            clickButton.Name = "ClickButton"
            clickButton.Text = ""
            clickButton.BackgroundTransparency = 1
            clickButton.Size = UDim2.new(1, 0, 1, 0)
            clickButton.Parent = toggleFrame
            
            local toggled = default
            
            clickButton.MouseButton1Click:Connect(function()
                toggled = not toggled
                
                CreateTween(toggleButton, {
                    BackgroundColor3 = toggled and Config.MainColor or Color3.fromRGB(23, 22, 32)
                }, 0.2)
                
                CreateTween(toggleSwitch, {
                    Position = toggled and UDim2.new(0, 18, 0, 5) or UDim2.new(0, 6, 0, 5)
                }, 0.2)
                
                callback(toggled)
            end)
            
            table.insert(tab.elements, {type = "toggle", frame = toggleFrame, value = toggled})
            tab.updateCanvas()
            
            return {
                SetValue = function(value)
                    toggled = value
                    CreateTween(toggleButton, {
                        BackgroundColor3 = toggled and Config.MainColor or Color3.fromRGB(23, 22, 32)
                    }, 0.2)
                    
                    CreateTween(toggleSwitch, {
                        Position = toggled and UDim2.new(0, 18, 0, 5) or UDim2.new(0, 6, 0, 5)
                    }, 0.2)
                end
            }
        end
        
        function tab:CreateSlider(options)
            options = options or {}
            local name = options.Name or "Slider"
            local description = options.Description or "Description"
            local min = options.Min or 0
            local max = options.Max or 100
            local default = options.Default or min
            local callback = options.Callback or function() end
            
            local sliderFrame = Instance.new("Frame")
            sliderFrame.Name = name .. "Slider"
            sliderFrame.BackgroundColor3 = Config.BackgroundColor
            sliderFrame.Position = UDim2.new(0, 10, 0, #tab.elements * 80 + 10)
            sliderFrame.Size = UDim2.new(1, -20, 0, 70)
            sliderFrame.Parent = tabContent
            
            local sliderCorner = Instance.new("UICorner")
            sliderCorner.Parent = sliderFrame
            
            local sliderStroke = Instance.new("UIStroke")
            sliderStroke.Color = Color3.fromRGB(23, 23, 29)
            sliderStroke.Parent = sliderFrame
            
            local sliderLabel = Instance.new("TextLabel")
            sliderLabel.Name = "Label"
            sliderLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
            sliderLabel.TextColor3 = Config.TextColor
            sliderLabel.Text = name
            sliderLabel.BackgroundTransparency = 1
            sliderLabel.Position = UDim2.new(0, 15, 0, 5)
            sliderLabel.Size = UDim2.new(0, 200, 0, 21)
            sliderLabel.TextSize = 15
            sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
            sliderLabel.Parent = sliderFrame
            
            local sliderDesc = Instance.new("TextLabel")
            sliderDesc.Name = "Description"
            sliderDesc.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold)
            sliderDesc.TextColor3 = Config.DescriptionColor
            sliderDesc.Text = description
            sliderDesc.BackgroundTransparency = 1
            sliderDesc.Position = UDim2.new(0, 15, 0, 25)
            sliderDesc.Size = UDim2.new(0, 200, 0, 17)
            sliderDesc.TextSize = 15
            sliderDesc.TextXAlignment = Enum.TextXAlignment.Left
            sliderDesc.Parent = sliderFrame
            
            local sliderValue = Instance.new("TextLabel")
            sliderValue.Name = "Value"
            sliderValue.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
            sliderValue.TextColor3 = Config.TextColor
            sliderValue.Text = tostring(default)
            sliderValue.BackgroundTransparency = 1
            sliderValue.Position = UDim2.new(1, -80, 0, 5)
            sliderValue.Size = UDim2.new(0, 65, 0, 21)
            sliderValue.TextSize = 14
            sliderValue.TextXAlignment = Enum.TextXAlignment.Right
            sliderValue.Parent = sliderFrame
            
            local sliderTrack = Instance.new("Frame")
            sliderTrack.Name = "Track"
            sliderTrack.BackgroundColor3 = Color3.fromRGB(23, 22, 32)
            sliderTrack.Position = UDim2.new(0, 15, 0, 50)
            sliderTrack.Size = UDim2.new(1, -30, 0, 7)
            sliderTrack.Parent = sliderFrame
            
            local sliderTrackCorner = Instance.new("UICorner")
            sliderTrackCorner.CornerRadius = UDim.new(0, 3)
            sliderTrackCorner.Parent = sliderTrack
            
            local sliderFill = Instance.new("Frame")
            sliderFill.Name = "Fill"
            sliderFill.BackgroundColor3 = Config.MainColor
            sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
            sliderFill.Parent = sliderTrack
            
            local sliderFillCorner = Instance.new("UICorner")
            sliderFillCorner.CornerRadius = UDim.new(0, 3)
            sliderFillCorner.Parent = sliderFill
            
            local sliderHandle = Instance.new("Frame")
            sliderHandle.Name = "Handle"
            sliderHandle.BackgroundColor3 = Config.TextColor
            sliderHandle.Position = UDim2.new((default - min) / (max - min), -5, 0, -2)
            sliderHandle.Size = UDim2.new(0, 11, 0, 11)
            sliderHandle.Parent = sliderTrack
            
            local sliderHandleCorner = Instance.new("UICorner")
            sliderHandleCorner.CornerRadius = UDim.new(0, 3)
            sliderHandleCorner.Parent = sliderHandle
            
            local currentValue = default
            local dragging = false
            
            local function updateSlider(value)
                currentValue = math.clamp(value, min, max)
                local percentage = (currentValue - min) / (max - min)
                
                CreateTween(sliderFill, {Size = UDim2.new(percentage, 0, 1, 0)}, 0.1)
                CreateTween(sliderHandle, {Position = UDim2.new(percentage, -5, 0, -2)}, 0.1)
                
                sliderValue.Text = tostring(math.floor(currentValue))
                callback(currentValue)
            end
            
            sliderTrack.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                    local percentage = math.clamp((input.Position.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X, 0, 1)
                    local value = min + (max - min) * percentage
                    updateSlider(value)
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local percentage = math.clamp((input.Position.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X, 0, 1)
                    local value = min + (max - min) * percentage
                    updateSlider(value)
                end
            end)
            
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            
            table.insert(tab.elements, {type = "slider", frame = sliderFrame, value = currentValue})
            tab.updateCanvas()
            
            return {
                SetValue = function(value)
                    updateSlider(value)
                end
            }
        end
        
        function tab:CreateDropdown(options)
            options = options or {}
            local name = options.Name or "Dropdown"
            local description = options.Description or "Description"
            local list = options.List or {"Option 1", "Option 2", "Option 3"}
            local default = options.Default or list[1]
            local callback = options.Callback or function() end
            
            local dropdownFrame = Instance.new("Frame")
            dropdownFrame.Name = name .. "Dropdown"
            dropdownFrame.BackgroundColor3 = Config.BackgroundColor
            dropdownFrame.Position = UDim2.new(0, 10, 0, #tab.elements * 80 + 10)
            dropdownFrame.Size = UDim2.new(1, -20, 0, 70)
            dropdownFrame.Parent = tabContent
            
            local dropdownCorner = Instance.new("UICorner")
            dropdownCorner.Parent = dropdownFrame
            
            local dropdownStroke = Instance.new("UIStroke")
            dropdownStroke.Color = Color3.fromRGB(23, 23, 29)
            dropdownStroke.Parent = dropdownFrame
            
            local dropdownLabel = Instance.new("TextLabel")
            dropdownLabel.Name = "Label"
            dropdownLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
            dropdownLabel.TextColor3 = Config.TextColor
            dropdownLabel.Text = name
            dropdownLabel.BackgroundTransparency = 1
            dropdownLabel.Position = UDim2.new(0, 15, 0, 10)
            dropdownLabel.Size = UDim2.new(0, 200, 0, 21)
            dropdownLabel.TextSize = 15
            dropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
            dropdownLabel.Parent = dropdownFrame
            
            local dropdownDesc = Instance.new("TextLabel")
            dropdownDesc.Name = "Description"
            dropdownDesc.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold)
            dropdownDesc.TextColor3 = Config.DescriptionColor
            dropdownDesc.Text = description
            dropdownDesc.BackgroundTransparency = 1
            dropdownDesc.Position = UDim2.new(0, 15, 0, 35)
            dropdownDesc.Size = UDim2.new(0, 200, 0, 17)
            dropdownDesc.TextSize = 15
            dropdownDesc.TextXAlignment = Enum.TextXAlignment.Left
            dropdownDesc.Parent = dropdownFrame
            
            local dropdownButton = Instance.new("Frame")
            dropdownButton.Name = "DropdownButton"
            dropdownButton.BackgroundColor3 = Color3.fromRGB(16, 15, 22)
            dropdownButton.Position = UDim2.new(1, -120, 0, 15)
            dropdownButton.Size = UDim2.new(0, 100, 0, 29)
            dropdownButton.Parent = dropdownFrame
            
            local dropdownButtonCorner = Instance.new("UICorner")
            dropdownButtonCorner.CornerRadius = UDim.new(0, 4)
            dropdownButtonCorner.Parent = dropdownButton
            
            local dropdownButtonStroke = Instance.new("UIStroke")
            dropdownButtonStroke.Color = Color3.fromRGB(22, 22, 22)
            dropdownButtonStroke.Parent = dropdownButton
            
            local dropdownText = Instance.new("TextLabel")
            dropdownText.Name = "Text"
            dropdownText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
            dropdownText.TextColor3 = Color3.fromRGB(204, 204, 204)
            dropdownText.Text = default
            dropdownText.BackgroundTransparency = 1
            dropdownText.Position = UDim2.new(0, 10, 0, 0)
            dropdownText.Size = UDim2.new(1, -25, 1, 0)
            dropdownText.TextSize = 12
            dropdownText.TextXAlignment = Enum.TextXAlignment.Left
            dropdownText.Parent = dropdownButton
            
            local dropdownArrow = Instance.new("ImageLabel")
            dropdownArrow.Name = "Arrow"
            dropdownArrow.Image = "rbxassetid://10709790948"
            dropdownArrow.BackgroundTransparency = 1
            dropdownArrow.Position = UDim2.new(1, -20, 0, 7)
            dropdownArrow.Size = UDim2.new(0, 15, 0, 15)
            dropdownArrow.Parent = dropdownButton
            
            local dropdownClick = Instance.new("TextButton")
            dropdownClick.Name = "Click"
            dropdownClick.Text = ""
            dropdownClick.BackgroundTransparency = 1
            dropdownClick.Size = UDim2.new(1, 0, 1, 0)
            dropdownClick.Parent = dropdownButton
            
            local dropdownList = Instance.new("Frame")
            dropdownList.Name = "DropdownList"
            dropdownList.BackgroundColor3 = Color3.fromRGB(16, 15, 22)
            dropdownList.Position = UDim2.new(0, 0, 1, 5)
            dropdownList.Size = UDim2.new(1, 0, 0, #list * 24 + 10)
            dropdownList.Parent = dropdownButton
            dropdownList.Visible = false
            dropdownList.ZIndex = 10
            
            local dropdownListCorner = Instance.new("UICorner")
            dropdownListCorner.CornerRadius = UDim.new(0, 4)
            dropdownListCorner.Parent = dropdownList
            
            local dropdownListStroke = Instance.new("UIStroke")
            dropdownListStroke.Color = Color3.fromRGB(22, 22, 22)
            dropdownListStroke.Parent = dropdownList
            
            local currentValue = default
            local isOpen = false
            
            -- Create options
            for i, option in ipairs(list) do
                local optionFrame = Instance.new("TextButton")
                optionFrame.Name = "Option" .. i
                optionFrame.Text = ""
                optionFrame.BackgroundTransparency = 1
                optionFrame.Position = UDim2.new(0, 5, 0, (i-1) * 24 + 5)
                optionFrame.Size = UDim2.new(1, -10, 0, 24)
                optionFrame.Parent = dropdownList
                
                local optionLabel = Instance.new("TextLabel")
                optionLabel.Name = "Label"
                optionLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
                optionLabel.TextColor3 = Color3.fromRGB(127, 127, 127)
                optionLabel.Text = option
                optionLabel.BackgroundTransparency = 1
                optionLabel.Size = UDim2.new(1, 0, 1, 0)
                optionLabel.TextSize = 12
                optionLabel.TextXAlignment = Enum.TextXAlignment.Left
                optionLabel.Parent = optionFrame
                
                optionFrame.MouseButton1Click:Connect(function()
                    currentValue = option
                    dropdownText.Text = option
                    dropdownList.Visible = false
                    isOpen = false
                    CreateTween(dropdownArrow, {Rotation = 0}, 0.2)
                    callback(option)
                end)
                
                optionFrame.MouseEnter:Connect(function()
                    CreateTween(optionLabel, {TextColor3 = Config.TextColor}, 0.1)
                end)
                
                optionFrame.MouseLeave:Connect(function()
                    if option ~= currentValue then
                        CreateTween(optionLabel, {TextColor3 = Color3.fromRGB(127, 127, 127)}, 0.1)
                    end
                end)
            end
            
            dropdownClick.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                dropdownList.Visible = isOpen
                CreateTween(dropdownArrow, {Rotation = isOpen and 180 or 0}, 0.2)
            end)
            
            table.insert(tab.elements, {type = "dropdown", frame = dropdownFrame, value = currentValue})
            tab.updateCanvas()
            
            return {
                SetValue = function(value)
                    if table.find(list, value) then
                        currentValue = value
                        dropdownText.Text = value
                    end
                end
            }
        end
        
        function tab:CreateColorPicker(options)
            options = options or {}
            local name = options.Name or "Color"
            local description = options.Description or "Description"
            local default = options.Default or Color3.fromRGB(165, 43, 165)
            local callback = options.Callback or function() end
            
            local colorFrame = Instance.new("Frame")
            colorFrame.Name = name .. "Color"
            colorFrame.BackgroundColor3 = Config.BackgroundColor
            colorFrame.Position = UDim2.new(0, 10, 0, #tab.elements * 80 + 10)
            colorFrame.Size = UDim2.new(1, -20, 0, 70)
            colorFrame.Parent = tabContent
            
            local colorCorner = Instance.new("UICorner")
            colorCorner.Parent = colorFrame
            
            local colorStroke = Instance.new("UIStroke")
            colorStroke.Color = Color3.fromRGB(23, 23, 29)
            colorStroke.Parent = colorFrame
            
            local colorLabel = Instance.new("TextLabel")
            colorLabel.Name = "Label"
            colorLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
            colorLabel.TextColor3 = Config.TextColor
            colorLabel.Text = name
            colorLabel.BackgroundTransparency = 1
            colorLabel.Position = UDim2.new(0, 15, 0, 10)
            colorLabel.Size = UDim2.new(0, 200, 0, 21)
            colorLabel.TextSize = 15
            colorLabel.TextXAlignment = Enum.TextXAlignment.Left
            colorLabel.Parent = colorFrame
            
            local colorDesc = Instance.new("TextLabel")
            colorDesc.Name = "Description"
            colorDesc.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold)
            colorDesc.TextColor3 = Config.DescriptionColor
            colorDesc.Text = description
            colorDesc.BackgroundTransparency = 1
            colorDesc.Position = UDim2.new(0, 15, 0, 35)
            colorDesc.Size = UDim2.new(0, 200, 0, 17)
            colorDesc.TextSize = 15
            colorDesc.TextXAlignment = Enum.TextXAlignment.Left
            colorDesc.Parent = colorFrame
            
            local colorButton = Instance.new("Frame")
            colorButton.Name = "ColorButton"
            colorButton.BackgroundColor3 = default
            colorButton.Position = UDim2.new(1, -50, 0, 18)
            colorButton.Size = UDim2.new(0, 35, 0, 35)
            colorButton.Parent = colorFrame
            
            local colorButtonCorner = Instance.new("UICorner")
            colorButtonCorner.CornerRadius = UDim.new(0, 5)
            colorButtonCorner.Parent = colorButton
            
            local colorClick = Instance.new("TextButton")
            colorClick.Name = "Click"
            colorClick.Text = ""
            colorClick.BackgroundTransparency = 1
            colorClick.Size = UDim2.new(1, 0, 1, 0)
            colorClick.Parent = colorButton
            
            local currentColor = default
            
            colorClick.MouseButton1Click:Connect(function()
                -- Simple color cycling for demonstration
                local colors = {
                    Color3.fromRGB(165, 43, 165),
                    Color3.fromRGB(121, 115, 234),
                    Color3.fromRGB(234, 115, 115),
                    Color3.fromRGB(115, 234, 115),
                    Color3.fromRGB(234, 234, 115),
                    Color3.fromRGB(115, 234, 234)
                }
                
                local currentIndex = 1
                for i, color in ipairs(colors) do
                    if color == currentColor then
                        currentIndex = i
                        break
                    end
                end
                
                currentIndex = currentIndex + 1
                if currentIndex > #colors then currentIndex = 1 end
                
                currentColor = colors[currentIndex]
                CreateTween(colorButton, {BackgroundColor3 = currentColor}, 0.2)
                callback(currentColor)
            end)
            
            table.insert(tab.elements, {type = "colorpicker", frame = colorFrame, value = currentColor})
            tab.updateCanvas()
            
            return {
                SetValue = function(color)
                    currentColor = color
                    CreateTween(colorButton, {BackgroundColor3 = color}, 0.2)
                end
            }
        end
        
        function tab:CreateTextbox(options)
            options = options or {}
            local name = options.Name or "Textbox"
            local description = options.Description or "Description"
            local placeholder = options.PlaceholderText or "Enter text..."
            local default = options.Default or ""
            local callback = options.Callback or function() end
            
            local textboxFrame = Instance.new("Frame")
            textboxFrame.Name = name .. "Textbox"
            textboxFrame.BackgroundColor3 = Config.BackgroundColor
            textboxFrame.Position = UDim2.new(0, 10, 0, #tab.elements * 80 + 10)
            textboxFrame.Size = UDim2.new(1, -20, 0, 70)
            textboxFrame.Parent = tabContent
            
            local textboxCorner = Instance.new("UICorner")
            textboxCorner.Parent = textboxFrame
            
            local textboxStroke = Instance.new("UIStroke")
            textboxStroke.Color = Color3.fromRGB(23, 23, 29)
            textboxStroke.Parent = textboxFrame
            
            local textboxLabel = Instance.new("TextLabel")
            textboxLabel.Name = "Label"
            textboxLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
            textboxLabel.TextColor3 = Config.TextColor
            textboxLabel.Text = name
            textboxLabel.BackgroundTransparency = 1
            textboxLabel.Position = UDim2.new(0, 15, 0, 10)
            textboxLabel.Size = UDim2.new(0, 200, 0, 21)
            textboxLabel.TextSize = 15
            textboxLabel.TextXAlignment = Enum.TextXAlignment.Left
            textboxLabel.Parent = textboxFrame
            
            local textboxDesc = Instance.new("TextLabel")
            textboxDesc.Name = "Description"
            textboxDesc.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold)
            textboxDesc.TextColor3 = Config.DescriptionColor
            textboxDesc.Text = description
            textboxDesc.BackgroundTransparency = 1
            textboxDesc.Position = UDim2.new(0, 15, 0, 30)
            textboxDesc.Size = UDim2.new(0, 200, 0, 17)
            textboxDesc.TextSize = 15
            textboxDesc.TextXAlignment = Enum.TextXAlignment.Left
            textboxDesc.Parent = textboxFrame
            
            local textboxInput = Instance.new("TextBox")
            textboxInput.Name = "Input"
            textboxInput.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
            textboxInput.TextColor3 = Config.TextColor
            textboxInput.PlaceholderText = placeholder
            textboxInput.Text = default
            textboxInput.BackgroundColor3 = Color3.fromRGB(16, 15, 22)
            textboxInput.Position = UDim2.new(1, -150, 0, 20)
            textboxInput.Size = UDim2.new(0, 130, 0, 25)
            textboxInput.TextSize = 14
            textboxInput.Parent = textboxFrame
            
            local textboxInputCorner = Instance.new("UICorner")
            textboxInputCorner.CornerRadius = UDim.new(0, 4)
            textboxInputCorner.Parent = textboxInput
            
            local textboxInputStroke = Instance.new("UIStroke")
            textboxInputStroke.Color = Color3.fromRGB(22, 22, 22)
            textboxInputStroke.Parent = textboxInput
            
            textboxInput.FocusLost:Connect(function()
                callback(textboxInput.Text)
            end)
            
            table.insert(tab.elements, {type = "textbox", frame = textboxFrame, value = textboxInput.Text})
            tab.updateCanvas()
            
            return {
                SetValue = function(text)
                    textboxInput.Text = text
                end
            }
        end
        
        table.insert(window.tabs, tab)
        
        -- Select first tab automatically
        if #window.tabs == 1 then
            selectTab()
        end
        
        return tab
    end
    
    return window
end

return Library
