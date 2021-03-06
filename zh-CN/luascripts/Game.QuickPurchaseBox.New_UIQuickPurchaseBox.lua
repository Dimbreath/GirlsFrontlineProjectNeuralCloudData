-- params : ...
-- function num : 0 , upvalues : _ENV
local New_UIQuickPurchaseBox = class("New_UIQuickPurchaseBox", UIBaseWindow)
local base = UIBaseWindow
local ShopEnum = require("Game.Shop.ShopEnum")
local UINBaseItemWithCount = require("Game.CommonUI.Item.UINBaseItemWithCount")
local UINResourceGroup = require("Game.CommonUI.ResourceGroup.UINResourceGroup")
local UINQuickPurchaseLogicPreview = require("Game.QuickPurchaseBox.UINQuickPurchaseLogicPreview")
local cs_MessageCommon = CS.MessageCommon
New_UIQuickPurchaseBox.OnInit = function(self)
  -- function num : 0_0 , upvalues : _ENV, UINResourceGroup, UINBaseItemWithCount, UINQuickPurchaseLogicPreview
  self.oldRoot = (self.transform).parent
  self.ctrl = ControllerManager:GetController(ControllerTypeId.Shop, false)
  self.buyNum = 0
  self.resourceGroup = (UINResourceGroup.New)()
  ;
  (self.resourceGroup):Init((self.ui).gameResourceGroup)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_Buy, self, self.OnClickBuy)
  ;
  (UIUtil.AddButtonListenerWithArg)((self.ui).btn_Back, self, self.SlideOut, nil, true)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_Reduce, self, self.OnClickMin)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_Add, self, self.OnClickAdd)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_ExtrInfo, self, self.OnClickExtraInfo)
  ;
  (((self.ui).btn_Add).onPress):AddListener(BindCallback(self, self.OnPressAdd))
  ;
  (((self.ui).btn_Reduce).onPress):AddListener(BindCallback(self, self.OnPressMin))
  ;
  (((self.ui).tween_side).onComplete):AddListener(BindCallback(self, self.OnSlideInComplete))
  ;
  (((self.ui).tween_side).onRewind):AddListener(BindCallback(self, self.OnClickClose))
  self.itemWithCount = (UINBaseItemWithCount.New)()
  ;
  (self.itemWithCount):Init((self.ui).itemWithCount)
  ;
  (self.itemWithCount):SetNotNeedAnyJump(true)
  self.buildPreviewNode = (UINQuickPurchaseLogicPreview.New)()
  ;
  (self.buildPreviewNode):Init((self.ui).obj_logicPreviewNode)
  ;
  (self.buildPreviewNode):Hide()
end

New_UIQuickPurchaseBox.SetRoot = function(self, transform)
  -- function num : 0_1
  (self.transform):SetParent(transform)
end

New_UIQuickPurchaseBox.SlideIn = function(self)
  -- function num : 0_2 , upvalues : _ENV
  ((self.ui).tween_side):DOPlayForward()
  ;
  (UIUtil.Push2BackStack)(self, self.SlideOut)
  self.slideInOver = false
end

New_UIQuickPurchaseBox.SlideOut = function(self, isHome, popBackStack)
  -- function num : 0_3 , upvalues : _ENV
  if not self.slideInOver then
    return 
  end
  ;
  ((self.ui).tween_side):DOPlayBackwards()
  if popBackStack then
    (UIUtil.PopFromBackStack)()
  end
end

