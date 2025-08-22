local main_UI = Instance.new("ScreenGui")
main_UI.Name = "Main UI"
main_UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local minimized_ui = Instance.new("ScreenGui")
minimized_ui.Name = "Minimized ui"
minimized_ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
minimized_ui.Parent = main_UI

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

local main = Instance.new("Frame")
main.Name = "main"
main.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
main.Position = UDim2.new(0.227, 0, 0.198, 0)
main.BorderColor3 = Color3.new()
main.BorderSizePixel = 0
main.Size = UDim2.new(0, 813, 0, 494)
main.Parent = main_UI

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
player_skin.Image = "rbxassetid://81331039069318"
player_skin.BackgroundTransparency = 1
player_skin.Position = UDim2.new(-0.0541, 0, 7.65, 0)
player_skin.BorderColor3 = Color3.new()
player_skin.BorderSizePixel = 0
player_skin.Size = UDim2.new(0, 40, 0, 40)
player_skin.Parent = avatar_preview

local uICorner_2 = Instance.new("UICorner")
uICorner_2.Name = "UICorner"
uICorner_2.CornerRadius = UDim.new(1, 10)
uICorner_2.Parent = player_skin

local welcome_and_user_of_roblox_player_ = Instance.new("TextLabel")
welcome_and_user_of_roblox_player_.Name = "Welcome (and user of roblox player)"
welcome_and_user_of_roblox_player_.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
welcome_and_user_of_roblox_player_.TextColor3 = Color3.new(1, 1, 1)
welcome_and_user_of_roblox_player_.Text = "Welcome {Username} "
welcome_and_user_of_roblox_player_.BackgroundColor3 = Color3.new(1, 1, 1)
welcome_and_user_of_roblox_player_.BackgroundTransparency = 1
welcome_and_user_of_roblox_player_.Position = UDim2.new(0.416, 0, 18, 0)
welcome_and_user_of_roblox_player_.BorderSizePixel = 0
welcome_and_user_of_roblox_player_.BorderColor3 = Color3.new()
welcome_and_user_of_roblox_player_.TextSize = 16
welcome_and_user_of_roblox_player_.Size = UDim2.new(0, 77, 0, 19)
welcome_and_user_of_roblox_player_.Parent = avatar_preview

local search_Bar = Instance.new("Frame")
search_Bar.Name = "Search Bar"
search_Bar.BackgroundColor3 = Color3.new(0.0353, 0.0353, 0.051)
search_Bar.Position = UDim2.new(0.329, 0, 0.0483, 0)
search_Bar.BorderColor3 = Color3.new()
search_Bar.BorderSizePixel = 0
search_Bar.Size = UDim2.new(0, 115, 0, 27)
search_Bar.Parent = main

local uICorner_3 = Instance.new("UICorner")
uICorner_3.Name = "UICorner"
uICorner_3.CornerRadius = UDim.new(0, 9)
uICorner_3.Parent = search_Bar

local uIStroke_2 = Instance.new("UIStroke")
uIStroke_2.Name = "UIStroke"
uIStroke_2.Color = Color3.new(0.0667, 0.0667, 0.098)
uIStroke_2.Parent = search_Bar

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
search_for_module.BackgroundTransparency = 1
search_for_module.BackgroundColor3 = Color3.new(1, 1, 1)
search_for_module.BorderSizePixel = 0
search_for_module.BorderColor3 = Color3.new()
search_for_module.TextSize = 14
search_for_module.Size = UDim2.new(0, 47, 0, 24)
search_for_module.Parent = search_Bar

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

local uIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
uIAspectRatioConstraint.Name = "UIAspectRatioConstraint"
uIAspectRatioConstraint.Parent = search_logo

local frame_2 = Instance.new("Frame")
frame_2.Name = "Frame"
frame_2.BackgroundColor3 = Color3.new(0.0784, 0.0784, 0.0784)
frame_2.Position = UDim2.new(0.311, 0, 0.133, 0)
frame_2.BorderColor3 = Color3.new()
frame_2.BorderSizePixel = 0
frame_2.Size = UDim2.new(0, 560, 0, 1)
frame_2.Parent = main

local toggle_text_can_be_changed_ = Instance.new("TextLabel")
toggle_text_can_be_changed_.Name = "Toggle text (can be changed)"
toggle_text_can_be_changed_.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
toggle_text_can_be_changed_.TextColor3 = Color3.new(1, 1, 1)
toggle_text_can_be_changed_.BorderColor3 = Color3.new()
toggle_text_can_be_changed_.Text = "Toggle"
toggle_text_can_be_changed_.BackgroundColor3 = Color3.new(1, 1, 1)
toggle_text_can_be_changed_.BorderSizePixel = 0
toggle_text_can_be_changed_.BackgroundTransparency = 1
toggle_text_can_be_changed_.Position = UDim2.new(0.332, 0, 0.526, 0)
toggle_text_can_be_changed_.RichText = true
toggle_text_can_be_changed_.TextSize = 15
toggle_text_can_be_changed_.Size = UDim2.new(0, 87, 0, 24)
toggle_text_can_be_changed_.Parent = main

local dropdown_text_can_be_changed_enabled_ = Instance.new("TextLabel")
dropdown_text_can_be_changed_enabled_.Name = "Dropdown  text (can be changed) (enabled)"
dropdown_text_can_be_changed_enabled_.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
dropdown_text_can_be_changed_enabled_.TextColor3 = Color3.new(1, 1, 1)
dropdown_text_can_be_changed_enabled_.BorderColor3 = Color3.new()
dropdown_text_can_be_changed_enabled_.Text = "Dropdown"
dropdown_text_can_be_changed_enabled_.BackgroundColor3 = Color3.new(1, 1, 1)
dropdown_text_can_be_changed_enabled_.BorderSizePixel = 0
dropdown_text_can_be_changed_enabled_.BackgroundTransparency = 1
dropdown_text_can_be_changed_enabled_.Position = UDim2.new(0.677, 0, 0.285, 0)
dropdown_text_can_be_changed_enabled_.RichText = true
dropdown_text_can_be_changed_enabled_.TextSize = 15
dropdown_text_can_be_changed_enabled_.Size = UDim2.new(0, 87, 0, 28)
dropdown_text_can_be_changed_enabled_.Parent = main

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

local module_1_right_section_ = Instance.new("Frame")
module_1_right_section_.Name = "Module 1 ( right section)"
module_1_right_section_.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
module_1_right_section_.Position = UDim2.new(0.328, 0, 0.174, 0)
module_1_right_section_.BorderColor3 = Color3.new()
module_1_right_section_.BorderSizePixel = 0
module_1_right_section_.Size = UDim2.new(0, 262, 0, 226)
module_1_right_section_.Parent = main

