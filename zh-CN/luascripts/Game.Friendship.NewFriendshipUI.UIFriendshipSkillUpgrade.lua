-- params : ...
-- function num : 0 , upvalues : _ENV
local UIFriendshipSkillUpgrade = class("UIFriendshipSkillUpgrade", UIBaseWindow)
local base = UIBaseWindow
local cs_ResLoader = CS.ResLoader
local cs_DoTween = ((CS.DG).Tweening).DOTween
local FriendshipEnum = require("Game.Friendship.FriendshipEnum")
local UINResourceGroup = require("Game.CommonUI.ResourceGroup.UINResourceGroup")
local UINFriendshipSkillUpgradeItem = require("Game.Friendship.NewFriendshipUI.UINFriendshipSkillUpgradeItem")
local UINFriendshipLevel = require("Game.Friendship.NewFriendshipUI.UINFriendshipLevel")
local UINFriendshipPresentNode = require("Game.Friendship.NewFriendshipUI.UINFriendshipPresentNode")
local UINFriendshipSkillInfoNode = require("Game.Friendship.NewFriendshipUI.UINFriendshipSkillInfoNode")
UIFriendshipSkillUpgrade.OnInit = function(self)
  -- function num : 0_0 , upvalues : _ENV, cs_ResLoader, UINResourceGroup, UINFriendshipSkillUpgradeItem, UINFriendshipLevel, UINFriendshipPresentNode, UINFriendshipSkillInfoNode
  (UIUtil.CreateTopBtnGroup)((self.ui).topButtonGroup, self, self.OnClickReturn)
  self.resloader = (cs_ResLoader.Create)()
  self.resourceGroup = (UINResourceGroup.New)()
  ;
  (self.resourceGroup):Init((self.ui).gameResourceGroup)
  self.skillPool = (UIItemPool.New)(UINFriendshipSkillUpgradeItem, (self.ui).obj_skillItem)
  ;
  ((self.ui).obj_skillItem):SetActive(false)
  self.friendshipLevelUI = (UINFriendshipLevel.New)()
  ;
  (self.friendshipLevelUI):Init((self.ui).obj_friendshipLevel)
  self.friendshipPresentNode = (UINFriendshipPresentNode.New)()
  ;
  (self.friendshipPresentNode):Init((self.ui).obj_presentNode)
  local AddExpCallback = BindCallback(self.friendshipLevelUI, (self.friendshipLevelUI).AddExp)
  local MinExpCallback = BindCallback(self.friendshipLevelUI, (self.friendshipLevelUI).MinExp)
  ;
  (self.friendshipPresentNode):InitResloader(self.resloader, AddExpCallback, MinExpCallback, self.friendshipLevelUI)
  self.friendshipSkillInfoNode = (UINFriendshipSkillInfoNode.New)()
  ;
  (self.friendshipSkillInfoNode):Init((self.ui).obj_infoNode)
  ;
  ((self.ui).obj_infoNode):SetActive(false)
  self:InitTweens()
  self.__OpenInfoNode = BindCallback(self, self.OpenInfoNode)
  self.__CloseInfoNode = BindCallback(self, self.CloseInfoNode)
  self.__OnFriendShipDataChangeI = BindCallback(self, self.OnFriendShipDataChange)
  MsgCenter:AddListener(eMsgEventId.OnHeroFriendshipDataChange, self.__OnFriendShipDataChangeI)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_LeftArrow, self, self.__OnClickLeftArrow)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_RightArrow, self, self.__OnClickRightArrow)
end

UIFriendshipSkillUpgrade.InitFriendshipSkillUpgrade = function(self, heroData, reUseBigImgResloader, hideCallBack, switchHeroFunc)
  -- function num : 0_1 , upvalues : _ENV
  self.isClosing = false
  self.heroData = heroData
  self.heroId = heroData.dataId
  self.hideCallBack = hideCallBack
  self.switchHeroFunc = switchHeroFunc
  ;
  ((self.ui).obj_quickSwitch):SetActive(switchHeroFunc ~= nil)
  local allFriendshipData = PlayerDataCenter.allFriendshipData
  self:RefreshHeroStaticInfo(reUseBigImgResloader)
  self:RefreshSkillData(self.heroId)
  self:RefreshAllSkills()
  self:PlayAllStartTween()
  ;
  (self.friendshipLevelUI):InitFriendShipPresent(self.heroId)
  ;
  (self.friendshipPresentNode):InitSendGift(self.heroId)
  ;
  (self.friendshipPresentNode):RefreshPresentConfirmBtn()
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

