if not wac then return end
ENT.Base = "wac_pl_base_u"
ENT.Type = "anim"
ENT.Category = wac.aircraft.spawnCategoryU
ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.PrintName = "C-130J Hercules"

ENT.Model				= "models/drmatt/c130/body.mdl"
ENT.RotorPhModel		= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel			= "models/drmatt/c130/propellor.mdl"

ENT.FirePos			= Vector(133,-228,160)
ENT.SmokePos		= ENT.FirePos

ENT.Weight			= 35000
ENT.EngineForce		= 220
ENT.rotorPos 	= Vector(140,-228,189.5)

ENT.AngBrakeMul		= 0.1

ENT.OtherRotorPos={
	Vector(140,452,198),
	Vector(140,224,189.5),
	Vector(140,-457,198)
}

ENT.Wheels={
	{
		mdl="models/drmatt/c130/wheel.mdl",
		pos=Vector(-14.15,-109,20),
		friction=0,
		mass=1500,
	},
	{
		mdl="models/drmatt/c130/wheel.mdl",
		pos=Vector(-75.88,-109,20),
		friction=0,
		mass=1500,
	},
	{
		mdl="models/drmatt/c130/wheel.mdl",
		pos=Vector(-14.15,103,20),
		friction=0,
		mass=1500,
	},
	{
		mdl="models/drmatt/c130/wheel.mdl",
		pos=Vector(-75.88,103,20),
		friction=0,
		mass=1500,
	},
	{
		mdl="models/drmatt/c130/wheel.mdl",
		pos=Vector(396.76,10,20),
		friction=0,
		mass=1500,
	},
	{
		mdl="models/drmatt/c130/wheel.mdl",
		pos=Vector(396,-14,20),
		friction=0,
		mass=1500,
	},
}

ENT.Seats = {
	{
		pos=Vector(420,23.05,125),
		exit=Vector(425.42,140,125),
	},
	{
		pos=Vector(420,-28.94,125),
		exit=Vector(425.42,140,125),
	},
	{
		pos=Vector(371.79,-40,119.66),
		ang=Angle(0,-90,0),
		exit=Vector(425.42,140,125),
	},
	{
		pos=Vector(340,-18.87,119.66),
		exit=Vector(425.42,140,125),
	},
}

ENT.Sounds={
	Start="WAC/c130/startup.wav",
	Blades="^WAC/c130/external.wav",
	Engine="WAC/c130/internal.wav",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="HelicopterVehicle/MinorAlarm.mp3",
	LowHealth="HelicopterVehicle/LowHealth.mp3",
	CrashAlarm="HelicopterVehicle/CrashAlarm.mp3"
}

function ENT:DrawWeaponSelection() end