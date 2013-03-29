if not wac then return end

ENT.Base = "wac_hc_base_u"
ENT.Type = "anim"
ENT.Category = wac.aircraft.spawnCategoryU
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

function ENT:AddSeatTable()
	return{
		[1]={
			Pos=Vector(32.56,-0.7,31.35),
			ExitPos=Vector(32.56,84.79,7),
			wep={
				[1]=wac.aircraft.getWeapon("No Weapon"),
			},
			NoHud=true,
		},
		[2]={
			Pos=Vector(32.56,16.57,31.35),
			ExitPos=Vector(32.56,84.79,7),
			NoHud=true,
			wep={wac.aircraft.getWeapon("No Weapon")},
		},
		[3]={
			Pos=Vector(32.56,-18.61,31.35),
			ExitPos=Vector(32.56,84.79,7),
			NoHud=true,
			wep={wac.aircraft.getWeapon("No Weapon")},
		},
	}
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"WAC/Heli/h6_start.wav"),
		Blades=CreateSound(self.Entity,"OH23G.External"),
		Engine=CreateSound(self.Entity,"OH23G.Internal"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
		LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
		CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
	}
end
