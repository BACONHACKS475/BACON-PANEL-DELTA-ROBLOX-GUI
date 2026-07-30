-- Создаем интерфейс в PlayerGui (для защиты от блокировок на Android)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Удаляем старую версию, если она уже открыта
if PlayerGui:FindFirstChild("BaconPanelGui") then
    PlayerGui.BaconPanelGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BaconPanelGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Главное окно меню
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 280, 0, 180)
MainFrame.Position = UDim2.new(0.5, -140, 0.4, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- Можно перетаскивать пальцем по экрану
MainFrame.Parent = ScreenGui

-- Шапка меню
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.Text = "🥓 BACON PANEL 🥓"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold
Title.Parent = MainFrame

-- Кнопка закрытия/сворачивания
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -35, 0, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 16
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.Parent = MainFrame

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- Текст внутри меню
local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, 0, 0, 40)
Status.Position = UDim2.new(0, 0, 0.35, 0)
Status.BackgroundTransparency = 1
Status.Text = "Меню успешно загружено!"
Status.TextColor3 = Color3.fromRGB(0, 255, 120)
Status.TextSize = 15
Status.Font = Enum.Font.SourceSans
Status.Parent = MainFrame

-- Первая тестовая функция/кнопка (например, прыжок)
local ActionBtn = Instance.new("TextButton")
ActionBtn.Size = UDim2.new(0.8, 0, 0, 35)
ActionBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
ActionBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
ActionBtn.Text = "Бесконечный прыжок"
ActionBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ActionBtn.TextSize = 14
ActionBtn.Font = Enum.Font.SourceSansBold
ActionBtn.Parent = MainFrame

ActionBtn.MouseButton1Click:Connect(function()
    LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = 100
    ActionBtn.Text = "Прыжок увеличен!"
end)
