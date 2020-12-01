-- params : ...
-- function num : 0 , upvalues : _ENV
local UINHomeSideResItem = class("UINHomeSideResItem", UIBaseNode)
local base = UIBaseNode
local JumpManager = require("Game.Jump.JumpManager")
UINHomeSideResItem.OnInit = function(self)
  -- function num : 0_0 , upvalues : _ENV
  (UIUtil.LuaUIBindingTable)(self.transform, self.ui)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_tipsItem, self, self.OnClickBtn)
end

UINHomeSideResItem.InitSideResItem = function(self, CloseSide, resloader)
  -- function num : 0_1
  self.CloseSide = CloseSide
  self.resloader = resloader
end

UINHomeSideResItem.RefreshSideResItem = function(self, noticeData)
  -- function num : 0_2 , upvalues : _ENV
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R2 in 'UnsetPending'

  ((self.ui).tex_Content).text = noticeData:GetNoticeStr()
  self.timeStamp = noticeData.timeStamp
  self.jumpInfo = noticeData.jumpInfo
  ;
  (self.resloader):LoadABAssetAsync(PathConsts:GetAtlasAssetPath("UI_HomeSide"), function(spriteAtlas)
    -- function num : 0_2_0 , upvalues : self, noticeData
    if spriteAtlas == nil then
      return 
    end
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

    ;
    ((self.ui).img_Icon).sprite = spriteAtlas:GetSprite(noticeData:GetIcon())
  end
)
  self:RefreshTime()
end

UINHomeSideResItem.RefreshTime = function(self)
  -- function num : 0_3 , upvalues : _ENV
  local timePassed = PlayerDataCenter.timestamp - self.timeStamp
  if timePassed <= 60 then
    ((self.ui).tex_Timer):SetIndex(0, "1")
  else
    if timePassed <= 3600 then
      ((self.ui).tex_Timer):SetIndex(0, tostring((math.floor)(timePassed / 60)))
    else
      if timePassed <= 86400 then
        ((self.ui).tex_Timer):SetIndex(1, tostring((math.floor)(timePassed / 3600)))
      else
        local dataTable = TimestampToDate(self.timeStamp)
        ;
        ((self.ui).tex_Timer):SetIndex(2, tostring(dataTable.month), tostring(dataTable.day))
      end
    end
  end
end

UINHomeSideResItem.OnClickBtn = function(self)
  -- function num : 0_4 , upvalues : JumpManager
  if self.jumpInfo == nil then
    return 
  end
  if self.CloseSide ~= nil then
    (self.CloseSide)()
  end
  JumpManager:Jump((self.jumpInfo).jumpType, nil, (self.jumpInfo).argList)
end

UINHomeSideResItem.OnDelete = function(self)
  -- function num : 0_5 , upvalues : base
  (base.OnDelete)(self)
end

return UINHomeSideResItem

-- params : ...
-- function num : 0 , upvalues : _ENV
local UINHomeSideResItem = class("UINHomeSideResItem", UIBaseNode)
local base = UIBaseNode
local JumpManager = require("Game.Jump.JumpManager")
UINHomeSideResItem.OnInit = function(self)
    -- function num : 0_0 , upvalues : _ENV
    (UIUtil.LuaUIBindingTable)(self.transform, self.ui);
    (UIUtil.AddButtonListener)((self.ui).btn_tipsItem, self, self.OnClickBtn)
end

UINHomeSideResItem.InitSideResItem = function(self, CloseSide, resloader)
    -- function num : 0_1
    self.CloseSide = CloseSide
    self.resloader = resloader
end

UINHomeSideResItem.RefreshSideResItem = function(self, noticeData)
    -- function num : 0_2 , upvalues : _ENV
    -- DECOMPILER ERROR at PC4: Confused about usage of register: R2 in 'UnsetPending'

    ((self.ui).tex_Content).text = noticeData:GetNoticeStr()
    self.timeStamp = noticeData.timeStamp
    self.jumpInfo = noticeData.jumpInfo;
    (self.resloader):LoadABAssetAsync(
        PathConsts:GetAtlasAssetPath("UI_HomeSide"), function(spriteAtlas)
            -- function num : 0_2_0 , upvalues : self, noticeData
            if spriteAtlas == nil then return end -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'
            
            ((self.ui).img_Icon).sprite =
                spriteAtlas:GetSprite(noticeData:GetIcon())
        end)
    self:RefreshTime()
end

UINHomeSideResItem.RefreshTime = function(self)
    -- function num : 0_3 , upvalues : _ENV
    local timePassed = PlayerDataCenter.timestamp - self.timeStamp
    if timePassed <= 60 then
        ((self.ui).tex_Timer):SetIndex(0, "1")
    else
        if timePassed <= 3600 then
            ((self.ui).tex_Timer):SetIndex(0, tostring(
                                               (math.floor)(timePassed / 60)))
        else
            if timePassed <= 86400 then
                ((self.ui).tex_Timer):SetIndex(1, tostring(
                                                   (math.floor)(
                                                       timePassed / 3600)))
            else
                local dataTable = TimestampToDate(self.timeStamp);
                ((self.ui).tex_Timer):SetIndex(2, tostring(dataTable.month),
                                               tostring(dataTable.day))
            end
        end
    end
end

UINHomeSideResItem.OnClickBtn = function(self)
    -- function num : 0_4 , upvalues : JumpManager
    if self.jumpInfo == nil then return end
    if self.CloseSide ~= nil then (self.CloseSide)() end
    JumpManager:Jump((self.jumpInfo).jumpType, nil, (self.jumpInfo).argList)
end

UINHomeSideResItem.OnDelete = function(self)
    -- function num : 0_5 , upvalues : base
    (base.OnDelete)(self)
end

return UINHomeSideResItem

