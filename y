local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Yvng's Selling Gui", "Synapse") 

if game.PlaceId == 2788229376 then

end

-- MAIN
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main")


MainSection:NewButton("Fly", "Press X To Fly & Unfly", function()
    repeat wait() 
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse
local plr = game.Players.LocalPlayer 
local torso = plr.Character.Head 
local flying = false
local deb = true 
local ctrl = {f = 0, b = 0, l = 0, r = 0} 
local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
local maxspeed = 500 
local speed = 5000 

function Fly() 
local bg = Instance.new("BodyGyro", torso) 
bg.P = 9e4 
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
bg.cframe = torso.CFrame 
local bv = Instance.new("BodyVelocity", torso) 
bv.velocity = Vector3.new(0,0.1,0) 
bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
repeat wait() 
plr.Character.Humanoid.PlatformStand = true 
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
speed = speed+.5+(speed/maxspeed) 
if speed > maxspeed then 
speed = maxspeed 
end 
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
speed = speed-1 
if speed < 0 then 
speed = 0 
end 
end 
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
else 
bv.velocity = Vector3.new(0,0.1,0) 
end 
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
until not flying 
ctrl = {f = 0, b = 0, l = 0, r = 0} 
lastctrl = {f = 0, b = 0, l = 0, r = 0} 
speed = 0 
bg:Destroy() 
bv:Destroy() 
plr.Character.Humanoid.PlatformStand = false 
end 
mouse.KeyDown:connect(function(key) 
if key:lower() == "x" then 
if flying then flying = false 
else 
flying = true 
Fly() 
end 
elseif key:lower() == "w" then 
ctrl.f = 1 
elseif key:lower() == "s" then 
ctrl.b = -1 
elseif key:lower() == "a" then 
ctrl.l = -1 
elseif key:lower() == "d" then 
ctrl.r = 1 
end 
end) 
mouse.KeyUp:connect(function(key) 
if key:lower() == "w" then 
ctrl.f = 0 
elseif key:lower() == "s" then 
ctrl.b = 0 
elseif key:lower() == "a" then 
ctrl.l = 0 
elseif key:lower() == "d" then 
ctrl.r = 0 
end 
end)
Fly()
end)


MainSection:NewButton("Swag Crasher", "Loads Swag Mode Crasher", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SuperCustomServerCrasher'))()
end)


MainSection:NewButton("Encrypt Crash", "Loads Encrypt Crasher", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/remorseW/encryptW/main/CustomEncryptCrasher.lua'))()
end)

MainSection:NewButton("Ctrl TP", "Hold ctrl and click somewhere to tp there", function()
    local Plr = game:GetService("Players").LocalPlayer
			local Mouse = Plr:GetMouse()

			Mouse.Button1Down:connect(
				function()
					if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
						return
					end
					if not Mouse.Target then
						return
					end
					Plr.Character:MoveTo(Mouse.Hit.p)
				end
			)

end)


MainSection:NewButton("Cash Gui", "Loads Cash Gui To Drop & Aura", function()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/Raycodex/Exploiting/main/Roblox/Da%20Hood%20Auto%20Cash%20Drop"), true))()
end)


-- MISC
local Main = Window:NewTab("Misc")
local MainSection = Main:NewSection("Misc")


