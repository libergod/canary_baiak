-- Core settings
-- Note: If you want to use datapack folder canary (custom), put only "data-canary"
-- If you want to use the global datapack folder, put "data-otservbr-global"
-- If "useAnyDatapackFolder" is set to true then you can choose any datapack folder for your server
useAnyDatapackFolder = true
dataPackDirectory = "data-baiak"
-- Don't change this unless you know what you're doing
coreDirectory = "data"

-- Combat settings
-- NOTE: valid values for worldType are: "pvp", "no-pvp" and "pvp-enforced"
worldType = "pvp"
hotkeyAimbotEnabled = true
protectionLevel = 100
pzLocked = 60 * 1000
removeChargesFromRunes = true
removeChargesFromPotions = true
removeWeaponAmmunition = true
removeWeaponCharges = true
timeToDecreaseFrags = 24 * 60 * 60 * 1000
whiteSkullTime = 5 * 60 * 1000
stairJumpExhaustion = 2 * 1000
experienceByKillingPlayers = false
expFromPlayersLevelRange = 75
dayKillsToRedSkull = 3
weekKillsToRedSkull = 5
monthKillsToRedSkull = 10
redSkullDuration = 1
blackSkullDuration = 3
orangeSkullDuration = 7

onlyInvitedCanMoveHouseItems = true
cleanProtectionZones = false

-- Reborn
rebornLevel = 1500 -- min level to reborn
rebornStats = 5 -- % more hp and mp on every reset ()
rebornDmg = 20 -- % attack bonus per reborn. 10 = 1%, 100 = 10%, 1000 = 100%. accumulative, keep it low!!!! 

-- Connection Config
-- NOTE: maxPlayers set to 0 means no limit
-- NOTE: MaxPacketsPerSeconds if you change you will be subject to bugs by WPE, keep the default value of 25
ip = "192.168.0.16"
bindOnlyGlobalAddress = false
loginProtocolPort = 7171
gameProtocolPort = 7172
statusProtocolPort = 7171
maxPlayers = 2500
serverName = "RealSoft - Baiak"
serverMotd = "Welcome to the REAL BAIAK!"
onePlayerOnlinePerAccount = true
statusTimeout = 15 * 1000
replaceKickOnLogin = true
maxPacketsPerSecond = 50
maxItem = 2000
maxContainer = 100

-- Packet Compression
-- Minimize network bandwith and reduce ping
-- Levels: 0 = disabled, 1 = best speed, 9 = best compression
packetCompressionLevel = 3

-- Depot Limit
freeDepotLimit = 2000
premiumDepotLimit = 10000
depotBoxes = 20

-- Prey system
-- NOTE: preyRerollPricePerLevel: Price multiplier in gold coin for rerolling prey list.
-- NOTE: preySelectListPrice: Price to manually select creature on list and to lock prey slot.
-- NOTE: preyBonusRerollPrice: Price to manually reroll bonus type and to enable automatic reroll.
-- NOTE: preyBonusTime: Time in seconds that players will have of prey bonus.
-- NOTE: preyFreeRerollTime: Time in seconds that players will have to wait to get a new free prey list.
preySystemEnabled = true
preyFreeThirdSlot = false
preyRerollPricePerLevel = 200
preySelectListPrice = 5
preyBonusRerollPrice = 1
preyBonusTime = 2 * 60 * 60
preyFreeRerollTime = 6 * 60 * 60

-- Task hunting system
-- NOTE: taskHuntingLimitedTasksExhaust: Time to wait to select a new creature on the task hunting slot after claiming the reward.
-- NOTE: taskHuntingRerollPricePerLevel: Price multiplier in gold coin for rerolling task hunting list.
-- NOTE: taskHuntingFreeRerollTime: Time in seconds that players will have to wait to get a new free task hunting list.
taskHuntingSystemEnabled = true
taskHuntingFreeThirdSlot = true
taskHuntingLimitedTasksExhaust = 20 * 60 * 60
taskHuntingRerollPricePerLevel = 200
taskHuntingSelectListPrice = 5
taskHuntingBonusRerollPrice = 1
taskHuntingFreeRerollTime = 6 * 60 * 60

-- Forge system
-- NOTE: forgeAmountMultiplier, amount dusts multiplies of influenced monsters, default 3
-- NOTE: forgeMinSlivers, min slivers from influenced monsters
-- NOTE: forgeMaxSlivers, max slivers from influenced monsters
-- NOTE: forgeInfluencedLimit, limit of influenced monsters that will be created in interval type and time
-- NOTE: forgeFiendishLimit, limit of diabolic monsters that will be created in interval type and time, less than forgeInfluencedLimit
-- NOTE: forgeFiendishIntervalType: "hour", "minute" or "second"
forgeMaxItemTier = 10
forgeCostOneSliver = 20
forgeSliverAmount = 3
forgeCoreCost = 50
forgeMaxDust = 225
forgeFusionCost = 100
forgeTransferCost = 100
forgeBaseSuccessRate = 50
forgeBonusSuccessRate = 15
forgeTierLossReduction = 50
forgeAmountMultiplier = 2
forgeMinSlivers = 1
forgeMaxSlivers = 4
forgeInfluencedLimit = 300
forgeFiendishLimit = 15
forgeFiendishIntervalType = "hour"
forgeFiendishIntervalTime = "1"

