if not wac then return end
if SERVER then AddCSLuaFile('shared.lua') end
ENT.Base 				= "wac_pl_base"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategoryC
ENT.PrintName			= "Bell P-39 Airacobra"
ENT.Author				= "SentryGunMan"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model            = "models/sentry/p39.mdl"
ENT.RotorPhModel        = "models/props_junk/sawblade001a.mdl"
ENT.RotorModel        = "models/sentry/p39_prop.mdl"

ENT.rotorPos        = Vector(126.25,0,80.72)
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

ENT.Agility = {
	Thrust = 10
}

ENT.Wheels={
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

ENT.Seats = {
	{
		pos=Vector(10,0,74.5),
		exit=Vector(-62.,60,85),
		weapons={"Browning M2", "37MM Cannon"}
	},
}

Positions = { Vector(110,6.25,95.5), Vector(110,-6.25,95.5), Vector(28,122,60.5),Vector(28,-122,60.5), Vector(29,116.85,62.2), Vector(29,-116.85,62.2) } 


ENT.Weapons = {
	["Browning M2"] = {
		class = "wac_pod_gatling",
		info = {
			Pods = {
				Vector(135,6.25,97),
				Vector(135,-6.25,97),
				Vector(30,122,60.5),
				Vector(30,-122,60.5),
				Vector(31,116.85,62.2),
				Vector(31,-116.85,62.2)
			},
			FireRate = 500,
			Sequential = true,
			Sounds = {
				shoot = "WAC/P39/gun.wav",
				stop = "WAC/P39/gun_stop.wav"
			}
		}
	},
	["37MM Cannon"] = {
		class = "wac_pod_cannon",
		info = {
			Pods = {
				Vector(140.25,0,80.72)
			},
			Sound = "WAC/P39/37mm.wav"
		}
	}
}


ENT.Sounds={
	Start="WAC/P39/Start.wav",
	Blades="WAC/P39/external.wav",
	Engine="WAC/P39/internal.wav",
	MissileAlert="",
	MissileShoot="",
	MinorAlarm="",
	LowHealth="",
	CrashAlarm="",
}

function ENT:DrawPilotHud() end
function ENT:DrawWeaponSelection() end