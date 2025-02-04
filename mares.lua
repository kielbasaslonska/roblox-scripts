-- Tworzenie GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Tworzenie ramki
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 300)  -- Wymiary ramki (400x300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)  -- Ustawienie na środku ekranu
frame.BackgroundColor3 = Color3.fromRGB(169, 169, 169)  -- Szary kolor tła ramki
frame.BorderSizePixel = 0  -- Brak obramowania
frame.BorderRadius = UDim.new(0, 20)  -- Zaokrąglone rogi ramki
frame.Parent = screenGui

-- Tworzenie przycisku
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 100, 0, 50)  -- Rozmiar przycisku (100x50)
button.Position = UDim2.new(1, -120, 0.5, -25)  -- Ustawienie przycisku po prawej stronie ramki
button.Text = "Lataj"  -- Tekst przycisku
button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Kolor tekstu (biały)
button.BackgroundColor3 = Color3.fromRGB(0, 122, 204)  -- Kolor tła przycisku (niebieski)
button.BorderSizePixel = 0  -- Brak obramowania przycisku
button.BorderRadius = UDim.new(0, 15)  -- Zaokrąglone rogi przycisku
button.Parent = frame  -- Dodanie przycisku do ramki

-- Funkcja latania
local flying = false  -- Flaga, która określa, czy gracz lata
local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

local function toggleFlying()
    if flying then
        flying = false
        humanoid.PlatformStand = false  -- Wyłączenie latania
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    else
        flying = true
        humanoid.PlatformStand = true  -- Włączenie latania
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    end
end

-- Po kliknięciu przycisku, funkcja toggleFlying() jest wywoływana
button.MouseButton1Click:Connect(toggleFlying)

-- Funkcja przeciągania ramki
local isDragging = false
local dragStart = nil
local startPos = nil

-- Kiedy zaczynamy przeciąganie (naciśnięcie lewego przycisku myszy)
frame.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

-- Kiedy przeciągamy ramkę (ruch myszy)
frame.InputChanged:Connect(function(input)
    if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Kiedy kończymy przeciąganie (zwolnienie lewego przycisku myszy)
frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)
