-- params : ...
-- function num : 0 , upvalues : _ENV
local CommanderSkillModulaData = class("CommanderSkillModulaData")
local CommanderSkillTreeData = require("Game.CommanderSkill.CommanderSkillTreeData")
CommanderSkillModulaData.ctor = function(self, masterLevel, masterExp, treeMsg)
  -- function num : 0_0
  self.CommanderSkillTreeDataDic = {}
  self.masterLevel = masterLevel
  self.masterExp = masterExp
  self.masterSkillPoint = {[1] = 0, [2] = 0, [3] = 0}
  self.lastDiff = {differMsg = nil, oldTreelevel = nil, oldTreeExp = nil, oldMasterlevel = nil, oldMasterExp = nil}
  self:UpdateMasterPoint(masterLevel)
  self:InitCommanderSkillTreeDataDic(treeMsg)
end

CommanderSkillModulaData.InitCommanderSkillTreeDataDic = function(self, treeMsg)
  -- function num : 0_1 , upvalues : _ENV, CommanderSkillTreeData
  local treeCfg = ConfigData.commander_skill
  if treeCfg == nil then
    error("commander_skill read error")
  end
  if treeMsg == nil then
    for treeId,cfg in pairs(treeCfg) do
      local SkillTreeData = (CommanderSkillTreeData.New)(treeId)
      if (CheckCondition.CheckLua)(cfg.pre_condition, cfg.pre_para1, cfg.pre_para2) then
        (NetworkManager:GetNetwork(NetworkTypeID.CommanderSkill)):CS_COMMANDSKILL_Unlock(treeId)
        SkillTreeData.isUnlock = true
      end
      -- DECOMPILER ERROR at PC34: Confused about usage of register: R9 in 'UnsetPending'

      ;
      (self.CommanderSkillTreeDataDic)[treeId] = SkillTreeData
    end
  else
    do
      for treeId,cfg in pairs(treeCfg) do
        local treeData = treeMsg[treeId]
        local SkillTreeData = nil
        if treeData == nil then
          SkillTreeData = (CommanderSkillTreeData.New)(treeId)
          if (CheckCondition.CheckLua)(cfg.pre_condition, cfg.pre_para1, cfg.pre_para2) then
            (NetworkManager:GetNetwork(NetworkTypeID.CommanderSkill)):CS_COMMANDSKILL_Unlock(treeId)
            SkillTreeData.isUnlock = true
          end
        else
          SkillTreeData = (CommanderSkillTreeData.New)(treeId, treeData.level, treeData.exp)
          SkillTreeData.isUnlock = true
        end
        -- DECOMPILER ERROR at PC76: Confused about usage of register: R10 in 'UnsetPending'

        ;
        (self.CommanderSkillTreeDataDic)[treeId] = SkillTreeData
      end
    end
  end
end

CommanderSkillModulaData.UpdateMasterLevelAndExp = function(self, masterLevel, masterExp)
  -- function num : 0_2 , upvalues : _ENV
  if not masterLevel then
    self.masterLevel = self.masterLevel
    if not masterExp then
      self.masterExp = self.masterExp
      self:UpdateMasterPoint(masterLevel)
      MsgCenter:Broadcast(eMsgEventId.OnCommanderSkillMasterLevelDiffer)
    end
  end
end

CommanderSkillModulaData.UpdateMasterPoint = function(self, mastLevel)
  -- function num : 0_3 , upvalues : _ENV
  if mastLevel == 0 then
    return 
  end
  local levelCfg = ConfigData.commander_skill_master_level
  if levelCfg == nil or levelCfg[mastLevel] == nil then
    error("commander_skill_master_level read error")
    return 
  end
  for index,point in ipairs((levelCfg[mastLevel]).master_point) do
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R8 in 'UnsetPending'

    (self.masterSkillPoint)[index] = point
  end
end

