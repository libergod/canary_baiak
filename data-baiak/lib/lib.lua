-- Core API functions implemented in Lua
-- Load storages first
dofile(DATA_DIRECTORY.. '/lib/core/load.lua')

-- Compatibility library for our old Lua API
dofile(DATA_DIRECTORY.. '/lib/compat/compat.lua')

-- Tables library
dofile(DATA_DIRECTORY.. '/lib/tables/load.lua')

-- Others library
dofile(DATA_DIRECTORY.. '/lib/others/load.lua')

-- Quests library
dofile(DATA_DIRECTORY.. '/lib/quests/quest.lua')

-- Forge Library
dofile(DATA_DIRECTORY.. '/lib/custom/forge_lib.lua')

-- CUSTOM BAIAK
-- Dodge e Critical
dofile(DATA_DIRECTORY.. '/lib/custom/dodgeCritical.lua')

-- Info Storage
dofile(DATA_DIRECTORY.. '/lib/custom/infoStorage.lua')

-- Debug Lib
dofile(DATA_DIRECTORY.. '/lib/custom/debug.lua')

-- Battlefield
dofile(DATA_DIRECTORY.. '/lib/events/battlefield.lua')

-- Castle 24H
dofile(DATA_DIRECTORY.. '/lib/events/castle.lua')

-- SafeZone
dofile(DATA_DIRECTORY.. '/lib/events/safezone.lua')

-- SnowBall
dofile(DATA_DIRECTORY.. '/lib/events/snowball.lua')

-- Bosses
dofile(DATA_DIRECTORY.. '/lib/events/bosses.lua')

-- FireStorm
dofile(DATA_DIRECTORY.. '/lib/events/firestorm.lua')

-- Tasks
dofile(DATA_DIRECTORY.. '/lib/custom/task.lua')

-- SuperUP
dofile(DATA_DIRECTORY.. '/lib/custom/superup.lua')

-- Monster Hunt
dofile(DATA_DIRECTORY.. '/lib/custom/monsterHunt.lua')

-- Castle 24h
dofile(DATA_DIRECTORY.. '/lib/events/castle.lua')

-- Castle 48h
dofile(DATA_DIRECTORY.. '/lib/events/castle48.lua')

-- Boss Room
dofile(DATA_DIRECTORY.. '/lib/custom/bossRoom.lua')

-- Mining
dofile(DATA_DIRECTORY.. '/lib/custom/mining.lua')

-- Guild Level
dofile(DATA_DIRECTORY.. '/lib/custom/guildLevel.lua')

-- Snake Minigames
dofile(DATA_DIRECTORY.. '/lib/minigames/snake.lua')

-- Language System
dofile(DATA_DIRECTORY.. '/lib/custom/lang.lua')

-- Custom System
dofile(DATA_DIRECTORY.. '/lib/custom/custom.lua')

-- Tournaments Coins
dofile(DATA_DIRECTORY.. '/lib/custom/tournamentsCoin.lua')

-- VIP Account
dofile(DATA_DIRECTORY.. '/lib/custom/vipAccount.lua')

--Hireling
dofile(DATA_DIRECTORY .. "/lib/hireling_lib.lua")

-- Tournaments COIN p/ HORA System
dofile(DATA_DIRECTORY.. '/lib/custom/karin.lua')

-- SHOP PRIVATE System
dofile(DATA_DIRECTORY.. '/lib/custom/lib_privateShop.lua')
dofile(DATA_DIRECTORY.. '/lib/custom/config_privateShop.lua')

-- REBORN SYSTEM
dofile(DATA_DIRECTORY.. '/lib/custom/reborn_system.lua')

-- EXAUSTION Lib
dofile(DATA_DIRECTORY.. '/lib/custom/exaustion_lib.lua')