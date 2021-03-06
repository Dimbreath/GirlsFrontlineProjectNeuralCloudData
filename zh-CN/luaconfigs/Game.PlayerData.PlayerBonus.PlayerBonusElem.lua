-- params : ...
-- function num : 0 , upvalues : _ENV
local PlayerBonusElem = class("PlayerBonusElem")
local InitFunc1Para = function(self)
  -- function num : 0_0
  self.totalData = 0
end

local InitFunc2Para = function(self)
  -- function num : 0_1 , upvalues : _ENV
  self.totalData = (table.GetDefaulValueTable)(0)
end

local InitFuncDic = {[eLogicType.ResourceLimit] = function(self)
  -- function num : 0_2 , upvalues : InitFunc2Para
  InitFunc2Para(self)
end
, [eLogicType.FactoryPipelie] = function(self)
  -- function num : 0_3 , upvalues : InitFunc1Para
  InitFunc1Para(self)
end
, [eLogicType.GlobalExpCeiling] = function(self)
  -- function num : 0_4 , upvalues : InitFunc1Para
  InitFunc1Para(self)
end
, [eLogicType.ResOutputEfficiency] = function(self)
  -- function num : 0_5 , upvalues : InitFunc2Para
  InitFunc2Para(self)
end
, [eLogicType.BuildQueue] = function(self)
  -- function num : 0_6 , upvalues : InitFunc2Para
  InitFunc2Para(self)
end
, [eLogicType.BuildSpeed] = function(self)
  -- function num : 0_7 , upvalues : InitFunc1Para
  InitFunc1Para(self)
end
, [eLogicType.GlobalExpRatio] = function(self)
  -- function num : 0_8 , upvalues : InitFunc1Para
  InitFunc1Para(self)
end
, [eLogicType.OverClock] = function(self)
  -- function num : 0_9 , upvalues : InitFunc2Para
  InitFunc2Para(self)
end
, [eLogicType.OverClockFreeNum] = function(self)
  -- function num : 0_10 , upvalues : InitFunc1Para
  InitFunc1Para(self)
end
, [eLogicType.FocusPointCeiling] = function(self)
  -- function num : 0_11 , upvalues : InitFunc1Para
  InitFunc1Para(self)
end
, [eLogicType.BattleExpBonus] = function(self)
  -- function num : 0_12 , upvalues : InitFunc1Para
  InitFunc1Para(self)
end
, [eLogicType.DynSkillUpgrade] = function(self)
  -- function num : 0_13 , upvalues : InitFunc1Para
  InitFunc1Para(self)
end
, [eLogicType.DynPlayerAttrBuff] = function(self)
  -- function num : 0_14 , upvalues : InitFunc2Para
  InitFunc2Para(self)
end
, [eLogicType.HeroLevelCeiling] = function(self)
  -- function num : 0_15 , upvalues : InitFunc1Para
  InitFunc1Para(self)
end
, [eLogicType.AutoRecoverItem] = function(self)
  -- function num : 0_16 , upvalues : InitFunc2Para
  InitFunc2Para(self)
end
, [eLogicType.DungeonCountAdd] = function(self)
  -- function num : 0_17 , upvalues : InitFunc2Para
  InitFunc2Para(self)
end
, [eLogicType.FactoryEfficiency] = function(self)
  -- function num : 0_18 , upvalues : InitFunc2Para
  InitFunc2Para(self)
end
, [eLogicType.ResOutputCeiling] = function(self)
  -- function num : 0_19 , upvalues : InitFunc2Para
  InitFunc2Para(self)
end
}
local InstallFunc1Para = function(self, uid, para1, para2, para3)
  -- function num : 0_20
  local ori = (self.categoryDataDic)[uid]
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (self.categoryDataDic)[uid] = para1
  if ori ~= nil then
    self.totalData = self.totalData - ori
  end
  self.totalData = self.totalData + para1
end

