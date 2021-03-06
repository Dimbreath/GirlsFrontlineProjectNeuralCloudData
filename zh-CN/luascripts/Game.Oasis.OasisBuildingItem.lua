-- params : ...
-- function num : 0 , upvalues : _ENV
local OasisBuildingItem = class("OasisBuildingItem")
local cs_GameObject = (CS.UnityEngine).GameObject
local cs_ResLoader = CS.ResLoader
local CoordinateConvert = require("Game.Oasis.OasisCoordinateConvert")
OasisBuildingItem.Initialize = function(self, unityPosition, size, height, areaTransform)
  -- function num : 0_0 , upvalues : cs_GameObject, _ENV, cs_ResLoader, CoordinateConvert
  self.rootGameObject = cs_GameObject()
  self.rootTransform = (self.rootGameObject).transform
  local upgradingEffectRootGo = cs_GameObject("UpgradingEffectRoot")
  self.upgradingEffectTrans = upgradingEffectRootGo.transform
  ;
  (self.upgradingEffectTrans):SetParent(self.rootTransform)
  ;
  (self.rootTransform):SetLayer(LayerMask.Raycast)
  self.resloader = (cs_ResLoader.Create)()
  self.size = size
  self.height = height
  self.unitySize = (Vector3.New)()
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (self.unitySize).y = self.height
  if #self.size ~= 2 then
    error("building size cfg error")
  end
  local sizeType = (self.size)[1]
  if sizeType == 1 then
    local areaX = (self.size)[2] * 2 * (CoordinateConvert.GetHexWidth)()
    local areaZ = (((self.size)[2] * 2 - 1) * 3 / 4 + 1) * (CoordinateConvert.GetHexHeight)()
    -- DECOMPILER ERROR at PC60: Confused about usage of register: R9 in 'UnsetPending'

    ;
    (self.unitySize).x = areaX
    -- DECOMPILER ERROR at PC62: Confused about usage of register: R9 in 'UnsetPending'

    ;
    (self.unitySize).z = areaZ
  else
    do
      -- DECOMPILER ERROR at PC70: Confused about usage of register: R7 in 'UnsetPending'

      if sizeType == 2 then
        (self.unitySize).x = 2 * (CoordinateConvert.GetHexWidth)()
        -- DECOMPILER ERROR at PC75: Confused about usage of register: R7 in 'UnsetPending'

        ;
        (self.unitySize).z = 1.75 * (CoordinateConvert.GetHexHeight)()
      else
        -- DECOMPILER ERROR at PC83: Confused about usage of register: R7 in 'UnsetPending'

        if sizeType == 3 then
          (self.unitySize).x = 2 * (CoordinateConvert.GetHexWidth)()
          -- DECOMPILER ERROR at PC88: Confused about usage of register: R7 in 'UnsetPending'

          ;
          (self.unitySize).z = 2.5 * (CoordinateConvert.GetHexHeight)()
        end
      end
      self.overlap = false
      self:SetItemArea(areaTransform)
      -- DECOMPILER ERROR at PC94: Confused about usage of register: R7 in 'UnsetPending'

      ;
      (self.rootTransform).localPosition = unityPosition
    end
  end
end

OasisBuildingItem.LoadBuildingGo = function(self, prefabName, callBack)
  -- function num : 0_1 , upvalues : _ENV, cs_ResLoader
  if prefabName == nil then
    if ((self.buildingData).levelConfig)[(self.buildingData).level] == nil then
      error("请检查OasisBuilding配表，配置的" .. (self.buildingData).id .. "-等级[" .. (self.buildingData).level .. "]配置为空")
    end
    prefabName = (((self.buildingData).levelConfig)[(self.buildingData).level]).modol
  end
  if self.__isInLoadingObj then
    (self.resloader):Put2Pool()
    self.resloader = (cs_ResLoader.Create)()
  end
  self.__isInLoadingObj = true
  local path = PathConsts:GetOasisBuildingPrefabPath(prefabName)
  ;
  (self.resloader):LoadABAssetAsync(path, function(prefab)
    -- function num : 0_1_0 , upvalues : self, callBack
    if prefab == nil then
      self.__isInLoadingObj = false
      return 
    end
    local go = prefab:Instantiate()
    self:SetGameObject(go)
    self.__isInLoadingObj = false
    self:UpdateCanvasItemPos()
    if callBack ~= nil then
      callBack(self)
    end
  end
)
end

