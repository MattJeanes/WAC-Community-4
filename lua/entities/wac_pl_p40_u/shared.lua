if not wac then return end
if SERVER then AddCSLuaFile('shared.lua') end
ENT.Base 				= "wac_pl_base_u"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategoryU
ENT.PrintName			= "Curtiss P-40E Kittyhawk"
ENT.Author				= "SentryGunMan, Chippy"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model			= "models/chippy/p40.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/chippy/p40_prop.mdl"

ENT.rotorPos        = Vector(0,0,72.25)
ENT.TopRotorDir        = 1

ENT.EngineForce        = 235
ENT.Weight            = 3720
ENT.SeatSwitcherPos	= Vector(0,0,0)
ENT.AngBrakeMul	= 0.04
ENT.SmokePos        = Vector(110,0,72.25)
ENT.FirePos            = Vector(110,0,72.25)

if CLIENT then
	ENT.thirdPerson = {
		distance = 450
	}
end

ENT.Wheels={
	{
		mdl="models/chippy/p40_fw.mdl",
		pos=Vector(0,0,0),
		friction=0,
		mass=500,
	},
	{
		mdl="models/chippy/p40_bw.mdl",
		pos=Vector(-218.5,1,40),
		friction=0,
		mass=550,
	},
}

ENT.Seats = {
	{
		pos=Vector(-62.5,0,63.5),
		exit=Vector(-62.,60,85),
    }
}

ENT.Sounds={
	Start="WAC/P40/Start.wav",
	Blades="WAC/P40/external.wav",
	Engine="WAC/P40/internal.wav",
	MissileAlert="",
	MissileShoot="",
	MinorAlarm="",
	LowHealth="",
	CrashAlarm=""
}


function ENT:DrawPilotHud() end
function ENT:DrawWeaponSelection() end