-- params : ...
-- function num : 0 , upvalues : _ENV
local bs_1 = require("GamePlay.SkillScripts.CommonAttackSkill.1_CommonAttack_1")
local bs_533 = class("bs_533", bs_1)
local base = bs_1
bs_533.config = {effectId_1 = 10683, effectId_2 = 10684, atkDirectionRange = 10}
bs_533.config = setmetatable(bs_533.config, {__index = base.config})
bs_533.ctor = function(self)
  -- function num : 0_0
end

bs_533.InitSkill = function(self, isMidwaySkill)
  -- function num : 0_1 , upvalues : base
  (base.InitSkill)(self, isMidwaySkill)
end

bs_533.OnCasterDie = function(self)
  -- function num : 0_2 , upvalues : base
  (base.OnCasterDie)(self)
end

return bs_533