OasisBuildingItem.SetGameObject = function(self, gameObject)
  -- function num : 0_2 , upvalues : _ENV
  if IsNull(self.rootGameObject) then
    return 
  end
  local oldParent = nil
  local isReplace = false
  if not IsNull(self.gameObject) then
    isReplace = true
    oldParent = (self.transform).parent
    DestroyUnityObject(self.gameObject)
  end
  ;
  (gameObject.transform):SetParent(self.rootTransform)
  self.bind = {}
  ;
  (UIUtil.LuaUIBindingTable)(gameObject, self.bind)
  self.gameObject = gameObject
  self.transform = gameObject.transform
  -- DECOMPILER ERROR at PC36: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self.transform).localPosition = Vector3.zero
  self.select = ((gameObject.transform):Find("Select")).gameObject
  ;
  (self.transform):SetLayer((self.rootGameObject).layer)
  self:Select(self.selectState)
  self.selectRenderer = (self.select):FindComponent(eUnityComponentID.Renderer)
  local scale = ((self.select).transform).localScale
  scale.x = (self.unitySize).x
  scale.y = (self.unitySize).z
  -- DECOMPILER ERROR at PC68: Confused about usage of register: R5 in 'UnsetPending'

  ;
  ((self.select).transform).localScale = scale
  -- DECOMPILER ERROR at PC73: Confused about usage of register: R5 in 'UnsetPending'

  ;
  ((self.select).transform).localPosition = Vector3.zero
  local scale = (self.upgradingEffectTrans).localScale
  scale.x = (self.unitySize).x
  scale.z = (self.unitySize).z
  -- DECOMPILER ERROR at PC83: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (self.upgradingEffectTrans).localScale = scale
  self:Overlap(self.overlap)
  if isReplace then
    self:SetItemArea(oldParent)
    self:SetPosition((self.buildingData).position)
  end
  if self.buildingData ~= nil then
    local name = tostring((self.buildingData).id)
    -- DECOMPILER ERROR at PC104: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self.rootGameObject).name = name
    -- DECOMPILER ERROR at PC106: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self.gameObject).name = name
  end
end

OasisBuildingItem.SetCanvas = function(self, canvas)
  -- function num : 0_3
  self.canvas = canvas
  local UIbulidData = {name = (self.buildingData).name, nameEn = (self.buildingData).nameEn, level = (self.buildingData).level, canLvUp = (self.buildingData):CanUpgrade()}
  ;
  (self.canvas):CreateNameItem(self.id, UIbulidData)
  self:UpdateCanvasItemPos()
end

OasisBuildingItem.SetBuildingData = function(self, data)
  -- function num : 0_4 , upvalues : _ENV
  self.id = data.id
  self.buildingData = data
  local name = tostring(data.id)
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self.rootGameObject).name = name
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R3 in 'UnsetPending'

  if not IsNull(self.gameObject) then
    (self.gameObject).name = name
  end
end

OasisBuildingItem.Update = function(self, timestamp, isSecond)
  -- function num : 0_5
  if isSecond then
    self.__timeSecond = timestamp
    self:__TimerUpdate(timestamp)
  end
end

OasisBuildingItem.BuiltItemLateUpdate = function(self)
  -- function num : 0_6 , upvalues : _ENV
  local window = UIManager:GetWindow(UIWindowTypeID.OasisMain)
  if window ~= nil and not self:BuildGoIsInLoading() then
    (window.oasisResNode):UpdateOasisResPos(self.id, self:GetUIResPos())
  end
end

OasisBuildingItem.__TimerUpdate = function(self, timestamp)
  -- function num : 0_7 , upvalues : _ENV
  local needUpdate = false
  if self.id ~= nil then
    local builtData = self.buildingData
    if builtData ~= nil and builtData.resDatas ~= nil then
      for resId,res in pairs(builtData.resDatas) do
        if not res.resMax then
          needUpdate = true
        end
      end
    end
  end
  do
    if needUpdate then
      self:UpdateBuildingResUI()
    end
  end
