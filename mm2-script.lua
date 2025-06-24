local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

repeat task.wait() until game:IsLoaded()
local LocalPlayer = Players.LocalPlayer
repeat task.wait() until LocalPlayer.Character

if CoreGui:FindFirstChild("DeltaMM2Hack") then
    CoreGui.DeltaMM2Hack:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "DeltaMM2Hack"
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.ResetOnSpawn = false
gui.Parent = CoreGui

local SETTINGS = {
    ESP_ENABLED = true,
    SHOW_MURDERER = true,
    SHOW_SHERIFF = true,
    SHOW_INNOCENT = true,
    SHOW_GUN = true,
    SHOW_DISTANCE = true,
    MAX_DISTANCE = 150,
    UPDATE_INTERVAL = 0.5
}

local trigger = Instance.new("TextButton")
trigger.Name = "Trigger"
trigger.Size = UDim2.new(0, 70, 0, 70)
trigger.Position = UDim2.new(1, -80, 0, 10)
trigger.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
trigger.BorderSizePixel = 0
trigger.Text = "≡"
trigger.TextColor3 = Color3.new(1, 1, 1)
trigger.Font = Enum.Font.Oswald
trigger.TextSize = 40
trigger.Active = true
trigger.Draggable = true
trigger.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.3, 0)
corner.Parent = trigger

local menu = Instance.new("Frame")
menu.Name = "Menu"
menu.Size = UDim2.new(0.8, 0, 0.7, 0)
menu.Position = UDim2.new(0.1, 0, 0.15, 0)
menu.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
menu.BorderSizePixel = 0
menu.Visible = false
menu.Parent = gui

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
titleBar.Parent = menu

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(0.6, 0, 1, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "DELTA MM2 HACK"
titleText.TextColor3 = Color3.new(1, 0.7, 0)
titleText.Font = Enum.Font.Oswald
titleText.TextSize = 20
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Position = UDim2.new(0.05, 0, 0, 0)
titleText.Parent = titleBar

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 40, 0, 40)
minimizeBtn.Position = UDim2.new(0.7, 0, 0, 0)
minimizeBtn.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.new(1, 1, 1)
minimizeBtn.Font = Enum.Font.Oswald
minimizeBtn.TextSize = 30
minimizeBtn.Parent = titleBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(0.85, 0, 0, 0)
closeBtn.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.Oswald
closeBtn.TextSize = 30
closeBtn.Parent = titleBar

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -10, 1, -50)
scrollFrame.Position = UDim2.new(0, 5, 0, 45)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 8
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 650)
scrollFrame.Parent = menu

local function createMobileToggle(name, ypos, color)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 45)
    frame.BackgroundTransparency = 1
    frame.Position = UDim2.new(0, 0, 0, ypos)
    frame.Parent = scrollFrame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = color
    label.Font = Enum.Font.Oswald
    label.TextSize = 18
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.25, 0, 0.8, 0)
    button.Position = UDim2.new(0.75, 0, 0.1, 0)
    button.Font = Enum.Font.Oswald
    button.TextSize = 16
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Name = name .. "Btn"
    button.Parent = frame
    
    return button
end

local espToggle = createMobileToggle("ESP", 10, Color3.new(1,1,1))
espToggle.Text = SETTINGS.ESP_ENABLED and "ON" or "OFF"
espToggle.BackgroundColor3 = SETTINGS.ESP_ENABLED and Color3.new(0,0.5,0) or Color3.new(0.5,0,0)

local murderToggle = createMobileToggle("Show Murder", 70, Color3.new(1,0.5,0.5))
murderToggle.Text = SETTINGS.SHOW_MURDERER and "ON" or "OFF"
murderToggle.BackgroundColor3 = SETTINGS.SHOW_MURDERER and Color3.new(0,0.5,0) or Color3.new(0.5,0,0)

local sheriffToggle = createMobileToggle("Show Sheriff", 130, Color3.new(0.5,0.7,1))
sheriffToggle.Text = SETTINGS.SHOW_SHERIFF and "ON" or "OFF"
sheriffToggle.BackgroundColor3 = SETTINGS.SHOW_SHERIFF and Color3.new(0,0.5,0) or Color3.new(0.5,0,0)

