AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

local UseSound = "items/suitchargeok1.wav"

function ENT:Initialize()

	self:SetModel("models/Items/combine_rifle_ammo01.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()

	if phys:IsValid() then
	
		phys:Wake()

	end

end	

function ENT:Use( activator )

	if activator:IsPlayer() then 

		local name = activator:GetName()
		activator:SetArmor("99999")
		sound.Play(UseSound, self:GetPos(), 75, 100, 1)
		PrintMessage(HUD_PRINTTALK, name .. " picked up a battery with infinite armor!")
		self:Remove()
	end

end