UIFriendshipSkillUpgrade.SwitchHero = function(self, heroData, reUseBigImgResloader)
  -- function num : 0_2
  self.heroData = heroData
  self.heroId = heroData.dataId
  self:RefreshHeroStaticInfo(reUseBigImgResloader)
  self:RefreshSkillData(self.heroId)
  self:RefreshAllSkills()
  self:PlayAllStartTween()
  ;
  (((self.ui).skillNode).gameObject):SetActive(true)
  ;
  (((self.ui).infoNode).gameObject):SetActive(false)
  ;
  (self.friendshipLevelUI):InitFriendShipPresent(self.heroId)
  ;
  (self.friendshipPresentNode):InitSendGift(self.heroId)
end

UIFriendshipSkillUpgrade.OnFriendShipDataChange = function(self)
  -- function num : 0_3 , upvalues : _ENV
  (self.friendshipLevelUI):InitFriendShipPresent(self.heroId)
  for _,item in ipairs((self.skillPool).listItem) do
    item:Refresh()
  end
end

UIFriendshipSkillUpgrade.RefreshSkillData = function(self, heroId)
  -- function num : 0_4 , upvalues : _ENV
  self.fosterCfgs = {}
  self.fosterIds = ((ConfigData.friendship_hero)[heroId]).foster_id
  for _,fosterId in ipairs(self.fosterIds) do
    (table.insert)(self.fosterCfgs, (ConfigData.friendship_foster)[fosterId])
  end
end

UIFriendshipSkillUpgrade.RefreshAllSkills = function(self)
  -- function num : 0_5 , upvalues : _ENV
  (self.skillPool):HideAll()
  self.itemList = {}
  for index,fosterCfg in ipairs(self.fosterCfgs) do
    local item = (self.skillPool):GetOne(true)
    item:InitSkillItem(self.heroId, fosterCfg, self.__OpenInfoNode)
    ;
    (table.insert)(self.itemList, item)
  end
  self:InitSkillTween()
end

UIFriendshipSkillUpgrade.RefreshHeroStaticInfo = function(self, reUseBigImgResloader)
  -- function num : 0_6 , upvalues : _ENV, cs_ResLoader
  local campIcon = (LanguageUtil.GetLocaleText)(((self.heroData):GetCampCfg()).icon)
  ;
  (self.resloader):LoadABAssetAsync(PathConsts:GetCampPicPath(campIcon), function(texture)
    -- function num : 0_6_0 , upvalues : _ENV, self
    if IsNull(self.transform) then
      return 
    end
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

    ;
    ((self.ui).img_Camp).texture = texture
  end
)
  if reUseBigImgResloader ~= nil then
    if self.bigImgGameObject ~= nil then
      (self.bigImgGameObject):SetActive(false)
    end
    reUseBigImgResloader:LoadABAssetAsync(PathConsts:GetCharacterBigImgPrefabPath((self.heroData):GetResName()), function(prefab)
    -- function num : 0_6_1 , upvalues : _ENV, self
    DestroyUnityObject(self.bigImgGameObject)
    self.bigImgGameObject = prefab:Instantiate((self.ui).heroHolder)
    local commonPicCtrl = (self.bigImgGameObject):FindComponent(eUnityComponentID.CommonPicController)
    commonPicCtrl:SetPosType("HeroList")
  end
)
  else
    if self.bigImgResloader ~= nil then
      (self.bigImgResloader):Put2Pool()
    end
    self.bigImgResloader = (cs_ResLoader.Create)()
    ;
    (self.bigImgResloader):LoadABAssetAsync(PathConsts:GetCharacterBigImgPrefabPath((self.heroData):GetResName()), function(prefab)
    -- function num : 0_6_2 , upvalues : _ENV, self
    DestroyUnityObject(self.bigImgGameObject)
    self.bigImgGameObject = prefab:Instantiate((self.ui).heroHolder)
    local commonPicCtrl = (self.bigImgGameObject):FindComponent(eUnityComponentID.CommonPicController)
    commonPicCtrl:SetPosType("HeroList")
  end
)
  end
