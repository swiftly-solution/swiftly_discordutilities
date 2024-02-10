function RoundStartLogs()
    local EnableGameEventsLogs = config:Fetch("discord.GameEventsLogs.EnableGameEventsLogs")

    events:on("OnRoundStart", function(timelimit, fraglimit, objective)
        if EnableGameEventsLogs == 1 then
            CreateThread(function()
                local discordMessage = {
                    content = string.format(config:Fetch("discord.GameEventsLogs.WebhooksContentMessages.OnRoundStart"), os.date(config:Fetch("discord.WebhooksDateTimeFormat"))),
                    username = config:Fetch("discord.GameEventsLogs.WebhookUsername"),
                    avatar_url = config:Fetch("discord.WebhooksAvatarURL"),
                }
                local request = http:CreateRequest("https://discord.com")
                request:SetBody(json.encode(discordMessage))
                request:SetContentType(ContentType.APPLICATION_JSON)
                request:Post(config:Fetch("discord.GameEventsLogs.WebhookURL"))
                return true
            end)
        end
    end)
end