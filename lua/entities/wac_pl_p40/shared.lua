if not wac then return end
if SERVER then AddCSLuaFile('shared.lua') end
ENT.Base 				= "wac_pl_base"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategory
ENT.PrintName			= "Curtiss P-40E Kittyhawk"
ENT.Author				= "SentryGunMan, Chippy"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model            = "models/chippy/p40.mdl"
ENT.RotorPhModel        = "models/props_junk/sawblade001a.mdl"
ENT.RotorModel        = "models/chippy/p40_prop.mdl"

ENT.TopRotorPos        = Vector(0,0,72.25)
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

ENT.WheelInfo={
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

function ENT:AddSeatTable()
    return{
        [1]={
            Pos=Vector(-62.5,0,63.5),
            ExitPos=Vector(-62.,60,85),
            NoHud=true,
wep={[1]=wac.aircraft.getWeapon("M134",{
		Name="Shipunov 2A42",
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
Positions = { Vector(16,76.5,48.3), Vector(16,84.8,48.3), Vector(15,93.2,49.2),Vector(16,-76.5,48.3), Vector(16,-84.8,48.3), Vector(15,-93.2,49.2) } 

		ShootPos = table.Random( Positions )

					local bullet={}
					bullet.Num 		= 1
					bullet.Src 		= self:LocalToWorld(ShootPos+Vector(self:GetVelocity():Length()*0.6,0,0))
					bullet.Dir 		= self:GetForward()
					bullet.Spread 	= Vector(0.023,0.023,0)
					bullet.Tracer		= 0
					bullet.Force		= 10
					bullet.Damage	= 80
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
			})},

        },


    }
end
function ENT:AddSounds()
    self.Sound={
        Start=CreateSound(self.Entity,"WAC/P40/Start.wav"),
        Blades=CreateSound(self.Entity,"P40.External"),
        Engine=CreateSound(self.Entity,"P40.Internal"),
        MissileAlert=CreateSound(self.Entity,""),
        MissileShoot=CreateSound(self.Entity,""),
        MinorAlarm=CreateSound(self.Entity,""),
        LowHealth=CreateSound(self.Entity,""),
        CrashAlarm=CreateSound(self.Entity,""),
    }
end


function ENT:DrawPilotHud() end
function ENT:DrawWeaponSelection() end