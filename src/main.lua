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
    return "moongetsu"
end
function GetPluginVersion()
    return "1.0.0"
end
function GetPluginName()
    return "[Swiftly LUA] Discord Test"
end
function GetPluginWebsite()
    return "https://github.com/moongetsu/swiftly_joinleave"
end