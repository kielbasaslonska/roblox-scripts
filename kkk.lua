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

-- Funkcja do tworzenia przycisków
local function createButton(name, position)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 0, 50)  -- Rozmiar przycisku (100x50)
    button.Position = position  -- Pozycja przycisku
    button.Text = name  -- Tekst przycisku
    button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Kolor tekstu (biały)
    button.BackgroundColor3 = Color3.fromRGB(0, 122, 204)  -- Kolor tła przycisku (niebieski)
    button.BorderSizePixel = 0  -- Brak obramowania przycisku
    button.BorderRadius = UDim.new(0, 15)  -- Zaokrąglone rogi przycisku
    button.Parent = frame  -- Dodanie przycisku do ramki
end

-- Tworzenie przycisków
createButton("Przycisk 1", UDim2.new(0, 20, 0, 20))
createButton("Przycisk 2", UDim2.new(0, 20, 0, 80))
createButton("Przycisk 3", UDim2.new(0, 20, 0, 140))
createButton("Przycisk 4", UDim2.new(0, 20, 0, 200))
