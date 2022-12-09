CreateClientConVar("SH_EnableChatMessage", "1", FCVAR_NONE, "Disable's the info message on startup", nil, nil)
local VERSIONSHAU = "1.9"



local DisableChatMessage = GetConVar("SH_EnableChatMessage"):GetInt()
timer.Simple(5, function()
	--print("DisableChatMessage: " ..  DisableChatMessage)
	if DisableChatMessage == 1 then 
		surface.PlaySound("bell.wav")
		chat.AddText(Color(255,50,50), "([Simple Health])")
		chat.AddText(Color(185,77,77), "Current version: " .. VERSIONSHAU)
		chat.AddText(Color(206,166,166), "Type !help for commands")
		chat.AddText(Color(206,166,166), "Type !changelog for the changelog of the latest update")
		chat.AddText(Color(255,100,100), "To disable this message, go to the Simple Health tab in the spawnmenu")		
	end
end)



