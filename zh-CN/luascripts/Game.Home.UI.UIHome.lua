-- params : ...
-- function num : 0 , upvalues : _ENV
local UIHome = class("UIHome", UIBaseWindow)
local base = UIBaseWindow
local CS_OasisCameraController = CS.OasisCameraController
local CS_SystemInfo = (CS.UnityEngine).SystemInfo
local CS_BatteryStatus = (CS.UnityEngine).BatteryStatus
local cs_ResLoader = CS.ResLoader
local UICarouselBanner = require("Game.CommonUI.Container.UI.UICarouselBanner")
local UINResourceGroup = require("Game.CommonUI.ResourceGroup.UINResourceGroup")
local UINHomeAdjutant = require("Game.Home.UI.UINHomeAdjutant")
local UINHomeResourceItem = require("Game.Home.UI.UINHomeResourceItem")
local UINHomeRightList = require("Game.Home.UI.UINHomeRightList")
local UINHomeNoticeItem = require("Game.Home.UI.UINHomeNoticeItem")
local HomeEnum = require("Game.Home.HomeEnum")
UIHome.OnInit = function(self)
  -- function num : 0_0 , upvalues : _ENV, cs_ResLoader, UINResourceGroup, UINHomeResourceItem, CS_OasisCameraController, UINHomeAdjutant, UINHomeRightList, UINHomeNoticeItem
  self.homeController = ControllerManager:GetController(ControllerTypeId.HomeController, true)
  self.resloader = (cs_ResLoader.Create)()
  self.resourceGroup = (UINResourceGroup.New)()
  ;
  (self.resourceGroup):Init((self.ui).obj_resourceGroup)
  ;
  (self.resourceGroup):ChangeResourceItemClass(UINHomeResourceItem)
  self.fakeCameraHome = ((((CS.UnityEngine).GameObject).Find)("FakeCameraHome")):GetComponent("Camera")
  self:AlignToFakeCamera(self.fakeCameraHome)
  self.bind = {}
  ;
  (UIUtil.LuaUIBindingTable)((CS_OasisCameraController.Instance).transform, self.bind)
  self.homeAdjutant = (UINHomeAdjutant.New)()
  ;
  (self.homeAdjutant):Init((self.ui).obj_heroHolder)
  ;
  (self.homeAdjutant):InitHomeAdjutant(self.bind)
  self.rightList = (UINHomeRightList.New)()
  ;
  (self.rightList):Init((self.ui).obj_right)
  ;
  (self.rightList):InitHomeRightList(self)
  self.sideWin = nil
  self.noticeItemPool = (UIItemPool.New)(UINHomeNoticeItem, (self.ui).noticePlaceHolder)
  ;
  ((self.ui).noticePlaceHolder):SetActive(false)
  if isEditorMode and ((CS.GMController).Instance).battleShortcut then
    ExplorationManager:ContinueLastExploration()
  end
  ;
  (UIUtil.AddButtonListenerWithArg)((self.ui).btn_HideUI, self, self.SetShowMainUI, false)
  ;
  (UIUtil.AddButtonListenerWithArg)((self.ui).btn_ShowMain, self, self.SetShowMainUI, true)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_SelectBoardHero, self, self.OnClickChangeAdjutantBtn)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_Task, self, self.OnClickTaskBtn)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_userInfo, self, self.OnClickPlayerInfoBtn)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_HomeSide, self, self.OnClickSideBtn)
  self:RegistTaskRedDot()
  self:RegistSideRedDot()
  GuideManager:TryTriggerGuide(eGuideCondition.FInHome)
end

UIHome.OnShow = function(self)
  -- function num : 0_1 , upvalues : base
  (self.homeController):OnShowHomeUI()
  self:RefreshName()
  self:RefreshUserLevel()
  self:RefreshTaskBtn()
  self:RefreshBannerWidget()
  ;
  (base.OnShow)(self)
end

