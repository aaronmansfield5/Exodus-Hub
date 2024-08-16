HTTPService = game:GetService("HttpService")

local UserInterface = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local rbbtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")
local TextLabel = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local cratebtn = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")
local UIPadding = Instance.new("UIPadding")
local doRB = Instance.new("BoolValue")
local docrate = Instance.new("BoolValue")

--Properties:

UserInterface.ResetOnSpawn = false
UserInterface.Name = "UserInterface"
UserInterface.Parent = game:GetService("CoreGui")
UserInterface.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = UserInterface
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0.840404034, 0, 0.448170722, 0)
Frame.Selectable = true
Frame.Size = UDim2.new(0.106060609, 0, 0.189176828, 0)

rbbtn.Name = "rbbtn"
rbbtn.Parent = Frame
rbbtn.BackgroundColor3 = Color3.fromRGB(255, 106, 106)
rbbtn.LayoutOrder = 1
rbbtn.Position = UDim2.new(0.049999956, 0, 0.276121676, 0)
rbbtn.Size = UDim2.new(0.899999917, 0, 0.223977521, 0)
rbbtn.Font = Enum.Font.Gotham
rbbtn.Text = "Rebirth"
rbbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
rbbtn.TextScaled = true
rbbtn.TextSize = 14.000
rbbtn.TextWrapped = true

UICorner.Parent = rbbtn

UIListLayout.Parent = Frame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(1, 0, 0.16523765, 0)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "Utilities"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 14.000

UICorner_2.Parent = Frame

cratebtn.Name = "cratebtn"
cratebtn.Parent = Frame
cratebtn.BackgroundColor3 = Color3.fromRGB(255, 106, 106)
cratebtn.LayoutOrder = 1
cratebtn.Position = UDim2.new(0.049999956, 0, 0.554883659, 0)
cratebtn.Size = UDim2.new(0.899999917, 0, 0.223977357, 0)
cratebtn.Font = Enum.Font.Gotham
cratebtn.Text = "Crates"
cratebtn.TextColor3 = Color3.fromRGB(0, 0, 0)
cratebtn.TextScaled = true
cratebtn.TextSize = 14.000
cratebtn.TextWrapped = true

UICorner_3.Parent = cratebtn

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderSizePixel = 0
TextLabel_2.LayoutOrder = 2
TextLabel_2.Position = UDim2.new(0, 0, 0.833645523, 0)
TextLabel_2.Size = UDim2.new(1, 0, 0.186827734, 0)
TextLabel_2.Font = Enum.Font.Gotham
TextLabel_2.Text = "Anti AFK ✅"
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

UIPadding.Parent = Frame
UIPadding.PaddingBottom = UDim.new(0, 5)
UIPadding.PaddingTop = UDim.new(0, 5)

doRB.Parent = Frame
docrate.Parent = Frame

rbbtn.MouseButton1Up:Connect(function()
	if(doRB.Value) then
		rbbtn.BackgroundColor3 = Color3.fromRGB(255, 106, 106)
	else
		rbbtn.BackgroundColor3 = Color3.fromRGB(139, 255, 137)
	end
	doRB.Value = not doRB.Value
end)

cratebtn.MouseButton1Up:Connect(function()
	if(docrate.Value) then
		cratebtn.BackgroundColor3 = Color3.fromRGB(255, 106, 106)
	else
		cratebtn.BackgroundColor3 = Color3.fromRGB(139, 255, 137)
	end
	docrate.Value = not docrate.Value
end)

