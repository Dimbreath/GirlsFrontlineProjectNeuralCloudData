-- params : ...
-- function num : 0 , upvalues : _ENV
local bs_1 = require("GamePlay.SkillScripts.CommonAttackSkill.1_CommonAttack_1")
local bs_21 = class("bs_21", bs_1)
local base = bs_1
bs_21.config = {effectId1 = 10453, effectId2 = 10454}
bs_21.config = setmetatable(bs_21.config, {__index = base.config})
bs_21.ctor = function(self)
  -- function num : 0_0
end

bs_21.InitSkill = function(self, isMidwaySkill)
  -- function num : 0_1 , upvalues : base
  (base.InitSkill)(self, isMidwaySkill)
end

bs_21.OnCasterDie = function(self)
  -- function num : 0_2 , upvalues : base
  (base.OnCasterDie)(self)
end

return bs_21

-- params : ...
-- function num : 0 , upvalues : _ENV
local bs_1 = require("GamePlay.SkillScripts.CommonAttackSkill.1_CommonAttack_1")
local bs_21 = class("bs_21", bs_1)
local base = bs_1
bs_21.config = {effectId1 = 10453, effectId2 = 10454}
bs_21.config = setmetatable(bs_21.config, {__index = base.config})
bs_21.ctor = function(self)
    -- function num : 0_0
end

bs_21.InitSkill = function(self, isMidwaySkill)
    -- function num : 0_1 , upvalues : base
    (base.InitSkill)(self, isMidwaySkill)
end

bs_21.OnCasterDie = function(self)
    -- function num : 0_2 , upvalues : base
    (base.OnCasterDie)(self)
end

return bs_21

