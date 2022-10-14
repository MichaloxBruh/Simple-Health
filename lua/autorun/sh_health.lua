--[[ if CLIENT then 
--CreateClientConVar("SH_EnableSpawnHealth", "0", FCVAR_NONE, "Enables The Amount Of Health On Spawn", nil, nil)
local mainhealth = 	

//FIX THIS!!!!!!!!!!!!!!!
     hook.Add("PopulateToolMenu", "SimpleHealth_ToolMenu", function()
       spawnmenu.AddToolMenuOption("Utilities", "Michalox", "Simple Health", "Simple Health", "", "", function(Panel)
           if LocalPlayer():IsSuperAdmin() then
               Panel:CheckBox("Enable", "SH_EnableSpawnHealth")
               Panel:Help("Enable addon? Has to be checked in order for the options below to take effect!")		
               --[[ Panel:wang:SetMin(0)
               Panel:wang:SetMax(1000) 
               Panel:wang.OnValueChanged = function(self) 
                    mainhealth = (self:GetValue()) 
                
            end
        end)    
    end)    
end
--]] 