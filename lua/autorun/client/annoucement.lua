CreateClientConVar("SH_DisableChatMessage", "0", FCVAR_NONE, "Disable's the info message on startup", nil, nil)
local VERSIONSH = "1.7"



local DisableChatMessage = GetConVar("SH_DisableChatMessage"):GetInt()
timer.Simple(5, function()
	--print("DisableChatMessage: " ..  DisableChatMessage)
	if DisableChatMessage == 0 then 
		surface.PlaySound("bell.wav")
		chat.AddText(Color(255,50,50), "([Simple Health])")
		chat.AddText(Color(255,255,255), "Current version: " .. VERSIONSH)
		chat.AddText(Color(255,255,255), "Type !help for commands")
		chat.AddText(Color(255,100,100), "To disable this message use the console command SH_DisableChatMessage 1")		
	end
end)