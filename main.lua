-- Enhanced UI Library with Functional Components
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create main UI structure
local main_UI = Instance.new("ScreenGui")
main_UI.Name = "Main UI"
main_UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main_UI.Parent = playerGui

local minimized_ui = Instance.new("ScreenGui")
minimized_ui.Name = "Minimized ui"
minimized_ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
minimized_ui.Parent = main_UI

-- Minimized UI components
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
anerial_cc.BackgroundColor3 = Color3.new(1, 1, 1)
anerial_cc.BackgroundTransparency = 1
anerial_cc.Position = UDim2.new(0.358, 0, 0.133, 0)
anerial_cc.BorderSizePixel = 0
anerial_cc.BorderColor3 = Color3.new()
anerial_cc.TextSize = 13
anerial_cc.Size = UDim2.new(0, 69, 0, 21)
anerial_cc.Parent = minimized_ui_cro

local uIGradient = Instance.new("UIGradient")
uIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
    ColorSequenceKeypoint.new(1, Color3.new(0.392, 0.392, 0.392))
})
uIGradient.Parent = anerial_cc

local frame = Instance.new("Frame")
frame.BackgroundColor3 = Color3.new(0.176, 0.176, 0.224)
frame.Position = UDim2.new(0.298, 0, 0.133, 0)
frame.BorderColor3 = Color3.new()
frame.BorderSizePixel = 0
frame.Size = UDim2.new(0, 1, 0, 23)
frame.Parent = minimized_ui_cro

-- Main UI Frame
local main = Instance.new("Frame")
main.Name = "main"
main.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
main.Position = UDim2.new(0.227, 0, 0.198, 0)
main.BorderColor3 = Color3.new()
main.BorderSizePixel = 0
main.Size = UDim2.new(0, 813, 0, 494)
main.Parent = main_UI

-- UI State Variables
local isMinimized = false

-- Animation tweens
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- Add all your existing UI elements here (keeping your original structure)
-- I'll add the functional components below

-- Functional Slider Component
local function createSlider(parent, name, minValue, maxValue, defaultValue, callback)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Name = name .. "_slider_frame"
    sliderFrame.BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Size = UDim2.new(0, 234, 0, 7)
    sliderFrame.Parent = parent
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 3)
    sliderCorner.Parent = sliderFrame
    
    local fillFrame = Instance.new("Frame")
    fillFrame.Name = name .. "_fill"
    fillFrame.BackgroundColor3 = Color3.new(0.475, 0.451, 0.918)
    fillFrame.BorderSizePixel = 0
    fillFrame.Size = UDim2.new(0.5, 0, 1, 0) -- Start at 50%
    fillFrame.Parent = sliderFrame
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 3)
    fillCorner.Parent = fillFrame
    
    local fillGradient = Instance.new("UIGradient")
    fillGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        ColorSequenceKeypoint.new(1, Color3.new(0.314, 0.314, 0.314))
    })
    fillGradient.Parent = fillFrame
    
    local sliderButton = Instance.new("Frame")
    sliderButton.Name = name .. "_button"
    sliderButton.BackgroundColor3 = Color3.new(1, 1, 1)
    sliderButton.Position = UDim2.new(0.5, -5, -0.5, 0)
    sliderButton.BorderSizePixel = 0
    sliderButton.Size = UDim2.new(0, 11, 0, 11)
    sliderButton.Parent = fillFrame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 3)
    buttonCorner.Parent = sliderButton
    
    local clickDetector = Instance.new("TextButton")
    clickDetector.Name = name .. "_detector"
    clickDetector.Text = ""
    clickDetector.BackgroundTransparency = 1
    clickDetector.Size = UDim2.new(1, 10, 1, 10)
    clickDetector.Position = UDim2.new(0, -5, 0, -5)
    clickDetector.Parent = sliderButton
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Name = name .. "_value"
    valueLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    valueLabel.TextColor3 = Color3.new(1, 1, 1)
    valueLabel.Text = tostring(defaultValue)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Position = UDim2.new(1.1, 0, -2, 0)
    valueLabel.Size = UDim2.new(0, 50, 0, 20)
    valueLabel.TextSize = 14
    valueLabel.Parent = sliderFrame
    
    -- Slider functionality
    local dragging = false
    local currentValue = defaultValue or ((minValue + maxValue) / 2)
    
    local function updateSlider(value)
        currentValue = math.clamp(value, minValue, maxValue)
        local percentage = (currentValue - minValue) / (maxValue - minValue)
        
        fillFrame.Size = UDim2.new(percentage, 0, 1, 0)
        valueLabel.Text = tostring(math.floor(currentValue))
        
        if callback then
            callback(currentValue)
        end
    end
    
    local function moveSlider(input)
        local relativeX = input.Position.X - sliderFrame.AbsolutePosition.X
        local percentage = math.clamp(relativeX / sliderFrame.AbsoluteSize.X, 0, 1)
        local value = minValue + (percentage * (maxValue - minValue))
        updateSlider(value)
    end
    
    clickDetector.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    sliderFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            moveSlider(input)
            dragging = true
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            moveSlider(input)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    -- Initialize slider
    updateSlider(currentValue)
    
    return {
        Frame = sliderFrame,
        GetValue = function() return currentValue end,
        SetValue = function(value) updateSlider(value) end
    }