local toggle_text_can_be_changed__2 = Instance.new("TextLabel")
toggle_text_can_be_changed__2.Name = "Toggle text (can be changed)"
toggle_text_can_be_changed__2.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
toggle_text_can_be_changed__2.TextColor3 = Color3.new(1, 1, 1)
toggle_text_can_be_changed__2.BorderColor3 = Color3.new()
toggle_text_can_be_changed__2.Text = "Toggle"
toggle_text_can_be_changed__2.BackgroundColor3 = Color3.new(1, 1, 1)
toggle_text_can_be_changed__2.BorderSizePixel = 0
toggle_text_can_be_changed__2.BackgroundTransparency = 1
toggle_text_can_be_changed__2.Position = UDim2.new(-0.00397, 0, 0.0405, 0)
toggle_text_can_be_changed__2.RichText = true
toggle_text_can_be_changed__2.TextSize = 15
toggle_text_can_be_changed__2.Size = UDim2.new(0, 87, 0, 21)
toggle_text_can_be_changed__2.Parent = module_1_right_section_

local slider_description_can_be_changed_ = Instance.new("TextLabel")
slider_description_can_be_changed_.Name = "slider description (can be changed)"
slider_description_can_be_changed_.FontFace = Font.new(
    "rbxasset://fonts/families/SourceSansPro.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
slider_description_can_be_changed_.LineHeight = 0.6
slider_description_can_be_changed_.TextColor3 = Color3.new(0.42, 0.42, 0.424)
slider_description_can_be_changed_.BorderColor3 = Color3.new()
slider_description_can_be_changed_.Text = "Description"
slider_description_can_be_changed_.BackgroundColor3 = Color3.new(1, 1, 1)
slider_description_can_be_changed_.BorderSizePixel = 0
slider_description_can_be_changed_.BackgroundTransparency = 1
slider_description_can_be_changed_.Position = UDim2.new(0.0107, 0, 0.348, 0)
slider_description_can_be_changed_.TextStrokeColor3 = Color3.new(0.365, 0.365, 0.369)
slider_description_can_be_changed_.ZIndex = 2
slider_description_can_be_changed_.TextSize = 15
slider_description_can_be_changed_.Size = UDim2.new(0, 99, 0, 17)
slider_description_can_be_changed_.Parent = module_1_right_section_

local color_rgb_selection_and_the_rgb_can_be_changed_ = Instance.new("TextLabel")
color_rgb_selection_and_the_rgb_can_be_changed_.Name = "Color (rgb selection) (and the \"rgb\" can be changed)"
color_rgb_selection_and_the_rgb_can_be_changed_.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
color_rgb_selection_and_the_rgb_can_be_changed_.TextColor3 = Color3.new(1, 1, 1)
color_rgb_selection_and_the_rgb_can_be_changed_.Text = "Color"
color_rgb_selection_and_the_rgb_can_be_changed_.BackgroundColor3 = Color3.new(1, 1, 1)
color_rgb_selection_and_the_rgb_can_be_changed_.BackgroundTransparency = 1
color_rgb_selection_and_the_rgb_can_be_changed_.Position = UDim2.new(0.0487, 0, 0.578, 0)
color_rgb_selection_and_the_rgb_can_be_changed_.BorderSizePixel = 0
color_rgb_selection_and_the_rgb_can_be_changed_.BorderColor3 = Color3.new()
color_rgb_selection_and_the_rgb_can_be_changed_.TextSize = 14
color_rgb_selection_and_the_rgb_can_be_changed_.Size = UDim2.new(0, 58, 0, 14)
color_rgb_selection_and_the_rgb_can_be_changed_.Parent = module_1_right_section_

local uICorner_4 = Instance.new("UICorner")
uICorner_4.Name = "UICorner"
uICorner_4.Parent = module_1_right_section_

local main_slider_idk_ = Instance.new("Frame")
main_slider_idk_.Name = "Main slider (idk)"
main_slider_idk_.BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)
main_slider_idk_.Position = UDim2.new(0.0635, 0, 0.464, 0)
main_slider_idk_.BorderColor3 = Color3.new()
main_slider_idk_.BorderSizePixel = 0
main_slider_idk_.Size = UDim2.new(0, 234, 0, 7)
main_slider_idk_.Parent = module_1_right_section_

local uICorner_5 = Instance.new("UICorner")
uICorner_5.Name = "UICorner"
uICorner_5.CornerRadius = UDim.new(0, 3)
uICorner_5.Parent = main_slider_idk_

local main_slider_to_change_value = Instance.new("Frame")
main_slider_to_change_value.Name = "Main slider to change value"
main_slider_to_change_value.BackgroundColor3 = Color3.new(0.475, 0.451, 0.918)
main_slider_to_change_value.Position = UDim2.new(0.0588, 0, 0.464, 0)
main_slider_to_change_value.BorderColor3 = Color3.new()
main_slider_to_change_value.BorderSizePixel = 0
main_slider_to_change_value.Size = UDim2.new(0, 147, 0, 7)
main_slider_to_change_value.Parent = module_1_right_section_

local the_value_changer_of_slider_1_to_anything_depends_on_function_and_like_not_1_2_that_will_be_1_2 = Instance.new("TextLabel")
the_value_changer_of_slider_1_to_anything_depends_on_function_and_like_not_1_2_that_will_be_1_2.Name = "The value changer of slider 1/to anything depends on function and like not 1 2 that will be 1.2"
the_value_changer_of_slider_1_to_anything_depends_on_function_and_like_not_1_2_that_will_be_1_2.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
the_value_changer_of_slider_1_to_anything_depends_on_function_and_like_not_1_2_that_will_be_1_2.TextColor3 = Color3.new(1, 1, 1)
the_value_changer_of_slider_1_to_anything_depends_on_function_and_like_not_1_2_that_will_be_1_2.Text = "100"
the_value_changer_of_slider_1_to_anything_depends_on_function_and_like_not_1_2_that_will_be_1_2.BackgroundColor3 = Color3.new(1, 1, 1)
the_value_changer_of_slider_1_to_anything_depends_on_function_and_like_not_1_2_that_will_be_1_2.BackgroundTransparency = 1
the_value_changer_of_slider_1_to_anything_depends_on_function_and_like_not_1_2_that_will_be_1_2.Position = UDim2.new(1.24, 0, -5.43, 0)
the_value_changer_of_slider_1_to_anything_depends_on_function_and_like_not_1_2_that_will_be_1_2.BorderSizePixel = 0
the_value_changer_of_slider_1_to_anything_depends_on_function_and_like_not_1_2_that_will_be_1_2.BorderColor3 = Color3.new()
the_value_changer_of_slider_1_to_anything_depends_on_function_and_like_not_1_2_that_will_be_1_2.TextSize = 14
the_value_changer_of_slider_1_to_anything_depends_on_function_and_like_not_1_2_that_will_be_1_2.Size = UDim2.new(0, 65, 0, 28)
the_value_changer_of_slider_1_to_anything_depends_on_function_and_like_not_1_2_that_will_be_1_2.Parent = main_slider_to_change_value

local a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it = Instance.new("Frame")
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it.Name = "A button for slider to change value like button like erm when u detain it and move it"
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it.BackgroundColor3 = Color3.new(1, 1, 1)
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it.Position = UDim2.new(0.993, 0, -0.286, 0)
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it.BorderColor3 = Color3.new()
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it.BorderSizePixel = 0
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it.Size = UDim2.new(0, 11, 0, 11)
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it.Parent = main_slider_to_change_value

