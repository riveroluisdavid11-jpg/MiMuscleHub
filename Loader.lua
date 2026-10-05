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

-- Título Key
local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 35)
KeyTitle.Text = "Luis KDP Hub - Sistema Key"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
KeyTitle.Font = Enum.Font.SourceSansBold
KeyTitle.TextSize = 18
KeyTitle.Parent = KeyFrame

-- Campo de entrada Key
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
EnterButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
EnterButton.Font = Enum.Font.SourceSansBold
EnterButton.TextSize = 16
EnterButton.Parent = KeyFrame

---------------------------------------------------------
-- 2. VENTANA PRINCIPAL (ESTILO DEL VIDEO)
---------------------------------------------------------
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 520, 0, 360)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -180)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false -- Oculto hasta verificar la clave
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Barra Superior / Título
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -40, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.Text = "Luis KDP Hub"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.BackgroundTransparency = 1
TitleLabel.Parent = TopBar

-- Botón de Cerrar (X)
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 2)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 14
CloseButton.Parent = TopBar

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

---------------------------------------------------------
-- CONTENEDOR DE PESTAÑAS SUPERIORES (Tabs)
---------------------------------------------------------
local TabBar = Instance.new("ScrollingFrame")
TabBar.Size = UDim2.new(1, 0, 0, 30)
TabBar.Position = UDim2.new(0, 0, 0, 35)
TabBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TabBar.BorderSizePixel = 0
TabBar.CanvasSize = UDim2.new(0, 450, 0, 0)
TabBar.ScrollBarThickness = 0
TabBar.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.Parent = TabBar

local function CreateTab(name)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(0, 75, 1, 0)
    tabBtn.Text = name
    tabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    tabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    tabBtn.BorderSizePixel = 0
    tabBtn.Font = Enum.Font.SourceSans
    tabBtn.TextSize = 14
    tabBtn.Parent = TabBar
    return tabBtn
end

-- Pestañas del menú
CreateTab("Inicio")
CreateTab("Entrenar")
CreateTab("Full Train")
CreateTab("Rebirths")
CreateTab("Rocks")
CreateTab("Kills")
CreateTab("Boss")

---------------------------------------------------------
-- CONTENIDO DE LA PESTAÑA (SECCIONES E INTERRUPTORES)
---------------------------------------------------------
local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Size = UDim2.new(1, -20, 1, -85)
ContentFrame.Position = UDim2.new(0, 10, 0, 75)
ContentFrame.BackgroundTransparency = 1
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 300)
ContentFrame.ScrollBarThickness = 4
ContentFrame.Parent = MainFrame

-- Título de Categoría
local SectionTitle = Instance.new("TextLabel")
SectionTitle.Size = UDim2.new(1, 0, 0, 25)
SectionTitle.Text = "OVERCHARGE EVENT"
SectionTitle.TextColor3 = Color3.fromRGB(150, 150, 150)
SectionTitle.Font = Enum.Font.SourceSansBold
SectionTitle.TextSize, SectionTitle.TextXAlignment = 12, Enum.TextXAlignment.Left
SectionTitle.BackgroundTransparency = 1
SectionTitle.Parent = ContentFrame

-- Función para crear los interruptores (Toggles visuales)
local function CreateToggleItem(name, posY)
    local itemFrame = Instance.new("Frame")
    itemFrame.Size = UDim2.new(1, 0, 0, 35)
    itemFrame.Position = UDim2.new(0, 0, 0, posY)
    itemFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    itemFrame.BorderSizePixel = 0
    itemFrame.Parent = ContentFrame

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(0.8, 0, 1, 0)
    nameLabel.Position = UDim2.new(0, 10, 0, 0)
    nameLabel.Text = name
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.Font = Enum.Font.SourceSans
    nameLabel.TextSize = 14
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.BackgroundTransparency = 1
    nameLabel.Parent = itemFrame

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 30, 0, 16)
    toggleBtn.Position = UDim2.new(1, -40, 0.5, -8)
    toggleBtn.Text = ""
    toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Parent = itemFrame

    local indicator = Instance.new("Frame")
    indicator.Size = UDim2.new(0, 12, 0, 12)
    indicator.Position = UDim2.new(0, 2, 0.5, -6)
    indicator.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    indicator.BorderSizePixel = 0
    indicator.Parent = toggleBtn

    local state = false
    toggleBtn.MouseButton1Click:Connect(function()
        state = not state
        if state then
            toggleBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            indicator.Position = UDim2.new(1, -14, 0.5, -6)
            indicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        else
            toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            indicator.Position = UDim2.new(0, 2, 0.5, -6)
            indicator.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        end
    end)
end

-- Creación de las opciones visuales de entrenamiento
CreateToggleItem("Overcharged Bar Lift", 30)
CreateToggleItem("Overcharged Squat", 70)
CreateToggleItem("Overcharged Bench", 110)
CreateToggleItem("Overcharged Boulder", 150)

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
