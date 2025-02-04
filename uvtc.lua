-- Tworzenie GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Tworzenie bardzo małej ramki
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 100, 0, 50)  -- Mała ramka (100x50)
frame.Position = UDim2.new(0, 10, 0.5, -25)  -- Ramka w lewym górnym rogu
frame.BackgroundColor3 = Color3.fromRGB(169, 169, 169)  -- Szary kolor tła ramki
frame.Visible = false  -- Ramka jest domyślnie niewidoczna
frame.Parent = screenGui

-- Tworzenie przycisku Freeze Trade
local freezeButton = Instance.new("TextButton")
freezeButton.Size = UDim2.new(1, 0, 1, 0)  -- Przycisk wypełniający całą ramkę
freezeButton.Text = "Freeze Trade"  -- Tekst przycisku
freezeButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Kolor tekstu (biały)
freezeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Kolor tła przycisku (czerwony)
freezeButton.Font = Enum.Font.GothamBold
freezeButton.TextSize = 14
freezeButton.Parent = frame  -- Dodanie przycisku do ramki

-- Zmienna do określenia, czy wymiana jest zamrożona
local isTradeFrozen = false

-- Funkcja zamrażająca wymianę
local function freezeTrade()
    isTradeFrozen = not isTradeFrozen  -- Zmieniamy stan zamrożenia
    if isTradeFrozen then
        freezeButton.Text = "Trade Frozen"  -- Zmieniamy tekst na "Trade Frozen"
        freezeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Zmiana koloru przycisku na zielony
        -- Można dodać logikę blokującą wymianę (na serwerze)
    else
        freezeButton.Text = "Freeze Trade"  -- Zmieniamy tekst na "Freeze Trade"
        freezeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Kolor przycisku wraca do czerwonego
        -- Przywrócenie wymiany po odblokowaniu
    end
end

-- Po kliknięciu przycisku, wywołujemy funkcję freezeTrade
freezeButton.MouseButton1Click:Connect(freezeTrade)

-- Rozpoczęcie "TradeStarted" i "TradeEnded" bezpośrednio w kodzie (symulacja)

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Symulacja rozpoczęcia i zakończenia wymiany
local tradeStarted = Instance.new("RemoteEvent")
tradeStarted.Name = "TradeStarted"
tradeStarted.Parent = ReplicatedStorage

local tradeEnded = Instance.new("RemoteEvent")
tradeEnded.Name = "TradeEnded"
tradeEnded.Parent = ReplicatedStorage

-- Obsługuje rozpoczęcie wymiany
tradeStarted.OnClientEvent:Connect(function()
    print("Wymiana rozpoczęta!")
    frame.Visible = true  -- Pokaż przycisk, gdy rozpoczyna się wymiana
end)

-- Obsługuje zakończenie wymiany
tradeEnded.OnClientEvent:Connect(function()
    print("Wymiana zakończona!")
    frame.Visible = false  -- Ukryj przycisk, gdy wymiana kończy się
end)

-- Symulacja wyzwolenia zdarzenia w trakcie gry (to możesz wywołać z serwera w przypadku prawdziwego handlu)
wait(2)
tradeStarted:FireClient(game.Players.LocalPlayer)  -- Symulacja rozpoczęcia wymiany

wait(5)
tradeEnded:FireClient(game.Players.LocalPlayer)  -- Symulacja zakończenia wymiany
