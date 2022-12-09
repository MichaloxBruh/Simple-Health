include("autorun/sh_health.lua")

hook.Add("PopulateToolMenu", "SH_Populatetoolmenu", function()
    spawnmenu.AddToolMenuOption("Simple Health", "Michalox", "Simple Health Settings", "Simple Health Settings", "", "", function(Panel)
        if LocalPlayer():IsSuperAdmin() then            
            Panel:Help("Made By Michalox")
            Panel:CheckBox("Enable", "SH_EnableSimpleHealth")
            Panel:Help("Enable the Addon?")
            Panel:CheckBox("Enable", "SH_EnableChatMessage")
            Panel:Help("Enable the chat message on startup?")
        end
    end)
end)
		
