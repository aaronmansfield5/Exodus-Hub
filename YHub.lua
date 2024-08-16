_G.YH = {
    AutoCoin = false,
    AutoBag = false,
    AutoFlag = {
        CurrentFlag = "Magnet Flag",
        Auto = false,
        Flags = {
            Magnet_Flag = "2d848b10fd0c42da8014584ce5b4bc3f",
            Coins_Flag = "87e9405ba05044d3a584a3410a4915a1",
            Hasty_Flag = "8fd11cf8f6e34f5697e31508b2a2f0b4",
            Diamonds_Flag = "6b7e3ae1060b4086935a46c2cb83c1b8",
            Fortune_Flag = "6977604a4d8442879a51e75892b7fafe"
        }
    },
    AutoHatch = {
        CurrentEgg = "",
        Hatch = false,
        Amount = 1
    },
    Teleport = {
        Area = "",
        Obby = ""
    },
    AutoObby = {
        Obby = "",
        Obbies = {

        }
    },
    AutoMerchant = {
        Regular = false,
        Advanced = false,
        Garden = false,
        Traveling = false
    },
    Storage = {
        Flags = {

        },
        Eggs = {

        },
        Areas = {

        },
        Obbies = {

        },
        Diamonds = 0
    },
    DailyReward = true,
    DailyRewards = {
        "SmallDailyDiamonds",
        "MediumDailyDiamonds",
        "DailyPotions",
        "DailyEnchants",
        "DailyItems",
        "VIPRewards"
    },
    Render = false,
    AntiAFK = true,
    WebHook = {
        Hook = "",
        Increment = 10000
    }
}

local MoneyLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/aaronmansfield5/Yellow-Hub/main/MoneyLib.lua'))()
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

function FindChild(parent, child)
    local found = nil
    for i, v in pairs(parent:GetChildren()) do
        if(v.Name:match(child)) then
            found = v
        end    
    end
    return found
end

function GetDescendant(path, name)
    for i,v in pairs(path:GetDescendants()) do
        if(v.Name == name) then
            return v
        end
    end
    return false
end

