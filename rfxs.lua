-- Tworzenie GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Tworzenie ramki
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 150, 0, 50)  -- Wymiary ramki (150x50)
frame.Position = UDim2.new(0.5, -75, 0.5, -25)  -- Ustawienie na środku ekranu
frame.BackgroundColor3 = Color3.fromRGB(169, 169, 169)  -- Szary kolor tła ramki
frame.Visible = false  -- Początkowo niewidoczna
frame.Parent = screenGui

-- Tworzenie przycisku
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 150, 0, 50)  -- Rozmiar przycisku (150x50)
button.Text = "Freeze Trade"  -- Tekst przycisku
button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Kolor tekstu (biały)
button.BackgroundColor3 = Color3.fromRGB(0, 122, 204)  -- Kolor tła przycisku (niebieski)
button.Parent = frame  -- Dodanie przycisku do ramki

-- Serwer (ServerScript)

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Zdarzenia
local tradeStarted = Instance.new("RemoteEvent")
tradeStarted.Name = "TradeStarted"
tradeStarted.Parent = ReplicatedStorage

local tradeEnded = Instance.new("RemoteEvent")
tradeEnded.Name = "TradeEnded"
tradeEnded.Parent = ReplicatedStorage

local freezeTrade = Instance.new("RemoteEvent")
freezeTrade.Name = "FreezeTrade"
freezeTrade.Parent = ReplicatedStorage

local unfreezeTrade = Instance.new("RemoteEvent")
unfreezeTrade.Name = "UnfreezeTrade"
unfreezeTrade.Parent = ReplicatedStorage

-- Kiedy rozpoczyna się wymiana (symulacja)
game.Players.PlayerAdded:Connect(function(player)
    -- Symulacja rozpoczęcia wymiany
    tradeStarted:FireClient(player)  -- Powiadomienie klienta o rozpoczęciu wymiany
end)

-- Kiedy kończy się wymiana (symulacja)
game.Players.PlayerAdded:Connect(function(player)
    -- Symulacja zakończenia wymiany
    wait(5)  -- Po 5 sekundach kończymy wymianę
    tradeEnded:FireClient(player)  -- Powiadomienie klienta o zakończeniu wymiany
end)

-- Zamrażanie wymiany
freezeTrade.OnServerEvent:Connect(function(player)
    print(player.Name .. " zamroził wymianę.")
    -- Możesz dodać tutaj logikę blokowania wymiany
end)

-- Odblokowanie wymiany
unfreezeTrade.OnServerEvent:Connect(function(player)
    print(player.Name .. " odblokował wymianę.")
    -- Odblokowanie wymiany
end)

-- Klient (dalej w tym samym skrypcie)

-- Zdarzenie rozpoczęcia wymiany
tradeStarted.OnClientEvent:Connect(function()
    frame.Visible = true  -- Pokazujemy przycisk, gdy rozpoczyna się wymiana
end)

-- Zdarzenie zakończenia wymiany
tradeEnded.OnClientEvent:Connect(function()
    frame.Visible = false  -- Ukrywamy przycisk, gdy kończy się wymiana
end)

-- Funkcja zamrażania trade'u (wywołana przez przycisk)
button.MouseButton1Click:Connect(function()
    -- Wywołanie zdarzenia do zamrożenia wymiany
    freezeTrade:FireServer()  -- Wysyłamy sygnał do serwera, żeby zamrozić wymianę
end)
