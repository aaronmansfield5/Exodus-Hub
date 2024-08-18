_G = {
    DiscordURL = 'https://discord.gg/Nd7geN8x6C',
    SmartExec = true,
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
            Title = "Infinite Yield",
            Description = "The best AIO general script-line hub\n Created by Edge",
            Denied = nil,
            URL = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
            PlaceId = nil,
            Key = nil
        }, {
            Title = "Universal ESP",
            Description = "This is the best ESP script you could ask for\nCreated by ic3w0lf22",
            Denied = nil,
            URL = "https://raw.githubusercontent.com/aaronmansfield5/Exodus-Hub/main/scripts/esp.lua",
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
            Title = "Dark Dex",
            Description = "An essential game explorer for all script developers\nCreated by HummingBird8",
            Denied = nil,
            URL = "https://raw.githubusercontent.com/HummingBird8/HummingRn/main/OptimizedDexForSolara.lua",
            PlaceId = nil,
            Key = nil
        }, {
            Title = "Remote Spy",
            Description = "The only valid Remote Spy solution\nCreated by Eclipse nXjd3",
            Denied = { 'Solara' },
            URL = "https://raw.githubusercontent.com/aaronmansfield5/Exodus-Hub/main/scripts/remotespy.lua",
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
            Description = "This is an All-In-One script for Miner's Haven\nCreated by Yellow",
            Denied = nil,
            URL = "https://raw.githubusercontent.com/aaronmansfield5/Exodus-Hub/main/scripts/MH.lua",
            PlaceId = 258258996,
            Key = nil
        }, {
            Title = "Cheese Escape",
            Description = "This is the best script available for Cheese Escape\nCreated by Minion",
            Denied = nil,
            URL = "https://raw.githubusercontent.com/MinionRoblox/CHEESE-ESCAPE/main/Scripts%20from%20Minion.lua",
            PlaceId = 5777099015,
            Key = nil
        }, {
            Title = "Butter Hub",
            Description = "The only viable option for Lumber Tycoon 2\nCreated by Butterisgood",
            Denied = nil,
            URL = "https://raw.githubusercontent.com/Butterisgood/Butter/main/Root2.lua",
            PlaceId = 13822889,
            Key = nil
        }, {
            Title = "Bee Swarm Simulator",
            Description = "The ultimate farming tool for Bee Swarm Simulator\nCreated by NukeVsCity",
            Denied = nil,
            URL = "https://raw.githubusercontent.com/NukeVsCity/Scripts2024/main/KocmocV3",
            PlaceId = 1537690962,
            Key = nil
        }, {
            Title = "Huge Games PSX",
            Description = "This script by Huge Games is by far the best for PSX\nCreated by Huge Games",
            Denied = { 'Solara' },
            URL = "https://v3.hugegames.io/psx",
            PlaceId = 6284583030,
            Key = nil
        }, {
            Title = "Wind.wtf Rivals",
            Description = "This is our go-to for when we play Rivals\nCreated by Hell",
            Denied = nil,
            URL = "https://raw.githubusercontent.com/helldevelopment/RobloxScripts/main/SanityLoader.lua",
            PlaceId = 17625359962,
            Key = nil
        }, {
            Title = "Rushmore Restored",
            Description = "The most over-powered Zombie rush script around\nCreated by uvgame",
            Denied = nil,
            URL = "https://raw.githubusercontent.com/uvgame/scriptblox/main/rushmore-restored",
            PlaceId = 137885680,
            Key = nil
        }, {
            Title = "BE Hub",
            Description = "The only solution for Block Eaters\nCreated by Yellow",
            Denied = nil,
            URL = "https://raw.githubusercontent.com/aaronmansfield5/Exodus-Hub/main/scripts/be.lua",
            PlaceId = 16178787698,
            Key = nil
        }, {
            Title = "Cart Ride Hub",
            Description = "Auto Farm on Ride a Cart Simulator with this script!\nCreated by Yellow",
            Denied = nil,
            URL = "https://raw.githubusercontent.com/aaronmansfield5/Exodus-Hub/main/scripts/cartsim.lua",
            PlaceId = 14267508433,
            Key = nil
        }
    },
    Unverified = {
        {
            Title = "REDz Hub",
            Description = "A popular PS99 utilities script\nCreated by REDz",
            URL = "https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"
        }, {
            Title = "Annie Hub",
            Description = "An awesome Blox Fruits script\nCreated by Mars",
            URL = "https://raw.githubusercontent.com/1st-Mars/Annie/main/1st.lua"
        }, {
            Title = "Da Hood Cash Farmer",
            Description = "A new Da Hood Cash script\nCreated by trans",
            URL = "https://rentry.co/xy2cmx6z/raw"
        }, {
            Title = "NVC Pet Sim 99",
            Description = "An all new Pet Simulator 99 script\nCreated by NukeVsCity",
            URL = "https://raw.githubusercontent.com/NukeVsCity/Scripts2024/main/ps99"
        }
    }
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/aaronmansfield5/Exodus-Hub/main/autoexec/init.lua", false))()

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Execution = loadstring(game:HttpGet("https://raw.githubusercontent.com/aaronmansfield5/Exodus-Hub/main/modules/execution.lua", false))()
local Flight = loadstring(game:HttpGet("https://raw.githubusercontent.com/aaronmansfield5/Exodus-Hub/main/scripts/fly.lua"))()

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
    Content = "All credits for this hub go to:\n\t- Yellow"
})

local VerifiedSection = Tabs.Scripts:AddSection("Verified Scripts")

for i, v in ipairs(Scripts.Verified) do
    VerifiedSection:AddButton({
        Title = v.Title.." ★",
        Description = v.Description,
        Callback = function()
            for _, script in ipairs(Scripts.Verified) do
                if script.Title == v.Title then
                    Execution.Execute(script, v, Fluent, Window)
                    break
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
    })
end

local Input = Tabs.Keys:AddInput("Input", {
    Title = "Universal Aimbot",
    Description = "Enter your key for Eclipse Hub",
    Placeholder = "Key here...",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        for _, script in ipairs(Scripts.Verified) do
            if script.Title == "Universal Aimbot" then
                if Value ~= "" then
                    script.Key = Value
                else
                    script.Key = nil
                end
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
    Finished = false,
    Callback = function(Value)
        for _, script in ipairs(Scripts.Verified) do
            if script.Title == "Huge Games" then
                if Value ~= "" then
                    script.Key = Value
                else
                    script.Key = nil
                end
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
    Default = true,
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
    local Player = game:GetService("Players").LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:wait()
    local Humanoid = Character:FindFirstChild("Humanoid")

    Humanoid.WalkSpeed = _G.WalkSpeed
    Humanoid.JumpPower = _G.JumpPower
end)