CommanderSkillModulaData.CreatDefaultFormationCST = function(self, formId)
  -- function num : 0_4 , upvalues : _ENV
  local defaultTreeId = (ConfigData.game_config).FormationDefaultCommanderSkillTree
  local CST = {}
  local defaultCSTSaving = {}
  defaultCSTSaving.skillActive = {}
  defaultCSTSaving.skillProficient = {}
  local unlockSkillCfg = (ConfigData.commander_skill_unlock)[defaultTreeId]
  local defaultTreeLevel = ((self.CommanderSkillTreeDataDic)[defaultTreeId]).level
  for level,cfgs in pairs(unlockSkillCfg) do
    if defaultTreeLevel >= level then
      for skillId,skillCfg in pairs(cfgs) do
        -- DECOMPILER ERROR at PC40: Confused about usage of register: R17 in 'UnsetPending'

        if skillCfg.skill_type == 1 then
          if (defaultCSTSaving.skillActive)[skillCfg.place] ~= nil and (defaultCSTSaving.skillActive)[skillCfg.place] < skillId then
            (defaultCSTSaving.skillActive)[skillCfg.place] = skillId
          else
            -- DECOMPILER ERROR at PC49: Confused about usage of register: R17 in 'UnsetPending'

            if (defaultCSTSaving.skillActive)[skillCfg.place] == nil then
              (defaultCSTSaving.skillActive)[skillCfg.place] = skillId
            end
          end
        end
      end
      do
        -- DECOMPILER ERROR at PC52: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC52: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
  ;
  (NetworkManager:GetNetwork(NetworkTypeID.CommanderSkill)):CS_COMMANDSKILL_SaveFromFormation(formId, defaultTreeId, defaultCSTSaving)
  CST.saving = defaultCSTSaving
  CST.treeId = defaultTreeId
  return CST
end

CommanderSkillModulaData.CreateSavingData = function(self, treeId)
  -- function num : 0_5 , upvalues : _ENV
  local treeData = (self.CommanderSkillTreeDataDic)[treeId]
  local defaultCSTSaving = {}
  defaultCSTSaving.skillActive = treeData.slotSkillList
  defaultCSTSaving.skillProficient = {}
  for place,masterSkillList in ipairs(treeData.masterSkillList) do
    for _,skillData in ipairs(masterSkillList) do
      local level = skillData:GetMasterSkilllevel()
      -- DECOMPILER ERROR at PC25: Confused about usage of register: R15 in 'UnsetPending'

      if level > 0 then
        (defaultCSTSaving.skillProficient)[skillData.dataId] = {id = skillData.dataId, level = level}
      end
    end
  end
  return defaultCSTSaving
end

CommanderSkillModulaData.GetCSLastDiff = function(self)
  -- function num : 0_6 , upvalues : _ENV
  local lastDiff = (table.deepCopy)(self.lastDiff)
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.lastDiff).differMsg = nil
  return lastDiff
end

CommanderSkillModulaData.GetIsHaveCouldUpgradeCST = function(self)
  -- function num : 0_7 , upvalues : _ENV
  local totalCouldAddExp = self:GetAllCouldAddEXP()
  for treeId,treeData in pairs(self.CommanderSkillTreeDataDic) do
    if treeData:CanThisTreeUpgrade(totalCouldAddExp) then
      return true
    end
  end
  return false
end

CommanderSkillModulaData.GetAllCouldAddEXP = function(self)
  -- function num : 0_8 , upvalues : _ENV
  local totalCouldAddExp = 0
  for _,id in ipairs(((ConfigData.item).growUpIds)[eItemActionType.CommanderSkillExp]) do
    if (PlayerDataCenter.itemDic)[id] ~= nil then
      local itemData = (PlayerDataCenter.itemDic)[id]
      local couldAddExp = itemData:GetActionArg(1) * itemData:GetCount()
      totalCouldAddExp = totalCouldAddExp + couldAddExp
    end
  end
  return totalCouldAddExp
end

return CommanderSkillModulaData

