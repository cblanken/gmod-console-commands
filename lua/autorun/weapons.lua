local LIST_WEAPON_HELP = "Usage: list_weapons [search_string]\n- Return a list of weapons with 'search_string' in the name."

--- Command to list a filtered list of weapons
local function FindWeapons( ply, cmd, args )
    local weps = {}
    if table.getn(args) == 0 then
        weps = ents.FindByClass( "weapon_*" )
    elseif table.getn(args) == 1 then
        // Get filtered weapon list based on search string
        local search_string = args[1]
        weps = ents.FindByClass( "weapon_*" .. search_string .."*" )
    else
        MsgN(LIST_WEAPON_HELP)
        return
    end
    
    // Print weapon list
    if weps != nil then
        for key,wep in ipairs(weps) do
            MsgN(wep:GetClass())
        end
    end
end

local function FindWeaponsAutoComplete( cmd, args )
    local tbl = {}
    table.insert(tbl, "list_weapons glock")
    table.insert(tbl, "list_weapons player_controller")
    table.insert(tbl, "list_weapons shotgun")
    return tbl
end

concommand.Add( "find_weapons", FindWeapons, ListWeaponsAutoComplete)