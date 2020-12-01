-- params : ...
-- function num : 0 , upvalues : _ENV
local UINHomeGeneralBtn = class("UINHomeGeneralBtn", UIBaseNode)
local base = UIBaseNode
UINHomeGeneralBtn.OnInit = function(self)
  -- function num : 0_0 , upvalues : _ENV
  self.isUnlock = false
  self.isHaveRedDot = false
  ;
  (UIUtil.LuaUIBindingTable)(self.transform, self.ui)
end

UINHomeGeneralBtn.RefeshUnlockInfo = function(self, isUnlock, unlockDes)
  -- function num : 0_1 , upvalues : _ENV
  self.isUnlock = isUnlock
  if (self.ui).lock ~= nil then
    ((self.ui).lock):SetActive(not isUnlock)
  end
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R3 in 'UnsetPending'

  if not isUnlock and unlockDes ~= nil then
    ((self.ui).tex_Condition).text = unlockDes
  else
    self:RefreshRedDot()
  end
  if (self.ui).infoArray ~= nil then
    for _,go in ipairs((self.ui).infoArray) do
      go:SetActive(isUnlock)
    end
  end
end

UINHomeGeneralBtn.RefreshRedDot = function(self, num)
  -- function num : 0_2
  if num <= 0 then
    self.isHaveRedDot = num == nil
    self.isHaveRedDot = num or 0 <= 0 and self.isHaveRedDot
    if self.isUnlock then
      ((self.ui).obj_RedDot):SetActive(self.isHaveRedDot)
      -- DECOMPILER ERROR: 6 unprocessed JMP targets
    end
  end
end

UINHomeGeneralBtn.GetRedDotFunc = function(self)
  -- function num : 0_3 , upvalues : _ENV
  return BindCallback(self, self.RefreshRedDot)
end

UINHomeGeneralBtn.OnDelete = function(self)
  -- function num : 0_4 , upvalues : base
  (base.OnDelete)(self)
end

return UINHomeGeneralBtn

-- params : ...
-- function num : 0 , upvalues : _ENV
local UINHomeGeneralBtn = class("UINHomeGeneralBtn", UIBaseNode)
local base = UIBaseNode
UINHomeGeneralBtn.OnInit = function(self)
    -- function num : 0_0 , upvalues : _ENV
    self.isUnlock = false
    self.isHaveRedDot = false;
    (UIUtil.LuaUIBindingTable)(self.transform, self.ui)
end

UINHomeGeneralBtn.RefeshUnlockInfo = function(self, isUnlock, unlockDes)
    -- function num : 0_1 , upvalues : _ENV
    self.isUnlock = isUnlock
    if (self.ui).lock ~= nil then ((self.ui).lock):SetActive(not isUnlock) end
    -- DECOMPILER ERROR at PC16: Confused about usage of register: R3 in 'UnsetPending'

    if not isUnlock and unlockDes ~= nil then
        ((self.ui).tex_Condition).text = unlockDes
    else
        self:RefreshRedDot()
    end
    if (self.ui).infoArray ~= nil then
        for _, go in ipairs((self.ui).infoArray) do
            go:SetActive(isUnlock)
        end
    end
end

UINHomeGeneralBtn.RefreshRedDot = function(self, num)
    -- function num : 0_2
    if num <= 0 then
        self.isHaveRedDot = num == nil
        self.isHaveRedDot = num or 0 <= 0 and self.isHaveRedDot
        if self.isUnlock then
            ((self.ui).obj_RedDot):SetActive(self.isHaveRedDot)
            -- DECOMPILER ERROR: 6 unprocessed JMP targets
        end
    end
end

UINHomeGeneralBtn.GetRedDotFunc = function(self)
    -- function num : 0_3 , upvalues : _ENV
    return BindCallback(self, self.RefreshRedDot)
end

UINHomeGeneralBtn.OnDelete = function(self)
    -- function num : 0_4 , upvalues : base
    (base.OnDelete)(self)
end

return UINHomeGeneralBtn

