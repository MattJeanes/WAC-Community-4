if not wac then return end
ENT.Base = "wac_hc_base_u"
ENT.Type = "anim"
ENT.Author = "SentryGunMan & Dr. Matt"
ENT.Category = wac.aircraft.spawnCategoryU
ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.PrintName = "S-64 Skycrane"
ENT.Weight = 47000
ENT.Model = "models/sentry/s64.mdl"
ENT.RotorPhModel = "models/props_junk/sawblade001a.mdl"
ENT.RotorModel = "models/sentry/s64_top.mdl"
ENT.BackRotorModel = "models/sentry/s64_back.mdl"
ENT.TopRotorPos	= Vector(0,0,210)
ENT.BackRotorPos = Vector(-469.7,28.5,198)
ENT.SmokePos = Vector(0,0,190)
ENT.FirePos = Vector(0,0,190)

function ENT:AddSeatTable()
	return {
		[1]={
			Pos=Vector(210,18,85),
			ExitPos=Vector(240,80,13),
			NoHud=true,
			wep={
				wac.aircraft.getWeapon("No Weapon"),
			},
		},
		[2]={
			Pos=Vector(210,-18,85),
			ExitPos=Vector(140,-80,13),
			NoHud=true,
			wep={
				wac.aircraft.getWeapon("No Weapon"),
			},
		},
		[3]={
			Pos=Vector(187,18,69),
			Ang=Angle(0,-180,0),
			ExitPos=Vector(187,100,13),
			NoHud=true,
			wep={
				wac.aircraft.getWeapon("Hydra 70", {
					Name="Winch Controller",
					Ammo=0,
					MaxAmmo=0,
					Gun=0,
					ShootDelay=1,
					func=function(self,t,p)
						if not (t.NextShoot<=CurTime()) then return end
						if IsValid(self.Grabber) and not self.GrabberC then
							local trace=util.QuickTrace(self.Grabber:GetPos(),self.Grabber:GetUp()*-60,{self.Grabber, self})
							if IsValid(trace.Entity) and not (trace.Entity:GetClass()=="worldspawn") and not (trace.Entity:GetClass()=="prop_static") then
								self.GrabberC=constraint.Weld(self.Grabber, trace.Entity, 0, 0, 0, true)
								self.GrabberN=constraint.NoCollide(self.Grabber, trace.Entity, 0, 0)
							end
						elseif IsValid(self.Grabber) and self.GrabberC and self.GrabberN then
							self.GrabberC:Remove()
							self.GrabberC=nil
							self.GrabberN:Remove()
							self.GrabberN=nil
						end
						t.LastShot=CurTime()
						t.NextShoot=t.LastShot+t.ShootDelay
					end,
					Phys=function(self,t,p)
						if not self.Winch then return end
						if( p.HelkeysDown and p.HelkeysDown[4] ) then
							self:ChangeRopeLength(math.Clamp(self.WinchL+.25,10,300))
						elseif( p.HelkeysDown and p.HelkeysDown[3] ) then
							self:ChangeRopeLength(math.Clamp(self.WinchL-.25,10,300))
						end
					end
				}),
			},
		},
		[4]={
			Pos=Vector(177,-25,75),
			Ang=Angle(0,90,0),
			ExitPos=Vector(177,-90,13),
			NoHud=true,
			wep={
				wac.aircraft.getWeapon("No Weapon"),
			},
		},

	}
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"WAC/S-64/start.wav"),
		Blades=CreateSound(self.Entity,"S64.External"),
		Engine=CreateSound(self.Entity,"S64.Internal"),
		MissileAlert=CreateSound(self.Entity,"WAC/Heli/heatseeker_track_warning.wav"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"WAC/Heli/fire_alarm_tank.wav"),
		LowHealth=CreateSound(self.Entity,"WAC/Heli/fire_alarm.wav"),
		CrashAlarm=CreateSound(self.Entity,"WAC/Heli/laser_warning.wav"),
	}
end
function ENT:DrawPilotHud() end
function ENT:DrawWeaponSelection() end
