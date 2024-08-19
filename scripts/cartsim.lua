_G = {
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
    end
})

game:GetService("RunService").RenderStepped:connect(function()
    for i,v in pairs(workspace:WaitForChild("Effects"):GetChildren()) do
        if v.Name == "Template" and _G.AutoPower then
            local Player = game:GetService("Players").LocalPlayer
            local Character = Player.Character or Player.CharacterAdded:wait()
            if Character then
                local HRP = Character:FindFirstChild("HumanoidRootPart")
    
                v.CFrame = HRP.CFrame
            end
        end
    end
end)