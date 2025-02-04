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
        -- Można dodać logikę blokującą wymianę (na serwerze)
    else
        freezeButton.Text = "Freeze Trade"  -- Zmieniamy tekst na "Freeze Trade"
        freezeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Kolor przycisku wraca do czerwonego
        -- Przywrócenie wymiany po odblokowaniu
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

-- Wykorzystanie "ReplicatedStorage" do monitorowania rozpoczęcia wymiany
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Sprawdzamy, czy takie zdarzenie jest dostępne w ReplicatedStorage
if ReplicatedStorage:FindFirstChild("TradeStarted") then
    ReplicatedStorage.TradeStarted.OnClientEvent:Connect(onTradeStarted)
end

if ReplicatedStorage:FindFirstChild("TradeEnded") then
    ReplicatedStorage.TradeEnded.OnClientEvent:Connect(onTradeEnded)
end