local InstallFunc2Para = function(self, uid, para1, para2, para3)
  -- function num : 0_21
  local data = (self.categoryDataDic)[uid]
  if data == nil then
    data = {}
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.categoryDataDic)[uid] = data
  end
  local ori = data[para1] or 0
  data[para1] = para2
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R7 in 'UnsetPending'

  if ori <= para2 then
    (self.totalData)[para1] = (self.totalData)[para1] + para2 - ori
  else
    local diff = ori - para2
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R8 in 'UnsetPending'

    if diff < (self.totalData)[para1] then
      (self.totalData)[para1] = (self.totalData)[para1] - diff
    else
      -- DECOMPILER ERROR at PC34: Confused about usage of register: R8 in 'UnsetPending'

      ;
      (self.totalData)[para1] = nil
    end
  end
end

local InstallFuncDic = {[eLogicType.ResourceLimit] = function(self, uid, para1, para2, para3)
  -- function num : 0_22 , upvalues : InstallFunc2Para, _ENV
  InstallFunc2Para(self, uid, para1, para2, para3)
  ;
  (PlayerDataCenter.playerBonus):AddPlayerBonusBroadcast("warehouse")
end
, [eLogicType.CampBuff] = function(self, uid, para1, para2, para3)
  -- function num : 0_23 , upvalues : _ENV
  local data = (self.categoryDataDic)[uid]
  if data == nil then
    data = {}
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.categoryDataDic)[uid] = data
  end
  if data[para1] == nil then
    data[para1] = {}
  end
  if (data[para1])[para2] ~= nil then
    (PlayerDataCenter.attributeBonus):RemoveCampBonus(para1, para2, (data[para1])[para2])
  end
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (data[para1])[para2] = para3
  ;
  (PlayerDataCenter.attributeBonus):AddCampBonus(para1, para2, para3)
end
, [eLogicType.CareerBuff] = function(self, uid, para1, para2, para3)
  -- function num : 0_24 , upvalues : _ENV
  local data = (self.categoryDataDic)[uid]
  if data == nil then
    data = {}
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.categoryDataDic)[uid] = data
  end
  if data[para1] == nil then
    data[para1] = {}
  end
  if (data[para1])[para2] ~= nil then
    (PlayerDataCenter.attributeBonus):RemoveCareerBonus(para1, para2, (data[para1])[para2])
  end
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (data[para1])[para2] = para3
  ;
  (PlayerDataCenter.attributeBonus):AddCareerBonus(para1, para2, para3)
end
, [eLogicType.FactoryPipelie] = function(self, uid, para1, para2, para3)
  -- function num : 0_25 , upvalues : InstallFunc1Para
  InstallFunc1Para(self, uid, para1, para2, para3)
end
, [eLogicType.GlobalExpCeiling] = function(self, uid, para1, para2, para3)
  -- function num : 0_26 , upvalues : InstallFunc1Para
  InstallFunc1Para(self, uid, para1, para2, para3)
end
, [eLogicType.ResOutputEfficiency] = function(self, uid, para1, para2, para3)
  -- function num : 0_27 , upvalues : InstallFunc2Para
  InstallFunc2Para(self, uid, para1, para2, para3)
end
, [eLogicType.BuildQueue] = function(self, uid, para1, para2, para3)
  -- function num : 0_28 , upvalues : InstallFunc2Para
  InstallFunc2Para(self, uid, para1, para2, para3)
end
, [eLogicType.BuildSpeed] = function(self, uid, para1, para2, para3)
  -- function num : 0_29 , upvalues : InstallFunc1Para
  InstallFunc1Para(self, uid, para1, para2, para3)
end
, [eLogicType.GlobalExpRatio] = function(self, uid, para1, para2, para3)
  -- function num : 0_30 , upvalues : InstallFunc1Para
  InstallFunc1Para(self, uid, para1, para2, para3)
