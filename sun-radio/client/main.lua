local radioList = {
    [1] = {
        label = 'Radio Ava',
        src = 'https://stream-24.zeno.fm/awhpcpe29f8uv?zs=GojWK7SPRpKli4jhkiMoDg&rj-ttl=5&rj-tok=AAABeMBT550ADaM_PSQQ8mqvPQ',
    },
    [2] = {
        label = 'Radio Eram',
        src = 'http://37.59.47.192:8200/stream',
    },
    [3] = {
        label = 'Radio LPR',
        src = 'http://198.178.123.11:7574/stream'
    },
    [4] = {
        label = 'Radio Shemroon',
        src = 'https://stream-26.zeno.fm/1nr41vqw9wquv?zs=t7q9qN_kTayeZoffFeWDkw&rj-ttl=5&rj-tok=AAABfZ-KVUgAToAnBr-sFL562g',
    },
    [5] = {
        label = 'Radio Faaz',
        src = 'http://radiofaaz.com:8000/radiofaaz',
    },
    [6] = {
        label = 'Radio Farda',
        src = 'https://n09.radiojar.com/cp13r2cpn3quv'
    },
    [7] = {
        label = 'Radio Javan',
        src = 'https://rj.mahsa-amini.xyz/'
    },
    [8] = {
        label = 'Radio Iran',
        src = 'https://ice41.securenetsystems.net/KIRN?&type=.mp3'
    },
    [9] = {
        label = 'Radio Iranian',
        src = 'http://37.59.47.192:8200/;',
    }
}
local defaultVol = 0.2
local mainThread = false
local currentRadio
CreateThread(function()
    Wait(2000)
    for i = 0, 30 do
        if radioList[i] then
            AddTextEntry(GetRadioStationName(i),  radioList[i].label)
        else
            LockRadioStation(GetRadioStationName(i), true)
        end
    end
    SetFrontendRadioActive(false)
end)

AddEventHandler('enterVehicle', function(vehicle, isDriver)
    if not mainThread then
        mainThread = true
        if isDriver then
            SetVehRadioStation(vehicle, GetRadioStationName(GetPlayerRadioStationIndex()))
        end
        CreateThread(function()
            while mainThread do
                local radio = GetPlayerRadioStationIndex()
                if radio then
                    if radio ~= currentRadio then
                        local data = radioList[radio]
                        if data and data.src then
                            currentRadio = radio
                            SendNUIMessage({
                                action = 'play',
                                src = data.src,
                                volume = data.volume or defaultVol
                            })
                        elseif currentRadio then
                            stop()
                        end
                    end
                elseif currentRadio then
                    stop()
                end
                Wait(200)
            end
        end)
    end
end)

AddEventHandler('exitVehicle', function()
    if mainThread then
        mainThread = false
        currentRadio = nil
        Wait(200)
        SendNUIMessage({
            action = 'stop',
        })
    end
end)

function stop()
    currentRadio = nil
    SendNUIMessage({
        action = 'stop',
    })
end