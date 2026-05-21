-- 1. BẬT SẴN CHỐNG BAN (ANTI-BAN)
getgenv().AntiBan = true

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
   Name = "TRẦN ANH PHÚ HUB",
   LoadingTitle = "Admin Trần Anh Phú",
   LoadingSubtitle = "Đặc Sản Săn Trái & Cày Cấp",
   ConfigurationSaving = {
      Enabled = true, -- TỰ ĐỘNG LƯU LẠI CẤU HÌNH
      FolderName = "PhuHubConfigs",
      FileName = "SaveConfig"
   }
})

-- TAB CHÍNH
local Tab = Window:CreateTab("Main Pro", 4483345998)

-- NÚT BẬT TẮT CÀY CẤP (2600 - 2750)
local Toggle1 = Tab:CreateToggle({
   Name = "Auto Farm Level (2600-2750)",
   CurrentValue = false,
   Flag = "FarmLevel",
   Callback = function(Value)
      _G.AutoFarm = Value
      spawn(function()
         while _G.AutoFarm do wait(0.5)
            pcall(function()
               -- Tự lấy võ Melee ra đấm quái
               local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Melee") or game.Players.LocalPlayer.Character:FindFirstChild("Melee")
               if tool and not game.Players.LocalPlayer.Character:FindFirstChild("Melee") then
                  game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
               end
               -- Lệnh click chuột tự động đánh
               local VirtualUser = game:GetService("VirtualUser")
               VirtualUser:CaptureController()
               VirtualUser:ClickButton1(Vector2.new(851, 158))
            end)
         end
      end)
   end,
})

-- NÚT BẬT TẮT ĐẶC SẢN SĂN TRÁI + TỰ CẤT VÀO RƯƠNG
local Toggle2 = Tab:CreateToggle({
   Name = "Bật Săn Trái & Tự Cất Rương",
   CurrentValue = false,
   Flag = "FruitStore",
   Callback = function(Value)
      _G.AutoFruit = Value
      spawn(function()
         while _G.AutoFruit do wait(0.5)
            pcall(function()
               local coTrai = false
               for i,v in pairs(game.Workspace:GetChildren()) do
                  if v:IsA("Tool") and v:FindFirstChild("Handle") then
                     coTrai = true
                     -- Bay đại lại nhận trái ác quỷ ngay lập tức
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                     wait(0.5)
                     
                     -- LỆNH ĐẶC BIỆT: TỰ ĐỘNG CẤT TRÁI ÁC QUỶ VÀO RƯƠNG
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", v.Name, v)
                     print("Admin Phú đã cất trái vào Rương thành công!")
                  end
               end
               
               -- Nếu không có trái trên bản đồ -> Tự động đổi Server
               if not coTrai and _G.AutoHopServer then
                  local HttpService = game:GetService("HttpService")
                  local TPS = game:GetService("TeleportService")
                  local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
                  local Data = HttpService:JSONDecode(game:HttpGet(Api))
                  for _, server in pairs(Data.data) do
                     if server.playing < server.maxPlayers and server.id ~= game.JobId then
                        TPS:TeleportToPlaceInstance(game.PlaceId, server.id, game.Players.LocalPlayer)
                        break
                     end
                  end
               end
            end)
         end
      end)
   end,
})

-- NÚT BẬT TẮT TỰ ĐỔI SERVER
local Toggle3 = Tab:CreateToggle({
   Name = "Tự Động Đổi Server (Server Hop)",
   CurrentValue = false,
   Flag = "HopServer",
   Callback = function(Value)
      _G.AutoHopServer = Value
   end,
})
