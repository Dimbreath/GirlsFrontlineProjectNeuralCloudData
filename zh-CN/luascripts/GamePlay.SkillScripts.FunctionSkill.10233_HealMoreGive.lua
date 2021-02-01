-- params : ...
-- function num : 0 , upvalues : _ENV
local bs_10233 = class("bs_10233", LuaSkillBase)
local base = LuaSkillBase
bs_10233.config = {effectId = 10632}
bs_10233.ctor = function(self)
  -- function num : 0_0
end

bs_10233.InitSkill = function(self, isMidwaySkill)
  -- function num : 0_1 , upvalues : base, _ENV
  (base.InitSkill)(self, isMidwaySkill)
  self:AddSelfTrigger(eSkillTriggerType.SetHeal, "bs_10233_4", 1, self.OnSetHeal)
end

bs_10233.OnSetHeal = function(self, context)
  -- function num : 0_2 , upvalues : _ENV
  if context.sender == self.caster and self:IsReadyToTake() and (context.target).maxHp - (context.target).hp < context.heal then
    self:OnSkillTake()
    local exHeal = (context.heal - (context.target).maxHp + (context.target).hp) * (self.arglist)[1] // 1000
    if exHeal <= 0 then
      exHeal = context.heal
    end
    local targetlist = LuaSkillCtrl:CallTargetSelect(self, 30, 10)
    if targetlist.Count < 1 then
      return 
    end
    LuaSkillCtrl:CallEffect((targetlist[0]).targetRole, (self.config).effectId, self, self.SkillEventFunc)
    LuaSkillCtrl:CallHeal(exHeal, self, (targetlist[0]).targetRole, true)
  end
end

bs_10233.OnAfterHeal = function(self, sender, target, skill, heal, isStealHeal, isCrit, isTriggerSet)
  -- function num : 0_3 , upvalues : _ENV
  if sender == self.caster and self:IsReadyToTake() and target.maxHp - target.hp < heal then
    local exHeal = (heal - target.maxHp + target.hp) * (self.arglist)[1] // 1000
    if exHeal <= 0 then
      exHeal = heal
    end
    local targetlist = LuaSkillCtrl:CallTargetSelect(self, 30, 10)
    if targetlist.Count < 1 then
      return 
    end
    LuaSkillCtrl:CallEffect((targetlist[0]).targetRole, (self.config).effectId, self, self.SkillEventFunc)
    LuaSkillCtrl:CallHeal(exHeal, self, (targetlist[0]).targetRole, true)
    self:OnSkillTake()
  end
end

bs_10233.OnCasterDie = function(self)
  -- function num : 0_4 , upvalues : base
  (base.OnCasterDie)(self)
end

return bs_10233

