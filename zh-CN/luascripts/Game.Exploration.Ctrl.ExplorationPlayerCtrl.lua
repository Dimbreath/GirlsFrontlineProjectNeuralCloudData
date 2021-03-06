-- params : ...
-- function num : 0 , upvalues : _ENV
local ExplorationPlayerCtrl = class("ExplorationPlayerCtrl", ExplorationCtrlBase)
ExplorationPlayerCtrl.ctor = function(self, epCtrl)
  -- function num : 0_0 , upvalues : _ENV
  self.dynPlayer = epCtrl.dynPlayer
  self.epNetwork = NetworkManager:GetNetwork(NetworkTypeID.Exploration)
  self.__onRoomSelected = BindCallback(self, self.OnMove)
  MsgCenter:AddListener(eMsgEventId.OnRoomSelected, self.__onRoomSelected)
  self.__onEpOperatorUpdate = BindCallback(self, self.UpdateEpOp)
  MsgCenter:AddListener(eMsgEventId.OnEpOpStore, self.__onEpOperatorUpdate)
  self.__onEpOperatorDiff = BindCallback(self, self.OnEpOperatorDiff)
  MsgCenter:AddListener(eMsgEventId.OnEpOperatorDiff, self.__onEpOperatorDiff)
  self.__onEpFormDetailDiff = BindCallback(self, self.OnEpFormationDetailDiff)
  MsgCenter:AddListener(eMsgEventId.OnEpFormationDetailDiff, self.__onEpFormDetailDiff)
  self.__onEpBackpackDiff = BindCallback(self, self.OnEpBackpackDiff)
  MsgCenter:AddListener(eMsgEventId.OnEpBackpackDiff, self.__onEpBackpackDiff)
  self.__OnEpBuffDiff = BindCallback(self, self.OnEpBuffDiff)
  MsgCenter:AddListener(eMsgEventId.OnEpBuffDiff, self.__OnEpBuffDiff)
  self.__OnExitRoomComplete = BindCallback(self, self.__OnRoomExitComplete)
  MsgCenter:AddListener(eMsgEventId.OnExitRoomComplete, self.__OnExitRoomComplete)
  self.__OnChipDataDiff = BindCallback(self, self.OnChipDataDiff)
  MsgCenter:AddListener(eMsgEventId.OnChipDataDiff, self.__OnChipDataDiff)
end

ExplorationPlayerCtrl.InitEpPlayerMove = function(self)
  -- function num : 0_1
  local currentRoom = self:GetCurrentRoomData()
  ;
  (self.epCtrl):OnPlayerMoveComplete(currentRoom)
end

ExplorationPlayerCtrl.__OnRoomExitComplete = function(self)
  -- function num : 0_2
  (self.epCtrl):OnExitEpRoom()
end

ExplorationPlayerCtrl.AutoRoomSelect = function(self)
  -- function num : 0_3 , upvalues : _ENV
  local opDetail = (self.dynPlayer):GetOperatorDetail()
  if opDetail.state == proto_object_ExplorationCurGridState.ExplorationCurGridState_HalfOver then
    local currentRoomData = self:GetCurrentRoomData()
    self:Move(currentRoomData, true)
  end
end

ExplorationPlayerCtrl.Move = function(self, roomData, auto)
  -- function num : 0_4 , upvalues : _ENV
  local opDetail = (self.dynPlayer):GetOperatorDetail()
  if opDetail.state ~= proto_object_ExplorationCurGridState.ExplorationCurGridState_Over and not auto then
    ((CS.MessageCommon).ShowMessageTipsWithErrorSound)(ConfigData:GetTipContent(TipContent.exploration_Player_CantSelectRoom))
    return 
  end
  if opDetail.state == proto_object_ExplorationCurGridState.ExplorationCurGridState_Over then
    (self.dynPlayer):RecordLastMoney()
  end
  ;
  (self.epNetwork):CS_EXPLORATION_Select(roomData.position)
end

ExplorationPlayerCtrl.OnMove = function(self)
  -- function num : 0_5
  local currentRoom = self:GetCurrentRoomData()
  ;
  (self.epCtrl):OnPlayerMoveStart(currentRoom)
end

ExplorationPlayerCtrl.CheckEpRoomAccess = function(self, roomData, isFreeSelect)
  -- function num : 0_6 , upvalues : _ENV
  local currentRoom = self:GetCurrentRoomData()
  if currentRoom == nil then
    return false
  end
  if isFreeSelect then
    local nextRooms = currentRoom:GetNextAllRoom()
    return (table.contain)(nextRooms, roomData)
  else
    do
      local nextRooms = currentRoom:GetNextRoom()
      do return (table.contain)(nextRooms, roomData) end
    end
  end