end
, [eLogicType.AllHeroBuff] = function(self, uid, para1, para2, para3)
  -- function num : 0_31 , upvalues : _ENV
  local data = (self.categoryDataDic)[uid]
  if data == nil then
    data = {}
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.categoryDataDic)[uid] = data
  end
  if data[para1] ~= nil then
    (PlayerDataCenter.attributeBonus):RemoveAllBonus(para1, data[para1])
  end
  data[para1] = para2
  ;
  (PlayerDataCenter.attributeBonus):AddAllBonus(para1, para2)
end
, [eLogicType.OverClock] = function(self, uid, para1, para2, para3)
  -- function num : 0_32 , upvalues : _ENV
  local data = (self.categoryDataDic)[uid]
  if data == nil then
    data = {}
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.categoryDataDic)[uid] = data
  end
  local ori = data[para1] or 0
  data[para1] = (math.max)(ori, para2)
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R7 in 'UnsetPending'

  ;
  (self.totalData)[para1] = (math.max)(para2, (self.totalData)[para1] or 0)
end
, [eLogicType.OverClockFreeNum] = function(self, uid, para1, para2, para3)
  -- function num : 0_33 , upvalues : InstallFunc1Para
  InstallFunc1Para(self, uid, para1, para2, para3)
end
, [eLogicType.FocusPointCeiling] = function(self, uid, para1, para2, para3)
  -- function num : 0_34 , upvalues : InstallFunc1Para
  InstallFunc1Para(self, uid, para1, para2, para3)
end
, [eLogicType.BattleExpBonus] = function(self, uid, para1, para2, para3)
  -- function num : 0_35 , upvalues : InstallFunc1Para
  InstallFunc1Para(self, uid, para1, para2, para3)
end
, [eLogicType.DynSkillUpgrade] = function(self, uid, para1, para2, para3)
  -- function num : 0_36 , upvalues : InstallFunc1Para
  InstallFunc1Para(self, uid, para1, para2, para3)
end
, [eLogicType.DynPlayerAttrBuff] = function(self, uid, para1, para2, para3)
  -- function num : 0_37 , upvalues : InstallFunc2Para
  InstallFunc2Para(self, uid, para1, para2, para3)
end
, [eLogicType.HeroLevelCeiling] = function(self, uid, para1, para2, para3)
  -- function num : 0_38 , upvalues : InstallFunc1Para
  InstallFunc1Para(self, uid, para1, para2, para3)
end
, [eLogicType.AutoRecoverItem] = function(self, uid, para1, para2, para3)
  -- function num : 0_39 , upvalues : InstallFunc2Para, _ENV
  InstallFunc2Para(self, uid, para1, para2, para3)
  ;
  (PlayerDataCenter.playerBonus):AddPlayerBonusBroadcast("AutoRecoverItem")
end
, [eLogicType.DungeonCountAdd] = function(self, uid, para1, para2, para3)
  -- function num : 0_40 , upvalues : InstallFunc2Para
  InstallFunc2Para(self, uid, para1, para2, para3)
end
, [eLogicType.FactoryEfficiency] = function(self, uid, para1, para2, para3)
  -- function num : 0_41 , upvalues : InstallFunc2Para
  InstallFunc2Para(self, uid, para1, para2, para3)
end
, [eLogicType.ResOutputCeiling] = function(self, uid, para1, para2, para3)
  -- function num : 0_42 , upvalues : InstallFunc2Para
  InstallFunc2Para(self, uid, para1, para2, para3)
end
}
local uninstallFunc1Para = function(self, uid)
  -- function num : 0_43 , upvalues : _ENV
  local data = (self.categoryDataDic)[uid]
  if data == nil then
    error((string.format)("No categoryData, uid = %s, logic = %s, module = %s, id = %s", self.logic, uid, uid >> 32, uid & CommonUtil.UInt32Max))
    return 
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self.categoryDataDic)[uid] = nil
  self.totalData = (math.max)(0, self.totalData - data)
end

