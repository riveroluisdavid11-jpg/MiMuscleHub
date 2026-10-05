-- Interfaz flotante de prueba
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MiScriptHub"
screenGui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 150)
frame.Position = UDim2.new(0.5, -125, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
title.Text = "Mi Muscle Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 16
title.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 180, 0, 45)
button.Position = UDim2.new(0.5, -90, 0.5, -5)
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.Text = "Activar Farm"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextSize = 15
button.Parent = frame

button.MouseButton1Click:Connect(function()
    print("¡Farm Activado!")
    button.Text = "¡Farm Corriendo!"
end)
