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
local window = DrRayLibrary:Load("Script Hub", "10590477450")
local tab = DrRayLibrary.newTab("Universal", "5205790826")
tab.newSlider("Speed", "WalkSpeed", 100, false, function(num)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = num
end)
tab.newSlider("Jump", "JumpPower", 100, false, function(num)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = num
end)

tab.newSlider("Gravity", "Pretty Explanatory", 192, false, function(num)
    game.workspace.gravity = num
end)

tab.newToggle("Noclip", "Pretty Explanatory", false, function(toggleState)
    if toggleState then
        noclip()
    else
        clip()
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

local tab = DrRayLibrary.newTab("Others", "10729455663")

tab.newButton("Dex", "Mobile Friendly", function()
    getgenv().Key = "Bash"                     loadstring(game:HttpGet("https://raw.githubusercontent.com/crceck123/roblox-script/main/MC_IY%20Dex.txt"))()
end)

tab.newButton("Keyboard", "Mobile Players", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GGH52lan/GGH52lan/main/keyboard.txt"))()
end)

tab.newButton("Spy", "Arg arg", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RS/main/SimpleSpyMobile"))()
end)
