-- params : ...
-- function num : 0 , upvalues : _ENV
local UINDifficultList = class("UINDifficultList", UIBaseNode)
local base = UIBaseNode
local UINDiffLevelCanvas = require("Game.Sector.SectorLevel.UINDiffLevelCanvas")
local UINInfinityLevelCanvas = require("Game.Sector.SectorLevel.UINInfinityLevelCanvas")
local CS_ResLoader = CS.ResLoader
UINDifficultList.OnInit = function(self)
  -- function num : 0_0 , upvalues : _ENV, CS_ResLoader
  self.isShowingInfinity = false
  ;
  (UIUtil.LuaUIBindingTable)(self.transform, self.ui)
  self.__onChangeDiffComplete = BindCallback(self, self.OnChangeLevelDifficultyComplete)
  self.resLoader = (CS_ResLoader.Create)()
  self.__sectorLevelTipsGuides = {}
end

UINDifficultList.InitDifficeltLevel = function(self, sectorId, lastEpStateCfg, levelItemClickEvent, levelAvgMainClickEvent, lAvgSubClickEvent, clickBackFunc)
  -- function num : 0_1 , upvalues : _ENV
  self.sectorId = sectorId
  self.lastEpStateCfg = lastEpStateCfg
  self.levelItemClickEvent = levelItemClickEvent
  self.levelAvgMainClickEvent = levelAvgMainClickEvent
  self.lAvgSubClickEvent = lAvgSubClickEvent
  self.clickBackFunc = clickBackFunc
  local sectorCfg = (ConfigData.sector)[sectorId]
  do
    if sectorCfg ~= nil then
      local path = PathConsts:GetSectorBackgroundPath(sectorCfg.pic_big)
      if not (string.IsNullOrEmpty)(path) then
        self.bgTexture = (self.resLoader):LoadABAsset(path)
      end
    end
    local lastSelectDiff = (PlayerDataCenter.sectorStage).lastSelectDiff
    if lastEpStateCfg ~= nil then
      lastSelectDiff = lastEpStateCfg.difficulty
    end
    if lastSelectDiff == (ConfigData.sector_stage).difficultyCount + 1 then
      self.infinityLevelCanvas = self:GetInfinityLevelCanvasItem()
      ;
      (self.infinityLevelCanvas):InitInfinityLevelCanvas(sectorId, self.lastEpStateCfg, function()
    -- function num : 0_1_0 , upvalues : self
    if self.diffLevelCanva ~= nil then
      (self.diffLevelCanvas):Hide()
    end
  end
, self.resLoader)
      self.isShowingInfinity = true
    else
      if self.diffLevelCanvas == nil then
        self.diffLevelCanvas = self:GetDiffLevelCanvasItem()
      end
      ;
      (self.diffLevelCanvas):InitDiffLevelCanvas(sectorId, lastEpStateCfg, lastSelectDiff, self.levelItemClickEvent, self.levelAvgMainClickEvent, self.lAvgSubClickEvent, self.__onChangeDiffComplete, self.resLoader, self.__sectorLevelTipsGuides, self.clickBackFunc)
    end
    self:__InitRedDotEvent()
  end
end

UINDifficultList.__InitRedDotEvent = function(self)
  -- function num : 0_2 , upvalues : _ENV
  self.__onLevelItemRedDotEvent = function(node)
    -- function num : 0_2_0 , upvalues : self, _ENV
    local difficulty = node:GetParentNodeId()
    local sectorId = (node:GetParentNode()):GetParentNodeId()
    if node:GetRedDotCount() <= 0 then
      do
        local show = sectorId ~= self.sectorId or difficulty ~= (PlayerDataCenter.sectorStage).lastSelectDiff
        ;
        (self.diffLevelCanvas):SetSectorStageItemRedDot(node.nodeId, show)
        -- DECOMPILER ERROR: 2 unprocessed JMP targets
      end
    end
  end

  RedDotController:AddListener(RedDotDynPath.SectorLevelBtnPath, self.__onLevelItemRedDotEvent)
  self.__onLAvgMainItemRedDotEvent = function(node)
    -- function num : 0_2_1 , upvalues : self, _ENV
    local difficulty = (node:GetParentNode()):GetParentNodeId()
    local sectorId = ((node:GetParentNode()):GetParentNode()):GetParentNodeId()
    if node:GetRedDotCount() <= 0 then
      do
        local show = sectorId ~= self.sectorId or difficulty ~= (PlayerDataCenter.sectorStage).lastSelectDiff
        ;
        (self.diffLevelCanvas):SetSectorLAvgMainItemRedDot(node.nodeId, show)
        -- DECOMPILER ERROR: 2 unprocessed JMP targets
      end
    end
  end

  RedDotController:AddListener(RedDotDynPath.SectorMainAvgPath, self.__onLAvgMainItemRedDotEvent)
