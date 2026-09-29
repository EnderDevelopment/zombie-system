local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('SyncZombiesSystem:getNests', function(source, cb)
    MySQL.Async.fetchAll('SELECT * FROM zombie_nests', {}, function(result)
        cb(result)
    end)
end)

function SpawnBossZombie()
    local model = Config.BossZombieModels[math.random(#Config.BossZombieModels)]
    local coords = {
        x = math.random(-2000, 2000),
        y = math.random(-2000, 2000),
        z = 30.0
    }
    
    TriggerClientEvent('SyncZombiesSystem:spawnZombie', -1, model, coords, true)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.NestSpawnRate)
        
        MySQL.Async.fetchAll('SELECT * FROM zombie_nests', {}, function(result)
            TriggerClientEvent('SyncZombiesSystem:updateNests', -1, result)
        end)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3600000) -- 1 hour
        SpawnBossZombie()
    end
end)