-- Bestiary & Bosstiary system
-- NOTE: bestiaryKillMultiplier, multiplier value of monster killed, default 1
-- NOTE: bosstiaryKillMultiplier, multiplier value of boss killed, default 1
bestiaryKillMultiplier = 3
bosstiaryKillMultiplier = 2
bestiaryRateCharmShopPrice  = 1.0
boostedBossSlot = true
boostedBossLootBonus = 250
boostedBossKillBonus = 3

-- Hazard system
toogleHazardSystem = true
hazardCriticalInterval = 2000
hazardCriticalMultiplier = 25
hazardDamageMultiplier = 200
hazardDodgeMultiplier = 85
hazardPodsDropMultiplier = 87
hazardPodsTimeToDamage = 2000
hazardPodsTimeToSpawn = 4000
hazardExpBonusMultiplier = 2
hazardLootBonusMultiplier = 2
hazardPodsDamage = 5
hazardSpawnPlunderMultiplier = 25

-- Familiar system
-- NOTE: the time will be divided by 2 to get half the value, the familiar lasts 15 minutes by default and the cooldown of the spell is 30 minutes
-- Only change it here if you know what you are doing or to make testing easier with familiars
familiarTime = 30

-- NOTE: Access only for Premium Account
onlyPremiumAccount = false

-- Customs
-- NOTE: weatherRain = true, activates weather raining effects
-- NOTE: thunderEffect = true, activates thunder effects
-- NOTE: allConsoleLog = true, show all message logs
-- NOTE: stashMoving = true, stow an container inside your stash
-- NOTE: depotChest, the non-stackable items will be moved to the selected depot chest(I - XVIII).
-- NOTE: autoBank = true, the dropped coins from monsters will be automatically deposited to your bank account.
-- NOTE: toggleGoldPouchAllowAnything will allow players to move items or gold to gold pouch
-- NOTE: toggleServerIsRetroPVP will make this server as retro, setting PARTY_PROTECTION and ADVANCED_SECURE_MODE to 0
-- NOTE: toggleTravelsFree will make all travels from boat free
weatherRain = false
thunderEffect = false
allConsoleLog = false
stashMoving = true
depotChest = 4
autoLoot = true
autoBank = false
toggleGoldPouchAllowAnything = true
toggleServerIsRetroPVP = false
toggleTravelsFree = true

-- Teleport summon
-- Set to true will never remove the summon
teleportSummons = false

-- NOTE: true will allow the /reload command to be used
-- NOTE: Using this script might cause unwanted changes
-- This script forces a reload in the entire server, this means that everything that is stored in memory might stop to work properly and/or completely, this script should be used in test environments only
allowReload = false

-- Stamina in Trainers
staminaTrainer = true
staminaTrainerDelay = 5
staminaTrainerGain = 1
-- Stamina in PZ
staminaPz = true
staminaOrangeDelay = 1
staminaGreenDelay = 5
staminaPzGain = 1
-- Max players allowed on a dummy.
maxAllowedOnADummy = 100

-- Save interval per time
-- NOTE: toggleSaveInterval: true = enable the save interval, false = disable the save interval
-- NOTE: saveIntervalType: "minute", "second" or "hour"
-- NOTE: toggleSaveIntervalCleanMap: true = enable the clean map, false = disable the clean map
-- NOTE: saveIntervalTime: time based on what was set in "saveIntervalType"
toggleSaveInterval = true
saveIntervalType = "hour"
toggleSaveIntervalCleanMap = false
saveIntervalTime = 1

-- Imbuement
toggleImbuementShrineStorage = false

-- Free quests
-- Add quest access to player when logging in
-- NOTE: Only quests that are in the "freequests.lua" script table will work
-- toggleFreeQuest = enable/disable the system
-- freeQuestStage = if you add more quests to the table, change this value to run freeQuest again
toggleFreeQuest = true
freeQuestStage = 1

-- Deaths
-- NOTE: Leave deathLosePercent as -1 if you want to use the default
-- death penalty formula. For the old formula, set it to 10. For
-- no skill/experience loss, set it to 0.
deathLosePercent = -1

-- Houses
-- NOTE: set housePriceEachSQM to -1 to disable the ingame buy house functionality
-- NOTE: set houseBuyLevel to 0 to disable the min level purchase functionality.
-- Periods: daily/weekly/monthly/yearly/never
housePriceEachSQM = 1000
houseRentPeriod = "monthly"
houseOwnedByAccount = true
houseBuyLevel = 100

