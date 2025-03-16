local ESX, QBCore

Citizen.CreateThread(function()
    if Config.Framework == 'ESX' then
        ESX = exports['es_extended']:getSharedObject()
    elseif Config.Framework == 'QB' then
        QBCore = exports['qb-core']:GetCoreObject()
    end
end)

Citizen.CreateThread(function()
    for _, blip in pairs(Config.Blips) do
        local newBlip = AddBlipForCoord(blip.coords)
        SetBlipSprite(newBlip, blip.sprite)
        SetBlipColour(newBlip, blip.color)
        SetBlipScale(newBlip, blip.scale)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(blip.name)
        EndTextCommandSetBlipName(newBlip)
    end
end)