MainSection:NewButton("AimLock", "Press Q To Lock & Unlock On People", function()
    Settings = {
        rewrittenmain = {
            Enabled = true,
            Key = "q",
            DOT = true,
            AIRSHOT = true,
            NOTIF = true,
            AUTOPRED = false,
            FOV = math.huge,
            RESOVLER = false
        }
    }

    local SelectedPart = "HumanoidRootPart"
    local Prediction = true
    local PredictionValue = 0.1202938


    local AnchorCount = 0
    local MaxAnchor = 50

    local CC = game:GetService"Workspace".CurrentCamera
    local Plr;
    local enabled = false
    local accomidationfactor = 0.115
    local mouse = game.Players.LocalPlayer:GetMouse()
    local placemarker = Instance.new("Part", game.Workspace)

    function makemarker(Parent, Adornee, Color, Size, Size2)
        local e = Instance.new("BillboardGui", Parent)
        e.Name = "PP"
        e.Adornee = Adornee
        e.Size = UDim2.new(Size, Size2, Size, Size2)
        e.AlwaysOnTop = Settings.rewrittenmain.DOT
        local a = Instance.new("Frame", e)
        if Settings.rewrittenmain.DOT == true then
            a.Size = UDim2.new(1, 0, 1, 0)
        else
            a.Size = UDim2.new(0, 0, 0, 0)
        end
        if Settings.rewrittenmain.DOT == true then
            a.Transparency = 0
            a.BackgroundTransparency = 0
        else
            a.Transparency = 0
            a.BackgroundTransparency = 0
        end
        a.BackgroundColor3 = Color
        local g = Instance.new("UICorner", a)
        if Settings.rewrittenmain.DOT == false then
            g.CornerRadius = UDim.new(0, 0)
        else
            g.CornerRadius = UDim.new(1, 1) 
        end
        return(e)
    end


    local data = game.Players:GetPlayers()
    function noob(player)
        local character
        repeat wait() until player.Character
        local handler = makemarker(guimain, player.Character:WaitForChild(SelectedPart), Color3.fromRGB(105, 105, 105), 0.3, 3)
        handler.Name = player.Name
        player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild(SelectedPart) end)


        spawn(function()
            while wait() do
                if player.Character then
                end
            end
        end)
    end

    for i = 1, #data do
        if data[i] ~= game.Players.LocalPlayer then
            noob(data[i])
        end
    end

    game.Players.PlayerAdded:connect(function(Player)
        noob(Player)
    end)

    spawn(function()
        placemarker.Anchored = true
        placemarker.CanCollide = false
        if Settings.rewrittenmain.DOT == true then
            placemarker.Size = Vector3.new(8, 8, 8)
        else
            placemarker.Size = Vector3.new(0, 0, 0)
        end
        placemarker.Transparency = 0.50
        if Settings.rewrittenmain.DOT then
            makemarker(placemarker, placemarker, Color3.fromRGB(105, 105, 105), 0.40, 0)
        end
    end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
        if k == Settings.rewrittenmain.Key and Settings.rewrittenmain.Enabled then
            if enabled == true then
                enabled = false
                if Settings.rewrittenmain.NOTIF == true then
                    Plr = getClosestPlayerToCursor()
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "yvng's lock";
                        Text = "unlocked",
                        Duration = 3
                    })
                end
            else
                Plr = getClosestPlayerToCursor()
                enabled = true
                if Settings.rewrittenmain.NOTIF == true then

                    game.StarterGui:SetCore("SendNotification", {
                        Title = "yvng's lock";
                        Text = "Target: "..tostring(Plr.Character.Humanoid.DisplayName),
                        Duration = 3
                    })

                end
            end
        end
    end)



    function getClosestPlayerToCursor()
        local closestPlayer
        local shortestDistance = Settings.rewrittenmain.FOV

        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
                local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
        return closestPlayer
    end

    local pingvalue = nil;
    local split = nil;
    local ping = nil;

    game:GetService"RunService".Stepped:connect(function()
        if enabled and Plr.Character ~= nil and Plr.Character:FindFirstChild("HumanoidRootPart") then
            placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
        else
            placemarker.CFrame = CFrame.new(0, 9999, 0)
        end
        if Settings.rewrittenmain.AUTOPRED == true then
            pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
            split = string.split(pingvalue,'(')
            ping = tonumber(split[1])
            if ping < 130 then
                PredictionValue = 0.151
            elseif ping < 125 then
                PredictionValue = 0.149
            elseif ping < 110 then
                PredictionValue = 0.146
            elseif ping < 105 then
                PredictionValue = 0.138
            elseif ping < 90 then
                PredictionValue = 0.136
            elseif ping < 80 then
                PredictionValue = 0.134
            elseif ping < 70 then
                PredictionValue = 0.131
            elseif ping < 60 then
                PredictionValue = 0.1229
            elseif ping < 50 then
                PredictionValue = 0.1225
            elseif ping < 40 then
                PredictionValue = 0.1256
            end
        end
    end)

    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = newcclosure(function(...)
        local args = {...}
        if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" and Settings.rewrittenmain.Enabled and Plr.Character ~= nil then

            -- args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor)
        --[[
        if Settings.rewrittenmain.AIRSHOT == true then
            if game.Workspace.Players[Plr.Name].Humanoid:GetState() == Enum.HumanoidStateType.Freefall then -- Plr.Character:WaitForChild("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall
                
                --// Airshot
                args[3] = Plr.Character.LeftFoot.Position+(Plr.Character.LeftFoot.Velocity*PredictionValue)

            else
                args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*PredictionValue)

            end
        else
                args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*PredictionValue)
        end
        ]]
            if Prediction == true then

                args[3] = Plr.Character[SelectedPart].Position+(Plr.Character[SelectedPart].Velocity*PredictionValue)

            else

                args[3] = Plr.Character[SelectedPart].Position

            end

            return old(unpack(args))
        end
        return old(...)
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
        if Settings.rewrittenmain.RESOVLER == true and Plr.Character ~= nil and enabled and Settings.rewrittenmain.Enabled then
            if Settings.rewrittenmain.AIRSHOT == true and enabled and Plr.Character ~= nil then

                if game.Workspace.Players[Plr.Name].Humanoid:GetState() == Enum.HumanoidStateType.Freefall then -- Plr.Character:WaitForChild("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall

                    --// Airshot

                    --// Anchor Check

                    if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                        AnchorCount = AnchorCount + 1
                        if AnchorCount >= MaxAnchor then
                            Prediction = false
                            wait(2)
                            AnchorCount = 0;
                        end
                    else
                        Prediction = true
                        AnchorCount = 0;
                    end

                    SelectedPart = "LeftFoot"

                else
                    --// Anchor Check

                    if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                        AnchorCount = AnchorCount + 1
                        if AnchorCount >= MaxAnchor then
                            Prediction = false
                            wait(2)
                            AnchorCount = 0;
                        end
                    else
                        Prediction = true
                        AnchorCount = 0;
                    end

                    SelectedPart = "HumanoidRootPart"

                end
            else

                --// Anchor Check

                if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                    AnchorCount = AnchorCount + 1
                    if AnchorCount >= MaxAnchor then
                        Prediction = false
                        wait(2)
                        AnchorCount = 0;
                    end
                else
                    Prediction = true
                    AnchorCount = 0;
                end

                SelectedPart = "HumanoidRootPart"
            end

        else
            SelectedPart = "HumanoidRootPart"
        end
    end)
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "yvngs lock";
        Text = "yvng#1111";
    })