end

UINDifficultList.GetDiffLevelCanvasItem = function(self)
  -- function num : 0_3 , upvalues : _ENV, UINDiffLevelCanvas
  local item = nil
  local prefab = (self.resLoader):LoadABAsset(PathConsts:GetUIPrefabPath("UI_SectorLevelMap"))
  local go = prefab:Instantiate()
  local rectTransform = go.transform
  rectTransform:SetParent(self.transform)
  rectTransform.localScale = (Vector3.New)(1, 1, 1)
  rectTransform:SetAsLastSibling()
  rectTransform.localPosition = (Vector3.New)(0, 0, 0)
  rectTransform.offsetMax = (Vector2.New)(0, 0)
  rectTransform.offsetMin = (Vector2.New)(0, 0)
  item = (UINDiffLevelCanvas.New)()
  item:Init(go)
  item:SetBackground(self.bgTexture)
  return item
end

UINDifficultList.GetInfinityLevelCanvasItem = function(self)
  -- function num : 0_4 , upvalues : _ENV, UINInfinityLevelCanvas
  if self.infinityLevelCanvas ~= nil then
    return self.infinityLevelCanvas
  end
  local item = nil
  local prefab = (self.resLoader):LoadABAsset(PathConsts:GetUIPrefabPath("UI_SectorLevelInfinityMap"))
  local go = prefab:Instantiate()
  local rectTransform = go.transform
  rectTransform:SetParent(self.transform)
  rectTransform.localScale = (Vector3.New)(1, 1, 1)
  rectTransform:SetAsLastSibling()
  rectTransform.localPosition = (Vector3.New)(0, 0, 0)
  rectTransform.offsetMax = (Vector2.New)(0, 0)
  rectTransform.offsetMin = (Vector2.New)(0, 0)
  item = (UINInfinityLevelCanvas.New)()
  item:Init(go)
  item:SetBackground(self.bgTexture)
  return item
end

UINDifficultList.ChangeLevelDifficulty = function(self, difficulty)
  -- function num : 0_5 , upvalues : _ENV
  if (PlayerDataCenter.sectorStage).lastSelectDiff == difficulty then
    return 
  end
  local isUpTween = (PlayerDataCenter.sectorStage).lastSelectDiff < difficulty
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (PlayerDataCenter.sectorStage).lastSelectDiff = difficulty
  if difficulty == (ConfigData.sector_stage).difficultyCount + 1 then
    self.infinityLevelCanvas = self:GetInfinityLevelCanvasItem()
    ;
    (self.infinityLevelCanvas):Show()
    ;
    (self.infinityLevelCanvas):InitInfinityLevelCanvas(self.sectorId, self.lastEpStateCfg, function()
    -- function num : 0_5_0 , upvalues : self
    if self.diffLevelCanva ~= nil then
      (self.diffLevelCanvas):Hide()
    end
  end
)
    if self.diffLevelCanvas ~= nil then
      (self.diffLevelCanvas):PlayDiffLevelCanvasSwitchTween(true)
    end
    self.isShowingInfinity = true
    return 
  else
    self.isShowingInfinity = false
  end
  if self.newDiffLevelCanvas == nil then
    self.newDiffLevelCanvas = self:GetDiffLevelCanvasItem()
  end
  ;
  (self.newDiffLevelCanvas):Show()
  ;
  (self.newDiffLevelCanvas):InitDiffLevelCanvas(self.sectorId, self.lastEpStateCfg, difficulty, self.levelItemClickEvent, self.levelAvgMainClickEvent, self.lAvgSubClickEvent, self.__onChangeDiffComplete, self.resLoader, self.__sectorLevelTipsGuides, self.clickBackFunc)
  if isUpTween then
    (self.diffLevelCanvas):PlayDiffLevelCanvasSwitchTween(isUpTween)
  else
    (self.newDiffLevelCanvas):PlayDiffLevelCanvasSwitchTween(isUpTween)
  end
  -- DECOMPILER ERROR: 7 unprocessed JMP targets
