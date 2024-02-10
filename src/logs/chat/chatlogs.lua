function ChatLogs()
    events:on("OnPlayerChat", function(playerid, text, teamonly)
        local EnablePlayerChatLogs = config:Fetch("discord.PlayerChatLogs.EnablePlayerChatLogs")
        if EnablePlayerChatLogs == 1 then
            local player = GetPlayer(playerid)
            if not player then return false end
            CreateThread(function()
            
                local playerName = player:GetName()
                local playerSteamID = player:GetSteamID()
                local chatFormat = nil

                if teamonly == 1 then
                    chatFormat = config:Fetch("discord.PlayerChatLogs.WebhookContentMessages.TeamChat")
                else
                    chatFormat = config:Fetch("discord.PlayerChatLogs.WebhookContentMessages.AllChat")
                end
            
                local discordMessage = {
                    content = string.format(chatFormat, text),
                    username = string.format("%s [%s]", playerName, playerSteamID),
                    avatar_url = config:Fetch("discord.WebhooksAvatarURL"),
                }

                local request = http:CreateRequest("https://discord.com")
                request:SetBody(json.encode(discordMessage))
                request:SetContentType(ContentType.APPLICATION_JSON)
                request:Post(config:Fetch("discord.PlayerChatLogs.WebhookURL"))
                print(request:GetBody())
            end)
            return true
        end
    end)
end