local ESX = nil
local PlayerData = {}
local zombies = {}
local nests = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

function SpawnZombie(model, coords, isBoss)
    local hash = GetHashKey(model)
    
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(10)
    end
    
    local zombie = CreatePed(4, hash, coords.x, coords.y, coords.z, 0.0, true, true)
    SetEntityHealth(zombie, isBoss and Config.BossZombieHealth or Config.ZombieHealth)
    SetPedArmour(zombie, 0)
    SetPedCanRagdoll(zombie, true)
    SetPedCombatAbility(zombie, 100)
    SetPedCombatRange(zombie, 2)
    SetPedCombatMovement(zombie, 3)
    SetPedCombatAttributes(zombie, 46, true)
    SetPedCombatAttributes(zombie, 5, true)
    SetPedCombatAttributes(zombie, 20, true)
    SetPedFleeAttributes(zombie, 0, false)
    SetPedRelationshipGroupHash(zombie, GetHashKey('ZOMBIE'))
    
    table.insert(zombies, zombie)
    
    TaskWanderStandard(zombie, 10.0, 10)
end

function SpawnNestZombies(nest)
    for i = 1, nest.zombie_count do
        local model = Config.ZombieModels[math.random(#Config.ZombieModels)]
        local coords = {
            x = nest.x + math.random(-nest.radius, nest.radius),
            y = nest.y + math.random(-nest.radius, nest.radius),
            z = nest.z
        }
        SpawnZombie(model, coords, false)
    end
end

function CheckSafeZones(coords)
    for _, zone in ipairs(Config.SafeZones) do
        local distance = #(vector3(coords.x, coords.y, coords.z) - vector3(zone.x, zone.y, zone.z))
        if distance <= zone.radius then
            return true
        end
    end
    return false
end

function CheckRedZones(coords)
    for _, zone in ipairs(Config.RedZones) do
        local distance = #(vector3(coords.x, coords.y, coords.z) - vector3(zone.x, zone.y, zone.z))
        if distance <= zone.radius then
            return true
        end
    end
    return false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        if not CheckSafeZones(playerCoords) then
            for _, nest in ipairs(nests) do
                local distance = #(playerCoords - vector3(nest.x, nest.y, nest.z))
                if distance <= nest.radius and nest.zombie_count < Config.NestZombieLimit then
                    nest.zombie_count = nest.zombie_count + 1
                    SpawnNestZombies(nest)
                end
            end
        end
    end
end)

RegisterNetEvent('SyncZombiesSystem:spawnZombie')
AddEventHandler('SyncZombiesSystem:spawnZombie', function(model, coords, isBoss)
    SpawnZombie(model, coords, isBoss)
end)

RegisterNetEvent('SyncZombiesSystem:updateNests')
AddEventHandler('SyncZombiesSystem:updateNests', function(newNests)
    nests = newNests
end)