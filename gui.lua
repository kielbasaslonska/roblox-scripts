-- Tworzenie GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Tworzenie ramki z zaokrąglonymi rogami i cieniem
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 500, 0, 400)
frame.Position = UDim2.new(0.5, -250, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.15  -- Subtelna przezroczystość tła
frame.BorderSizePixel = 0  -- Brak obramowania
frame.BorderRadius = UDim.new(0, 30)  -- Zaokrąglone rogi
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
label.Size = UDim2.new(1, 0, 0.3, 0)
label.Position = UDim2.new(0, 0, 0.1, 0)
label.Text = "Witaj w estetycznym GUI!"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextSize = 36
label.Font = Enum.Font.GothamBold
label.TextAlignment = Enum.TextAlignment.Center
label.TextWrapped = true
label.BackgroundTransparency = 1  -- Przezroczystość tła etykiety
label.Parent = frame

-- Tworzenie przycisku
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 120, 0, 40)
closeButton.Position = UDim2.new(0.5, -60, 0.8, 0)  -- W dolnej części ramki
closeButton.Text = "Zamknij"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
closeButton.BorderSizePixel = 0
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 24
closeButton.BorderRadius = UDim.new(0, 15)  -- Zaokrąglone rogi przycisku
closeButton.Parent = frame

-- Funkcja zamykająca GUI po kliknięciu przycisku
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()  -- Zniszczenie GUI
end)
