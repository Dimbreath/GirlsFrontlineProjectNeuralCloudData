-- params : ...
-- function num : 0 , upvalues : _ENV
local bs_40024 = class("bs_40024", LuaSkillBase)
local base = LuaSkillBase
bs_40024.config = {effectId = 10109, rootEffectId = 10113, healFormula = 10030, startAnimId = 1002, loopAnimId = 1007, audioId1 = 91, audioId2 = 92, effectlowId = 10607, effecthighId = 10606}
bs_40024.ctor = function(self)
  -- function num : 0_0
end

bs_40024.InitSkill = function(self, isMidwaySkill)
  -- function num : 0_1 , upvalues : base, _ENV
  (base.InitSkill)(self, isMidwaySkill)
  self:AddTrigger(eSkillTriggerType.BeforeBattleEnd, "bs_40024_3", 1, self.BeforeEndBattle)
end

bs_40024.CallBack = function(self)
  -- function num : 0_2 , upvalues : _ENV
  local targetlist = LuaSkillCtrl:CallTargetSelect(self, 6, 10)
  local healNum = (self.caster).skill_intensity * (self.arglist)[1] // 1000
  if healNum <= 0 then
    healNum = 1
  end
  for i = 0, targetlist.Count - 1 do
    LuaSkillCtrl:CallHeal(healNum, self, (targetlist[i]).targetRole)
    if ((self.caster).recordTable).passive ~= nil then
      LuaSkillCtrl:CallEffect((targetlist[i]).targetRole, (self.config).effecthighId, self, nil, nil, nil, true)
    else
      LuaSkillCtrl:CallEffect((targetlist[i]).targetRole, (self.config).effectlowId, self, nil, nil, nil, true)
    end
  end
end

bs_40024.PlaySkill = function(self, data)
  -- function num : 0_3 , upvalues : _ENV
  local attackTrigger = BindCallback(self, self.OnAttackTrigger, self.caster, data)
  local waitTime = 15 + (self.arglist)[3]
  self:CallCasterWait(waitTime)
  LuaSkillCtrl:PlayAuSource(self.caster, (self.config).audioId1)
  LuaSkillCtrl:CallRoleActionWithTrigger(self, self.caster, (self.config).startAnimId, 1, 8, attackTrigger)
end

bs_40024.CallBack1 = function(self)
  -- function num : 0_4 , upvalues : _ENV
  if self.damTimer then
    (self.damTimer):Stop()
    self.damTimer = nil
  end
  if self.effect ~= nil then
    (self.effect):Die()
    self.effect = nil
  end
  if self.effect1 ~= nil then
    (self.effect1):Die()
    self.effect1 = nil
  end
  if self.effect2 ~= nil then
    (self.effect2):Die()
    self.effect2 = nil
  end
  if self.effect3 ~= nil then
    (self.effect3):Die()
    self.effect3 = nil
  end
  if self.effect4 ~= nil then
    (self.effect4):Die()
    self.effect4 = nil
  end
  AudioManager:StopAudioByBack(self.loopaudio)
  LuaSkillCtrl:CallRoleAction(self.caster, 100, 1)
end

bs_40024.OnAttackTrigger = function(self, target, data)
  -- function num : 0_5 , upvalues : _ENV
  self.loopaudio = LuaSkillCtrl:PlayAuSource(self.caster, (self.config).audioId2)
  self.damTimer = LuaSkillCtrl:StartTimer(self, (self.arglist)[2], self.CallBack, self, -1, (self.arglist)[2])
  self.damTimer1 = LuaSkillCtrl:StartTimer(self, (self.arglist)[3], self.CallBack1, self, 0, 0)
  LuaSkillCtrl:CallRoleAction(self.caster, (self.config).loopAnimId, 1)
  self.effect1 = LuaSkillCtrl:CallEffect(self.caster, (self.config).effectId, self, nil, nil, nil, true)
  self.effect2 = LuaSkillCtrl:CallEffect(self.caster, (self.config).effectId + 1, self, nil, nil, nil, true)
  self.effect3 = LuaSkillCtrl:CallEffect(self.caster, (self.config).effectId + 2, self, nil, nil, nil, true)
  self.effect4 = LuaSkillCtrl:CallEffect(self.caster, (self.config).effectId + 3, self, nil, nil, nil, true)
end

bs_40024.BeforeEndBattle = function(self)
  -- function num : 0_6 , upvalues : _ENV
  if self.loopaudio ~= nil then
    AudioManager:StopAudioByBack(self.loopaudio)
    self.loopaudio = nil
  end
end

bs_40024.OnCasterDie = function(self)
  -- function num : 0_7 , upvalues : base
  (base.OnCasterDie)(self)
  if self.damTimer then
    (self.damTimer):Stop()
    self.damTimer = nil
  end
end

return bs_40024