end

OasisBuildingItem.UpdateProcessUI = function(self, progress, remainTimeText, waitConfirmOver)
  -- function num : 0_8
  local position = self:GetUIProcessPos()
  local canvasProgressText = waitConfirmOver and "点击完成" or remainTimeText
  if self.canvas ~= nil then
    (self.canvas):UpdateProcess(self.id, position, progress, canvasProgressText)
  end
end

OasisBuildingItem.UpdateBuildLevel = function(self, builtData)
  -- function num : 0_9
  (self.canvas):UpdateNameItemLevel(self.id, builtData.level)
end

OasisBuildingItem.SetRoundPosition = function(self, unityPosition, setPosition, getAreaList)
  -- function num : 0_10 , upvalues : CoordinateConvert
  if setPosition == nil then
    setPosition = true
  end
  local oasisPosition = (CoordinateConvert.UnityCenterToOasis)(unityPosition, self.size)
  unityPosition = (CoordinateConvert.ToUnityCenterPos)(oasisPosition, self.size)
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R5 in 'UnsetPending'

  if setPosition then
    (self.rootTransform).localPosition = unityPosition
  end
  local areaList = nil
  if getAreaList then
    areaList = (CoordinateConvert.GetHexArea)(oasisPosition, self.size)
  end
  self.newOasisPos = oasisPosition
  return oasisPosition, unityPosition, areaList
end

OasisBuildingItem.SetItemArea = function(self, areaTransform)
  -- function num : 0_11
  if (self.rootTransform).parent ~= areaTransform then
    (self.rootTransform):SetParent(areaTransform)
  end
end

OasisBuildingItem.SetPosition = function(self, oasisPos, needTween)
  -- function num : 0_12 , upvalues : CoordinateConvert
  local unityPosition = (CoordinateConvert.ToUnity)(oasisPos, self.size)
  if needTween then
    (self.rootTransform):DOLocalMove(unityPosition, 0.1)
  else
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self.rootTransform).localPosition = unityPosition
  end
end

OasisBuildingItem.GetBuildItemHeight = function(self)
  -- function num : 0_13
  if self:BuildGoIsInLoading() then
    return nil
  end
  return (((self.bind).resPos).position).y - ((self.rootTransform).position).y
end

OasisBuildingItem.GetUIResPos = function(self)
  -- function num : 0_14
  if self:BuildGoIsInLoading() then
    return nil
  end
  return ((self.bind).resPos).position
end

OasisBuildingItem.GetUINamePos = function(self)
  -- function num : 0_15
  if self:BuildGoIsInLoading() then
    return nil
  end
  return ((self.bind).namePos).position
end

OasisBuildingItem.GetBuildSelectUIPos = function(self)
  -- function num : 0_16
  if self:BuildGoIsInLoading() then
    return nil
  end
  return ((self.bind).selectPos).position
end

OasisBuildingItem.GetUIProcessPos = function(self)
  -- function num : 0_17 , upvalues : _ENV
  local uiPosition = (self.rootTransform).position + (Vector3.New)(-(self.unitySize).y * 0.5, 7, 0)
  return uiPosition
end

OasisBuildingItem.UpdateBuildingResUI = function(self)
  -- function num : 0_18 , upvalues : _ENV
  local resTab = {}
  local resTabSort = {}
  local builtData = self.buildingData
  local resDatas = builtData:GetResDatas()
  if builtData ~= nil and resDatas ~= nil and resDatas ~= nil then
    for k,v in pairs(resDatas) do
      if resTab[k] == nil then
        resTab[k] = v
        ;
        (table.insert)(resTabSort, v)
      else
        -- DECOMPILER ERROR at PC30: Confused about usage of register: R10 in 'UnsetPending'

        ;
        (resTab[k]).count = (resTab[k]).count + v.count
      end
    end
  end
  do
    if resDatas ~= nil then
      (table.sort)(resTabSort, function(a, b)
    -- function num : 0_18_0
    do return a.id < b.id end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
)
      local window = UIManager:GetWindow(UIWindowTypeID.OasisMain)
      if window ~= nil then
        if (self.buildingData):IsBuildResPeriodOk() then
          (window.oasisResNode):TryCreateOasisResItem(self.id, (resTabSort[1]).id)
          ;
          (window.oasisResNode):UpdateOasisResData(self.id, resTabSort)
        else
          ;
          (window.oasisResNode):RecycleOasisResItem(self.id)
        end
      end
      MsgCenter:Broadcast(eMsgEventId.BuildingProduceUpdate, self.id, resTabSort)
    end
  end
