-- params : ...
-- function num : 0 , upvalues : _ENV
local AllSkinData = class("AllSkinData")
AllSkinData.ctor = function(self)
  -- function num : 0_0
  self.skinDic = {}
end

AllSkinData.UpdateData = function(self, data)
  -- function num : 0_1 , upvalues : _ENV
  for k,v in pairs(data) do
    -- DECOMPILER ERROR at PC6: Confused about usage of register: R7 in 'UnsetPending'

    (self.skinDic)[k] = v.unlockSkin
  end
end

AllSkinData.IsHaveSkin = function(self, skinId)
  -- function num : 0_2 , upvalues : _ENV
  if skinId or 0 == 0 then
    return true
  end
  local skinCtrl = ControllerManager:GetController(ControllerTypeId.Skin, true)
  local heroId = skinCtrl:GetHeroId(skinId)
  if heroId == nil then
    return false
  end
  if (self.skinDic)[heroId] == nil then
    return false
  end
  return ((self.skinDic)[heroId])[skinId]
end

AllSkinData.RecordLive2dSwitchState = function(self, heroId, skinId, isOpen)
  -- function num : 0_3
  if self.live2dSwitchDic == nil then
    if isOpen then
      return 
    end
    self.live2dSwitchDic = {}
  end
  if (self.live2dSwitchDic)[heroId] == nil then
    if isOpen then
      return 
    end
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self.live2dSwitchDic)[heroId] = {}
  end
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R4 in 'UnsetPending'

  if isOpen then
    ((self.live2dSwitchDic)[heroId])[skinId] = nil
  else
    -- DECOMPILER ERROR at PC26: Confused about usage of register: R4 in 'UnsetPending'

    ;
    ((self.live2dSwitchDic)[heroId])[skinId] = true
  end
end

AllSkinData.GetLive2dSwitchState = function(self, heroId, skinId)
  -- function num : 0_4
  if self.live2dSwitchDic == nil then
    return true
  end
  if (self.live2dSwitchDic)[heroId] == nil then
    return true
  end
  do return ((self.live2dSwitchDic)[heroId])[skinId] == nil end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

return AllSkinData

