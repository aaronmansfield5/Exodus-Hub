_G = {
    WalkSpeed = 64,
    AutoPower = false
}

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Cart Sim Hub",
    LoadingTitle = "Cart Sim Hub",
    LoadingSubtitle = "by Yellow",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Yellow's Hub",
       FileName = "CRS"
    },
    Discord = {
       Enabled = true,
       Invite = "Nd7geN8x6C",
       RememberJoins = false
    },
    KeySystem = false
})

local HomeTab = Window:CreateTab("Home", 14456045452)
local UtilTab = Window:CreateTab("Utils", 9753762573)

local Section = HomeTab:CreateParagraph({Title = "Credits", Content = "All credits for this script go to Yellow."})

local UtilSection = UtilTab:CreateSection("Cart Simulator")
local FarmToggle = UtilTab:CreateToggle({
    Name = "Auto Collect Power",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoPower = Value

        coroutine.wrap(function()
            while _G.AutoPower do
                for i,v in pairs(workspace.Effects:GetChildren()) do
                    if v.Name == "Template" then
                        local Player = game:GetService("Players").LocalPlayer
                        local Character = Player.Character or Player.CharacterAdded:wait()
                        local HRP = Character:FindFirstChild("HumanoidRootPart")
                
                        v.CFrame = HRP.CFrame
                    end
                end

                wait(0.1)
            end
        end)()
    end
})