New_UIQuickPurchaseBox.InitBuyTarget = function(self, goodData, BuySuccessCallback, isNeedRes, resIdList)
  -- function num : 0_4 , upvalues : ShopEnum
  self.goodData = goodData
  self.BuySuccessCallback = BuySuccessCallback
  self:m_RefreshGoodUI(goodData)
  self:m_RefreshTotalMoney()
  if isNeedRes then
    (self.resourceGroup):SetResourceIds(resIdList)
    ;
    (self.resourceGroup):Show()
  else
    ;
    (self.resourceGroup):Hide()
  end
  ;
  (self.transform):SetAsLastSibling()
  if (self.goodData).shopType == (ShopEnum.eShopType).Charcter then
    (((self.ui).btn_ExtrInfo).gameObject):SetActive(true)
  else
    ;
    (((self.ui).btn_ExtrInfo).gameObject):SetActive(false)
  end
end

New_UIQuickPurchaseBox.m_RefreshGoodUI = function(self, goodData)
  -- function num : 0_5 , upvalues : ShopEnum, _ENV
  if goodData.shopType ~= (ShopEnum.eShopType).Random and goodData.isLimit and goodData.limitType ~= (ShopEnum.eLimitType).None then
    ((self.ui).tex_LimitType):SetIndex(goodData.limitType - 1)
    if goodData.totallimitTime ~= nil then
      ((self.ui).tex_LimitCount):SetIndex(0, tostring(goodData.purchases), tostring(goodData.totallimitTime))
    else
      ;
      ((self.ui).tex_LimitCount):SetIndex(0, tostring(goodData.purchases), tostring(goodData.limitTime))
    end
    ;
    ((self.ui).obj_limit):SetActive(true)
  else
    ;
    ((self.ui).obj_limit):SetActive(false)
  end
  ;
  (self.itemWithCount):InitItemWithCount(goodData.itemCfg, goodData.itemNum, nil)
  -- DECOMPILER ERROR at PC69: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self.ui).tex_Name).text = (LanguageUtil.GetLocaleText)((goodData.itemCfg).name)
  -- DECOMPILER ERROR at PC77: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self.ui).tex_Detail).text = (LanguageUtil.GetLocaleText)((goodData.itemCfg).describe)
  -- DECOMPILER ERROR at PC81: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self.ui).tex_currPrice).text = goodData.newCurrencyNum
  local currencyItemCfg = (ConfigData.item)[goodData.currencyId]
  local smallIcon = currencyItemCfg.small_icon
  -- DECOMPILER ERROR at PC93: Confused about usage of register: R4 in 'UnsetPending'

  ;
  ((self.ui).img_currencyIcon).sprite = CRH:GetSprite(smallIcon)
  -- DECOMPILER ERROR at PC100: Confused about usage of register: R4 in 'UnsetPending'

  ;
  ((self.ui).img_totalCurrencyIcon).sprite = CRH:GetSprite(smallIcon)
  if goodData.discount == 100 then
    ((self.ui).obj_discount):SetActive(false)
    ;
    (((self.ui).tex_oldPrice).gameObject):SetActive(false)
  else
    ;
    ((self.ui).tex_Discount):SetIndex(0, tostring(100 - goodData.discount))
    -- DECOMPILER ERROR at PC128: Confused about usage of register: R4 in 'UnsetPending'

    ;
    ((self.ui).tex_oldPrice).text = goodData.oldCurrencyNum
    ;
    ((self.ui).obj_discount):SetActive(true)
    ;
    (((self.ui).tex_oldPrice).gameObject):SetActive(true)
  end
end

New_UIQuickPurchaseBox.OnClickAdd = function(self, isIgnoreTip)
  -- function num : 0_6
  if self:m_CouldAdd(1, isIgnoreTip) then
    self.buyNum = self.buyNum + 1
    self:m_RefreshTotalMoney()
  end
end

New_UIQuickPurchaseBox.OnPressAdd = function(self, isIgnoreTip)
  -- function num : 0_7 , upvalues : _ENV
  local pressedTime = ((self.ui).btn_Add):GetPressedTime()
  local changeNum = (math.ceil)(pressedTime * pressedTime / 5)
  changeNum = (math.min)(changeNum, 100)
  if self:m_CouldAdd(changeNum, isIgnoreTip) then
    self.buyNum = self.buyNum + changeNum
    self:m_RefreshTotalMoney()
  else
    self:Add2Max()
  end