end

-- Functional Toggle Component
local function createToggle(parent, name, defaultState, callback)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = name .. "_toggle"
    toggleFrame.BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.Size = UDim2.new(0, 36, 0, 20)
    toggleFrame.Parent = parent
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 9)
    toggleCorner.Parent = toggleFrame
    
    local switcherButton = Instance.new("Frame")
    switcherButton.Name = name .. "_switcher"
    switcherButton.BackgroundColor3 = Color3.new(1, 1, 1)
    switcherButton.Position = UDim2.new(0.167, 0, 0.25, 0)
    switcherButton.BorderSizePixel = 0
    switcherButton.Size = UDim2.new(0, 10, 0, 10)
    switcherButton.Parent = toggleFrame
    
    local switcherCorner = Instance.new("UICorner")
    switcherCorner.Parent = switcherButton
    
    local clickButton = Instance.new("TextButton")
    clickButton.Name = name .. "_click"
    clickButton.Text = ""
    clickButton.BackgroundTransparency = 1
    clickButton.Size = UDim2.new(1, 0, 1, 0)
    clickButton.Parent = toggleFrame
    
    local isEnabled = defaultState or false
    
    local function updateToggle(state)
        isEnabled = state
        local targetPos = isEnabled and UDim2.new(0.5, 0, 0.25, 0) or UDim2.new(0.167, 0, 0.25, 0)
        local targetColor = isEnabled and Color3.new(0.475, 0.451, 0.918) or Color3.new(0.0902, 0.0863, 0.125)
        
        local posTween = TweenService:Create(switcherButton, tweenInfo, {Position = targetPos})
        local colorTween = TweenService:Create(toggleFrame, tweenInfo, {BackgroundColor3 = targetColor})
        
        posTween:Play()
        colorTween:Play()
        
        if callback then
            callback(isEnabled)
        end
    end
    
    clickButton.MouseButton1Click:Connect(function()
        updateToggle(not isEnabled)
    end)
    
    -- Initialize toggle
    updateToggle(isEnabled)
    
    return {
        Frame = toggleFrame,
        GetState = function() return isEnabled end,
        SetState = function(state) updateToggle(state) end
    }
end

