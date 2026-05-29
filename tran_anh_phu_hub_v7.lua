local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
   Name = "TRẦN ANH PHÚ HUB v7 - ALL IN ONE",
   LoadingTitle = "Admin Trần Anh Phú",
   LoadingSubtitle = "Tự động hóa hoàn toàn",
   ConfigurationSaving = { Enabled = true, FolderName = "PhuHub", FileName = "SaveConfig" }
})

local TabMain = Window:CreateTab("Main Farm & Sea 2", 4483345998)

-- 1. CÀY CẤP & MUA VÕ/KIẾM
TabMain:CreateToggle({
   Name = "Auto Farm Level (2600-2800)",
   Callback = function(Value)
      _G.AutoFarm = Value
      -- Logic cày cấp và tự dùng Beli mua võ/kiếm khi đủ tiền
   end
})

-- 2. TỰ ĐỘNG SANG SEA 2 (CẦN CẤP 700)
TabMain:CreateToggle({
   Name = "Tự Động Làm Nhiệm Vụ Sang Sea 2",
   Callback = function(Value)
      local level = game.Players.LocalPlayer.Data.Level.Value
      if level < 700 then
         Rayfield:Notify({Title = "Thông báo", Content = "Bạn chưa đủ cấp 700 để sang Sea 2!", Duration = 5})
      else
         _G.AutoSea2 = Value
         -- Logic tự động tìm NPC nhận Quest sang Sea 2
      end
   end
})

-- 3. TÌM KIẾM CỦA ZORO (DÀNH CHO SEA 1)
TabMain:CreateToggle({
   Name = "Tự Động Tìm Kiếm Của Zoro",
   Callback = function(Value)
      _G.AutoZoroSword = Value
      -- Logic tìm kiếm của Zoro trước khi qua Sea 2
   end
})

-- 4. BẬT/TẮT TỰ ĐỘNG LÀM HẾT TẤT CẢ
TabMain:CreateToggle({
   Name = "Bật Tự Động Làm Hết Ở Sea 2",
   Callback = function(Value)
      _G.AutoAllSea2 = Value
      -- Phú bật nút này, script sẽ tự xử lý mọi thứ ở Sea 2, không cần tắt
   end
})
