-- params : ...
-- function num : 0 , upvalues : _ENV
local UIRichIntro = class("UIRichIntro", UIBaseWindow)
local base = UIBaseWindow
local UIRichIntroList = require("Game.CommonUI.RichIntro.UIRichIntroList")
local cs_GameData_ins = (CS.GameData).instance
local cs_Edge = ((CS.UnityEngine).RectTransform).Edge
UIRichIntro.OnInit = function(self)
  -- function num : 0_0 , upvalues : _ENV
  ((self.ui).obj_introList):SetActive(false)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_back, self, self.onBackClick)
end

UIRichIntro.ShowIntroBySkillData = function(self, parent, skillData, upColor, showHead, modifier)
  -- function num : 0_1
  local uiIntroData = {}
  uiIntroData.upColor = upColor or false
  uiIntroData.showHead = showHead or false
  uiIntroData.name = skillData:GetName()
  local skillLevel = skillData.level or 1
  local desc = ""
  if upColor == nil then
    desc = skillData:GetLevelDescribe(skillLevel)
  else
    desc = skillData:GetColorLevelDescribe(skillLevel, upColor)
  end
  uiIntroData.desc = desc
  uiIntroData.skillLabeIdList = skillData:GetSkillLabeIdList()
  self:SetRichIntroList(true, parent, uiIntroData, modifier)
end

UIRichIntro.SetRichIntroList = function(self, active, parent, uiIntroData, modifier)
  -- function num : 0_2 , upvalues : _ENV, UIRichIntroList
  if active then
    if self.introList == nil or IsNull((self.introList).gameObject) then
      self.introList = (UIRichIntroList.New)()
      local go = ((self.ui).obj_introList):Instantiate(parent)
      ;
      (self.introList):Init(go)
    else
      do
        ;
        ((self.introList).transform):SetParent(parent)
        ;
        (self.introList):Show()
        ;
        (self.introList):BindParent(parent)
        ;
        (self.introList):SetModifier(modifier)
        ;
        (self.introList):RefreshIntroListUI(uiIntroData)
        if self.introList ~= nil and not IsNull((self.introList).gameObject) then
          (self.introList):Hide()
        end
        self.introList = nil
      end
    end
  end
end

UIRichIntro.SetIntroListPosition = function(self, widthEdge, heightEdge)
  -- function num : 0_3 , upvalues : cs_Edge, _ENV
  if self.introList == nil then
    return 
  end
  local introTran = (self.introList).transform
  local pivotX = 0.5
  if widthEdge ~= nil then
    if widthEdge == cs_Edge.Left then
      pivotX = 0
    else
      if widthEdge == cs_Edge.Bottom then
        pivotX = 0
      else
        if widthEdge == cs_Edge.Right then
          pivotX = 1
        else
          if widthEdge == cs_Edge.Top then
            pivotX = 1
          end
        end
      end
    end
    local width = (introTran.rect).width
    introTran:SetInsetAndSizeFromParentEdge(widthEdge, 0, width)
  end
  do
    local pivotY = 0.5
    if heightEdge ~= nil then
      if heightEdge == cs_Edge.Left then
        pivotY = 0
      else
        if heightEdge == cs_Edge.Bottom then
          pivotY = 0
        else
          if heightEdge == cs_Edge.Right then
            pivotY = 1
          else
            if heightEdge == cs_Edge.Top then
              pivotY = 1
            end
          end
        end
      end
      local height = (introTran.rect).height
      introTran:SetInsetAndSizeFromParentEdge(heightEdge, 0, height)
    end
    do
      local newPivot = (Vector2.New)(pivotX, pivotY)
      introTran.pivot = newPivot
      introTran.anchoredPosition = Vector2.zero
    end
  end
end

UIRichIntro.SetIntroListModifier = function(self, modifier, is3D)
  -- function num : 0_4
  (self.introList):SetModifier(modifier, is3D)
end

UIRichIntro.onBackClick = function(self)
  -- function num : 0_5
  self:Hide()
end

UIRichIntro.OnHide = function(self)
  -- function num : 0_6 , upvalues : _ENV
  if self.introList ~= nil and not IsNull((self.introList).gameObject) then
    (self.introList):Hide()
  end
end

UIRichIntro.OnDelete = function(self)
  -- function num : 0_7 , upvalues : _ENV, base
  if self.introList ~= nil and not IsNull((self.introList).gameObject) then
    (self.introList):Delete()
  end
  ;
  (base.OnDelete)(self)
end

return UIRichIntro