end

UIFriendshipSkillUpgrade.InitTweens = function(self)
  -- function num : 0_7 , upvalues : _ENV, cs_DoTween
  local openMove = (Vector3.New)(200, 0, 0)
  local closeMove = (Vector3.New)(-200, 0, 0)
  self.openInfoSequence = ((((((((((cs_DoTween.Sequence)()):AppendCallback(function()
    -- function num : 0_7_0 , upvalues : self, _ENV
    (((self.ui).infoNode).gameObject):SetActive(true)
    for _,tween in ipairs((self.ui).AllStartTweens) do
      tween:DOComplete(false)
    end
  end
)):Append(((((self.ui).skillNode).transform):DOLocalMove(openMove, 0.25)):SetRelative(true))):Join(((self.ui).skillNode):DOFade(0, 0.25))):Join(((self.ui).infoNode):DOFade(1, 0.25))):Join((((self.ui).levelNode):DOLocalMove(openMove, 0.25)):From(true))):Join(((((self.ui).skillDetailNode):DOLocalMove(openMove, 0.25)):SetDelay(0.05)):From(true))):AppendCallback(function()
    -- function num : 0_7_1 , upvalues : self
    (((self.ui).skillNode).gameObject):SetActive(false)
  end
)):Pause()):SetAutoKill(false)
  self.closeInfoSequence = ((((((((((cs_DoTween.Sequence)()):AppendCallback(function()
    -- function num : 0_7_2 , upvalues : self
    (((self.ui).skillNode).gameObject):SetActive(true)
    ;
    (self.showSkillListSequence):Restart()
  end
)):Append(((((self.ui).skillNode).transform):DOLocalMove(closeMove, 0.25)):SetRelative(true))):Join(((self.ui).skillNode):DOFade(1, 0.25))):Join(((self.ui).infoNode):DOFade(0, 0.25))):Join((((self.ui).levelNode):DOLocalMove(closeMove, 0.25)):From(true))):Join(((((self.ui).skillDetailNode):DOLocalMove(closeMove, 0.25)):SetDelay(0.05)):From(true))):AppendCallback(function()
    -- function num : 0_7_3 , upvalues : self
    (((self.ui).infoNode).gameObject):SetActive(false)
  end
)):Pause()):SetAutoKill(false)
end

UIFriendshipSkillUpgrade.InitSkillTween = function(self)
  -- function num : 0_8 , upvalues : _ENV, cs_DoTween
  if self.showSkillListSequence ~= nil then
    (self.showSkillListSequence):Kill()
    self.showSkillListSequence = nil
  end
  local openMove = (Vector3.New)(200, 0, 0)
  self.showSkillListSequence = (cs_DoTween.Sequence)()
  for index,item in ipairs((self.skillPool).listItem) do
    if index == 1 then
      (self.showSkillListSequence):Append(((((item.ui).skillUpgradeItem):DOLocalMove(openMove, 0.25)):SetDelay(0.05)):From(true))
    else
      ;
      (self.showSkillListSequence):Join(((((item.ui).skillUpgradeItem):DOLocalMove(openMove, 0.25)):SetDelay(0.05)):From(true))
    end
  end
  ;
  ((self.showSkillListSequence):Pause()):SetAutoKill(false)
end

UIFriendshipSkillUpgrade.KillAllTweens = function(self)
  -- function num : 0_9
  (self.openInfoSequence):Kill()
  self.openInfoSequence = nil
  ;
  (self.closeInfoSequence):Kill()
  self.closeInfoSequence = nil
  if self.showSkillListSequence ~= nil then
    (self.showSkillListSequence):Kill()
    self.showSkillListSequence = nil
  end
end

UIFriendshipSkillUpgrade.PlayAllStartTween = function(self)
  -- function num : 0_10 , upvalues : _ENV
  (self.showSkillListSequence):Restart(false)
  for _,tween in ipairs((self.ui).AllStartTweens) do
    tween:DORestart(false)
  end
