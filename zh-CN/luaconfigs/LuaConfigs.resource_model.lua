-- params : ...
-- function num : 0 , upvalues : _ENV
local resource_model = {
[1001] = {atk1_frames = 28, atk1_trigger_frames = 9, atk2_frames = 28, atk2_trigger_frames = 8, res_Name = "persicaria"}
, 
[1002] = {atk1_trigger_frames = 10, atk2_frames = 29, atk2_trigger_frames = 11, id = 1002, res_Name = "anna"}
, 
[1003] = {atk1_frames = 28, atk1_trigger_frames = 10, atk2_frames = 28, atk2_trigger_frames = 21, id = 1003, res_Name = "sol"}
, 
[1004] = {atk1_frames = 23, atk1_trigger_frames = 8, atk2_frames = 23, atk2_trigger_frames = 8, id = 1004, res_Name = "simo"}
, 
[1005] = {atk1_frames = 22, atk2_frames = 28, atk2_trigger_frames = 8, id = 1005, res_Name = "croque"}
, 
[1006] = {atk1_frames = 28, atk2_frames = 28, id = 1006, res_Name = "fresnel"}
, 
[1007] = {atk1_frames = 26, atk1_trigger_frames = 5, atk2_frames = 26, atk2_trigger_frames = 5, id = 1007, res_Name = "chelsea"}
, 
[1008] = {atk1_frames = 33, atk1_trigger_frames = 18, atk2_frames = 55, atk2_trigger_frames = 42, id = 1008, res_Name = "gin"}
, 
[1009] = {atk1_frames = 22, atk1_trigger_frames = 8, atk2_frames = 19, atk2_trigger_frames = 9, id = 1009, res_Name = "mai"}
, 
[1010] = {atk1_frames = 40, atk1_trigger_frames = 25, atk2_frames = 40, atk2_trigger_frames = 25, id = 1010, res_Name = "evelyn"}
, 
[1012] = {atk2_frames = 22, atk2_trigger_frames = 10, id = 1012, res_Name = "max"}
, 
[1013] = {atk1_frames = 31, atk1_trigger_frames = 7, atk2_frames = 30, id = 1013, res_Name = "betty"}
, 
[1016] = {atk1_trigger_frames = 5, atk2_frames = 23, id = 1016, res_Name = "banxsy"}
, 
[1017] = {atk1_frames = 22, atk2_frames = 22, atk2_trigger_frames = 6, id = 1017, res_Name = "angela"}
, 
[1020] = {atk1_frames = 38, atk1_trigger_frames = 12, atk2_frames = 38, atk2_trigger_frames = 12, id = 1020, res_Name = "yanny"}
, 
[1021] = {atk1_frames = 22, atk2_frames = 20, id = 1021, res_Name = "groove"}
, 
[1023] = {atk1_frames = 22, atk1_trigger_frames = 12, atk2_frames = 22, atk2_trigger_frames = 10, id = 1023, res_Name = "bonee"}
, 
[1027] = {atk1_frames = 32, atk2_frames = 32, atk2_trigger_frames = 6, id = 1027, res_Name = "zion"}
, 
[1031] = {atk1_frames = 30, atk1_trigger_frames = 8, atk2_frames = 30, atk2_trigger_frames = 8, id = 1031, res_Name = "imhotep"}
, 
[1034] = {atk1_frames = 29, atk2_frames = 31, atk2_trigger_frames = 8, id = 1034}
, 
[1035] = {atk1_frames = 17, atk1_trigger_frames = 5, atk2_frames = 20, id = 1035, res_Name = "jessie"}
, 
[1036] = {atk1_frames = 15, atk1_trigger_frames = 2, atk2_frames = 15, atk2_trigger_frames = 5, id = 1036, res_Name = "lam"}
, 
[1037] = {atk1_frames = 20, atk1_trigger_frames = 7, atk2_frames = 25, atk2_trigger_frames = 8, id = 1037, res_Name = "hubble"}
, 
[1038] = {atk1_frames = 22, atk1_trigger_frames = 5, atk2_frames = 22, atk2_trigger_frames = 5, id = 1038, res_Name = "sakuya"}
, 
[1039] = {atk1_frames = 33, atk2_frames = 33, atk2_trigger_frames = 10, id = 1039, res_Name = "centaureissi"}
, 
[2001] = {atk1_frames = 18, atk2_frames = 18, id = 2001, res_Name = "raider"}
, 
[2002] = {atk1_frames = 18, atk1_trigger_frames = 4, atk2_frames = 18, atk2_trigger_frames = 4, base_move_spd = 50, id = 2002, res_Name = "purger"}
, 
[2003] = {atk1_frames = 23, atk1_trigger_frames = 12, atk2_frames = 23, atk2_trigger_frames = 12, base_move_spd = 120, id = 2003, res_Name = "patience"}
, 
[2004] = {atk1_frames = 28, atk1_trigger_frames = 14, atk2_frames = 28, atk2_trigger_frames = 14, id = 2004, res_Name = "reverence"}
, 
[2005] = {atk1_frames = 23, atk1_trigger_frames = 12, atk2_frames = 28, atk2_trigger_frames = 13, id = 2005, res_Name = "faith"}
, 
[2006] = {atk1_trigger_frames = 10, atk2_trigger_frames = 10, id = 2006, res_Name = "refactor"}
, 
[2007] = {atk1_trigger_frames = 9, atk2_trigger_frames = 9, id = 2007, res_Name = "defender"}
, 
[2008] = {atk1_frames = 24, atk1_trigger_frames = 9, atk2_frames = 27, atk2_trigger_frames = 9, id = 2008, res_Name = "fortitude"}
, 
[2009] = {atk1_frames = 15, atk1_trigger_frames = 7, atk2_frames = 19, atk2_trigger_frames = 9, id = 2009, res_Name = "mara"}
, 
[2010] = {atk1_frames = 15, atk1_trigger_frames = 7, atk2_frames = 19, atk2_trigger_frames = 9, extend_res = "mara", id = 2010, res_Name = "mara-blue"}
, 
[2011] = {atk1_frames = 26, atk1_trigger_frames = 12, atk2_frames = 29, atk2_trigger_frames = 12, base_move_spd = 50, id = 2011, res_Name = "protector"}
, 
[2012] = {atk1_frames = 20, atk1_trigger_frames = 5, atk2_frames = 20, atk2_trigger_frames = 6, id = 2012, res_Name = "temperance"}
, 
[2013] = {atk1_frames = 18, atk2_frames = 18, extend_res = "raider", id = 2013, res_Name = "raider2"}
, 
[2014] = {atk1_frames = 18, atk1_trigger_frames = 4, atk2_frames = 18, atk2_trigger_frames = 4, base_move_spd = 50, extend_res = "purger", id = 2014, res_Name = "purger2"}
, 
[2015] = {atk1_trigger_frames = 9, atk2_trigger_frames = 9, extend_res = "defender", id = 2015, res_Name = "defender2"}
, 
[2016] = {atk1_frames = 26, atk1_trigger_frames = 12, atk2_frames = 29, atk2_trigger_frames = 12, extend_res = "protector", id = 2016, res_Name = "protector2"}
, 
[2017] = {atk1_trigger_frames = 10, atk2_trigger_frames = 10, extend_res = "refactor", id = 2017, res_Name = "refactor2"}
, 
[2018] = {atk1_frames = 10, atk1_trigger_frames = 10, atk2_frames = 10, atk2_trigger_frames = 10, base_move_spd = 10, id = 2018, res_Name = "portal"}
, 
[2019] = {atk1_trigger_frames = 7, id = 2019, res_Name = "beelneith"}
, 
[2020] = {atk1_frames = 30, atk1_trigger_frames = 15, atk2_frames = 30, atk2_trigger_frames = 17, base_move_spd = 80, id = 2020, res_Name = "gabrie"}
, 
[2021] = {atk1_trigger_frames = 7, id = 2021, res_Name = "hesperus"}
, 
[2022] = {atk1_frames = 25, atk1_trigger_frames = 10, atk2_frames = 25, atk2_trigger_frames = 10, id = 2022, res_Name = "hope"}
, 
[2023] = {atk1_frames = 24, atk1_trigger_frames = 9, atk2_frames = 18, atk2_trigger_frames = 8, base_move_spd = 80, id = 2023, res_Name = "love"}
, 
[2024] = {atk1_frames = 20, atk1_trigger_frames = 11, atk2_frames = 20, atk2_trigger_frames = 10, base_move_spd = 80, id = 2024, res_Name = "diligence"}
, 
[2025] = {atk1_trigger_frames = 7, base_move_spd = 80, id = 2025, res_Name = "kindness"}
, 
[2026] = {atk1_frames = 24, atk1_trigger_frames = 12, atk2_frames = 24, atk2_trigger_frames = 12, base_move_spd = 60, id = 2026, res_Name = "wisdom"}
, 
[2027] = {atk1_frames = 15, atk1_trigger_frames = 9, atk2_frames = 15, atk2_trigger_frames = 9, base_move_spd = 0, death_frames = 35, id = 2027, res_Name = "imhotep_bird"}
, 
[2028] = {atk1_frames = 17, atk1_trigger_frames = 11, atk2_frames = 17, atk2_trigger_frames = 11, base_move_spd = 0, id = 2028, res_Name = "imhotep_snake"}
, 
[3001] = {atk1_frames = 0, atk1_trigger_frames = 0, atk2_frames = 0, atk2_trigger_frames = 0, base_move_spd = 0, death_frames = 0, id = 3001, res_Name = "roadblock3"}
, 
[3002] = {atk1_frames = 0, atk1_trigger_frames = 0, atk2_frames = 0, atk2_trigger_frames = 0, base_move_spd = 0, death_frames = 0, id = 3002, res_Name = "roadblock1"}
, 
[3003] = {atk1_frames = 0, atk1_trigger_frames = 0, atk2_frames = 0, atk2_trigger_frames = 0, base_move_spd = 0, death_frames = 0, id = 3003, res_Name = "roadblock4"}
, 
[3004] = {atk1_frames = 0, atk1_trigger_frames = 0, atk2_frames = 0, atk2_trigger_frames = 0, base_move_spd = 0, death_frames = 0, id = 3004, res_Name = "roadblock2"}
, 
[3005] = {atk1_frames = 0, atk1_trigger_frames = 0, atk2_frames = 0, atk2_trigger_frames = 0, base_move_spd = 0, death_frames = 0, id = 3005, res_Name = "sector_obstacles_blue"}
, 
[3006] = {atk1_frames = 0, atk1_trigger_frames = 0, atk2_frames = 0, atk2_trigger_frames = 0, base_move_spd = 0, death_frames = 0, id = 3006, res_Name = "sector_obstacles"}
}
local __default_values = {atk1_frames = 21, atk1_trigger_frames = 6, atk2_frames = 21, atk2_trigger_frames = 7, base_move_spd = 100, death_frames = 45, extend_res = "", id = 1001, res_Name = "abigail"}
local base = {__index = __default_values, __newindex = function()
  -- function num : 0_0 , upvalues : _ENV
  error("Attempt to modify read-only table")
end
}
for k,v in pairs(resource_model) do
  setmetatable(v, base)
