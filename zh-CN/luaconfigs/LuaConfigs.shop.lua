-- params : ...
-- function num : 0 , upvalues : _ENV
local __rt_1 = {}
local shop = {
[203] = {id = 203, name = 218266}
, 
[204] = {id = 204, isRefreshShop = true, name = 2465, refreshCostId = 1002, 
refreshCostNum = {10, 30, 50}
, 
refresh_times = {1, 2, 5}
, shop_type = 2}
, 
[301] = {id = 301, name = 142872, shop_type = 3}
, 
[403] = {id = 403, name = 60812, shop_type = 4}
, 
[601] = {id = 601, name = 505239, 
shop_para = {601, 602, 603}
, shop_type = 6}
, 
[701] = {id = 701, name = 421882, 
pre_condition = {1}
, 
pre_para1 = {999}
, shop_type = 7}
, 
[801] = {id = 801, shop_type = 8}
, 
[901] = {id = 901, name = 491765, 
shop_para = {501}
, shop_type = 9}
, 
[1002] = {isRefreshShop = true, name = 175419, 
pre_condition = {3}
, 
pre_para1 = {3102}
, refreshCostId = 1015, 
refreshCostNum = {10, 20, 30, 50, 100}
, 
refresh_times = {1, 3, 5, 10, 20}
, shop_type = 10}
}
local __default_values = {id = 1002, isRefreshShop = false, name = 123697, name_en = "", pre_condition = __rt_1, pre_para1 = __rt_1, pre_para2 = __rt_1, refreshCostId = 0, refreshCostNum = __rt_1, refresh_times = __rt_1, shop_para = __rt_1, shop_type = 1}
local base = {__index = __default_values, __newindex = function()
  -- function num : 0_0 , upvalues : _ENV
  error("Attempt to modify read-only table")
end
}
for k,v in pairs(shop) do
  setmetatable(v, base)
end
local __rawdata = {__basemetatable = base, 
id_sort_list = {203, 204, 301, 403, 601, 701, 801, 901, 1002}
}
setmetatable(shop, {__index = __rawdata})
return shop

