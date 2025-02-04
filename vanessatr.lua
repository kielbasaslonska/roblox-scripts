-- Tworzenie GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Tworzenie bardzo małej ramki
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 100, 0, 50)  -- Mała ramka (100x50)
frame.Position = UDim2.new(0, 10, 0.5, -25)  -- Ramka w lewym górnym rogu
frame.BackgroundColor3 = Color3.fromRGB(169, 169, 169)  -- Szary kolor tła ramki
frame.Visible = false  -- Ukrywamy GUI na początku
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
        -- Tutaj kod, który wstrzymuje proces wymiany, np. zatrzymywanie interakcji z bronią
    else
        freezeButton.Text = "Freeze Trade"  -- Zmieniamy tekst na "Freeze Trade"
        freezeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Kolor przycisku wraca do czerwonego
        -- Przywrócenie procesu wymiany po odblokowaniu
    end
end

-- Funkcja monitorująca rozpoczęcie wymiany
local function onTradeStarted()
    frame.Visible = true  -- Pokazujemy ramkę z przyciskiem, gdy zaczyna się wymiana
end

-- Funkcja monitorująca zakończenie wymiany
local function onTradeEnded()
    frame.Visible = false  -- Ukrywamy ramkę z przyciskiem, gdy wymiana zostaje zakończona
end

-- Po kliknięciu przycisku, wywołujemy funkcję freezeTrade
freezeButton.MouseButton1Click:Connect(freezeTrade)

-- Przykład monitorowania, czy gracz uczestniczy w wymianie
-- Wymaga odpowiednich zdarzeń z systemu wymiany w grze, np. z "ReplicatedStorage" w przypadku MM2

-- Zdarzenie, które monitoruje, kiedy zaczyna się wymiana
-- Zdarzenie to może pochodzić z serwera lub systemu wymiany w grze
game.ReplicatedStorage:WaitForChild("TradeStarted").OnClientEvent:Connect(onTradeStarted)

-- Zdarzenie, które monitoruje, kiedy wymiana się kończy
game.ReplicatedStorage:WaitForChild("TradeEnded").OnClientEvent:Connect(onTradeEnded)