end

UIFriendshipSkillUpgrade.BackwardsAllStartTween = function(self, callback)
  -- function num : 0_11 , upvalues : _ENV
  local longestDuration = 0
  for _,tween in ipairs((self.ui).AllStartTweens) do
    if longestDuration < tween.duration then
      longestDuration = tween.duration
    end
    tween:DOPlayBackwards()
  end
  if callback ~= nil then
    (TimerManager:GetTimer(longestDuration, callback, nil, true)):Start()
  end
end

UIFriendshipSkillUpgrade.OpenInfoNode = function(self, heroId, fosterCfg)
  -- function num : 0_12 , upvalues : _ENV
  if #fosterCfg <= (PlayerDataCenter.allFriendshipData):GetForestLineLevel(heroId, (fosterCfg[1]).id) then
    return 
  end
  ;
  (self.openInfoSequence):Restart()
  ;
  (self.friendshipSkillInfoNode):InitSkillInfoNode(heroId, fosterCfg, self.__CloseInfoNode)
  ;
  (UIUtil.Push2BackStack)(self.__CloseInfoNode)
end

UIFriendshipSkillUpgrade.CloseInfoNode = function(self)
  -- function num : 0_13
  (self.closeInfoSequence):Restart()
end

UIFriendshipSkillUpgrade.__OnClickLeftArrow = function(self)
  -- function num : 0_14
  if self.showSkillListSequence ~= nil then
    (self.showSkillListSequence):Kill(true)
    self.showSkillListSequence = nil
  end
  if self.switchHeroFunc ~= nil then
    local newHeroData, reUseBigImgResloader = (self.switchHeroFunc)(-1, function(newHeroData, reUseBigImgResloader)
    -- function num : 0_14_0 , upvalues : self
    self:SwitchHero(newHeroData, reUseBigImgResloader)
  end
)
    if newHeroData ~= nil then
      self:SwitchHero(newHeroData, reUseBigImgResloader)
    end
  end
end

UIFriendshipSkillUpgrade.__OnClickRightArrow = function(self)
  -- function num : 0_15
  if self.showSkillListSequence ~= nil then
    (self.showSkillListSequence):Kill(true)
    self.showSkillListSequence = nil
  end
  if self.switchHeroFunc ~= nil then
    local newHeroData, reUseBigImgResloader = (self.switchHeroFunc)(1, function(newHeroData, reUseBigImgResloader)
    -- function num : 0_15_0 , upvalues : self
    self:SwitchHero(newHeroData, reUseBigImgResloader)
  end
)
    if newHeroData ~= nil then
      self:SwitchHero(newHeroData, reUseBigImgResloader)
    end
  end
end

UIFriendshipSkillUpgrade.OnHide = function(self)
  -- function num : 0_16 , upvalues : base
  if self.hideCallBack ~= nil then
    (self.hideCallBack)()
  end
  ;
  (base.OnHide)(self)
end

UIFriendshipSkillUpgrade.OnClickReturn = function(self)
  -- function num : 0_17
  if not self.isClosing then
    self.isClosing = true
  else
    return 
  end
  self:Delete()
end

UIFriendshipSkillUpgrade.OnDelete = function(self)
  -- function num : 0_18 , upvalues : _ENV, base
  if self.resloader ~= nil then
    (self.resloader):Put2Pool()
    self.resloader = nil
  end
  self:KillAllTweens()
  ;
  (self.skillPool):DeleteAll()
  ;
  (self.friendshipLevelUI):Delete()
  ;
  (self.friendshipPresentNode):Delete()
  ;
  (self.friendshipSkillInfoNode):Delete()
  ;
  (self.resourceGroup):Delete()
  MsgCenter:RemoveListener(eMsgEventId.OnHeroFriendshipDataChange, self.__OnFriendShipDataChangeI)
  ;
  (base.OnDelete)(self)
end

return UIFriendshipSkillUpgrade

