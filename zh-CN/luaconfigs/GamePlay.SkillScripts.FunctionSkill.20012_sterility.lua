-- params : ...
-- function num : 0 , upvalues : _ENV
local bs_20012 = class("bs_20012", LuaSkillBase)
local base = LuaSkillBase
bs_20012.config = {}
bs_20012.ctor = function(self)
  -- function num : 0_0
end

bs_20012.InitSkill = function(self, isMidwaySkill)
  -- function num : 0_1 , upvalues : base, _ENV
  (base.InitSkill)(self, isMidwaySkill)
  self:AddTrigger(eSkillTriggerType.AfterBattleStart, "bs_20012_1", 1, self.OnAfterBattleStart)
end

bs_20012.OnAfterBattleStart = function(self)
  -- function num : 0_2 , upvalues : _ENV
  LuaSkillCtrl:CallLoseAllGridEffect()
end

bs_20012.OnCasterDie = function(self)
  -- function num : 0_3 , upvalues : base
  (base.OnCasterDie)(self)
end

return bs_20012

