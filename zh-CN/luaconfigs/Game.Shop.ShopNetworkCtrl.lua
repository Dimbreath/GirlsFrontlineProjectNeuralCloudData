-- params : ...
-- function num : 0 , upvalues : _ENV
local ShopNetworkCtrl = class("ShopNetworkCtrl", NetworkCtrlBase)
local cs_MessageCommon = CS.MessageCommon
local cs_WaitNetworkResponse = (CS.WaitNetworkResponse).Instance
ShopNetworkCtrl.ctor = function(self)
  -- function num : 0_0
  self.lastBuyShop = {}
  self.rechargeTab = {}
  self.refreshTable = {}
end

ShopNetworkCtrl.InitNetwork = function(self)
  -- function num : 0_1 , upvalues : _ENV
  self:RegisterNetwork(proto_csmsg_MSG_ID.MSG_SC_STORE_Detail, self, proto_csmsg.SC_STORE_Detail, self.SC_STORE_Detail)
  self:RegisterNetwork(proto_csmsg_MSG_ID.MSG_SC_STORE_Purchase, self, proto_csmsg.SC_STORE_Purchase, self.SC_STORE_Purchase)
  self:RegisterNetwork(proto_csmsg_MSG_ID.MSG_SC_STORE_Fresh, self, proto_csmsg.SC_STORE_Fresh, self.SC_STORE_Fresh)
  self:RegisterNetwork(proto_csmsg_MSG_ID.MSG_SC_STORE_Recharge, self, proto_csmsg.SC_STORE_Recharge, self.SC_STORE_Recharge)
  self:RegisterNetwork(proto_csmsg_MSG_ID.MSG_SC_Store_Recharge_Ntf, self, proto_csmsg.SC_Store_Recharge_Ntf, self.SC_Store_Recharge_Ntf)
end

ShopNetworkCtrl.CS_STORE_Detail = function(self, storeId, callback)
  -- function num : 0_2 , upvalues : _ENV, cs_WaitNetworkResponse
  local msg = {}
  msg.storeId = storeId
  self.lastStoreId = storeId
  self:SendMsg(proto_csmsg_MSG_ID.MSG_CS_STORE_Detail, proto_csmsg.CS_STORE_Detail, msg)
  cs_WaitNetworkResponse:StartWait(proto_csmsg_MSG_ID.MSG_CS_STORE_Detail * 100 + storeId, callback, proto_csmsg_MSG_ID.MSG_SC_STORE_Detail)
end

ShopNetworkCtrl.SC_STORE_Detail = function(self, msg)
  -- function num : 0_3 , upvalues : _ENV, cs_MessageCommon, cs_WaitNetworkResponse
  if msg.ret ~= proto_csmsg_ErrorCode.None then
    local err = "SC_STORE_Detail error,code:" .. tostring(msg.ret)
    error(err)
    if isGameDev then
      (cs_MessageCommon.ShowMessageTips)(err)
    end
    cs_WaitNetworkResponse:RemoveWait(proto_csmsg_MSG_ID.MSG_CS_STORE_Detail)
  else
    do
      if msg.data == nil then
        local storeId = self.lastStoreId
        cs_WaitNetworkResponse:AddWaitData(proto_csmsg_MSG_ID.MSG_CS_STORE_Detail * 100 + storeId, msg.data)
      else
        do
          cs_WaitNetworkResponse:AddWaitData(proto_csmsg_MSG_ID.MSG_CS_STORE_Detail * 100 + (msg.data).storeId, msg.data)
          NetworkManager:HandleDiff(msg.syncUpdateDiff)
        end
      end
    end
  end
end

ShopNetworkCtrl.CS_STORE_Purchase = function(self, storeId, shelfId, cnt, callback)
  -- function num : 0_4 , upvalues : _ENV, cs_WaitNetworkResponse
  local msg = {}
  msg.storeId = storeId
  msg.shelfId = shelfId
  msg.cnt = cnt
  ;
  (table.insert)(self.lastBuyShop, storeId)
  self:SendMsg(proto_csmsg_MSG_ID.MSG_CS_STORE_Purchase, proto_csmsg.CS_STORE_Purchase, msg)
  cs_WaitNetworkResponse:StartWait(proto_csmsg_MSG_ID.MSG_CS_STORE_Purchase, callback, proto_csmsg_MSG_ID.MSG_SC_STORE_Purchase)
end

