if SERVER then AddCSLuaFile() end

local found=false
local f=file.Find('wac/*.lua', "LUA")
for k,v in pairs(f) do
	if v=="aircraft.lua" then
		include('wac/aircraft.lua')
		found=true
	end
end

timer.Simple(5,function()
	if not found and not WACFrame then
		if CLIENT then
			WACFrame=vgui.Create('DFrame')
			WACFrame:SetTitle("WAC is not installed")
			WACFrame:SetSize(ScrW()*0.95, ScrH()*0.95)
			WACFrame:SetPos((ScrW() - WACFrame:GetWide()) / 2, (ScrH() - WACFrame:GetTall()) / 2)
			WACFrame:MakePopup()
			
			local h=vgui.Create('DHTML')
			h:SetParent(WACFrame)
			h:SetPos(WACFrame:GetWide()*0.005, WACFrame:GetTall()*0.03)
			local x,y = WACFrame:GetSize()
			h:SetSize(x*0.99,y*0.96)
			h:SetAllowLua(true)
			h:OpenURL('http://mattjeanes.com/abyss/wac-warning.html')
		elseif SERVER then
			timer.Create("WAC-NotInstalled", 10, 0, function() print("WAC Aircraft is not installed!") end)
		end
	end
end)

if not found then return end

if wac and wac.aircraft then wac.aircraft.spawnCategoryU = "WAC Unbreakable" end

sound.Add(
{
	name = "S64.External",
	channel = CHAN_STATIC,
	soundlevel = 140,
	sound = "^WAC/S-64/external.wav"
})

sound.Add(
{
	name = "S64.Internal",
	channel = CHAN_STATIC,
	soundlevel = 60,
	sound = "WAC/S-64/internal.wav"
})

sound.Add(
{
	name = "OH23G.External",
	channel = CHAN_STATIC,
	soundlevel = 140,
	sound = "WAC/oh23g/external.wav"
})

sound.Add(
{
	name = "OH23G.Internal",
	channel = CHAN_STATIC,
	soundlevel = 60,
	sound = "WAC/oh23g/internal.wav"
})

sound.Add(
{
	name = "C130.External",
	channel = CHAN_STATIC,
	soundlevel = 180,
	sound = "^WAC/c130/external.wav"
})

sound.Add(
{
	name = "C130.Internal",
	channel = CHAN_STATIC,
	soundlevel = 100,
	sound = "WAC/c130/internal.wav"
})

sound.Add(
{
	name = "Stuka.External",
	channel = CHAN_STATIC,
	soundlevel = 180,
	sound = "WAC/Stuka/external.wav"
})

sound.Add(
{
	name = "Stuak.Internal",
	channel = CHAN_STATIC,
	soundlevel = 160,
	sound = "WAC/Stuka/internal.wav"
})