end

New_UIQuickPurchaseBox.OnClickMin = function(self)
  -- function num : 0_8
  if self.buyNum <= 0 then
    self:Add2Max(false)
    return 
  end
  self.buyNum = self.buyNum - 1
  self:m_RefreshTotalMoney()
end

New_UIQuickPurchaseBox.OnPressMin = function(self)
  -- function num : 0_9 , upvalues : _ENV
  local pressedTime = ((self.ui).btn_Reduce):GetPressedTime()
  local changeNum = (math.ceil)(pressedTime * pressedTime / 5)
  changeNum = (math.min)(changeNum, 100)
  if self.buyNum - changeNum <= 0 then
    self:Add2Max(true)
    return 
  end
  self.buyNum = self.buyNum - changeNum
  self:m_RefreshTotalMoney()
end

New_UIQuickPurchaseBox.m_CouldAdd = function(self, count, isIgnoreTip)
  -- function num : 0_10 , upvalues : cs_MessageCommon, _ENV
  if not count then
    count = 1
  end
  if (self.goodData).isSoldOut then
    if not isIgnoreTip then
      (cs_MessageCommon.ShowMessageTipsWithErrorSound)(ConfigData:GetTipContent(TipContent.Shop_SoldOut))
    end
    return false
  else
    if (self.goodData).fragMaxBuyNum ~= nil and (self.goodData).fragMaxBuyNum < self.buyNum + count then
      if not isIgnoreTip then
        (cs_MessageCommon.ShowMessageTipsWithErrorSound)(ConfigData:GetTipContent(TipContent.Shop_BuyNumLimit))
      end
      return false
    end
  end
  if (self.goodData).isLimit and (self.goodData).limitTime - (self.goodData).purchases < self.buyNum + count then
    if not isIgnoreTip then
      if (self.goodData).totallimitTime ~= nil and self.buyNum + count <= (self.goodData).totallimitTime - (self.goodData).purchases then
        (cs_MessageCommon.ShowMessageTipsWithErrorSound)(ConfigData:GetTipContent(TipContent.Shop_PriceChange))
      else
        ;
        (cs_MessageCommon.ShowMessageTipsWithErrorSound)(ConfigData:GetTipContent(TipContent.Shop_BuyNumLimit))
      end
    end
    return false
  end
  local wharehouseMaxNum = (self.goodData):GetCouldBuyMaxBuyNum()
  if wharehouseMaxNum >= 0 and wharehouseMaxNum < self.buyNum + count then
    if not isIgnoreTip then
      (cs_MessageCommon.ShowMessageTipsWithErrorSound)(ConfigData:GetTipContent(TipContent.ResourceOverflow))
    end
    return 
  end
  local totalMoney = PlayerDataCenter:GetItemCount((self.goodData).currencyId)
  local totalNeedMoney = (self.buyNum + count) * (self.goodData).newCurrencyNum
  if totalMoney < totalNeedMoney then
    if not isIgnoreTip then
      (cs_MessageCommon.ShowMessageTipsWithErrorSound)(ConfigData:GetTipContent(TipContent.Shop_MoneyInsufficient))
    end
    return false
  end
  return true
end

New_UIQuickPurchaseBox.Add2Max = function(self, maxLimit)
  -- function num : 0_11 , upvalues : _ENV
  local maxNum = 0
  local totalMoney = PlayerDataCenter:GetItemCount((self.goodData).currencyId)
  local totalNeedMoney = (self.buyNum + 1) * (self.goodData).newCurrencyNum
  maxNum = (math.max)((math.floor)(totalMoney / (self.goodData).newCurrencyNum), 0)
  if (self.goodData).isLimit then
    maxNum = (math.min)((self.goodData).limitTime - (self.goodData).purchases, maxNum)
  end
  if (self.goodData).fragMaxBuyNum ~= nil then
    maxNum = (math.min)((self.goodData).fragMaxBuyNum, maxNum)
  end
  local wharehouseMaxNum = (self.goodData):GetCouldBuyMaxBuyNum()
  if wharehouseMaxNum >= 0 then
    maxNum = (math.min)(maxNum, wharehouseMaxNum)
  end
  if maxLimit then
    self.buyNum = (math.min)(maxNum, 99)
  else
    self.buyNum = maxNum
  end
  self:m_RefreshTotalMoney()
