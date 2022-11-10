if CLIENT then 
  --[[CreateClientConVar("SH_EnableSimpleHealth", "1", FCVAR_NONE, "Enables Simple Health", nil, nil)
	


     hook.Add("PopulateToolMenu", "SimpleHealth_ToolMenu", function()
       spawnmenu.AddToolMenuOption("Utilities", "Michalox", "Simple Health", "Simple Health", "", "", function(Panel)
           if LocalPlayer():IsSuperAdmin() then
               Panel:CheckBox("Enable", "SH_EnableSimpleHealth")
               Panel:Help("Enable addon?")		
                Panel:wang:SetMin(0)
               Panel:wang:SetMax(1000) 
               Panel:wang.OnValueChanged = function(self) 
                    mainhealth = (self:GetValue())  
                
            end
        end)    
    end) ]]--    
end 
