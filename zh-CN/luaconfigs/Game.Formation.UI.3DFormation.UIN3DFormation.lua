-- params : ...
-- function num : 0 , upvalues : _ENV
local UIN3DFormation = class("UIN3DFormation", UIBaseNode)
local base = UIBaseNode
local UINFmtPlatform = require("Game.Formation.UI.3DFormation.UINFmtPlatform")
UIN3DFormation.ctor = function(self, fmtCtrl)
  -- function num : 0_0
  self.fmtCtrl = fmtCtrl
end

UIN3DFormation.OnInit = function(self)
  -- function num : 0_1 , upvalues : _ENV, UINFmtPlatform
  (UIUtil.LuaUIBindingTable)(self.transform, self.ui)
  local fmtCtrl = ControllerManager:GetController(ControllerTypeId.Formation)
  self.platformDic = {}
  for fmtIndex,go in ipairs((self.ui).platform) do
    local isBench = (ConfigData.game_config).max_stage_hero < fmtIndex
    local unlock, lockStr = nil, nil
    do
      if isBench then
        local benchId = fmtIndex - (ConfigData.game_config).max_stage_hero
        unlock = (FunctionUnlockMgr.BenchUnlock)(benchId, true)
      end
      do
        local plat = (UINFmtPlatform.New)()
        plat:Init(go)
        plat:InitFmtPlatform(fmtIndex, isBench, lockStr)
        plat:SetItemParents((self.ui).parentList)
        -- DECOMPILER ERROR at PC53: Confused about usage of register: R11 in 'UnsetPending'

        ;
        (self.platformDic)[fmtIndex] = plat
        -- DECOMPILER ERROR at PC54: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  -- DECOMPILER ERROR: 3 unprocessed JMP targets
end

UIN3DFormation.GetPlotformItemDic = function(self)
  -- function num : 0_2
  return self.platformDic
end

UIN3DFormation.Init3DFormation = function(self)
  -- function num : 0_3
end

UIN3DFormation.Refresh3DFmt = function(self, formationData, specificHeroDataRuler)
  -- function num : 0_4 , upvalues : _ENV
  self.formationData = formationData
  local totalFtPower, totalBenchPower, campCountDic, top5Total = (self.fmtCtrl):CalculatePower(formationData)
  for index,platItem in pairs(self.platformDic) do
    local heroId = ((self.formationData).data)[index]
    local heroData = nil
    if heroId ~= nil then
      if specificHeroDataRuler ~= nil then
        heroData = (PlayerDataCenter.specialRuleGenerator):GetSpecificHeroData(heroId, specificHeroDataRuler)
      else
        heroData = PlayerDataCenter:GetHeroData(heroId)
      end
    end
    platItem:RefreshUIFmtPlatform(heroData)
  end
  local window = UIManager:GetWindow(UIWindowTypeID.Formation)
  if window ~= nil then
    window:RefreshFmtInfoUI(totalFtPower, totalBenchPower, campCountDic, top5Total)
  end
end

UIN3DFormation.RefreshRefresh3DFmtFightPower = function(self)
  -- function num : 0_5 , upvalues : _ENV
  local totalFtPower = 0
  local totalBenchPower = 0
  local heroPower = 0
  local heroTotalList = {}
  for index,platItem in pairs(self.platformDic) do
    heroPower = platItem:GetFmtPlatHeroFtPower()
    if heroPower ~= 0 then
      (table.insert)(heroTotalList, heroPower)
    end
    if platItem.isBench then
      totalBenchPower = heroPower + totalBenchPower
    else
      totalFtPower = heroPower + totalFtPower
    end
  end
  ;
  (table.sort)(heroTotalList, function(a, b)
    -- function num : 0_5_0
    do return b < a end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
)
  local top5Total = 0
  for i = 1, #heroTotalList do
    if i <= 5 then
      do
        top5Total = top5Total + heroTotalList[i]
        -- DECOMPILER ERROR at PC40: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC40: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
  local dynPlayerFtPower = self:_GetCommanderPower(totalFtPower)
  totalFtPower = totalFtPower + dynPlayerFtPower
  top5Total = top5Total + dynPlayerFtPower
  local window = UIManager:GetWindow(UIWindowTypeID.Formation)
  if window ~= nil then
    window:RefreshFmtInfoUI(totalFtPower, totalBenchPower, nil, top5Total)
  end
end

UIN3DFormation._GetCommanderPower = function(self, heroPower)
  -- function num : 0_6 , upvalues : _ENV
  if self._commanderPowerTab == nil then
    self._commanderPowerTab = {}
  end
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._commanderPowerTab).power = heroPower
  local power = (ConfigData.GetFormulaValue)(eFormulaType.Commander, self._commanderPowerTab)
  power = (math.floor)(power)
  return power
end

UIN3DFormation.GetFmtPlatformUI = function(self, fmtIndex)
  -- function num : 0_7 , upvalues : _ENV
  local platform = (self.platformDic)[fmtIndex]
  if platform == nil then
    warn("Can\'t get FmtPlatformUI, fmtIndex = " .. tostring(fmtIndex))
  end
  return platform
end

UIN3DFormation.RefreshFmtPlatformUI = function(self, fmtIndex, specificHeroDataRuler)
  -- function num : 0_8 , upvalues : _ENV
  local platform = self:GetFmtPlatformUI(fmtIndex)
  if platform == nil then
    return 
  end
  local heroId = ((self.formationData).data)[fmtIndex]
  local heroData = nil
  if heroId ~= nil then
    if specificHeroDataRuler ~= nil then
      heroData = (PlayerDataCenter.specialRuleGenerator):GetSpecificHeroData(heroId, specificHeroDataRuler)
    else
      heroData = PlayerDataCenter:GetHeroData(heroId)
    end
  end
  platform:RefreshUIFmtPlatform(heroData)
end

UIN3DFormation.ShowFmtHeroQuickLvUp = function(self)
  -- function num : 0_9 , upvalues : _ENV
  for index,platItem in pairs(self.platformDic) do
    local heroId = ((self.formationData).data)[index]
    local heroData = nil
    if heroId ~= nil then
      if specificHeroDataRuler ~= nil then
        heroData = (PlayerDataCenter.specialRuleGenerator):GetSpecificHeroData(heroId, specificHeroDataRuler)
      else
        heroData = PlayerDataCenter:GetHeroData(heroId)
      end
    end
    platItem:RefreshFmtQuickLvUp(heroData, (self.ui).fXP_Btn_QuickLevelUp)
  end
end

UIN3DFormation.OnDelete = function(self)
  -- function num : 0_10 , upvalues : base
  (base.OnDelete)(self)
end

return UIN3DFormation

