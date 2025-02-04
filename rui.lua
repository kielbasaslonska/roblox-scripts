-- Tworzenie GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Tworzenie ramki z zaokrąglonymi rogami
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 300)  -- Zachowujemy poprzedni rozmiar
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BackgroundTransparency = 0.2  -- Subtelna przezroczystość tła
frame.BorderSizePixel = 0  -- Brak obramowania
frame.BorderRadius = UDim.new(0, 20)  -- Zaokrąglone rogi
frame.Parent = screenGui

-- Dodanie cienia do ramki
local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 10, 1, 10)
shadow.Position = UDim2.new(0, -5, 0, -5)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://10514357545"  -- Cień
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.5
shadow.Parent = frame

-- Tworzenie etykiety z tekstem
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0.8, 0)
label.Position = UDim2.new(0, 0, 0, 0)
label.Text = "To jest GUI, które nic nie robi!"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextSize = 24
label.TextAlignment = Enum.TextAlignment.Center
label.TextWrapped = true
label.BackgroundTransparency = 1  -- Przezroczystość tła etykiety
label.Parent = frame