local uninstallFunc2Para = function(self, uid)
  -- function num : 0_44 , upvalues : _ENV
  local data = (self.categoryDataDic)[uid]
  if data == nil then
    error((string.format)("No categoryData, uid = %s, logic = %s, module = %s, id = %s", self.logic, uid, uid >> 32, uid & CommonUtil.UInt32Max))
    return 
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self.categoryDataDic)[uid] = nil
  for k,v in pairs(data) do
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R8 in 'UnsetPending'

    if v < (self.totalData)[k] then
      (self.totalData)[k] = (self.totalData)[k] - v
    else
      -- DECOMPILER ERROR at PC34: Confused about usage of register: R8 in 'UnsetPending'

      ;
      (self.totalData)[k] = nil
    end
  end
end

local UninstallFuncDic = {[eLogicType.ResourceLimit] = function(self, uid)
  -- function num : 0_45 , upvalues : uninstallFunc2Para, _ENV
  uninstallFunc2Para(self, uid)
  ;
  (PlayerDataCenter.playerBonus):AddPlayerBonusBroadcast("warehouse")
end
, [eLogicType.CampBuff] = function(self, uid)
  -- function num : 0_46 , upvalues : _ENV
  local data = (self.categoryDataDic)[uid]
  if data == nil then
    error((string.format)("No categoryData, uid = %s, logic = %s, module = %s, id = %s", self.logic, uid, uid >> 32, uid & CommonUtil.UInt32Max))
    return 
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self.categoryDataDic)[uid] = nil
  for para1,v in pairs(data) do
    for para2,para3 in pairs(v) do
      (PlayerDataCenter.attributeBonus):RemoveCampBonus(para1, para2, para3)
    end
  end
end
, [eLogicType.CareerBuff] = function(self, uid)
  -- function num : 0_47 , upvalues : _ENV
  local data = (self.categoryDataDic)[uid]
  if data == nil then
    error((string.format)("No categoryData, uid = %s, logic = %s, module = %s, id = %s", self.logic, uid, uid >> 32, uid & CommonUtil.UInt32Max))
    return 
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self.categoryDataDic)[uid] = nil
  for para1,v in pairs(data) do
    for para2,para3 in pairs(v) do
      (PlayerDataCenter.attributeBonus):RemoveCareerBonus(para1, para2, para3)
    end
  end
end
, [eLogicType.FactoryPipelie] = function(self, uid)
  -- function num : 0_48 , upvalues : uninstallFunc1Para
  uninstallFunc1Para(self, uid)
end
, [eLogicType.GlobalExpCeiling] = function(self, uid)
  -- function num : 0_49 , upvalues : uninstallFunc1Para
  uninstallFunc1Para(self, uid)
end
, [eLogicType.ResOutputEfficiency] = function(self, uid)
  -- function num : 0_50 , upvalues : uninstallFunc2Para
  uninstallFunc2Para(self, uid)
end
, [eLogicType.BuildQueue] = function(self, uid)
  -- function num : 0_51 , upvalues : uninstallFunc2Para
  uninstallFunc2Para(self, uid)
end
, [eLogicType.BuildSpeed] = function(self, uid)
  -- function num : 0_52 , upvalues : uninstallFunc1Para
  uninstallFunc1Para(self, uid)
end
, [eLogicType.GlobalExpRatio] = function(self, uid)
  -- function num : 0_53 , upvalues : uninstallFunc1Para
  uninstallFunc1Para(self, uid)
end
, [eLogicType.AllHeroBuff] = function(self, uid)
  -- function num : 0_54 , upvalues : _ENV
  local data = (self.categoryDataDic)[uid]
  if data == nil then
    error((string.format)("No categoryData, uid = %s, logic = %s, module = %s, id = %s", self.logic, uid, uid >> 32, uid & CommonUtil.UInt32Max))
    return 
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self.categoryDataDic)[uid] = nil
  for para1,para2 in pairs(data) do
    (PlayerDataCenter.attributeBonus):RemoveAllBonus(para1, para2)
  end