game.ReplicatedStorage.MoneyMirror:FindFirstChild(game.Players.LocalPlayer.Name).Changed:Connect(function (newVal)
	skips = game.Players.LocalPlayer.PlayerGui.Rebirth.Frame.Rebirth_Content.Content.Rebirth.Frame.Top.SkipBox.Label
    if(doRB.Value and skips.Parent.Visible == true) then
        money = newVal --require(game.ReplicatedStorage.MoneyLib).HandleMoney(newVal)
		local args = {
			[1] = 26
		}

		game:GetService("ReplicatedStorage"):WaitForChild("Rebirth"):InvokeServer(unpack(args))
		wait(1.5)
        game.ReplicatedStorage.Layouts:InvokeServer("Load", "Layout1")
        for i,v in game:GetService("CoreGui").ExperienceChat.appLayout.chatWindow.scrollingView.bottomLockedScrollView.RCTScrollView.RCTScrollContentView:GetChildren() do
            plrlife = game.Players.LocalPlayer.Rebirths.Value + 1 --require(game.ReplicatedStorage.MoneyLib).HandleLife(game.Players.LocalPlayer.Rebirths.Value + 1)
            if(v:FindFirstChild("TextLabel")) then
                txt = v.TextLabel.TextMessage
                if(txt.ContentText:match(game.Players.LocalPlayer.DisplayName) and txt.ContentText:match("was born into their") and not txt:FindFirstChild("Posted")) then
                    timeIn = string.split(string.split(txt.ContentText, " in ")[2], " (")[1]
                    wait()
                    rbSend = "You've rebirthed into life **S+"..plrlife.."** with **$"..money.."** in **"..timeIn.."**!"
                    WebHook = "" -- your WebHook goes here
                    request({
                        Url = WebHook,
                        Method = "POST",
                        Headers = {
                            ["Content-Type"] = "application/json"
                        },
                        Body = game.HttpService:JSONEncode({
                            embeds = {{
                                title = "Rebirth",
                                description = rbSend,
                                 author = {
                                    name = "Rebirth Tracker",
                                    icon_url = "https://pbs.twimg.com/profile_images/1392664665516171275/LNC_H6fs_400x400.jpg"
                                },
                                footer = {
                                    text = game.Players.LocalPlayer.Name,
                                    icon_url = "https://tr.rbxcdn.com/c33870b88e37558299bf25640ea5f1c0/150/150/AvatarHeadshot/Png"
                                }
                            }}
                        })
                    })
                    local saved = Instance.new("BoolValue")
                    saved.Name = "Posted"
                    saved.Parent = txt
                end
            end
        end
	end
end)

game.Players.LocalPlayer.PlayerGui.GUI.Notifications.ChildAdded:Connect(function(Item)
    if Item:IsA("Frame") and Item:FindFirstChild("Tier") and (Item.Tier.Text:match("Reborn") or Item.Tier.Text:match("Ultimate") or Item.Tier.Text:match("Shiny") or Item.Tier.Text:match("Superstitious")) then
        local tier = Item.Tier.Text
        local name = Item.Title.Text
        local color = Item.BackgroundColor3
        local amount = Item.Icon.Amount.Text
        local quantity = game.ReplicatedStorage.FetchInventory:InvokeServer()[tostring(game.ReplicatedStorage.Items[name].ItemId.Value)].Quantity
        local toSend = "You've obtained "..amount.." **"..name.." ("..tier..")** at life **S+".. game.Players.LocalPlayer.Rebirths.Value.."**! You now have **x"..quantity.." "..name.."(s)**."
        WebHook = "" -- your WebHook goes here
        request({
            Url = WebHook,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game.HttpService:JSONEncode({
                embeds = {{
                    title = "New Reborn Item",
                    description = toSend,
                    color = math.floor(color.r*255)*256^2+math.floor(color.g*255)*256+math.floor(color.b*255),
                    author = {
                        name = "Rebirth Tracker",
                        icon_url = "https://pbs.twimg.com/profile_images/1392664665516171275/LNC_H6fs_400x400.jpg"
                    },
                    footer = {
                        text = game.Players.LocalPlayer.Name,
                        icon_url = "https://tr.rbxcdn.com/c33870b88e37558299bf25640ea5f1c0/150/150/AvatarHeadshot/Png"
                    }
                }}
            })
        })
    end
end)

--[[game.Players.LocalPlayer.PlayerGui.GUI.HUDBottom.Limit.Bar.Changed:Connect(function()
    local isFull = game.Players.LocalPlayer.PlayerGui.GUI.HUDBottom.Limit.Bar.Size.X.Scale == 1
    if(doRB.Value) then
        if(isFull) then
            game:GetService("ReplicatedStorage"):WaitForChild("DestroyAll"):InvokeServer()
            wait()
            local args = {
                [1] = "Ore Quasar",
                [2] = CFrame.new(-384.381531, 67.0766449, -201.379639, -4.37113883e-08, 0, 1, 0, 1, 0, -1, 0, -4.37113883e-08),
                [3] = {
                    [1] = game.Players.LocalPlayer.PlayerTycoon.Value:WaitForChild("Base")
                }
            }
            game:GetService("ReplicatedStorage"):WaitForChild("PlaceItem"):InvokeServer(unpack(args))
            wait()
            game:GetService("ReplicatedStorage"):WaitForChild("DestroyAll"):InvokeServer()
            wait()
            game.ReplicatedStorage.Layouts:InvokeServer("Load", "Layout1")
        end
    end
end)]]

while wait() do
	if(docrate.Value) then
		for i,v in pairs(game.Workspace.Boxes:GetChildren()) do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
		end
	end
    --[[if(doRB.Value) then
        game:GetService("ReplicatedStorage"):WaitForChild("Pulse"):FireServer()
    end]]
end

wait(3)
local bb = game:GetService('VirtualUser')

game:GetService('Players').LocalPlayer.Idled:connect(function()
    bb:CaptureController()
    bb:ClickButton2(Vector2.new())
end)