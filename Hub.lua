_G = {
    DiscordURL = 'https://discord.gg/Nd7geN8x6C',
    SmartExec = false,
    WalkSpeed = 16,
    JumpPower = 32
}

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Exodus Hub",
    SubTitle = "by Yellow",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Home", Icon = "home" }),
    Scripts = Window:AddTab({ Title = "Scripts", Icon = "scroll" }),
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

Window:SelectTab(1)

Tabs.Main:AddButton({
    Title = "Discord",
    Description = "Join our Discord to stay up to date!",
    Callback = function()
        setclipboard(_G.DiscordURL)
        Fluent:Notify({
            Title = "Success",
            Content = "Our Discord URL was saved to your clipboard!",
            SubContent = "Exodus Hub",
            Duration = 5
        })
    end
})

Tabs.Main:AddParagraph({
    Title = "Credits",
    Content = "All credits for this hub go to:\n\t- YellowTripleG\n\t- Gato"
})

local VerifiedSection = Tabs.Scripts:AddSection("Verified Scripts")

VerifiedSection:AddButton({
    Title = "Pet Simulator 99 ★",
    Description = "This is the only Pet Sim 99 script you'll ever need!\nCreated by YellowTripleG",
    Callback = function()
        Fluent:Notify({
            Title = "Script Execution",
            Content = "Now executing Yellow's Hub",
            SubContent = "Exodus Hub",
            Duration = 5
        })
    end
})
VerifiedSection:AddButton({
    Title = "Miner's Haven ★",
    Description = "This is an All-In-One script for Miner's Haven!\nCreated by YellowTripleG",
    Callback = function()
        Fluent:Notify({
            Title = "Script Execution",
            Content = "Now executing Miner's Haven Ultimate",
            SubContent = "Exodus Hub",
            Duration = 5
        })
    end
})

local UnverifiedSection = Tabs.Scripts:AddSection("Unverified Scripts")

UnverifiedSection:AddButton({
    Title = "REDZ Hub",
    Description = "A popular alternative to Yellow's Hub\nCreated by REDZ",
    Callback = function()
        Window:Dialog({
            Title = "Disclaimer",
            Content = "This script may not be safe as it is unverified; execute at your own risk.",
            Buttons = {
                { 
                    Title = "Execute",
                    Callback = function()
                        Fluent:Notify({
                            Title = "Script Execution",
                            Content = "Now executing REDZ Hub",
                            SubContent = "Exodus Hub",
                            Duration = 5
                        })
                    end 
                }, {
                    Title = "Cancel",
                    Callback = function()
                        
                    end 
                }
            }
        })
    end
})

local WSSlider = Tabs.Player:AddSlider("Slider", 
{
    Title = "Walk Speed",
    Description = "Speed up or slow down, it's up to you!",
    Default = _G.WalkSpeed,
    Min = 16,
    Max = 256,
    Rounding = 1,
    Callback = function(Value)
        _G.WalkSpeed = Value
    end
})

local JPSlider = Tabs.Player:AddSlider("Slider", 
{
    Title = "Jump Power",
    Description = "Jump as high or as low, it's up to you!",
    Default = _G.JumpPower,
    Min = 32,
    Max = 256,
    Rounding = 1,
    Callback = function(Value)
        _G.JumpPower = Value
    end
})

local FlightToggle = Tabs.Player:AddToggle("MyToggle", 
{
    Title = "Fly", 
    Default = false,
    Callback = function(state)
        _G.SmartExec = state
    end 
})

local SEToggle = Tabs.Settings:AddToggle("MyToggle", 
{
    Title = "Smart Execution", 
    Description = "Verified scripts will not execute if you aren't in the correct game",
    Default = false,
    Callback = function(state)
        _G.SmartExec = state
    end 
})

local ThemeDropdown = Tabs.Settings:AddDropdown("Dropdown", {
    Title = "Theme",
    Description = "Change the theme of Exodus Hub",
    Values = {
        "Amethyst",
        "Aqua",
        "Dark",
        "Darker",
        "Light",
        "Rose"
    },
    Multi = false,
    Default = "Amethyst",
})

ThemeDropdown:OnChanged(function(Value)
    Fluent:SetTheme(Value)
end)

game:GetService("RunService").RenderStepped:connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.WalkSpeed
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = _G.JumpPower
end)