-- Functional Dropdown Component
local function createDropdown(parent, name, options, defaultOption, callback)
    local dropdownFrame = Instance.new("Frame")
    dropdownFrame.Name = name .. "_dropdown"
    dropdownFrame.BackgroundColor3 = Color3.new(0.0627, 0.0588, 0.0863)
    dropdownFrame.BorderSizePixel = 0
    dropdownFrame.Size = UDim2.new(0, 79, 0, 29)
    dropdownFrame.Parent = parent
    
    local dropdownCorner = Instance.new("UICorner")
    dropdownCorner.CornerRadius = UDim.new(0, 4)
    dropdownCorner.Parent = dropdownFrame
    
    local dropdownStroke = Instance.new("UIStroke")
    dropdownStroke.Color = Color3.new(0.0863, 0.0863, 0.0863)
    dropdownStroke.Parent = dropdownFrame
    
    local selectedLabel = Instance.new("TextLabel")
    selectedLabel.Name = name .. "_selected"
    selectedLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
    selectedLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    selectedLabel.Text = defaultOption or options[1] or "Select"
    selectedLabel.BackgroundTransparency = 1
    selectedLabel.Position = UDim2.new(0, 0, 0.07, 0)
    selectedLabel.Size = UDim2.new(0, 57, 0, 24)
    selectedLabel.TextSize = 12
    selectedLabel.Parent = dropdownFrame
    
    local arrowIcon = Instance.new("ImageLabel")
    arrowIcon.Name = name .. "_arrow"
    arrowIcon.Image = "rbxassetid://10709790948"
    arrowIcon.BackgroundTransparency = 1
    arrowIcon.Position = UDim2.new(0.722, 0, 0.241, 0)
    arrowIcon.Size = UDim2.new(0, 15, 0, 15)
    arrowIcon.Parent = dropdownFrame
    
    local clickButton = Instance.new("TextButton")
    clickButton.Name = name .. "_click"
    clickButton.Text = ""
    clickButton.BackgroundTransparency = 1
    clickButton.Size = UDim2.new(1, 0, 1, 0)
    clickButton.Parent = dropdownFrame
    
    local optionsList = Instance.new("Frame")
    optionsList.Name = name .. "_options"
    optionsList.BackgroundColor3 = Color3.new(0.0627, 0.0588, 0.0863)
    optionsList.Position = UDim2.new(0, 0, 1.1, 0)
    optionsList.BorderSizePixel = 0
    optionsList.Size = UDim2.new(1, 0, 0, #options * 25)
    optionsList.Visible = false
    optionsList.Parent = dropdownFrame
    
    local optionsCorner = Instance.new("UICorner")
    optionsCorner.CornerRadius = UDim.new(0, 4)
    optionsCorner.Parent = optionsList
    
    local optionsStroke = Instance.new("UIStroke")
    optionsStroke.Color = Color3.new(0.0863, 0.0863, 0.0863)
    optionsStroke.Parent = optionsList
    
    local isOpen = false
    local currentSelection = defaultOption or options[1]
    
    -- Create option buttons
    for i, option in ipairs(options) do
        local optionButton = Instance.new("TextButton")
        optionButton.Name = name .. "_option_" .. i
        optionButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
        optionButton.TextColor3 = Color3.new(0.498, 0.498, 0.498)
        optionButton.Text = option
        optionButton.BackgroundTransparency = 1
        optionButton.Position = UDim2.new(0, 0, 0, (i-1) * 25)
        optionButton.Size = UDim2.new(1, 0, 0, 25)
        optionButton.TextSize = 12
        optionButton.Parent = optionsList
        
        optionButton.MouseButton1Click:Connect(function()
            currentSelection = option
            selectedLabel.Text = option
            isOpen = false
            optionsList.Visible = false
            arrowIcon.Image = "rbxassetid://10709790948" -- Down arrow
            
            if callback then
                callback(option, i)
            end
        end)
        
        -- Hover effect
        optionButton.MouseEnter:Connect(function()
            optionButton.TextColor3 = Color3.new(0.8, 0.8, 0.8)
        end)
        
        optionButton.MouseLeave:Connect(function()
            optionButton.TextColor3 = Color3.new(0.498, 0.498, 0.498)
        end)
    end
    
    local function toggleDropdown()
        isOpen = not isOpen
        optionsList.Visible = isOpen
        arrowIcon.Image = isOpen and "rbxassetid://10709791523" or "rbxassetid://10709790948" -- Up/Down arrow
    end
    
    clickButton.MouseButton1Click:Connect(toggleDropdown)
    
    return {
        Frame = dropdownFrame,
        GetSelection = function() return currentSelection end,
        SetSelection = function(option) 
            currentSelection = option
            selectedLabel.Text = option
        end,
        Close = function()
            isOpen = false
            optionsList.Visible = false
            arrowIcon.Image = "rbxassetid://10709790948"
        end
    }
end

-- Continue with your existing UI structure and add these functional components
local uIStroke_2 = Instance.new("UIStroke")
uIStroke_2.Color = Color3.new(0.0667, 0.0667, 0.0824)
uIStroke_2.Parent = main

local module_1_right_section = Instance.new("Frame")
module_1_right_section.Name = "Module 1 ( right section)"
module_1_right_section.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
module_1_right_section.Position = UDim2.new(0.328, 0, 0.174, 0)
module_1_right_section.BorderColor3 = Color3.new()
module_1_right_section.BorderSizePixel = 0
module_1_right_section.Size = UDim2.new(0, 262, 0, 226)
module_1_right_section.Parent = main

local module1Corner = Instance.new("UICorner")
module1Corner.Parent = module_1_right_section

local module1Stroke = Instance.new("UIStroke")
module1Stroke.Color = Color3.new(0.0902, 0.0902, 0.114)
module1Stroke.Parent = module_1_right_section

-- Add functional components to the module
-- Toggle
local toggle_text = Instance.new("TextLabel")
toggle_text.Name = "Toggle text"
toggle_text.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
toggle_text.TextColor3 = Color3.new(1, 1, 1)
toggle_text.Text = "Toggle"
toggle_text.BackgroundTransparency = 1
toggle_text.Position = UDim2.new(0, 0, 0.04, 0)
toggle_text.Size = UDim2.new(0, 87, 0, 21)
toggle_text.TextSize = 15
toggle_text.Parent = module_1_right_section

local mainToggle = createToggle(module_1_right_section, "main_toggle", false, function(state)
    print("Toggle state:", state)
end)
mainToggle.Frame.Position = UDim2.new(0.802, 0, 0.0725, 0)

local toggle_desc = Instance.new("TextLabel")
toggle_desc.Name = "Toggle description"
toggle_desc.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
toggle_desc.TextColor3 = Color3.new(0.42, 0.42, 0.424)
toggle_desc.Text = "Description"
toggle_desc.BackgroundTransparency = 1
toggle_desc.Position = UDim2.new(0.007, 0, 0.125, 0)
toggle_desc.Size = UDim2.new(0, 99, 0, 17)
toggle_desc.TextSize = 15
toggle_desc.Parent = module_1_right_section

-- Separator
local separator1 = Instance.new("Frame")
separator1.BackgroundColor3 = Color3.new(0.0902, 0.0902, 0.114)
separator1.Position = UDim2.new(0.0595, 0, 0.242, 0)
separator1.BorderSizePixel = 0
separator1.Size = UDim2.new(0, 237, 0, 1)
separator1.Parent = module_1_right_section

-- Slider
local slider_text = Instance.new("TextLabel")
slider_text.Name = "Slider text"
slider_text.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
slider_text.TextColor3 = Color3.new(0.992, 0.992, 0.992)
slider_text.Text = "Slider"
slider_text.BackgroundTransparency = 1
slider_text.Position = UDim2.new(0.008, 0, 0.282, 0)
slider_text.Size = UDim2.new(0, 79, 0, 14)
slider_text.TextSize = 15
slider_text.Parent = module_1_right_section

local slider_desc = Instance.new("TextLabel")
slider_desc.Name = "Slider description"
slider_desc.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontStyle.Normal, Enum.FontWeight.SemiBold)
slider_desc.TextColor3 = Color3.new(0.42, 0.42, 0.424)
slider_desc.Text = "Description"
slider_desc.BackgroundTransparency = 1
slider_desc.Position = UDim2.new(0.011, 0, 0.348, 0)
slider_desc.Size = UDim2.new(0, 99, 0, 17)
slider_desc.TextSize = 15
slider_desc.Parent = module_1_right_section

local mainSlider = createSlider(module_1_right_section, "main_slider", 0, 100, 50, function(value)
    print("Slider value:", value)
end)
mainSlider.Frame.Position = UDim2.new(0.064, 0, 0.464, 0)

-- Add minimize/maximize functionality
minimized_ui.Visible = false

local function minimize()
    isMinimized = true
    main.Visible = false
    minimized_ui.Visible = true
end

local function maximize()
    isMinimized = false
    main.Visible = true
    minimized_ui.Visible = false
end

-- Add minimize button functionality (you'll need to add this to your existing close button)
unminize_button.MouseButton1Click:Connect(maximize)

-- Example of adding a dropdown to the second module
wait(1) -- Let UI load

-- Create a test dropdown with options
local testOptions = {"Option 1", "Option 2", "Option 3"}
local testDropdown = createDropdown(main, "test_dropdown", testOptions, "Option 1", function(selection, index)
    print("Selected:", selection, "Index:", index)
end)
testDropdown.Frame.Position = UDim2.new(0.75, 0, 0.25, 0)

print("UI Library loaded with functional components!")
