if not wac then return end
if SERVER then AddCSLuaFile('shared.lua') end
ENT.Base 				= "wac_pl_base"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategory
ENT.PrintName			= "Bell P-39 Airacobra"
ENT.Author				= "SentryGunMan"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model            = "models/sentry/p39.mdl"
ENT.RotorPhModel        = "models/props_junk/sawblade001a.mdl"
ENT.RotorModel        = "models/sentry/p39_prop.mdl"

ENT.rotorPos        = Vector(126.25,0,80.72)
ENT.TopRotorDir        = 1

ENT.EngineForce        = 200
ENT.Weight            = 3347
ENT.SeatSwitcherPos	= Vector(0,0,0)
ENT.SmokePos        = Vector(110,0,72.25)
ENT.FirePos            = Vector(110,0,72.25)

if CLIENT then
	ENT.thirdPerson = {
		distance = 550
	}
end

ENT.Agility = {
	Thrust = 10
}

ENT.Wheels={
	{
		mdl="models/sentry/p39_fw.mdl",
		pos=Vector(97.75,0,13),
		friction=0,
		mass=500,
	},
	{
		mdl="models/sentry/p39_bw.mdl",
		pos=Vector(-25.25,68,13),
		friction=0,
		mass=550,
	},
	{
		mdl="models/sentry/p39_bw.mdl",
		pos=Vector(-25.25,-68,13),
		friction=0,
		mass=550,
	},
}

ENT.Seats = {
	{
		pos=Vector(10,0,74.5),
		exit=Vector(-62.,60,85),
	},
}

ENT.Sounds={
	Start="WAC/P39/Start.wav",
	Blades="WAC/P39/external.wav",
	Engine="WAC/P39/internal.wav",
	MissileAlert="",
	MissileShoot="",
	MinorAlarm="",
	LowHealth="",
	CrashAlarm="",
}

function ENT:DrawPilotHud() end
function ENT:DrawWeaponSelection() end