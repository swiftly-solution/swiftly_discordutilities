function MapChangeLogs()
    events:on("OnMapLoad", function(mapName)
        local EnableMapLogs = config:Fetch("discord.MapLogs.EnableMapLogs")
        if EnableMapLogs == 1 then
            local discordMessage = {
                content = string.format(config:Fetch("discord.MapLogs.WebhookContentMessage"), mapName),
                username = config:Fetch("discord.MapLogs.WebhookUsername"),
                avatar_url = config:Fetch("discord.WebhooksAvatarURL"),
            }
            local request = http:CreateRequest("https://discord.com")
            request:SetBody(json.encode(discordMessage))
            request:SetContentType(ContentType.APPLICATION_JSON)
            request:Post(config:Fetch("discord.MapLogs.WebhookURL"))
            return true
        end
    end)
end