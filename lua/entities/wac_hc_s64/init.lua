
include("shared.lua")
AddCSLuaFile("shared.lua")

function ENT:PhysicsUpdate(ph)
	self:base("wac_hc_base").PhysicsUpdate(self,ph)
	
	if self.rotorRpm > 0.6 and self.rotorRpm < 0.79 and IsValid(self.TopRotorModel) then
		self.TopRotorModel:SetBodygroup(1,1)
	elseif self.rotorRpm > 0.8 and IsValid(self.TopRotorModel) then
		self.TopRotorModel:SetBodygroup(1,2)
	elseif self.rotorRpm < 0.4 and IsValid(self.TopRotorModel) then
		self.TopRotorModel:SetBodygroup(1,0)
	end

	if self.rotorRpm > 0.6 and self.rotorRpm < 0.79 and IsValid(self.BackRotor) then
		self.BackRotor:SetBodygroup(1,1)
	elseif self.rotorRpm > 0.8 and IsValid(self.BackRotor) then
		self.BackRotor:SetBodygroup(1,2)
	elseif self.rotorRpm < 0.4 and IsValid(self.BackRotor) then
		self.BackRotor:SetBodygroup(1,0)
	end
end

ENT.Wheels={
	{
		mdl="models/sentry/s64_fw.mdl",
		pos=Vector(206,0,16),
		friction=100,
		mass=1550,
	},
	{
		mdl="models/sentry/s64_rw.mdl",
		pos=Vector(-52.5,-101.5,7),
		friction=100,
		mass=1550
	},
	{
		mdl="models/sentry/s64_rw.mdl",
		pos=Vector(-52.5,101.5,7),
		friction=100,
		mass=1550,
	},

}

function ENT:AddStuff()
	local e1=self:addEntity("prop_physics")
	e1:SetModel("models/sentry/s64_hook.mdl")
	e1:SetPos(self:GetPos()+Vector(0,0,110))
	e1:Spawn()
	e1:Activate()
	e1:GetPhysicsObject():SetMass(200)
	e1.wac_ignore=true
	self:AddOnRemove(e1)
	self.WinchL=10
	self.Grabber=e1
	self.Winch=constraint.Rope(self, self.Grabber, 0, 0, Vector(-20,0,102), Vector(0,0,0), 0, 0, 0, 3, "cable/cable2", false)
	
	self.WinchMovingS = CreateSound(self, "vehicles/Crane/crane_extend_loop1.wav")
	self.WinchMovingS:ChangeVolume(0.5,0)
	self.WinchMovingS:Stop()
end

function ENT:SetWinch(ply)
	if self.Winch then
		self.Winch:Remove()
		self.Winch=nil
	end
	self.winchcontroller=ply
	if ply==NULL then
		self.Winch=constraint.Rope(self, self.Grabber, 0, 0, Vector(-20,0,102), Vector(0,0,0), 0, 0, 0, 3, "cable/cable2", false)
	else
		self.Winch=constraint.Winch( ply, self, self.Grabber, 0, 0, Vector(-20,0,102), Vector(0,0,0), 3, KEY_S, KEY_W, 50, 50, "cable/cable2", false )
	end
end

function ENT:Think()
	self:base("wac_hc_base").Think(self)
	local seat=self.seats[3]
	if not IsValid(seat) or not seat:IsVehicle() then return end
	local ply=seat:GetPassenger(0)
	if ply:IsPlayer() then
		if (ply:KeyDown(IN_FORWARD) or ply:KeyDown(IN_BACK)) and not self.WinchMovingS:IsPlaying() then
			self.WinchMovingS:Play()
		elseif not ply:KeyDown(IN_FORWARD) and not ply:KeyDown(IN_BACK) and self.WinchMovingS:IsPlaying() then
			self.WinchMovingS:Stop()
			self:EmitSound("vehicles/Crane/crane_extend_stop.wav", 100, 50)
		end
		
		if CurTime()>self.grabcooldown and ply:KeyDown(IN_ATTACK) then
			if IsValid(self.Grabber) and not self.GrabberC then
				local trace=util.QuickTrace(self.Grabber:GetPos(),self.Grabber:GetUp()*-65,{self.Grabber, self})
				if not (IsValid(trace.Entity) and not (trace.Entity:GetClass()=="worldspawn") and not (trace.Entity:GetClass()=="prop_static")) then
					trace=util.QuickTrace(self.Grabber:GetPos()+Vector(0,-45,-60),self.Grabber:GetRight()*80,{self.Grabber, self})
				end
				if IsValid(trace.Entity) and not (trace.Entity:GetClass()=="worldspawn") and not (trace.Entity:GetClass()=="prop_static") then
					self.GrabberC=constraint.Weld(self.Grabber, trace.Entity, 0, 0, 0, true)
					self.GrabberN=constraint.NoCollide(self.Grabber, trace.Entity, 0, 0)
					self:EmitSound("vehicles/Crane/crane_magnet_switchon.wav", 100, 50)
					self.grabcooldown=CurTime()+1
				end
			elseif IsValid(self.Grabber) and self.GrabberC and self.GrabberN then
				self.GrabberC:Remove()
				self.GrabberC=nil
				self.GrabberN:Remove()
				self.GrabberN=nil
				self:EmitSound("vehicles/Crane/crane_magnet_switchon.wav", 100, 50)
				self.grabcooldown=CurTime()+1
			end
		end
	end
	if not (self.winchcontroller==ply) then
		self:SetWinch(ply)
	end
end

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local ent=ents.Create(ClassName)
	ent:SetPos(tr.HitPos+tr.HitNormal*10)
	ent:Spawn()
	ent:Activate()
	ent.Owner=ply
	self.Sounds=table.Copy(sndt)
	ent:AddStuff()
	return ent
end


