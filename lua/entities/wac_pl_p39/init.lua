
include("shared.lua")
AddCSLuaFile("shared.lua")

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local ent=ents.Create(ClassName)
	ent:SetPos(tr.HitPos+tr.HitNormal*10)
	ent:Spawn()
	ent:Activate()
	ent:SetSkin(math.random(0,3))
	ent.Owner=ply
	return ent
end

ENT.Aerodynamics = {
	Rotation = {
		Front = Vector(0, -7.5, 0),
		Right = Vector(0, 0, 40), -- Rotate towards flying direction
		Top = Vector(0, -10, 0)
	},
	Lift = {
		Front = Vector(0, 0, 24.5), -- Go up when flying forward
		Right = Vector(0, 0, 0),
		Top = Vector(0, 0, -0.5)
	},
	Rail = Vector(1, 5, 5),
	Drag = {
		Directional = Vector(0.01, 0.01, 0.01),
		Angular = Vector(0.05, 0.1, 0.05)
	}
}

function ENT:addRotors()
	self:base("wac_pl_base").addRotors(self)
	
	self.rotorModel.TouchFunc=nil
end