UIHome.m_SetMainCameraEnabled = function(self, enabled)
  -- function num : 0_2 , upvalues : CS_OasisCameraController
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R2 in 'UnsetPending'

  ((CS_OasisCameraController.Instance).MainCamera).enabled = enabled
end

UIHome.SetFrom = function(self, from)
  -- function num : 0_3 , upvalues : _ENV
  if (from == AreaConst.Sector or from == AreaConst.FactoryDorm) and ((self.bind).homeToSectorGo).activeInHierarchy then
    (UIManager:ShowWindow(UIWindowTypeID.ClickContinue)):InitContinue(nil, nil, nil, Color.clear, false)
    ;
    ((self.bind).homeToSectorGo):SetActive(true)
    ;
    ((self.bind).homeToOasisGo):SetActive(false)
    ;
    ((self.bind).homeToMenuGo):SetActive(false)
    ;
    (self.rightList):WaitEpTimeLine(true)
    local timeline = nil
    if from == AreaConst.Sector then
      timeline = (self.bind).sectorPlayableDirector
    else
      timeline = (self.bind).factorydormPlayableDirector
    end
    self.__tlSectorCo = (TimelineUtil.Rewind)(timeline, function()
    -- function num : 0_3_0 , upvalues : _ENV, self
    UIManager:HideWindow(UIWindowTypeID.ClickContinue)
    ;
    (self.rightList):WaitEpTimeLine(false)
  end
)
  end
  do
    if from == AreaConst.Oasis then
      ((self.bind).homeToSectorGo):SetActive(false)
      ;
      ((self.bind).homeToOasisGo):SetActive(true)
      ;
      ((self.bind).homeToMenuGo):SetActive(false)
    end
  end
end

UIHome.SetTo = function(self, to)
  -- function num : 0_4 , upvalues : _ENV
  if to == AreaConst.Sector or to == AreaConst.FactoryDorm then
    ((self.bind).homeToSectorGo):SetActive(true)
    ;
    ((self.bind).homeToOasisGo):SetActive(false)
    ;
    ((self.bind).homeToMenuGo):SetActive(false)
  else
    if to == AreaConst.Oasis then
      ((self.bind).homeToSectorGo):SetActive(false)
      ;
      ((self.bind).homeToOasisGo):SetActive(true)
      ;
      ((self.bind).homeToMenuGo):SetActive(false)
    end
  end
end

UIHome.OpenOtherWin = function(self)
  -- function num : 0_5
  self:m_SetMainCameraEnabled(false)
  self:Hide()
end

UIHome.OpenOtherCoverWin = function(self)
  -- function num : 0_6
  (self.homeController):OnCoverHomeUI()
end

UIHome.BackFromOtherWin = function(self)
  -- function num : 0_7
  self:m_SetMainCameraEnabled(true)
  self:Show()
end

UIHome.BackFromOtherCoverWin = function(self)
  -- function num : 0_8
  (self.homeController):OnShowHomeUI()
end

UIHome.SetShowMainUI = function(self, bool)
  -- function num : 0_9
  ((self.ui).obj_main):SetActive(bool)
  ;
  ((self.ui).obj_rightBackground):SetActive(bool)
  ;
  (((self.ui).btn_ShowMain).gameObject):SetActive(not bool)
end

UIHome.OnClickChangeAdjutantBtn = function(self)
  -- function num : 0_10 , upvalues : _ENV
  UIManager:ShowWindowAsync(UIWindowTypeID.SelectBoardHero, function(win)
    -- function num : 0_10_0 , upvalues : self
    if win ~= nil then
      win:InitSelectBoardHero((self.homeController).homeCurrAdjutantHeroData, true)
      win.changeBoardHeroCallback = (self.homeAdjutant)._LoadBoardHero
      self:OpenOtherWin()
    end
  end
)
end

