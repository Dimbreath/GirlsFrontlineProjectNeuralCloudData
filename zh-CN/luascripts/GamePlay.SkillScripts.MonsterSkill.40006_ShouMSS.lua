-- params : ...
-- function num : 0 , upvalues : _ENV
local bs_40006 = class("bs_40006", LuaSkillBase)
local base = LuaSkillBase
bs_40006.config = {
hurt_config = {basehurt_formula = 10013}
, damageFormula = 10013, startAnimID = 1002, EffectId = 10090, audioId1 = 56}
bs_40006.ctor = function(self)
  -- function num : 0_0
end

bs_40006.InitSkill = function(self, isMidwaySkill)
  -- function num : 0_1
end

bs_40006.PlaySkill = function(self, data)
  -- function num : 0_2 , upvalues : _ENV
  if ((self.caster).recordTable).lastAttackRole ~= nil then
    self:DamageAnimation(((self.caster).recordTable).lastAttackRole)
  else
    local targetlist = LuaSkillCtrl:CallTargetSelect(self, 1001, 10)
    if targetlist.Count > 0 then
      self:DamageAnimation((targetlist[0]).targetRole)
    end
  end
end

bs_40006.DamageAnimation = function(self, target)
  -- function num : 0_3 , upvalues : _ENV
  if LuaSkillCtrl:IsAbleAttackTarget(self.caster, target, 3) then
    local moveAttackTrigger = BindCallback(self, self.OnMoveAttackTrigger, target, data, grid)
    self:CallCasterWait(25)
    ;
    (self.caster):LookAtTarget(target)
    LuaSkillCtrl:CallRoleActionWithTrigger(self, self.caster, (self.config).startAnimID, 1, 13, moveAttackTrigger)
  else
    do
      self:BreakSkill()
    end
  end
end

bs_40006.OnMoveAttackTrigger = function(self, target, data)
  -- function num : 0_4 , upvalues : _ENV
  ((self.caster).auSource):PlayAudioById((self.config).audioId1)
  LuaSkillCtrl:CallEffect(target, (self.config).EffectId, self, self.SkillEventFunc)
end

bs_40006.SkillEventFunc = function(self, effect, eventId, target)
  -- function num : 0_5 , upvalues : _ENV
  if eventId == eBattleEffectEvent.Trigger then
    local skillResult = LuaSkillCtrl:CallSkillResult(effect, target)
    LuaSkillCtrl:HurtResult(skillResult, (self.config).hurt_config)
    skillResult:EndResult()
  end
end

bs_40006.OnCasterDie = function(self)
  -- function num : 0_6 , upvalues : base
  (base.OnCasterDie)(self)
end

return bs_40006

