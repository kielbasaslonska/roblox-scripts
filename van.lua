-- Tworzenie GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Tworzenie ramki
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 300)  -- Wymiary ramki (400x300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)  -- Ustawienie na środku ekranu
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)  -- Kolor tła ramki
frame.BackgroundTransparency = 0.2  -- Delikatna przezroczystość tła
frame.BorderSizePixel = 0  -- Brak obramowania
frame.Parent = screenGui

-- Tworzenie etykiety
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0.8, 0)  -- Wypełnia ramkę w poziomie i 80% wysokości
label.Position = UDim2.new(0, 0, 0, 0)  -- Ustawienie w lewym górnym rogu
label.Text = "To jest GUI, które nic nie robi!"  -- Tekst
label.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Kolor tekstu (biały)
label.TextSize = 24  -- Rozmiar tekstu
label.TextAlignment = Enum.TextAlignment.Center  -- Wyśrodkowanie tekstu
label.TextWrapped = true  -- Zawijanie tekstu
label.BackgroundTransparency = 1  -- Tło etykiety jest przezroczyste
label.Parent = frame
