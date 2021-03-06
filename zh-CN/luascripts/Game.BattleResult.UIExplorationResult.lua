-- params : ...
-- function num : 0 , upvalues : _ENV
local UIExplorationResult = class("UIExplorationResult", UIBaseWindow)
local base = UIBaseWindow
local JumpManager = require("Game.Jump.JumpManager")
local UINBaseItemWithCount = require("Game.CommonUI.Item.UINBaseItemWithCount")
local eDynConfigData = require("Game.ConfigData.eDynConfigData")
local cs_ResLoader = CS.ResLoader
local cs_MessageCommon = CS.MessageCommon
local cs_DoTween = ((CS.DG).Tweening).DOTween
UIExplorationResult.OnInit = function(self)
  -- function num : 0_0 , upvalues : _ENV, cs_ResLoader, UINBaseItemWithCount
  self.sectorNetworkCtrl = NetworkManager:GetNetwork(NetworkTypeID.Sector)
  self.isWin = false
  self.rewardsRecord = {}
  self.rewardList = {}
  self.resloader = (cs_ResLoader.Create)()
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_Return, self, self.OnReturnClicked)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_Again, self, self.OnRestartClicked)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_Detail, self, self.ShowAllChips)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_ViewAllReward, self, self.ShowAllItems)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_GoNext, self, self.OnGoNextBtnClicked)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_Exit, self, self.OnExitBtnClicked)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_FailGetReward, self, self.OnBtnFailGetReward)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_GiveUp, self, self.OnBtnFailGiveUp)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_SuccessSettle, self, self.OnBtnSuccessSettle)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_GotoItem1, self, self.Jump2HeroState)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_GotoItem2, self, self.Jump2HeroState)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_Recomme, self, self.OnClickRecomme)
  ;
  (((self.ui).btn_Again).gameObject):SetActive(false)
  self.rewardItemPool = (UIItemPool.New)(UINBaseItemWithCount, (self.ui).rewardItem)
  ;
  (((self.ui).rewardItem).gameObject):SetActive(false)
  ;
  (((self.ui).btn_Recomme).gameObject):SetActive(false)
end

UIExplorationResult.CompleteExploration = function(self, rewards, firstClearRewards, needFirsPassReward, resultSettlementData)
  -- function num : 0_1 , upvalues : _ENV
  AudioManager:PlayAudioById(3009)
  self.rewardsRecord = (ExplorationManager:GetDynPlayer()):GetEpRewardItemDic()
  if not rewards then
    self.backRewards = {}
    self.firstClearRewards = firstClearRewards
    self.isWin = true
    self.resultSettlementData = resultSettlementData
    self:UpdataResultsUI(self.isWin, false, needFirsPassReward)
  end
end

UIExplorationResult.CompleteExplorationFloor = function(self)
  -- function num : 0_2 , upvalues : _ENV
  self.rewardsRecord = (ExplorationManager:GetDynPlayer()):GetEpRewardItemDic()
  self.backRewards = {eplGold = (ExplorationManager:GetDynPlayer()):GetMoneyCount()}
  self.isWin = true
  self:UpdataResultsUI(self.isWin, true)
end

UIExplorationResult.FailExploration = function(self, clearAction, rewards)
  -- function num : 0_3 , upvalues : _ENV
  AudioManager:PlayAudioById(3010)
  self.rewardsRecord = (ExplorationManager:GetDynPlayer()):GetEpRewardItemDic()
  if not rewards then
    self.backRewards = {}
    self.isWin = false
    self:UpdataResultsUI(self.isWin)
    self._battleEndClear = clearAction
    local returnStamina, remainLevelCount, costStamina = ExplorationManager:GetReturnStamina()
    ;
    ((self.ui).tex_RePoint):SetIndex(0, tostring(returnStamina))
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((self.ui).tex_AgainPoint).text = tostring(costStamina)
    local moduleId = ExplorationManager:GetEpModuleId()
    if moduleId == proto_csmsg_SystemFunctionID.SystemFunctionID_Exploration or moduleId == proto_csmsg_SystemFunctionID.SystemFunctionID_Endless then
      local formationCtr = ControllerManager:GetController(ControllerTypeId.Formation, true)
      if formationCtr:IsCanReqRecomme(self:GetDungeonId(), false) then
        (((self.ui).btn_Recomme).gameObject):SetActive(true)
      end
    end
  end
end

UIExplorationResult.OnReturnClicked = function(self)
  -- function num : 0_4 , upvalues : _ENV
  self:StartFailSettle(false, function()
    -- function num : 0_4_0 , upvalues : _ENV
    ExplorationManager:ExitExploration()
  end
)
end

