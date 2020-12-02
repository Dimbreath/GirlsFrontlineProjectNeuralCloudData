-- params : ...
-- function num : 0 , upvalues : _ENV
local bs_10021 = class("bs_10021", LuaSkillBase)
local base = LuaSkillBase
bs_10021.config = {baseheal_formula = 10006, correct_formula = 9990, heal_number = 0, effectId = 1008}
bs_10021.ctor = function(self)
  -- function num : 0_0
end

bs_10021.InitSkill = function(self, isMidwaySkill)
  -- function num : 0_1
  self.heal_config = {}
end

bs_10021.PlaySkill = function(self)
  -- function num : 0_2 , upvalues : _ENV
  self:PlayChipEffect()
  LuaSkillCtrl:CallEffect(self.caster, (self.config).effectId, self, self.SkillBack)
end

bs_10021.SkillBack = function(self, effect, eventId, target)
  -- function num : 0_3 , upvalues : _ENV
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R4 in 'UnsetPending'

  if eventId == eBattleEffectEvent.Trigger then
    (self.heal_config).baseheal_formula = (self.config).baseheal_formula
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self.heal_config).correct_formula = (self.config).correct_formula
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self.heal_config).heal_number = (self.config).heal_number
    local skillResult = LuaSkillCtrl:CallSkillResult(effect, self.caster)
    LuaSkillCtrl:HealResult(skillResult, self.heal_config)
    skillResult:EndResult()
  end
end

bs_10021.OnCasterDie = function(self)
  -- function num : 0_4 , upvalues : base
  (base.OnCasterDie)(self)
end

return bs_10021

