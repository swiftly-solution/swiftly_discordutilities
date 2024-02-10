function BombEventsLogs()
    local EnableGameEventsLogs = config:Fetch("discord.GameEventsLogs.EnableGameEventsLogs")

    events:on("BombAbortDefuse", function(playerid, site)
        if EnableGameEventsLogs == 1 then
            CreateThread(function()
                local player = GetPlayer(playerid)
                if not player then return end
                local playerName = player:GetName()
                local playerSteamID = player:GetSteamID()
                local discordMessage = {
                    content = string.format(config:Fetch("discord.GameEventsLogs.WebhooksContentMessages.BombAbortDefuse"), playerName, playerSteamID, os.date(config:Fetch("discord.WebhooksDateTimeFormat"))),
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
    
    events:on("BombAbortPlant", function(playerid, site)
        if EnableGameEventsLogs == 1 then
            CreateThread(function()
                local player = GetPlayer(playerid)
                if not player then return end
            
                local playerName = player:GetName()
                local playerSteamID = player:GetSteamID()
                local discordMessage = {
                    content = string.format(config:Fetch("discord.GameEventsLogs.WebhooksContentMessages.BombAbortPlant"), playerName, playerSteamID, os.date(config:Fetch("discord.WebhooksDateTimeFormat"))),
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
    
    events:on("BombBeginDefuse", function(playerid, site)
        if EnableGameEventsLogs == 1 then
            CreateThread(function()
                local player = GetPlayer(playerid)
                if not player then return end   
            
                local playerName = player:GetName()
                local playerSteamID = player:GetSteamID()
                local discordMessage = {
                    content = string.format(config:Fetch("discord.GameEventsLogs.WebhooksContentMessages.BombBeginDefuse"), playerName, playerSteamID, os.date(config:Fetch("discord.WebhooksDateTimeFormat"))),
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
    
    events:on("BombBeginPlant", function(playerid, site)
        if EnableGameEventsLogs == 1 then
            CreateThread(function()
                local player = GetPlayer(playerid)
                if not player then return end   
            
                local playerName = player:GetName()
                local playerSteamID = player:GetSteamID()
                local discordMessage = {
                    content = string.format(config:Fetch("discord.GameEventsLogs.WebhooksContentMessages.BombBeginPlant"), playerName, playerSteamID, os.date(config:Fetch("discord.WebhooksDateTimeFormat"))),
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
    
    events:on("BombDefused", function(playerid, site)
        if EnableGameEventsLogs == 1 then
            CreateThread(function()
                local player = GetPlayer(playerid)
                if not player then return end   
            
                local playerName = player:GetName()
                local playerSteamID = player:GetSteamID()
                local discordMessage = {
                    content = string.format(config:Fetch("discord.GameEventsLogs.WebhooksContentMessages.BombDefused"), playerName, playerSteamID, os.date(config:Fetch("discord.WebhooksDateTimeFormat"))),
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
    
    events:on("BombDropped", function(playerid)
        if EnableGameEventsLogs == 1 then
            CreateThread(function()
                local player = GetPlayer(playerid)
                if not player then return end   
            
                local playerName = player:GetName()
                local playerSteamID = player:GetSteamID()
                local discordMessage = {
                    content = string.format(config:Fetch("discord.GameEventsLogs.WebhooksContentMessages.BombDropped"), playerName, playerSteamID, os.date(config:Fetch("discord.WebhooksDateTimeFormat"))),
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
    
    events:on("BombExploded", function(playerid, site)
        if EnableGameEventsLogs == 1 then
            CreateThread(function()
                local player = GetPlayer(playerid)
                if not player then return end   
            
                local discordMessage = {
                    content = string.format(config:Fetch("discord.GameEventsLogs.WebhooksContentMessages.BombExploded"), os.date(config:Fetch("discord.WebhooksDateTimeFormat"))),
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
    
    events:on("BombPickup", function(playerid)
        if EnableGameEventsLogs == 1 then
            CreateThread(function()
                local player = GetPlayer(playerid)
                if not player then return end   
            
                local playerName = player:GetName()
                local playerSteamID = player:GetSteamID()
                local discordMessage = {
                    content = string.format(config:Fetch("discord.GameEventsLogs.WebhooksContentMessages.BombPickup"), playerName, playerSteamID, os.date(config:Fetch("discord.WebhooksDateTimeFormat"))),
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
    
    events:on("BombPlanted", function(playerid, site)
        if EnableGameEventsLogs == 1 then
            CreateThread(function()
                local player = GetPlayer(playerid)
                if not player then return end   
            
                local playerName = player:GetName()
                local playerSteamID = player:GetSteamID()
                local discordMessage = {
                    content = string.format(config:Fetch("discord.GameEventsLogs.WebhooksContentMessages.BombPlanted"), playerName, playerSteamID, os.date(config:Fetch("discord.WebhooksDateTimeFormat"))),
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