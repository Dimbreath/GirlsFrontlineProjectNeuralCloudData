-- params : ...
-- function num : 0 , upvalues : _ENV
local bs_1033 = class("bs_1033", LuaSkillBase)
local base = LuaSkillBase
bs_1033.config = {
hurt_config = {basehurt_formula = 10076}
, 
hurt_config1 = {basehurt_formula = 10059}
, buffId = 110, effectId1 = 10049, effectId2 = 10050, audioId = 29}
bs_1033.ctor = function(self)
  -- function num : 0_0
end

bs_1033.InitSkill = function(self, isMidwaySkill)
  -- function num : 0_1 , upvalues : base
  (base.InitSkill)(self, isMidwaySkill)
end

bs_1033.PlaySkill = function(self, data)
  -- function num : 0_2 , upvalues : _ENV
  local moveTarget = self:GetMoveSelectTarget()
  if moveTarget == nil then
    return 
  end
  local target = moveTarget.targetRole
  if target ~= nil then
    LuaSkillCtrl:CallBreakAllSkill(self.caster)
    local attackTrigger = BindCallback(self, self.OnAttackTrigger, target, data)
    ;
    (self.caster):LookAtTarget(target)
    self:CallCasterWait(15)
    LuaSkillCtrl:CallRoleActionWithTrigger(self, self.caster, 1002, 1, 9, attackTrigger)
  end
end

bs_1033.OnAttackTrigger = function(self, target, data)
  -- function num : 0_3 , upvalues : _ENV
  LuaSkillCtrl:PlayAuSource(self.caster, (self.config).audioId)
  LuaSkillCtrl:CallEffect(target, (self.config).effectId1, self)
  LuaSkillCtrl:CallEffect(target, (self.config).effectId2, self, self.SkillEventFunc)
end

bs_1033.SkillEventFunc = function(self, effect, eventId, target)
  -- function num : 0_4 , upvalues : _ENV
  if eventId == eBattleEffectEvent.Trigger then
    LuaSkillCtrl:CallBuff(self, target.targetRole, (self.config).buffId, 1, nil, false)
    local skillResult = LuaSkillCtrl:CallSkillResult(effect, target)
    LuaSkillCtrl:HurtResult(skillResult, (self.config).hurt_config, nil, false, false)
    skillResult:EndResult()
    local transferList = LuaSkillCtrl:CallTargetSelect(self, 29, 10)
    if transferList == 0 then
      return 
    end
    for i = 0, transferList.Count - 1 do
      if (transferList[i]).targetRole ~= target.targetRole then
        LuaSkillCtrl:CallEffect((transferList[i]).targetRole, (self.config).effectId1, self, nil, target.targetRole)
        LuaSkillCtrl:CallEffect((transferList[i]).targetRole, (self.config).effectId2, self, self.SkillEventFunc1, target.targetRole)
      end
    end
  end
end

bs_1033.SkillEventFunc1 = function(self, effect, eventId, target)
  -- function num : 0_5 , upvalues : _ENV
  if eventId == eBattleEffectEvent.Trigger then
    LuaSkillCtrl:CallBuff(self, target.targetRole, (self.config).buffId, 1, nil, false)
    local skillResult = LuaSkillCtrl:CallSkillResult(effect, target)
    if (self.arglist)[3] == 1 then
      LuaSkillCtrl:HurtResult(skillResult, (self.config).hurt_config1, nil, true)
    end
    skillResult:EndResult()
  end
end

bs_1033.OnCasterDie = function(self)
  -- function num : 0_6 , upvalues : base
  (base.OnCasterDie)(self)
end

return bs_1033

