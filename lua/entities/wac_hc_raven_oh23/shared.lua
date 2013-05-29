if not wac then return end

ENT.Base = "wac_hc_base"
ENT.Type = "anim"
ENT.Category = wac.aircraft.spawnCategory
ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.PrintName		= "OH-23G Raven"

ENT.Model			= "models/chippy/oh23g/body.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/chippy/oh23g/mainrotor.mdl"
ENT.BackRotorModel= "models/chippy/oh23g/tailrotor.mdl"

ENT.BackRotorDir	= -1
ENT.TopRotorPos	= Vector(-0.71,0,109.12)
ENT.BackRotorPos	= Vector(-241.20,-1.00,74.36)

ENT.EngineForce	= 23
ENT.Weight		= 1650

ENT.SmokePos	= Vector(-10,0,50)
ENT.FirePos		= Vector(-10,0,50)

ENT.Seats = {
	{
		pos=Vector(32.56,-0.7,31.35),
		exit=Vector(32.56,84.79,7),
	},
	{
		pos=Vector(32.56,16.57,31.35),
		exit=Vector(32.56,84.79,7),
	},
	{
		pos=Vector(32.56,-18.61,31.35),
		exit=Vector(32.56,84.79,7),
	},
}

ENT.Sounds={
	Start="WAC/Heli/h6_start.wav",
	Blades="WAC/oh23g/external.wav",
	Engine="WAC/oh23g/internal.wav",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="HelicopterVehicle/MinorAlarm.mp3",
	LowHealth="HelicopterVehicle/LowHealth.mp3",
	CrashAlarm="HelicopterVehicle/CrashAlarm.mp3"
}

function ENT:DrawWeaponSelection() end
