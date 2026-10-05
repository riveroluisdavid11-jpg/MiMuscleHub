-- Carga de la librería de interfaz visual Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Creación de la ventana principal
local Window = Rayfield:CreateWindow({
   Name = "Luis KDP Hub",
   LoadingTitle = "Cargando Luis KDP Hub...",
   LoadingSubtitle = "por Luis KDP",
   ConfigurationSaving = { Enabled = false }
})

-- Pestaña 1: Sistema de Clave (Key System)
local KeyTab = Window:CreateTab("Acceso", 4483362458)

KeyTab:CreateInput({
   Name = "Ingresa la Key",
   PlaceholderText = "Escribe la clave aquí...",
   RemoveTextAfterFocusLost = false,
   Callback = function(TextoIngresado)
       if TextoIngresado == "venecolombia" then
           Rayfield:Notify({
              Title = "Acceso Concedido",
              Content = "¡Bienvenido a Luis KDP Hub!",
              Duration = 3.5,
           })
       else
           Rayfield:Notify({
              Title = "Clave Incorrecta",
              Content = "Intenta de nuevo.",
              Duration = 3.5,
           })
       end
   end,
})

-- Pestaña 2: Entrenamiento (Pesa, Flexiones, Puños)
local TabEntrenamiento = Window:CreateTab("Entrenar", 4483362458)

TabEntrenamiento:CreateButton({
   Name = "Pesa (Fuerza)",
   Callback = function()
       print("Opción Pesa seleccionada")
   end,
})

TabEntrenamiento:CreateButton({
   Name = "Flexiones",
   Callback = function()
       print("Opción Flexiones seleccionada")
   end,
})

TabEntrenamiento:CreateButton({
   Name = "Puños",
   Callback = function()
       print("Opción Puños seleccionada")
   end,
})

-- Pestaña 3: Rebirths
local TabRebirths = Window:CreateTab("Rebirths", 4483362458)

TabRebirths:CreateButton({
   Name = "Renacer",
   Callback = function()
       print("Opción Renacer seleccionada")
   end,
})

-- Pestaña 4: Tienda y Mascotas
local TabTienda = Window:CreateTab("Tienda Pets", 4483362458)

TabTienda:CreateButton({
   Name = "Comprar Pet",
   Callback = function()
       print("Opción Comprar Pet seleccionada")
   end,
})

-- Pestaña 5: Jugadores / Amigos
local TabJugadores = Window:CreateTab("Jugadores", 4483362458)

TabJugadores:CreateToggle({
   Name = "Proteger Amigos",
   CurrentValue = true,
   Flag = "ProtegerAmigosFlag",
   Callback = function(Estado)
       print("Protección de amigos:", Estado)
   end,
})
