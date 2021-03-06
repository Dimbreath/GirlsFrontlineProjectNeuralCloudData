-- params : ...
-- function num : 0 , upvalues : _ENV
local bs_10127 = class("bs_10127", LuaSkillBase)
local base = LuaSkillBase
bs_10127.config = {buffId = 1132, buffTier = 1}
bs_10127.ctor = function(self)
  -- function num : 0_0
end

bs_10127.InitSkill = function(self, isMidwaySkill)
  -- function num : 0_1 , upvalues : base
  (base.InitSkill)(self, isMidwaySkill)
  self:AddAfterHealTrigger("bs_10127_5", 1, self.OnAfterHeal, nil, self.caster)
end

bs_10127.OnAfterHeal = function(self, sender, target, skill, heal, isStealHeal, isCrit, isTriggerSet)
  -- function num : 0_2 , upvalues : _ENV
  if target == self.caster and not isTriggerSet then
    self:PlayChipEffect()
    LuaSkillCtrl:CallBuff(self, self.caster, (self.config).buffId, (self.config).buffTier, nil, true)
  end
end

bs_10127.OnCasterDie = function(self)
  -- function num : 0_3 , upvalues : base
  (base.OnCasterDie)(self)
end

return bs_10127