UIExplorationResult.OnRestartClicked = function(self)
  -- function num : 0_5 , upvalues : _ENV, JumpManager
  local moduleId = ExplorationManager:GetEpModuleId()
  local stageCfg = ExplorationManager:GetSectorStageCfg()
  local againCostStamina = stageCfg.cost_strength_num
  if moduleId == proto_csmsg_SystemFunctionID.SystemFunctionID_Exploration and (PlayerDataCenter.stamina):GetCurrentStamina() < againCostStamina then
    JumpManager:Jump((JumpManager.eJumpTarget).BuyStamina)
    return 
  else
    if moduleId == proto_csmsg_SystemFunctionID.SystemFunctionID_Endless and ((PlayerDataCenter.infinityData).completed)[stageCfg.dungeonId] and (PlayerDataCenter.stamina):GetCurrentStamina() < againCostStamina then
      JumpManager:Jump((JumpManager.eJumpTarget).BuyStamina)
      return 
    end
  end
  if self._battleEndClear ~= nil then
    (self._battleEndClear)()
  end
  ExplorationManager:RestartExploratcion()
end

UIExplorationResult.OnGoNextBtnClicked = function(self)
  -- function num : 0_6 , upvalues : _ENV
  ExplorationManager:EnterNextSectionExploration()
end

UIExplorationResult.OnExitBtnClicked = function(self)
  -- function num : 0_7
end

UIExplorationResult.EpFailNoReward = function(self, clearAction)
  -- function num : 0_8
end

UIExplorationResult.OnBtnFailGetReward = function(self)
  -- function num : 0_9 , upvalues : _ENV
  local oldData = ((ExplorationManager.epCtrl).dynPlayer):SetResultSettlementData()
  self:StartFailSettle(true, function()
    -- function num : 0_9_0 , upvalues : _ENV, self, oldData
    UIManager:ShowWindowAsync(UIWindowTypeID.ExplorationResultSettlement, function(window)
      -- function num : 0_9_0_0 , upvalues : self, oldData
      if window == nil then
        return 
      end
      self:UpdateAthReward()
      window:InitResultSettlement(self.isWin, self.backRewards, self.rewardList, oldData)
      self:Delete()
    end
)
  end
)
end

UIExplorationResult.OnBtnFailGiveUp = function(self)
  -- function num : 0_10 , upvalues : _ENV
  self:StartFailGiveUpConfirm(function()
    -- function num : 0_10_0 , upvalues : _ENV
    ExplorationManager:ExitExploration()
  end
)
end

UIExplorationResult.StartFailSettle = function(self, costumeStm, clearAction)
  -- function num : 0_11 , upvalues : _ENV
  ExplorationManager:SendSettle(function(msg)
    -- function num : 0_11_0 , upvalues : self, clearAction
    if self._battleEndClear ~= nil then
      (self._battleEndClear)()
    end
    if clearAction ~= nil then
      clearAction()
    end
  end
, costumeStm)
end

UIExplorationResult.StartFailGiveUpConfirm = function(self, clearAction)
  -- function num : 0_12 , upvalues : _ENV
  local returnStamina, _, costStamina = ExplorationManager:GetReturnStamina()
  if costStamina == 0 then
    self:StartFailSettle(false, clearAction)
    return 
  end
  local msg = nil
  if returnStamina == 0 then
    msg = ConfigData:GetTipContent(TipContent.exploration_Player_ExitExpo)
  else
    msg = (string.format)(ConfigData:GetTipContent(TipContent.exploration_Player_ExitExpoWithStaminaBack), returnStamina)
  end
  ;
  ((CS.MessageCommon).ShowMessageBox)(msg, function()
    -- function num : 0_12_0 , upvalues : _ENV, self, clearAction
    ExplorationManager:SendSettle(function(msg)
      -- function num : 0_12_0_0 , upvalues : self, clearAction
      if self._battleEndClear ~= nil then
        (self._battleEndClear)()
      end
      if clearAction ~= nil then
        clearAction()
      end
    end
)
  end
, nil)
end

