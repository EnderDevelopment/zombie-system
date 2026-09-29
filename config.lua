Config = {}

-- Zombie settings
Config.ZombieModels = {
    'a_m_m_bevhills_02',
    'a_m_m_fatlatin_01',
    'a_m_m_hasjew_01',
    'a_m_m_hillbilly_01',
    'a_m_m_hillbilly_02'
}

Config.BossZombieModels = {
    'a_m_m_fatlatin_01',
    'a_m_m_hasjew_01'
}

Config.ZombieHealth = 100
Config.BossZombieHealth = 200

-- Safe and Red Zones
Config.SafeZones = {
    {x = -265.0, y = -955.0, z = 31.2, radius = 50.0},
    {x = 440.0, y = -980.0, z = 30.6, radius = 50.0}
}

Config.RedZones = {
    {x = 1200.0, y = -1400.0, z = 35.2, radius = 50.0},
    {x = -1200.0, y = 1400.0, z = 35.2, radius = 50.0}
}

-- Nest settings
Config.NestSpawnRate = 300000 -- 5 minutes
Config.NestZombieLimit = 10

-- Audio settings
Config.ZombieSounds = {
    'zombie_attack',
    'zombie_roar',
    'zombie_walk'
}

Config.SoundDistance = 50.0