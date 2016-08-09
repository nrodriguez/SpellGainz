
local addonName, _addonData = ...;

local _aVar = _addonData.variables;
local playerClass = select(2, UnitClass("player"));

local STRING_PASSIVE = "Passive";
local STRING_TRAINING = "Requires training";
local STRING_DUNGEON = "Dungeon";
local STRING_DUNGEON_HEROIC = "Heroic Dungeon";
local STRING_RAID = "Raid";
local STRING_BATTLEGROUND = "PvP Battleground";
local STRING_WORLDPVP = "World PvP";

--------------------------
-- Talent Points
--------------------------

_addonData.Talents = {15, 30, 45, 60, 75, 90, 100};

--------------------------
-- Riding
--------------------------

_addonData.Riding = {
	{["id"] = 33388, ["level"] = 20, ["subText"] = STRING_TRAINING} -- Apprentice Riding
	,{["id"] = 33391, ["level"] = 40, ["subText"] = STRING_TRAINING} -- Journeyman Riding
	,{["id"] = 34090, ["level"] = 60, ["subText"] = STRING_TRAINING} -- Expert Riding
	,{["id"] = 34091, ["level"] = 70, ["subText"] = STRING_TRAINING} -- Artisan Riding
	,{["id"] = 90265, ["level"] = 80, ["subText"] = STRING_TRAINING} -- Master Riding
	,{["id"] = 90267, ["level"] = 60, ["subText"] = STRING_TRAINING} -- Flight Master's License
	,{["id"] = 54197, ["level"] = 68, ["subText"] = STRING_TRAINING} -- Cold Weather Flying
	,{["id"] = 115913, ["level"] = 85, ["subText"] = STRING_TRAINING} -- Wisdom of the Four Winds
	,{["id"] = 191645, ["level"] = 90, ["subText"] = STRING_TRAINING} -- Draenor Pathfinder
};

--------------------------
-- Instances
--------------------------