UIExplorationResult.StartFailRewardConfirm = function(self, clearAction)
  -- function num : 0_13 , upvalues : _ENV
  local _, _, _, stamina = ExplorationManager:GetReturnStamina()
  local msg = (string.format)(ConfigData:GetTipContent(TipContent.exploration_jump), stamina)
  ;
  ((CS.MessageCommon).ShowMessageBox)(msg, function()
    -- function num : 0_13_0 , upvalues : _ENV, self, clearAction
    ExplorationManager:SendSettle(function(msg)
      -- function num : 0_13_0_0 , upvalues : self, clearAction
      if self._battleEndClear ~= nil then
        (self._battleEndClear)()
      end
      if clearAction ~= nil then
        clearAction()
      end
    end
, true)
  end
, nil)
end

UIExplorationResult.OnBtnSuccessSettle = function(self)
  -- function num : 0_14 , upvalues : _ENV
  UIManager:ShowWindowAsync(UIWindowTypeID.ExplorationResultSettlement, function(window)
    -- function num : 0_14_0 , upvalues : self
    if window == nil then
      return 
    end
    self:UpdateAthReward()
    window:InitResultSettlement(self.isWin, self.backRewards, self.rewardList, self.resultSettlementData)
    self:Delete()
  end
)
end

UIExplorationResult.__ResetAllResultGroup = function(self)
  -- function num : 0_15
  ((self.ui).normalBtnGroup):SetActive(false)
  ;
  ((self.ui).overBtnGroup):SetActive(false)
  ;
  ((self.ui).failureBtnGroup):SetActive(false)
  ;
  ((self.ui).completeBtnGroup):SetActive(false)
end

UIExplorationResult.UpdataResultsUI = function(self, isWin, isFloor, needFirsPassReward)
  -- function num : 0_16 , upvalues : _ENV
  local resultBG_Material = ((self.ui).img_ResultBG).material
  self:__ResetAllResultGroup()
  if not isFloor then
    isFloor = false
  end
  if isWin then
    AudioManager:PlayAudioById(1003)
    ;
    ((self.ui).completeBtnGroup):SetActive(true)
    ;
    ((self.ui).img_ResultState):SetIndex(0)
    ;
    ((self.ui).tex_ResultState):SetIndex(0)
    ;
    ((self.ui).vectoryNode):SetActive(true)
    ;
    ((self.ui).failureNode):SetActive(false)
    resultBG_Material:SetFloat("_Decoloration", 0)
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self.ui).img_ResultBG).color = (self.ui).col_Success
  else
    AudioManager:PlayAudioById(1004)
    ;
    ((self.ui).img_ResultState):SetIndex(1)
    ;
    ((self.ui).tex_ResultState):SetIndex(1)
    ;
    ((self.ui).vectoryNode):SetActive(false)
    ;
    ((self.ui).failureNode):SetActive(true)
    resultBG_Material:SetFloat("_Decoloration", 1)
    local returnStamina, remainLevelCount, costStamina, rewardReturnStamina = ExplorationManager:GetReturnStamina()
    if costStamina <= 0 then
      ((self.ui).normalBtnGroup):SetActive(true)
    else
      local retreatStamina = nil
      ExplorationManager:GetReturnStamina()
      ;
      ((self.ui).failureBtnGroup):SetActive(true)
      -- DECOMPILER ERROR at PC102: Confused about usage of register: R10 in 'UnsetPending'

      ;
      ((self.ui).tex_GetRewardPoint).text = tostring(rewardReturnStamina)
      -- DECOMPILER ERROR at PC108: Confused about usage of register: R10 in 'UnsetPending'

      ;
      ((self.ui).tex_RetreatPoint).text = tostring(returnStamina)
    end
  end
  do
    ;
    (((((self.ui).tex_CurLevelLayer).transform).parent).gameObject):SetActive(isFloor)
    if isFloor then
      ((self.ui).completeBtnGroup):SetActive(false)
      ;
      ((self.ui).overBtnGroup):SetActive(true)
      ;
      ((self.ui).tex_CurLevelLayer):SetIndex(0, tostring(ExplorationManager:GetCurLevelIndex() + 1))
      ;
      ((self.ui).tex_ResultState):SetIndex(2)
      resultBG_Material:SetFloat("_Decoloration", 0)
      -- DECOMPILER ERROR at PC153: Confused about usage of register: R5 in 'UnsetPending'

      ;
      ((self.ui).img_ResultBG).color = (self.ui).col_Over
    end
    ;
    (((self.ui).tex_LevelName).gameObject):SetActive(not isFloor)
    do
      if not isFloor then
        local sectorStageCfg = ExplorationManager:GetSectorStageCfg()
        if sectorStageCfg ~= nil then
          if sectorStageCfg.endlessCfg ~= nil then
            ((self.ui).tex_LevelCount):SetIndex(1, tostring((sectorStageCfg.endlessCfg).index * 10))
          else
            if sectorStageCfg.challengeCfg ~= nil then
              ((self.ui).tex_LevelCount):SetIndex(2)
            else
              ;
              ((self.ui).tex_LevelCount):SetIndex(0, tostring(sectorStageCfg.sector) .. "-" .. tostring(sectorStageCfg.num))
            end
          end
          -- DECOMPILER ERROR at PC209: Confused about usage of register: R6 in 'UnsetPending'

          ;
          ((self.ui).tex_LevelName).text = (LanguageUtil.GetLocaleText)(sectorStageCfg.name)
        end
      end
      self:ShowReward(isWin, isFloor, needFirsPassReward)
      self:ShowExp()
      self:ShowChip()
      self:ShowCoin()
      self:ShowPowerIncrease()
      self:ShowMVP()
      self:ShowGBack()
    end
  end
