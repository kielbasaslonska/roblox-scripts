-- Tworzenie GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Tworzenie ramki
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 150, 0, 50)  -- Wymiary ramki (150x50)
frame.Position = UDim2.new(0.5, -75, 0.5, -25)  -- Ustawienie na środku ekranu
frame.BackgroundColor3 = Color3.fromRGB(169, 169, 169)  -- Szary kolor tła ramki
frame.Parent = screenGui

-- Tworzenie przycisku
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 150, 0, 50)  -- Rozmiar przycisku (150x50)
button.Text = "Freeze Trade"  -- Tekst przycisku
button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Kolor tekstu (biały)
button.BackgroundColor3 = Color3.fromRGB(0, 122, 204)  -- Kolor tła przycisku (niebieski)
button.Parent = frame  -- Dodanie przycisku do ramki

-- Funkcja do zamrożenia wymiany
local function freezeTrade()
    local player = game.Players.LocalPlayer
    local tradeGui = game.ReplicatedStorage:FindFirstChild("TradeGui")

    if tradeGui then
        -- Zamrożenie wymiany (przy założeniu, że jest dostępny jakiś system wymiany w grze)
        local tradeWindow = tradeGui:FindFirstChild("TradeWindow")
        if tradeWindow then
            -- Przykładowa logika zamrażania wymiany
            -- Może tu być odpowiednia funkcjonalność zależna od systemu, np. blokada przycisków
            tradeWindow.Enabled = false  -- Użyjemy przykładowo ukrywania okna
            print("Trade zamrożone!")
        end
    end
end

-- Po kliknięciu przycisku, funkcja freezeTrade() jest wywoływana
button.MouseButton1Click:Connect(freezeTrade)
