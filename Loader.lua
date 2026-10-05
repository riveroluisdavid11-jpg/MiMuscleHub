-- Servicio de la interfaz de usuario
local CoreGui = game:GetService("CoreGui")

-- Contenedor principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LuisKDPHub"
ScreenGui.Parent = CoreGui

---------------------------------------------------------
-- 1. PANTALLA DE KEY (SISTEMA DE VERIFICACIÓN)
---------------------------------------------------------
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 350, 0, 220)
KeyFrame.Position = UDim2.new(0.5, -175, 0.5, -110)
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
KeyFrame.BorderSizePixel = 0
KeyFrame.Active = true
KeyFrame.Draggable = true
KeyFrame.Parent = ScreenGui

-- Título
local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 35)
KeyTitle.Text = "Luis KDP Hub - Sistema Key"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.BackgroundColor3 = Color3.fromRGB(150, 0, 0) -- Rojo
KeyTitle.Font = Enum.Font.SourceSansBold
KeyTitle.TextSize = 18
KeyTitle.Parent = KeyFrame

-- Campo de entrada para la Key
local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.8, 0, 0, 35)
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.PlaceholderText = "Ingresa la Key..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyInput.Parent = KeyFrame

-- Botón Entrar
local EnterButton = Instance.new("TextButton")
EnterButton.Size = UDim2.new(0.8, 0, 0, 35)
EnterButton.Position = UDim2.new(0.1, 0, 0.65, 0)
EnterButton.Text = "Entrar"
EnterButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EnterButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0) -- Rojo
EnterButton.Font = Enum.Font.SourceSansBold
EnterButton.TextSize = 16
EnterButton.Parent = KeyFrame

---------------------------------------------------------
-- 2. VENTANA PRINCIPAL (MENÚ CON PESTAÑAS Y BOTONES)
---------------------------------------------------------
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 450, 0, 300)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false -- Permanece oculto hasta verificar la Key
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Título del Menú
local MainTitle = Instance.new("TextLabel")
MainTitle.Size = UDim2.new(1, 0, 0, 40)
MainTitle.Text = "Luis KDP Hub"
MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTitle.BackgroundColor3 = Color3.fromRGB(150, 0, 0) -- Rojo
MainTitle.Font = Enum.Font.SourceSansBold
MainTitle.TextSize = 20
MainTitle.Parent = MainFrame

-- Contenedor de Botones (Opciones)
local OptionsHolder = Instance.new("Frame")
OptionsHolder.Size = UDim2.new(1, -20, 1, -60)
OptionsHolder.Position = UDim2.new(0, 10, 0, 50)
OptionsHolder.BackgroundTransparency = 1
OptionsHolder.Parent = MainFrame

-- Función para crear un Botón con estado Encendido / Apagado (Toggle)
local function CreateToggle(name, posY)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 35)
    button.Position = UDim2.new(0, 0, 0, posY)
    button.Text = name .. " [APAGADO]"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 16
    button.Parent = OptionsHolder

    local state = false
    button.MouseButton1Click:Connect(function()
        state = not state
        if state then
            button.Text = name .. " [ENCENDIDO]"
            button.BackgroundColor3 = Color3.fromRGB(0, 150, 0) -- Verde al activar
        else
            button.Text = name .. " [APAGADO]"
            button.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- Gris al desactivar
        end
    end)
end

-- Creación de opciones estáticas
CreateToggle("Fuerza / Pesa", 0)
CreateToggle("Flexiones", 45)
CreateToggle("Puños", 90)
CreateToggle("Rebirth", 135)

---------------------------------------------------------
-- LÓGICA DE VERIFICACIÓN DE KEY
---------------------------------------------------------
EnterButton.MouseButton1Click:Connect(function()
    if KeyInput.Text == "venecolombia" then
        KeyFrame.Visible = false
        MainFrame.Visible = true
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "¡Key Incorrecta!"
    end
end)