ShopNetworkCtrl.SC_STORE_Purchase = function(self, msg)
  -- function num : 0_5 , upvalues : _ENV, cs_WaitNetworkResponse, cs_MessageCommon
  NetworkManager:HandleDiff(msg.syncUpdateDiff)
  if msg.ret ~= proto_csmsg_ErrorCode.None then
    do
      if msg.ret == proto_csmsg_ErrorCode.BACKPACK_ITEM_OVERFLOW then
        local storeId = (table.remove)(self.lastBuyShop, 1)
        cs_WaitNetworkResponse:RemoveWait(proto_csmsg_MSG_ID.MSG_CS_STORE_Purchase)
        ;
        (cs_MessageCommon.ShowMessageTipsWithErrorSound)(ConfigData:GetTipContent(TipContent.ResourceOverflow))
        return 
      end
      do
        local err = "SC_STORE_Purchase error,code:" .. tostring(msg.ret)
        error(err)
        if isGameDev then
          (cs_MessageCommon.ShowMessageTips)(err)
        end
        cs_WaitNetworkResponse:RemoveWait(proto_csmsg_MSG_ID.MSG_CS_STORE_Purchase)
        local storeId = (table.remove)(self.lastBuyShop, 1)
        ;
        (ControllerManager:GetController(ControllerTypeId.Shop, false)):RefreshGoodsData(msg.data, storeId)
      end
    end
  end
end

ShopNetworkCtrl.CS_STORE_Fresh = function(self, storeId, callback)
  -- function num : 0_6 , upvalues : _ENV, cs_WaitNetworkResponse
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R3 in 'UnsetPending'

  (self.refreshTable).storeId = storeId
  self:SendMsg(proto_csmsg_MSG_ID.MSG_CS_STORE_Fresh, proto_csmsg.CS_STORE_Fresh, self.refreshTable)
  cs_WaitNetworkResponse:StartWait(proto_csmsg_MSG_ID.MSG_CS_STORE_Fresh, callback, proto_csmsg_MSG_ID.MSG_SC_STORE_Fresh)
end

ShopNetworkCtrl.SC_STORE_Fresh = function(self, msg)
  -- function num : 0_7 , upvalues : _ENV, cs_MessageCommon, cs_WaitNetworkResponse
  if msg.ret ~= proto_csmsg_ErrorCode.None then
    local err = "SC_STORE_Fresh error,code:" .. tostring(msg.ret)
    error(err)
    if isGameDev then
      (cs_MessageCommon.ShowMessageTips)(err)
    end
    cs_WaitNetworkResponse:RemoveWait(proto_csmsg_MSG_ID.MSG_CS_STORE_Fresh)
  else
    do
      ;
      (ControllerManager:GetController(ControllerTypeId.Shop, false)):RefreshShopData(msg.data, (self.refreshTable).storeId)
      NetworkManager:HandleDiff(msg.syncUpdateDiff)
    end
  end
end

ShopNetworkCtrl.CS_STORE_Recharge = function(self, payId, callback)
  -- function num : 0_8 , upvalues : _ENV, cs_WaitNetworkResponse
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R3 in 'UnsetPending'

  (self.rechargeTab).payId = payId
  self:SendMsg(proto_csmsg_MSG_ID.MSG_CS_STORE_Recharge, proto_csmsg.CS_STORE_Recharge, self.rechargeTab)
  cs_WaitNetworkResponse:StartWait(proto_csmsg_MSG_ID.MSG_CS_STORE_Recharge, callback, proto_csmsg_MSG_ID.MSG_SC_STORE_Recharge)
end

ShopNetworkCtrl.SC_STORE_Recharge = function(self, msg)
  -- function num : 0_9 , upvalues : _ENV, cs_MessageCommon, cs_WaitNetworkResponse
  NetworkManager:HandleDiff(msg.syncUpdateDiff)
  if msg.ret ~= proto_csmsg_ErrorCode.None then
    local err = "SC_STORE_Recharge error,code:" .. tostring(msg.ret)
    error(err)
    ;
    (cs_MessageCommon.ShowMessageTips)(err)
    cs_WaitNetworkResponse:RemoveWait(proto_csmsg_MSG_ID.MSG_CS_STORE_Recharge)
  end
end

ShopNetworkCtrl.SC_Store_Recharge_Ntf = function(self, msg)
  -- function num : 0_10 , upvalues : _ENV
  NetworkManager:HandleDiff(msg.syncUpdateDiff)
  if msg.data ~= nil then
    local shopCtrl = ControllerManager:GetController(ControllerTypeId.Shop)
    shopCtrl:AfterShopRechargeComplete(msg.data)
  end
end

ShopNetworkCtrl.Reset = function(self)
  -- function num : 0_11
  self.lastBuyShop = {}
end

return ShopNetworkCtrl

