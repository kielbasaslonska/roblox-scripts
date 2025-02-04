-- Skrypt serwera i klienta w jednym

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Tworzymy RemoteEvent w ReplicatedStorage
local RespawnWeaponEvent = Instance.new("RemoteEvent")
RespawnWeaponEvent.Name = "RespawnWeapon"
RespawnWeaponEvent.Parent = ReplicatedStorage

-- Funkcja do respiowania broni
local function respawnWeapon(player)
    -- Nazwa broni, którą chcesz zrespować
    local weaponName = "Knife"  -- Przykładowa broń (możesz dodać inne)

    -- Szukamy plecaka gracza
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        -- Tworzymy nową broń
        local weapon = Instance.new("Tool")
        weapon.Name = weaponName
        weapon.Parent = backpack

        -- Możesz ustawić różne właściwości dla broni (np. tekstury)
        print(player.Name .. " otrzymał broń: " .. weaponName)
    end
end

-- Nasłuchiwanie na RemoteEvent od klienta
RespawnWeaponEvent.OnServerEvent:Connect(respawnWeapon)

-- Skrypt klienta (GUI)
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Tworzenie ramki
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)  -- Wymiary ramki
frame.Position = UDim2.new(0.5, -100, 0.5, -50)  -- Ustawienie na środku ekranu
frame.BackgroundColor3 = Color3.fromRGB(169, 169, 169)  -- Szary kolor tła
frame.Parent = screenGui

-- Tworzenie przycisku
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 100, 0, 50)
button.Position = UDim2.new(0.5, -50, 0.5, -25)
button.Text = "Respię broń"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
button.Parent = frame

-- Funkcja do respiowania broni
button.MouseButton1Click:Connect(function()
    -- Wywołanie RemoteEvent do serwera, aby zrespili broń
    game.ReplicatedStorage.RespawnWeapon:FireServer()
end)