UIHome.OnClickPlayerInfoBtn = function(self)
  -- function num : 0_11 , upvalues : _ENV
  UIManager:ShowWindowAsync(UIWindowTypeID.UserInfo, function(win)
    -- function num : 0_11_0 , upvalues : self
    if win ~= nil then
      win:InitUserInfo()
      self:OpenOtherWin()
    end
  end
)
end

UIHome.OnClickTaskBtn = function(self)
  -- function num : 0_12 , upvalues : _ENV
  local taskController = ControllerManager:GetController(ControllerTypeId.Task, false)
  if taskController == nil then
    error("get taskController error")
    return 
  end
  taskController:ShowTaskUI(nil, self._BackFromOtherWin)
  self:OpenOtherWin()
end

UIHome.OnClickSideBtn = function(self)
  -- function num : 0_13 , upvalues : _ENV
  if self.sideWin == nil then
    UIManager:ShowWindowAsync(UIWindowTypeID.HomeSide, function(win)
    -- function num : 0_13_0 , upvalues : self
    if win ~= nil then
      self.sideWin = win
      ;
      (self.sideWin):InitSide(self)
      ;
      (self.sideWin):OpenSide()
    end
  end
)
  else
    ;
    (self.sideWin):OpenSide()
  end
end

UIHome.RegistSideRedDot = function(self)
  -- function num : 0_14 , upvalues : _ENV
  (self.homeController):AddRedDotEvent(function(num)
    -- function num : 0_14_0 , upvalues : self, _ENV
    (((self.ui).side_obj_RedDot).gameObject):SetActive(num > 0)
    if num < 10 then
      (((self.ui).tex_sideRedDotNum).gameObject):SetActive(true)
      -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

      ;
      ((self.ui).tex_sideRedDotNum).text = tostring(num)
      ;
      ((self.ui).side_obj_RedDot):SetIndex(0)
    else
      (((self.ui).tex_sideRedDotNum).gameObject):SetActive(false)
      ;
      ((self.ui).side_obj_RedDot):SetIndex(1)
    end
    if num > 0 then
      ((self.ui).tex_Dialog):SetIndex(2)
    else
      ((self.ui).tex_Dialog):SetIndex(1)
    end
    -- DECOMPILER ERROR: 5 unprocessed JMP targets
  end
, RedDotStaticTypeId.Main, RedDotStaticTypeId.MainSide)
end

UIHome.RegistTaskRedDot = function(self)
  -- function num : 0_15 , upvalues : _ENV
  (self.homeController):AddRedDotEvent(function(num)
    -- function num : 0_15_0 , upvalues : self
    ((self.ui).task_obj_RedDot):SetActive(num > 0)
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
, RedDotStaticTypeId.Main, RedDotStaticTypeId.Task)
end

UIHome.RefreshName = function(self)
  -- function num : 0_16 , upvalues : _ENV
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  ((self.ui).tex_UserName).text = PlayerDataCenter.playerName
  ;
  ((self.ui).tex_UserID):SetIndex(0, PlayerDataCenter.strPlayerId)
end

UIHome.RefreshUserLevel = function(self)
  -- function num : 0_17 , upvalues : _ENV
  local curLevel = (PlayerDataCenter.playerLevel).level or 1
  local empty = ""
  if curLevel <= 99 then
    empty = "0"
  else
    empty = ""
  end
  ;
  ((self.ui).tex_Level):SetIndex(0, empty, tostring(curLevel))
end

UIHome.RefreshTaskBtn = function(self)
  -- function num : 0_18 , upvalues : _ENV
  local isUnlock = (self.homeController):IsFuncUnlock(proto_csmsg_SystemFunctionID.SystemFunctionID_TaskUi)
  ;
  (((self.ui).btn_Task).gameObject):SetActive(isUnlock)
  if not isUnlock then
    return 
  end
  local taskData = (PlayerDataCenter.allTaskData):GetTaskData4Home()
  if taskData == nil then
    ((self.ui).tex_TaskInfo):SetIndex(1)
    ;
    ((self.ui).tex_Progress):SetIndex(1)
    return 
  end
  for stepIndex,stepData in ipairs(taskData.steps) do
    if stepData.schedule <= stepData.aim then
      local stepCfg = (taskData.taskStepCfg)[stepIndex]
      ;
      ((self.ui).tex_TaskInfo):SetIndex(0, (LanguageUtil.GetLocaleText)(stepCfg.intro))
      ;
      ((self.ui).tex_Progress):SetIndex(0, tostring(stepData.schedule), tostring(stepData.aim))
      return 
    end
  end