end)


MainSection:NewButton("Fist Reach", "Gives You A Bigger Hitbox For Fist", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/aZHK690D'))()
end)


MainSection:NewButton("No Slowdown", "Removes Slowdown", function()
    antislow = jjsplcoit
        repeat
            wait(0.1)
            local player = game.Players.LocalPlayer
            local DeletePart =
                player.Character.BodyEffects.Movement:FindFirstChild("NoJumping") or
                player.Character.BodyEffects.Movement:FindFirstChild("ReduceWalk") or
                player.Character.BodyEffects.Movement:FindFirstChild("NoWalkSpeed")
            if DeletePart then
                DeletePart:Destroy()
            end
            if player.Character.BodyEffects.Reload.Value == true then
                player.Character.BodyEffects.Reload.Value = false
            end
        until antislow == false
end)


MainSection:NewButton("Animations Gamepass", "Gives You The Animations Gamepass", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/bGbzrYVD"))()
end)


MainSection:NewButton("Chat Spy", "Reveals What People Say In Chat", function()
    --This script reveals ALL hidden messages in the default chat
			--chat "/spy" to toggle!
			enabled = true
			--if true will check your messages too
			spyOnMyself = true
			--if true will chat the logs publicly (fun, risky)
			public = false
			--if true will use /me to stand out
			publicItalics = true
			--customize private logs
			privateProperties = {
				Color = Color3.fromRGB(0,255,255); 
				Font = Enum.Font.SourceSansBold;
				TextSize = 18;
			}
			--////////////////////////////////////////////////////////////////
			local StarterGui = game:GetService("StarterGui")
			local Players = game:GetService("Players")
			local player = Players.LocalPlayer
			local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
			local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
			local instance = (_G.chatSpyInstance or 0) + 1
			_G.chatSpyInstance = instance

			local function onChatted(p,msg)
				if _G.chatSpyInstance == instance then
					if p==player and msg:lower():sub(1,4)=="/spy" then
						enabled = not enabled
						wait(0.3)
						privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
						StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
					elseif enabled and (spyOnMyself==true or p~=player) then
						msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
						local hidden = true
						local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
							if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==player.Team)) then
								hidden = false
							end
						end)
						wait(1)
						conn:Disconnect()
						if hidden and enabled then
							if public then
								saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
							else
								privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
								StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
							end
						end
					end
				end
			end

			for _,p in ipairs(Players:GetPlayers()) do
				p.Chatted:Connect(function(msg) onChatted(p,msg) end)
			end
			Players.PlayerAdded:Connect(function(p)
				p.Chatted:Connect(function(msg) onChatted(p,msg) end)
			end)
			privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
			StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
			local chatFrame = player.PlayerGui.Chat.Frame
			chatFrame.ChatChannelParentFrame.Visible = true
			chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
