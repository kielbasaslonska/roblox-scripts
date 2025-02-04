-- Tworzenie GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Tworzenie ramki
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BackgroundTransparency = 0.2  -- przezroczystość tła
frame.BorderSizePixel = 0  -- brak obramowania
frame.BorderRadius = UDim.new(0, 20)  -- zaokrąglone rogi
frame.Parent = screenGui

-- Tworzenie etykiety z tekstem
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0.8, 0)
label.Position = UDim2.new(0, 0, 0, 0)
label.Text = "To jest GUI, które nic nie robi!"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextSize = 24
label.TextAlignment = Enum.TextAlignment.Center
label.TextWrapped = true
label.BackgroundTransparency = 1  -- przezroczystość tła
label.Parent = frame

-- Tworzenie przycisku zamykania
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -45, 0, -45)  -- Zmieniamy pozycję przycisku
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 24
closeButton.BorderSizePixel = 0
closeButton.Parent = frame

-- Funkcja zamykająca GUI po kliknięciu przycisku
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()  -- Zniszczenie GUI
end)
