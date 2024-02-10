function ReloadConfigCommand()
    commands:Register("discord_reload", function(playerid, args, argsCount, silent)
        if playerid == -1 then
            config:Reload("discord")
            print("The config has been reloaded.")
        else
            local player = GetPlayer(playerid)
            if not player then return end
    
            config:Reload("discord")
            player:SendMsg(MessageType.Chat, config:Fetch("discord.ChatCommandsMessages.ReloadConfig.ReloadCommandMessage"))
        end
    end)
end