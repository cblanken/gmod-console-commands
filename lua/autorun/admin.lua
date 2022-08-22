--- Send "n" byte response for RCON client tests
local function Reply( ply, cmd, args )
    local status, count
    if table.getn(args) > 0 then
        success, count = pcall(tonumber, args[1])

        if success then
            count = math.Truncate(count)    -- convert to int
            Msg( string.rep("A", count) )
        end
    else
        MsgN("Usage: reply [n]")
        MsgN("- Reply with specified number of 'A' characters.")
        MsgN("- Useful for testing RCON clients")
    end
end

local function ReplyAutoComplete( cmd, args )
    local tbl = {}
    table.insert(tbl, cmd .. " 500")
    table.insert(tbl, cmd .. " 4096")
    
    return tbl
end

concommand.Add( "reply", Reply, ReplyAutoComplete )