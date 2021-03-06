-- params : ...
-- function num : 0 , upvalues : _ENV
local bs_5005 = class("bs_5005", LuaSkillBase)
local base = LuaSkillBase
bs_5005.config = {effectIdAttack = 10300, buffId = 141, audioId_start = 138, audioId_hit = 139}
bs_5005.ctor = function(self)
  -- function num : 0_0
end

bs_5005.InitSkill = function(self, isMidwaySkill)
  -- function num : 0_1
end

bs_5005.PlaySkill = function(self, data, selectTargetCoord, selectRoles)
  -- function num : 0_2 , upvalues : _ENV
  return self:GetSelectTargetAndExecute(selectRoles, BindCallback(self, self.CallSelectExecute))
end

bs_5005.CallSelectExecute = function(self, role)
  -- function num : 0_3 , upvalues : _ENV
  if role ~= nil and role ~= nil and role.belongNum ~= (self.caster).belongNum and not role.unableSelect then
    LuaSkillCtrl:CallEffect(role, (self.config).effectIdAttack, self, self.SkillEventFunc)
    LuaSkillCtrl:PlayAuSource(role, (self.config).audioId_start)
  end
end

bs_5005.SkillEventFunc = function(self, effect, eventId, target)
  -- function num : 0_4 , upvalues : _ENV
  if eventId == eBattleEffectEvent.Trigger then
    LuaSkillCtrl:CallBattleCamShake(1)
    LuaSkillCtrl:CallBuff(self, target.targetRole, (self.config).buffId, 1, (self.arglist)[1])
  end
end

bs_5005.OnCasterDie = function(self)
  -- function num : 0_5 , upvalues : base
  (base.OnCasterDie)(self)
end

return bs_5005