local innocentToggle = createMobileToggle("Show Innocent", 190, Color3.new(0.5,1,0.5))
innocentToggle.Text = SETTINGS.SHOW_INNOCENT and "ON" or "OFF"
innocentToggle.BackgroundColor3 = SETTINGS.SHOW_INNOCENT and Color3.new(0,0.5,0) or Color3.new(0.5,0,0)

local gunToggle = createMobileToggle("Show Gun", 250, Color3.new(1,0.8,0.5))
gunToggle.Text = SETTINGS.SHOW_GUN and "ON" or "OFF"
gunToggle.BackgroundColor3 = SETTINGS.SHOW_GUN and Color3.new(0,0.5,0) or Color3.new(0.5,0,0)

local distanceToggle = createMobileToggle("Show Distance", 310, Color3.new(1,1,0.7))
distanceToggle.Text = SETTINGS.SHOW_DISTANCE and "ON" or "OFF"
distanceToggle.BackgroundColor3 = SETTINGS.SHOW_DISTANCE and Color3.new(0,0.5,0) or Color3.new(0.5,0,0)

local grabGunBtn = Instance.new("TextButton")
grabGunBtn.Size = UDim2.new(0.9, 0, 0, 50)
grabGunBtn.Position = UDim2.new(0.05, 0, 0, 380)
grabGunBtn.BackgroundColor3 = Color3.new(0.2, 0.5, 0.8)
grabGunBtn.Font = Enum.Font.Oswald
grabGunBtn.TextSize = 20
grabGunBtn.TextColor3 = Color3.new(1, 1, 1)
grabGunBtn.Text = "GRAB GUN"
grabGunBtn.Parent = scrollFrame

local espFolder = Instance.new("Folder")
espFolder.Name = "ESPFolder"
espFolder.Parent = gui

minimizeBtn.MouseButton1Click:Connect(function()
    menu.Visible = false
    trigger.Visible = true
end)

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

trigger.MouseButton1Click:Connect(function()
    menu.Visible = true
    trigger.Visible = false
end)

espToggle.MouseButton1Click:Connect(function()
    SETTINGS.ESP_ENABLED = not SETTINGS.ESP_ENABLED
    espToggle.Text = SETTINGS.ESP_ENABLED and "ON" or "OFF"
    espToggle.BackgroundColor3 = SETTINGS.ESP_ENABLED and Color3.new(0,0.5,0) or Color3.new(0.5,0,0)
end)

murderToggle.MouseButton1Click:Connect(function()
    SETTINGS.SHOW_MURDERER = not SETTINGS.SHOW_MURDERER
    murderToggle.Text = SETTINGS.SHOW_MURDERER and "ON" or "OFF"
    murderToggle.BackgroundColor3 = SETTINGS.SHOW_MURDERER and Color3.new(0,0.5,0) or Color3.new(0.5,0,0)
end)

sheriffToggle.MouseButton1Click:Connect(function()
    SETTINGS.SHOW_SHERIFF = not SETTINGS.SHOW_SHERIFF
    sheriffToggle.Text = SETTINGS.SHOW_SHERIFF and "ON" or "OFF"
    sheriffToggle.BackgroundColor3 = SETTINGS.SHOW_SHERIFF and Color3.new(0,0.5,0) or Color3.new(0.5,0,0)
end)

innocentToggle.MouseButton1Click:Connect(function()
    SETTINGS.SHOW_INNOCENT = not SETTINGS.SHOW_INNOCENT
    innocentToggle.Text = SETTINGS.SHOW_INNOCENT and "ON" or "OFF"
    innocentToggle.BackgroundColor3 = SETTINGS.SHOW_INNOCENT and Color3.new(0,0.5,0) or Color3.new(0.5,0,0)
end)

gunToggle.MouseButton1Click:Connect(function()
    SETTINGS.SHOW_GUN = not SETTINGS.SHOW_GUN
    gunToggle.Text = SETTINGS.SHOW_GUN and "ON" or "OFF"
    gunToggle.BackgroundColor3 = SETTINGS.SHOW_GUN and Color3.new(0,0.5,0) or Color3.new(0.5,0,0)
end)

distanceToggle.MouseButton1Click:Connect(function()
    SETTINGS.SHOW_DISTANCE = not SETTINGS.SHOW_DISTANCE
    distanceToggle.Text = SETTINGS.SHOW_DISTANCE and "ON" or "OFF"
    distanceToggle.BackgroundColor3 = SETTINGS.SHOW_DISTANCE and Color3.new(0,0.5,0) or Color3.new(0.5,0,0)
end)

