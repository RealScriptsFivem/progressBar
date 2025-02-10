--[[
    REAL SCRIPTS FIVEM
    I create custom UI's for low prices.
    https://discord.gg/QhaP2DY56b
    Join here for more info
    Custom Chat - 30pln, 7.5$
    Custom Hud - 40pln, 10$ (hud, carhud, hudsettings)
    Custom Scoreboard - 20pln, 5$
    Custom Server Info - 10pln, 2.5$
    Custom Radial Menu - 40pln, 10$
    Custom Notification System - 30pln, 7.5$
    Custom ProgressBar - 20pln, 5$
    Custom Loading Screen - 40pln, 10$
    CUSTOM UI PACK (everything mentioned above) - 100pln, 25$
]] 

-- SUPORT HERE: https://discord.gg/QhaP2DY56b
-- PLEASE NOTE, THIS SCRIPT WORKS 100% AND WILL ALWAYS WORK, IF YOU ENCOUNTER ANY ISSUES, WE CAN HELP YOU ON OUR DISCORD!

local progressActive = false
RegisterNUICallback(
    "progressComplete",
    function(data, cb)
        progressActive = false
        cb("ok")
    end
)

--[[
    @param duration (number)
    @param title (string)
    @param text (string)
    @return (boolean)
]]
function ShowProgressBar(duration, title, text)
    if progressActive then
        print("You can't start a progressbar now!")
        return false
    end

    progressActive = true

    SendNUIMessage(
        {
            action = "startProgress",
            duration = duration,
            title = title or "",
            text = text or ""
        }
    )

    Citizen.CreateThread(
        function()
            Citizen.Wait(duration)
            if progressActive then
                SendNUIMessage({action = "finishProgress"})
            end
        end
    )

    while progressActive do
        Citizen.Wait(0)
    end

    return true
end

exports("ShowProgressBar", ShowProgressBar)

-- Usage:
-- local success = exports['r_progressBar']:ShowProgressBar(5000, "Processing", "description..")
-- if success then
--    do action after progressbar is finished
-- end

RegisterCommand(
    "Testprogressbar1",
    function(source, args, rawCommand)
        local test = exports["r_progressBar"]:ShowProgressBar(5000, "Free ProgressBar", "here you can describe the action...")
        if test then
            print("gotowe")
        end
    end
)

RegisterCommand(
    "Testprogressbar2",
    function(source, args, rawCommand)
        local test = exports["r_progressBar"]:ShowProgressBar(4000, "No Description Progress Bar")
        if test then
            print("gotowe")
        end
    end
)

RegisterCommand(
    "Testprogressbar3",
    function(source, args, rawCommand)
        local test = exports["r_progressBar"]:ShowProgressBar(3000)
        if test then
            print("gotowe")
        end
    end
)
