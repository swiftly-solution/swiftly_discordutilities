function CallAdminCommand()
    local reportcommand = function(playerid, args, argsCount, silent)
        local EnableReportPlayerCommand = config:Fetch("discord.ReportPlayer.EnableReportPlayerCommand")
        if EnableReportPlayerCommand == 1 then
            local player = GetPlayer(playerid)
            if not player then return end
            
            local reportedplayerid = GetPlayerId(args[1])
            if reportedplayerid == -1 then return player:SendMsg(MessageType.Chat, config:Fetch("discord.ChatCommandsMessages.ReportPlayer.PlayerNotFoundMessage")) end
            local reportedplayer = GetPlayer(reportedplayerid)
            if not reportedplayer then return end
            
            CreateThread(function()
                local playerName = player:GetName()
                local playerSteamID = player:GetSteamID()
                local discordMessage = {
                    username = config:Fetch("discord.ReportPlayer.WebhookUsername"),
                    avatar_url = config:Fetch("discord.WebhooksAvatarURL"),
                    content = config:Fetch("discord.ReportPlayer.WebhookContentMessage"),
                    embeds = {
                        {
                            title = "A new player has been reported!",
                            color = 0x2a2a2a,
                            author = {
                                name = string.format("%s (%s)", playerName, playerSteamID),
                            },
                            fields = {
                                { name = "Reported Player", value = reportedplayer:GetName(), inline = true },
                                { name = "Reported Player SteamID", value = reportedplayer:GetSteamID(), inline = true },
                                { name = "Reported Player ID", value = string.format("#%d", reportedplayerid), inline = true },
                            }
                        }
                    }
                }
                local request = http:CreateRequest("https://discord.com")
                request:SetBody(json.encode(discordMessage))
                request:SetContentType(ContentType.APPLICATION_JSON)
                request:Post(config:Fetch("discord.ReportPlayer.WebhookURL"))
                player:SendMsg(MessageType.Chat, config:Fetch("discord.ChatCommandsMessages.ReportPlayer.ReportSent"))
                http:CloseRequest(request)        
            end)
            return true
        end
    end

    if EnableReportPlayerCommand == 1 then
        commands:Register("calladmin", reportcommand)
        commands:Register("report", reportcommand)
    end
end 