end

UIExplorationResult.IsCanShowAth = function(self)
  -- function num : 0_17 , upvalues : _ENV
  return FunctionUnlockMgr:ValidateUnlock(proto_csmsg_SystemFunctionID.SystemFunctionID_Algorithm)
end

UIExplorationResult.UpdateAthReward = function(self)
  -- function num : 0_18 , upvalues : _ENV
  if PlayerDataCenter.lastAthDiff ~= nil then
    local athIndex = 0
    for i = 1, #self.rewardList do
      local item = (self.rewardList)[i]
      if (item.itemCfg).type == eItemType.Arithmetic or (item.itemCfg).id >= 8000 and (item.itemCfg).id <= 8100 then
        athIndex = athIndex + 1
        local ath = (PlayerDataCenter.lastAthDiff)[athIndex]
        if ath ~= nil then
          item = {num = 1, itemCfg = ath.itemCfg, isAth = true, ath = athData}
          -- DECOMPILER ERROR at PC41: Confused about usage of register: R8 in 'UnsetPending'

          ;
          (self.rewardList)[i] = item
          ;
          (table.remove)(PlayerDataCenter.lastAthDiff, #PlayerDataCenter.lastAthDiff)
        end
      end
    end
    -- DECOMPILER ERROR at PC52: Confused about usage of register: R2 in 'UnsetPending'

    PlayerDataCenter.lastAthDiff = nil
    ExplorationManager:RewardSort(self.rewardList)
  end
end

UIExplorationResult.ShowReward = function(self, isWin, isFloor, needFirsPassReward)
  -- function num : 0_19 , upvalues : _ENV, cs_DoTween, cs_MessageCommon
  local isShowAth = self:IsCanShowAth()
  self.rewardList = {}
  local hasRandomAth = false
  local items = {}
  local addItem = function(itemId, num)
    -- function num : 0_19_0 , upvalues : _ENV, isFloor, hasRandomAth, isShowAth, items
    local isAthItem = (itemId >= 8000 and itemId <= 8100) or ((ConfigData.item)[itemId]).type == eItemType.Arithmetic
    if isAthItem and not isFloor and PlayerDataCenter.lastAthDiff ~= nil then
      hasRandomAth = true
      return 
    end
    -- DECOMPILER ERROR at PC36: Unhandled construct in 'MakeBoolean' P1

    if (not isAthItem or isShowAth) and items[itemId] ~= nil then
      items[itemId] = items[itemId] + num
    else
      items[itemId] = num
    end
    -- DECOMPILER ERROR: 5 unprocessed JMP targets
  end

  for itemId,num in pairs(self.rewardsRecord) do
    do
      addItem(itemId, num)
    end
  end
  if self.firstClearRewards ~= nil then
    do
      for itemId,num in pairs(self.firstClearRewards) do
        addItem(itemId, num)
      end
    end
  end
  do
    for itemId,itemNum in pairs(items) do
      local itemCfg = (ConfigData.item)[itemId]
      if itemCfg == nil then
        error("can\'t get itemCfg with id=" .. tostring(itemId))
      end
      ;
      (table.insert)(self.rewardList, {num = itemNum, itemCfg = itemCfg})
    end
    if hasRandomAth and not isFloor then
      if PlayerDataCenter.lastAthDiff ~= nil then
        for _,athData in ipairs(PlayerDataCenter.lastAthDiff) do
          (table.insert)(self.rewardList, {num = 1, itemCfg = athData.itemCfg, isAth = true, athData = athData})
        end
      end
      do
        -- DECOMPILER ERROR at PC81: Confused about usage of register: R8 in 'UnsetPending'

        PlayerDataCenter.lastAthDiff = nil
        ExplorationManager:RewardSort(self.rewardList)
        local containAth = false
        for k,v in ipairs(self.rewardList) do
          if not containAth and (v.itemCfg).type == eItemType.Arithmetic then
            containAth = true
          end
          local rewardItem = (self.rewardItemPool):GetOne()
          rewardItem:InitItemWithCount(v.itemCfg, v.num, function()
    -- function num : 0_19_1 , upvalues : _ENV, self, k
    UIManager:ShowWindowAsync(UIWindowTypeID.GlobalItemDetail, function(win)
      -- function num : 0_19_1_0 , upvalues : self, k
      if win ~= nil then
        win:InitListDetail(self.rewardList, k)
      end
    end
)
  end
)
        end
        local rewardSequence = (cs_DoTween.Sequence)()
        for index,item in ipairs((self.rewardItemPool).listItem) do
          item:SetFade(0)
          rewardSequence:AppendCallback(function()
    -- function num : 0_19_2 , upvalues : item, self
    item:LoadGetRewardFx(self.resloader, 5)
  end
)
          rewardSequence:Append((item:GetFade()):DOFade(1, 0.15))
        end
        rewardSequence:SetDelay(0.15)
        rewardSequence:Play()
        if self.rewardSequence ~= nil then
          (self.rewardSequence):Kill()
        end
        self.rewardSequence = rewardSequence
        if containAth and (ConfigData.game_config).athMaxNum <= #(PlayerDataCenter.allAthData):GetAllAthList() then
          (cs_MessageCommon.ShowMessageTips)(ConfigData:GetTipContent(TipContent.Ath_MaxCount))
        end
      end
    end
  end
end

UIExplorationResult.ShowExp = function(self)
  -- function num : 0_20 , upvalues : _ENV
  local exp = (self.backRewards).exp or 0
  ;
  ((self.ui).obj_expNode):SetActive(exp > 0)
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self.ui).tex_Exp).text = tostring(exp)
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