-- params : ...
-- function num : 0 , upvalues : _ENV
local UIFriendshipSkillUpgrade = class("UIFriendshipSkillUpgrade", UIBaseWindow)
local base = UIBaseWindow
local cs_ResLoader = CS.ResLoader
local cs_DoTween = ((CS.DG).Tweening).DOTween
local FriendshipEnum = require("Game.Friendship.FriendshipEnum")
local UINResourceGroup = require("Game.CommonUI.ResourceGroup.UINResourceGroup")
local UINFriendshipSkillUpgradeItem = require(
                                          "Game.Friendship.NewFriendshipUI.UINFriendshipSkillUpgradeItem")
local UINFriendshipLevel = require(
                               "Game.Friendship.NewFriendshipUI.UINFriendshipLevel")
local UINFriendshipPresentNode = require(
                                     "Game.Friendship.NewFriendshipUI.UINFriendshipPresentNode")
local UINFriendshipSkillInfoNode = require(
                                       "Game.Friendship.NewFriendshipUI.UINFriendshipSkillInfoNode")
UIFriendshipSkillUpgrade.OnInit = function(self)
    -- function num : 0_0 , upvalues : _ENV, cs_ResLoader, UINResourceGroup, UINFriendshipSkillUpgradeItem, UINFriendshipLevel, UINFriendshipPresentNode, UINFriendshipSkillInfoNode
    (UIUtil.CreateTopBtnGroup)((self.ui).topButtonGroup, self,
                               self.OnClickReturn)
    self.resloader = (cs_ResLoader.Create)()
    self.resourceGroup = (UINResourceGroup.New)();
    (self.resourceGroup):Init((self.ui).gameResourceGroup)
    self.skillPool = (UIItemPool.New)(UINFriendshipSkillUpgradeItem,
                                      (self.ui).obj_skillItem);
    ((self.ui).obj_skillItem):SetActive(false)
    self.friendshipLevelUI = (UINFriendshipLevel.New)();
    (self.friendshipLevelUI):Init((self.ui).obj_friendshipLevel)
    self.friendshipPresentNode = (UINFriendshipPresentNode.New)();
    (self.friendshipPresentNode):Init((self.ui).obj_presentNode)
    local AddExpCallback = BindCallback(self.friendshipLevelUI,
                                        (self.friendshipLevelUI).AddExp)
    local MinExpCallback = BindCallback(self.friendshipLevelUI,
                                        (self.friendshipLevelUI).MinExp);
    (self.friendshipPresentNode):InitResloader(self.resloader, AddExpCallback,
                                               MinExpCallback,
                                               self.friendshipLevelUI)
    self.friendshipSkillInfoNode = (UINFriendshipSkillInfoNode.New)();
    (self.friendshipSkillInfoNode):Init((self.ui).obj_infoNode);
    ((self.ui).obj_infoNode):SetActive(false)
    self:InitTweens()
    self.__OpenInfoNode = BindCallback(self, self.OpenInfoNode)
    self.__CloseInfoNode = BindCallback(self, self.CloseInfoNode)
    self.__OnFriendShipDataChangeI = BindCallback(self,
                                                  self.OnFriendShipDataChange)
    MsgCenter:AddListener(eMsgEventId.OnHeroFriendshipDataChange,
                          self.__OnFriendShipDataChangeI);
    (UIUtil.AddButtonListener)((self.ui).btn_LeftArrow, self,
                               self.__OnClickLeftArrow);
    (UIUtil.AddButtonListener)((self.ui).btn_RightArrow, self,
                               self.__OnClickRightArrow)
end

UIFriendshipSkillUpgrade.InitFriendshipSkillUpgrade =
    function(self, heroData, reUseBigImgResloader, hideCallBack, switchHeroFunc)
        -- function num : 0_1 , upvalues : _ENV
        self.isClosing = false
        self.heroData = heroData
        self.heroId = heroData.dataId
        self.hideCallBack = hideCallBack
        self.switchHeroFunc = switchHeroFunc;
        ((self.ui).obj_quickSwitch):SetActive(switchHeroFunc ~= nil)
        local allFriendshipData = PlayerDataCenter.allFriendshipData
        self:RefreshHeroStaticInfo(reUseBigImgResloader)
        self:RefreshSkillData(self.heroId)
        self:RefreshAllSkills()
        self:PlayAllStartTween();
        (self.friendshipLevelUI):InitFriendShipPresent(self.heroId);
        (self.friendshipPresentNode):InitSendGift(self.heroId);
        (self.friendshipPresentNode):RefreshPresentConfirmBtn()
        -- DECOMPILER ERROR: 1 unprocessed JMP targets
    end