local uICorner_6 = Instance.new("UICorner")
uICorner_6.Name = "UICorner"
uICorner_6.CornerRadius = UDim.new(0, 3)
uICorner_6.Parent = a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it

local a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it_2 = Instance.new("TextButton")
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it_2.Name = "A button for slider to change value like button like erm when u detain it and move it"
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it_2.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it_2.TextColor3 = Color3.new()
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it_2.Text = ""
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it_2.BackgroundColor3 = Color3.new(1, 1, 1)
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it_2.BackgroundTransparency = 1
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it_2.Position = UDim2.new(0.0909, 0, 0, 0)
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it_2.BorderSizePixel = 0
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it_2.BorderColor3 = Color3.new()
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it_2.TextSize = 14
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it_2.Size = UDim2.new(0, 10, 0, 11)
a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it_2.Parent = a_button_for_slider_to_change_value_like_button_like_erm_when_u_detain_it_and_move_it

local uICorner_7 = Instance.new("UICorner")
uICorner_7.Name = "UICorner"
uICorner_7.CornerRadius = UDim.new(0, 3)
uICorner_7.Parent = main_slider_to_change_value

local uIGradient_2 = Instance.new("UIGradient")
uIGradient_2.Name = "UIGradient"
uIGradient_2.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
    ColorSequenceKeypoint.new(1, Color3.new(0.314, 0.314, 0.314))
})
uIGradient_2.Parent = main_slider_to_change_value