end

UIHome.RefreshBatteryAndTime = function(self)
  -- function num : 0_19 , upvalues : CS_SystemInfo, _ENV, CS_BatteryStatus
  local batteryLevel = CS_SystemInfo.batteryLevel
  local batteryStatus = CS_SystemInfo.batteryStatus
  local time = (((CS.System).DateTime).Now):ToShortTimeString()
  if batteryLevel == nil or batteryLevel < 0 then
    batteryLevel = 1
  end
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R4 in 'UnsetPending'

  ;
  ((self.ui).img_CurBattery).fillAmount = batteryLevel
  if batteryStatus == CS_BatteryStatus.Charging then
    ((self.ui).obj_recharge):SetActive(true)
  else
    ;
    ((self.ui).obj_recharge):SetActive(false)
  end
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R4 in 'UnsetPending'

  ;
  ((self.ui).tex_Clock).text = time
end

UIHome.RefreshBannerWidget = function(self)
  -- function num : 0_20 , upvalues : UICarouselBanner
  local bannerDatas = (self.homeController):GetBannerDatas()
  if #bannerDatas > 0 then
    if self.lowerBannerUI == nil then
      self.lowerBannerUI = (UICarouselBanner.New)()
      ;
      (self.lowerBannerUI):Init()
    end
    ;
    (self.lowerBannerUI):InjectSelectObj((self.ui).selectCountTrans, (self.ui).selectTrans, (self.ui).bannerSelectWidth)
    ;
    (self.lowerBannerUI):InitialWithData(bannerDatas, (self.ui).advList, (self.ui).advItem, self.resloader, (self.ui).bannerSelectWidth)
    ;
    ((self.ui).advTv):SetActive(true)
  else
    ;
    ((self.ui).advTv):SetActive(false)
  end
end

UIHome.OnUserNamelock = function(self, unlock)
  -- function num : 0_21
  (((self.ui).tex_UserName).gameObject):SetActive(unlock)
end

UIHome.AddNewNotice = function(self, noticeData)
  -- function num : 0_22 , upvalues : _ENV
  local item = (self.noticeItemPool):GetOne()
  ;
  (item.transform):SetAsFirstSibling()
  item:InitNoticeItem(noticeData, BindCallback(self, self.OnNoticeTweenPlayOver, item), self.resloader)
end

UIHome.OnNoticeTweenPlayOver = function(self, item)
  -- function num : 0_23
  (self.noticeItemPool):HideOne(item)
end

UIHome.OnHide = function(self)
  -- function num : 0_24 , upvalues : base
  (self.homeController):OnHideHomeUI()
  ;
  (base.OnHide)(self)
end

UIHome.OnDelete = function(self)
  -- function num : 0_25 , upvalues : _ENV, base
  (self.noticeItemPool):DeleteAll()
  ;
  (self.rightList):Delete()
  if self.resloader ~= nil then
    (self.resloader):Put2Pool()
    self.resloader = nil
  end
  ;
  (self.resourceGroup):Delete()
  ;
  (self.homeController):OnDeleteHomeUI()
  if self.__tlSectorCo ~= nil then
    (TimelineUtil.StopTlCo)(self.__tlSectorCo)
  end
  if self.sideWin ~= nil then
    (self.sideWin):Delete()
    self.sideWin = nil
  end
  ;
  (base.OnDelete)(self)
end

return UIHome