end

UINDifficultList.OnChangeLevelDifficultyComplete = function(self)
  -- function num : 0_6
  self.diffLevelCanvas = self.newDiffLevelCanvas
  if not self.isShowingInfinity and self.infinityLevelCanvas ~= nil then
    (self.infinityLevelCanvas):Hide()
  end
  if self.newDiffLevelCanvas ~= nil then
    (self.newDiffLevelCanvas):Hide()
  end
end

UINDifficultList.PlayMoveLeftTween = function(self, isLeft, offset, duration)
  -- function num : 0_7 , upvalues : _ENV
  do
    if self.__moveLeftTween == nil then
      local endValue = (Vector2.unity_vector2)(1 - offset / (((self.transform).rect).width + (self.ui).moveLeftTwenOffset), 1)
      self.__moveLeftTween = ((self.transform):DOAnchorMax(endValue, duration)):SetAutoKill(false)
      self.__moveLeftTweenDuration = duration
    end
    if isLeft then
      (self.__moveLeftTween):PlayForward()
    else
      ;
      (self.__moveLeftTween):PlayBackwards()
      ;
      (self.diffLevelCanvas):PlayDiffLevelContentTween(self.__moveLeftTweenDuration)
    end
  end
end

UINDifficultList.RefreshUncompletedEp = function(self, lastEpStateCfg)
  -- function num : 0_8
  self.lastEpStateCfg = lastEpStateCfg
  if self.isShowingInfinity then
    (self.infinityLevelCanvas):RefreshUncompletedEp(lastEpStateCfg)
  else
    ;
    (self.diffLevelCanvas):RefreshUncompletedEp(lastEpStateCfg)
  end
end

UINDifficultList.RefreshCurDiffLevelState = function(self)
  -- function num : 0_9
  (self.diffLevelCanvas):RefreshLevelState()
end

UINDifficultList.LocationSectorStageItem = function(self, id, isAvg)
  -- function num : 0_10
  if self.diffLevelCanvas == nil then
    return nil, nil
  end
  return (self.diffLevelCanvas):LocationSectorStageItem(id, isAvg)
end

UINDifficultList.SetSectorStageItemTipsGuide = function(self, id, isAvg, show_dir)
  -- function num : 0_11
  local tipsGuideDic = (self.__sectorLevelTipsGuides)[isAvg]
  if tipsGuideDic == nil then
    tipsGuideDic = {}
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.__sectorLevelTipsGuides)[isAvg] = tipsGuideDic
  end
  tipsGuideDic[id] = show_dir
  local stageItem, levelGroup = self:LocationSectorStageItem(id, isAvg)
  if stageItem ~= nil and levelGroup ~= nil then
    levelGroup:SectorLevelTryTipsGuide(stageItem, id, isAvg)
  end
end

UINDifficultList.ClearSectorStageItemTipsGuide = function(self, id, isAvg)
  -- function num : 0_12
  local tipsGuideDic = (self.__sectorLevelTipsGuides)[isAvg]
  if tipsGuideDic == nil then
    return 
  end
  tipsGuideDic[id] = nil
  local stageItem, levelGroup = self:LocationSectorStageItem(id, isAvg)
  if stageItem ~= nil and levelGroup ~= nil then
    levelGroup:SectorLevelClearTipsGuide(stageItem)
  end
end

UINDifficultList.OnDelete = function(self)
  -- function num : 0_13 , upvalues : _ENV, base
  if self.__moveLeftTween ~= nil then
    (self.__moveLeftTween):Kill()
    self.__moveLeftTween = nil
  end
  RedDotController:RemoveListener(RedDotDynPath.SectorLevelBtnPath, self.__onLevelItemRedDotEvent)
  RedDotController:RemoveListener(RedDotDynPath.SectorMainAvgPath, self.__onLAvgMainItemRedDotEvent)
  if self.infinityLevelCanvas ~= nil then
    (self.infinityLevelCanvas):Delete()
  end
  if self.diffLevelCanvas ~= nil then
    (self.diffLevelCanvas):Delete()
  end
  if self.newDiffLevelCanvas ~= nil then
    (self.newDiffLevelCanvas):Delete()
  end
  ;
  (self.resLoader):Put2Pool()
  self.resLoader = nil
  ;
  (base.OnDelete)(self)
end

return UINDifficultList