grabGunBtn.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local closestGun, minDist = nil, math.huge
    for _, item in ipairs(workspace:GetChildren()) do
        if item.Name == "Gun" and item:IsA("Model") then
            local handle = item:FindFirstChild("Handle")
            if handle then
                local dist = (handle.Position - hrp.Position).Magnitude
                if dist < minDist then
                    minDist = dist
                    closestGun = item
                end
            end
        end
    end
    
    if closestGun and minDist < 50 then
        for _, tool in ipairs(closestGun:GetChildren()) do
            if tool:IsA("Tool") then
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:EquipTool(tool)
                    break
                end
            end
        end
    end
end)

-- Упрощенная ESP система для мобильных
local espObjects = {}

local function getPlayerRole(player)
    return player:GetAttribute("Role") or "Innocent"
end

local function isHero(player)
    if not player.Character then return false end
    for _, tool in ipairs(player.Character:GetChildren()) do
        if tool:IsA("Tool") and tool.Name == "Gun" then
            return true
        end
    end
    return false
end

local function createPlayerESP(player)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = player.Name
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.Parent = espFolder
    
    local roleLabel = Instance.new("TextLabel")
    roleLabel.Size = UDim2.new(1, 0, 0.5, 0)
    roleLabel.BackgroundTransparency = 1
    roleLabel.Text = getPlayerRole(player)
    roleLabel.Font = Enum.Font.Oswald
    roleLabel.TextSize = 18
    roleLabel.Parent = billboard
    
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = "0m"
    distLabel.Font = Enum.Font.Oswald
    distLabel.TextSize = 16
    distLabel.Parent = billboard
    
    return billboard
end

-- Оптимизированный ESP цикл
local lastUpdate = 0
RunService.Heartbeat:Connect(function()
    if not SETTINGS.ESP_ENABLED then return end
    if tick() - lastUpdate < SETTINGS.UPDATE_INTERVAL then return end
    lastUpdate = tick()
    
    local localChar = LocalPlayer.Character
    local localRoot = localChar and localChar:FindFirstChild("HumanoidRootPart")
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                -- Создаем или обновляем ESP
                if not espObjects[player] then
                    espObjects[player] = createPlayerESP(player)
                end
                
                local billboard = espObjects[player]
                if billboard then
                    billboard.Adornee = hrp
                    
                    -- Обновляем дистанцию
                    local distance = localRoot and (hrp.Position - localRoot.Position).Magnitude or 0
                    billboard.Enabled = distance <= SETTINGS.MAX_DISTANCE
                    
                    if billboard.Enabled then
                        local role = getPlayerRole(player)
                        local roleLabel = billboard:FindFirstChildOfClass("TextLabel")
                        local distLabel = roleLabel and roleLabel:FindNextSiblingOfClass("TextLabel")
                        
                        if roleLabel then
                            -- Устанавливаем цвет по роли
                            if role == "Murderer" and SETTINGS.SHOW_MURDERER then
                                roleLabel.TextColor3 = Color3.new(1, 0.3, 0.3)
                                roleLabel.Visible = true
                            elseif role == "Sheriff" and SETTINGS.SHOW_SHERIFF then
                                roleLabel.TextColor3 = Color3.new(0.3, 0.5, 1)
                                roleLabel.Visible = true
                            elseif isHero(player) and SETTINGS.SHOW_INNOCENT then
                                roleLabel.TextColor3 = Color3.new(1, 0.7, 0.3)
                                roleLabel.Visible = true
                            elseif role == "Innocent" and SETTINGS.SHOW_INNOCENT then
                                roleLabel.TextColor3 = Color3.new(0.3, 1, 0.3)
                                roleLabel.Visible = true
                            else
                                roleLabel.Visible = false
                            end
                            
                            roleLabel.Text = role
                        end
                        
                        if distLabel then
                            distLabel.Text = string.format("%.1fm", distance)
                            distLabel.Visible = SETTINGS.SHOW_DISTANCE
                        end
                    end
                end
            end
        end
    end
end)

-- Очистка при выходе игроков
Players.PlayerRemoving:Connect(function(player)
    if espObjects[player] then
        espObjects[player]:Destroy()
        espObjects[player] = nil
    end
end)

-- Активация
trigger.Visible = true
print("Delta MM2 Hack активирован для Android!")