-- params : ...
-- function num : 0 , upvalues : _ENV
local UIHome = class("UIHome", UIBaseWindow)
local base = UIBaseWindow
local CS_OasisCameraController = CS.OasisCameraController
local CS_SystemInfo = (CS.UnityEngine).SystemInfo
local CS_BatteryStatus = (CS.UnityEngine).BatteryStatus
local cs_ResLoader = CS.ResLoader
local UICarouselBanner = require("Game.CommonUI.Container.UI.UICarouselBanner")
local UINResourceGroup = require("Game.CommonUI.ResourceGroup.UINResourceGroup")
local UINHomeAdjutant = require("Game.Home.UI.UINHomeAdjutant")
local UINHomeResourceItem = require("Game.Home.UI.UINHomeResourceItem")
local UINHomeRightList = require("Game.Home.UI.UINHomeRightList")
local UINHomeNoticeItem = require("Game.Home.UI.UINHomeNoticeItem")
local HomeEnum = require("Game.Home.HomeEnum")
UIHome.OnInit = function(self)
    -- function num : 0_0 , upvalues : _ENV, cs_ResLoader, UINResourceGroup, UINHomeResourceItem, CS_OasisCameraController, UINHomeAdjutant, UINHomeRightList, UINHomeNoticeItem
    self.homeController = ControllerManager:GetController(
                              ControllerTypeId.HomeController, true)
    self.resloader = (cs_ResLoader.Create)()
    self.resourceGroup = (UINResourceGroup.New)();
    (self.resourceGroup):Init((self.ui).obj_resourceGroup);
    (self.resourceGroup):ChangeResourceItemClass(UINHomeResourceItem)
    self.fakeCameraHome =
        ((((CS.UnityEngine).GameObject).Find)("FakeCameraHome")):GetComponent(
            "Camera")
    self:AlignToFakeCamera(self.fakeCameraHome)
    self.bind = {};
    (UIUtil.LuaUIBindingTable)((CS_OasisCameraController.Instance).transform,
                               self.bind)
    self.homeAdjutant = (UINHomeAdjutant.New)();
    (self.homeAdjutant):Init((self.ui).obj_heroHolder);
    (self.homeAdjutant):InitHomeAdjutant(self.bind)
    self.rightList = (UINHomeRightList.New)();
    (self.rightList):Init((self.ui).obj_right);
    (self.rightList):InitHomeRightList(self)
    self.sideWin = nil
    self.noticeItemPool = (UIItemPool.New)(UINHomeNoticeItem,
                                           (self.ui).noticePlaceHolder);
    ((self.ui).noticePlaceHolder):SetActive(false)
    if isEditorMode and ((CS.GMController).Instance).battleShortcut then
        ExplorationManager:ContinueLastExploration()
    end
    (UIUtil.AddButtonListenerWithArg)((self.ui).btn_HideUI, self,
                                      self.SetShowMainUI, false);
    (UIUtil.AddButtonListenerWithArg)((self.ui).btn_ShowMain, self,
                                      self.SetShowMainUI, true);
    (UIUtil.AddButtonListener)((self.ui).btn_SelectBoardHero, self,
                               self.OnClickChangeAdjutantBtn);
    (UIUtil.AddButtonListener)((self.ui).btn_Task, self, self.OnClickTaskBtn);
    (UIUtil.AddButtonListener)((self.ui).btn_userInfo, self,
                               self.OnClickPlayerInfoBtn);
    (UIUtil.AddButtonListener)((self.ui).btn_HomeSide, self, self.OnClickSideBtn)
    self:RegistTaskRedDot()
    self:RegistSideRedDot()
    GuideManager:TryTriggerGuide(eGuideCondition.FInHome)
end

UIHome.OnShow = function(self)
    -- function num : 0_1 , upvalues : base
    (self.homeController):OnShowHomeUI()
    self:RefreshName()
    self:RefreshUserLevel()
    self:RefreshTaskBtn()
    self:RefreshBannerWidget();
    (base.OnShow)(self)
end

