-- Skrypt Klienta (GUI)
if game:GetService("Players").LocalPlayer then
    -- Tworzymy GUI
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
    frame.Parent = screenGui

    -- Etykieta i pole tekstowe dla nazwy gracza
    local labelPlayer = Instance.new("TextLabel")
    labelPlayer.Size = UDim2.new(1, 0, 0.2, 0)
    labelPlayer.Position = UDim2.new(0, 0, 0, 0)
    labelPlayer.Text = "Wpisz nazwę gracza"
    labelPlayer.TextColor3 = Color3.fromRGB(255, 255, 255)
    labelPlayer.BackgroundTransparency = 1
    labelPlayer.Parent = frame

    local textBoxPlayer = Instance.new("TextBox")
    textBoxPlayer.Size = UDim2.new(1, 0, 0.2, 0)
    textBoxPlayer.Position = UDim2.new(0, 0, 0.2, 0)
    textBoxPlayer.PlaceholderText = "Nazwa gracza"
    textBoxPlayer.TextColor3 = Color3.fromRGB(0, 0, 0)
    textBoxPlayer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    textBoxPlayer.Parent = frame

    -- Etykieta i pole tekstowe dla nazwy broni
    local labelWeapon = Instance.new("TextLabel")
    labelWeapon.Size = UDim2.new(1, 0, 0.2, 0)
    labelWeapon.Position = UDim2.new(0, 0, 0.4, 0)
    labelWeapon.Text = "Wpisz nazwę broni"
    labelWeapon.TextColor3 = Color3.fromRGB(255, 255, 255)
    labelWeapon.BackgroundTransparency = 1
    labelWeapon.Parent = frame

    local textBoxWeapon = Instance.new("TextBox")
    textBoxWeapon.Size = UDim2.new(1, 0, 0.2, 0)
    textBoxWeapon.Position = UDim2.new(0, 0, 0.6, 0)
    textBoxWeapon.PlaceholderText = "Nazwa broni"
    textBoxWeapon.TextColor3 = Color3.fromRGB(0, 0, 0)
    textBoxWeapon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    textBoxWeapon.Parent = frame

    -- Przycisk do wykonania akcji
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 0, 50)
    button.Position = UDim2.new(0.5, -50, 0.8, -25)
    button.Text = "Zabierz Broń"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
    button.Parent = frame

    -- Przycisk wysyła RemoteEvent do serwera
    button.MouseButton1Click:Connect(function()
        local playerName = textBoxPlayer.Text
        local weaponName = textBoxWeapon.Text
        if playerName ~= "" and weaponName ~= "" then
            -- Wysyłamy dane do serwera
            game.ReplicatedStorage.TakeWeapon:FireServer(playerName, weaponName)
        else
            print("Proszę wpisać nazwę gracza i nazwę broni.")
        end
    end)
end

-- Skrypt Serwera (Funkcja do przenoszenia broni)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TakeWeaponEvent = Instance.new("RemoteEvent")
TakeWeaponEvent.Name = "TakeWeapon"
TakeWeaponEvent.Parent = ReplicatedStorage

-- Funkcja, która przenosi broń do gracza
local function takeWeapon(player, targetPlayerName, weaponName)
    -- Znajdź gracza, od którego chcemy zabrać broń
    local targetPlayer = game.Players:FindFirstChild(targetPlayerName)
    if targetPlayer then
        -- Sprawdź, czy gracz ma tę broń w plecaku
        local weapon = targetPlayer.Backpack:FindFirstChild(weaponName)
        
        if weapon then
            -- Klonujemy broń
            local weaponClone = weapon:Clone()
            -- Dodajemy klon broni do plecaka gracza, który chce ją zabrać
            weaponClone.Parent = player.Backpack
            -- Usuwamy oryginalną broń z plecaka gracza, od którego została zabrana
            weapon:Destroy()

            -- Potwierdzenie zabrania broni
            print(player.Name .. " zabrał broń " .. weaponName .. " od " .. targetPlayer.Name)
        else
            print(targetPlayer.Name .. " nie ma broni " .. weaponName)
        end
    else
        print("Gracz " .. targetPlayerName .. " nie istnieje.")
    end
end

-- Nasłuchiwanie na RemoteEvent od klienta
TakeWeaponEvent.OnServerEvent:Connect(takeWeapon)
