if not wac then return end
if SERVER then AddCSLuaFile('shared.lua') end
ENT.Base 				= "wac_pl_base_u"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategoryU
ENT.PrintName			= "Bell P-39 Airacobra"
ENT.Author				= "SentryGunMan"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model            = "models/sentry/p39.mdl"
ENT.RotorPhModel        = "models/props_junk/sawblade001a.mdl"
ENT.RotorModel        = "models/sentry/p39_prop.mdl"

ENT.TopRotorPos        = Vector(126.25,0,80.72)
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

ENT.WheelInfo={
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

function ENT:AddSeatTable()
    return{
        [1]={
            Pos=Vector(10,0,74.5),
            ExitPos=Vector(-62.,60,85),
            NoHud=true,
wep={[1]=wac.aircraft.getWeapon("M134",{
		Name="Browning M2",
		Ammo=1500,
		MaxAmmo=1500,
		NextShoot=1,
		LastShot=0,
		Gun=1,
		ShootDelay=0.04,



		func=function(self, t, p)
			if t.NextShoot <= CurTime() then
				if t.Ammo>0 then
					if !t.Shooting then
						t.Shooting=true
						t.SStop:Stop()
						t.SShoot:Play()
					end
Positions = { Vector(110,6.25,95.5), Vector(110,-6.25,95.5), Vector(28,122,60.5),Vector(28,-122,60.5), Vector(29,116.85,62.2), Vector(29,-116.85,62.2) } 

		ShootPos = table.Random( Positions )

					local bullet={}
					bullet.Num 		= 1
					bullet.Src 		= self:LocalToWorld(ShootPos+Vector(self:GetVelocity():Length()*0.6,0,0))
					bullet.Dir 		= self:GetForward()
					bullet.Spread 	= Vector(0.023,0.023,0)
					bullet.Tracer		= 0
					bullet.Force		= 50
					bullet.Damage	= 180
					bullet.Attacker 	= p
					local effectdata=EffectData()
					effectdata:SetOrigin(self:LocalToWorld(ShootPos))
					effectdata:SetAngles(self:GetAngles())
					effectdata:SetScale(1.5)
					util.Effect("MuzzleEffect", effectdata)
					self.Entity:FireBullets(bullet)
					t.Gun=(t.Gun==1 and 2 or 1)
					t.Ammo=t.Ammo-1
					t.LastShot=CurTime()
					t.NextShoot=t.LastShot+t.ShootDelay
					local ph=self:GetPhysicsObject()
					if ph:IsValid() then
						ph:AddAngleVelocity(Vector(0,0,t.Gun==1 and 3 or -3))
					end
				end
				if t.Ammo<=0 then
					t.StopSounds(self,t,p)
					t.Ammo=t.MaxAmmo
					t.NextShoot=CurTime()+60
				end
			end
		end,
		StopSounds=function(self,t,p)
			if t.Shooting then
				t.SShoot:Stop()
				t.SStop:Play()
				t.Shooting=false
			end
		end,
		Init=function(self,t)
			t.SShoot=CreateSound(self,"WAC/P40/gun.wav")
			t.SStop=CreateSound(self,"WAC/P40/gun_stop.wav")
		end,
		Think=function(self,t,p)
			if t.NextShoot<=CurTime() then
				t.StopSounds(self,t,p)
			end
		end,
		DeSelect=function(self,t,p)
			t.StopSounds(self,t,p)
		end
			}),

[2]=wac.aircraft.getWeapon("M134",{
		Name="20MM Cannon",
		Ammo=30,
		MaxAmmo=30,
		NextShoot=1,
		LastShot=0,
		ShootDelay=0.5,
		func=function(self, t, p)
			if t.NextShoot <= CurTime() then
				if t.Ammo>0 then


if (t.Ammo % 2 == 0) then ShootPos2 = Vector(140.25,0,80.72) else ShootPos2 = Vector(140.25,0,80.72) end

					local b=ents.Create("wac_hc_hebullet")

					local pos=self:LocalToWorld(ShootPos2+Vector(self:GetVelocity():Length()*0.6,0,0))
					local ang=self:GetAngles()
					b:SetPos(pos)
					b:SetAngles(ang)
					b.col=Color(255,200,20)
					b.Speed=700
					b.Size=30
					b.Width=1
					b.Damage=250
					b.Radius=130
					util.SpriteTrail(b, 0, Color(255,255,0), false, 5, 0, 0.05, 1/(15+1)*0.5, "trails/laser.vmt")
					b:Spawn()
					b.Owner=p
					self:EmitSound("WAC/P39/37mm.wav")
					local effectdata=EffectData()
					effectdata:SetOrigin(self:LocalToWorld(ShootPos2))
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


    }
end
function ENT:AddSounds()
    self.Sound={
        Start=CreateSound(self.Entity,"WAC/P39/Start.wav"),
        Blades=CreateSound(self.Entity,"P39.External"),
        Engine=CreateSound(self.Entity,"P39.Internal"),
        MissileAlert=CreateSound(self.Entity,""),
        MissileShoot=CreateSound(self.Entity,""),
        MinorAlarm=CreateSound(self.Entity,""),
        LowHealth=CreateSound(self.Entity,""),
        CrashAlarm=CreateSound(self.Entity,""),
    }
end


function ENT:DrawPilotHud() end
function ENT:DrawWeaponSelection() end