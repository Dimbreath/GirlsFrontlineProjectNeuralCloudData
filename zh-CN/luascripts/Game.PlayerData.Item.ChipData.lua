-- params : ...
-- function num : 0 , upvalues : _ENV
local base = require("Game.PlayerData.Item.ItemData")
local ChipData = class("ChipData", base)
local ChipBattleData = require("Game.PlayerData.Item.ChipBattleData")
local ChipEnum = require("Game.PlayerData.Item.ChipEnum")
ChipData.NewChipForOneHero = function(dynHero, chipId, num)
  -- function num : 0_0 , upvalues : ChipData
  local chipData = (ChipData.New)(chipId, num)
  if chipData ~= nil then
    chipData.isCopyItem = true
    ;
    (chipData.chipBattleData):SetOnlyForOneHero(dynHero.dataId)
    chipData.heroName = dynHero:GetName()
    chipData.heroId = dynHero:GetID()
  end
  return chipData
end

ChipData.ctor = function(self, dataId, count)
  -- function num : 0_1 , upvalues : _ENV, ChipBattleData
  local chipCfg = (ConfigData.chip)[self.dataId]
  if chipCfg == nil then
    error("Can\'t find chip cfg, id = " .. tostring(self.dataId))
    return 
  end
  self.chipCfg = chipCfg
  self.isCopyItem = false
  self.chipBattleData = (ChipBattleData.New)(self.chipCfg, self:GetCount())
end

ChipData.OnCountChanged = function(self)
  -- function num : 0_2 , upvalues : base
  (base.OnCountChanged)(self)
  if self.chipBattleData ~= nil then
    (self.chipBattleData):UpdateSkillLevel(self:GetCount())
  end
end

ChipData.GetValidRoleList = function(self, dynBattleRoleList, belong)
  -- function num : 0_3
  return (self.chipBattleData):GetValidRoleList(dynBattleRoleList, belong)
end

ChipData.ExecuteChipHero = function(self, role)
  -- function num : 0_4 , upvalues : ChipEnum, _ENV
  if role == nil then
    return (ChipEnum.ePropActionResult).Skip
  end
  if role:ContainChip(self) then
    error("该全局芯片已经生效:" .. tostring(self.dataId))
    return (ChipEnum.ePropActionResult).Fail
  else
    ;
    (self.chipBattleData):ExecutePropHero(role, self:GetCount())
    role:AddChip(self)
  end
  return (ChipEnum.ePropActionResult).Success
end

ChipData.RollbackChipHero = function(self, role)
  -- function num : 0_5 , upvalues : ChipEnum
  if role == nil or not role:ContainChip(self) then
    return (ChipEnum.ePropActionResult).Skip
  end
  ;
  (self.chipBattleData):RollbackHero(role, self:GetCount())
  role:RemoveChip(self)
  return (ChipEnum.ePropActionResult).Success
end

ChipData.GetChipCfg = function(self)
  -- function num : 0_6
  return self.chipCfg
end

ChipData.GetMarkIconIndex = function(self)
  -- function num : 0_7
  return (self.chipCfg).icon
end

ChipData.GetChipInfo = function(self)
  -- function num : 0_8 , upvalues : _ENV
  return (LanguageUtil.GetLocaleText)((self.chipCfg).info)
end

ChipData.GetName = function(self)
  -- function num : 0_9 , upvalues : base
  local name = (base.GetName)(self)
  if self.isCopyItem then
    name = name .. "-" .. self.heroName
  end
  return name
end

ChipData.IsCopyItem = function(self)
  -- function num : 0_10
  return self.isCopyItem
end

ChipData.GetHeroName = function(self)
  -- function num : 0_11
  return self.heroName
end

ChipData.GetHeroID = function(self)
  -- function num : 0_12
  return self.heroId
end

return ChipData

