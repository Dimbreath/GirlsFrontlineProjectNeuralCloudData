-- params : ...
-- function num : 0 , upvalues : _ENV
local bs_1 = require("GamePlay.SkillScripts.CommonAttackSkill.1_CommonAttack_1")
local bs_12 = class("bs_12", bs_1)
local base = bs_1
bs_12.config = {effectId_trail = 10793, effectId_trail_ex = 10806, effectId_start1 = 10192, effectId_start2 = 10193, audioId1 = 58, audioId2 = 59, time2 = 1}
bs_12.config = setmetatable(bs_12.config, {__index = base.config})
bs_12.InitSkill = function(self, isMidwaySkill)
  -- function num : 0_0 , upvalues : base
  (base.InitSkill)(self, isMidwaySkill)
end

bs_12.OnCasterDie = function(self)
  -- function num : 0_1 , upvalues : base
  (base.OnCasterDie)(self)
end

return bs_12

