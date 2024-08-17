_G = {
    DiscordURL = 'https://discord.gg/Nd7geN8x6C',
    SmartExec = false,
    WalkSpeed = 16,
    JumpPower = 32,
    Keys = {
        EclipseHub = '',
        HugeGames = ''
    }
}

Scripts = {
    Verified = {
        {
            Title = "Universal ESP",
            Description = "This is the best ESP script you could ask for\nCreated by ic3w0lf22",
            Denied = nil,
            URL = "https://raw.githubusercontent.com/aaronmansfield5/Exodus-Hub/dev/scripts/esp.lua",
            PlaceId = nil,
            Key = nil
        }, {
            Title = "Universal Aimbot",
            Description = "This is the best Aimbot script you could ask for\nCreated by Eclipse Hub",
            Denied = { 'Solara' },
            URL = "",
            PlaceId = nil,
            Key = nil
        }, {
            Title = "Huge Games",
            Description = "This is the only Pet Sim 99 script you'll ever need\nCreated by HugeGames",
            Denied = { 'Solara' },
            URL = "https://HugeGames.io/ps99",
            PlaceId = 8737899170,
            Key = nil
        }, {
            Title = "Miner's Haven Ultimate",
            Description = "This is an All-In-One script for Miner's Haven\nCreated by YellowTripleG",
            Denied = nil,
            URL = "https://raw.githubusercontent.com/aaronmansfield5/Exodus-Hub/dev/scripts/MH.lua",
            PlaceId = 258258996,
            Key = nil
        }
    },
    Unverified = {
        {
            Title = "REDZ Hub",
            Description = "A popular PS99 utilities script\nCreated by REDZ",
            URL = ""
        }
    }
}

local name, version = getexecutorname()
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/aaronmansfield5/Exodus-Hub/dev/modules/utils.lua"))()
local Execution = loadstring(game:HttpGet("https://raw.githubusercontent.com/aaronmansfield5/Exodus-Hub/dev/modules/execution.lua"))()
local Flight = loadstring(game:HttpGet("https://raw.githubusercontent.com/aaronmansfield5/Exodus-Hub/dev/scripts/fly.lua"))()

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
    Keys = Window:AddTab({ Title = "Keys", Icon = "key" }),
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

for i, v in ipairs(Scripts.Verified) do
    VerifiedSection:AddButton({
        Title = v.Title.." ★",
        Description = v.Description,
        Callback = function()
            if(_G.SmartExec and v.PlaceId) then
                if(game.PlaceId == v.PlaceId) then
                    if(not v.Denied) then
                        Fluent:Notify({
                            Title = "Script Execution",
                            Content = "Now executing "..v.Title,
                            SubContent = "Exodus Hub",
                            Duration = 5
                        })
                        loadstring(game:HttpGet(v.URL, true))()
                    elseif(Utils.Includes(v.Denied, name)) then
                        Window:Dialog({
                            Title = "Disclaimer",
                            Content = "We have detected that you're using "..name.."; as a result '"..v.Title.."' may not run as expected.",
                            Buttons = {
                                { 
                                    Title = "Execute",
                                    Callback = function()
                                        Fluent:Notify({
                                            Title = "Script Execution",
                                            Content = "Now executing "..v.Title,
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
                    else
                        Fluent:Notify({
                            Title = "Script Execution",
                            Content = "Now executing "..v.Title,
                            SubContent = "Exodus Hub",
                            Duration = 5
                        })
                        loadstring(game:HttpGet(v.URL, true))()
                    end
                else
                    Window:Dialog({
                        Title = "Disclaimer",
                        Content = "Smart Execution has detected that you are not in the game intended for "..v.Title..". Would you like to execute anyway?",
                        Buttons = {
                            { 
                                Title = "Execute",
                                Callback = function()
                                    Fluent:Notify({
                                        Title = "Script Execution",
                                        Content = "Now executing "..v.Title,
                                        SubContent = "Exodus Hub",
                                        Duration = 5
                                    })
                                    loadstring(game:HttpGet(v.URL, true))()
                                end
                            }, {
                                Title = "Cancel",
                                Callback = function()
                                    
                                end 
                            }
                        }
                    })
                end
            else
                if(not v.Denied) then
                    Fluent:Notify({
                        Title = "Script Execution",
                        Content = "Now executing "..v.Title,
                        SubContent = "Exodus Hub",
                        Duration = 5
                    })
                    loadstring(game:HttpGet(v.URL, true))()
                elseif(Utils.Includes(v.Denied, name)) then
                    Window:Dialog({
                        Title = "Disclaimer",
                        Content = "We have detected that you're using "..name.."; as a result '"..v.Title.."' may not run as expected.",
                        Buttons = {
                            { 
                                Title = "Execute",
                                Callback = function()
                                    Fluent:Notify({
                                        Title = "Script Execution",
                                        Content = "Now executing "..v.Title,
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
                else
                    Fluent:Notify({
                        Title = "Script Execution",
                        Content = "Now executing "..v.Title,
                        SubContent = "Exodus Hub",
                        Duration = 5
                    })
                    loadstring(game:HttpGet(v.URL, true))()
                end
            end
        end
    })
end

local UnverifiedSection = Tabs.Scripts:AddSection("Unverified Scripts")

for i, v in ipairs(Scripts.Unverified) do
    UnverifiedSection:AddButton({
        Title = v.Title,
        Description = v.Description,
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
                                Content = "Now executing "..v.Title,
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
end

local Input = Tabs.Keys:AddInput("Input", {
    Title = "Universal Aimbot",
    Description = "Enter your key for Eclipse Hub",
    Placeholder = "Key here...",
    Numeric = false,
    Finished = true,
    Callback = function(Value)
        for _, script in ipairs(Scripts.Verified) do
            if script.Title == "Universal Aimbot" then
                script.Key = Value
                break
            end
        end
    end
})

local Input = Tabs.Keys:AddInput("Input", {
    Title = "Huge Games",
    Description = "Enter your key for Huge Games",
    Placeholder = "Key here...",
    Numeric = false,
    Finished = true,
    Callback = function(Value)
        for _, script in ipairs(Scripts.Verified) do
            if script.Title == "Huge Games" then
                script.Key = Value
                break
            end
        end
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
        Flight.Toggle(state)
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
    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = _G.WalkSpeed
    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = _G.JumpPower
end)