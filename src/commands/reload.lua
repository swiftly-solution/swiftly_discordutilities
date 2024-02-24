function ReloadConfigCommand()
    commands:Register("discord_reload", function(playerid, args, argsCount, silent)
        local IsAdmin = exports["swiftly_admins"]:CallExport("HasFlags", playerid, "z")
    
        if playerid == -1 then
            config:Reload("discord")
            print("The config has been reloaded.")
        else
            local player = GetPlayer(playerid)
            if not player then return end
    
            if IsAdmin == 1 then
                config:Reload("discord")
                player:SendMsg(MessageType.Chat, config:Fetch("discord.ChatCommandsMessages.ReloadConfig.ReloadConfigMessage"))
            end
    
            if IsAdmin == 0 then
                player:SendMsg(MessageType.Chat, config:Fetch("discord.ChatCommandsMessages.NoPremissions.NoPremissionsMessage"))
            end
        end
    end)
end