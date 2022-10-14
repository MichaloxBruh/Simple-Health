include("autorun/sh_health.lua")
print ("pizza ==============================================")

local isInfAmmoMode = false 

local userName = ""  

local mySender 

local GoodSound = Sound( "garrysmod/save_load1.wav" )

function playerfire()
	--print("playerfire()")
	mySender:GiveAmmo(1, "Pistol", false)
	mySender:GiveAmmo(1, "AR2", false)
	mySender:GiveAmmo(1, "AR2AltFire", false)
	mySender:GiveAmmo(1, "SMG1", false)
	mySender:GiveAmmo(1, "357", false)
	mySender:GiveAmmo(1, "XBowBolt", false)
	mySender:GiveAmmo(1, "Buckshot", false)
	mySender:GiveAmmo(1, "RPG_Round", false)
	mySender:GiveAmmo(1, "SMG1_Grenade", false)
	mySender:GiveAmmo(1, "slam", false)
end






hook.Add("EntityFireBullets","fireweapon", function(entity, data)
	print("console")
	if isInfAmmoMode then
		playerfire() 
	end 

end)	 







hook.Add("PlayerSay", "my_mymodmichaloxhealth", function(sender, text, teamChat)

	if text == "!infammo 1" then 
		sound.Play("funnynoise.mp3", sender:GetPos(), 75, 100, 100)
		PrintMessage(HUD_PRINTTALK, "This command is under debugging, it will be back soon")
	elseif text == "!infammo 0" then
		sound.Play("funnynoise.mp3", sender:GetPos(), 75, 100, 100)
		PrintMessage(HUD_PRINTTALK, "This command is under debugging, it will be back soon")
	end 

	if text == "!fart" then 
		sound.Play("funnynoise.mp3", sender:GetPos(), 75, 100, 100)
	end

	if ( string.StartWith( string.lower( text ), "!setmaxhp" ) ) then 
		local maxhp = string.sub( text, 10 )
		sender:SetMaxHealth(maxhp)
		sound.Play(GoodSound, sender:GetPos(), 75, 100, 100)
		sender:ChatPrint("[(SimpleHealth]): Your maximum health has been set to " .. maxhp )
	end



	






 --[[ 	if text == "!infammo 1" then 
 		userName = sender:GetName()
		mySender = sender 
 		isInfAmmoMode = true  
 		sound.Play(GoodSound, sender:GetPos(), 75, 100, 100)
 		sender:ChatPrint("Infinite Ammo Mode On")
 	elseif text == "!infammo 0" then 
 		isInfAmmoMode = false 
 		sound.Play(GoodSound, sender:GetPos(), 75, 100, 100)
 		sender:ChatPrint("Infinite Ammo Mode Off")
 	end--]] 





	 
	if ( string.StartWith( string.lower( text ), "!hp " ) ) then 
		local health = string.sub( text, 5 )
		sender:SetHealth(health)
		sound.Play(GoodSound, sender:GetPos(), 75, 100, 100)
		sender:ChatPrint("[(SimpleHealth]): Your health has been set to " .. health )
		
	end

	if ( string.StartWith( string.lower( text ), "!ar " ) ) then 
		local armor = string.sub( text, 5 )
		sender:SetArmor(armor)
		sound.Play(GoodSound, sender:GetPos(), 75, 100, 100)
		sender:ChatPrint("[(SimpleHealth]): Your armor has been set to " .. armor )
		

	end

	if text == "!help" then 
		sender:ChatPrint("([SimpleHealth])Type !hp for health, or type !ar for armor, there is also !setmaxhp for setting your max health too anything you want.")  --also infammo 1 or 0 for infinite ammo 
	end
end)

	if isInfAmmoMode == true then 
		playerfire()
	end

	
