
include("shared.lua")
AddCSLuaFile("shared.lua")

function ENT:CustomPhysicsUpdate(ph)
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

ENT.WheelInfo={
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
	self.Winch=constraint.Rope(self, e1, 0, 0, Vector(-20,0,102), Vector(0,0,0), self.WinchL, 0, 0, 3, "cable/cable2", false)
	self.Grabber=e1
	
	self.WinchMovingS = CreateSound(self, "vehicles/Crane/crane_extend_loop1.wav")
	self.WinchMovingS:ChangeVolume(0.5,0)
	self.WinchMovingS:Stop()
end



function ENT:ChangeRopeLength(len)
	if len and IsValid(self.Grabber) and IsValid(self.Winch) then
		self.Winch:Remove()
		self.WinchL=len
		self.Winch=constraint.Rope(self, self.Grabber, 0, 0, Vector(-20,0,102), Vector(0,0,0), self.WinchL, 0, 0, 3, "cable/cable2", false)
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
	return ent
end


