if not wac then return end
if SERVER then AddCSLuaFile() end
ENT.Base 				= "wac_pl_base"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategory
ENT.PrintName			= "Junkers Ju-87 Stuka"
ENT.Author				= "SentryGunMan, Dr. Matt"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model            = "models/sentry/stuka.mdl"
ENT.RotorPhModel        = "models/props_junk/sawblade001a.mdl"
ENT.RotorModel        = "models/sentry/stuka_prop.mdl"

ENT.rotorPos        = Vector(161,0,81)
ENT.TopRotorDir        = 1

ENT.EngineForce        = 240
ENT.Weight            = 4320
ENT.SeatSwitcherPos	= Vector(0,0,0)
ENT.AngBrakeMul	= 0.04
ENT.SmokePos        = Vector(121,0,75)
ENT.FirePos            = Vector(121,0,95)

if CLIENT then
	ENT.thirdPerson = {
		distance = 400
	}
end

ENT.Wheels={
	{
		mdl="models/sentry/stuka_wheel.mdl",
		pos=Vector(67,55.7,6),
		friction=0,
		mass=500,
	},
	{
		mdl="models/sentry/stuka_wheel.mdl",
		pos=Vector(67,-55.7,6),
		friction=0,
		mass=500,
	},
	{
		mdl="models/sentry/stuka_bwheel.mdl",
		pos=Vector(-217.5,0,62),
		friction=0,
		mass=550,
	},
}

ENT.Seats = {
	{
		pos=Vector(25,0,83.2),
		exit=Vector(30,60,85),
	},
	{
		pos=Vector(-18.5,0,77),
		exit=Vector(-10,60,85),
		ang=Angle(0,180,0),
	},
}

ENT.Sounds = {
	Start="WAC/Stuka/Start.wav",
	Blades="WAC/Stuka/external.wav",
	Engine="WAC/Stuka/internal.wav",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="HelicopterVehicle/MinorAlarm.mp3",
	LowHealth="HelicopterVehicle/LowHealth.mp3",
	CrashAlarm="HelicopterVehicle/CrashAlarm.mp3"
}

function ENT:DrawPilotHud() end
function ENT:DrawWeaponSelection() end