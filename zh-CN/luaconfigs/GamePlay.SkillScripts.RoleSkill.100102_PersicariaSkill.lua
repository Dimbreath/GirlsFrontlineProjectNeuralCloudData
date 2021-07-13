-- params : ...
-- function num : 0 , upvalues : _ENV
local bs_100102 = class("bs_100102", LuaSkillBase)
local base = LuaSkillBase
bs_100102.config = {
heal_config = {baseheal_formula = 10060}
, buffId_109 = 109, buff_tier = 1, effectId_line = 10040, effectId_trail = 10041, effectId_hit = 10042, audioId_start = 36, audioId_heal = 37, selectId = 24, selectRange = 10, skill_time = 12, start_time = 6, actionId = 1002, act_speed = 1, time_heal = 3}
bs_100102.ctor = function(self)
  -- function num : 0_0
end

bs_100102.InitSkill = function(self, isMidwaySkill)
  -- function num : 0_1
end

bs_100102.PlaySkill = function(self, data)
  -- function num : 0_2 , upvalues : _ENV
  local targetList = LuaSkillCtrl:CallTargetSelect(self, (self.config).selectId, (self.config).selectRange)
  if targetList.Count > 0 then
    LuaSkillCtrl:CallBreakAllSkill(self.caster)
    ;
    (self.caster):LookAtTarget((targetList[0]).targetRole)
    self:CallCasterWait((self.config).skill_time)
    local attackTrigger = BindCallback(self, self.OnAttackTrigger, (targetList[0]).targetRole, data)
    LuaSkillCtrl:CallRoleActionWithTrigger(self, self.caster, (self.config).actionId, (self.config).act_speed, (self.config).start_time, attackTrigger)
  end
end

bs_100102.OnAttackTrigger = function(self, target, data)
  -- function num : 0_3
  self:RealPlaySkill(nil, target, 1)
end

bs_100102.RealPlaySkill = function(self, sender, target, healId)
  -- function num : 0_4 , upvalues : _ENV
  LuaSkillCtrl:PlayAuSource(self.caster, (self.config).audioId_start)
  if sender == nil then
    LuaSkillCtrl:CallEffectWithArg(target, (self.config).effectId_trail, self, false, false, self.SkillEventFunc, healId)
    if target ~= self.caster then
      LuaSkillCtrl:CallEffect(target, (self.config).effectId_line, self, nil, sender)
    end
  else
    LuaSkillCtrl:CallEffectWithArgOverride(target, (self.config).effectId_trail, self, sender, false, false, self.SkillEventFunc, healId)
  end
  if sender == nil and target == self.caster then
    return 
  end
end

bs_100102.SkillEventFunc = function(self, healId, effect, eventId, target)
  -- function num : 0_5 , upvalues : _ENV
  if effect.dataId == (self.config).effectId_hit and eventId == eBattleEffectEvent.Create then
    do
      if healId == 1 and (self.arglist)[4] > 0 then
        local shieldValue = (self.caster).skill_intensity * (self.arglist)[5] // 1000
        LuaSkillCtrl:AddRoleShield(target.targetRole, eShieldType.Normal, shieldValue)
        LuaSkillCtrl:CallFloatText(self.caster, 11, shieldValue)
      end
      LuaSkillCtrl:StartTimer(nil, (self.config).time_heal, BindCallback(self, self.CallBack, target.targetRole, healId))
      if healId <= (self.arglist)[2] then
        local targetList = LuaSkillCtrl:CallTargetSelect(self, (self.config).selectId, (self.config).selectRange)
        if targetList.Count == 0 then
          return 
        end
        for i = 0, targetList.Count - 1 do
          if (targetList[i]).targetRole ~= nil and (targetList[i]).targetRole ~= target.targetRole then
            self:RealPlaySkill(target.targetRole, (targetList[i]).targetRole, healId + 1)
            LuaSkillCtrl:CallEffect((targetList[i]).targetRole, (self.config).effectId_line, self, nil, target.targetRole)
          end
        end
      end
    end
  end
end

bs_100102.CallBack = function(self, targetRole, healId)
  -- function num : 0_6 , upvalues : _ENV
  LuaSkillCtrl:PlayAuSource(targetRole, (self.config).audioId_heal)
  local skillResult = LuaSkillCtrl:CallSkillResultNoEffect(self, targetRole)
  LuaSkillCtrl:HealResult(skillResult, (self.config).heal_config, {healId}, false, false)
  skillResult:EndResult()
end

bs_100102.OnCasterDie = function(self)
  -- function num : 0_7 , upvalues : base
  (base.OnCasterDie)(self)
end

return bs_100102