UIExplorationResult.ShowChip = function(self)
  -- function num : 0_21 , upvalues : _ENV
  self.chipList = ((ExplorationManager.epCtrl).dynPlayer):GetChipList()
  local chipNum = 0
  for _,chipData in ipairs(self.chipList) do
    chipNum = chipNum + chipData:GetCount()
  end
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self.ui).tex_ChipCount).text = tostring(chipNum)
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R2 in 'UnsetPending'

  if chipNum <= 0 then
    ((self.ui).btn_Detail).interactable = false
  else
    -- DECOMPILER ERROR at PC30: Confused about usage of register: R2 in 'UnsetPending'

    ;
    ((self.ui).btn_Detail).interactable = true
  end
end

UIExplorationResult.ShowCoin = function(self)
  -- function num : 0_22 , upvalues : _ENV
  local CCNum = (self.backRewards).eplGold or 0
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self.ui).tex_MoneyCount).text = tostring(CCNum)
end

UIExplorationResult.ShowPowerIncrease = function(self)
  -- function num : 0_23 , upvalues : _ENV
  local newPower = ((ExplorationManager.epCtrl).dynPlayer):GetTotalFightingPower(true, false)
  local oldPower = ((ExplorationManager.epCtrl).dynPlayer):GetMirrorTeamFightPower(true, false)
  local increase = GetPreciseDecimalStr((newPower / oldPower - 1) * 100, 0)
  ;
  ((self.ui).tex_BuffRate):SetIndex(0, tostring(increase))
end

UIExplorationResult.ShowMVP = function(self)
  -- function num : 0_24 , upvalues : _ENV, cs_ResLoader
  if not self.isWin then
    return 
  end
  if ExplorationManager.epMvpData ~= nil then
    local heroId, MvpType, diggestRate = (ExplorationManager.epMvpData):GetEpMvpData()
    local heroData = (PlayerDataCenter.heroDic)[heroId]
    local cvCtr = ControllerManager:GetController(ControllerTypeId.Cv, true)
    cvCtr:PlayCv(heroId, ConfigData:GetVoicePointRandom(5))
    ;
    ((self.ui).tex_MvpType):SetIndex(MvpType)
    ;
    ((self.ui).tex_Rate):SetIndex(0, GetPreciseDecimalStr(diggestRate * 100, 0))
    if self.bigImgResloader ~= nil then
      (self.bigImgResloader):Put2Pool()
    end
    self.bigImgResloader = (cs_ResLoader.Create)()
    ;
    (self.bigImgResloader):LoadABAssetAsync(PathConsts:GetCharacterBigImgPrefabPath(heroData:GetResName()), function(prefab)
    -- function num : 0_24_0 , upvalues : _ENV, self
    DestroyUnityObject(self.bigImgGameObject)
    self.bigImgGameObject = prefab:Instantiate((self.ui).heroBigImgNode)
    local commonPicCtrl = (self.bigImgGameObject):FindComponent(eUnityComponentID.CommonPicController)
    commonPicCtrl:SetPosType("HeroList")
  end
)
  end
