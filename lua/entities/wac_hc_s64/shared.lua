if not wac then return end

ENT.Base = "wac_hc_base"
ENT.Type = "anim"
ENT.Author = "SentryGunMan & Dr. Matt"
ENT.Category = wac.aircraft.spawnCategoryC
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.PrintName = "S-64 Skycrane"

ENT.Weight = 47000
ENT.Model = "models/sentry/s64.mdl"
ENT.SmokePos = Vector(0,0,190)
ENT.FirePos = Vector(0,0,190)

ENT.TopRotor = {
	dir = -1,
	pos = Vector(0,0,210),
	model = "models/sentry/s64_top.mdl"
}

ENT.BackRotor = {
	dir = -1,
	pos = Vector(-469.7,28.5,198),
	model = "models/sentry/s64_back.mdl"
}

function ENT:Initialize()
	self:base("wac_hc_base").Initialize(self)
	self.winchcontroller=NULL
	self.grabcooldown=0
end

ENT.Seats = {
	{
		pos=Vector(210,18,85),
		exit=Vector(240,80,13),
	},
	{
		pos=Vector(210,-18,85),
		exit=Vector(140,-80,13),
	},
	{
		pos=Vector(187,18,69),
		ang=Angle(0,-180,0),
		exit=Vector(187,100,13),
	},
	{
		pos=Vector(177,-25,75),
		ang=Angle(0,90,0),
		exit=Vector(177,-90,13),
	},
}

ENT.Sounds={
	Start="WAC/S-64/start.wav",
	Blades="^WAC/S-64/external.wav",
	Engine="WAC/S-64/internal.wav",
	MissileAlert="WAC/Heli/heatseeker_track_warning.wav",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="WAC/Heli/fire_alarm_tank.wav",
	LowHealth="WAC/Heli/fire_alarm.wav",
	CrashAlarm="WAC/Heli/laser_warning.wav"
}

function ENT:DrawWeaponSelection() end