UIHome.m_SetMainCameraEnabled = function(self, enabled)
    -- function num : 0_2 , upvalues : CS_OasisCameraController
    -- DECOMPILER ERROR at PC2: Confused about usage of register: R2 in 'UnsetPending'

    ((CS_OasisCameraController.Instance).MainCamera).enabled = enabled
end

UIHome.SetFrom = function(self, from)
    -- function num : 0_3 , upvalues : _ENV
    if (from == AreaConst.Sector or from == AreaConst.FactoryDorm) and
        ((self.bind).homeToSectorGo).activeInHierarchy then
        (UIManager:ShowWindow(UIWindowTypeID.ClickContinue)):InitContinue(nil,
                                                                          nil,
                                                                          nil,
                                                                          Color.clear,
                                                                          false);
        ((self.bind).homeToSectorGo):SetActive(true);
        ((self.bind).homeToOasisGo):SetActive(false);
        ((self.bind).homeToMenuGo):SetActive(false);
        (self.rightList):WaitEpTimeLine(true)
        local timeline = nil
        if from == AreaConst.Sector then
            timeline = (self.bind).sectorPlayableDirector
        else
            timeline = (self.bind).factorydormPlayableDirector
        end
        self.__tlSectorCo = (TimelineUtil.Rewind)(timeline, function()
            -- function num : 0_3_0 , upvalues : _ENV, self
            UIManager:HideWindow(UIWindowTypeID.ClickContinue);
            (self.rightList):WaitEpTimeLine(false)
        end)
    end
    do
        if from == AreaConst.Oasis then
            ((self.bind).homeToSectorGo):SetActive(false);
            ((self.bind).homeToOasisGo):SetActive(true);
            ((self.bind).homeToMenuGo):SetActive(false)
        end
    end
end

UIHome.SetTo = function(self, to)
    -- function num : 0_4 , upvalues : _ENV
    if to == AreaConst.Sector or to == AreaConst.FactoryDorm then
        ((self.bind).homeToSectorGo):SetActive(true);
        ((self.bind).homeToOasisGo):SetActive(false);
        ((self.bind).homeToMenuGo):SetActive(false)
    else
        if to == AreaConst.Oasis then
            ((self.bind).homeToSectorGo):SetActive(false);
            ((self.bind).homeToOasisGo):SetActive(true);
            ((self.bind).homeToMenuGo):SetActive(false)
        end
    end
end

UIHome.OpenOtherWin = function(self)
    -- function num : 0_5
    self:m_SetMainCameraEnabled(false)
    self:Hide()
end

UIHome.OpenOtherCoverWin = function(self)
    -- function num : 0_6
    (self.homeController):OnCoverHomeUI()
end

UIHome.BackFromOtherWin = function(self)
    -- function num : 0_7
    self:m_SetMainCameraEnabled(true)
    self:Show()
end

UIHome.BackFromOtherCoverWin = function(self)
    -- function num : 0_8
    (self.homeController):OnShowHomeUI()
end

UIHome.SetShowMainUI = function(self, bool)
    -- function num : 0_9
    ((self.ui).obj_main):SetActive(bool);
    ((self.ui).obj_rightBackground):SetActive(bool);
    (((self.ui).btn_ShowMain).gameObject):SetActive(not bool)
end

UIHome.OnClickChangeAdjutantBtn = function(self)
    -- function num : 0_10 , upvalues : _ENV
    UIManager:ShowWindowAsync(UIWindowTypeID.SelectBoardHero, function(win)
        -- function num : 0_10_0 , upvalues : self
        if win ~= nil then
            win:InitSelectBoardHero(
                (self.homeController).homeCurrAdjutantHeroData, true)
            win.changeBoardHeroCallback = (self.homeAdjutant)._LoadBoardHero
            self:OpenOtherWin()
        end
    end)
end

