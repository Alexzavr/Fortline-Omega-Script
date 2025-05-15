-- is edited with VS Code
--[[ Omega Build Script
    Version: 1.0
    Description: A script for building in a game using Rayfield UI.
]]
--[[
    Building Models:
    Wall, Floor, Door, Window, Ramp, RampBack
    All models can be rotated by $0$0
    Example: Wall$90$0, Floor$270$0, Ramp$180$0
]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
SlideXAxis = 0
SlideYAxis = 0
SlideZAxis = 0
local isBuilding = false  -- Ініціалізація змінної isBuilding
local Model1 = "Wall$0$0"  -- Ініціалізація моделі за замовчуванням

local Window = Rayfield:CreateWindow({
   Name = "Omega Script Hub",
   Icon = 0, -- Іконка в Topbar
   LoadingTitle = "Menu",
   LoadingSubtitle = "by Me",
   Theme = "Default",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = "OmegaBuilder",
      FileName = "nul"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = true,
   KeySettings = {
      Title = "My",
      Subtitle = "Key System",
      Note = "Pastebin Method is used.",
      FileName = "omegabuilderkeyrayfield",
      SaveKey = true,
      GrabKeyFromSite = true,
      Key = {"https://pastebin.com/raw/KRNQM9S7"}
   }
})

local Tab = Window:CreateTab("Manual Build", nil)
local ManualSection = Tab:CreateSection("Sliders")

local BuildToggle = Tab:CreateToggle({
    Name = "Toggle building",
    CurrentValue = false,
    Flag = "BuildingToggle",
    Callback = function(Value)
        isBuilding = Value
    end,
})

local XSlider = Tab:CreateSlider({
    Name = "X Axis Slider",
    Range = {-100, 100},
    Increment = 1,
    Suffix = "X Axis Coordinate",
    CurrentValue = 0,
    Flag = "XAxisSlider",
    Callback = function(Value)
        SlideXAxis = Value
    end,
})

local YSlider = Tab:CreateSlider({
    Name = "Y Axis Slider",
    Range = {0, 100},
    Increment = 1,
    Suffix = "Y Axis Coordinate",
    CurrentValue = 0,
    Flag = "YAxisSlider",
    Callback = function(Value)
        SlideYAxis = Value
    end,
})

local ZSlider = Tab:CreateSlider({
    Name = "Z Axis Slider",
    Range = {-100, 100},
    Increment = 1,
    Suffix = "Z Axis Coordinate",
    CurrentValue = 0,
    Flag = "ZAxisSlider",
    Callback = function(Value)
        SlideZAxis = Value
    end,
})

local Input = Tab:CreateInput({
   Name = "Model",
   CurrentValue = "Wall$0$0",
   PlaceholderText = "Input",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1Model",
   Callback = function(Text)
       Model1 = Text
   end,
})

-- Функція для побудови об'єкта
local function Build(Model, x, y, z)
    local args = {
        Model,
        vector.create(x, y, z)  -- Використання Vector3 для створення 3D координат
    }

    game:GetService("ReplicatedStorage"):WaitForChild("BuildingSystem"):WaitForChild("Libraries"):WaitForChild("Grid"):WaitForChild("AddGridObject"):FireServer(unpack(args))
end

-- Цикл для побудови, поки isBuilding == true
while true do
    if isBuilding then
        Build(Model1, SlideXAxis, SlideYAxis, SlideZAxis)
    end
    wait(0.0000001)  -- Часова затримка між виконаннями циклу
end
