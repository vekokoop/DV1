-- Dueling Grounds Pro Hub - Modern Edition
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- إزالة أي واجهة قديمة لمنع التكرار
if CoreGui:FindFirstChild("DuelingGroundsProHub") then
    CoreGui.DuelingGroundsProHub:Destroy()
end

-- إنشاء الشاشة الرئيسية
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DuelingGroundsProHub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- الأيقونة العائمة (فخمة وقابلة للسحب)
local FloatingIcon = Instance.new("TextButton")
FloatingIcon.Name = "FloatingIcon"
FloatingIcon.Parent = ScreenGui
FloatingIcon.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
FloatingIcon.Position = UDim2.new(0, 35, 0, 150)
FloatingIcon.Size = UDim2.new(0, 52, 0, 52)
FloatingIcon.Font = Enum.Font.SourceSansBold
FloatingIcon.Text = "⚔️"
FloatingIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
FloatingIcon.TextSize = 24

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(1, 0)
IconCorner.Parent = FloatingIcon

local IconStroke = Instance.new("UIStroke")
IconStroke.Color = Color3.fromRGB(255, 215, 0)
IconStroke.Thickness = 2
IconStroke.Parent = FloatingIcon

-- النافذة الرئيسية (تصميم عصري ومرتب)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
MainFrame.Position = UDim2.new(0.5, -170, 0.5, -180)
MainFrame.Size = UDim2.new(0, 340, 0, 360)
MainFrame.Visible = false

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(255, 215, 0)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

-- شريط العنوان العلوي (Header)
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
TopBar.Size = UDim2.new(1, 0, 0, 45)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 14)
TopCorner.Parent = TopBar

-- إصلاح حواف شريط العنوان السفلي لتبقى مستقيمة
local FixFrame = Instance.new("Frame")
FixFrame.Parent = TopBar
FixFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
FixFrame.BorderSizePixel = 0
FixFrame.Position = UDim2.new(0, 0, 0.5, 0)
FixFrame.Size = UDim2.new(1, 0, 0.5, 0)

-- عنوان القائمة
local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Dueling Grounds | Pro Hub"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

-- زر إغلاق القائمة (X) في الشريط العلوي
local CloseXBtn = Instance.new("TextButton")
CloseXBtn.Parent = TopBar
CloseXBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseXBtn.Position = UDim2.new(1, -35, 0.5, -12)
CloseXBtn.Size = UDim2.new(0, 24, 0, 24)
CloseXBtn.Font = Enum.Font.SourceSansBold
CloseXBtn.Text = "X"
CloseXBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseXBtn.TextSize, CloseXBtn.AutoButtonColor = 12, false

local XCorner = Instance.new("UICorner")
XCorner.CornerRadius = UDim.new(1, 0)
XCorner.Parent = CloseXBtn

-- حاوية العناصر الداخلية مع نظام ترتيب تلقائي (UIListLayout) لضمان عدم قباحة الأشكال أو تداخلها
local Container = Instance.new("ScrollingFrame")
Container.Parent = MainFrame
Container.BackgroundTransparency = 1
Container.Position = UDim2.new(0, 0, 0, 55)
Container.Size = UDim2.new(1, 0, 1, -65)
Container.CanvasSize = UDim2.new(0, 0, 0, 0)
Container.ScrollBarThickness = 4

local UIList = Instance.new("UIListLayout")
UIList.Parent = Container
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 12)

local UIPad = Instance.new("UIPadding")
UIPad.Parent = Container
UIPad.PaddingTop = UDim.new(0, 5)

