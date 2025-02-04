-- Tworzenie GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Tworzenie ramki
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 300)  -- Wymiary ramki (400x300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)  -- Ustawienie na środku ekranu
frame.BackgroundColor3 = Color3.fromRGB(169, 169, 169)  -- Szary kolor tła ramki
frame.Parent = screenGui

-- Tworzenie przycisku
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 100, 0, 50)  -- Rozmiar przycisku (100x50)
button.Position = UDim2.new(1, -120, 0.5, -25)  -- Ustawienie przycisku po prawej stronie ramki
button.Text = "Lataj"  -- Tekst przycisku
button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Kolor tekstu (biały)
button.BackgroundColor3 = Color3.fromRGB(0, 122, 204)  -- Kolor tła przycisku (niebieski)
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
        -- Dodatkowe ustawienia dla latania mogą być dodane tutaj
    end
end

-- Po kliknięciu przycisku, funkcja toggleFlying() jest wywoływana
button.MouseButton1Click:Connect(toggleFlying)
