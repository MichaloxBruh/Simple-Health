CreateClientConVar("SH_DisableChatMessage", "0", FCVAR_NONE, "Disable's the info message on startup", nil, nil)
local VERSIONSHAU = "1.8"



local DisableChatMessage = GetConVar("SH_DisableChatMessage"):GetInt()
timer.Simple(5, function()
	--print("DisableChatMessage: " ..  DisableChatMessage)
	if DisableChatMessage == 0 then 
		surface.PlaySound("bell.wav")
		chat.AddText(Color(255,50,50), "([Simple Health])")
		chat.AddText(Color(185,77,77), "Current version: " .. VERSIONSHAU)
		chat.AddText(Color(206,166,166), "Type !help for commands")
		chat.AddText(Color(206,166,166), "Type !changelog for the changelog of the latest update")
		chat.AddText(Color(255,100,100), "To disable this message use the console command SH_DisableChatMessage 1")		
	end
end)