end

New_UIQuickPurchaseBox.OnClickBuy = function(self)
  -- function num : 0_12 , upvalues : _ENV, cs_MessageCommon
  if self.buyNum <= 0 then
    return 
  end
  local containAth = false
  local itemCfg = (self.goodData).itemCfg
  if itemCfg ~= nil and itemCfg.type == eItemType.Arithmetic then
    containAth = true
  end
  if containAth and (ConfigData.game_config).athMaxNum <= #(PlayerDataCenter.allAthData):GetAllAthList() then
    (cs_MessageCommon.ShowMessageTipsWithErrorSound)(ConfigData:GetTipContent(TipContent.Ath_MaxCount))
    return 
  end
  self._heroIdSnapShoot = PlayerDataCenter:GetHeroIdSnapShoot()
  ;
  (self.ctrl):ReqBuyGoods((self.goodData).shopId, (self.goodData).shelfId, self.buyNum, function()
    -- function num : 0_12_0 , upvalues : _ENV, self
    UIManager:ShowWindowAsync(UIWindowTypeID.CommonReward, function(window)
      -- function num : 0_12_0_0 , upvalues : self
      if window == nil then
        return 
      end
      window:InitRewardsItem({(self.goodData).itemId}, {self.buyNum * (self.goodData).itemNum}, self._heroIdSnapShoot)
      self.buyNum = 0
      self:m_RefreshTotalMoney()
      self:m_RefreshGoodUI(self.goodData)
      if self.BuySuccessCallback ~= nil then
        (self.BuySuccessCallback)()
      end
    end
)
  end
)
end

New_UIQuickPurchaseBox.OnSlideInComplete = function(self)
  -- function num : 0_13
  self.slideInOver = true
end

New_UIQuickPurchaseBox.OnClickClose = function(self)
  -- function num : 0_14
  self:Hide()
  self.buyNum = 0
  self:m_RefreshTotalMoney()
  self:SetRoot(self.oldRoot)
end

New_UIQuickPurchaseBox.m_RefreshTotalMoney = function(self)
  -- function num : 0_15 , upvalues : _ENV
  if self.buyNum == 0 then
    (((self.ui).btn_Buy).gameObject):SetActive(false)
    ;
    ((self.ui).obj_cantBuy):SetActive(true)
  else
    ;
    (((self.ui).btn_Buy).gameObject):SetActive(true)
    ;
    ((self.ui).obj_cantBuy):SetActive(false)
  end
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self.ui).tex_buyCount).text = tostring(self.buyNum)
  local totalMoney = self.buyNum * (self.goodData).newCurrencyNum
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self.ui).tex_totalcurrPrice).text = tostring(totalMoney)
end

New_UIQuickPurchaseBox.OnClickExtraInfo = function(self)
  -- function num : 0_16
  local intervalList, priceList, curIndex = (self.goodData):GetPriceInterval()
  ;
  (self.buildPreviewNode):InitBuyFragPreview(intervalList, priceList, curIndex)
  ;
  (self.buildPreviewNode):Show()
end

New_UIQuickPurchaseBox.OnDelete = function(self)
  -- function num : 0_17 , upvalues : base
  ((self.ui).tween_side):DOKill()
  ;
  (self.resourceGroup):Delete()
  ;
  (base.OnDelete)(self)
end

return New_UIQuickPurchaseBox