end

OasisBuildingItem.UpdateCanvasItemPos = function(self)
  -- function num : 0_19
  if self.buildingData == nil or self.canvas == nil or self:BuildGoIsInLoading() then
    return 
  end
  local namePos = self:GetUINamePos()
  if namePos ~= nil then
    (self.canvas):UpdateNamePos(self.id, namePos)
  end
  local processPos = self:GetUIProcessPos()
  ;
  (self.canvas):UpdateProcessPos(self.id, processPos)
end

OasisBuildingItem.Show = function(self, show)
  -- function num : 0_20 , upvalues : _ENV
  if show then
    (self.rootTransform):SetLayer(LayerMask.Raycast)
  else
    ;
    (self.rootTransform):SetLayer(LayerMask.Hide)
  end
end

OasisBuildingItem.Select = function(self, select)
  -- function num : 0_21 , upvalues : _ENV
  self.selectState = select
  if not IsNull(self.select) then
    (self.select):SetActive(select)
  end
end

OasisBuildingItem.Overlap = function(self, overlap)
  -- function num : 0_22 , upvalues : _ENV
  if self.overlap ~= overlap then
    self.overlap = overlap
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R2 in 'UnsetPending'

    if not IsNull(self.selectRenderer) then
      if overlap then
        ((self.selectRenderer).material).color = Color.red
      else
        -- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

        ;
        ((self.selectRenderer).material).color = Color.green
      end
    end
  end
end

OasisBuildingItem.UpdateState = function(self)
  -- function num : 0_23 , upvalues : _ENV
  local builtData = self.buildingData
  -- DECOMPILER ERROR at PC15: Unhandled construct in 'MakeBoolean' P1

  if builtData.state == proto_object_BuildingState.BuildingStateNormal and self.canvas ~= nil then
    (self.canvas):SetBuildName3dItemCanLevelUp(self.id, (self.buildingData):CanUpgrade())
  end
  if builtData.state == proto_object_BuildingState.BuildingStateCreate or builtData.state == proto_object_BuildingState.BuildingStateUpgrade then
  end
end

OasisBuildingItem.GetUnitySize = function(self)
  -- function num : 0_24
  return self.unitySize
end

OasisBuildingItem.EnterFocusLayer = function(self, enter)
  -- function num : 0_25 , upvalues : _ENV
  if enter then
    (self.rootTransform):SetLayer(LayerMask.Focus)
  else
    ;
    (self.rootTransform):SetLayer(LayerMask.Raycast)
  end
end

OasisBuildingItem.GetUnityPostion = function(self)
  -- function num : 0_26
  return (self.rootTransform).position
end

OasisBuildingItem.BuildGoIsInLoading = function(self)
  -- function num : 0_27
  return self.__isInLoadingObj
end

OasisBuildingItem.OnDelete = function(self)
  -- function num : 0_28
  if self.canvas ~= nil then
    (self.canvas):RecycleUI(self.id)
    self.canvas = nil
  end
  if self.resloader ~= nil then
    (self.resloader):Put2Pool()
    self.resloader = nil
  end
end

OasisBuildingItem.DeleteEntity = function(self)
  -- function num : 0_29 , upvalues : cs_GameObject
  if self.rootGameObject ~= nil then
    (cs_GameObject.Destroy)(self.rootGameObject)
    self.rootGameObject = nil
  end
end

return OasisBuildingItem

