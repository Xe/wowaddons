local function Print(message)
    DEFAULT_CHAT_FRAME:AddMessage("|cff80c0ffXIVCommands:|r " .. message)
end

local function Trim(message)
    return (message or ""):match("^%s*(.-)%s*$")
end

-- WoW already owns /leave. Extend its handler instead of registering a
-- competing alias, and retain the existing /leave <channel> behavior.
local LeaveChannel = SlashCmdList.LEAVE
SlashCmdList.LEAVE = function(message, editBox)
    if Trim(message) ~= "" then
        return LeaveChannel(message, editBox)
    end

    if not IsInGroup() then
        Print("You are not in a party or raid.")
        return
    end

    C_PartyInfo.LeaveParty()
end

SLASH_XIVCOMMANDSBGM1 = "/bgm"
SlashCmdList.XIVCOMMANDSBGM = function(message)
    local argument = Trim(message)
    if argument == "" then
        local enabled = C_CVar.GetCVarBool("Sound_EnableMusic")
        C_CVar.SetCVar("Sound_EnableMusic", enabled and "0" or "1")
        Print(enabled and "BGM volume muted." or "BGM volume unmuted.")
        return
    end

    local volume = tonumber(argument)
    if not argument:match("^%d+$") or not volume or volume < 0 or volume > 100 then
        Print("Usage: /bgm [0-100]. Use /bgm without a number to toggle music.")
        return
    end

    C_CVar.SetCVar("Sound_MusicVolume", tostring(volume / 100))
    C_CVar.SetCVar("Sound_EnableMusic", volume > 0 and "1" or "0")
    Print("BGM volume set to " .. volume .. "%.")
end