end
, [eLogicType.OverClock] = function(self, uid)
  -- function num : 0_55 , upvalues : _ENV
  local data = (self.categoryDataDic)[uid]
  if data == nil then
    error((string.format)("No categoryData, uid = %s, logic = %s, module = %s, id = %s", self.logic, uid, uid >> 32, uid & CommonUtil.UInt32Max))
    return 
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self.categoryDataDic)[uid] = nil
  for para1,oldPara2 in pairs(data) do
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R8 in 'UnsetPending'

    (self.totalData)[para1] = 0
    for uid,data in pairs(self.categoryDataDic) do
      -- DECOMPILER ERROR at PC42: Confused about usage of register: R13 in 'UnsetPending'

      if not (self.totalData)[para1] then
        do
          (self.totalData)[para1] = (math.max)(data[para1], data[para1] == nil or 0)
          -- DECOMPILER ERROR at PC43: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC43: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end
, [eLogicType.OverClockFreeNum] = function(self, uid)
  -- function num : 0_56 , upvalues : uninstallFunc1Para
  uninstallFunc1Para(self, uid)
end
, [eLogicType.FocusPointCeiling] = function(self, uid)
  -- function num : 0_57 , upvalues : uninstallFunc1Para
  uninstallFunc1Para(self, uid)
end
, [eLogicType.BattleExpBonus] = function(self, uid)
  -- function num : 0_58 , upvalues : uninstallFunc1Para
  uninstallFunc1Para(self, uid)
end
, [eLogicType.DynSkillUpgrade] = function(self, uid)
  -- function num : 0_59 , upvalues : uninstallFunc1Para
  uninstallFunc1Para(self, uid)
end
, [eLogicType.DynPlayerAttrBuff] = function(self, uid)
  -- function num : 0_60 , upvalues : uninstallFunc2Para
  uninstallFunc2Para(self, uid)
end
, [eLogicType.HeroLevelCeiling] = function(self, uid)
  -- function num : 0_61 , upvalues : uninstallFunc1Para
  uninstallFunc1Para(self, uid)
end
, [eLogicType.AutoRecoverItem] = function(self, uid)
  -- function num : 0_62 , upvalues : uninstallFunc2Para, _ENV
  uninstallFunc2Para(self, uid)
  ;
  (PlayerDataCenter.playerBonus):AddPlayerBonusBroadcast("AutoRecoverItem")
end
, [eLogicType.DungeonCountAdd] = function(self, uid)
  -- function num : 0_63 , upvalues : uninstallFunc2Para
  uninstallFunc2Para(self, uid)
end
, [eLogicType.FactoryEfficiency] = function(self, uid)
  -- function num : 0_64 , upvalues : uninstallFunc2Para
  uninstallFunc2Para(self, uid)
end
, [eLogicType.ResOutputCeiling] = function(self, uid)
  -- function num : 0_65 , upvalues : uninstallFunc2Para
  uninstallFunc2Para(self, uid)
end
}
PlayerBonusElem.ctor = function(self)
  -- function num : 0_66
  self.categoryDataDic = {}
  self.totalData = nil
end

PlayerBonusElem.InitPlayerBonusElem = function(self, logic)
  -- function num : 0_67 , upvalues : InitFuncDic
  self.logic = logic
  local initFunc = InitFuncDic[logic]
  if initFunc == nil then
    return 
  end
  initFunc(self)
end

PlayerBonusElem.InstallBonus = function(self, uid, para1, para2, para3)
  -- function num : 0_68 , upvalues : InstallFuncDic
  local installFunc = InstallFuncDic[self.logic]
  if installFunc == nil then
    return 
  end
  installFunc(self, uid, para1, para2, para3)
end

PlayerBonusElem.UninstallBonus = function(self, uid)
  -- function num : 0_69 , upvalues : UninstallFuncDic
  local uninstallFunc = UninstallFuncDic[self.logic]
  if uninstallFunc == nil then
    return 
  end
  uninstallFunc(self, uid)
end

return PlayerBonusElem

