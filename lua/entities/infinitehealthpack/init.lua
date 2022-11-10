AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

local UseSound = "items/smallmedkit1.wav"

function ENT:Initialize()

	self:SetModel("models/Items/HealthKit.mdl")
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

		local name2 = activator:GetName()
		activator:SetHealth("99999999")
		sound.Play(UseSound, self:GetPos(), 75, 100, 1)
		PrintMessage(HUD_PRINTTALK, name2 .. " picked up a medkit with infinite health!")
		self:Remove()
	end

end