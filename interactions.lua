RegisterNetEvent('police:client:UnCuffPlayer')
AddEventHandler('police:client:UnCuffPlayer', function()
    if not IsPedRagdoll(PlayerPedId()) then
        local player, distance = GetClosestPlayer()
        if player ~= -1 and distance < 1.5 then
            local playerId = GetPlayerServerId(player)
            if not IsPedInAnyVehicle(GetPlayerPed(player)) and not IsPedInAnyVehicle(GetPlayerPed(PlayerPedId())) then
                TriggerServerEvent("police:server:UnCuffPlayer", playerId, true)
                HandCuffKeyAnimation()
            else
                QBCore.Functions.Notify("You cant cuff someone in a vehicle", "error")
            end
        else
            QBCore.Functions.Notify("No one nearby!", "error")
        end
    else
        Citizen.Wait(2000)
    end
end)

RegisterNetEvent('police:client:GetUnCuffed')
AddEventHandler('police:client:GetUnCuffed', function(playerId, isSoftcuff)
    isHandcuffed = false
        isEscorted = false
        TriggerEvent('hospital:client:isEscorted', isEscorted)
        DetachEntity(PlayerPedId(), true, false)
        TriggerServerEvent("police:server:SetHandcuffStatus", false)
        ClearPedTasksImmediately(PlayerPedId())
        QBCore.Functions.Notify("You are uncuffed!")
end)


function HandCuffKeyAnimation()
    loadAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
    Citizen.Wait(100)
    TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 3.0, 3.0, -1, 48, 0, 0, 0, 0)
    Citizen.Wait(500)
    TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "exit", 3.0, 3.0, -1, 48, 0, 0, 0, 0)
end