UIFriendshipSkillUpgrade.SwitchHero = function(self, heroData,
                                               reUseBigImgResloader)
    -- function num : 0_2
    self.heroData = heroData
    self.heroId = heroData.dataId
    self:RefreshHeroStaticInfo(reUseBigImgResloader)
    self:RefreshSkillData(self.heroId)
    self:RefreshAllSkills()
    self:PlayAllStartTween();
    (((self.ui).skillNode).gameObject):SetActive(true);
    (((self.ui).infoNode).gameObject):SetActive(false);
    (self.friendshipLevelUI):InitFriendShipPresent(self.heroId);
    (self.friendshipPresentNode):InitSendGift(self.heroId)
end

UIFriendshipSkillUpgrade.OnFriendShipDataChange =
    function(self)
        -- function num : 0_3 , upvalues : _ENV
        (self.friendshipLevelUI):InitFriendShipPresent(self.heroId)
        for _, item in ipairs((self.skillPool).listItem) do
            item:Refresh()
        end
    end

UIFriendshipSkillUpgrade.RefreshSkillData =
    function(self, heroId)
        -- function num : 0_4 , upvalues : _ENV
        self.fosterCfgs = {}
        self.fosterIds = ((ConfigData.friendship_hero)[heroId]).foster_id
        for _, fosterId in ipairs(self.fosterIds) do
            (table.insert)(self.fosterCfgs,
                           (ConfigData.friendship_foster)[fosterId])
        end
    end

UIFriendshipSkillUpgrade.RefreshAllSkills =
    function(self)
        -- function num : 0_5 , upvalues : _ENV
        (self.skillPool):HideAll()
        self.itemList = {}
        for index, fosterCfg in ipairs(self.fosterCfgs) do
            local item = (self.skillPool):GetOne(true)
            item:InitSkillItem(self.heroId, fosterCfg, self.__OpenInfoNode);
            (table.insert)(self.itemList, item)
        end
        self:InitSkillTween()
    end

UIFriendshipSkillUpgrade.RefreshHeroStaticInfo =
    function(self, reUseBigImgResloader)
        -- function num : 0_6 , upvalues : _ENV, cs_ResLoader
        local campIcon = (LanguageUtil.GetLocaleText)(
                             ((self.heroData):GetCampCfg()).icon);
        (self.resloader):LoadABAssetAsync(PathConsts:GetCampPicPath(campIcon),
                                          function(texture)
            -- function num : 0_6_0 , upvalues : _ENV, self
            if IsNull(self.transform) then return end -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'
            
            ((self.ui).img_Camp).texture = texture
        end)
        if reUseBigImgResloader ~= nil then
            if self.bigImgGameObject ~= nil then
                (self.bigImgGameObject):SetActive(false)
            end
            reUseBigImgResloader:LoadABAssetAsync(
                PathConsts:GetCharacterBigImgPrefabPath(
                    (self.heroData):GetResName()), function(prefab)
                    -- function num : 0_6_1 , upvalues : _ENV, self
                    DestroyUnityObject(self.bigImgGameObject)
                    self.bigImgGameObject =
                        prefab:Instantiate((self.ui).heroHolder)
                    local commonPicCtrl =
                        (self.bigImgGameObject):FindComponent(
                            eUnityComponentID.CommonPicController)
                    commonPicCtrl:SetPosType("HeroList")
                end)
        else
            if self.bigImgResloader ~= nil then
                (self.bigImgResloader):Put2Pool()
            end
            self.bigImgResloader = (cs_ResLoader.Create)();
            (self.bigImgResloader):LoadABAssetAsync(
                PathConsts:GetCharacterBigImgPrefabPath(
                    (self.heroData):GetResName()), function(prefab)
                    -- function num : 0_6_2 , upvalues : _ENV, self
                    DestroyUnityObject(self.bigImgGameObject)
                    self.bigImgGameObject =
                        prefab:Instantiate((self.ui).heroHolder)
                    local commonPicCtrl =
                        (self.bigImgGameObject):FindComponent(
                            eUnityComponentID.CommonPicController)
                    commonPicCtrl:SetPosType("HeroList")
                end)
        end
    end

