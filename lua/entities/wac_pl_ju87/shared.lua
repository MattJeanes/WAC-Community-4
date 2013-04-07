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

ENT.TopRotorPos        = Vector(161,0,81)
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

ENT.WheelInfo={
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

function ENT:AddSeatTable()
    return{
        [1]={
            Pos=Vector(25,0,83.2),
            ExitPos=Vector(30,60,85),
            NoHud=true,
	wep={[1]=wac.aircraft.getWeapon("M134",{
		Name="20MM Cannon",
		Ammo=120,
		MaxAmmo=120,
		NextShoot=1,
		LastShot=0,
		ShootDelay=0.15,
		func=function(self, t, p)
			if t.NextShoot <= CurTime() then
				if t.Ammo>0 then


if (t.Ammo % 2 == 0) then ShootPos = Vector(85,-71.05,65) else ShootPos = Vector(85,71.05,65) end

					local b=ents.Create("wac_hc_hebullet")

					local pos=self:LocalToWorld(ShootPos+Vector(self:GetVelocity():Length()*0.6,0,0))
					local ang=self:GetAngles()
					b:SetPos(pos)
					b:SetAngles(ang)
					b.col=Color(255,200,20)
					b.Speed=700
					b.Size=1
					b.Width=1
					b.Damage=50
					b.Radius=130
					util.SpriteTrail(b, 0, Color(255,255,0), false, 5, 0, 0.05, 1/(15+1)*0.5, "trails/laser.vmt")
					b:Spawn()
					b.Owner=p
					self:EmitSound("WAC/Stuka/gun.wav")
					local effectdata=EffectData()
					effectdata:SetOrigin(self:LocalToWorld(ShootPos))
					effectdata:SetAngles(ang)
					effectdata:SetScale(2.5)
					util.Effect("MuzzleEffect", effectdata)
					t.Ammo=t.Ammo-1
					t.LastShot=CurTime()
					t.NextShoot=t.LastShot+t.ShootDelay
				end
				if t.Ammo<=0 then
					t.Ammo=t.MaxAmmo
					t.NextShoot=CurTime()+30
				end
			end
		end,
			})},
        },
        [2]={
            Pos=Vector(-18.5,0,77),
            ExitPos=Vector(-10,60,85),
	Ang=Angle(0,180,0),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },


    }
end
function ENT:AddSounds()
    self.Sound={
        Start=CreateSound(self.Entity,"WAC/Stuka/Start.wav"),
        Blades=CreateSound(self.Entity,"Stuka.External"),
        Engine=CreateSound(self.Entity,"Stuka.Internal"),
        MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
        MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
        MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
        LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
        CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
    }
end


function ENT:DrawPilotHud() end
function ENT:DrawWeaponSelection() end