-- /run print(GetMouseFocus().instanceID) 
_addonData.Instances = {
-- Vanilla
	{["subText"] = STRING_DUNGEON, ["name"] = "Ragefire Chasm", ["level"] = 15, ["id"] = 226, ["icon"] = "Interface/LFGFRAME/LFGICON-RAGEFIRECHASM"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "The Deadmines", ["level"] = 15, ["id"] = 63, ["icon"] = "Interface/LFGFRAME/LFGICON-DEADMINES"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Wailing Caverns", ["level"] = 15, ["id"] = 240, ["icon"] = "Interface/LFGFRAME/LFGICON-WAILINGCAVERNS"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Shadowfang Keep", ["level"] = 16, ["id"] = 64, ["icon"] = "Interface/LFGFRAME/LFGICON-SHADOWFANGKEEP"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Blackfathom Deeps", ["level"] = 20, ["id"] = 227, ["icon"] = "Interface/LFGFRAME/LFGICON-BLACKFATHOMDEEPS"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Stormwind Stockade", ["level"] = 20, ["id"] = 238, ["icon"] = "Interface/LFGFRAME/LFGICON-STORMWINDSTOCKADES"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Gnomeregan", ["level"] = 24, ["id"] = 231, ["icon"] = "Interface/LFGFRAME/LFGICON-GNOMEREGAN"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Scarlet Halls", ["level"] = 26, ["id"] = 311, ["icon"] = "Interface/LFGFRAME/LFGICON-SCARLETMONASTERY"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Scarlet Monastery", ["level"] = 28, ["id"] = 316, ["icon"] = "Interface/LFGFRAME/LFGICON-SCARLETMONASTERY"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Maraudon: The Wicked Grotto", ["id"] = 232, ["level"] = 30, ["icon"] = "Interface/LFGFRAME/LFGICON-MARAUDON"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Razorfen Kraul", ["level"] = 30, ["id"] = 234, ["icon"] = "Interface/LFGFRAME/LFGICON-RAZORFENKRAUL"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Maraudon: Foulspore Cavern", ["level"] = 32, ["id"] = 232, ["icon"] = "Interface/LFGFRAME/LFGICON-MARAUDON"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Maraudon: Earth Song Falls", ["level"] = 34, ["id"] = 232, ["icon"] = "Interface/LFGFRAME/LFGICON-MARAUDON"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Uldaman", ["level"] = 35, ["id"] = 239, ["icon"] = "Interface/LFGFRAME/LFGICON-ULDAMAN"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Dire Maul: Warpwood Quarter", ["level"] = 36, ["id"] = 230, ["icon"] = "Interface/LFGFRAME/LFGICON-DIREMAUL"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Scholomance", ["level"] = 38, ["id"] = 246, ["icon"] = "Interface/LFGFRAME/LFGICON-SCHOLOMANCE"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Dire Maul: Capital Gardens", ["level"] = 39, ["id"] = 230, ["icon"] = "Interface/LFGFRAME/LFGICON-DIREMAUL"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Razorfen Downs", ["level"] = 40, ["id"] = 233, ["icon"] = "Interface/LFGFRAME/LFGICON-RAZORFENDOWNS"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Dire Maul: Gordok Commons", ["level"] = 42, ["id"] = 230, ["icon"] = "Interface/LFGFRAME/LFGICON-DIREMAUL"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Stratholme: Main Gate", ["level"] = 42, ["id"] = 236, ["icon"] = "Interface/LFGFRAME/LFGICON-STRATHOLME"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Zul'Farrak", ["id"] = 241, ["level"] = 44, ["icon"] = "Interface/LFGFRAME/LFGICON-ZULFARAK"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Stratholme: Service Entrance", ["id"] = 236, ["level"] = 46, ["icon"] = "Interface/LFGFRAME/LFGICON-STRATHOLME"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Blackrock Depths: Detention Block", ["level"] = 47, ["id"] = 228, ["icon"] = "Interface/LFGFRAME/LFGICON-BLACKROCKDEPTHS"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Sunken Temple", ["level"] = 50, ["id"] = 237, ["icon"] = "Interface/LFGFRAME/LFGICON-SUNKENTEMPLE"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Blackrock Depths: Upper City", ["level"] = 51, ["id"] = 228, ["icon"] = "Interface/LFGFRAME/LFGICON-BLACKROCKDEPTHS"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Lower Blackrock Spire", ["level"] = 55, ["id"] = 229, ["icon"] = "Interface/LFGFRAME/LFGICON-BLACKROCKSPIRE"}
	,{["subText"] = STRING_RAID, ["name"] = "Classic Raids", ["level"] = 60, ["id"] = _aVar.CLASSIC_RAID, ["icon"] = "Interface/LFGFRAME/LFGICON-MOLTENCORE"}
-- TBC
	,{["subText"] = STRING_DUNGEON, ["name"] = "Hellfire Ramparts", ["level"] = 58, ["id"] = 248, ["icon"] = "Interface/LFGFRAME/LFGICON-HELLFIRECITADEL"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Blood Furnace", ["level"] = 59, ["id"] = 256, ["icon"] = "Interface/LFGFRAME/LFGICON-HELLFIRECITADEL"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Slave Pens", ["level"] = 60, ["id"] = 260, ["icon"] = "Interface/LFGFRAME/LFGICON-COILFANG"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Underbog", ["level"] = 61, ["id"] = 262, ["icon"] = "Interface/LFGFRAME/LFGICON-COILFANG"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Mana-Tombs", ["level"] = 62, ["id"] = 250, ["icon"] = "Interface/LFGFRAME/LFGICON-AUCHINDOUN"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Auchenai Crypts", ["level"] = 63, ["id"] = 247, ["icon"] = "Interface/LFGFRAME/LFGICON-AUCHINDOUN"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "The Escape From Durnholde", ["level"] = 64, ["id"] = 251, ["icon"] = "Interface/LFGFRAME/LFGICON-CAVERNSOFTIME"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Sethekk Halls", ["level"] = 65, ["id"] = 252, ["icon"] = "Interface/LFGFRAME/LFGICON-AUCHINDOUN"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "The Mechanar", ["level"] = 67, ["id"] = 258, ["icon"] = "Interface/LFGFRAME/LFGICON-TEMPESTKEEP"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Shadow Labyrinth", ["level"] = 67, ["id"] = 253, ["icon"] = "Interface/LFGFRAME/LFGICON-AUCHINDOUN"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Shattered Halls", ["level"] = 67, ["id"] = 259, ["icon"] = "Interface/LFGFRAME/LFGICON-HELLFIRECITADEL"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "The Botanica", ["level"] = 67, ["id"] = 257, ["icon"] = "Interface/LFGFRAME/LFGICON-TEMPESTKEEP"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "The Steamvault", ["level"] = 67, ["id"] = 261, ["icon"] = "Interface/LFGFRAME/LFGICON-COILFANG"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Magisters' Terrace", ["level"] = 68, ["id"] = 249, ["icon"] = "Interface/LFGFRAME/LFGICON-MAGISTERSTERRACE"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Opening of the Dark Portal", ["level"] = 68, ["id"] = 255, ["icon"] = "Interface/LFGFRAME/LFGICON-CAVERNSOFTIME"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "The Arcatraz", ["level"] = 68, ["id"] = 254, ["icon"] = "Interface/LFGFRAME/LFGICON-TEMPESTKEEP"}
	,{["subText"] = STRING_DUNGEON_HEROIC, ["name"] = "Heroic: Outland Dungeons", ["level"] = 70, ["id"] = _aVar.TBC_HEROIC, ["icon"] = "Interface/LFGFRAME/LFGICON-DUNGEON"}
	,{["subText"] = STRING_RAID, ["name"] = "Outland Raids", ["level"] = 70, ["id"] = _aVar.TBC_RAID, ["icon"] = "Interface/LFGFRAME/LFGICON-BLACKTEMPLE"}
-- WotLK
	,{["subText"] = STRING_DUNGEON, ["name"] = "Utgarde Keep", ["level"] = 68, ["id"] = 285, ["icon"] = "Interface/LFGFRAME/LFGIcon-Utgarde"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "The Nexus", ["level"] = 69, ["id"] = 281, ["icon"] = "Interface/LFGFRAME/LFGIcon-TheNexus"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Azjol-Nerub", ["level"] = 70, ["id"] = 272, ["icon"] = "Interface/LFGFRAME/LFGIcon-AzjolNerub"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Ahn'Kahet: The Old Kingdom", ["level"] = 71, ["id"] = 271, ["icon"] = "Interface/LFGFRAME/LFGIcon-Ahnkalet"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Drak'Tharon Keep", ["level"] = 72, ["id"] = 273, ["icon"] = "Interface/LFGFRAME/LFGIcon-DrakTharon"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Violet Hold", ["level"] = 73, ["id"] = 283, ["icon"] = "Interface/LFGFRAME/LFGIcon-TheVioletHold"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Gundrak", ["level"] = 74, ["id"] = 274, ["icon"] = "Interface/LFGFRAME/LFGIcon-Gundrak"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Halls of Stone", ["level"] = 75, ["id"] = 277, ["icon"] = "Interface/LFGFRAME/LFGIcon-HallsofStone"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Halls of Lightning", ["level"] = 77, ["id"] = 275, ["icon"] = "Interface/LFGFRAME/LFGICON-HALLSOFLIGHTNING"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "The Oculus", ["level"] = 77, ["id"] = 282, ["icon"] = "Interface/LFGFRAME/LFGIcon-TheOculus"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Utgarde Pinnacle", ["level"] = 77, ["id"] = 286, ["icon"] = "Interface/LFGFRAME/LFGIcon-UtgardePinnacle"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "The Culling of Stratholme", ["level"] = 78, ["id"] = 279, ["icon"] = "Interface/LFGFRAME/LFGIcon-OldStratholme"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Trial of the Champion", ["level"] = 78, ["id"] = 284, ["icon"] = "Interface/LFGFRAME/LFGIcon-ArgentDungeon"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "The Forge of Souls", ["level"] = 80, ["id"] = 280, ["icon"] = "Interface/LFGFRAME/LFGIcon-TheForgeofSouls"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Pit of Saron", ["level"] = 80, ["id"] = 278, ["icon"] = "Interface/LFGFRAME/LFGIcon-PitofSaron"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Halls of Reflection", ["level"] = 80, ["id"] = 276, ["icon"] = "Interface/LFGFRAME/LFGIcon-HallsofReflection"}
	,{["subText"] = STRING_DUNGEON_HEROIC, ["name"] = "Heroic: Northrend Dungeons", ["level"] = 80, ["id"] = _aVar.TBC_HEROIC, ["icon"] = "Interface/LFGFRAME/LFGICON-DUNGEON"}
	,{["subText"] = STRING_RAID, ["name"] = "Northrend Raids", ["level"] = 80, ["id"] = _aVar.TBC_RAID, ["icon"] = "Interface/LFGFRAME/LFGIcon-IcecrownCitadel"}
-- Cataclysm
	,{["subText"] = STRING_DUNGEON, ["name"] = "Blackrock Caverns", ["level"] = 80, ["id"] = 66, ["icon"] = "Interface/LFGFRAME/LFGICON-BLACKROCKCAVERNS"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Throne of the Tides", ["level"] = 80, ["id"] = 65, ["icon"] = "Interface/LFGFRAME/LFGICON-THRONEOFTHETIDES"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "The Stonecore", ["level"] = 81, ["id"] = 67, ["icon"] = "Interface/LFGFRAME/LFGICON-THESTONECORE"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "The Vortex Pinnacle", ["level"] = 81, ["id"] = 68, ["icon"] = "Interface/LFGFRAME/LFGICON-THEVORTEXPINNACLE"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Lost City of the Tol'vir", ["level"] = 84, ["id"] = 69, ["icon"] = "Interface/LFGFRAME/LFGICON-LOSTCITYOFTOLVIR"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Halls of Origination", ["level"] = 84, ["id"] = 70, ["icon"] = "Interface/LFGFRAME/LFGICON-HALLSOFORIGINATION"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Grim Batol", ["level"] = 84, ["id"] = 71, ["icon"] = "Interface/LFGFRAME/LFGICON-GRIMBATOLRAID"}
	,{["subText"] = STRING_DUNGEON_HEROIC, ["name"] = "Heroic: Cataclysm Dungeons", ["level"] = 85, ["id"] = _aVar.CATA_HEROIC, ["icon"] = "Interface/LFGFRAME/LFGICON-DUNGEON"}
	,{["subText"] = STRING_RAID, ["name"] = "Cataclysm Raids", ["level"] = 85, ["id"] = _aVar.CATA_RAID, ["icon"] = "Interface/LFGFRAME/LFGIcon-FallofDeathwing"}
-- Mist of Pandaria
	,{["subText"] = STRING_DUNGEON, ["name"] = "Stormstout Brewery", ["level"] = 85, ["id"] = 302, ["icon"] = "Interface/LFGFRAME/LFGIcon-StormstoutBrewery"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Temple of the Jade Serpent", ["level"] = 85, ["id"] = 313, ["icon"] = "Interface/LFGFRAME/LFGIcon-TempleoftheJadeSerpent"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Shado-Pan Monastery", ["level"] = 87, ["id"] = 312, ["icon"] = "Interface/LFGFRAME/LFGIcon-ShadowpanMonastery"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Mogu'Shan Palace", ["level"] = 87, ["id"] = 321, ["icon"] = "Interface/LFGFRAME/LFGIcon-MogushanPalace"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Gate of the Setting Sun", ["level"] = 88, ["id"] = 303, ["icon"] = "Interface/LFGFRAME/LFGIcon-GateoftheSettingSun"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Siege of Niuzao Temple", ["level"] = 88, ["id"] = 324, ["icon"] = "Interface/LFGFRAME/LFGIcon-SiegeofNizaoTemple"}
	,{["subText"] = STRING_DUNGEON_HEROIC, ["name"] = "Heroic: Pandaria Dungeons", ["level"] = 90, ["id"] = _aVar.MOP_HEROIC, ["icon"] = "Interface/LFGFRAME/LFGICON-DUNGEON"}
	,{["subText"] = STRING_RAID, ["name"] = "Pandaria Raids", ["level"] = 90, ["id"] = _aVar.MOP_RAID, ["icon"] = "Interface/LFGFRAME/LFGIcon-OrgrimmarGates"}
-- WoD
	,{["subText"] = STRING_DUNGEON, ["name"] = "Bloodmaul Slag Mines", ["level"] = 90, ["id"] = 385, ["icon"] = "Interface/LFGFRAME/LFGIcon-BloodmaulSlagMines"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Iron Docks", ["level"] = 92, ["id"] = 558, ["icon"] = "Interface/LFGFRAME/LFGIcon-IronDocks"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Auchindoun", ["level"] = 94, ["id"] = 547, ["icon"] = "Interface/LFGFRAME/LFGIcon-AuchindounWOD"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Skyreach", ["level"] = 97, ["id"] = 476, ["icon"] = "Interface/LFGFRAME/LFGIcon-Skyreach"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Grimrail Depot", ["level"] = 100, ["id"] = 536, ["icon"] = "Interface/LFGFRAME/LFGIcon-GrimrailDepot"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Shadowmoon Burial Grounds", ["level"] = 100, ["id"] = 537, ["icon"] = "Interface/LFGFRAME/LFGIcon-ShadowmoonBurialGrounds"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "The Everbloom", ["level"] = 100, ["id"] = 556, ["icon"] = "Interface/LFGFRAME/LFGIcon-Everbloom"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Upper Blackrock Spire", ["level"] = 100, ["id"] = 559, ["icon"] = "Interface/LFGFRAME/LFGIcon-UpperBlackrockSpire"}
	,{["subText"] = STRING_DUNGEON_HEROIC, ["name"] = "Heroic: Draenor Dungeons", ["level"] = 100, ["id"] = _aVar.WOD_HEROIC, ["icon"] = "Interface/LFGFRAME/LFGICON-DUNGEON"}
	,{["subText"] = STRING_RAID, ["name"] = "Draenor Raids", ["level"] = 100, ["id"] = _aVar.WOD_RAID, ["icon"] = "Interface/LFGFRAME/LFGICON-HELLFIRECITADELRAID"}
-- Legion
	,{["subText"] = STRING_DUNGEON, ["name"] = "Darkheart Thicket", ["level"] = 100, ["id"] = 762, ["icon"] = "Interface/LFGFRAME/LFGIcon-DarkheartThicket"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Eye of Azshara", ["level"] = 100, ["id"] = 716, ["icon"] = "Interface/LFGFRAME/LFGIcon-EyeofAzshara"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Halls of Valor", ["level"] = 100, ["id"] = 721, ["icon"] = "Interface/LFGFRAME/LFGIcon-HallsofValor"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Neltharion's Lair", ["level"] = 100, ["id"] = 767, ["icon"] = "Interface/LFGFRAME/LFGIcon-NeltharionsLair"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Assault of Violet Hold", ["level"] = 105, ["id"] = 777, ["icon"] = "Interface/LFGFRAME/LFGIcon-AssaultonVioletHold"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Black Rook Hold", ["level"] = 110, ["id"] = 740, ["icon"] = "Interface/LFGFRAME/LFGIcon-BlackRookHold"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Court of Stars", ["level"] = 110, ["id"] = 800, ["icon"] = "Interface/LFGFRAME/LFGIcon-CourtofStars"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Maw of Souls", ["level"] = 110, ["id"] = 727, ["icon"] = "Interface/LFGFRAME/LFGIcon-MawofSouls"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "The Arcway", ["level"] = 110, ["id"] = 726, ["icon"] = "Interface/LFGFRAME/LFGIcon-TheArcway"}
	,{["subText"] = STRING_DUNGEON, ["name"] = "Vault of the Wardens", ["level"] = 110, ["id"] = 707, ["icon"] = "Interface/LFGFRAME/LFGIcon-VaultoftheWardens"}
	,{["subText"] = STRING_DUNGEON_HEROIC, ["name"] = "Heroic: Legion Dungeons", ["level"] = 110, ["id"] = _aVar.LEGION_HEROIC, ["icon"] = "Interface/LFGFRAME/LFGICON-DUNGEON"}
	,{["subText"] = STRING_RAID, ["name"] = "Legion Raids", ["level"] = 110, ["id"] = _aVar.LEGION_RAID, ["icon"] = "Interface/LFGFRAME/LFGIcon-TheEmeraldNightmare-RiftofAln"}
};

--------------------------
-- Battlegrounds
--------------------------

_addonData.Pvp = {
	{["subText"] = STRING_BATTLEGROUND, ["name"] = "Warsong Gulch", ["level"] = 10, ["icon"] = "Interface/ICONS/achievement_bg_winwsg"}
	,{["subText"] = STRING_BATTLEGROUND, ["name"] = "Arathi Basin", ["level"] = 10, ["icon"] = "Interface/ICONS/achievement_bg_takexflags_ab"}
	,{["subText"] = STRING_BATTLEGROUND, ["name"] = "Eye of the Storm", ["level"] = 35, ["icon"] = "Interface/ICONS/Achievement_Zone_Netherstorm_01"}
	,{["subText"] = STRING_BATTLEGROUND, ["name"] = "Alterac Valley", ["level"] = 45, ["icon"] = "Interface/ICONS/achievement_bg_defendxtowers_av"}
	,{["subText"] = STRING_BATTLEGROUND, ["name"] = "Strand of the Ancients", ["level"] = 65, ["icon"] = "Interface/LFGFRAME/LFGICON-STRANDOFTHEANCIENTS"}
	,{["subText"] = STRING_BATTLEGROUND, ["name"] = "Battle for Gilneas", ["level"] = 75, ["icon"] = "Interface/LFGFRAME/LFGICON-THEBATTLEFORGILNEAS"}
	,{["subText"] = STRING_BATTLEGROUND, ["name"] = "Twin Peaks", ["level"] = 75, ["icon"] = "Interface/LFGFRAME/LFGIcon-TwinPeaksBG"}
	,{["subText"] = STRING_BATTLEGROUND, ["name"] = "Isle of Conquest", ["level"] = 75, ["icon"] = "Interface/LFGFRAME/LFGIcon-IsleOfConquest"}
	,{["subText"] = STRING_WORLDPVP, ["name"] = "Wintergrasp", ["level"] = 75, ["icon"] = "Interface/ICONS/INV_EssenceOfWintergrasp"}
	,{["subText"] = STRING_WORLDPVP, ["name"] = "Tol Barad", ["level"] = 85, ["icon"] = "Interface/ICONS/Achievement_Zone_TolBarad"}
	,{["subText"] = STRING_BATTLEGROUND, ["name"] = "Deepwind Gorge", ["level"] = 90, ["icon"] = "Interface/LFGFRAME/LFGIcon-DeepwindGorge"}
	,{["subText"] = STRING_BATTLEGROUND, ["name"] = "Silvershard Mines", ["level"] = 90, ["icon"] = "Interface/LFGFRAME/LFGIcon-SilvershardMines"}
	,{["subText"] = STRING_BATTLEGROUND, ["name"] = "Temple of Kotmogu", ["level"] = 90, ["icon"] = "Interface/LFGFRAME/LFGIcon-TempleofKotmogu"}
	,{["subText"] = STRING_WORLDPVP, ["name"] = "Ashran", ["level"] = 100, ["icon"] = "Interface/ICONS/Achievement_Zone_Ashran"}
};

--------------------------
-- Spells
--------------------------

--
-- MAGE
--

if (playerClass == "MAGE")	then
local mageSpecs = {
	62 -- Arcana
	,63 -- Fire
	,64 -- Frost
};

local mageSkills = {
	{["id"] = 122, ["level"] = 3} -- Frost Nova
	,{["id"] = 30455, ["level"] = 5, ["specs"] = {64}} -- Ice Lance
	,{["id"] = 1953, ["level"] = 7} -- Blink
	,{["id"] = 44425, ["level"] = 10, ["specs"] = {62}} -- Arcane Barrage
	,{["id"] = 30451, ["level"] = 10, ["specs"] = {62}} -- Arcane Blast
	,{["id"] = 133, ["level"] = 10, ["specs"] = {63}} -- Fireball
	,{["id"] = 11366, ["level"] = 10, ["specs"] = {63}} -- Pyroblast
	,{["id"] = 31687, ["level"] = 10, ["specs"] = {64}} -- Summon Water Elemental
	,{["id"] = 108853, ["level"] = 11, ["specs"] = {63}} -- Inferno Blast
	,{["id"] = 195283, ["level"] = 12, ["specs"] = {63}, ["subText"] = STRING_PASSIVE} -- Hot Streak
	,{["id"] = 12982, ["level"] = 12, ["specs"] = {64}, ["subText"] = STRING_PASSIVE} -- Shatter
	,{["id"] = 11426, ["level"] = 14} -- Ice Barrier
	,{["id"] = 193759, ["level"] = 14} -- Teleport: Hall of the Guardian
	,{["id"] = 5143, ["level"] = 16, ["specs"] = {62}} -- Arcane Missiles
	,{["id"] = 157642, ["level"] = 16, ["specs"] = {63}, ["subText"] = STRING_PASSIVE} -- Enhanced Pyrotechnics
	,{["id"] = 84714, ["level"] = 16, ["specs"] = {64}} -- Frozen Orb
	,{["id"] = 3565, ["level"] = 17} -- Teleport: Darnassus
	,{["id"] = 32271, ["level"] = 17} -- Teleport: Exodar
	,{["id"] = 3562, ["level"] = 17} -- Teleport: Ironforge
	,{["id"] = 3567, ["level"] = 17} -- Teleport: Orgrimmar
	,{["id"] = 32272, ["level"] = 17} -- Teleport: Silvermoon
	,{["id"] = 3561, ["level"] = 17} -- Teleport: Stormwind
	,{["id"] = 49359, ["level"] = 17} -- Teleport: Theramore
	,{["id"] = 3566, ["level"] = 17} -- Teleport: Thunder Bluff
	,{["id"] = 3563, ["level"] = 17} -- Teleport: Undercity
	,{["id"] = 118, ["level"] = 18} -- Polymorph
	,{["id"] = 190336, ["level"] = 22} -- Conjure Refreshment
	,{["id"] = 195676, ["level"] = 24, ["specs"] = {62}} -- Displacement
	,{["id"] = 31661, ["level"] = 24, ["specs"] = {63}} -- Dragon's Breath
	,{["id"] = 112965, ["level"] = 24, ["specs"] = {64}} -- Fingers of Frost
	,{["id"] = 45438, ["level"] = 26} -- Ice Block
	,{["id"] = 1449, ["level"] = 28, ["specs"] = {62}} -- Arcane Explosion
	,{["id"] = 190447, ["level"] = 28, ["specs"] = {64}, ["subText"] = STRING_PASSIVE} -- Brain Freeze
	,{["id"] = 190319, ["level"] = 28, ["specs"] = {63}} -- Combustion
	,{["id"] = 130, ["level"] = 32} -- Slow Fall
	,{["id"] = 2139, ["level"] = 34} -- Counterspell
	,{["id"] = 120, ["level"] = 36, ["specs"] = {64}} -- Cone of Cold
	,{["id"] = 30482, ["level"] = 36, ["specs"] = {63}, ["subText"] = STRING_PASSIVE} -- Molten Armor
	,{["id"] = 31589, ["level"] = 36, ["specs"] = {62}} -- Slow
	,{["id"] = 12051, ["level"] = 40, ["specs"] = {62}} -- Evocation
	,{["id"] = 12472, ["level"] = 40, ["specs"] = {64}} -- Icy Veins
	,{["id"] = 2948, ["level"] = 40, ["specs"] = {63}} -- Scorch
	,{["id"] = 11419, ["level"] = 42} -- Portal: Darnassus
	,{["id"] = 32266, ["level"] = 42} -- Portal: Exodar
	,{["id"] = 11416, ["level"] = 42} -- Portal: Ironforge
	,{["id"] = 11417, ["level"] = 42} -- Portal: Orgrimmar
	,{["id"] = 32267, ["level"] = 42} -- Portal: Silvermoon
	,{["id"] = 10059, ["level"] = 42} -- Portal: Stormwind
	,{["id"] = 49360, ["level"] = 42} -- Portal: Theramore
	,{["id"] = 11420, ["level"] = 42} -- Portal: Thunder Bluff
	,{["id"] = 11418, ["level"] = 42} -- Portal: Undercity
	,{["id"] = 12042, ["level"] = 44, ["specs"] = {62}} -- Arcane Power
	,{["id"] = 190356, ["level"] = 44, ["specs"] = {64}} -- Blizzard
	,{["id"] = 2120, ["level"] = 44, ["specs"] = {63}} -- Flamestrike
	,{["id"] = 110959, ["level"] = 50, ["specs"] = {62}} -- Greater Invisibility
	,{["id"] = 66, ["level"] = 50, ["specs"] = {63, 64}} -- Invisibility
	,{["id"] = 89744, ["level"] = 50, ["subText"] = STRING_PASSIVE} -- Wizardry
	,{["id"] = 49361, ["level"] = 52} -- Portal: Stonard
	,{["id"] = 49358, ["level"] = 52} -- Teleport: Stonard
	,{["id"] = 117216, ["level"] = 56, ["specs"] = {63}, ["subText"] = STRING_PASSIVE} -- Critical Mass
	,{["id"] = 7302, ["level"] = 56, ["specs"] = {64}, ["subText"] = STRING_PASSIVE} -- Frost Armor
	,{["id"] = 6117, ["level"] = 56, ["specs"] = {62}, ["subText"] = STRING_PASSIVE} -- Mage Armor
	,{["id"] = 210086, ["level"] = 58, ["subText"] = STRING_PASSIVE} -- Arcane Linguist
	,{["id"] = 33690, ["level"] = 62} -- Teleport: Shattrath
	,{["id"] = 35715, ["level"] = 62} -- Teleport: Shattrath
	,{["id"] = 80353, ["level"] = 65} -- Time Warp
	,{["id"] = 33691, ["level"] = 66} -- Portal: Shattrath
	,{["id"] = 35717, ["level"] = 66} -- Portal: Shattrath
	,{["id"] = 120145, ["level"] = 71} -- Ancient Teleport: Dalaran
	,{["id"] = 224869, ["level"] = 71} -- Teleport: Dalaran - Broken Isles
	,{["id"] = 53140, ["level"] = 71} -- Teleport: Dalaran - Northrend
	,{["id"] = 30449, ["level"] = 72} -- Spellsteal
	,{["id"] = 120146, ["level"] = 74} -- Ancient Portal: Dalaran
	,{["id"] = 224871, ["level"] = 74} -- Portal: Dalaran - Broken Isles
	,{["id"] = 53142, ["level"] = 74} -- Portal: Dalaran - Northrend
	,{["id"] = 76613, ["level"] = 78, ["specs"] = {64}, ["subText"] = STRING_PASSIVE} -- Mastery: Icicles
	,{["id"] = 12846, ["level"] = 78, ["specs"] = {63}, ["subText"] = STRING_PASSIVE} -- Mastery: Ignite
	,{["id"] = 190740, ["level"] = 78, ["specs"] = {62}, ["subText"] = STRING_PASSIVE} -- Mastery: Savant
	,{["id"] = 88345, ["level"] = 85} -- Portal: Tol Barad
	,{["id"] = 88346, ["level"] = 85} -- Portal: Tol Barad
	,{["id"] = 88342, ["level"] = 85} -- Teleport: Tol Barad
	,{["id"] = 88344, ["level"] = 85} -- Teleport: Tol Barad
	,{["id"] = 132620, ["level"] = 90} -- Portal: Vale of Eternal Blossoms
	,{["id"] = 132626, ["level"] = 90} -- Portal: Vale of Eternal Blossoms
	,{["id"] = 132621, ["level"] = 90} -- Teleport: Vale of Eternal Blossoms
	,{["id"] = 132627, ["level"] = 90} -- Teleport: Vale of Eternal Blossoms
	,{["id"] = 176246, ["level"] = 92} -- Portal: Stormshield
	,{["id"] = 176244, ["level"] = 92} -- Portal: Warspear
	,{["id"] = 176248, ["level"] = 92} -- Teleport: Stormshield
	,{["id"] = 176242, ["level"] = 92} -- Teleport: Warspear
};

_addonData.Skills = mageSkills;
_addonData.Specs = mageSpecs;

end

--
-- PALADIN
--

if (playerClass == "PALADIN")	then
local paladinSpecs = {
	65 -- Holy
	,66 -- Protection
	,70 -- Retribution
};

local paladinSkills = {
	{["id"] = 35395, ["level"] = 3} -- Crusader Strike
	,{["id"] = 853, ["level"] = 5, ["specs"] = {65, 66, 70}} -- Hammer of Justice
	,{["id"] = 19750, ["level"] = 8, ["specs"] = {65, 66, 70}} -- Flash of Light
	,{["id"] = 31935, ["level"] = 10, ["specs"] = {66}} -- Avenger's Shield
	,{["id"] = 53592, ["level"] = 10, ["specs"] = {66}} -- Guarded by the Light
	,{["id"] = 53595, ["level"] = 10, ["specs"] = {66}} -- Hammer of the Righteous
	,{["id"] = 20473, ["level"] = 10, ["specs"] = {65}} -- Holy Shock
	,{["id"] = 25780, ["level"] = 10, ["specs"] = {66}} -- Righteous Fury
	,{["id"] = 105805, ["level"] = 10, ["specs"] = {66}, ["subText"] = STRING_PASSIVE} -- Sanctuary
	,{["id"] = 85256, ["level"] = 10, ["specs"] = {70}} -- Templar's Verdict
	,{["id"] = 184092, ["level"] = 12, ["specs"] = {66}} -- Light of the Protector
	,{["id"] = 53503, ["level"] = 12, ["specs"] = {70}, ["subText"] = STRING_PASSIVE} -- Sword of Light
	,{["id"] = 62124, ["level"] = 13} -- Hand of Reckoning
	,{["id"] = 7328, ["level"] = 14} -- Redemption
	,{["id"] = 184575, ["level"] = 16, ["specs"] = {70}} -- Blade of Justice
	,{["id"] = 642, ["level"] = 18} -- Divine Shield
	,{["id"] = 66907, ["level"] = 20} -- Summon Warhorse
	,{["id"] = 4987, ["level"] = 21, ["specs"] = {65}} -- Cleanse
	,{["id"] = 213644, ["level"] = 21, ["specs"] = {66, 70}} -- Cleanse Toxins
	,{["id"] = 633, ["level"] = 22} -- Lay on Hands
	,{["id"] = 184662, ["level"] = 24, ["specs"] = {70}} -- Shield of Vengeance
	,{["id"] = 498, ["level"] = 26, ["specs"] = {65, 66}} -- Divine Protection
	,{["id"] = 183218, ["level"] = 26, ["specs"] = {70}} -- Hand of Hindrance
	,{["id"] = 105424, ["level"] = 28, ["specs"] = {66}, ["subText"] = STRING_PASSIVE} -- Judgments of the Wise
	,{["id"] = 26573, ["level"] = 32, ["specs"] = {65, 66}} -- Consecration
	,{["id"] = 53385, ["level"] = 32, ["specs"] = {70}} -- Divine Storm
	,{["id"] = 53563, ["level"] = 36, ["specs"] = {65}} -- Beacon of Light
	,{["id"] = 96231, ["level"] = 36, ["specs"] = {66, 70}} -- Rebuke
	,{["id"] = 53600, ["level"] = 38, ["specs"] = {66}} -- Shield of the Righteous
	,{["id"] = 32223, ["level"] = 40, ["subText"] = STRING_PASSIVE} -- Heart of the Crusader
	,{["id"] = 23214, ["level"] = 40} -- Summon Charger
	,{["id"] = 203528, ["level"] = 42, ["specs"] = {70}} -- Greater Blessing of Might
	,{["id"] = 183998, ["level"] = 42, ["specs"] = {65}} -- Light of the Martyr
	,{["id"] = 212056, ["level"] = 44, ["specs"] = {65}} -- Absolution
	,{["id"] = 203538, ["level"] = 44, ["specs"] = {70}} -- Greater Blessing of Kings
	,{["id"] = 203539, ["level"] = 46, ["specs"] = {70}} -- Greater Blessing of Wisdom
	,{["id"] = 1022, ["level"] = 48, ["specs"] = {65, 66, 70}} -- Blessing of Protection
	,{["id"] = 85043, ["level"] = 50, ["specs"] = {66}, ["subText"] = STRING_PASSIVE} -- Grand Crusader
	,{["id"] = 53576, ["level"] = 50, ["specs"] = {65}, ["subText"] = STRING_PASSIVE} -- Infusion of Light
	,{["id"] = 86102, ["level"] = 50, ["specs"] = {66}, ["subText"] = STRING_PASSIVE} -- Plate Specialization
	,{["id"] = 86103, ["level"] = 50, ["specs"] = {65}, ["subText"] = STRING_PASSIVE} -- Plate Specialization
	,{["id"] = 86539, ["level"] = 50, ["specs"] = {70}, ["subText"] = STRING_PASSIVE} -- Plate Specialization
	,{["id"] = 227068, ["level"] = 50, ["specs"] = {65}, ["subText"] = STRING_PASSIVE} -- Righteousness
	,{["id"] = 1044, ["level"] = 52} -- Blessing of Freedom
	,{["id"] = 82326, ["level"] = 54, ["specs"] = {65}} -- Holy Light
	,{["id"] = 6940, ["level"] = 56, ["specs"] = {65, 66}} -- Blessing of Sacrifice
	,{["id"] = 183435, ["level"] = 56, ["specs"] = {70}, ["subText"] = STRING_PASSIVE} -- Retribution
	,{["id"] = 85222, ["level"] = 58, ["specs"] = {65}} -- Light of Dawn
	,{["id"] = 31850, ["level"] = 65, ["specs"] = {66}} -- Ardent Defender
	,{["id"] = 31821, ["level"] = 65, ["specs"] = {65}} -- Aura Mastery
	,{["id"] = 31842, ["level"] = 72, ["specs"] = {65}} -- Avenging Wrath
	,{["id"] = 31884, ["level"] = 72, ["specs"] = {66, 70}} -- Avenging Wrath
	,{["id"] = 86659, ["level"] = 72, ["specs"] = {66}} -- Guardian of Ancient Kings
	,{["id"] = 161800, ["level"] = 76, ["specs"] = {66}, ["subText"] = STRING_PASSIVE} -- Riposte
	,{["id"] = 76671, ["level"] = 78, ["specs"] = {66}, ["subText"] = STRING_PASSIVE} -- Mastery: Divine Bulwark
	,{["id"] = 76672, ["level"] = 78, ["specs"] = {70}, ["subText"] = STRING_PASSIVE} -- Mastery: Divine Judgment
	,{["id"] = 183997, ["level"] = 78, ["specs"] = {65}, ["subText"] = STRING_PASSIVE} -- Mastery: Lightbringer
	,{["id"] = 115675, ["level"] = 85, ["subText"] = STRING_PASSIVE} -- Boundless Conviction
	,{["id"] = 190784, ["level"] = 87, ["specs"] = {66}} -- Divine Steed
};

_addonData.Skills = paladinSkills;
_addonData.Specs = paladinSpecs;

end

--
-- WARRIOR
--

if (playerClass == "WARRIOR") then
local warriorSpecs = {
	71 -- Arms
	,72 -- Fury
	,73 -- Protection
};

local warriorSkills = {
	{["id"] = 100, ["level"] = 3} -- Charge
	,{["id"] = 12294, ["level"] = 5, ["specs"] = {71}} -- Mortal Strike
	,{["id"] = 5308, ["level"] = 8, ["specs"] = {72}} -- Execute
	,{["id"] = 163201, ["level"] = 8, ["specs"] = {71}} -- Execute
	,{["id"] = 71, ["level"] = 9, ["specs"] = {73}} -- Defensive Stance
	,{["id"] = 23881, ["level"] = 10, ["specs"] = {72}} -- Bloodthirst
	,{["id"] = 184361, ["level"] = 10, ["specs"] = {72}, ["subText"] = STRING_PASSIVE} -- Enrage
	,{["id"] = 100130, ["level"] = 10, ["specs"] = {72}} -- Furious Slash
	,{["id"] = 12712, ["level"] = 10, ["specs"] = {71}, ["subText"] = STRING_PASSIVE} -- Seasoned Soldier
	,{["id"] = 23922, ["level"] = 10, ["specs"] = {73}} -- Shield Slam
	,{["id"] = 46953, ["level"] = 10, ["specs"] = {73}, ["subText"] = STRING_PASSIVE} -- Sword and Board
	,{["id"] = 46917, ["level"] = 10, ["specs"] = {72}, ["subText"] = STRING_PASSIVE} -- Titan's Grip
	,{["id"] = 29144, ["level"] = 10, ["specs"] = {73}, ["subText"] = STRING_PASSIVE} -- Unwavering Sentinel
	,{["id"] = 34428, ["level"] = 10, ["specs"] = {71, 73}} -- Victory Rush
	,{["id"] = 20243, ["level"] = 12, ["specs"] = {73}} -- Devastate
	,{["id"] = 184364, ["level"] = 12, ["specs"] = {72}} -- Enraged Regeneration
	,{["id"] = 85288, ["level"] = 13, ["specs"] = {72}} -- Raging Blow
	,{["id"] = 355, ["level"] = 14} -- Taunt
	,{["id"] = 6343, ["level"] = 16, ["specs"] = {73}} -- Thunder Clap
	,{["id"] = 167105, ["level"] = 18, ["specs"] = {71}} -- Colossus Smash
	,{["id"] = 184367, ["level"] = 18, ["specs"] = {72}} -- Rampage
	,{["id"] = 2565, ["level"] = 18, ["specs"] = {73}} -- Shield Block
	,{["id"] = 184783, ["level"] = 18, ["specs"] = {71}, ["subText"] = STRING_PASSIVE} -- Tactician
	,{["id"] = 57755, ["level"] = 22} -- Heroic Throw
	,{["id"] = 6552, ["level"] = 24} -- Pummel
	,{["id"] = 12323, ["level"] = 26, ["specs"] = {72}} -- Piercing Howl
	,{["id"] = 6544, ["level"] = 26} -- Heroic Leap
	,{["id"] = 6572, ["level"] = 28, ["specs"] = {73}} -- Revenge
	,{["id"] = 1680, ["level"] = 28, ["specs"] = {71}} -- Whirlwind
	,{["id"] = 190411, ["level"] = 28, ["specs"] = {72}} -- Whirlwind
	,{["id"] = 845, ["level"] = 32, ["specs"] = {71}} -- Cleave
	,{["id"] = 115767, ["level"] = 32, ["subText"] = STRING_PASSIVE} -- Deep Wounds
	,{["id"] = 190456, ["level"] = 34, ["specs"] = {73}} -- Ignore Pain
	,{["id"] = 1715, ["level"] = 35, ["specs"] = {71}} -- Hamstring
	,{["id"] = 12975, ["level"] = 36, ["specs"] = {73}} -- Last Stand
	,{["id"] = 81099, ["level"] = 38, ["specs"] = {72}, ["subText"] = STRING_PASSIVE} -- Single-Minded Fury
	,{["id"] = 1160, ["level"] = 40, ["specs"] = {73}} -- Demoralizing Shout
	,{["id"] = 118038, ["level"] = 40, ["specs"] = {71}} -- Die by the Sword
	,{["id"] = 871, ["level"] = 48, ["specs"] = {73}} -- Shield Wall
	,{["id"] = 18499, ["level"] = 50, ["specs"] = {71, 72, 73}} -- Berserker Rage
	,{["id"] = 86101, ["level"] = 50, ["specs"] = {71}, ["subText"] = STRING_PASSIVE} -- Plate Specialization
	,{["id"] = 86110, ["level"] = 50, ["specs"] = {72}, ["subText"] = STRING_PASSIVE} -- Plate Specialization
	,{["id"] = 86535, ["level"] = 50, ["specs"] = {73}, ["subText"] = STRING_PASSIVE} -- Plate Specialization
	,{["id"] = 204488, ["level"] = 52, ["specs"] = {73}} -- Focused Rage
	,{["id"] = 12950, ["level"] = 58, ["specs"] = {72}, ["subText"] = STRING_PASSIVE} -- Meat Cleaver
	,{["id"] = 84608, ["level"] = 60, ["specs"] = {73}, ["subText"] = STRING_PASSIVE} -- Bastion of Defense
	,{["id"] = 1719, ["level"] = 60, ["specs"] = {71, 72, 73}} -- Battle Cry
	,{["id"] = 23920, ["level"] = 65, ["specs"] = {73}} -- Spell Reflection
	,{["id"] = 5246, ["level"] = 70, ["specs"] = {71, 72}} -- Intimidating Shout
	,{["id"] = 198304, ["level"] = 72, ["specs"] = {73}} -- Intercept
	,{["id"] = 227847, ["level"] = 75, ["specs"] = {71}} -- Bladestorm
	,{["id"] = 161798, ["level"] = 76, ["specs"] = {73}, ["subText"] = STRING_PASSIVE} -- Riposte
	,{["id"] = 76838, ["level"] = 78, ["specs"] = {71}, ["subText"] = STRING_PASSIVE} -- Mastery: Colossal Might
	,{["id"] = 76857, ["level"] = 78, ["specs"] = {73}, ["subText"] = STRING_PASSIVE} -- Mastery: Critical Block
	,{["id"] = 76856, ["level"] = 78, ["specs"] = {72}, ["subText"] = STRING_PASSIVE} -- Mastery: Unshackled Fury
	,{["id"] = 97462, ["level"] = 83, ["specs"] = {71, 72}} -- Commanding Shout
};

_addonData.Skills = warriorSkills;
_addonData.Specs = warriorSpecs;

end

--
-- DRUID
--

if (playerClass == "DRUID") then
local druidSpecs = {
	102 -- Balance
	,103 -- Feral
	,104 -- Guardian
	,105 -- Restoration
};

local druidSkills = {
	{["id"] = 22568, ["level"] = 3, ["specs"] = {103}} -- Ferocious Bite
	,{["id"] = 5215, ["level"] = 5, ["specs"] = {102, 103, 104, 105}} -- Prowl
	,{["id"] = 1822, ["level"] = 6, ["specs"] = {103}} -- Rake
	,{["id"] = 125972, ["level"] = 6, ["subText"] = STRING_PASSIVE} -- Feline Grace
	,{["id"] = 5487, ["level"] = 8} -- Bear Form
	,{["id"] = 197524, ["level"] = 10, ["specs"] = {102}, ["subText"] = STRING_PASSIVE} -- Astral Influence
	,{["id"] = 131768, ["level"] = 10, ["specs"] = {103}, ["subText"] = STRING_PASSIVE} -- Feline Swiftness
	,{["id"] = 108299, ["level"] = 10, ["specs"] = {102, 105}, ["subText"] = STRING_PASSIVE} -- Killer Instinct
	,{["id"] = 33917, ["level"] = 10, ["specs"] = {104}} -- Mangle
	,{["id"] = 6807, ["level"] = 10, ["specs"] = {104}} -- Maul
	,{["id"] = 33873, ["level"] = 10, ["specs"] = {103, 104}, ["subText"] = STRING_PASSIVE} -- Nurturing Instinct
	,{["id"] = 8936, ["level"] = 10, ["specs"] = {105}} -- Regrowth
	,{["id"] = 774, ["level"] = 10, ["specs"] = {105}} -- Rejuvenation
	,{["id"] = 5176, ["level"] = 10, ["specs"] = {105}} -- Solar Wrath
	,{["id"] = 190984, ["level"] = 10, ["specs"] = {102}} -- Solar Wrath
	,{["id"] = 78674, ["level"] = 10, ["specs"] = {102}} -- Starsurge
	,{["id"] = 16931, ["level"] = 10, ["specs"] = {104}, ["subText"] = STRING_PASSIVE} -- Thick Hide
	,{["id"] = 16870, ["level"] = 10} -- Clearcasting
	,{["id"] = 8921, ["level"] = 10} -- Moonfire
	,{["id"] = 145108, ["level"] = 11, ["specs"] = {105}, ["subText"] = STRING_PASSIVE} -- Ysera's Gift
	,{["id"] = 194153, ["level"] = 12, ["specs"] = {102}} -- Lunar Strike
	,{["id"] = 5217, ["level"] = 12, ["specs"] = {103}} -- Tiger's Fury
	,{["id"] = 6795, ["level"] = 13} -- Growl
	,{["id"] = 106832, ["level"] = 14, ["specs"] = {103, 104}} -- Thrash
	,{["id"] = 193753, ["level"] = 14} -- Dreamwalk
	,{["id"] = 50769, ["level"] = 14} -- Revive
	,{["id"] = 18960, ["level"] = 14} -- Teleport: Moonglade
	,{["id"] = 24858, ["level"] = 16, ["specs"] = {102}} -- Moonkin Form
	,{["id"] = 783, ["level"] = 16} -- Travel Form
	,{["id"] = 88423, ["level"] = 18, ["specs"] = {105}} -- Nature's Cure
	,{["id"] = 2782, ["level"] = 18, ["specs"] = {102, 103, 104}} -- Remove Corruption
	,{["id"] = 18562, ["level"] = 18, ["specs"] = {105}} -- Swiftmend
	,{["id"] = 164815, ["level"] = 18} -- Sunfire
	,{["id"] = 77758, ["level"] = 18} -- Thrash
	,{["id"] = 106830, ["level"] = 18} -- Thrash
	,{["id"] = 1079, ["level"] = 20, ["specs"] = {103}} -- Rip
	,{["id"] = 339, ["level"] = 22} -- Entangling Roots
	,{["id"] = 93402, ["level"] = 24, ["specs"] = {102, 105}} -- Sunfire
	,{["id"] = 1850, ["level"] = 24} -- Dash
	,{["id"] = 5185, ["level"] = 26, ["specs"] = {102, 103, 104, 105}} -- Healing Touch
	,{["id"] = 99, ["level"] = 28, ["specs"] = {104}} -- Incapacitating Roar
	,{["id"] = 48500, ["level"] = 28, ["specs"] = {105}, ["subText"] = STRING_PASSIVE} -- Living Seed
	,{["id"] = 16974, ["level"] = 28, ["specs"] = {103}, ["subText"] = STRING_PASSIVE} -- Predatory Swiftness
	,{["id"] = 78675, ["level"] = 28, ["specs"] = {102}} -- Solar Beam
	,{["id"] = 33763, ["level"] = 32, ["specs"] = {105}} -- Lifebloom
	,{["id"] = 213764, ["level"] = 32, ["specs"] = {103, 104}} -- Swipe
	,{["id"] = 210706, ["level"] = 34, ["specs"] = {104}, ["subText"] = STRING_PASSIVE} -- Gore
	,{["id"] = 22812, ["level"] = 36, ["specs"] = {102, 104, 105}} -- Barkskin
	,{["id"] = 16864, ["level"] = 38, ["specs"] = {103}, ["subText"] = STRING_PASSIVE} -- Omen of Clarity
	,{["id"] = 113043, ["level"] = 38, ["specs"] = {105}, ["subText"] = STRING_PASSIVE} -- Omen of Clarity
	,{["id"] = 191034, ["level"] = 40, ["specs"] = {102}} -- Starfall
	,{["id"] = 61336, ["level"] = 40, ["specs"] = {103, 104}} -- Survival Instincts
	,{["id"] = 127757, ["level"] = 40} -- Charm Woodland Creature
	,{["id"] = 164862, ["level"] = 40} -- Flap
	,{["id"] = 210053, ["level"] = 40} -- Stag Form
	,{["id"] = 210065, ["level"] = 40} -- Track Beasts
	,{["id"] = 48484, ["level"] = 42, ["specs"] = {103}, ["subText"] = STRING_PASSIVE} -- Infected Wounds
	,{["id"] = 192081, ["level"] = 44, ["specs"] = {104}, ["subText"] = STRING_PASSIVE} -- Ironfur
	,{["id"] = 212040, ["level"] = 44, ["specs"] = {105}} -- Revitalize
	,{["id"] = 106951, ["level"] = 48, ["specs"] = {103}} -- Berserk
	,{["id"] = 102793, ["level"] = 48, ["specs"] = {105}} -- Ursol's Vortex
	,{["id"] = 22842, ["level"] = 50, ["specs"] = {104}} -- Frenzied Regeneration
	,{["id"] = 29166, ["level"] = 50, ["specs"] = {102, 105}} -- Innervate
	,{["id"] = 86093, ["level"] = 50, ["specs"] = {105}, ["subText"] = STRING_PASSIVE} -- Leather Specialization
	,{["id"] = 86096, ["level"] = 50, ["specs"] = {104}, ["subText"] = STRING_PASSIVE} -- Leather Specialization
	,{["id"] = 86097, ["level"] = 50, ["specs"] = {103}, ["subText"] = STRING_PASSIVE} -- Leather Specialization
	,{["id"] = 86104, ["level"] = 50, ["specs"] = {102}, ["subText"] = STRING_PASSIVE} -- Leather Specialization
	,{["id"] = 102342, ["level"] = 52, ["specs"] = {105}} -- Ironbark
	,{["id"] = 20484, ["level"] = 56} -- Rebirth
	,{["id"] = 165962, ["level"] = 58} -- Flight Form
	,{["id"] = 194223, ["level"] = 64, ["specs"] = {102}} -- Celestial Alignment
	,{["id"] = 106839, ["level"] = 64, ["specs"] = {103, 104}} -- Skull Bash
	,{["id"] = 48438, ["level"] = 64, ["specs"] = {105}} -- Wild Growth
	,{["id"] = 22570, ["level"] = 72, ["specs"] = {103}} -- Maim
	,{["id"] = 192083, ["level"] = 72, ["specs"] = {104}} -- Mark of Ursol
	,{["id"] = 740, ["level"] = 72, ["specs"] = {105}} -- Tranquility
	,{["id"] = 77495, ["level"] = 78, ["specs"] = {105}, ["subText"] = STRING_PASSIVE} -- Mastery: Harmony
	,{["id"] = 155783, ["level"] = 78, ["specs"] = {104}, ["subText"] = STRING_PASSIVE} -- Mastery: Nature's Guardian
	,{["id"] = 77493, ["level"] = 78, ["specs"] = {103}, ["subText"] = STRING_PASSIVE} -- Mastery: Razor Claws
	,{["id"] = 77492, ["level"] = 78, ["specs"] = {102}, ["subText"] = STRING_PASSIVE} -- Mastery: Starlight
	,{["id"] = 145205, ["level"] = 88, ["specs"] = {105}} -- Efflorescence
	,{["id"] = 106898, ["level"] = 88, ["specs"] = {103, 104}} -- Stampeding Roar
};

_addonData.Skills = druidSkills;
_addonData.Specs = druidSpecs;

end

--
-- DEATH KNIGHT
--

if (playerClass == "DEATHKNIGHT") then
local dkSpecs = {
	250 -- Blood
	,251 -- Frost
	,252 -- Unholy
};

local dkSkills = {
	{["id"] = 50842, ["level"] = 56, ["specs"] = {250}} -- Blood Boil
	,{["id"] = 43265, ["level"] = 56, ["specs"] = {250, 252}} -- Death and Decay
	,{["id"] = 51128, ["level"] = 56, ["specs"] = {251}, ["subText"] = STRING_PASSIVE} -- Killing Machine
	,{["id"] = 49028, ["level"] = 57, ["specs"] = {250}} -- Dancing Rune Weapon
	,{["id"] = 47568, ["level"] = 57, ["specs"] = {251}} -- Empower Rune Weapon
	,{["id"] = 196770, ["level"] = 57, ["specs"] = {251}} -- Remorseless Winter
	,{["id"] = 55233, ["level"] = 57, ["specs"] = {250}} -- Vampiric Blood
	,{["id"] = 48707, ["level"] = 57} -- Anti-Magic Shell
	,{["id"] = 178819, ["level"] = 58, ["specs"] = {251, 252}, ["subText"] = STRING_PASSIVE} -- Dark Succor
	,{["id"] = 195292, ["level"] = 58, ["specs"] = {250}} -- Death's Caress
	,{["id"] = 56222, ["level"] = 58} -- Dark Command
	,{["id"] = 59057, ["level"] = 59, ["specs"] = {251}, ["subText"] = STRING_PASSIVE} -- Rime
	,{["id"] = 51271, ["level"] = 60, ["specs"] = {251}} -- Pillar of Frost
	,{["id"] = 48263, ["level"] = 60, ["specs"] = {250}, ["subText"] = STRING_PASSIVE} -- Veteran of the Third War
	,{["id"] = 212552, ["level"] = 60, ["specs"] = {250, 251, 252}} -- Wraith Walk
	,{["id"] = 51986, ["level"] = 61, ["subText"] = STRING_PASSIVE} -- On a Pale Horse
	,{["id"] = 47528, ["level"] = 62} -- Mind Freeze
	,{["id"] = 45524, ["level"] = 63, ["specs"] = {251, 252}} -- Chains of Ice
	,{["id"] = 81136, ["level"] = 63, ["specs"] = {250}, ["subText"] = STRING_PASSIVE} -- Crimson Scourge
	,{["id"] = 108199, ["level"] = 64, ["specs"] = {250}} -- Gorefiend's Grasp
	,{["id"] = 49530, ["level"] = 64, ["specs"] = {252}, ["subText"] = STRING_PASSIVE} -- Sudden Doom
	,{["id"] = 48792, ["level"] = 65, ["specs"] = {251, 252}} -- Icebound Fortitude
	,{["id"] = 3714, ["level"] = 66} -- Path of Frost
	,{["id"] = 111673, ["level"] = 69} -- Control Undead
	,{["id"] = 53344, ["level"] = 70} -- Rune of the Fallen Crusader
	,{["id"] = 61999, ["level"] = 72} -- Raise Ally
	,{["id"] = 62158, ["level"] = 72} -- Rune of the Stoneskin Gargoyle
	,{["id"] = 63560, ["level"] = 74, ["specs"] = {252}} -- Dark Transformation
	,{["id"] = 49206, ["level"] = 75, ["specs"] = {252}} -- Summon Gargoyle
	,{["id"] = 161797, ["level"] = 76, ["specs"] = {250}, ["subText"] = STRING_PASSIVE} -- Riposte
	,{["id"] = 77513, ["level"] = 78, ["specs"] = {250}, ["subText"] = STRING_PASSIVE} -- Mastery: Blood Shield
	,{["id"] = 77515, ["level"] = 78, ["specs"] = {252}, ["subText"] = STRING_PASSIVE} -- Mastery: Dreadblade
	,{["id"] = 77514, ["level"] = 78, ["specs"] = {251}, ["subText"] = STRING_PASSIVE} -- Mastery: Frozen Heart
	,{["id"] = 42650, ["level"] = 82, ["specs"] = {252}} -- Army of the Dead
};

_addonData.Skills = dkSkills;
_addonData.Specs = dkSpecs;
end

--
-- HUNTER
--

if (playerClass == "HUNTER") then
local hunterSpecs = {
	253 -- Beast Mastery
	,254 -- Marksmanship
	,255 -- Survival
};

local hunterSkills = {
	{["id"] = 34026, ["level"] = 3, ["specs"] = {253}} -- Kill Command
	,{["id"] = 1494, ["level"] = 4} -- Track Beasts
	,{["id"] = 19878, ["level"] = 4} -- Track Demons
	,{["id"] = 19879, ["level"] = 4} -- Track Dragonkin
	,{["id"] = 19880, ["level"] = 4} -- Track Elementals
	,{["id"] = 19882, ["level"] = 4} -- Track Giants
	,{["id"] = 19885, ["level"] = 4} -- Track Hidden
	,{["id"] = 19883, ["level"] = 4} -- Track Humanoids
	,{["id"] = 19884, ["level"] = 4} -- Track Undead
	,{["id"] = 186257, ["level"] = 5} -- Aspect of the Cheetah
	,{["id"] = 5116, ["level"] = 8, ["specs"] = {253, 254}} -- Concussive Shot
	,{["id"] = 19434, ["level"] = 10, ["specs"] = {254}} -- Aimed Shot
	,{["id"] = 185358, ["level"] = 10, ["specs"] = {254}} -- Arcane Shot
	,{["id"] = 120679, ["level"] = 10, ["specs"] = {253}} -- Dire Beast
	,{["id"] = 53270, ["level"] = 10, ["specs"] = {253}, ["subText"] = STRING_PASSIVE} -- Exotic Beasts
	,{["id"] = 202800, ["level"] = 10, ["specs"] = {255}} -- Flanking Strike
	,{["id"] = 186270, ["level"] = 10, ["specs"] = {255}} -- Raptor Strike
	,{["id"] = 195645, ["level"] = 10, ["specs"] = {255}} -- Wing Clip
	,{["id"] = 83242, ["level"] = 10} -- Call Pet 2
	,{["id"] = 93321, ["level"] = 10, ["subText"] = STRING_PASSIVE} -- Control Pet
	,{["id"] = 2641, ["level"] = 10} -- Dismiss Pet
	,{["id"] = 1515, ["level"] = 10} -- Tame Beast
	,{["id"] = 6991, ["level"] = 11} -- Feed Pet
	,{["id"] = 164856, ["level"] = 12, ["specs"] = {255}, ["subText"] = STRING_PASSIVE} -- Survivalist
	,{["id"] = 1462, ["level"] = 12} -- Beast Lore
	,{["id"] = 781, ["level"] = 14, ["specs"] = {253, 254}} -- Disengage
	,{["id"] = 6197, ["level"] = 16} -- Eagle Eye
	,{["id"] = 193530, ["level"] = 18, ["specs"] = {253}} -- Aspect of the Wild
	,{["id"] = 185987, ["level"] = 18, ["specs"] = {254}} -- Hunter's Mark
	,{["id"] = 185901, ["level"] = 18, ["specs"] = {254}} -- Marked Shot
	,{["id"] = 190928, ["level"] = 18, ["specs"] = {255}} -- Mongoose Bite
	,{["id"] = 193265, ["level"] = 19, ["specs"] = {255}} -- Hatchet Toss
	,{["id"] = 186387, ["level"] = 22, ["specs"] = {254}} -- Bursting Shot
	,{["id"] = 190925, ["level"] = 22, ["specs"] = {255}} -- Harpoon
	,{["id"] = 185789, ["level"] = 22, ["specs"] = {253}} -- Wild Call
	,{["id"] = 147362, ["level"] = 24, ["specs"] = {253, 254}} -- Counter Shot
	,{["id"] = 187707, ["level"] = 24, ["specs"] = {255}} -- Muzzle
	,{["id"] = 109304, ["level"] = 26, ["specs"] = {253, 255}} -- Exhilaration
	,{["id"] = 194291, ["level"] = 26, ["specs"] = {254}} -- Exhilaration
	,{["id"] = 187650, ["level"] = 28, ["specs"] = {255}} -- Freezing Trap
	,{["id"] = 2643, ["level"] = 28, ["specs"] = {253, 254}} -- Multi-Shot
	,{["id"] = 115939, ["level"] = 29, ["specs"] = {253}} -- Beast Cleave
	,{["id"] = 5384, ["level"] = 32} -- Feign Death
	,{["id"] = 210000, ["level"] = 32} -- Wake Up
	,{["id"] = 212658, ["level"] = 34, ["specs"] = {254}, ["subText"] = STRING_PASSIVE} -- Hunting Party
	,{["id"] = 83243, ["level"] = 34} -- Call Pet 3
	,{["id"] = 185855, ["level"] = 36, ["specs"] = {255}} -- Lacerate
	,{["id"] = 1543, ["level"] = 38} -- Flare
	,{["id"] = 19574, ["level"] = 40, ["specs"] = {253}} -- Bestial Wrath
	,{["id"] = 193526, ["level"] = 40, ["specs"] = {254}} -- Trueshot
	,{["id"] = 61648, ["level"] = 40} -- Aspect of the Chameleon
	,{["id"] = 125050, ["level"] = 40} -- Fetch
	,{["id"] = 127933, ["level"] = 40} -- Fireworks
	,{["id"] = 209997, ["level"] = 40} -- Play Dead
	,{["id"] = 34477, ["level"] = 42, ["specs"] = {253, 254}} -- Misdirection
	,{["id"] = 187698, ["level"] = 42, ["specs"] = {255}} -- Tar Trap
	,{["id"] = 186289, ["level"] = 44, ["specs"] = {255}} -- Aspect of the Eagle
	,{["id"] = 191433, ["level"] = 48, ["specs"] = {255}} -- Explosive Trap
	,{["id"] = 86538, ["level"] = 50, ["subText"] = STRING_PASSIVE} -- Mail Specialization
	,{["id"] = 186265, ["level"] = 50} -- Aspect of the Turtle
	,{["id"] = 187708, ["level"] = 54, ["specs"] = {255}} -- Carve
	,{["id"] = 56315, ["level"] = 58, ["specs"] = {253}, ["subText"] = STRING_PASSIVE} -- Kindred Spirits
	,{["id"] = 35110, ["level"] = 62, ["specs"] = {254}, ["subText"] = STRING_PASSIVE} -- Bombardment
	,{["id"] = 83244, ["level"] = 62} -- Call Pet 4
	,{["id"] = 191334, ["level"] = 78, ["specs"] = {255}, ["subText"] = STRING_PASSIVE} -- Mastery: Hunting Companion
	,{["id"] = 76657, ["level"] = 78, ["specs"] = {253}, ["subText"] = STRING_PASSIVE} -- Mastery: Master of Beasts
	,{["id"] = 193468, ["level"] = 78, ["specs"] = {254}, ["subText"] = STRING_PASSIVE} -- Mastery: Sniper Training
	,{["id"] = 83245, ["level"] = 82} -- Call Pet 5
};

_addonData.Skills = hunterSkills;
_addonData.Specs = hunterSpecs;

end

--
-- PRIEST
--

if (playerClass == "PRIEST") then
local priestSpecs = {
	256 -- Disciplin
	,257 -- Holy
	,258 -- Shadow
};

local priestSkills = {
	{["id"] = 589, ["level"] = 3, ["specs"] = {256, 258}} -- Shadow Word: Pain
	,{["id"] = 17, ["level"] = 5, ["specs"] = {256, 258}} -- Power Word: Shield
	,{["id"] = 81782, ["level"] = 5} -- Power Word: Barrier
	,{["id"] = 200829, ["level"] = 7, ["specs"] = {256}} -- Plea
	,{["id"] = 2061, ["level"] = 10, ["specs"] = {257}} -- Flash Heal
	,{["id"] = 15407, ["level"] = 10, ["specs"] = {258}} -- Mind Flay
	,{["id"] = 47540, ["level"] = 10, ["specs"] = {256}} -- Penance
	,{["id"] = 139, ["level"] = 10, ["specs"] = {257}} -- Renew
	,{["id"] = 194249, ["level"] = 10, ["specs"] = {258}} -- Voidform
	,{["id"] = 14914, ["level"] = 12, ["specs"] = {257}} -- Holy Fire
	,{["id"] = 8122, ["level"] = 12, ["specs"] = {256, 258}} -- Psychic Scream
	,{["id"] = 2006, ["level"] = 14} -- Resurrection
	,{["id"] = 8092, ["level"] = 16, ["specs"] = {258}} -- Mind Blast
	,{["id"] = 2050, ["level"] = 18, ["specs"] = {257}} -- Holy Word: Serenity
	,{["id"] = 186263, ["level"] = 18, ["specs"] = {256, 258}} -- Shadow Mend
	,{["id"] = 527, ["level"] = 22, ["specs"] = {256, 257}} -- Purify
	,{["id"] = 213634, ["level"] = 22, ["specs"] = {258}} -- Purify Disease
	,{["id"] = 81749, ["level"] = 24, ["specs"] = {256}, ["subText"] = STRING_PASSIVE} -- Atonement
	,{["id"] = 88625, ["level"] = 24, ["specs"] = {257}} -- Holy Word: Chastise
	,{["id"] = 34914, ["level"] = 24, ["specs"] = {258}} -- Vampiric Touch
	,{["id"] = 528, ["level"] = 26} -- Dispel Magic
	,{["id"] = 1706, ["level"] = 28, ["specs"] = {256, 257, 258}} -- Levitate
	,{["id"] = 48045, ["level"] = 28, ["specs"] = {258}} -- Mind Sear
	,{["id"] = 20711, ["level"] = 29, ["specs"] = {257}, ["subText"] = STRING_PASSIVE} -- Spirit of Redemption
	,{["id"] = 9484, ["level"] = 32} -- Shackle Undead
	,{["id"] = 45243, ["level"] = 34, ["specs"] = {256, 257}, ["subText"] = STRING_PASSIVE} -- Focused Will
	,{["id"] = 2060, ["level"] = 34, ["specs"] = {257}} -- Heal
	,{["id"] = 78203, ["level"] = 34, ["specs"] = {258}, ["subText"] = STRING_PASSIVE} -- Shadowy Apparitions
	,{["id"] = 605, ["level"] = 36} -- Mind Control
	,{["id"] = 586, ["level"] = 38} -- Fade
	,{["id"] = 596, ["level"] = 40, ["specs"] = {257}} -- Prayer of Healing
	,{["id"] = 34433, ["level"] = 40, ["specs"] = {256, 258}} -- Shadowfiend
	,{["id"] = 2096, ["level"] = 42, ["specs"] = {256, 258}} -- Mind Vision
	,{["id"] = 63733, ["level"] = 42, ["specs"] = {257}} -- Serendipity
	,{["id"] = 212036, ["level"] = 44, ["specs"] = {256, 257}} -- Mass Resurrection
	,{["id"] = 194509, ["level"] = 46, ["specs"] = {256}} -- Power Word: Radiance
	,{["id"] = 32379, ["level"] = 46, ["specs"] = {258}} -- Shadow Word: Death
	,{["id"] = 34861, ["level"] = 50, ["specs"] = {257}} -- Holy Word: Sanctify
	,{["id"] = 47536, ["level"] = 50, ["specs"] = {256}, ["subText"] = STRING_PASSIVE} -- Rapture
	,{["id"] = 15487, ["level"] = 50, ["specs"] = {258}} -- Silence
	,{["id"] = 89745, ["level"] = 50, ["subText"] = STRING_PASSIVE} -- Mysticism
	,{["id"] = 132157, ["level"] = 54, ["specs"] = {257}} -- Holy Nova
	,{["id"] = 33206, ["level"] = 56, ["specs"] = {256}} -- Pain Suppression
	,{["id"] = 47585, ["level"] = 58, ["specs"] = {258}} -- Dispersion
	,{["id"] = 33076, ["level"] = 58, ["specs"] = {257}} -- Prayer of Mending
	,{["id"] = 47788, ["level"] = 65, ["specs"] = {257}} -- Guardian Spirit
	,{["id"] = 62618, ["level"] = 65, ["specs"] = {256}} -- Power Word: Barrier
	,{["id"] = 15286, ["level"] = 65, ["specs"] = {258}} -- Vampiric Embrace
	,{["id"] = 32375, ["level"] = 72} -- Mass Dispel
	,{["id"] = 64843, ["level"] = 76, ["specs"] = {257}} -- Divine Hymn
	,{["id"] = 77484, ["level"] = 78, ["specs"] = {256}, ["subText"] = STRING_PASSIVE} -- Mastery: Absolution
	,{["id"] = 77485, ["level"] = 78, ["specs"] = {257}, ["subText"] = STRING_PASSIVE} -- Mastery: Echo of Light
	,{["id"] = 77486, ["level"] = 78, ["specs"] = {258}, ["subText"] = STRING_PASSIVE} -- Mastery: Madness
	,{["id"] = 73325, ["level"] = 83, ["specs"] = {256, 257}} -- Leap of Faith
};

_addonData.Skills = priestSkills;
_addonData.Specs = priestSpecs;

end

--
-- ROGUE
--

if (playerClass == "ROGUE") then
local rogueSpecs = {
	259 -- Assassination
	,260 -- Combat
	,261 -- Subtlety
};

local rogueSkills = {
	{["id"] = 2823, ["level"] = 3, ["specs"] = {259}} -- Deadly Poison
	,{["id"] = 32645, ["level"] = 4, ["specs"] = {259}} -- Envenom
	,{["id"] = 1784, ["level"] = 5, ["specs"] = {259, 260, 261}} -- Stealth
	,{["id"] = 5277, ["level"] = 8, ["specs"] = {259, 261}} -- Evasion
	,{["id"] = 84601, ["level"] = 10, ["specs"] = {259}, ["subText"] = STRING_PASSIVE} -- Assassin's Resolve
	,{["id"] = 53, ["level"] = 10, ["specs"] = {261}} -- Backstab
	,{["id"] = 79152, ["level"] = 10, ["specs"] = {261}, ["subText"] = STRING_PASSIVE} -- Energetic Recovery
	,{["id"] = 196819, ["level"] = 10, ["specs"] = {261}} -- Eviscerate
	,{["id"] = 14117, ["level"] = 10, ["specs"] = {259}, ["subText"] = STRING_PASSIVE} -- Improved Poisons
	,{["id"] = 185565, ["level"] = 10, ["specs"] = {259}} -- Poisoned Knife
	,{["id"] = 199754, ["level"] = 10, ["specs"] = {260}} -- Riposte
	,{["id"] = 2098, ["level"] = 10, ["specs"] = {260}} -- Run Through
	,{["id"] = 193315, ["level"] = 10, ["specs"] = {260}} -- Saber Slash
	,{["id"] = 61329, ["level"] = 10, ["specs"] = {260}, ["subText"] = STRING_PASSIVE} -- Vitality
	,{["id"] = 185763, ["level"] = 11, ["specs"] = {260}} -- Pistol Shot
	,{["id"] = 114014, ["level"] = 11, ["specs"] = {261}} -- Shuriken Toss
	,{["id"] = 6770, ["level"] = 12, ["specs"] = {259, 260, 261}} -- Sap
	,{["id"] = 36554, ["level"] = 13, ["specs"] = {259, 261}} -- Shadowstep
	,{["id"] = 8676, ["level"] = 14, ["specs"] = {260}} -- Ambush
	,{["id"] = 185311, ["level"] = 14} -- Crimson Vial
	,{["id"] = 921, ["level"] = 16, ["specs"] = {259, 260, 261}} -- Pick Pocket
	,{["id"] = 1766, ["level"] = 18} -- Kick
	,{["id"] = 3408, ["level"] = 19, ["specs"] = {259}} -- Crippling Poison
	,{["id"] = 51667, ["level"] = 20, ["specs"] = {259}, ["subText"] = STRING_PASSIVE} -- Cut to the Chase
	,{["id"] = 1776, ["level"] = 22, ["specs"] = {260}} -- Gouge
	,{["id"] = 1943, ["level"] = 22, ["specs"] = {259}} -- Rupture
	,{["id"] = 185438, ["level"] = 22, ["specs"] = {261}} -- Shadowstrike
	,{["id"] = 79134, ["level"] = 22, ["specs"] = {259}, ["subText"] = STRING_PASSIVE} -- Venomous Wounds
	,{["id"] = 1804, ["level"] = 24} -- Pick Lock
	,{["id"] = 199804, ["level"] = 25, ["specs"] = {260}} -- Between the Eyes
	,{["id"] = 8679, ["level"] = 25, ["specs"] = {259}} -- Wound Poison
	,{["id"] = 2983, ["level"] = 26} -- Sprint
	,{["id"] = 14161, ["level"] = 27, ["specs"] = {260}, ["subText"] = STRING_PASSIVE} -- Ruthlessness
	,{["id"] = 14190, ["level"] = 27, ["specs"] = {259}, ["subText"] = STRING_PASSIVE} -- Seal Fate
	,{["id"] = 196912, ["level"] = 27, ["specs"] = {261}, ["subText"] = STRING_PASSIVE} -- Shadow Techniques
	,{["id"] = 1725, ["level"] = 28, ["specs"] = {259, 260, 261}} -- Distract
	,{["id"] = 1833, ["level"] = 29, ["specs"] = {259, 260, 261}} -- Cheap Shot
	,{["id"] = 1856, ["level"] = 32, ["specs"] = {259, 260, 261}} -- Vanish
	,{["id"] = 35551, ["level"] = 34, ["specs"] = {260}, ["subText"] = STRING_PASSIVE} -- Combat Potency
	,{["id"] = 212283, ["level"] = 34, ["specs"] = {261}} -- Symbols of Death
	,{["id"] = 193316, ["level"] = 36, ["specs"] = {260}} -- Roll the Bones
	,{["id"] = 185313, ["level"] = 36, ["specs"] = {261}} -- Shadow Dance
	,{["id"] = 2094, ["level"] = 38, ["specs"] = {260, 261}} -- Blind
	,{["id"] = 408, ["level"] = 40, ["specs"] = {259, 261}} -- Kidney Shot
	,{["id"] = 185314, ["level"] = 42, ["specs"] = {261}, ["subText"] = STRING_PASSIVE} -- Deepening Shadows
	,{["id"] = 2836, ["level"] = 42} -- Detect Traps
	,{["id"] = 1966, ["level"] = 44} -- Feint
	,{["id"] = 195452, ["level"] = 46, ["specs"] = {261}} -- Nightblade
	,{["id"] = 13877, ["level"] = 48, ["specs"] = {260}} -- Blade Flurry
	,{["id"] = 703, ["level"] = 48, ["specs"] = {259}} -- Garrote
	,{["id"] = 86092, ["level"] = 50, ["subText"] = STRING_PASSIVE} -- Leather Specialization
	,{["id"] = 199740, ["level"] = 54, ["specs"] = {260}} -- Bribe
	,{["id"] = 58423, ["level"] = 54, ["specs"] = {261}, ["subText"] = STRING_PASSIVE} -- Relentless Strikes
	,{["id"] = 31224, ["level"] = 58} -- Cloak of Shadows
	,{["id"] = 31209, ["level"] = 62, ["subText"] = STRING_PASSIVE} -- Fleet Footed
	,{["id"] = 1860, ["level"] = 62, ["subText"] = STRING_PASSIVE} -- Safe Fall
	,{["id"] = 57934, ["level"] = 64} -- Tricks of the Trade
	,{["id"] = 51723, ["level"] = 66, ["specs"] = {259}} -- Fan of Knives
	,{["id"] = 197835, ["level"] = 66, ["specs"] = {261}} -- Shuriken Storm
	,{["id"] = 13750, ["level"] = 72, ["specs"] = {260}} -- Adrenaline Rush
	,{["id"] = 121471, ["level"] = 72, ["specs"] = {261}} -- Shadow Blades
	,{["id"] = 79140, ["level"] = 72, ["specs"] = {259}} -- Vendetta
	,{["id"] = 76808, ["level"] = 78, ["specs"] = {261}, ["subText"] = STRING_PASSIVE} -- Mastery: Executioner
	,{["id"] = 76806, ["level"] = 78, ["specs"] = {260}, ["subText"] = STRING_PASSIVE} -- Mastery: Main Gauche
	,{["id"] = 76803, ["level"] = 78, ["specs"] = {259}, ["subText"] = STRING_PASSIVE} -- Mastery: Potent Poisons
};

_addonData.Skills = rogueSkills;
_addonData.Specs = rogueSpecs;

end

--
-- SHAMAN
--

if (playerClass == "SHAMAN") then
local shamanSpecs = {
	262 -- Elemental
	,263 -- Enhancement
	,264 -- Restoration
};

local shamanSkills = {
	{["id"] = 8042, ["level"] = 3, ["specs"] = {262}} -- Earth Shock
	,{["id"] = 188838, ["level"] = 3, ["specs"] = {264}} -- Flame Shock
	,{["id"] = 188389, ["level"] = 5, ["specs"] = {262}} -- Flame Shock
	,{["id"] = 8004, ["level"] = 7, ["specs"] = {262, 264}} -- Healing Surge
	,{["id"] = 188070, ["level"] = 7, ["specs"] = {263}} -- Healing Surge
	,{["id"] = 157444, ["level"] = 10, ["specs"] = {263}} -- Critical Strikes
	,{["id"] = 86629, ["level"] = 10, ["specs"] = {263}, ["subText"] = STRING_PASSIVE} -- Dual Wield
	,{["id"] = 60188, ["level"] = 10, ["specs"] = {262}, ["subText"] = STRING_PASSIVE} -- Elemental Fury
	,{["id"] = 60103, ["level"] = 10, ["specs"] = {263}} -- Lava Lash
	,{["id"] = 61295, ["level"] = 10, ["specs"] = {264}} -- Riptide
	,{["id"] = 193786, ["level"] = 10, ["specs"] = {263}} -- Rockbiter
	,{["id"] = 123099, ["level"] = 10, ["specs"] = {262}} -- Spiritual Insight
	,{["id"] = 193796, ["level"] = 12, ["specs"] = {263}} -- Flametongue
	,{["id"] = 51505, ["level"] = 12, ["specs"] = {262, 264}} -- Lava Burst
	,{["id"] = 5394, ["level"] = 13, ["specs"] = {264}} -- Healing Stream Totem
	,{["id"] = 2008, ["level"] = 14} -- Ancestral Spirit
	,{["id"] = 51490, ["level"] = 16, ["specs"] = {262}} -- Thunderstorm
	,{["id"] = 2645, ["level"] = 16} -- Ghost Wolf
	,{["id"] = 51886, ["level"] = 18, ["specs"] = {262, 263}} -- Cleanse Spirit
	,{["id"] = 77130, ["level"] = 18, ["specs"] = {264}} -- Purify Spirit
	,{["id"] = 196834, ["level"] = 19, ["specs"] = {263}} -- Frostbrand
	,{["id"] = 57994, ["level"] = 22, ["specs"] = {262, 263, 264}} -- Wind Shear
	,{["id"] = 546, ["level"] = 24} -- Water Walking
	,{["id"] = 1064, ["level"] = 26, ["specs"] = {264}} -- Chain Heal
	,{["id"] = 196840, ["level"] = 26, ["specs"] = {262}} -- Frost Shock
	,{["id"] = 17364, ["level"] = 26, ["specs"] = {263}} -- Stormstrike
	,{["id"] = 421, ["level"] = 28, ["specs"] = {264}} -- Chain Lightning
	,{["id"] = 188443, ["level"] = 28, ["specs"] = {262}} -- Chain Lightning
	,{["id"] = 187874, ["level"] = 28, ["specs"] = {263}} -- Crash Lightning
	,{["id"] = 33757, ["level"] = 30, ["specs"] = {263}} -- Windfury
	,{["id"] = 20608, ["level"] = 32, ["subText"] = STRING_PASSIVE} -- Reincarnation
	,{["id"] = 556, ["level"] = 34} -- Astral Recall
	,{["id"] = 6196, ["level"] = 36} -- Far Sight
	,{["id"] = 77756, ["level"] = 38, ["specs"] = {262, 264}} -- Lava Surge
	,{["id"] = 195255, ["level"] = 38, ["specs"] = {263}} -- Stormlash
	,{["id"] = 16164, ["level"] = 40, ["specs"] = {262}} -- Elemental Focus
	,{["id"] = 16196, ["level"] = 40, ["specs"] = {264}} -- Resurgence
	,{["id"] = 201845, ["level"] = 40, ["specs"] = {263}} -- Stormbringer
	,{["id"] = 51514, ["level"] = 42} -- Hex
	,{["id"] = 212048, ["level"] = 44, ["specs"] = {264}} -- Ancestral Vision
	,{["id"] = 108271, ["level"] = 44} -- Astral Shift
	,{["id"] = 51533, ["level"] = 48, ["specs"] = {263}} -- Feral Spirit
	,{["id"] = 198067, ["level"] = 48, ["specs"] = {262}} -- Fire Elemental
	,{["id"] = 73920, ["level"] = 48, ["specs"] = {264}} -- Healing Rain
	,{["id"] = 86099, ["level"] = 50, ["specs"] = {263}, ["subText"] = STRING_PASSIVE} -- Mail Specialization
	,{["id"] = 86100, ["level"] = 50, ["specs"] = {264}, ["subText"] = STRING_PASSIVE} -- Mail Specialization
	,{["id"] = 86108, ["level"] = 50, ["specs"] = {262}, ["subText"] = STRING_PASSIVE} -- Mail Specialization
	,{["id"] = 51564, ["level"] = 50, ["specs"] = {264}} -- Tidal Waves
	,{["id"] = 61882, ["level"] = 52, ["specs"] = {262}} -- Earthquake Totem
	,{["id"] = 187880, ["level"] = 52, ["specs"] = {263}} -- Maelstrom Weapon
	,{["id"] = 108280, ["level"] = 54, ["specs"] = {264}} -- Healing Tide Totem
	,{["id"] = 77472, ["level"] = 56, ["specs"] = {264}} -- Healing Wave
	,{["id"] = 370, ["level"] = 58} -- Purge
	,{["id"] = 98008, ["level"] = 62, ["specs"] = {264}} -- Spirit Link Totem
	,{["id"] = 2825, ["level"] = 65} -- Bloodlust
	,{["id"] = 32182, ["level"] = 65} -- Heroism
	,{["id"] = 198103, ["level"] = 72, ["specs"] = {262}} -- Earth Elemental
	,{["id"] = 58875, ["level"] = 72, ["specs"] = {263}} -- Spirit Walk
	,{["id"] = 79206, ["level"] = 72, ["specs"] = {264}} -- Spiritwalker's Grace
	,{["id"] = 77226, ["level"] = 78, ["specs"] = {264}, ["subText"] = STRING_PASSIVE} -- Mastery: Deep Healing
	,{["id"] = 168534, ["level"] = 78, ["specs"] = {262}, ["subText"] = STRING_PASSIVE} -- Mastery: Elemental Overload
	,{["id"] = 77223, ["level"] = 78, ["specs"] = {263}, ["subText"] = STRING_PASSIVE} -- Mastery: Enhanced Elements
};

_addonData.Skills = shamanSkills;
_addonData.Specs = shamanSpecs;

end

--
-- WARLOCK
--

if (playerClass == "WARLOCK") then
local warlockSpecs = {
	265 -- Affliction
	,266 -- Demonology
	,267 -- Destruction
};

local warlockSkills = {
	{["id"] = 172, ["level"] = 3, ["specs"] = {265}} -- Corruption
	,{["id"] = 6201, ["level"] = 5} -- Create Healthstone
	,{["id"] = 980, ["level"] = 6, ["specs"] = {265}} -- Agony
	,{["id"] = 697, ["level"] = 8} -- Summon Voidwalker
	,{["id"] = 105174, ["level"] = 10, ["specs"] = {266}} -- Hand of Gul'dan
	,{["id"] = 348, ["level"] = 10, ["specs"] = {267}} -- Immolate
	,{["id"] = 29722, ["level"] = 10, ["specs"] = {267}} -- Incinerate
	,{["id"] = 30108, ["level"] = 10, ["specs"] = {265}} -- Unstable Affliction
	,{["id"] = 93375, ["level"] = 10, ["subText"] = STRING_PASSIVE} -- Control Demon
	,{["id"] = 193396, ["level"] = 12, ["specs"] = {266}} -- Demonic Empowerment
	,{["id"] = 205183, ["level"] = 12, ["specs"] = {265}, ["subText"] = STRING_PASSIVE} -- Secrets of the Necrolyte
	,{["id"] = 104316, ["level"] = 14, ["specs"] = {266}} -- Call Dreadstalkers
	,{["id"] = 17962, ["level"] = 14, ["specs"] = {267}} -- Conflagrate
	,{["id"] = 5782, ["level"] = 16} -- Fear
	,{["id"] = 20707, ["level"] = 18} -- Soulstone
	,{["id"] = 755, ["level"] = 19} -- Health Funnel
	,{["id"] = 5784, ["level"] = 20} -- Felsteed
	,{["id"] = 126, ["level"] = 22} -- Eye of Kilrogg
	,{["id"] = 5697, ["level"] = 24} -- Unending Breath
	,{["id"] = 116858, ["level"] = 26, ["specs"] = {267}} -- Chaos Bolt
	,{["id"] = 603, ["level"] = 26, ["specs"] = {266}} -- Doom
	,{["id"] = 712, ["level"] = 28} -- Summon Succubus
	,{["id"] = 119898, ["level"] = 31} -- Command Demon
	,{["id"] = 710, ["level"] = 32} -- Banish
	,{["id"] = 1454, ["level"] = 34, ["specs"] = {265, 266, 267}} -- Life Tap
	,{["id"] = 691, ["level"] = 35} -- Summon Felhunter
	,{["id"] = 193440, ["level"] = 36, ["specs"] = {266}} -- Demonwrath
	,{["id"] = 5740, ["level"] = 38, ["specs"] = {267}} -- Rain of Fire
	,{["id"] = 27243, ["level"] = 38, ["specs"] = {265}} -- Seed of Corruption
	,{["id"] = 80240, ["level"] = 40, ["specs"] = {267}} -- Havoc
	,{["id"] = 30146, ["level"] = 40, ["specs"] = {266}} -- Summon Felguard
	,{["id"] = 23161, ["level"] = 40} -- Dreadsteed
	,{["id"] = 108415, ["level"] = 42, ["specs"] = {266}} -- Soul Link
	,{["id"] = 86091, ["level"] = 50, ["subText"] = STRING_PASSIVE} -- Nethermancy
	,{["id"] = 1122, ["level"] = 50} -- Summon Infernal
	,{["id"] = 1098, ["level"] = 54} -- Enslave Demon
	,{["id"] = 18540, ["level"] = 58} -- Summon Doomguard
	,{["id"] = 104773, ["level"] = 62} -- Unending Resolve
	,{["id"] = 29893, ["level"] = 65} -- Create Soulwell
	,{["id"] = 698, ["level"] = 72} -- Ritual of Summoning
	,{["id"] = 77220, ["level"] = 78, ["specs"] = {267}, ["subText"] = STRING_PASSIVE} -- Mastery: Chaotic Energies
	,{["id"] = 77219, ["level"] = 78, ["specs"] = {266}, ["subText"] = STRING_PASSIVE} -- Mastery: Master Demonologist
	,{["id"] = 77215, ["level"] = 78, ["specs"] = {265}, ["subText"] = STRING_PASSIVE} -- Mastery: Potent Afflictions
	,{["id"] = 111771, ["level"] = 87} -- Demonic Gateway
};

_addonData.Skills = warlockSkills;
_addonData.Specs = warlockSpecs;

end

--
-- MONK
--

if (playerClass == "MONK") then
local monkSpecs = {
	268		-- Brewmaster
	,269	-- Windwalker
	,270	-- Mistweaver
};

local monkSkills = {
	{["id"] = 205523, ["level"] = 3, ["specs"] = {268}} -- Blackout Strike
	,{["id"] = 137384, ["level"] = 3, ["specs"] = {269}, ["subText"] = STRING_PASSIVE} -- Combo Breaker
	,{["id"] = 100784, ["level"] = 3} -- Blackout Kick
	,{["id"] = 109132, ["level"] = 5} -- Roll
	,{["id"] = 116694, ["level"] = 8, ["specs"] = {268, 269, 270}} -- Effuse
	,{["id"] = 124682, ["level"] = 10, ["specs"] = {270}} -- Enveloping Mist
	,{["id"] = 101545, ["level"] = 10, ["specs"] = {269}} -- Flying Serpent Kick
	,{["id"] = 121253, ["level"] = 10, ["specs"] = {268}} -- Keg Smash
	,{["id"] = 193884, ["level"] = 10, ["specs"] = {270}} -- Soothing Mist
	,{["id"] = 115069, ["level"] = 10, ["specs"] = {268}, ["subText"] = STRING_PASSIVE} -- Stagger
	,{["id"] = 116645, ["level"] = 10, ["specs"] = {270}, ["subText"] = STRING_PASSIVE} -- Teachings of the Monastery
	,{["id"] = 209525, ["level"] = 10} -- Soothing Mist
	,{["id"] = 220357, ["level"] = 12, ["specs"] = {269}} -- Cyclone Strikes
	,{["id"] = 157411, ["level"] = 12, ["specs"] = {269}, ["subText"] = STRING_PASSIVE} -- Windwalking
	,{["id"] = 115546, ["level"] = 13} -- Provoke
	,{["id"] = 115178, ["level"] = 14} -- Resuscitate
	,{["id"] = 115181, ["level"] = 18, ["specs"] = {268}} -- Breath of Fire
	,{["id"] = 107428, ["level"] = 18, ["specs"] = {269, 270}} -- Rising Sun Kick
	,{["id"] = 128595, ["level"] = 20, ["specs"] = {269}, ["subText"] = STRING_PASSIVE} -- Combat Conditioning
	,{["id"] = 126892, ["level"] = 20} -- Zen Pilgrimage
	,{["id"] = 115450, ["level"] = 22, ["specs"] = {270}} -- Detox
	,{["id"] = 218164, ["level"] = 22, ["specs"] = {268, 269}} -- Detox
	,{["id"] = 122470, ["level"] = 22, ["specs"] = {269}} -- Touch of Karma
	,{["id"] = 115203, ["level"] = 24, ["specs"] = {268}} -- Fortifying Brew
	,{["id"] = 115151, ["level"] = 24, ["specs"] = {270}} -- Renewing Mist
	,{["id"] = 115080, ["level"] = 24, ["specs"] = {269}} -- Touch of Death
	,{["id"] = 116095, ["level"] = 25, ["specs"] = {269}} -- Disable
	,{["id"] = 116092, ["level"] = 26, ["specs"] = {269}, ["subText"] = STRING_PASSIVE} -- Afterlife
	,{["id"] = 115072, ["level"] = 26, ["specs"] = {268}} -- Expel Harm
	,{["id"] = 113656, ["level"] = 28, ["specs"] = {269}} -- Fists of Fury
	,{["id"] = 115308, ["level"] = 28, ["specs"] = {268}} -- Ironskin Brew
	,{["id"] = 116849, ["level"] = 28, ["specs"] = {270}} -- Life Cocoon
	,{["id"] = 126895, ["level"] = 30} -- Zen Pilgrimage: Return
	,{["id"] = 116705, ["level"] = 32, ["specs"] = {268, 269}} -- Spear Hand Strike
	,{["id"] = 116670, ["level"] = 32, ["specs"] = {270}} -- Vivify
	,{["id"] = 117952, ["level"] = 36} -- Crackling Jade Lightning
	,{["id"] = 124502, ["level"] = 40, ["specs"] = {268}, ["subText"] = STRING_PASSIVE} -- Gift of the Ox
	,{["id"] = 101546, ["level"] = 40, ["specs"] = {269, 270}} -- Spinning Crane Kick
	,{["id"] = 212051, ["level"] = 44, ["specs"] = {270}} -- Reawaken
	,{["id"] = 216519, ["level"] = 45, ["specs"] = {268}, ["subText"] = STRING_PASSIVE} -- Celestial Fortune
	,{["id"] = 115078, ["level"] = 48} -- Paralysis
	,{["id"] = 120224, ["level"] = 50, ["specs"] = {270}, ["subText"] = STRING_PASSIVE} -- Leather Specialization
	,{["id"] = 120225, ["level"] = 50, ["specs"] = {268}, ["subText"] = STRING_PASSIVE} -- Leather Specialization
	,{["id"] = 120227, ["level"] = 50, ["specs"] = {269}, ["subText"] = STRING_PASSIVE} -- Leather Specialization
	,{["id"] = 119582, ["level"] = 54, ["specs"] = {268}} -- Purifying Brew
	,{["id"] = 116680, ["level"] = 54, ["specs"] = {270}} -- Thunder Focus Tea
	,{["id"] = 191837, ["level"] = 58, ["specs"] = {270}} -- Essence Font
	,{["id"] = 115310, ["level"] = 65, ["specs"] = {270}} -- Revival
	,{["id"] = 137639, ["level"] = 65, ["specs"] = {269}} -- Storm, Earth, and Fire
	,{["id"] = 115176, ["level"] = 65, ["specs"] = {268}} -- Zen Meditation
	,{["id"] = 115636, ["level"] = 78, ["specs"] = {269}, ["subText"] = STRING_PASSIVE} -- Mastery: Combo Strikes
	,{["id"] = 117906, ["level"] = 78, ["specs"] = {268}, ["subText"] = STRING_PASSIVE} -- Mastery: Elusive Brawler
	,{["id"] = 117907, ["level"] = 78, ["specs"] = {270}, ["subText"] = STRING_PASSIVE} -- Mastery: Gust of Mists
	,{["id"] = 101643, ["level"] = 87} -- Transcendence
	,{["id"] = 119996, ["level"] = 87} -- Transcendence: Transfer
};

_addonData.Skills = monkSkills;
_addonData.Specs = monkSpecs;

end

--
-- DEMON HUNTER
--

if (playerClass == "DEMONHUNTER") then
local dhSpecs = {
	577 -- Havoc
	, 581 -- Vengeance
};

local dhSkills = {
	{["id"] = 207197, ["level"] = 76, ["specs"] = {581}, ["subText"] = STRING_PASSIVE} -- Riposte
	,{["id"] = 218256, ["level"] = 100, ["specs"] = {581}} -- Empower Wards
	,{["id"] = 202138, ["level"] = 100, ["specs"] = {581}} -- Sigil of Chains
	,{["id"] = 207684, ["level"] = 100, ["specs"] = {581}} -- Sigil of Misery
	,{["id"] = 202137, ["level"] = 100, ["specs"] = {581}} -- Sigil of Silence
};

_addonData.Skills = dhSkills;
_addonData.Specs = dhSpecs;

end