end
local __rawdata = {__basemetatable = base}
setmetatable(resource_model, {__index = __rawdata})
return resource_model

-- params : ...
-- function num : 0 , upvalues : _ENV
local resource_model = {
    [1001] = {
        atk1_frames = 28,
        atk1_trigger_frames = 9,
        atk2_frames = 28,
        atk2_trigger_frames = 8,
        res_Name = "persicaria"
    },
    [1002] = {
        atk1_trigger_frames = 10,
        atk2_frames = 29,
        atk2_trigger_frames = 11,
        id = 1002,
        res_Name = "anna"
    },
    [1003] = {
        atk1_frames = 28,
        atk1_trigger_frames = 10,
        atk2_frames = 28,
        atk2_trigger_frames = 21,
        id = 1003,
        res_Name = "sol"
    },
    [1004] = {
        atk1_frames = 23,
        atk1_trigger_frames = 8,
        atk2_frames = 23,
        atk2_trigger_frames = 8,
        id = 1004,
        res_Name = "simo"
    },
    [1005] = {
        atk1_frames = 22,
        atk2_frames = 28,
        atk2_trigger_frames = 8,
        id = 1005,
        res_Name = "croque"
    },
    [1006] = {
        atk1_frames = 28,
        atk2_frames = 28,
        id = 1006,
        res_Name = "fresnel"
    },
    [1007] = {
        atk1_frames = 26,
        atk1_trigger_frames = 5,
        atk2_frames = 26,
        atk2_trigger_frames = 5,
        id = 1007,
        res_Name = "chelsea"
    },
    [1008] = {
        atk1_frames = 33,
        atk1_trigger_frames = 18,
        atk2_frames = 55,
        atk2_trigger_frames = 42,
        id = 1008,
        res_Name = "gin"
    },
    [1009] = {
        atk1_frames = 22,
        atk1_trigger_frames = 8,
        atk2_frames = 19,
        atk2_trigger_frames = 9,
        id = 1009,
        res_Name = "mai"
    },
    [1010] = {
        atk1_frames = 40,
        atk1_trigger_frames = 25,
        atk2_frames = 40,
        atk2_trigger_frames = 25,
        id = 1010,
        res_Name = "evelyn"
    },
    [1012] = {
        atk2_frames = 22,
        atk2_trigger_frames = 10,
        id = 1012,
        res_Name = "max"
    },
    [1013] = {
        atk1_frames = 31,
        atk1_trigger_frames = 7,
        atk2_frames = 30,
        id = 1013,
        res_Name = "betty"
    },
    [1016] = {
        atk1_trigger_frames = 5,
        atk2_frames = 23,
        id = 1016,
        res_Name = "banxsy"
    },
    [1017] = {
        atk1_frames = 22,
        atk2_frames = 22,
        atk2_trigger_frames = 6,
        id = 1017,
        res_Name = "angela"
    },
    [1020] = {
        atk1_frames = 38,
        atk1_trigger_frames = 12,
        atk2_frames = 38,
        atk2_trigger_frames = 12,
        id = 1020,
        res_Name = "yanny"
    },
    [1021] = {
        atk1_frames = 22,
        atk2_frames = 20,
        id = 1021,
        res_Name = "groove"
    },
    [1023] = {
        atk1_frames = 22,
        atk1_trigger_frames = 12,
        atk2_frames = 22,
        atk2_trigger_frames = 10,
        id = 1023,
        res_Name = "bonee"
    },
    [1027] = {
        atk1_frames = 32,
        atk2_frames = 32,
        atk2_trigger_frames = 6,
        id = 1027,
        res_Name = "zion"
    },
    [1031] = {
        atk1_frames = 30,
        atk1_trigger_frames = 8,
        atk2_frames = 30,
        atk2_trigger_frames = 8,
        id = 1031,
        res_Name = "imhotep"
    },
    [1034] = {
        atk1_frames = 29,
        atk2_frames = 31,
        atk2_trigger_frames = 8,
        id = 1034
    },
    [1035] = {
        atk1_frames = 17,
        atk1_trigger_frames = 5,
        atk2_frames = 20,
        id = 1035,
        res_Name = "jessie"
    },
    [1036] = {
        atk1_frames = 15,
        atk1_trigger_frames = 2,
        atk2_frames = 15,
        atk2_trigger_frames = 5,
        id = 1036,
        res_Name = "lam"
    },
    [1037] = {
        atk1_frames = 20,
        atk1_trigger_frames = 7,
        atk2_frames = 25,
        atk2_trigger_frames = 8,
        id = 1037,
        res_Name = "hubble"
    },
    [1038] = {
        atk1_frames = 22,
        atk1_trigger_frames = 5,
        atk2_frames = 22,
        atk2_trigger_frames = 5,
        id = 1038,
        res_Name = "sakuya"
    },
    [1039] = {
        atk1_frames = 33,
        atk2_frames = 33,
        atk2_trigger_frames = 10,
        id = 1039,
        res_Name = "centaureissi"
    },
    [2001] = {
        atk1_frames = 18,
        atk2_frames = 18,
        id = 2001,
        res_Name = "raider"
    },
    [2002] = {
        atk1_frames = 18,
        atk1_trigger_frames = 4,
        atk2_frames = 18,
        atk2_trigger_frames = 4,
        base_move_spd = 50,
        id = 2002,
        res_Name = "purger"
    },
    [2003] = {
        atk1_frames = 23,
        atk1_trigger_frames = 12,
        atk2_frames = 23,
        atk2_trigger_frames = 12,
        base_move_spd = 120,
        id = 2003,
        res_Name = "patience"
    },
    [2004] = {
        atk1_frames = 28,
        atk1_trigger_frames = 14,
        atk2_frames = 28,
        atk2_trigger_frames = 14,
        id = 2004,
        res_Name = "reverence"
    },
    [2005] = {
        atk1_frames = 23,
        atk1_trigger_frames = 12,
        atk2_frames = 28,
        atk2_trigger_frames = 13,
        id = 2005,
        res_Name = "faith"
    },
    [2006] = {
        atk1_trigger_frames = 10,
        atk2_trigger_frames = 10,
        id = 2006,
        res_Name = "refactor"
    },
    [2007] = {
        atk1_trigger_frames = 9,
        atk2_trigger_frames = 9,
        id = 2007,
        res_Name = "defender"
    },
    [2008] = {
        atk1_frames = 24,
        atk1_trigger_frames = 9,
        atk2_frames = 27,
        atk2_trigger_frames = 9,
        id = 2008,
        res_Name = "fortitude"
    },
    [2009] = {
        atk1_frames = 15,
        atk1_trigger_frames = 7,
        atk2_frames = 19,
        atk2_trigger_frames = 9,
        id = 2009,
        res_Name = "mara"
    },
    [2010] = {
        atk1_frames = 15,
        atk1_trigger_frames = 7,
        atk2_frames = 19,
        atk2_trigger_frames = 9,
        extend_res = "mara",
        id = 2010,
        res_Name = "mara-blue"
    },
    [2011] = {
        atk1_frames = 26,
        atk1_trigger_frames = 12,
        atk2_frames = 29,
        atk2_trigger_frames = 12,
        base_move_spd = 50,
        id = 2011,
        res_Name = "protector"
    },
    [2012] = {
        atk1_frames = 20,
        atk1_trigger_frames = 5,
        atk2_frames = 20,
        atk2_trigger_frames = 6,
        id = 2012,
        res_Name = "temperance"
    },
    [2013] = {
        atk1_frames = 18,
        atk2_frames = 18,
        extend_res = "raider",
        id = 2013,
        res_Name = "raider2"
    },
    [2014] = {
        atk1_frames = 18,
        atk1_trigger_frames = 4,
        atk2_frames = 18,
        atk2_trigger_frames = 4,
        base_move_spd = 50,
        extend_res = "purger",
        id = 2014,
        res_Name = "purger2"
    },
    [2015] = {
        atk1_trigger_frames = 9,
        atk2_trigger_frames = 9,
        extend_res = "defender",
        id = 2015,
        res_Name = "defender2"
    },
    [2016] = {
        atk1_frames = 26,
        atk1_trigger_frames = 12,
        atk2_frames = 29,
        atk2_trigger_frames = 12,
        extend_res = "protector",
        id = 2016,
        res_Name = "protector2"
    },
    [2017] = {
        atk1_trigger_frames = 10,
        atk2_trigger_frames = 10,
        extend_res = "refactor",
        id = 2017,
        res_Name = "refactor2"
    },
    [2018] = {
        atk1_frames = 10,
        atk1_trigger_frames = 10,
        atk2_frames = 10,
        atk2_trigger_frames = 10,
        base_move_spd = 10,
        id = 2018,
        res_Name = "portal"
    },
    [2019] = {atk1_trigger_frames = 7, id = 2019, res_Name = "beelneith"},
    [2020] = {
        atk1_frames = 30,
        atk1_trigger_frames = 15,
        atk2_frames = 30,
        atk2_trigger_frames = 17,
        base_move_spd = 80,
        id = 2020,
        res_Name = "gabrie"
    },
    [2021] = {atk1_trigger_frames = 7, id = 2021, res_Name = "hesperus"},
    [2022] = {
        atk1_frames = 25,
        atk1_trigger_frames = 10,
        atk2_frames = 25,
        atk2_trigger_frames = 10,
        id = 2022,
        res_Name = "hope"
    },
    [2023] = {
        atk1_frames = 24,
        atk1_trigger_frames = 9,
        atk2_frames = 18,
        atk2_trigger_frames = 8,
        base_move_spd = 80,
        id = 2023,
        res_Name = "love"
    },
    [2024] = {
        atk1_frames = 20,
        atk1_trigger_frames = 11,
        atk2_frames = 20,
        atk2_trigger_frames = 10,
        base_move_spd = 80,
        id = 2024,
        res_Name = "diligence"
    },
    [2025] = {
        atk1_trigger_frames = 7,
        base_move_spd = 80,
        id = 2025,
        res_Name = "kindness"
    },
    [2026] = {
        atk1_frames = 24,
        atk1_trigger_frames = 12,
        atk2_frames = 24,
        atk2_trigger_frames = 12,
        base_move_spd = 60,
        id = 2026,
        res_Name = "wisdom"
    },
    [2027] = {
        atk1_frames = 15,
        atk1_trigger_frames = 9,
        atk2_frames = 15,
        atk2_trigger_frames = 9,
        base_move_spd = 0,
        death_frames = 35,
        id = 2027,
        res_Name = "imhotep_bird"
    },
    [2028] = {
        atk1_frames = 17,
        atk1_trigger_frames = 11,
        atk2_frames = 17,
        atk2_trigger_frames = 11,
        base_move_spd = 0,
        id = 2028,
        res_Name = "imhotep_snake"
    },
    [3001] = {
        atk1_frames = 0,
        atk1_trigger_frames = 0,
        atk2_frames = 0,
        atk2_trigger_frames = 0,
        base_move_spd = 0,
        death_frames = 0,
        id = 3001,
        res_Name = "roadblock3"
    },
    [3002] = {
        atk1_frames = 0,
        atk1_trigger_frames = 0,
        atk2_frames = 0,
        atk2_trigger_frames = 0,
        base_move_spd = 0,
        death_frames = 0,
        id = 3002,
        res_Name = "roadblock1"
    },
    [3003] = {
        atk1_frames = 0,
        atk1_trigger_frames = 0,
        atk2_frames = 0,
        atk2_trigger_frames = 0,
        base_move_spd = 0,
        death_frames = 0,
        id = 3003,
        res_Name = "roadblock4"
    },
    [3004] = {
        atk1_frames = 0,
        atk1_trigger_frames = 0,
        atk2_frames = 0,
        atk2_trigger_frames = 0,
        base_move_spd = 0,
        death_frames = 0,
        id = 3004,
        res_Name = "roadblock2"
    },
    [3005] = {
        atk1_frames = 0,
        atk1_trigger_frames = 0,
        atk2_frames = 0,
        atk2_trigger_frames = 0,
        base_move_spd = 0,
        death_frames = 0,
        id = 3005,
        res_Name = "sector_obstacles_blue"
    },
    [3006] = {
        atk1_frames = 0,
        atk1_trigger_frames = 0,
        atk2_frames = 0,
        atk2_trigger_frames = 0,
        base_move_spd = 0,
        death_frames = 0,
        id = 3006,
        res_Name = "sector_obstacles"
    }
}
local __default_values = {
    atk1_frames = 21,
    atk1_trigger_frames = 6,
    atk2_frames = 21,
    atk2_trigger_frames = 7,
    base_move_spd = 100,
    death_frames = 45,
    extend_res = "",
    id = 1001,
    res_Name = "abigail"
}
local base = {
    __index = __default_values,
    __newindex = function()
        -- function num : 0_0 , upvalues : _ENV
        error("Attempt to modify read-only table")
    end
}
for k, v in pairs(resource_model) do setmetatable(v, base) end
local __rawdata = {__basemetatable = base}
setmetatable(resource_model, {__index = __rawdata})
return resource_model

