include("autorun/sh_health.lua")
--print ("pizza ==============================================")
--Written by Michalox 2022


local isInfAmmoMode = false 

local userName = ""  

local mySender 

local GoodSound = Sound( "garrysmod/save_load1.wav" )






hook.Add( "Tick", "CheckPlayer1Forward", function() 
	if isInfAmmoMode then 
		if mySender:KeyPressed(IN_ATTACK) then 
			if isInfAmmoMode then
				playerfire() 
			end 
		end
	end 
end)  







hook.Add("PlayerSay", "my_mymodmichaloxhealth", function(sender, text, teamChat)

	
	if text == "!fart" then 
		sound.Play("funnynoise.mp3", sender:GetPos(), 75, 100, 100)
	end

	if ( string.StartWith( string.lower( text ), "!setmaxhp" ) ) then 
		local maxhp = string.sub( text, 10 )
		sender:SetMaxHealth(maxhp)
		sound.Play(GoodSound, sender:GetPos(), 75, 100, 100)
		sender:ChatPrint("[(SimpleHealth]): Your maximum health has been set to " .. maxhp )
	end



	






 	if text == "!infammo 1" then 
 		userName = sender:GetName()
		mySender = sender 
		isInfAmmoMode = true  
 		sound.Play(GoodSound, sender:GetPos(), 75, 100, 100)
 		sender:ChatPrint("Infinite Ammo Mode Enabled for " .. userName)
 	elseif text == "!infammo 0" then 
		userName = sender:GetName()
		isInfAmmoMode = false 
 		sound.Play(GoodSound, sender:GetPos(), 75, 100, 100)
 		sender:ChatPrint("Infinite Ammo Mode Disable for " .. userName)
 	end

	function playerfire()

		local SenderWeapon = mySender:GetActiveWeapon()
		local SenderAmmo = SenderWeapon:GetPrimaryAmmoType()
	
	
		mySender:GiveAmmo(20,SenderAmmo,true)
	end








	 
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

	
