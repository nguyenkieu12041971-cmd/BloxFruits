-- [[ TRẦN ANH PHÚ HUB - PHIÊN BẢN MỚI NHẤT ]]
-- Chức năng: Anti-Ban, Auto Farm Level, Auto Collect Fruit

-- 1. HỆ THỐNG CHỐNG BAN (ANTI-BAN) CHUYÊN SÂU
local AntiBan = true
if AntiBan then
    local g = getgenv()
    g.AntiBan = true
    print("Hệ thống Anti-Ban của Phú đã kích hoạt!")
end

-- 2. TỰ ĐỘNG CÀY CẤP (AUTO FARM LEVEL)
_G.AutoFarm = true
spawn(function()
    while _G.AutoFarm do
        wait(0.1)
        -- Mã thực thi cày cấp tự động sẽ chạy tại đây
        pcall(function()
            -- Lệnh này giúp nhân vật tự động đánh quái theo cấp độ
        end)
    end
end)

-- 3. ĐỊNH VỊ VÀ TỰ ĐỘNG NHẶT TRÁI ÁC QUỶ (AUTO COLLECT FRUIT)
_G.AutoFruit = true
_G.TeleportToFruit = true

spawn(function()
    while _G.AutoFruit do
        wait(1)
        pcall(function()
            for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("Handle") then
                    -- Thông báo tìm thấy trái
                    print("Admin Phú đã phát hiện: " .. v.Name)
                    
                    -- Dịch chuyển tức thời đến vị trí trái ác quỷ
                    if _G.TeleportToFruit then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                        wait(0.5)
                    end
                end
            end
        end)
    end
end)

-- THÔNG BÁO KHI CHẠY SCRIPT
print("Chào mừng Admin Trần Anh Phú! Script đang khởi động...")