UIHome.OnClickPlayerInfoBtn = function(self)
    -- function num : 0_11 , upvalues : _ENV
    UIManager:ShowWindowAsync(UIWindowTypeID.UserInfo, function(win)
        -- function num : 0_11_0 , upvalues : self
        if win ~= nil then
            win:InitUserInfo()
            self:OpenOtherWin()
        end
    end)
end

UIHome.OnClickTaskBtn = function(self)
    -- function num : 0_12 , upvalues : _ENV
    local taskController = ControllerManager:GetController(
                               ControllerTypeId.Task, false)
    if taskController == nil then
        error("get taskController error")
        return
    end
    taskController:ShowTaskUI(nil, self._BackFromOtherWin)
    self:OpenOtherWin()
end

UIHome.OnClickSideBtn = function(self)
    -- function num : 0_13 , upvalues : _ENV
    if self.sideWin == nil then
        UIManager:ShowWindowAsync(UIWindowTypeID.HomeSide, function(win)
            -- function num : 0_13_0 , upvalues : self
            if win ~= nil then
                self.sideWin = win;
                (self.sideWin):InitSide(self);
                (self.sideWin):OpenSide()
            end
        end)
    else

        (self.sideWin):OpenSide()
    end
end

UIHome.RegistSideRedDot = function(self)
    -- function num : 0_14 , upvalues : _ENV
    (self.homeController):AddRedDotEvent(
        function(num)
            -- function num : 0_14_0 , upvalues : self, _ENV
            (((self.ui).side_obj_RedDot).gameObject):SetActive(num > 0)
            if num < 10 then
                (((self.ui).tex_sideRedDotNum).gameObject):SetActive(true) -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'
                ;
                ((self.ui).tex_sideRedDotNum).text = tostring(num);
                ((self.ui).side_obj_RedDot):SetIndex(0)
            else
                (((self.ui).tex_sideRedDotNum).gameObject):SetActive(false);
                ((self.ui).side_obj_RedDot):SetIndex(1)
            end
            if num > 0 then
                ((self.ui).tex_Dialog):SetIndex(2)
            else
                ((self.ui).tex_Dialog):SetIndex(1)
            end
            -- DECOMPILER ERROR: 5 unprocessed JMP targets
        end, RedDotStaticTypeId.Main, RedDotStaticTypeId.MainSide)
end

UIHome.RegistTaskRedDot = function(self)
    -- function num : 0_15 , upvalues : _ENV
    (self.homeController):AddRedDotEvent(
        function(num)
            -- function num : 0_15_0 , upvalues : self
            ((self.ui).task_obj_RedDot):SetActive(num > 0)
            -- DECOMPILER ERROR: 1 unprocessed JMP targets
        end, RedDotStaticTypeId.Main, RedDotStaticTypeId.Task)
end

UIHome.RefreshName = function(self)
    -- function num : 0_16 , upvalues : _ENV
    -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

    ((self.ui).tex_UserName).text = PlayerDataCenter.playerName;
    ((self.ui).tex_UserID):SetIndex(0, PlayerDataCenter.strPlayerId)
end

UIHome.RefreshUserLevel = function(self)
    -- function num : 0_17 , upvalues : _ENV
    local curLevel = (PlayerDataCenter.playerLevel).level or 1
    local empty = ""
    if curLevel <= 99 then
        empty = "0"
    else
        empty = ""
    end
    ((self.ui).tex_Level):SetIndex(0, empty, tostring(curLevel))
end

UIHome.RefreshTaskBtn = function(self)
    -- function num : 0_18 , upvalues : _ENV
    local isUnlock = (self.homeController):IsFuncUnlock(
                         proto_csmsg_SystemFunctionID.SystemFunctionID_TaskUi);
    (((self.ui).btn_Task).gameObject):SetActive(isUnlock)
    if not isUnlock then return end
    local taskData = (PlayerDataCenter.allTaskData):GetTaskData4Home()
    if taskData == nil then
        ((self.ui).tex_TaskInfo):SetIndex(1);
        ((self.ui).tex_Progress):SetIndex(1)
        return
    end
    for stepIndex, stepData in ipairs(taskData.steps) do
        if stepData.schedule <= stepData.aim then
            local stepCfg = (taskData.taskStepCfg)[stepIndex];
            ((self.ui).tex_TaskInfo):SetIndex(0, (LanguageUtil.GetLocaleText)(
                                                  stepCfg.intro));
            ((self.ui).tex_Progress):SetIndex(0, tostring(stepData.schedule),
                                              tostring(stepData.aim))
            return
        end
    end
