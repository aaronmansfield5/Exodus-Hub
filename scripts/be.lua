_G = {
    WalkSpeed = 64,
    AutoFarm = false,
    AutoKill = false
}

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "BE Hub",
    LoadingTitle = "BE Hub",
    LoadingSubtitle = "by Yellow",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Yellow's Hub",
       FileName = "BE"
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

local UtilSection = UtilTab:CreateSection("Block Eaters")
local FarmToggle = UtilTab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoFarm = Value

        coroutine.wrap(function()
            while _G.AutoFarm do
                for i, v in pairs(workspace.Blobs:GetChildren()) do
                    if not _G.AutoFarm then
                        break
                    end

                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    wait(0.1)
                end

                wait(0.1)
            end
        end)()
    end
})
local KillToggle = UtilTab:CreateToggle({
    Name = "Auto Kill",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoKill = Value

        coroutine.wrap(function()
            while _G.AutoKill do
                local myScore = game.Players.LocalPlayer.leaderstats.Size.Value

                if not myScore then break end

                for i, v in pairs(workspace.PlayerBlobs:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                        local theirScore = game.Players[v.Name].leaderstats.Size.Value
                        
                        if myScore > theirScore and v.Visual.Transparency == 0 then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        end
                    end
                end
                wait(0.1)
            end
        end)()
    end
})

local UtilSection2 = UtilTab:CreateSection("Player")
local Slider = UtilTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 1024},
    Increment = 1,
    Suffix = "",
    CurrentValue = _G.WalkSpeed,
    Flag = "PlayerWS",
    Callback = function(Value)
        _G.WalkSpeed = Value
    end,
})

game:GetService("RunService").RenderStepped:connect(function()
    local Player = game:GetService("Players").LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:wait()
    local Humanoid = Character:FindFirstChild("Humanoid")

    Humanoid.WalkSpeed = _G.WalkSpeed
end)