-- Item Usage
timeBetweenActions = 200
timeBetweenExActions = 1000

-- Push
-- NOTE: pushDelay: interval for every push
-- NOTE: pushDistanceDelay: delay for every distance push
-- NOTE: pushWhenAttacking: true = enable the push during attack, false = disable the push during attack
pushDelay = 1000
pushDistanceDelay = 1500
pushWhenAttacking = true

-- Map
-- NOTE: set mapName WITHOUT .otbm at the end
-- NOTE: If toggleDownloadMap if false, then the mapDownloadUrl will not be used
-- NOTE: If a map with the name already exists in the world folder, the map will not be downloaded even if the toggleDownloadMap is true
toggleDownloadMap = false
mapName = "real02"
mapDownloadUrl = "https://github.com/opentibiabr/canary/releases/download/v1.5.0/otservbr.otbm"
mapAuthor = "OpenTibiaBR"

-- Party List limitations
-- max distance in which players in party list are visible
-- NOTE partyListMaxDistance set to 0 means no limit
partyListMaxDistance = 0

-- Custom Map
-- NOTE: mapCustomEnabled = activate the map, false = disable the map
toggleMapCustom = false
mapCustomName = "real02"
mapCustomAuthor = "OpenTibiaBR"

-- Market
marketOfferDuration = 30 * 24 * 60 * 60
premiumToCreateMarketOffer = true
checkExpiredMarketOffersEachMinutes = 60
maxMarketOffersAtATimePerPlayer = 100

-- MySQL
mysqlHost = "127.0.0.1"
mysqlUser = "db_user"
mysqlPass = "Gu62164257@"
mysqlDatabase = "realbaiak_acc"
mysqlPort = 3306
mysqlSock = ""
passwordType = "sha1"

-- Misc.
-- NOTE: experienceDisplayRates: set to false to ignore exp rate or true to include exp rate
allowChangeOutfit = true
freePremium = true
kickIdlePlayerAfterMinutes = 60
maxMessageBuffer = 4
emoteSpells = true
allowWalkthrough = false
coinPacketSize = 25
coinImagesURL = "http://192.168.0.16/resources/images/store/"
classicAttackSpeed = false
showScriptsLogInConsole = false
-- configure maximum value of critical imbuement
criticalChance = 20
inventoryGlowOnFiveBless = true
adventurersBlessingLevel = 100
experienceDisplayRates = false

-- Global server Save
-- NOTE: globalServerSaveNotifyDuration in minutes
globalServerSaveNotifyMessage = true
globalServerSaveNotifyDuration = 5
globalServerSaveCleanMap = true
globalServerSaveClose = true
globalServerSaveShutdown = true
globalServerSaveTime = "11:55:00"

-- Sort loot by chance, most rare items drop first
-- it is good to be setted when you have a higher
-- rateLoot to avoid losing all rare items when
-- the corpse size is less than the total of loots
-- the monster can drop
sortLootByChance = true

-- Rates
-- NOTE: rateExp, rateSkill and rateMagic is used when 'rateUseStages = false' - or a fallback only
-- To configure rates see file data/stages.lua
-- lowLevelBonusExp works up to level 50
rateUseStages = true
rateExp = 1
rateSkill = 1
rateLoot = 5
rateMagic = 1
rateSpawn = 3
lowLevelBonusExp = 50

-- Killing in the name of Quest
rateKillingInTheNameOfPoints = 1

-- Today regeneration condition over an loop every 1 second,
-- So values which should regenerated less then 1 second or won't will work
rateHealthRegen = 1.0
rateHealthRegenSpeed = 1.0
rateManaRegen = 1.0
rateManaRegenSpeed = 1.0
rateSoulRegen = 1.0
rateSoulRegenSpeed = 1.0

rateSpellCooldown = 1.0
rateAttackSpeed = 1.0
rateOfflineTrainingSpeed = rateAttackSpeed
rateExerciseTrainingSpeed = rateAttackSpeed

-- Monster rates
rateMonsterHealth = 1.0
rateMonsterAttack = 0.8
rateMonsterDefense = 1.0

-- Monsters
deSpawnRange = 2
deSpawnRadius = 50

-- Stamina
staminaSystem = true

-- Scripts
warnUnsafeScripts = true
convertUnsafeScripts = true

-- Startup
-- NOTE: defaultPriority only works on Windows and sets process
-- priority, valid values are: "normal", "above-normal", "high"
defaultPriority = "high"
startupDatabaseOptimization = true

-- Status server information
ownerName = "RealSoft Company"
ownerEmail = "maintenance@realsoft.com"
url = "http://realsoft.com/"
location = "South America"

-- Sends Discord webhook notifications on startup, raids and shutdown.
-- The URL layout is https://discord.com/api/webhooks/:id/:token
-- Leave empty if you wish to disable.
discordWebhookURL = ""
