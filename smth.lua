-- no bitches?
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local userInputService = game:GetService("UserInputService")

local infJumpEnabled = false
local jumpDebounce = false
local jumpPower = 50  -- You can adjust the jump power to your liking

-- Function to handle infinite jumping
local function onJumpRequest()
    if infJumpEnabled and humanoid:GetState() == Enum.HumanoidStateType.Freefall and not jumpDebounce then
        jumpDebounce = true
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        humanoid:Move(Vector3.new(0, jumpPower, 0), true)
        wait(0.2)  -- Prevents rapid consecutive jumps
        jumpDebounce = false
    end
end

-- Function to turn infinite jump on
function InfJumpOn()
    infJumpEnabled = true
end

-- Function to turn infinite jump off
function InfJumpOff()
    infJumpEnabled = false
end

-- Connect the jump request to the infinite jump handler
userInputService.JumpRequest:Connect(onJumpRequest)

local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Function to rename the tool the player is holding
local function renameTool(newName)
    local character = player.Character or player.CharacterAdded:Wait()
    local tool = character:FindFirstChildOfClass("Tool")
    
    if tool then
        tool.Name = newName
    else
        warn("No tool found to rename.")
    end
end

local Noclip = nil
local Clip = nil

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) -- basic optimization
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end

local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window = DrRayLibrary:Load("Trickster Hub", "10590477450")
local tab = DrRayLibrary.newTab("Universal", "5205790826")

tab.newInput("Speed", "16", function(num)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = num
   end)
 
tab.newInput("Jump", "50", function(num)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = num
   end)

tab.newInput("Gravity", "192.2", function(num)
    workspace.Gravity = num
end)

tab.newToggle("Noclip", "Pretty Explanatory", false, function(toggleState)
    if toggleState then
        noclip()
    else
        clip()
    end
end)

tab.newToggle("Inf Jump", "yessir", true, function(toggleState)
    if toggleState then
        InfJumpOn()
    else
        InfJumpOff()
    end
end)

tab.newButton("Fly GUI", "By XNEOFF", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

tab.newButton("TP Tool", "Gives a Teleport Tool", function()
    mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Equip to Click TP"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
end)

local tab = DrRayLibrary.newTab("Prison Life", "9835676498")

tab.newButton("Delete Doors", "Press Once!", function()
    game.Workspace.Doors:Destroy()
end)

tab.newButton("Police Guns", "TP", function()
    pos = CFrame.new(837, 100, 2261)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)

tab.newButton("Escape Prison", "TP", function()
    pos = CFrame.new(-943, 94, 2056)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)

tab.newButton("Prison", "TP", function()
    pos = CFrame.new(916, 100, 2444)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)

local tab = DrRayLibrary.newTab("Ethical Apple Farm", "10729455663")

tab.newInput("Change Item", "Must be something you can Place!", function(text)
    renameTool(text)
end)

local tab = DrRayLibrary.newTab("Others", "10729455663")

tab.newButton("Dex", "Mobile Friendly", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/script-netizen/trollster/main/dex.lua"))()
end)

tab.newButton("Keyboard", "Mobile Players", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GGH52lan/GGH52lan/main/keyboard.txt"))()
end)

tab.newButton("Spy", "Arg arg", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RS/main/SimpleSpyMobile"))()
end)

tab.newButton("IYR", "stupidity into iy!", function()
    loadstring(game:HttpGet("https://github.com/fuckusfm/infiniteyield-reborn/raw/master/source"))()
end)