UIFriendshipSkillUpgrade.InitTweens = function(self)
    -- function num : 0_7 , upvalues : _ENV, cs_DoTween
    local openMove = (Vector3.New)(200, 0, 0)
    local closeMove = (Vector3.New)(-200, 0, 0)
    self.openInfoSequence = ((((((((((cs_DoTween.Sequence)()):AppendCallback(
                                function()
            -- function num : 0_7_0 , upvalues : self, _ENV
            (((self.ui).infoNode).gameObject):SetActive(true)
            for _, tween in ipairs((self.ui).AllStartTweens) do
                tween:DOComplete(false)
            end
        end)):Append(((((self.ui).skillNode).transform):DOLocalMove(openMove,
                                                                    0.25)):SetRelative(
                         true))):Join(((self.ui).skillNode):DOFade(0, 0.25))):Join(
                                ((self.ui).infoNode):DOFade(1, 0.25))):Join(
                                (((self.ui).levelNode):DOLocalMove(openMove,
                                                                   0.25)):From(
                                    true))):Join(
                                ((((self.ui).skillDetailNode):DOLocalMove(
                                    openMove, 0.25)):SetDelay(0.05)):From(true))):AppendCallback(
                                function()
            -- function num : 0_7_1 , upvalues : self
            (((self.ui).skillNode).gameObject):SetActive(false)
        end)):Pause()):SetAutoKill(false)
    self.closeInfoSequence = ((((((((((cs_DoTween.Sequence)()):AppendCallback(
                                 function()
            -- function num : 0_7_2 , upvalues : self
            (((self.ui).skillNode).gameObject):SetActive(true);
            (self.showSkillListSequence):Restart()
        end)):Append(((((self.ui).skillNode).transform):DOLocalMove(closeMove,
                                                                    0.25)):SetRelative(
                         true))):Join(((self.ui).skillNode):DOFade(1, 0.25))):Join(
                                 ((self.ui).infoNode):DOFade(0, 0.25))):Join(
                                 (((self.ui).levelNode):DOLocalMove(closeMove,
                                                                    0.25)):From(
                                     true))):Join(
                                 ((((self.ui).skillDetailNode):DOLocalMove(
                                     closeMove, 0.25)):SetDelay(0.05)):From(true))):AppendCallback(
                                 function()
            -- function num : 0_7_3 , upvalues : self
            (((self.ui).infoNode).gameObject):SetActive(false)
        end)):Pause()):SetAutoKill(false)
end

UIFriendshipSkillUpgrade.InitSkillTween =
    function(self)
        -- function num : 0_8 , upvalues : _ENV, cs_DoTween
        if self.showSkillListSequence ~= nil then
            (self.showSkillListSequence):Kill()
            self.showSkillListSequence = nil
        end
        local openMove = (Vector3.New)(200, 0, 0)
        self.showSkillListSequence = (cs_DoTween.Sequence)()
        for index, item in ipairs((self.skillPool).listItem) do
            if index == 1 then
                (self.showSkillListSequence):Append(
                    ((((item.ui).skillUpgradeItem):DOLocalMove(openMove, 0.25)):SetDelay(
                        0.05)):From(true))
            else

                (self.showSkillListSequence):Join(
                    ((((item.ui).skillUpgradeItem):DOLocalMove(openMove, 0.25)):SetDelay(
                        0.05)):From(true))
            end
        end
        ((self.showSkillListSequence):Pause()):SetAutoKill(false)
    end

UIFriendshipSkillUpgrade.KillAllTweens =
    function(self)
        -- function num : 0_9
        (self.openInfoSequence):Kill()
        self.openInfoSequence = nil;
        (self.closeInfoSequence):Kill()
        self.closeInfoSequence = nil
        if self.showSkillListSequence ~= nil then
            (self.showSkillListSequence):Kill()
            self.showSkillListSequence = nil
        end
    end

