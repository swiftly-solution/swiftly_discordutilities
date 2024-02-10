function ConnectLogs()
    events:on("OnClientConnect", function(playerid)
        local EnableConnectDisconnectLogs = config:Fetch("discord.ConnectDisconnectLogs.EnableConnectDisconnectLogs")
        if EnableConnectDisconnectLogs == 1 then
            local player = GetPlayer(playerid)
            if not player then return false end

            if player:IsFakeClient() == 1 then return true end
            
            local playerName = player:GetName()
            local playerSteamID = player:GetSteamID()
            
            local discordMessage = {
                content = string.format(config:Fetch("discord.ConnectDisconnectLogs.WebhookContentMessages.Connect"), playerName, playerSteamID, os.date(config:Fetch("discord.WebhooksDateTimeFormat"))),
                username = config:Fetch("discord.ConnectDisconnectLogs.WebhookUsername"),
                avatar_url = config:Fetch("discord.WebhooksAvatarURL"),
            }

        
            local request = http:CreateRequest("https://discord.com")
            request:SetBody(json.encode(discordMessage))
            request:SetContentType(ContentType.APPLICATION_JSON)
            request:Post(config:Fetch("discord.ConnectDisconnectLogs.WebhookURL"))
        
            return true
        end
    end)
end