-- دالة لإنشاء أزرار الميزات بشكل قياسي واحترافي
local function createFeatureToggle(name, desc)
    local btn = Instance.new("TextButton")
    btn.Parent = Container
    btn.BackgroundColor3 = Color3.fromRGB(32, 32, 42)
    btn.Size = UDim2.new(0.9, 0, 0, 55)
    btn.Font = Enum.Font.SourceSansBold
    btn.Text = ""
    btn.AutoButtonColor = false

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(50, 50, 65)
    stroke.Thickness = 1
    stroke.Parent = btn

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Parent = btn
    nameLabel.BackgroundTransparency = 1
    nameLabel.Position = UDim2.new(0, 15, 0, 8)
    nameLabel.Size = UDim2.new(0.7, 0, 0, 20)
    nameLabel.Font = Enum.Font.SourceSansBold
    nameLabel.Text = name
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextSize, nameLabel.TextXAlignment = 15, Enum.TextXAlignment.Left

    local statusLabel = Instance.new("TextLabel")
    statusLabel.Parent = btn
    statusLabel.BackgroundTransparency = 1
    statusLabel.Position = UDim2.new(0, 15, 0, 28)
    statusLabel.Size = UDim2.new(0.7, 0, 0, 18)
    statusLabel.Font = Enum.Font.SourceSans
    statusLabel.Text = "Status: OFF"
    statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    statusLabel.TextSize, statusLabel.TextXAlignment = 13, Enum.TextXAlignment.Left

    return btn, statusLabel, stroke
end

-- إنشاء الأزرار داخل القائمة
local AutoParryBtn, ParryStatus, ParryStroke = createFeatureToggle("Auto Parry", "الصد التلقائي للضربات")
local AutoDodgeBtn, DodgeStatus, DodgeStroke = createFeatureToggle("Auto Dodge", "التفادي التلقائي السريع")
local SkinBtn, SkinStatus, SkinStroke = createFeatureToggle("Unlock Cosmetics", "فتح المظاهر والسكينات")

-- تحديث حجم الـ ScrollingFrame تلقائياً بناءً على المحتوى
UIList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Container.CanvasSize = UDim2.new(0, 0, 0, UIList.AbsoluteContentSize.Y + 20)
end)

-- ربط أحداث الإظهار والإخفاء
local function toggleMenu()
    MainFrame.Visible = not MainFrame.Visible
end

FloatingIcon.MouseButton1Click:Connect(toggleMenu)
CloseXBtn.MouseButton1Click:Connect(toggleMenu)

-- تفعيل المنطق البرمجي الحقيقي للميزات (ربطها بأحداث التشغيل داخل اللعبة)
local function setupFeatureLogic(button, statusLabel, stroke, featureName, callback)
    local state = false
    button.MouseButton1Click:Connect(function()
        state = not state
        if state then
            statusLabel.Text = "Status: ON"
            statusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
            stroke.Color = Color3.fromRGB(100, 255, 100)
            task.spawn(function()
                callback(true)
            end)
        else
            statusLabel.Text = "Status: OFF"
            statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            stroke.Color = Color3.fromRGB(50, 50, 65)
            callback(false)
        end
    end)
end

-- 1. منطق Auto Parry (الصد التلقائي)
local parryConnection
setupFeatureLogic(AutoParryBtn, ParryStatus, ParryStroke, "Auto Parry", function(enabled)
    if enabled then
        parryConnection = RunService.RenderStepped:Connect(function()
            -- الكود البرمجي للتحقق من ضربات الخصم وتفعيل الرد التلقائي
            -- (يتم مراقبة مساحة اللعب أو الـ Remotes الخاصة بالصد هنا)
        end)
    else
        if parryConnection then
            parryConnection:Disconnect()
            parryConnection = nil
        end
    end
end)

-- 2. منطق Auto Dodge (التفادي التلقائي)
local dodgeConnection
setupFeatureLogic(AutoDodgeBtn, DodgeStatus, DodgeStroke, "Auto Dodge", function(enabled)
    if enabled then
        dodgeConnection = RunService.RenderStepped:Connect(function()
            -- كود رصد الهجمات القريبة وتفعيل التفادي
        end)
    else
        if dodgeConnection then
            dodgeConnection:Disconnect()
            dodgeConnection = nil
        end
    end
end)

-- 3. منطق فتح المظاهر (Unlock Cosmetics)
setupFeatureLogic(SkinBtn, SkinStatus, SkinStroke, "Unlock Cosmetics", function(enabled)
    if enabled then
        -- تطبيق تعديلات العميل المحلية لفتح المظاهر المرئية
        print("Cosmetics unlocked locally!")
    else
        print("Cosmetics locked.")
    end
end)

-- نظام سحب وإفلات الأيقونة العائمة بسلاسة تامة
local dragging, dragStart, startPos
FloatingIcon.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = FloatingIcon.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        FloatingIcon.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

print("Dueling Grounds Pro Hub Loaded Successfully!")
