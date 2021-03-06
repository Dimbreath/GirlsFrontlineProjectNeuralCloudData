-- params : ...
-- function num : 0 , upvalues : _ENV
local PersistentDataBase = require("Game.PersistentManager.PersistentData.PersistentDataBase")
local SystemSaveData = class("SystemSaveData", PersistentDataBase)
SystemSaveData.GetSaveDataFilePath = function(self)
  -- function num : 0_0 , upvalues : _ENV
  return PathConsts:GetPersistentSystemDataPath("system_data")
end

SystemSaveData.InitBySaveData = function(self, data)
  -- function num : 0_1
  if not data.audio then
    self.audio = {}
    if not data.display then
      self.display = {}
      if not data.oasisSky then
        self.oasisSky = {}
        self:__InitDefaultDisPlayData()
      end
    end
  end
end

SystemSaveData.InitByDefaultData = function(self)
  -- function num : 0_2 , upvalues : _ENV
  self.audio = {}
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.audio).volumes = {}
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.audio).mutes = {}
  for index = 1, AudioManager.AudioTypeCount do
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R5 in 'UnsetPending'

    ((self.audio).volumes)[index] = 1
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self.audio).mutes)[index] = false
  end
  self.display = {}
  self:__InitDefaultDisPlayData()
  self.oasisSky = {}
end

SystemSaveData.__InitDefaultDisPlayData = function(self)
  -- function num : 0_3 , upvalues : _ENV
  local performanceCfg = (ConfigData.performance_setting)[GameSystemInfo.PerformanceLevelId]
  if performanceCfg == nil then
    error("performance setting cfg is null,id:" .. tostring(GameSystemInfo.PerformanceLevelId))
    return 
  end
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R2 in 'UnsetPending'

  if (self.display).display_map == nil then
    (self.display).display_map = {}
  end
  for id,typeinfoCfg in pairs(ConfigData.performance_typeinfo) do
    local keyName = typeinfoCfg.name
    -- DECOMPILER ERROR at PC37: Confused about usage of register: R8 in 'UnsetPending'

    if ((self.display).display_map)[id] == nil then
      ((self.display).display_map)[id] = performanceCfg[keyName]
    end
  end
end

SystemSaveData.GetAudioData = function(self)
  -- function num : 0_4
  return self.audio
end

SystemSaveData.SetAudioDataVolume = function(self, index, value)
  -- function num : 0_5
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R3 in 'UnsetPending'

  if ((self.audio).volumes)[index] ~= value then
    ((self.audio).volumes)[index] = value
    self:SetPstDataDirty()
  end
end

SystemSaveData.SetAudioDataMute = function(self, index, value)
  -- function num : 0_6
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R3 in 'UnsetPending'

  if ((self.audio).mutes)[index] ~= value then
    ((self.audio).mutes)[index] = value
    self:SetPstDataDirty()
  end
end

SystemSaveData.GetDisplayData = function(self)
  -- function num : 0_7
  return self.display
end

SystemSaveData.GetDisplaySettingValue = function(self, keyName)
  -- function num : 0_8 , upvalues : _ENV
  local id = ((ConfigData.performance_typeinfo).name_index)[keyName]
  if id == nil then
    return 0
  end
  return ((self.display).display_map)[id] or 0
end

SystemSaveData.SetDisplaySettingValue = function(self, keyName, value)
  -- function num : 0_9 , upvalues : _ENV
  local id = ((ConfigData.performance_typeinfo).name_index)[keyName]
  if id == nil then
    return 
  end
  if not value then
    value = 0
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R4 in 'UnsetPending'

  if ((self.display).display_map)[id] ~= value then
    ((self.display).display_map)[id] = value
    self:SetPstDataDirty()
  end
end

SystemSaveData.GetOasisSkyPreset = function(self)
  -- function num : 0_10
  return (self.oasisSky).presetId or 0
end

SystemSaveData.SetOasisSkyPreset = function(self, value)
  -- function num : 0_11
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R2 in 'UnsetPending'

  if (self.oasisSky).presetId ~= value then
    (self.oasisSky).presetId = value
    self:SetPstDataDirty()
  end
end

SystemSaveData.GetOasisSkyLocation = function(self)
  -- function num : 0_12
  return (self.oasisSky).latitude or 0, (self.oasisSky).longitude or 0
end

SystemSaveData.SetOasisSkyLocation = function(self, latitude, longitude)
  -- function num : 0_13
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R3 in 'UnsetPending'

  if (self.oasisSky).latitude ~= latitude or (self.oasisSky).longitude ~= longitude then
    (self.oasisSky).latitude = latitude
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (self.oasisSky).longitude = longitude
    self:SetPstDataDirty()
  end
end

return SystemSaveData

