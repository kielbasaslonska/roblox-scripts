-- Tworzenie GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Tworzenie ramki
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 300)  -- Wymiary ramki (400x300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)  -- Ustawienie na środku ekranu
frame.BackgroundColor3 = Color3.fromRGB(169, 169, 169)  -- Szary kolor tła ramki
frame.Parent = screenGui

-- Tworzenie przycisku zamrażania wymiany
local freezeButton = Instance.new("TextButton")
freezeButton.Size = UDim2.new(0, 150, 0, 50)
freezeButton.Position = UDim2.new(0, 125, 0.5, -25)
freezeButton.Text = "Freeze Trade"  -- Tekst przycisku
freezeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
freezeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Kolor tła przycisku (czerwony)
freezeButton.Parent = frame  -- Dodanie przycisku do ramki

-- Zmienna do określenia, czy wymiana jest zamrożona
local isTradeFrozen = false

-- Funkcja zamrażająca wymianę
local function freezeTrade()
    isTradeFrozen = not isTradeFrozen  -- Zmieniamy stan zamrożenia
    if isTradeFrozen then
        freezeButton.Text = "Trade Frozen"  -- Zmieniamy tekst na "Trade Frozen"
        freezeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Zmiana koloru przycisku na zielony
        -- Tu dodajemy kod blokujący wymianę broni w grze
        -- Na przykład: zatrzymaj proces wymiany
        -- game.ReplicatedStorage:WaitForChild("FreezeTrade").FireServer()  -- Przykładowa metoda blokady wymiany
    else
        freezeButton.Text = "Freeze Trade"  -- Zmieniamy tekst na "Freeze Trade"
        freezeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Kolor przycisku wraca do czerwonego
        -- Tu przywrócisz możliwość normalnej wymiany
        -- game.ReplicatedStorage:WaitForChild("UnfreezeTrade").FireServer()  -- Przykład metody odblokowującej
    end
end

-- Po kliknięciu przycisku, wywołujemy funkcję freezeTrade
freezeButton.MouseButton1Click:Connect(freezeTrade)