UIFriendshipSkillUpgrade.PlayAllStartTween =
    function(self)
        -- function num : 0_10 , upvalues : _ENV
        (self.showSkillListSequence):Restart(false)
        for _, tween in ipairs((self.ui).AllStartTweens) do
            tween:DORestart(false)
        end
    end

UIFriendshipSkillUpgrade.BackwardsAllStartTween =
    function(self, callback)
        -- function num : 0_11 , upvalues : _ENV
        local longestDuration = 0
        for _, tween in ipairs((self.ui).AllStartTweens) do
            if longestDuration < tween.duration then
                longestDuration = tween.duration
            end
            tween:DOPlayBackwards()
        end
        if callback ~= nil then
            (TimerManager:GetTimer(longestDuration, callback, nil, true)):Start()
        end
    end

UIFriendshipSkillUpgrade.OpenInfoNode = function(self, heroId, fosterCfg)
    -- function num : 0_12 , upvalues : _ENV
    if #fosterCfg <=
        (PlayerDataCenter.allFriendshipData):GetForestLineLevel(heroId,
                                                                (fosterCfg[1]).id) then
        return
    end
    (self.openInfoSequence):Restart();
    (self.friendshipSkillInfoNode):InitSkillInfoNode(heroId, fosterCfg,
                                                     self.__CloseInfoNode);
    (UIUtil.Push2BackStack)(self.__CloseInfoNode)
end

UIFriendshipSkillUpgrade.CloseInfoNode =
    function(self)
        -- function num : 0_13
        (self.closeInfoSequence):Restart()
    end

UIFriendshipSkillUpgrade.__OnClickLeftArrow =
    function(self)
        -- function num : 0_14
        if self.showSkillListSequence ~= nil then
            (self.showSkillListSequence):Kill(true)
            self.showSkillListSequence = nil
        end
        if self.switchHeroFunc ~= nil then
            local newHeroData, reUseBigImgResloader =
                (self.switchHeroFunc)(-1,
                                      function(newHeroData, reUseBigImgResloader)
                    -- function num : 0_14_0 , upvalues : self
                    self:SwitchHero(newHeroData, reUseBigImgResloader)
                end)
            if newHeroData ~= nil then
                self:SwitchHero(newHeroData, reUseBigImgResloader)
            end
        end
    end

UIFriendshipSkillUpgrade.__OnClickRightArrow =
    function(self)
        -- function num : 0_15
        if self.showSkillListSequence ~= nil then
            (self.showSkillListSequence):Kill(true)
            self.showSkillListSequence = nil
        end
        if self.switchHeroFunc ~= nil then
            local newHeroData, reUseBigImgResloader =
                (self.switchHeroFunc)(1,
                                      function(newHeroData, reUseBigImgResloader)
                    -- function num : 0_15_0 , upvalues : self
                    self:SwitchHero(newHeroData, reUseBigImgResloader)
                end)
            if newHeroData ~= nil then
                self:SwitchHero(newHeroData, reUseBigImgResloader)
            end
        end
    end

UIFriendshipSkillUpgrade.OnHide = function(self)
    -- function num : 0_16 , upvalues : base
    if self.hideCallBack ~= nil then (self.hideCallBack)() end
    (base.OnHide)(self)
end

UIFriendshipSkillUpgrade.OnClickReturn =
    function(self)
        -- function num : 0_17
        if not self.isClosing then
            self.isClosing = true
        else
            return
        end
        self:Delete()
    end

UIFriendshipSkillUpgrade.OnDelete = function(self)
    -- function num : 0_18 , upvalues : _ENV, base
    if self.resloader ~= nil then
        (self.resloader):Put2Pool()
        self.resloader = nil
    end
    self:KillAllTweens();
    (self.skillPool):DeleteAll();
    (self.friendshipLevelUI):Delete();
    (self.friendshipPresentNode):Delete();
    (self.friendshipSkillInfoNode):Delete();
    (self.resourceGroup):Delete()
    MsgCenter:RemoveListener(eMsgEventId.OnHeroFriendshipDataChange,
                             self.__OnFriendShipDataChangeI);
    (base.OnDelete)(self)
end

return UIFriendshipSkillUpgrade

