-- params : ...
-- function num : 0 , upvalues : _ENV
local __rt_1 = {5, 10, 15, 20, 25}
local __rt_2 = {1, 1, 1, 1, 1}
local __rt_3 = {9, 10}
local __rt_4 = {1, 11}
local __rt_5 = {25, 50, 75, 100, -1}
local shop_hero = {
[403] = {
{page = 402}
, 
{goods_shelves = 2, hero = 1002, itemId = 2502, page = 402, 
pre_para1 = {1002, 1002}
}
, 
{goods_shelves = 3, hero = 1003, itemId = 2503, page = 402, 
pre_para1 = {1003, 1003}
}
, 
{goods_shelves = 4, hero = 1004, itemId = 2504, page = 401, 
pre_para1 = {1004, 1004}
}
, 
{goods_shelves = 5, hero = 1005, itemId = 2505, page = 401, 
pre_para1 = {1005, 1005}
}
, 
{goods_shelves = 6, hero = 1006, itemId = 2506, page = 402, 
pre_para1 = {1006, 1006}
}
, 
{goods_shelves = 7, hero = 1007, itemId = 2507, page = 401, 
pre_para1 = {1007, 1007}
}
, 
{goods_shelves = 8, hero = 1008, itemId = 2508, 
pre_para1 = {1008, 1008}
}
, 
{goods_shelves = 9, hero = 1009, itemId = 2509, page = 402, 
pre_para1 = {1009, 1009}
}
, 
{goods_shelves = 10, hero = 1010, itemId = 2510, page = 401, 
pre_para1 = {1010, 1010}
}
, 
{goods_shelves = 11, hero = 1012, itemId = 2512, page = 402, 
pre_para1 = {1012, 1012}
}
, 
{goods_shelves = 12, hero = 1013, itemId = 2513, 
pre_para1 = {1013, 1013}
}
, 
{goods_shelves = 13, hero = 1016, itemId = 2516, page = 404, 
pre_para1 = {1016, 1016}
}
, 
{goods_shelves = 14, hero = 1017, itemId = 2517, 
pre_para1 = {1017, 1017}
}
, 
{goods_shelves = 15, hero = 1020, itemId = 2520, 
pre_para1 = {1020, 1020}
}
, 
{goods_shelves = 16, hero = 1021, itemId = 2521, page = 404, 
pre_para1 = {1021, 1021}
}
, 
{goods_shelves = 17, hero = 1023, itemId = 2523, page = 403, 
pre_para1 = {1023, 1023}
}
, 
{goods_shelves = 18, hero = 1027, itemId = 2527, page = 401, 
pre_para1 = {1027, 1027}
}
, 
{goods_shelves = 19, hero = 1031, itemId = 2531, page = 403, 
pre_para1 = {1031, 1031}
}
, 
{goods_shelves = 20, hero = 1034, itemId = 2534, page = 401, 
pre_para1 = {1034, 1034}
}
, 
{goods_shelves = 21, hero = 1035, itemId = 2535, 
pre_para1 = {1035, 1035}
}
, 
{goods_shelves = 22, hero = 1036, itemId = 2536, 
pre_para1 = {1036, 1036}
}
, 
{goods_shelves = 23, hero = 1037, itemId = 2537, page = 402, 
pre_para1 = {1037, 1037}
}
, 
{goods_shelves = 24, hero = 1038, itemId = 2538, 
pre_para1 = {1038, 1038}
}
, 
{goods_shelves = 25, hero = 1039, itemId = 2539, 
pre_para1 = {1039, 1039}
}
}
}
local __default_values = {currencyId = 1006, currencyNums = __rt_1, goods_shelves = 1, hero = 1001, itemId = 2501, itemNums = __rt_2, page = 405, pre_condition = __rt_3, 
pre_para1 = {1001, 1001}
, pre_para2 = __rt_4, shop_id = 403, times = __rt_5}
local base = {__index = __default_values, __newindex = function()
  -- function num : 0_0 , upvalues : _ENV
  error("Attempt to modify read-only table")
end
}
for k,v in pairs(shop_hero) do
  for k1,v1 in pairs(v) do
    setmetatable(v1, base)
  end
end
local __rawdata = {__basemetatable = base}
setmetatable(shop_hero, {__index = __rawdata})
return shop_hero