local toggle_description_can_be_changed_ = Instance.new("TextLabel")
toggle_description_can_be_changed_.Name = "Toggle description (can be changed)"
toggle_description_can_be_changed_.FontFace = Font.new(
    "rbxasset://fonts/families/SourceSansPro.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
toggle_description_can_be_changed_.TextColor3 = Color3.new(0.42, 0.42, 0.424)
toggle_description_can_be_changed_.BorderColor3 = Color3.new()
toggle_description_can_be_changed_.Text = "Description"
toggle_description_can_be_changed_.BackgroundColor3 = Color3.new(1, 1, 1)
toggle_description_can_be_changed_.BorderSizePixel = 0
toggle_description_can_be_changed_.BackgroundTransparency = 1
toggle_description_can_be_changed_.Position = UDim2.new(0.00749, 0, 0.125, 0)
toggle_description_can_be_changed_.TextStrokeColor3 = Color3.new(0.365, 0.365, 0.369)
toggle_description_can_be_changed_.TextSize = 15
toggle_description_can_be_changed_.Size = UDim2.new(0, 99, 0, 17)
toggle_description_can_be_changed_.Parent = module_1_right_section_

local slider_text_can_be_changed_ = Instance.new("TextLabel")
slider_text_can_be_changed_.Name = "Slider text (can be changed)"
slider_text_can_be_changed_.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
slider_text_can_be_changed_.TextColor3 = Color3.new(0.992, 0.992, 0.992)
slider_text_can_be_changed_.Text = "Slider"
slider_text_can_be_changed_.BackgroundColor3 = Color3.new(1, 1, 1)
slider_text_can_be_changed_.BackgroundTransparency = 1
slider_text_can_be_changed_.Position = UDim2.new(0.00816, 0, 0.282, 0)
slider_text_can_be_changed_.BorderSizePixel = 0
slider_text_can_be_changed_.BorderColor3 = Color3.new()
slider_text_can_be_changed_.TextSize = 15
slider_text_can_be_changed_.Size = UDim2.new(0, 79, 0, 14)
slider_text_can_be_changed_.Parent = module_1_right_section_

local the_main_rgb_changer_the_color_selection_from_rgb_ = Instance.new("Frame")
the_main_rgb_changer_the_color_selection_from_rgb_.Name = "The main rgb changer ( the color selection from rgb)"
the_main_rgb_changer_the_color_selection_from_rgb_.BackgroundColor3 = Color3.new(0.647, 0.169, 0.647)
the_main_rgb_changer_the_color_selection_from_rgb_.Position = UDim2.new(0.805, 0, 0.578, 0)
the_main_rgb_changer_the_color_selection_from_rgb_.BorderColor3 = Color3.new()
the_main_rgb_changer_the_color_selection_from_rgb_.BorderSizePixel = 0
the_main_rgb_changer_the_color_selection_from_rgb_.Size = UDim2.new(0, 35, 0, 35)
the_main_rgb_changer_the_color_selection_from_rgb_.Parent = module_1_right_section_

local press_that_to_enable = Instance.new("TextButton")
press_that_to_enable.Name = "Press that to enable"
press_that_to_enable.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
press_that_to_enable.TextColor3 = Color3.new()
press_that_to_enable.Text = ""
press_that_to_enable.BackgroundTransparency = 1
press_that_to_enable.BackgroundColor3 = Color3.new(1, 1, 1)
press_that_to_enable.BorderSizePixel = 0
press_that_to_enable.BorderColor3 = Color3.new()
press_that_to_enable.TextSize = 14
press_that_to_enable.Size = UDim2.new(0, 37, 0, 43)
press_that_to_enable.Parent = the_main_rgb_changer_the_color_selection_from_rgb_

local uICorner_8 = Instance.new("UICorner")
uICorner_8.Name = "UICorner"
uICorner_8.CornerRadius = UDim.new(0, 5)
uICorner_8.Parent = the_main_rgb_changer_the_color_selection_from_rgb_

local just_a_effect = Instance.new("Frame")
just_a_effect.Name = "Just a effect"
just_a_effect.BackgroundColor3 = Color3.new(0.0902, 0.0902, 0.114)
just_a_effect.Position = UDim2.new(0.0595, 0, 0.536, 0)
just_a_effect.BorderColor3 = Color3.new()
just_a_effect.BorderSizePixel = 0
just_a_effect.Size = UDim2.new(0, 236, 0, 1)
just_a_effect.Parent = module_1_right_section_

local just_a_effect_2 = Instance.new("Frame")
just_a_effect_2.Name = "Just a effect"
just_a_effect_2.BackgroundColor3 = Color3.new(0.0902, 0.0902, 0.114)
just_a_effect_2.Position = UDim2.new(0.0595, 0, 0.242, 0)
just_a_effect_2.BorderColor3 = Color3.new()
just_a_effect_2.BorderSizePixel = 0
just_a_effect_2.Size = UDim2.new(0, 237, 0, 1)
just_a_effect_2.Parent = module_1_right_section_

local main_toggle_button_inactive_ = Instance.new("Frame")
main_toggle_button_inactive_.Name = "main toggle button (inactive)"
main_toggle_button_inactive_.BackgroundColor3 = Color3.new(0.0902, 0.0863, 0.125)
main_toggle_button_inactive_.Position = UDim2.new(0.802, 0, 0.0725, 0)
main_toggle_button_inactive_.BorderColor3 = Color3.new()
main_toggle_button_inactive_.BorderSizePixel = 0
main_toggle_button_inactive_.Size = UDim2.new(0, 36, 0, 20)
main_toggle_button_inactive_.Parent = module_1_right_section_

local switcher_off = Instance.new("Frame")
switcher_off.Name = "Switcher off"
switcher_off.BackgroundColor3 = Color3.new(1, 1, 1)
switcher_off.Position = UDim2.new(0.167, 0, 0.25, 0)
switcher_off.BorderColor3 = Color3.new()
switcher_off.BorderSizePixel = 0
switcher_off.Size = UDim2.new(0, 10, 0, 10)
switcher_off.Parent = main_toggle_button_inactive_

local uICorner_9 = Instance.new("UICorner")
uICorner_9.Name = "UICorner"
uICorner_9.Parent = switcher_off

local uICorner_10 = Instance.new("UICorner")
uICorner_10.Name = "UICorner"
uICorner_10.CornerRadius = UDim.new(0, 9)
uICorner_10.Parent = main_toggle_button_inactive_

local _disabled_ = Instance.new("TextButton")
_disabled_.Name = "(disabled)"
_disabled_.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
_disabled_.TextColor3 = Color3.new()
_disabled_.Text = ""
_disabled_.BackgroundTransparency = 1
_disabled_.BackgroundColor3 = Color3.new(1, 1, 1)
_disabled_.BorderSizePixel = 0
_disabled_.BorderColor3 = Color3.new()
_disabled_.TextSize = 14
_disabled_.Size = UDim2.new(0, 36, 0, 20)
_disabled_.Parent = main_toggle_button_inactive_

local uIStroke_3 = Instance.new("UIStroke")
uIStroke_3.Name = "UIStroke"
uIStroke_3.Color = Color3.new(0.0902, 0.0902, 0.114)
uIStroke_3.Parent = module_1_right_section_

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
button_of_minimize.Text = ""
button_of_minimize.BackgroundColor3 = Color3.new(1, 1, 1)
button_of_minimize.BackgroundTransparency = 1
button_of_minimize.Position = UDim2.new(0.367, 0, -0.0596, 0)
button_of_minimize.BorderSizePixel = 0
button_of_minimize.BorderColor3 = Color3.new()
button_of_minimize.TextSize = 14
button_of_minimize.Size = UDim2.new(0, 20, 0, 20)
button_of_minimize.Parent = mimize_frame

local toggle_description_can_be_changed__2 = Instance.new("TextLabel")
toggle_description_can_be_changed__2.Name = "Toggle description (can be changed)"
toggle_description_can_be_changed__2.FontFace = Font.new(
    "rbxasset://fonts/families/SourceSansPro.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
toggle_description_can_be_changed__2.TextColor3 = Color3.new(0.42, 0.42, 0.424)
toggle_description_can_be_changed__2.BorderColor3 = Color3.new()
toggle_description_can_be_changed__2.Text = "Description"
toggle_description_can_be_changed__2.BackgroundColor3 = Color3.new(1, 1, 1)
toggle_description_can_be_changed__2.BorderSizePixel = 0
toggle_description_can_be_changed__2.BackgroundTransparency = 1
toggle_description_can_be_changed__2.Position = UDim2.new(0.331, 0, 0.56, 0)
toggle_description_can_be_changed__2.TextStrokeColor3 = Color3.new(0.365, 0.365, 0.369)
toggle_description_can_be_changed__2.TextSize = 15
toggle_description_can_be_changed__2.Size = UDim2.new(0, 99, 0, 23)
toggle_description_can_be_changed__2.Parent = main

local close_button = Instance.new("Frame")
close_button.Name = "Close button"
close_button.BackgroundColor3 = Color3.new(1, 1, 1)
close_button.BackgroundTransparency = 1
close_button.Position = UDim2.new(0.958, 0, 0.048, 0)
close_button.BorderColor3 = Color3.new()
close_button.BorderSizePixel = 0
close_button.Size = UDim2.new(0, 18, 0, 20)
close_button.Parent = main

local close_button_2 = Instance.new("TextButton")
close_button_2.Name = "Close button"
close_button_2.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
close_button_2.TextColor3 = Color3.new()
close_button_2.Text = ""
close_button_2.BackgroundColor3 = Color3.new(1, 1, 1)
close_button_2.BackgroundTransparency = 1
close_button_2.Position = UDim2.new(0.0467, 0, 0.00666, 0)
close_button_2.BorderSizePixel = 0
close_button_2.BorderColor3 = Color3.new()
close_button_2.TextSize = 14
close_button_2.Size = UDim2.new(0, 21, 0, 17)
close_button_2.Parent = close_button

local imageLabel = Instance.new("ImageLabel")
imageLabel.Name = "ImageLabel"
imageLabel.ImageColor3 = Color3.new(0.365, 0.365, 0.365)
imageLabel.Image = "rbxassetid://10747384394"
imageLabel.BackgroundTransparency = 1
imageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
imageLabel.BorderColor3 = Color3.new()
imageLabel.BorderSizePixel = 0
imageLabel.Size = UDim2.new(0, 18, 0, 19)
imageLabel.Parent = close_button

local uIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
uIAspectRatioConstraint_2.Name = "UIAspectRatioConstraint"
uIAspectRatioConstraint_2.Parent = imageLabel

local dropdown_description_can_be_changed_enabled_ = Instance.new("TextLabel")
dropdown_description_can_be_changed_enabled_.Name = "Dropdown  description (can be changed) (enabled)"
dropdown_description_can_be_changed_enabled_.FontFace = Font.new(
    "rbxasset://fonts/families/SourceSansPro.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
dropdown_description_can_be_changed_enabled_.TextColor3 = Color3.new(0.42, 0.42, 0.424)
dropdown_description_can_be_changed_enabled_.BorderColor3 = Color3.new()
dropdown_description_can_be_changed_enabled_.Text = "Description"
dropdown_description_can_be_changed_enabled_.BackgroundColor3 = Color3.new(1, 1, 1)
dropdown_description_can_be_changed_enabled_.BorderSizePixel = 0
dropdown_description_can_be_changed_enabled_.BackgroundTransparency = 1
dropdown_description_can_be_changed_enabled_.Position = UDim2.new(0.667, 0, 0.341, 0)
dropdown_description_can_be_changed_enabled_.TextStrokeColor3 = Color3.new(0.365, 0.365, 0.369)
dropdown_description_can_be_changed_enabled_.TextSize = 15
dropdown_description_can_be_changed_enabled_.Size = UDim2.new(0, 99, 0, 17)
dropdown_description_can_be_changed_enabled_.Parent = main

local dropdown_description_can_be_changed_ = Instance.new("TextLabel")
dropdown_description_can_be_changed_.Name = "Dropdown  description (can be changed)"
dropdown_description_can_be_changed_.FontFace = Font.new(
    "rbxasset://fonts/families/SourceSansPro.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
dropdown_description_can_be_changed_.TextColor3 = Color3.new(0.42, 0.42, 0.424)
dropdown_description_can_be_changed_.BorderColor3 = Color3.new()
dropdown_description_can_be_changed_.Text = "Description"
dropdown_description_can_be_changed_.BackgroundColor3 = Color3.new(1, 1, 1)
dropdown_description_can_be_changed_.BorderSizePixel = 0
dropdown_description_can_be_changed_.BackgroundTransparency = 1
dropdown_description_can_be_changed_.Position = UDim2.new(0.667, 0, 0.23, 0)
dropdown_description_can_be_changed_.TextStrokeColor3 = Color3.new(0.365, 0.365, 0.369)
dropdown_description_can_be_changed_.TextSize = 15
dropdown_description_can_be_changed_.Size = UDim2.new(0, 99, 0, 17)
dropdown_description_can_be_changed_.Parent = main

local dropdown_text_can_be_changed_ = Instance.new("TextLabel")
dropdown_text_can_be_changed_.Name = "Dropdown  text (can be changed)"
dropdown_text_can_be_changed_.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
dropdown_text_can_be_changed_.TextColor3 = Color3.new(1, 1, 1)
dropdown_text_can_be_changed_.BorderColor3 = Color3.new()
dropdown_text_can_be_changed_.Text = "Dropdown"
dropdown_text_can_be_changed_.BackgroundColor3 = Color3.new(1, 1, 1)
dropdown_text_can_be_changed_.BorderSizePixel = 0
dropdown_text_can_be_changed_.BackgroundTransparency = 1
dropdown_text_can_be_changed_.Position = UDim2.new(0.677, 0, 0.184, 0)
dropdown_text_can_be_changed_.RichText = true
dropdown_text_can_be_changed_.TextSize = 15
dropdown_text_can_be_changed_.Size = UDim2.new(0, 87, 0, 28)
dropdown_text_can_be_changed_.Parent = main

local main_toggle_button_active_ = Instance.new("Frame")
main_toggle_button_active_.Name = "main toggle button (active)"
main_toggle_button_active_.BackgroundColor3 = Color3.new(0.475, 0.451, 0.918)
main_toggle_button_active_.Position = UDim2.new(0.586, 0, 0.56, 0)
main_toggle_button_active_.BorderColor3 = Color3.new()
main_toggle_button_active_.BorderSizePixel = 0
main_toggle_button_active_.Size = UDim2.new(0, 36, 0, 20)
main_toggle_button_active_.Parent = main

local uICorner_11 = Instance.new("UICorner")
uICorner_11.Name = "UICorner"
uICorner_11.CornerRadius = UDim.new(0, 9)
uICorner_11.Parent = main_toggle_button_active_

local switcher_on = Instance.new("Frame")
switcher_on.Name = "Switcher on"
switcher_on.BackgroundColor3 = Color3.new(1, 1, 1)
switcher_on.Position = UDim2.new(0.5, 0, 0.25, 0)
switcher_on.BorderColor3 = Color3.new()
switcher_on.BorderSizePixel = 0
switcher_on.Size = UDim2.new(0, 11, 0, 10)
switcher_on.Parent = main_toggle_button_active_

local uICorner_12 = Instance.new("UICorner")
uICorner_12.Name = "UICorner"
uICorner_12.Parent = switcher_on

local _enabled_ = Instance.new("TextButton")
_enabled_.Name = "(enabled)"
_enabled_.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
_enabled_.TextColor3 = Color3.new()
_enabled_.Text = ""
_enabled_.BackgroundTransparency = 1
_enabled_.BackgroundColor3 = Color3.new(1, 1, 1)
_enabled_.BorderSizePixel = 0
_enabled_.BorderColor3 = Color3.new()
_enabled_.TextSize = 14
_enabled_.Size = UDim2.new(0, 36, 0, 20)
_enabled_.Parent = main_toggle_button_active_

local uICorner_13 = Instance.new("UICorner")
uICorner_13.Name = "UICorner"
uICorner_13.Parent = main

local uIStroke_4 = Instance.new("UIStroke")
uIStroke_4.Name = "UIStroke"
uIStroke_4.Color = Color3.new(0.0667, 0.0667, 0.0824)
uIStroke_4.Parent = main

local frame_3 = Instance.new("Frame")
frame_3.Name = "Frame"
frame_3.BackgroundColor3 = Color3.new(0.0902, 0.0902, 0.114)
frame_3.Position = UDim2.new(0.309, 0, 0, 0)
frame_3.BorderColor3 = Color3.new()
frame_3.BorderSizePixel = 0
frame_3.Size = UDim2.new(0, 1, 0, 494)
frame_3.Parent = main

local module_2_left_ = Instance.new("Frame")
module_2_left_.Name = "Module 2 (left)"
module_2_left_.BackgroundColor3 = Color3.new(0.0196, 0.0196, 0.0314)
module_2_left_.Position = UDim2.new(0.668, 0, 0.174, 0)
module_2_left_.BorderColor3 = Color3.new()
module_2_left_.BorderSizePixel = 0
module_2_left_.Size = UDim2.new(0, 255, 0, 226)
module_2_left_.Parent = main

local uICorner_14 = Instance.new("UICorner")
uICorner_14.Name = "UICorner"
uICorner_14.Parent = module_2_left_

local uIStroke_5 = Instance.new("UIStroke")
uIStroke_5.Name = "UIStroke"
uIStroke_5.Color = Color3.new(0.0902, 0.0902, 0.114)
uIStroke_5.Parent = module_2_left_

local dropdown_main_unselected_ = Instance.new("Frame")
dropdown_main_unselected_.Name = "Dropdown main (unselected)"
dropdown_main_unselected_.BackgroundColor3 = Color3.new(0.0627, 0.0588, 0.0863)
dropdown_main_unselected_.Position = UDim2.new(0.62, 0, 0.0671, 0)
dropdown_main_unselected_.BorderColor3 = Color3.new()
dropdown_main_unselected_.BorderSizePixel = 0
dropdown_main_unselected_.Size = UDim2.new(0, 79, 0, 29)
dropdown_main_unselected_.Parent = module_2_left_

local uICorner_15 = Instance.new("UICorner")
uICorner_15.Name = "UICorner"
uICorner_15.CornerRadius = UDim.new(0, 4)
uICorner_15.Parent = dropdown_main_unselected_

local option_1 = Instance.new("TextLabel")
option_1.Name = "Option 1"
option_1.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
option_1.TextColor3 = Color3.new(0.8, 0.8, 0.8)
option_1.Text = "Option 1"
option_1.BackgroundColor3 = Color3.new(1, 1, 1)
option_1.BackgroundTransparency = 1
option_1.Position = UDim2.new(0, 0, 0.0699, 0)
option_1.BorderSizePixel = 0
option_1.BorderColor3 = Color3.new()
option_1.TextSize = 12
option_1.Size = UDim2.new(0, 57, 0, 24)
option_1.Parent = dropdown_main_unselected_

local uIStroke_6 = Instance.new("UIStroke")
uIStroke_6.Name = "UIStroke"
uIStroke_6.Color = Color3.new(0.0863, 0.0863, 0.0863)
uIStroke_6.Parent = dropdown_main_unselected_

local down_image_ = Instance.new("ImageLabel")
down_image_.Name = "Down (image)"
down_image_.BackgroundColor3 = Color3.new(1, 1, 1)
down_image_.Image = "rbxassetid://10709790948"
down_image_.BackgroundTransparency = 1
down_image_.Position = UDim2.new(0.722, 0, 0.241, 0)
down_image_.BorderColor3 = Color3.new()
down_image_.BorderSizePixel = 0
down_image_.Size = UDim2.new(0, 15, 0, 15)
down_image_.Parent = dropdown_main_unselected_

local uIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
uIAspectRatioConstraint_3.Name = "UIAspectRatioConstraint"
uIAspectRatioConstraint_3.Parent = down_image_

local press_to_enable = Instance.new("TextButton")
press_to_enable.Name = "press to enable"
press_to_enable.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
press_to_enable.TextColor3 = Color3.new()
press_to_enable.Text = ""
press_to_enable.BackgroundTransparency = 1
press_to_enable.BackgroundColor3 = Color3.new(1, 1, 1)
press_to_enable.BorderSizePixel = 0
press_to_enable.BorderColor3 = Color3.new()
press_to_enable.TextSize = 14
press_to_enable.Size = UDim2.new(0, 79, 0, 30)
press_to_enable.Parent = dropdown_main_unselected_

local dropdown_selected_ = Instance.new("Frame")
dropdown_selected_.Name = "Dropdown (selected)"
dropdown_selected_.BackgroundColor3 = Color3.new(0.0627, 0.0588, 0.0863)
dropdown_selected_.Position = UDim2.new(0.62, 0, 0.31, 0)
dropdown_selected_.BorderColor3 = Color3.new()
dropdown_selected_.BorderSizePixel = 0
dropdown_selected_.Size = UDim2.new(0, 79, 0, 29)
dropdown_selected_.Parent = module_2_left_

local press_to_Close = Instance.new("TextButton")
press_to_Close.Name = "Press to Close"
press_to_Close.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
press_to_Close.TextColor3 = Color3.new()
press_to_Close.Text = ""
press_to_Close.BackgroundTransparency = 1
press_to_Close.BackgroundColor3 = Color3.new(1, 1, 1)
press_to_Close.BorderSizePixel = 0
press_to_Close.BorderColor3 = Color3.new()
press_to_Close.TextSize = 14
press_to_Close.Size = UDim2.new(0, 79, 0, 29)
press_to_Close.Parent = dropdown_selected_

local dropdown_list_size_depends_how_much_options_does_that_have_ = Instance.new("Frame")
dropdown_list_size_depends_how_much_options_does_that_have_.Name = "Dropdown list (size depends how much options does that have)"
dropdown_list_size_depends_how_much_options_does_that_have_.BackgroundColor3 = Color3.new(0.0627, 0.0588, 0.0863)
dropdown_list_size_depends_how_much_options_does_that_have_.Position = UDim2.new(0, 0, 1.48, 0)
dropdown_list_size_depends_how_much_options_does_that_have_.BorderColor3 = Color3.new()
dropdown_list_size_depends_how_much_options_does_that_have_.BorderSizePixel = 0
dropdown_list_size_depends_how_much_options_does_that_have_.Size = UDim2.new(0, 79, 0, 77)
dropdown_list_size_depends_how_much_options_does_that_have_.Parent = dropdown_selected_

local uICorner_16 = Instance.new("UICorner")
uICorner_16.Name = "UICorner"
uICorner_16.CornerRadius = UDim.new(0, 4)
uICorner_16.Parent = dropdown_list_size_depends_how_much_options_does_that_have_

local option_1_2 = Instance.new("TextLabel")
option_1_2.Name = "Option 1"
option_1_2.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
option_1_2.TextColor3 = Color3.new(0.498, 0.498, 0.498)
option_1_2.Text = "Option 1"
option_1_2.BackgroundColor3 = Color3.new(1, 1, 1)
option_1_2.BackgroundTransparency = 1
option_1_2.Position = UDim2.new(0, 0, 0.0699, 0)
option_1_2.BorderSizePixel = 0
option_1_2.BorderColor3 = Color3.new()
option_1_2.TextSize = 12
option_1_2.Size = UDim2.new(0, 57, 0, 24)
option_1_2.Parent = dropdown_list_size_depends_how_much_options_does_that_have_

local select_a_option_1_gonna_be_changed_how_many_added_in_ui_ = Instance.new("TextButton")
select_a_option_1_gonna_be_changed_how_many_added_in_ui_.Name = "Select a option (1) (gonna  be changed how many added in ui)"
select_a_option_1_gonna_be_changed_how_many_added_in_ui_.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
select_a_option_1_gonna_be_changed_how_many_added_in_ui_.TextColor3 = Color3.new()
select_a_option_1_gonna_be_changed_how_many_added_in_ui_.Text = ""
select_a_option_1_gonna_be_changed_how_many_added_in_ui_.BackgroundTransparency = 1
select_a_option_1_gonna_be_changed_how_many_added_in_ui_.BackgroundColor3 = Color3.new(1, 1, 1)
select_a_option_1_gonna_be_changed_how_many_added_in_ui_.BorderSizePixel = 0
select_a_option_1_gonna_be_changed_how_many_added_in_ui_.BorderColor3 = Color3.new()
select_a_option_1_gonna_be_changed_how_many_added_in_ui_.TextSize = 14
select_a_option_1_gonna_be_changed_how_many_added_in_ui_.Size = UDim2.new(0, 79, 0, 24)
select_a_option_1_gonna_be_changed_how_many_added_in_ui_.Parent = option_1_2

local option_3 = Instance.new("TextLabel")
option_3.Name = "Option 3"
option_3.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
option_3.TextColor3 = Color3.new(0.498, 0.498, 0.498)
option_3.Text = "Option 3"
option_3.BackgroundColor3 = Color3.new(1, 1, 1)
option_3.BackgroundTransparency = 1
option_3.Position = UDim2.new(0, 0, 0.681, 0)
option_3.BorderSizePixel = 0
option_3.BorderColor3 = Color3.new()
option_3.TextSize = 12
option_3.Size = UDim2.new(0, 57, 0, 24)
option_3.Parent = dropdown_list_size_depends_how_much_options_does_that_have_

local select_a_option_3_gonna_be_changed_how_many_added_in_ui_ = Instance.new("TextButton")
select_a_option_3_gonna_be_changed_how_many_added_in_ui_.Name = "Select a option (3) (gonna  be changed how many added in ui)"
select_a_option_3_gonna_be_changed_how_many_added_in_ui_.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
select_a_option_3_gonna_be_changed_how_many_added_in_ui_.TextColor3 = Color3.new()
select_a_option_3_gonna_be_changed_how_many_added_in_ui_.Text = ""
select_a_option_3_gonna_be_changed_how_many_added_in_ui_.BackgroundTransparency = 1
select_a_option_3_gonna_be_changed_how_many_added_in_ui_.BackgroundColor3 = Color3.new(1, 1, 1)
select_a_option_3_gonna_be_changed_how_many_added_in_ui_.BorderSizePixel = 0
select_a_option_3_gonna_be_changed_how_many_added_in_ui_.BorderColor3 = Color3.new()
select_a_option_3_gonna_be_changed_how_many_added_in_ui_.TextSize = 14
select_a_option_3_gonna_be_changed_how_many_added_in_ui_.Size = UDim2.new(0, 79, 0, 24)
select_a_option_3_gonna_be_changed_how_many_added_in_ui_.Parent = option_3

local uIStroke_7 = Instance.new("UIStroke")
uIStroke_7.Name = "UIStroke"
uIStroke_7.Color = Color3.new(0.0863, 0.0863, 0.0863)
uIStroke_7.Parent = dropdown_list_size_depends_how_much_options_does_that_have_

local option_2 = Instance.new("TextLabel")
option_2.Name = "Option 2"
option_2.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
option_2.TextColor3 = Color3.new(0.498, 0.498, 0.498)
option_2.Text = "Option 2"
option_2.BackgroundColor3 = Color3.new(1, 1, 1)
option_2.BackgroundTransparency = 1
option_2.Position = UDim2.new(0, 0, 0.37, 0)
option_2.BorderSizePixel = 0
option_2.BorderColor3 = Color3.new()
option_2.TextSize = 12
option_2.Size = UDim2.new(0, 57, 0, 24)
option_2.Parent = dropdown_list_size_depends_how_much_options_does_that_have_

local select_a_option_2_gonna_be_changed_how_many_added_in_ui_ = Instance.new("TextButton")
select_a_option_2_gonna_be_changed_how_many_added_in_ui_.Name = "Select a option (2) (gonna  be changed how many added in ui)"
select_a_option_2_gonna_be_changed_how_many_added_in_ui_.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
select_a_option_2_gonna_be_changed_how_many_added_in_ui_.TextColor3 = Color3.new()
select_a_option_2_gonna_be_changed_how_many_added_in_ui_.Text = ""
select_a_option_2_gonna_be_changed_how_many_added_in_ui_.BackgroundTransparency = 1
select_a_option_2_gonna_be_changed_how_many_added_in_ui_.BackgroundColor3 = Color3.new(1, 1, 1)
select_a_option_2_gonna_be_changed_how_many_added_in_ui_.BorderSizePixel = 0
select_a_option_2_gonna_be_changed_how_many_added_in_ui_.BorderColor3 = Color3.new()
select_a_option_2_gonna_be_changed_how_many_added_in_ui_.TextSize = 14
select_a_option_2_gonna_be_changed_how_many_added_in_ui_.Size = UDim2.new(0, 79, 0, 24)
select_a_option_2_gonna_be_changed_how_many_added_in_ui_.Parent = option_2

local imageLabel_2 = Instance.new("ImageLabel")
imageLabel_2.Name = "ImageLabel"
imageLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
imageLabel_2.Image = "rbxassetid://10709791523"
imageLabel_2.BackgroundTransparency = 1
imageLabel_2.Position = UDim2.new(0.722, 0, 0.241, 0)
imageLabel_2.BorderColor3 = Color3.new()
imageLabel_2.BorderSizePixel = 0
imageLabel_2.Size = UDim2.new(0, 15, 0, 15)
imageLabel_2.Parent = dropdown_selected_

local uIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
uIAspectRatioConstraint_4.Name = "UIAspectRatioConstraint"
uIAspectRatioConstraint_4.Parent = imageLabel_2

local uIStroke_8 = Instance.new("UIStroke")
uIStroke_8.Name = "UIStroke"
uIStroke_8.Color = Color3.new(0.0863, 0.0863, 0.0863)
uIStroke_8.Parent = dropdown_selected_

local option_1_3 = Instance.new("TextLabel")
option_1_3.Name = "Option 1"
option_1_3.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
option_1_3.TextColor3 = Color3.new(0.8, 0.8, 0.8)
option_1_3.Text = "Option 1"
option_1_3.BackgroundColor3 = Color3.new(1, 1, 1)
option_1_3.BackgroundTransparency = 1
option_1_3.Position = UDim2.new(0, 0, 0.0699, 0)
option_1_3.BorderSizePixel = 0
option_1_3.BorderColor3 = Color3.new()
option_1_3.TextSize = 12
option_1_3.Size = UDim2.new(0, 57, 0, 24)
option_1_3.Parent = dropdown_selected_

local uICorner_17 = Instance.new("UICorner")
uICorner_17.Name = "UICorner"
uICorner_17.CornerRadius = UDim.new(0, 4)
uICorner_17.Parent = dropdown_selected_

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

local tabs_System = Instance.new("Frame")
tabs_System.Name = "Tabs System"
tabs_System.BackgroundColor3 = Color3.new(1, 1, 1)
tabs_System.BackgroundTransparency = 1
tabs_System.Position = UDim2.new(0.00971, 0, 0.131, 0)
tabs_System.BorderColor3 = Color3.new()
tabs_System.BorderSizePixel = 0
tabs_System.Size = UDim2.new(0, 211, 0, 387)
tabs_System.Parent = main

local example_Tab_selected_ = Instance.new("Frame")
example_Tab_selected_.Name = "Example Tab (selected)"
example_Tab_selected_.BackgroundColor3 = Color3.new(0.0392, 0.0392, 0.0588)
example_Tab_selected_.Position = UDim2.new(0.013, 0, 0.0256, 0)
example_Tab_selected_.BorderColor3 = Color3.new()
example_Tab_selected_.BorderSizePixel = 0
example_Tab_selected_.Size = UDim2.new(0, 231, 0, 36)
example_Tab_selected_.Parent = tabs_System

local icon_of_tabs_can_be_changed_with_ids_ = Instance.new("ImageLabel")
icon_of_tabs_can_be_changed_with_ids_.Name = "Icon of tabs (can be changed with ids)"
icon_of_tabs_can_be_changed_with_ids_.ImageColor3 = Color3.new(0.435, 0.416, 0.831)
icon_of_tabs_can_be_changed_with_ids_.BorderColor3 = Color3.new()
icon_of_tabs_can_be_changed_with_ids_.Image = "rbxassetid://10747830374"
icon_of_tabs_can_be_changed_with_ids_.BackgroundTransparency = 1
icon_of_tabs_can_be_changed_with_ids_.Position = UDim2.new(0.0471, 0, 0.188, 0)
icon_of_tabs_can_be_changed_with_ids_.BackgroundColor3 = Color3.new(1, 1, 1)
icon_of_tabs_can_be_changed_with_ids_.BorderSizePixel = 0
icon_of_tabs_can_be_changed_with_ids_.Size = UDim2.new(0, 20, 0, 20)
icon_of_tabs_can_be_changed_with_ids_.Parent = example_Tab_selected_

local uIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
uIAspectRatioConstraint_5.Name = "UIAspectRatioConstraint"
uIAspectRatioConstraint_5.Parent = icon_of_tabs_can_be_changed_with_ids_

local uIStroke_9 = Instance.new("UIStroke")
uIStroke_9.Name = "UIStroke"
uIStroke_9.Color = Color3.new(0.0667, 0.0667, 0.098)
uIStroke_9.Thickness = 1.2
uIStroke_9.Parent = example_Tab_selected_

local textButton = Instance.new("TextButton")
textButton.Name = "TextButton"
textButton.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
textButton.TextColor3 = Color3.new()
textButton.Text = ""
textButton.BackgroundColor3 = Color3.new(1, 1, 1)
textButton.BackgroundTransparency = 1
textButton.Position = UDim2.new(-1.35e-07, 0, 0, 0)
textButton.BorderSizePixel = 0
textButton.BorderColor3 = Color3.new()
textButton.TextSize = 14
textButton.Size = UDim2.new(0, 226, 0, 35)
textButton.Parent = example_Tab_selected_

local uICorner_18 = Instance.new("UICorner")
uICorner_18.Name = "UICorner"
uICorner_18.CornerRadius = UDim.new(0, 9)
uICorner_18.Parent = example_Tab_selected_

local exampleTabName = Instance.new("TextLabel")
exampleTabName.Name = "ExampleTabName"
exampleTabName.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
exampleTabName.TextColor3 = Color3.new(0.475, 0.451, 0.902)
exampleTabName.Text = "Combat"
exampleTabName.BackgroundColor3 = Color3.new(1, 1, 1)
exampleTabName.BackgroundTransparency = 1
exampleTabName.Position = UDim2.new(0.185, 0, 0.184, 0)
exampleTabName.BorderSizePixel = 0
exampleTabName.BorderColor3 = Color3.new()
exampleTabName.TextSize = 16
exampleTabName.Size = UDim2.new(0, 78, 0, 21)
exampleTabName.Parent = example_Tab_selected_

local example_Tab_unselected_ = Instance.new("Frame")
example_Tab_unselected_.Name = "Example Tab (unselected)"
example_Tab_unselected_.BackgroundColor3 = Color3.new(0.0392, 0.0392, 0.0588)
example_Tab_unselected_.BackgroundTransparency = 1
example_Tab_unselected_.Position = UDim2.new(0.0621, 0, 0.164, 0)
example_Tab_unselected_.BorderColor3 = Color3.new()
example_Tab_unselected_.BorderSizePixel = 0
example_Tab_unselected_.Size = UDim2.new(0, 162, 0, 34)
example_Tab_unselected_.Parent = tabs_System

local exampleTabName_unselected = Instance.new("TextLabel")
exampleTabName_unselected.Name = "ExampleTabName(unselected"
exampleTabName_unselected.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
exampleTabName_unselected.TextColor3 = Color3.new(1, 1, 1)
exampleTabName_unselected.Text = "Combat"
exampleTabName_unselected.BackgroundColor3 = Color3.new(1, 1, 1)
exampleTabName_unselected.BackgroundTransparency = 1
exampleTabName_unselected.Position = UDim2.new(0.196, 0, 0.0896, 0)
exampleTabName_unselected.BorderSizePixel = 0
exampleTabName_unselected.BorderColor3 = Color3.new()
exampleTabName_unselected.TextSize = 16
exampleTabName_unselected.Size = UDim2.new(0, 78, 0, 21)
exampleTabName_unselected.Parent = example_Tab_unselected_

local icon_of_tabs_can_be_changed_with_ids_UNSELECTED_ = Instance.new("ImageLabel")
icon_of_tabs_can_be_changed_with_ids_UNSELECTED_.Name = "Icon of tabs (can be changed with ids)(UNSELECTED)"
icon_of_tabs_can_be_changed_with_ids_UNSELECTED_.BackgroundColor3 = Color3.new(1, 1, 1)
icon_of_tabs_can_be_changed_with_ids_UNSELECTED_.Image = "rbxassetid://10747830374"
icon_of_tabs_can_be_changed_with_ids_UNSELECTED_.BackgroundTransparency = 1
icon_of_tabs_can_be_changed_with_ids_UNSELECTED_.Position = UDim2.new(0, 0, 0.104, 0)
icon_of_tabs_can_be_changed_with_ids_UNSELECTED_.BorderColor3 = Color3.new()
icon_of_tabs_can_be_changed_with_ids_UNSELECTED_.BorderSizePixel = 0
icon_of_tabs_can_be_changed_with_ids_UNSELECTED_.Size = UDim2.new(0, 20, 0, 20)
icon_of_tabs_can_be_changed_with_ids_UNSELECTED_.Parent = example_Tab_unselected_

local uIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
uIAspectRatioConstraint_6.Name = "UIAspectRatioConstraint"
uIAspectRatioConstraint_6.Parent = icon_of_tabs_can_be_changed_with_ids_UNSELECTED_

local textButton_2 = Instance.new("TextButton")
textButton_2.Name = "TextButton"
textButton_2.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
textButton_2.TextColor3 = Color3.new()
textButton_2.Text = ""
textButton_2.BackgroundTransparency = 1
textButton_2.BackgroundColor3 = Color3.new(1, 1, 1)
textButton_2.BorderSizePixel = 0
textButton_2.BorderColor3 = Color3.new()
textButton_2.TextSize = 14
textButton_2.Size = UDim2.new(0, 186, 0, 31)
textButton_2.Parent = example_Tab_unselected_

local just_a_effect_3 = Instance.new("Frame")
just_a_effect_3.Name = "just a effect"
just_a_effect_3.BackgroundColor3 = Color3.new(0.0902, 0.0902, 0.114)
just_a_effect_3.Position = UDim2.new(0.348, 0, 0.524, 0)
just_a_effect_3.BorderColor3 = Color3.new()
just_a_effect_3.BorderSizePixel = 0
just_a_effect_3.Size = UDim2.new(0, 235, 0, 1)
just_a_effect_3.Parent = main

local color_rgb_description_can_be_changed_ = Instance.new("TextLabel")
color_rgb_description_can_be_changed_.Name = "color rgb description (can be changed)"
color_rgb_description_can_be_changed_.FontFace = Font.new(
    "rbxasset://fonts/families/SourceSansPro.json",
    Enum.FontStyle.Normal,
    Enum.FontWeight.SemiBold
)
color_rgb_description_can_be_changed_.TextColor3 = Color3.new(0.42, 0.42, 0.424)
color_rgb_description_can_be_changed_.BorderColor3 = Color3.new()
color_rgb_description_can_be_changed_.Text = "Description"
color_rgb_description_can_be_changed_.BackgroundColor3 = Color3.new(1, 1, 1)
color_rgb_description_can_be_changed_.BorderSizePixel = 0
color_rgb_description_can_be_changed_.BackgroundTransparency = 1
color_rgb_description_can_be_changed_.Position = UDim2.new(0.332, 0, 0.463, 0)
color_rgb_description_can_be_changed_.TextStrokeColor3 = Color3.new(0.365, 0.365, 0.369)
color_rgb_description_can_be_changed_.TextSize = 15
color_rgb_description_can_be_changed_.Size = UDim2.new(0, 98, 0, 23)
color_rgb_description_can_be_changed_.Parent = main