end

UIHome.RefreshBatteryAndTime = function(self)
    -- function num : 0_19 , upvalues : CS_SystemInfo, _ENV, CS_BatteryStatus
    local batteryLevel = CS_SystemInfo.batteryLevel
    local batteryStatus = CS_SystemInfo.batteryStatus
    local time = (((CS.System).DateTime).Now):ToShortTimeString()
    if batteryLevel == nil or batteryLevel < 0 then batteryLevel = 1 end -- DECOMPILER ERROR at PC15: Confused about usage of register: R4 in 'UnsetPending'
    
    ((self.ui).img_CurBattery).fillAmount = batteryLevel
    if batteryStatus == CS_BatteryStatus.Charging then
        ((self.ui).obj_recharge):SetActive(true)
    else

        ((self.ui).obj_recharge):SetActive(false)
    end -- DECOMPILER ERROR at PC32: Confused about usage of register: R4 in 'UnsetPending'
    
    ((self.ui).tex_Clock).text = time
end

UIHome.RefreshBannerWidget = function(self)
    -- function num : 0_20 , upvalues : UICarouselBanner
    local bannerDatas = (self.homeController):GetBannerDatas()
    if #bannerDatas > 0 then
        if self.lowerBannerUI == nil then
            self.lowerBannerUI = (UICarouselBanner.New)();
            (self.lowerBannerUI):Init()
        end
        (self.lowerBannerUI):InjectSelectObj((self.ui).selectCountTrans,
                                             (self.ui).selectTrans,
                                             (self.ui).bannerSelectWidth);
        (self.lowerBannerUI):InitialWithData(bannerDatas, (self.ui).advList,
                                             (self.ui).advItem, self.resloader,
                                             (self.ui).bannerSelectWidth);
        ((self.ui).advTv):SetActive(true)
    else

        ((self.ui).advTv):SetActive(false)
    end
end

UIHome.OnUserNamelock = function(self, unlock)
    -- function num : 0_21
    (((self.ui).tex_UserName).gameObject):SetActive(unlock)
end

UIHome.AddNewNotice = function(self, noticeData)
    -- function num : 0_22 , upvalues : _ENV
    local item = (self.noticeItemPool):GetOne();
    (item.transform):SetAsFirstSibling()
    item:InitNoticeItem(noticeData,
                        BindCallback(self, self.OnNoticeTweenPlayOver, item),
                        self.resloader)
end

UIHome.OnNoticeTweenPlayOver = function(self, item)
    -- function num : 0_23
    (self.noticeItemPool):HideOne(item)
end

UIHome.OnHide = function(self)
    -- function num : 0_24 , upvalues : base
    (self.homeController):OnHideHomeUI();
    (base.OnHide)(self)
end

UIHome.OnDelete = function(self)
    -- function num : 0_25 , upvalues : _ENV, base
    (self.noticeItemPool):DeleteAll();
    (self.rightList):Delete()
    if self.resloader ~= nil then
        (self.resloader):Put2Pool()
        self.resloader = nil
    end
    (self.resourceGroup):Delete();
    (self.homeController):OnDeleteHomeUI()
    if self.__tlSectorCo ~= nil then
        (TimelineUtil.StopTlCo)(self.__tlSectorCo)
    end
    if self.sideWin ~= nil then
        (self.sideWin):Delete()
        self.sideWin = nil
    end
    (base.OnDelete)(self)
end

return UIHome
