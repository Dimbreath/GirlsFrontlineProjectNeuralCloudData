-- params : ...
-- function num : 0 , upvalues : _ENV
local bs_5008 = class("bs_5008", LuaSkillBase)
local base = LuaSkillBase
bs_5008.config = {effectIdAttack = 10303, buffId = 207}
bs_5008.ctor = function(self)
  -- function num : 0_0
end

bs_5008.InitSkill = function(self, isMidwaySkill)
  -- function num : 0_1
  self:AddSetHurtTrigger("5008_1", 1, self.OnSetHurt, nil, nil, (self.caster).belongNum, nil, 1)
end

bs_5008.OnSetHurt = function(self, context)
  -- function num : 0_2 , upvalues : _ENV
  if (context.sender).belongNum == (self.caster).belongNum and (context.sender).roleType == 1 and (context.target):GetBuffTier((self.config).buffId) == 1 then
    local heal = context.hurt * (self.arglist)[3] // 1000
    do
      LuaSkillCtrl:StartTimer(self, 5, function()
    -- function num : 0_2_0 , upvalues : _ENV, heal, self, context
    LuaSkillCtrl:CallHeal(heal, self, context.sender, true)
  end
, self, 0, 0)
    end
  end
end

bs_5008.PlaySkill = function(self, data, selectTargetCoord, selectRoles)
  -- function num : 0_3 , upvalues : _ENV
  return self:GetSelectTargetAndExecute(selectRoles, BindCallback(self, self.CallSelectExecute))
end

bs_5008.CallSelectExecute = function(self, role)
  -- function num : 0_4 , upvalues : _ENV
  if role ~= nil and role ~= nil and role.belongNum ~= (self.caster).belongNum and not role.unableSelect then
    LuaSkillCtrl:CallEffect(role, (self.config).effectIdAttack, self, self.SkillEventFunc)
  end
end

bs_5008.SkillEventFunc = function(self, effect, eventId, target)
  -- function num : 0_5 , upvalues : _ENV
  if eventId == eBattleEffectEvent.Trigger then
    LuaSkillCtrl:CallBattleCamShake(1)
    LuaSkillCtrl:CallBuff(self, target.targetRole, (self.config).buffId, 1, (self.arglist)[1])
  end
end

bs_5008.OnCasterDie = function(self)
  -- function num : 0_6 , upvalues : base
  (base.OnCasterDie)(self)
end

return bs_5008

