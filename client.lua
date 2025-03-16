local ESX, QBCore

Citizen.CreateThread(function()
    if Config.Framework == 'ESX' then
        ESX = exports['es_extended']:getSharedObject()
    elseif Config.Framework == 'QB' then
        QBCore = exports['qb-core']:GetCoreObject()
    end
end)

Citizen.CreateThread(function()
    for _, pedData in pairs(Config.Peds) do
        RequestModel(pedData.model)
        while not HasModelLoaded(pedData.model) do
            Wait(100)
        end

        local ped = CreatePed(4, pedData.model, pedData.coords.x, pedData.coords.y, pedData.coords.z - 1.0, pedData.heading, false, true)
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
    end
end)