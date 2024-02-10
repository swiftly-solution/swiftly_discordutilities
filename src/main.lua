events:on("OnPluginStart", function()
    CallAdminCommand()
    ReloadConfigCommand()
    RoundStartLogs()
    BombEventsLogs()
    ConnectLogs()
    DisconnectLogs()
    ChatLogs()
end)

function GetPluginAuthor()
    return "Swiftly Solution"
end
function GetPluginVersion()
    return "v1.0.0"
end
function GetPluginName()
    return "Swiftly Discord Utilities"
end
function GetPluginWebsite()
    return "https://github.com/swiftly-solution/swiftly_discordutilities"
end