end

UIExplorationResult.ShowAllChips = function(self)
  -- function num : 0_25 , upvalues : _ENV
  UIManager:ShowWindowAsync(UIWindowTypeID.ViewChips, function(windows)
    -- function num : 0_25_0 , upvalues : self
    if windows ~= nil then
      self.viewAllChipWin = windows
      if self.chipList ~= nil then
        windows:InitChips(self.chipList, self.resloader)
      end
    end
  end
)
end

UIExplorationResult.ShowAllItems = function(self)
  -- function num : 0_26 , upvalues : _ENV
  UIManager:ShowWindowAsync(UIWindowTypeID.ViewItems, function(windows)
    -- function num : 0_26_0 , upvalues : self
    if windows ~= nil then
      self.viewAllItemWin = windows
      windows:InitItems(self.rewardList, self.resloader)
    end
  end
)
end

UIExplorationResult.ShowGBack = function(self)
  -- function num : 0_27 , upvalues : _ENV
  local convertItemId = (ConfigData.game_config).epMoneyConvert
  local convertMoney = (self.backRewards).exByte or 0
  do
    if convertMoney > 0 then
      local itemCfg = (ConfigData.item)[convertItemId]
      -- DECOMPILER ERROR at PC21: Confused about usage of register: R4 in 'UnsetPending'

      if itemCfg ~= nil then
        ((self.ui).img_BackItemIcom).sprite = CRH:GetSprite(itemCfg.small_icon)
        -- DECOMPILER ERROR at PC29: Confused about usage of register: R4 in 'UnsetPending'

        ;
        ((self.ui).Tex_BackCount).text = "+" .. tostring(convertMoney)
        ;
        ((self.ui).resTransformation):SetActive(true)
        return 
      end
    end
    ;
    ((self.ui).resTransformation):SetActive(false)
  end
end

UIExplorationResult.Jump2HeroState = function(self)
  -- function num : 0_28 , upvalues : _ENV, JumpManager
  self:StartFailRewardConfirm(function()
    -- function num : 0_28_0 , upvalues : _ENV, JumpManager
    ExplorationManager:ExitExploration((Consts.SceneName).Main, function()
      -- function num : 0_28_0_0 , upvalues : JumpManager
      JumpManager:Jump((JumpManager.eJumpTarget).Hero)
    end
)
  end
)
end

UIExplorationResult.OnClickRecomme = function(self)
  -- function num : 0_29 , upvalues : _ENV
  local fmtCtr = ControllerManager:GetController(ControllerTypeId.Formation, true)
  fmtCtr:ReqRecommeFormation(self:GetDungeonId(), false)
end

UIExplorationResult.GetDungeonId = function(self)
  -- function num : 0_30 , upvalues : _ENV
  local dungeonId = nil
  local moduleId = ExplorationManager:GetEpModuleId()
  if moduleId == proto_csmsg_SystemFunctionID.SystemFunctionID_Exploration then
    dungeonId = (ExplorationManager.stageCfg).id
  else
    if moduleId == proto_csmsg_SystemFunctionID.SystemFunctionID_Endless then
      dungeonId = (ExplorationManager.stageCfg).dungeonId
    end
  end
  return dungeonId
end

UIExplorationResult.OnDelete = function(self)
  -- function num : 0_31 , upvalues : base
  if self.resLoader ~= nil then
    (self.resLoader):Put2Pool()
    self.resLoader = nil
  end
  if self.bigImgResloader ~= nil then
    (self.bigImgResloader):Put2Pool()
    self.bigImgResloader = nil
  end
  if self.viewAllChipWin ~= nil then
    (self.viewAllChipWin):Delete()
  end
  if self.viewAllItemWin ~= nil then
    (self.viewAllItemWin):Delete()
  end
  if self.rewardSequence ~= nil then
    (self.rewardSequence):Kill()
    self.rewardSequence = nil
  end
  ;
  (base.OnDelete)(self)
end

return UIExplorationResult