end)



MainSection:NewButton("Translator", "Translates What Players Chat", function()
    			--[[
    Message Translator
    Made by Aim, updated by cli
    Credits to Riptxde for the sending chathook
--]]

			if not game['Loaded'] then game['Loaded']:Wait() end; repeat wait(.06) until game:GetService('Players').LocalPlayer ~= nil
			local YourLang = "en" -- Language code that the messages are going to be translated to

			local googlev = isfile'googlev.txt' and readfile'googlev.txt' or ''

			function googleConsent(Body) -- Because google really said: "Fuck you."
				local args = {}

				for match in Body:gmatch('<input type="hidden" name=".-" value=".-">') do
					local k,v = match:match('<input type="hidden" name="(.-)" value="(.-)">')
					args[k] = v
				end
				googlev = args.v
				writefile('googlev.txt', args.v)
			end

			local function got(url, Method, Body) -- Basic version of https://www.npmjs.com/package/got using synapse's request API for google websites
				Method = Method or "GET"

				local res = syn.request({
					Url = url,
					Method = Method,
					Headers = {cookie="CONSENT=YES+"..googlev},
					Body = Body
				})

				if res.Body:match('https://consent.google.com/s') then
					print('consent')
					googleConsent(res.Body)
					res = syn.request({
						Url = url,
						Method = "GET",
						Headers = {cookie="CONSENT=YES+"..googlev}
					})
				end

				return res
			end

			local languages = {
				auto = "Automatic",
				af = "Afrikaans",
				sq = "Albanian",
				am = "Amharic",
				ar = "Arabic",
				hy = "Armenian",
				az = "Azerbaijani",
				eu = "Basque",
				be = "Belarusian",
				bn = "Bengali",
				bs = "Bosnian",
				bg = "Bulgarian",
				ca = "Catalan",
				ceb = "Cebuano",
				ny = "Chichewa",
				['zh-cn'] = "Chinese Simplified",
				['zh-tw'] = "Chinese Traditional",
				co = "Corsican",
				hr = "Croatian",
				cs = "Czech",
				da = "Danish",
				nl = "Dutch",
				en = "English",
				eo = "Esperanto",
				et = "Estonian",
				tl = "Filipino",
				fi = "Finnish",
				fr = "French",
				fy = "Frisian",
				gl = "Galician",
				ka = "Georgian",
				de = "German",
				el = "Greek",
				gu = "Gujarati",
				ht = "Haitian Creole",
				ha = "Hausa",
				haw = "Hawaiian",
				iw = "Hebrew",
				hi = "Hindi",
				hmn = "Hmong",
				hu = "Hungarian",
				is = "Icelandic",
				ig = "Igbo",
				id = "Indonesian",
				ga = "Irish",
				it = "Italian",
				ja = "Japanese",
				jw = "Javanese",
				kn = "Kannada",
				kk = "Kazakh",
				km = "Khmer",
				ko = "Korean",
				ku = "Kurdish (Kurmanji)",
				ky = "Kyrgyz",
				lo = "Lao",
				la = "Latin",
				lv = "Latvian",
				lt = "Lithuanian",
				lb = "Luxembourgish",
				mk = "Macedonian",
				mg = "Malagasy",
				ms = "Malay",
				ml = "Malayalam",
				mt = "Maltese",
				mi = "Maori",
				mr = "Marathi",
				mn = "Mongolian",
				my = "Myanmar (Burmese)",
				ne = "Nepali",
				no = "Norwegian",
				ps = "Pashto",
				fa = "Persian",
				pl = "Polish",
				pt = "Portuguese",
				pa = "Punjabi",
				ro = "Romanian",
				ru = "Russian",
				sm = "Samoan",
				gd = "Scots Gaelic",
				sr = "Serbian",
				st = "Sesotho",
				sn = "Shona",
				sd = "Sindhi",
				si = "Sinhala",
				sk = "Slovak",
				sl = "Slovenian",
				so = "Somali",
				es = "Spanish",
				su = "Sundanese",
				sw = "Swahili",
				sv = "Swedish",
				tg = "Tajik",
				ta = "Tamil",
				te = "Telugu",
				th = "Thai",
				tr = "Turkish",
				uk = "Ukrainian",
				ur = "Urdu",
				uz = "Uzbek",
				vi = "Vietnamese",
				cy = "Welsh",
				xh = "Xhosa",
				yi = "Yiddish",
				yo = "Yoruba",
				zu = "Zulu"
			};

			function find(lang)
				for i,v in pairs(languages) do
					if i == lang or v == lang then
						return i
					end
				end
			end

			function isSupported(lang)
				local key = find(lang)
				return key and true or false 
			end

			function getISOCode(lang)
				local key = find(lang)
				return key
			end

			function stringifyQuery(dataFields)
				local data = ""
				for k, v in pairs(dataFields) do
					if type(v) == "table" then
						for _,v in pairs(v) do
							data = data .. ("&%s=%s"):format(
							game.HttpService:UrlEncode(k),
							game.HttpService:UrlEncode(v)
							)
						end
					else
						data = data .. ("&%s=%s"):format(
						game.HttpService:UrlEncode(k),
						game.HttpService:UrlEncode(v)
						)
					end
				end
				data = data:sub(2)
				return data
			end

			local reqid = math.random(1000,9999)
			local rpcidsTranslate = "MkEWBc"
			local rootURL = "https://translate.google.com/"
			local executeURL = "https://translate.google.com/_/TranslateWebserverUi/data/batchexecute"
			local fsid, bl

			do -- init
				print('initialize')
				local InitialReq = got(rootURL)
				fsid = InitialReq.Body:match('"FdrFJe":"(.-)"')
				bl = InitialReq.Body:match('"cfb2h":"(.-)"')
			end

			local HttpService = game:GetService("HttpService")
			function jsonE(o)
				return HttpService:JSONEncode(o)
			end
			function jsonD(o)
				return HttpService:JSONDecode(o)
			end

			function translate(str, to, from)
				reqid+=10000
				from = from and getISOCode(from) or 'auto'
				to = to and getISOCode(to) or 'en'

				local data = {{str, from, to, true}, {nil}}

				local freq = {
					{
						{
							rpcidsTranslate, 
							jsonE(data),
							nil,
							"generic"
						}
					}
				}

				local url = executeURL..'?'..stringifyQuery{rpcids = rpcidsTranslate, ['f.sid'] = fsid, bl = bl, hl="en", _reqid = reqid-10000, rt = 'c'}
				local body = stringifyQuery{['f.req'] = jsonE(freq)}

				local req = got(url, "POST", body)

				local body = jsonD(req.Body:match'%[.-%]\n')
				local translationData = jsonD(body[1][3])
				local result = {
					text = "",
					from = {
						language = "",
						text = ""
					},
					raw = ""
				}
				result.raw = translationData
				result.text = translationData[2][1][1][6][1][1]

				result.from.language = translationData[3]
				result.from.text = translationData[2][5][1]

				return result
			end

			local Players = game:GetService("Players")
			local LP = Players.LocalPlayer
			local StarterGui = game:GetService('StarterGui')
			for i=1, 15 do
				local r = pcall(StarterGui["SetCore"])
				if r then break end
				game:GetService('RunService').RenderStepped:wait()
			end
			wait()

			local properties = {
				Color = Color3.new(1,1,0);
				Font = Enum.Font.SourceSansItalic;
				TextSize = 16;
			}

			game:GetService("StarterGui"):SetCore("SendNotification",
			{
				Title = "Chat Translator",
				Text = "Ported to Google Translate",
				Duration = 3
			}
			)

			properties.Text = "[TR] To send messages in a language, say > followed by the target language/language code, e.g.: >ru or >russian. To disable (go back to original language), say >d."
			StarterGui:SetCore("ChatMakeSystemMessage", properties)

			function translateFrom(message)
				local translation = translate(message, YourLang)

				local text
				if translation.from.language ~= YourLang then 
					text = translation.text
				end

				return {text, translation.from.language}
			end

			function get(plr, msg)
				local tab = translateFrom(msg)
				local translation = tab[1]
				if translation then
					properties.Text = "("..tab[2]:upper()..") ".."[".. plr.Name .."]: "..translation
					StarterGui:SetCore("ChatMakeSystemMessage", properties)
				end
			end

			for i, plr in ipairs(Players:GetPlayers()) do
				plr.Chatted:Connect(function(msg)
					get(plr, msg)
				end)
			end
			Players.PlayerAdded:Connect(function(plr)
				plr.Chatted:Connect(function(msg)
					get(plr, msg)
				end)
			end)

			local sendEnabled = false
			local target = ""

			function translateTo(message, target)
				target = target:lower() 
				local translation = translate(message, target, "auto")

				return translation.text
			end

			function disableSend()
				sendEnabled = false
				properties.Text = "[TR] Sending Disabled"
				StarterGui:SetCore("ChatMakeSystemMessage", properties)
			end

			local CBar, CRemote, Connected = LP['PlayerGui']:WaitForChild('Chat')['Frame'].ChatBarParentFrame['Frame'].BoxFrame['Frame'].ChatBar, game:GetService('ReplicatedStorage').DefaultChatSystemChatEvents['SayMessageRequest'], {}

			local HookChat = function(Bar)
				coroutine.wrap(function()
					if not table.find(Connected,Bar) then
						local Connect = Bar['FocusLost']:Connect(function(Enter)
							if Enter ~= false and Bar['Text'] ~= '' then
								local Message = Bar['Text']
								Bar['Text'] = '';
								if Message == ">d" then
									disableSend()
								elseif Message:sub(1,1) == ">" and not Message:find(" ") then
									if getISOCode(Message:sub(2)) then
										sendEnabled = true
										target = Message:sub(2)
									else
										properties.Text = "[TR] Invalid language"
										StarterGui:SetCore("ChatMakeSystemMessage", properties)
									end
								elseif sendEnabled then
									Message = translateTo(Message, target)
									if not _G.SecureChat then
										game:GetService('Players'):Chat(Message); 
									end
									CRemote:FireServer(Message,'All')
								else
									if not _G.SecureChat then
										game:GetService('Players'):Chat(Message); 
									end
									CRemote:FireServer(Message,'All')
								end
							end
						end)
						Connected[#Connected+1] = Bar; Bar['AncestryChanged']:Wait(); Connect:Disconnect()
					end
				end)()
			end

			HookChat(CBar); local BindHook = Instance.new('BindableEvent')

			local MT = getrawmetatable(game); local NC = MT.__namecall; setreadonly(MT, false)

			MT.__namecall = newcclosure(function(...)
				local Method, Args = getnamecallmethod(), {...}
				if rawequal(tostring(Args[1]),'ChatBarFocusChanged') and rawequal(Args[2],true) then 
					if LP['PlayerGui']:FindFirstChild('Chat') then
						BindHook:Fire()
					end
				end
				return NC(...)
			end)

			BindHook['Event']:Connect(function()
				CBar = LP['PlayerGui'].Chat['Frame'].ChatBarParentFrame['Frame'].BoxFrame['Frame'].ChatBar
				HookChat(CBar)
			end)
end)

MainSection:NewButton("Rejoin", "Makes You Rejoin The Server", function()
    local ts = game:GetService("TeleportService")
			local p = game:GetService("Players").LocalPlayer
			ts:Teleport(game.PlaceId, p)
end)

--LOCAL
local Main = Window:NewTab("Teleports")
local MainSection = Main:NewSection("Teleports")

MainSection:NewButton("Bank", "Makes You Rejoin The Server", function()
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
			local location = CFrame.new(-402, 21, -285)
			local humanoid = game.Players.LocalPlayer.Character.Humanoid
			wait(0.1)
			pl.CFrame = location
end)

MainSection:NewButton("Admin Base", "Teleports You To Admin Base", function()
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
			local location = CFrame.new(-871,-32,-649)
			local humanoid = game.Players.LocalPlayer.Character.Humanoid
			wait(0.1)
			pl.CFrame = location
end)

MainSection:NewButton("Train", "Teleports You To Train", function()
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
			local location = CFrame.new(606, 47, -105)
			local humanoid = game.Players.LocalPlayer.Character.Humanoid
			wait(0.1)
			pl.CFrame = location
end)

MainSection:NewButton("Casino", "Teleports You To Casino", function()
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
			local location = CFrame.new(-913, 21, -188)
			local humanoid = game.Players.LocalPlayer.Character.Humanoid
			wait(0.1)
			pl.CFrame = location
end)

MainSection:NewButton("Klub", "Teleports You To Klub", function()
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
			local location = CFrame.new(-265, 0, -425)
			local humanoid = game.Players.LocalPlayer.Character.Humanoid
			wait(0.1)
			pl.CFrame = location
end)

MainSection:NewButton("Vault", "Teleports You To Vault", function()
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
			local location = CFrame.new(-492, 23, -285)
			local humanoid = game.Players.LocalPlayer.Character.Humanoid
			wait(0.1)
			pl.CFrame = location
end)

-- EXTRA
local Main = Window:NewTab("Extra")
local MainSection = Main:NewSection("Extra")

MainSection:NewButton("Target GUI", "Loads Target UI", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GS21Official/DH-VictimMenu-Script/main/Dh%20VictimMenu%3A%20Script"))()
end)

MainSection:NewButton("Faded", "Loads Faded GUI", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NighterEpic/Faded/main/YesEpic", true))()
    end)

    MainSection:NewButton("Swag Mode", "Loads Swag Mode GUI", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SwagModeV002'))()
        end)

        MainSection:NewButton("Infinite Admin", "Loads Inf Admin", function()
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
            end)

            wait(0.1)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Crostide/Counter/main/Cash"))()
