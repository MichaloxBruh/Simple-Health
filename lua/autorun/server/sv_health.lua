include("autorun/sh_health.lua")
--print ("pizza ==============================================")
--Written by Michalox 2022

CreateClientConVar("SH_EnableSimpleHealth", "1", FCVAR_NONE, "Enables Simple Health", nil, nil)
local SH_Convar = GetConVar("SH_EnableSimpleHealth"):GetInt()


local isInfAmmoMode = false 

local userName = ""  

local mySender 

local GoodSound = Sound( "garrysmod/save_load1.wav" )

local VERSIONSHSERVER = "1.9" -- CHANGE THIS EVERY TIME YOU UPDATE, AND THE OTHER ONE IN annoucement.lua, also changelogsender:ChatPrint("Fixed Infinite Ammo Mode")




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

	local SH_Convar = GetConVar("SH_EnableSimpleHealth"):GetInt()

	if text == "!test" then 
		print(SH_Convar)
	end
	
	
	
		if text == "!fart" then 
			sound.Play("funnynoise.mp3", sender:GetPos(), 75, 100, 100)
		end

		if ( string.StartWith( string.lower( text ), "!setmaxhp" ) ) then 
			if SH_Convar == 1 then	
				local maxhp = string.sub( text, 10 )
				sender:SetMaxHealth(maxhp)
				sound.Play(GoodSound, sender:GetPos(), 75, 100, 100)
				sender:ChatPrint("[(SimpleHealth]): Your maximum health has been set to " .. maxhp )
			elseif SH_Convar == 1 then
				sender:ChatPrint("Simple Health is currently disabled, ask the server owner to enable it through the settings menu in the Simple Health tab, in the spawnmenu!")
			end
		end



		






		if text == "!infammo 1" then 
			if SH_Convar == 1 then	
				userName = sender:GetName()
				mySender = sender 
				isInfAmmoMode = true  
				sound.Play(GoodSound, sender:GetPos(), 75, 100, 100)
				sender:ChatPrint("Infinite Ammo Mode Enabled for " .. userName)
			elseif SH_Convar == 1 then
				sender:ChatPrint("Simple Health is currently disabled, ask the server owner to enable it through the settings menu in the v tab, in the spawnmenu!")
			end
		elseif text == "!infammo 0" then 
			if SH_Convar == 1 then
				userName = sender:GetName()
				isInfAmmoMode = false 
				sound.Play(GoodSound, sender:GetPos(), 75, 100, 100)
				sender:ChatPrint("Infinite Ammo Mode Disabled for " .. userName)
			elseif SH_Convar == 0 then
				sender:ChatPrint("Simple Health is currently disabled, ask the server owner to enable it through the settings menu in the Simple Health tab, in the spawnmenu!")	
			end
		end

		function playerfire()

			local SenderWeapon = mySender:GetActiveWeapon()
			local SenderAmmo = SenderWeapon:GetPrimaryAmmoType()
		
		
			mySender:GiveAmmo(20,SenderAmmo,false)
		end








		
		if ( string.StartWith( string.lower( text ), "!hp " ) ) then 
			if SH_Convar == 1 then	
				local health = string.sub( text, 5 )
				sender:SetHealth(health)
				sound.Play(GoodSound, sender:GetPos(), 75, 100, 100)
				sender:ChatPrint("[(SimpleHealth]): Your health has been set to " .. health )
			else
				sender:ChatPrint("Simple Health is currently disabled, ask the server owner to enable it through the settings menu in the Simple Health tab, in the spawnmenu!")	
			end
		end

		if ( string.StartWith( string.lower( text ), "!ar " ) ) then 
			if SH_Convar == 1 then	
				local armor = string.sub( text, 5 )
				sender:SetArmor(armor)
				sound.Play(GoodSound, sender:GetPos(), 75, 100, 100)
				sender:ChatPrint("[(SimpleHealth]): Your armor has been set to " .. armor )
			else 
				sender:ChatPrint("Simple Health is currently disabled, ask the server owner to enable it through the settings menu in the Simple Health tab, in the spawnmenu!")
			end
		end
		if text == "!help" then 
			
			
			sender:ChatPrint("([SimpleHealth])")  --also infammo 1 or 0 for infinite ammo 
			sender:ChatPrint("HELP MENU")
			sender:ChatPrint("!hp *number* -- sets your desired health")
			sender:ChatPrint("!ar *number* -- sets your desired armor")
			sender:ChatPrint("!infammo 1/0 -- enables or disables infinite ammo mode")
			sender:ChatPrint("!setmaxhp *number* -- sets your desired maximum health")
			sender:ChatPrint("!changelog -- changelog ")
			sender:ChatPrint("To change the settings go to the Simple Health tab in the spawn menu ")
		
		
		
		end

		if text == "!changelog" then
			sender:ChatPrint("Current Version: " .. VERSIONSHSERVER)
			sender:ChatPrint("Added settings tab")
			sender:ChatPrint("Small Fixes")
		end





	
end)

	if isInfAmmoMode == true then 
		playerfire()
	end

	
