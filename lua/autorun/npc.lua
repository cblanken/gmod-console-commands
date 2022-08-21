--- Command to spawn "n" bots
local function SpawnBots( ply, cmd, args )
    local status, count
    if table.getn(args) > 0 then
        success, count = pcall(tonumber, args[1])

        if success then
            count = math.Truncate(count)
            count = math.max(count, 1)      -- set minimum possible bots
            count = math.min(count, 30)     -- set maximum possible bots
            MsgN( "Attempting to spawn " .. count .. " bots")
            for _ = 1, count, 1 do
                RunConsoleCommand( "bot" )
            end
        end
    else
        MsgN("Usage: bot [n]")
        MsgN("- Spawn n bots where n is a number from 1 to 30")
    end
end

local function SpawnBotsAutoComplete( cmd, args )
    local tbl = {}
    table.insert(tbl, "bots 3")
    table.insert(tbl, "bots 5")
    table.insert(tbl, "bots 10")
    
    return tbl
end

concommand.Add( "bots", SpawnBots, SpawnBotsAutoComplete )


--- Command to kick bot from server with autocompletion
local function KickBot( ply, cmd, args)
    if table.getn(args) > 0 then

        local bot_name = args[1]
        bot_name = string.Trim(bot_name)
        bot_name = string.lower(bot_name)
        RunConsoleCommand( "kick", bot_name )

        local bots = player.GetBots()
        for k,v in ipairs(bots) do
            print(k, v)
        end
    end
end

local function KickBotAutoComplete( cmd, args )
    args = string.Trim(args)
    args = string.lower(args)

    local tbl = {}

    local bots = player.GetBots()
    for k,bot in ipairs(bots) do
        table.insert(tbl, "kickbot " .. bot:GetName())
    end

    return tbl
end

concommand.Add( "kickbot", KickBot, KickBotAutoComplete)