end

ExplorationPlayerCtrl.CheckIsEpRoomWatchingMap = function(self, roomData)
  -- function num : 0_7 , upvalues : _ENV
  local currentRoom = self:GetCurrentRoomData()
  if currentRoom == roomData then
    MsgCenter:Broadcast(eMsgEventId.OnShowingMapRoomClick)
    return true
  end
  return false
end

ExplorationPlayerCtrl.GetCurrentRoomData = function(self)
  -- function num : 0_8
  local mapData = (self.epCtrl).mapData
  local opDetail = (self.dynPlayer):GetOperatorDetail()
  local currentRoom = mapData:GetRoomByCoord(opDetail.curPostion)
  return currentRoom
end

ExplorationPlayerCtrl.UpdateEpOp = function(self, epOp)
  -- function num : 0_9
  (self.dynPlayer):UpdateOperatorDetail(epOp)
end

ExplorationPlayerCtrl.OnEpOperatorDiff = function(self, epOp)
  -- function num : 0_10 , upvalues : _ENV
  MsgCenter:Broadcast(eMsgEventId.OnEpOpStateChanged, (self.dynPlayer):GetOperatorDetail())
  if epOp.state == proto_object_ExplorationCurGridState.ExplorationCurGridState_DropAlg then
    (self.epCtrl):DiscardChip()
  else
    if epOp.state == proto_object_ExplorationCurGridState.ExplorationCurGridState_Secleted then
      local isInBattleSceen = ((self.epCtrl).sceneCtrl):InBattleScene()
      if not isInBattleSceen then
        local currentRoom = self:GetCurrentRoomData()
        if currentRoom.jumpCat ~= nil and currentRoom.jumpCat > 0 then
          ((self.epCtrl).eventCtrl):JumpEpEventRoomComplete()
          ;
          (self.epCtrl):OnPlayerMoveComplete(currentRoom)
          currentRoom:ResetJumpCat()
        end
      end
    else
      do
        if epOp.state == proto_object_ExplorationCurGridState.ExplorationCurGridState_Over then
          local isInBattleSceen = ((self.epCtrl).sceneCtrl):InBattleScene()
          if epOp.canFloorOver and not isInBattleSceen then
            (self.epCtrl):CheckBossRoom()
          end
        else
          do
            if epOp.state == proto_object_ExplorationCurGridState.ExplorationCurGridStateReplaceChip then
              (self.epCtrl):OpenChipReplace()
            end
          end
        end
      end
    end
  end
end

ExplorationPlayerCtrl.OnEpFormationDetailDiff = function(self, epForm)
  -- function num : 0_11
  (self.dynPlayer):UpdateFormationDetail(epForm)
end

ExplorationPlayerCtrl.OnEpBackpackDiff = function(self, epBackpack)
  -- function num : 0_12
  (self.dynPlayer):UpdateEpBackpack(epBackpack)
end

ExplorationPlayerCtrl.OnEpBuffDiff = function(self, epBuff)
  -- function num : 0_13
  (self.dynPlayer):UpdateEpBuff(epBuff)
end

ExplorationPlayerCtrl.OnChipDataDiff = function(self, diffData)
  -- function num : 0_14 , upvalues : _ENV
  local chipDiff = diffData[proto_csmsg_AlgModule.AlgModuleExploration]
  if chipDiff ~= nil then
    (self.dynPlayer):UpdateChipDiff(chipDiff)
  end
end

ExplorationPlayerCtrl.OnDelete = function(self)
  -- function num : 0_15 , upvalues : _ENV
  MsgCenter:RemoveListener(eMsgEventId.OnRoomSelected, self.__onRoomSelected)
  MsgCenter:RemoveListener(eMsgEventId.OnEpOpStore, self.__onEpOperatorUpdate)
  MsgCenter:RemoveListener(eMsgEventId.OnEpOperatorDiff, self.__onEpOperatorDiff)
  MsgCenter:RemoveListener(eMsgEventId.OnEpFormationDetailDiff, self.__onEpFormDetailDiff)
  MsgCenter:RemoveListener(eMsgEventId.OnEpBackpackDiff, self.__onEpBackpackDiff)
  MsgCenter:RemoveListener(eMsgEventId.OnEpBuffDiff, self.__OnEpBuffDiff)
  MsgCenter:RemoveListener(eMsgEventId.OnExitRoomComplete, self.__OnExitRoomComplete)
  MsgCenter:RemoveListener(eMsgEventId.OnChipDataDiff, self.__OnChipDataDiff)
end

return ExplorationPlayerCtrl