function CheckPlatform()
    if (game:GetService("GuiService"):IsTenFootInterface()) then
        return "Console"
    elseif (game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").MouseEnabled) then
        return "Mobile"
    else
        return "PC"
    end
end

if(game.PlaceId == 8737899170 or game.PlaceId == 15502339080) then
    local ioAlKMOinas = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")

    ioAlKMOinas.Name = "ioAlKMOinas"
    ioAlKMOinas.Parent = game:GetService("CoreGui")
    ioAlKMOinas.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Name = "okewU9da"
    Frame.Parent = ioAlKMOinas
    Frame.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0, 0, -0.100000001, 0)
    Frame.Size = UDim2.new(1, 0, 1.10000002, 0)
    Frame.ZIndex = 0
    Frame.Visible = false
    
    for i, v in pairs(game.ReplicatedStorage["__DIRECTORY"].MiscItems.Categorized.Flags:GetChildren()) do
        table.insert(_G.YH.Storage.Flags, v.Name)
    end
    
    for i, v in pairs(game.ReplicatedStorage["__DIRECTORY"].Eggs["Zone Eggs"]:GetChildren()) do
        table.insert(_G.YH.Storage.Eggs, v.Name)
    end

    for i,v in pairs(game.Workspace.Map:GetChildren()) do
        if(v.Name:match(" | ")) then
            table.insert(_G.YH.Storage.Areas, v.Name)
        end
    end

    for i,v in pairs(game.Workspace["__THINGS"].Instances:GetChildren()) do
        if(not v.Name:match("Blueprint")) then
            table.insert(_G.YH.Storage.Obbies, v.Name)
            if(not v.Name:match("Spawn") and v.Name:match("Obby")) then
                table.insert(_G.YH.AutoObby.Obbies, v.Name)
            end
        end
    end
    
    local Window = OrionLib:MakeWindow({
        Name = "Yellow Hub: Pet Simulator 99",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "YellowHub-PS99",
        IntroText = "Yellow Hub",
        IntroIcon = "rbxassetid://8912046920"--[[,
        Icon = "rbxassetid://8912046920"]]
    })
    
    local FTab = Window:MakeTab({
        Name = "Farming",
        Icon = "rbxassetid://4400700509",
        PremiumOnly = false
    })
    
    local Platform = CheckPlatform()

    local FS = FTab:AddSection({
        Name = "General"
    })

    FS:AddToggle({
        Name = "Auto Collect Coins",
        Default = _G.YH.AutoCoin,
        Save = true,
        Flag = "ACC",
        Callback = function(Value)
            _G.YH.AutoCoin = Value
        end    
    })
    
    FS:AddToggle({
        Name = "Auto Collect Lootbags",
        Default = _G.YH.AutoBag,
        Save = true,
        Flag = "ACB",
        Callback = function(Value)
            _G.YH.AutoBag = Value
        end    
    })
    
    FS:AddDropdown({
        Name = "Flag",
        Default = _G.YH.AutoFlag.CurrentFlag,
        Options = _G.YH.Storage.Flags,
        Save = true,
        Flag = "CF",
        Callback = function(Value)
            _G.YH.AutoFlag.CurrentFlag = Value
        end    
    })
    
    FS:AddToggle({
        Name = "Auto Flags",
        Default = _G.YH.AutoFlag.Auto,
        Save = true,
        Flag = "AF",
        Callback = function(Value)
            _G.YH.AutoFlag.Auto = Value
        end    
    })

    FS:AddToggle({
        Name = "Auto Daily Rewards",
        Default = true,
        Save = true,
        Flag = "DR",
        Callback = function(Value)
            _G.YH.DailyReward = Value
        end
    })

    local FS2 = FTab:AddSection({
        Name = "Mini Games"
    })

    FS2:AddDropdown({
        Name = "Obby",
        Default = _G.YH.AutoObby.Obbies[1],
        Options = _G.YH.AutoObby.Obbies,
        Save = true,
        Flag = "AO",
        Callback = function(Value)
            _G.YH.AutoObby.Obby = Value
        end 
    }) 

    FS2:AddButton({
        Name = "Complete Obby",
        Callback = function(Value)
            local SelectedObby = game.Workspace:FindFirstChild("__THINGS").Instances[_G.YH.AutoObby.Obby]
            if(not SelectedObby["Teleports"]:FindFirstChild("Enter")) then
                OrionLib:MakeNotification({
                    Name = "Error",
	                Content = "You do not have this zone unlocked!",
	                Image = "rbxassetid://7733954760",
	                Time = 5
                })
            else
                if(_G.YH.AutoObby.Obby:match("Spawn") or not _G.YH.AutoObby.Obby:match("Obby")) then
                    OrionLib:MakeNotification({
                        Name = "Error",
                        Content = "This obby does not yet work!",
                        Image = "rbxassetid://7733954760",
                        Time = 5
                    })
                else
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedObby["Teleports"]:FindFirstChild("Enter").CFrame

                    wait(3.5)
    
                    local Obby = game.Workspace:FindFirstChild("__THINGS"):FindFirstChild("__INSTANCE_CONTAINER").Active:WaitForChild(_G.YH.AutoObby.Obby)
    
                    wait()
    
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Obby.Interactable.StartLine.CFrame
    
                    wait()
    
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Obby.Interactable.Goal.Billboard.CFrame
                end
            end
        end
    })

    local FS3 = FTab:AddSection({
        Name = "Merchants"
    })

    FS3:AddToggle({
        Name = "Auto Merchant",
        Save = true,
        Flag = "REG",
        Callback = function(Value)
            if(Value) then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map["19 | Oasis"].INTERACT.Machines.RegularMerchant.PrimaryPart.CFrame
            end
            _G.YH.AutoMerchant.Regular = Value
        end
    })

    FS3:AddToggle({
        Name = "Auto Advanced Merchant",
        Save = true,
        Flag = "ADV",
        Callback = function(Value)
            if(Value) then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map["39 | Ice Rink"].INTERACT.Machines.AdvancedMerchant.PrimaryPart.CFrame
            end
            _G.YH.AutoMerchant.Advanced = Value
        end
    })

    FS3:AddToggle({
        Name = "Auto Garden Merchant",
        Save = true,
        Flag = "GRD",
        Callback = function(Value)
            if(Value) then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map["54 | Flower Field"].INTERACT.Machines.GardenMerchant.PrimaryPart.CFrame
            end
            _G.YH.AutoMerchant.Garden = Value
        end
    })

    FS3:AddToggle({
        Name = "Auto Travelling Merchant",
        Callback = function(Value)
            if(Value) then
                local Merchant = GetDescendant(game.Workspace.Map, "TravelingMerchant")
                if(not Merchant) then
                    OrionLib:MakeNotification({
                        Name = "Error",
                        Content = "The traveling merchant is not available yet.",
                        Image = "rbxassetid://7733954760",
                        Time = 5
                    })
                    _G.YH.AutoMerchant.Traveling = false
                else
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Merchant.PrimaryPart.CFrame
                end
            end
            _G.YH.AutoMerchant.Traveling = Value
        end
    })

    local MS = FTab:AddSection({
        "Misc"
    })

    MS:AddButton({
        Name = "Mark Shiny Relics",
        Callback = function()
            local Relics = game:GetService("Workspace")["__THINGS"].ShinyRelics

            for i,v in pairs(Relics:GetChildren()) do
                if(v.Name == "ShinyRelic" and not v:FindFirstChild("RelicIcon") and v.Transparency == 0) then
                    local RelicIcon = Instance.new("BillboardGui")
                    local Frame = Instance.new("ImageButton")
                    local TextLabel = Instance.new("TextLabel")

                    RelicIcon.Name = "RelicIcon"
                    RelicIcon.Parent = v
                    RelicIcon.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    RelicIcon.Active = true
                    RelicIcon.AlwaysOnTop = true
                    RelicIcon.LightInfluence = 100.000
                    RelicIcon.Size = UDim2.new(4, 0, 4, 0)

                    Frame.Name = "Frame"
                    Frame.Parent = RelicIcon
                    Frame.Active = false
                    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Frame.BackgroundTransparency = 1.000
                    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Frame.BorderSizePixel = 0
                    Frame.Selectable = false
                    Frame.Size = UDim2.new(1, 0, 1, 0)
                    Frame.Image = "rbxassetid://8912046920"

                    TextLabel.Parent = Frame
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    TextLabel.BorderSizePixel = 0
                    TextLabel.Position = UDim2.new(0, 0, 0.75, 0)
                    TextLabel.Size = UDim2.new(1, 0, 0.25, 0)
                    TextLabel.Font = Enum.Font.GothamBold
                    TextLabel.Text = "RELIC"
                    TextLabel.TextColor3 = Color3.fromRGB(255, 0, 4)
                    TextLabel.TextScaled = true
                    TextLabel.TextSize = 14.000
                    TextLabel.TextStrokeTransparency = 0.000
                    TextLabel.TextWrapped = true
                        
                    local newPart = Instance.new("Part")
                    newPart.Size = Vector3.new(4, 1, 4)
                    newPart.Position = v.Position - Vector3.new(0, 5, 0)
                    newPart.Anchored = true
                    newPart.Parent = v

                else
                    if(v.Name == "ShinyRelic" and not v.Transparency == 0) then
                        v:Destroy()
                    end
                end
            end
        end
    })
    
    local PTab = Window:MakeTab({
        Name = "Pets",
        Icon = "rbxassetid://3610237052",
        PremiumOnly = false
    })

    PTab:AddLabel("Currently disabled, join the Discord for updates on this tab!")
    
    local ETab = Window:MakeTab({
        Name = "Eggs",
        Icon = "rbxassetid://8997385940",
        PremiumOnly = false
    })

    if(Platform == "PC") then
        ETab:AddSlider({
            Name = "Hatch Amount",
            Default = _G.YH.AutoHatch.Amount,
            Min = 1,
            Max = 99,
            Color = Color3.fromRGB(255,255,255),
            Increment = 1,
            ValueName = "Eggs",
            Save = true,
            Flag = "EA",
            Callback = function(Value)
                _G.YH.AutoHatch.Amount = Value
            end
        })
    else
        ETab:AddTextbox({
            Name = "Hatch Amount",
            Default = _G.YH.AutoHatch.Amount,
            Save = true,
            Flag = "EA",
            Callback = function(Value)
                _G.YH.AutoHatch.Amount = Value
            end
        })
    end
    
    ETab:AddDropdown({
        Name = "Egg",
        Default = _G.YH.Storage.Eggs[1],
        Options = _G.YH.Storage.Eggs,
        Save = true,
        Flag = "EGG",
        Callback = function(Value)
            _G.YH.AutoHatch.CurrentEgg = Value
        end    
    })
    
    ETab:AddToggle({
        Name = "Auto Hatch",
        Default = _G.YH.AutoHatch.Hatch,
        Save = true,
        Flag = "AH",
        Callback = function(value)
            if(value) then
                for i,v in pairs(game:GetService("Workspace")["__THINGS"].Eggs.Main:GetChildren()) do
                    if(v.Tier.SurfaceGui.TierNum.Text == string.split(_G.YH.AutoHatch.CurrentEgg, " | ")[1]) then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Part.CFrame
                    end
                end
            end
            _G.YH.AutoHatch.Hatch = value
        end
    })

    local TPTab = Window:MakeTab({
        Name = "Teleports",
        Icon = "rbxassetid://7733954760",
        PremiumOnly = falses
    })

    TPTab:AddDropdown({
        Name = "Area",
        Default = _G.YH.Storage.Areas[1],
        Options = _G.YH.Storage.Areas,
        Save = true,
        Flag = "AREA",
        Callback = function(Value)
            _G.YH.Teleport.Area = Value
        end 
    })

    TPTab:AddButton({
        Name = "Teleport to Area",
        Callback = function(Value)
            local SelectedArea = game.Workspace.Map[_G.YH.Teleport.Area]
            if(not SelectedArea["INTERACT"]:FindFirstChild("Teleport")) then
                OrionLib:MakeNotification({
                    Name = "Error",
	                Content = "You do not have this zone unlocked!",
	                Image = "rbxassetid://7733954760",
	                Time = 5
                })
            else
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedArea["INTERACT"]:FindFirstChild("Teleport").CFrame
            end
        end
    })

    TPTab:AddDropdown({
        Name = "Obby",
        Default = _G.YH.Storage.Obbies[1],
        Options = _G.YH.Storage.Obbies,
        Save = true,
        Flag = "OBBY",
        Callback = function(Value)
            _G.YH.Teleport.Obby = Value
        end 
    })

    TPTab:AddButton({
        Name = "Teleport to Obby",
        Callback = function(Value)
            local SelectedObby = game.Workspace:FindFirstChild("__THINGS").Instances[_G.YH.Teleport.Obby]
            if(not SelectedObby["Teleports"]:FindFirstChild("Enter")) then
                OrionLib:MakeNotification({
                    Name = "Error",
	                Content = "You do not have this zone unlocked!",
	                Image = "rbxassetid://7733954760",
	                Time = 5
                })
            else
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedObby["Teleports"]:FindFirstChild("Enter").CFrame
            end
        end
    })
    
    local PlTab = Window:MakeTab({
        Name = "Player",
        Icon = "rbxassetid://6961018885",
        PremiumOnly = false
    })
    
    if(Platform == "PC") then
        PlTab:AddSlider({
            Name = "Walk Speed",
            Min = 0,
            Max = 256,
            Default = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,
            Color = Color3.fromRGB(255,255,255),
            Increment = 1,
            ValueName = "Speed",
            Callback = function(Value)
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
            end    
        })
    else
        PlTab:AddTextbox({
            Name = "Walk Speed",
            Default = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,
            Callback = function(Value)
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
            end    
        })
    end
    
    PlTab:AddToggle({
        Name = "Fly",
        Default = false,
        Callback = function(value)
            print(value)
        end
    })
    
    local STab = Window:MakeTab({
        Name = "Settings",
        Icon = "rbxassetid://4483345737",
        PremiumOnly = false
    })
    
    local WHSection = STab:AddSection({
        Name = "Webhook Options"
    })
    
    WHSection:AddTextbox({
        Name = "Webhook",
        Default = "Input your Discord webhook here!",
        TextDisappear = false,
        Save = true,
        Flag = "WH",
        Callback = function(Value)
            _G.YH.WebHook.Hook = Value
        end	  
    })
    
    WHSection:AddButton({
        Name = "Test Webhook",
        Callback = function()
            request({
                Url = _G.YH.WebHook.Hook,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = game.HttpService:JSONEncode({
                    embeds = {{
                        title = "Pet Simulator 99",
                        description = "This is a test from **Yellow Hub**",
                         author = {
                            name = "Yellow Hub",
                            icon_url = "https://tr.rbxcdn.com/0d3e88fc132d8a2ffb15bd11213a94b9/420/420/Image/Png"
                        },
                        footer = {
                            text = game.Players.LocalPlayer.Name
                        }
                    }}
                })
            })
        end
    })
    
    if(Platform == "PC") then
        WHSection:AddSlider({
            Name = "Diamond Increment",
            Min = 1000,
            Max = 100000,
            Default = _G.YH.WebHook.Increment,
            Color = Color3.fromRGB(255,255,255),
            Increment = 1000,
            ValueName = "Diamonds",
            Save = true,
            Flag = "INC",
            Callback = function(Value)
                _G.YH.WebHook.Increment = Value
            end 
        })
    else
        WHSection:AddTextbox({
            Name = "Diamond Increment",
            Default = _G.YH.WebHook.Increment,
            Save = true,
            Flag = "INC",
            Callback = function(Value)
                _G.YH.WebHook.Increment = Value
            end 
        })
    end
    
    local MSection = STab:AddSection({
        Name = "Misc"
    })
    
    MSection:AddToggle({
        Name = "Anti AFK",
        Default = _G.YH.AntiAFK,
        Callback = function(value)
            _G.YH.AntiAFK = value
        end
    })
    
    MSection:AddToggle({
        Name = "Performance Mode",
        Default = _G.YH.Render,
        Callback = function(value)
            game:GetService("RunService"):Set3dRenderingEnabled(not value)
            Frame.Visible = value
        end
    })
    
    MSection:AddButton({
        Name = "Delete UI",
        Callback = function() 
            OrionLib:Destroy()
        end
    })
    
    local DTab = Window:MakeTab({
        Name = "Discord",
        Icon = "rbxassetid://4384403999",
        PremiumOnly = false
    })
    
    DTab:AddTextbox({
        Name = "URL",
        Default = "https://discord.gg/Nd7geN8x6C",
        TextDisappear = false
    })

    local PnTab = Window:MakeTab({
        Name = "Patch Notes",
        Icon = "rbxassetid://10802181102",
        PremiumOnly = false
    })

    PnTab:AddParagraph("v1.0.7", "> Added relic marking.\n> Added auto garden merchant.")
    PnTab:AddParagraph("v1.0.6", "> Bug fixes & patches.")
    PnTab:AddParagraph("v1.0.5", "> Added auto traveling merchant.\n> Fixed white screen on performance mode.")
    PnTab:AddParagraph("v1.0.4", "> Added auto obby.\n> Added auto merchant.")
    PnTab:AddParagraph("v1.0.3", "> Added auto hatch.\n> Added teleporting.\n> Added auto daily rewards.")
    PnTab:AddParagraph("v1.0.2", "> Fixed issue with slider on mobile.")
    PnTab:AddParagraph("v1.0.1", "> Minor bug fixes.")
    PnTab:AddParagraph("v1.0.0","> Added auto collect coins and bags.\n> Added auto flag.\n> Added the ability to modify your walk speed.\n> Track your progress with webhooks in Settings!")
    
    OrionLib:Init()
    _G.YH.Storage.Diamonds = FindChild(game.Players.LocalPlayer.leaderstats, "Diamond").Value

    local bb = game:GetService('VirtualUser')
    bb:CaptureController()
    
    game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
        if(_G.YH.AutoCoin) then
            for i, v in pairs(game.Workspace["__THINGS"].Orbs:GetChildren()) do
                v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
        if (_G.YH.AutoBag) then
            for i, v in pairs(game.Workspace["__THINGS"].Lootbags:GetChildren()) do
                v.PrimaryPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
        if(_G.YH.AutoFlag.Auto) then
            game:GetService("ReplicatedStorage").Network["Flags: Consume"]:InvokeServer(_G.YH.AutoFlag.CurrentFlag, _G.YH.AutoFlag.Flags[string.gsub(_G.YH.AutoFlag.CurrentFlag, " ", "_")])
        end
        if(_G.YH.AutoHatch.Hatch and _G.YH.AutoHatch.CurrentEgg) then
            local egg = string.split(_G.YH.AutoHatch.CurrentEgg, " | ")[2]
            local result = game:GetService("ReplicatedStorage").Network.Eggs_RequestPurchase:InvokeServer(egg, _G.YH.AutoHatch.Amount)

            if(result) then
                local counter = 0
                while counter < 4 do
                    game["Run Service"].Heartbeat:Wait(0.005)
                    bb:Button1Down(Vector2.new())
                    counter = counter + 1
                end
            end
        end
        if(_G.YH.DailyReward) then
            for i, v in _G.YH.DailyRewards do
                game:GetService("ReplicatedStorage").Network.DailyRewards_Redeem:InvokeServer(v)
            end
        end

        local vals = {
            1,
            2,
            3,
            4,
            5,
            6
        }

        if(_G.YH.AutoMerchant.Regular) then
            for i,v in vals do
                for i = 1, 7 do
                    game:GetService("ReplicatedStorage").Network.Merchant_RequestPurchase:InvokeServer("RegularMerchant", v)
                end
            end
        end
        if(_G.YH.AutoMerchant.Advanced) then
            for i,v in vals do
                for i = 1, 7 do
                    game:GetService("ReplicatedStorage").Network.Merchant_RequestPurchase:InvokeServer("AdvancedMerchant", v)
                end
            end
        end
        if(_G.YH.AutoMerchant.Garden) then
            for i,v in vals do
                for i = 1, 7 do
                    game:GetService("ReplicatedStorage").Network.Merchant_RequestPurchase:InvokeServer("GardenMerchant", v)
                end
            end
        end
        if(_G.YH.AutoMerchant.Traveling) then
            local Merchant = GetDescendant(game.Workspace.Map, "TravelingMerchant")
            if(Merchant) then
                for i,v in {1, 2, 3, 4} do
                    for i = 1, 7 do
                        game:GetService("ReplicatedStorage").Network.TravelingMerchant_RequestPurchase:InvokeServer(i)
                    end
                end
            end
        end
    end)
    
    FindChild(game.Players.LocalPlayer.leaderstats, "Diamond").Changed:Connect(function(newValue, oldValue)
        if (newValue >= _G.YH.Storage.Diamonds + _G.YH.WebHook.Increment and _G.YH.WebHook.Hook:match("http")) then
            _G.YH.Storage.Diamonds = newValue
            request({
                Url = _G.YH.WebHook.Hook,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = game.HttpService:JSONEncode({
                    embeds = {{
                        title = "Pet Simulator 99",
                        description = "You have farmed **"..MoneyLib.HandleMoney(_G.YH.WebHook.Increment).."** 💎. You now have **"..MoneyLib.HandleMoney(newValue).."** 💎!",
                        author = {
                            name = "Yellow Hub",
                            icon_url = "https://tr.rbxcdn.com/0d3e88fc132d8a2ffb15bd11213a94b9/420/420/Image/Png"
                        },
                        footer = {
                            text = game.Players.LocalPlayer.Name
                        }
                    }}
                })
            })
        end
    end)
end

wait(3)

local bb = game:GetService('VirtualUser')

game:GetService('Players').LocalPlayer.Idled:connect(function()
    if(_G.YH.AntiAFK) then
        bb:ClickButton2(Vector2.new())
        OrionLib:MakeNotification({
            Name = "Anti AFK",
            Content = "Roblox attempted to kick you but we blocked it!",
            Image = "rbxassetid://4384392959",
            Time = 5
        })
    end
end)