RegisterServerEvent('police:server:UnCuffPlayer')
AddEventHandler('police:server:UnCuffPlayer', function(playerId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local CuffedPlayer = QBCore.Functions.GetPlayer(playerId)
    if CuffedPlayer ~= nil then
        TriggerClientEvent("police:client:GetUnCuffed", CuffedPlayer.PlayerData.source, Player.PlayerData.source, isSoftcuff) 
    end         
end)

QBCore.Functions.CreateUseableItem("handcuffkey", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("police:client:UnCuffPlayer", source)
end)
