-- Tworzenie GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Tworzenie ramki
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)  -- Zmniejszone wymiary ramki (300x200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)  -- Ustawienie na środku ekranu
frame.BackgroundColor3 = Color3.fromRGB(169, 169, 169)  -- Szary kolor tła ramki
frame.Parent = screenGui

-- Tworzenie przycisku do latania
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 80, 0, 40)  -- Zmniejszony rozmiar przycisku (80x40)
button.Position = UDim2.new(1, -90, 0.5, -20)  -- Ustawienie przycisku po prawej stronie ramki
button.Text = "Lataj"  -- Tekst przycisku
button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Kolor tekstu (biały)
button.BackgroundColor3 = Color3.fromRGB(0, 122, 204)  -- Kolor tła przycisku (niebieski)
button.Parent = frame  -- Dodanie przycisku do ramki

-- Przyciski kontrolujące lot na urządzeniach mobilnych
local upButton = Instance.new("TextButton")
upButton.Size = UDim2.new(0, 80, 0, 40)
upButton.Position = UDim2.new(0, 20, 1, -100)
upButton.Text = "Wznoszenie"
upButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
upButton.TextColor3 = Color3.fromRGB(255, 255, 255)
upButton.Parent = screenGui

local downButton = Instance.new("TextButton")
downButton.Size = UDim2.new(0, 80, 0, 40)
downButton.Position = UDim2.new(0, 20, 1, -50)
downButton.Text = "Opadanie"
downButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
downButton.TextColor3 = Color3.fromRGB(255, 255, 255)
downButton.Parent = screenGui

-- Funkcja latania
local flying = false  -- Flaga, która określa, czy gracz lata
local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
local bodyVelocity

local function toggleFlying()
    if flying then
        flying = false
        humanoid.PlatformStand = false  -- Wyłączenie latania
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        if bodyVelocity then
            bodyVelocity:Destroy()  -- Zniszczenie BodyVelocity, jeśli jest
        end
    else
        flying = true
        humanoid.PlatformStand = true  -- Włączenie latania
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)

        -- Tworzymy BodyVelocity do sterowania ruchem
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)  -- Ustawienie siły
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)  -- Początkowa prędkość
        bodyVelocity.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
    end
end

-- Funkcja wznoszenia
local function ascend()
    if flying then
        bodyVelocity.Velocity = Vector3.new(0, 50, 0)  -- Siła w górę
    end
end

-- Funkcja opadania
local function descend()
    if flying then
        bodyVelocity.Velocity = Vector3.new(0, -50, 0)  -- Siła w dół
    end
end

-- Po kliknięciu przycisku "Lataj", funkcja toggleFlying() jest wywoływana
button.MouseButton1Click:Connect(toggleFlying)

-- Po kliknięciu przycisku "Wznoszenie", gracz zaczyna wznosić się
upButton.MouseButton1Click:Connect(ascend)

-- Po kliknięciu przycisku "Opadanie", gracz zaczyna opadać
downButton.MouseButton1Click:Connect(descend)
