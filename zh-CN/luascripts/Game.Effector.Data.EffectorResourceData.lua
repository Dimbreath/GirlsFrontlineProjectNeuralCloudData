-- params : ...
-- function num : 0 , upvalues : _ENV
local EffectorResourceData = class("EffectorResourceData")
local EffectorUtil = require("Game.Effector.EffectorUtil")
local __outputCeiling = (ConfigData.game_config).oasisBuildingOutputCeiling
EffectorResourceData.InitEffectorRes = function(self, data)
  -- function num : 0_0 , upvalues : _ENV
  self:__UpdateBase(data)
  self.fitPeriodCount = false
  local itemCfg = (ConfigData.item)[self.itemId]
  if itemCfg == nil then
    error("Can\'t find itemCfg, id = " .. tostring(self.itemId))
  end
  self.itemCfg = itemCfg
end

EffectorResourceData.__UpdateBase = function(self, data)
  -- function num : 0_1 , upvalues : EffectorUtil
  self.uid = data.uid
  self.functionId = (EffectorUtil.ConvertEffectorUid)(self.uid)
  self.itemId = data.itemId
  self.originalStartTm = data.originalStartTm
  self.relativeStartTm = data.relativeStartTm
  self.containNum = data.containNum
  self.extraNum = data.extraNum
  self.keepNum = data.keepNum
end

EffectorResourceData.UpdateEffectorRes = function(self, data)
  -- function num : 0_2
  self:__UpdateBase(data)
  self.nextUpdateTime = self.originalStartTm
end

EffectorResourceData.GetName = function(self)
  -- function num : 0_3 , upvalues : _ENV
  return (LanguageUtil.GetLocaleText)((self.itemCfg).name)
end

EffectorResourceData.GetResCount = function(self, speed, period)
  -- function num : 0_4 , upvalues : __outputCeiling, _ENV
  local resCount = self.containNum
  local extraNum = self.extraNum
  local limitTime = self.originalStartTm + __outputCeiling
  local currentTime = (math.floor)(PlayerDataCenter.timestamp)
  local resMax = limitTime <= currentTime
  if not resMax then
    limitTime = currentTime
  end
  local outputEfficiency = (PlayerDataCenter.AllBuildingData):GetResOutputEfficiency(self.itemId)
  do
    if self.relativeStartTm < limitTime then
      local effectiveTime = limitTime - self.relativeStartTm
      resCount = resCount + effectiveTime * speed
      extraNum = extraNum + effectiveTime * speed * outputEfficiency // 1000
    end
    local onePeriodCount = speed * period
    local notFullPeriodCount = (resCount) % onePeriodCount
    if outputEfficiency ~= 0 or not 0 then
      local notFullPeriodExtraCount = (extraNum) % (onePeriodCount * outputEfficiency // 1000)
    end
    self.fitPeriodCount = self.keepNum ~= 0 or (resCount) // onePeriodCount ~= 0
    extraNum = extraNum - notFullPeriodExtraCount
    resCount = resCount - notFullPeriodCount
    local progress = notFullPeriodCount / onePeriodCount
    resCount = (resCount + (extraNum) + self.keepNum) // 100
    local effSpeed = speed * (PlayerDataCenter.AllBuildingData):GetResOutputEfficiency(self.itemId) / 1000
    do return resCount, progress, resMax, effSpeed end
    -- DECOMPILER ERROR: 6 unprocessed JMP targets
  end
end

return EffectorResourceData

-- params : ...
-- function num : 0 , upvalues : _ENV
local EffectorResourceData = class("EffectorResourceData")
local EffectorUtil = require("Game.Effector.EffectorUtil")
local __outputCeiling = (ConfigData.game_config).oasisBuildingOutputCeiling
EffectorResourceData.InitEffectorRes = function(self, data)
    -- function num : 0_0 , upvalues : _ENV
    self:__UpdateBase(data)
    self.fitPeriodCount = false
    local itemCfg = (ConfigData.item)[self.itemId]
    if itemCfg == nil then
        error("Can\'t find itemCfg, id = " .. tostring(self.itemId))
    end
    self.itemCfg = itemCfg
end

EffectorResourceData.__UpdateBase = function(self, data)
    -- function num : 0_1 , upvalues : EffectorUtil
    self.uid = data.uid
    self.functionId = (EffectorUtil.ConvertEffectorUid)(self.uid)
    self.itemId = data.itemId
    self.originalStartTm = data.originalStartTm
    self.relativeStartTm = data.relativeStartTm
    self.containNum = data.containNum
    self.extraNum = data.extraNum
    self.keepNum = data.keepNum
end

EffectorResourceData.UpdateEffectorRes =
    function(self, data)
        -- function num : 0_2
        self:__UpdateBase(data)
        self.nextUpdateTime = self.originalStartTm
    end

EffectorResourceData.GetName = function(self)
    -- function num : 0_3 , upvalues : _ENV
    return (LanguageUtil.GetLocaleText)((self.itemCfg).name)
end

EffectorResourceData.GetResCount = function(self, speed, period)
    -- function num : 0_4 , upvalues : __outputCeiling, _ENV
    local resCount = self.containNum
    local extraNum = self.extraNum
    local limitTime = self.originalStartTm + __outputCeiling
    local currentTime = (math.floor)(PlayerDataCenter.timestamp)
    local resMax = limitTime <= currentTime
    if not resMax then limitTime = currentTime end
    local outputEfficiency =
        (PlayerDataCenter.AllBuildingData):GetResOutputEfficiency(self.itemId)
    do
        if self.relativeStartTm < limitTime then
            local effectiveTime = limitTime - self.relativeStartTm
            resCount = resCount + effectiveTime * speed
            extraNum = extraNum + effectiveTime * speed * outputEfficiency //
                           1000
        end
        local onePeriodCount = speed * period
        local notFullPeriodCount = (resCount) % onePeriodCount
        if outputEfficiency ~= 0 or not 0 then
            local notFullPeriodExtraCount =
                (extraNum) % (onePeriodCount * outputEfficiency // 1000)
        end
        self.fitPeriodCount =
            self.keepNum ~= 0 or (resCount) // onePeriodCount ~= 0
        extraNum = extraNum - notFullPeriodExtraCount
        resCount = resCount - notFullPeriodCount
        local progress = notFullPeriodCount / onePeriodCount
        resCount = (resCount + (extraNum) + self.keepNum) // 100
        local effSpeed = speed *
                             (PlayerDataCenter.AllBuildingData):GetResOutputEfficiency(
                                 self.itemId) / 1000
        do return resCount, progress, resMax, effSpeed end
        -- DECOMPILER ERROR: 6 unprocessed JMP targets
    end
end

return EffectorResourceData

