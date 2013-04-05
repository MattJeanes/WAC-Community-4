if not wac then return end
ENT.Base = "wac_pl_base"
ENT.Type = "anim"
ENT.Category = wac.aircraft.spawnCategory
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
ENT.TopRotorPos 	= Vector(140,-228,189.5)

ENT.AngBrakeMul		= 0.1

ENT.OtherRotorPos={
	Vector(140,452,198),
	Vector(140,224,189.5),
	Vector(140,-457,198)
}

ENT.WheelInfo={
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

function ENT:AddSeatTable()
	return {
		[1]={
			Pos=Vector(420,23.05,125),
			ExitPos=Vector(425.42,140,125),
			NoHud=true,
			wep={
				wac.aircraft.getWeapon("No Weapon"),
			},
		},
		[2]={
			Pos=Vector(420,-28.94,125),
			ExitPos=Vector(425.42,140,125),
			NoHud=true,
			wep={
				wac.aircraft.getWeapon("No Weapon"),
			},
		},
		[3]={
			Pos=Vector(371.79,-40,119.66),
			Ang=Angle(0,-90,0),
			ExitPos=Vector(425.42,140,125),
			NoHud=true,
			wep={
				wac.aircraft.getWeapon("No Weapon"),
			},
		},
		[4]={
			Pos=Vector(340,-18.87,119.66),
			ExitPos=Vector(425.42,140,125),
			NoHud=true,
			wep={
				wac.aircraft.getWeapon("No Weapon"),
			},
		},
	}
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"WAC/c130/startup.wav"),
		Blades=CreateSound(self.Entity,"C130.External"),
		Engine=CreateSound(self.Entity,"C130.Internal"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
		LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
		CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
	}
end

