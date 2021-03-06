-- params : ...
-- function num : 0 , upvalues : _ENV
local UIGetHero = class("UIGetHero", UIBaseWindow)
local base = UIBaseWindow
local UINHeroCardConvert = require("Game.CommonUI.Hero.New.UINHeroCardConvert")
local cs_ResLoader = CS.ResLoader
local cs_ParticleSystem = (CS.UnityEngine).ParticleSystem
local cs_MovieManager = (CS.MovieManager).Instance
local cs_DoTween = ((CS.DG).Tweening).DOTween
local eSkipMode = {None = 1, SkipOldHero = 2, NotNewStar3 = 3}
local m_moviePlayer = nil
local HeroIdTo4Hex = function(id)
  -- function num : 0_0 , upvalues : _ENV
  local out = (string.format)("%X", id)
  local len = (string.len)(out)
  if len < 4 then
    for i = 1, 4 - len do
      out = "0" .. out
    end
  else
    do
      if len > 4 then
        out = (string.sub)(out, len - 3)
      end
      return "#" .. out
    end
  end
end

UIGetHero.OnInit = function(self)
  -- function num : 0_1 , upvalues : cs_ResLoader, _ENV, UINHeroCardConvert, eSkipMode
  self.resloader = (cs_ResLoader.Create)()
  self.StarList = {}
  ;
  (table.insert)(self.StarList, (self.ui).img_star)
  self.TagList = {}
  ;
  (table.insert)(self.TagList, (self.ui).tagItem)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_Close, self, self.OnClickClose)
  ;
  (UIUtil.AddButtonListener)((self.ui).btn_Skip, self, self.OnClickSkip)
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.ui).mainEffect = ((self.ui).Eff_QualityList)[1]
  local codeActionBinding = ((self.ui).ui_timeline):FindComponent(eUnityComponentID.CodeActionBinding)
  codeActionBinding:RegisterAction("ZoomIn", BindCallback(self, self._OnCamZoomIn))
  codeActionBinding:RegisterAction("ZoomOut", BindCallback(self, self._OnCamZoomOut))
  ;
  ((self.ui).heroConvertItem):SetActive(false)
  self.cardConvertItemPool = (UIItemPool.New)(UINHeroCardConvert, (self.ui).heroConvertItem)
  self.skipMode = eSkipMode.None
end

UIGetHero.InitGetHeroList = function(self, heroIdList, useHeroData, withGetHeroSound, newHeroIndexDic, closeFunc, skipOldHero)
  -- function num : 0_2 , upvalues : eSkipMode, _ENV
  if #heroIdList < 1 then
    return 
  end
  ;
  (((self.ui).btn_Skip).gameObject):SetActive(not useHeroData)
  self.withGetHeroSound = withGetHeroSound
  self.haveNext = true
  self.heroIdList = heroIdList
  self.useHeroData = useHeroData
  self.newHeroIndexDic = newHeroIndexDic
  self.showIndex = 1
  if skipOldHero then
    self.skipMode = eSkipMode.SkipOldHero
  end
  self.allTweens = (self.transform):GetComponentsInChildren(typeof(((CS.DG).Tweening).DOTweenAnimation))
  self:SetCloseFunction(closeFunc)
  self:_TryShowNext()
end

UIGetHero._TryShowNext = function(self)
  -- function num : 0_3
  self:_StopCampAudio()
  self:_ReturnMovie()
  self:_StopAllAudio()
  self:_StopHeroVoice()
  if self.haveNext then
    self:ShowNext()
  else
    self:_OnComplete()
  end
end

UIGetHero.ShowNext = function(self)
  -- function num : 0_4 , upvalues : _ENV, eSkipMode
  ((self.ui).ui_timeline):Stop()
  self.isNew = self.newHeroIndexDic ~= nil and (self.newHeroIndexDic)[self.showIndex] or false
  local heroId = (self.heroIdList)[self.showIndex]
  local heroCfg = (ConfigData.hero_data)[heroId]
  if heroCfg == nil then
    error("hero cfg is null,id:" .. tostring(heroId))
    return 
  end
  local rankCfg = (ConfigData.hero_rank)[heroCfg.rank]
  if rankCfg == nil then
    error("Can\'t find rankCfg, id = " .. tostring(heroCfg.rank))
    return 
  end
  local heroStar = rankCfg.star
  -- DECOMPILER ERROR at PC56: Unhandled construct in 'MakeBoolean' P3

  ;
  (((self.ui).btn_Skip).gameObject):SetActive((not self.useHeroData and heroStar < 6))
  local skip = false
  if self.skipMode == eSkipMode.SkipOldHero then
    skip = not self.isNew
  elseif self.isNew and heroStar >= 6 then
    skip = self.skipMode ~= eSkipMode.NotNewStar3
    if not skip then
      self:_InitGetHero(heroId, self.isNew)
      self.isSkipAllTween = false
    end
    self.showIndex = self.showIndex + 1
    if #self.heroIdList < self.showIndex then
      self.haveNext = false
    end
    if skip then
      self:_TryShowNext()
    end
    -- DECOMPILER ERROR: 9 unprocessed JMP targets
  end
end

UIGetHero._InitGetHero = function(self, heroId, isNew)
  -- function num : 0_5 , upvalues : _ENV, m_moviePlayer, cs_MovieManager, HeroIdTo4Hex, cs_ResLoader
  self.curHeroId = heroId
  local heroData, heroCfg = nil, nil
  if self.useHeroData then
    heroData = PlayerDataCenter:GetHeroData(heroId)
    heroCfg = heroData.heroCfg
  else
    heroCfg = (ConfigData.hero_data)[heroId]
  end
  ;
  (self.cardConvertItemPool):HideAll()
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R5 in 'UnsetPending'

  if isNew then
    ((self.ui).img_movie_bg).color = (Color.New)(0, 0, 0, 1)
    self.__tempPlayAllTween = self.PlayAllTween
    self.movieCB = BindCallback(self, function(table)
    -- function num : 0_5_0
    if table.__tempPlayAllTween ~= nil then
      (table.__tempPlayAllTween)(table)
      table.__tempPlayAllTween = nil
    end
  end
)
    local camCfg = (ConfigData.camp)[heroCfg.camp]
    if camCfg == nil then
      error("camp cfg is null,id:" .. tostring(heroCfg.camp))
      return 
    end
    if (string.IsNullOrEmpty)(camCfg.camp_video_path) then
      error("camp gethero_path is null,id:" .. tostring(heroCfg.camp))
    end
    local videoname = PathConsts:GetHeroVideoPath(camCfg.camp_video_path)
    m_moviePlayer = cs_MovieManager:GetMoviePlayer(false, true)
    m_moviePlayer:SetVideoRender((self.ui).img_movie)
    m_moviePlayer:PlayVideo(videoname)
    m_moviePlayer:SetVideoFadeInoutPercent(0.4, self.movieCB)
    self.auBack_camp = AudioManager:PlayAudioById(camCfg.camp_audio, function()
    -- function num : 0_5_1 , upvalues : self
    self.auBack_camp = nil
  end
)
  else
    do
      self:PlayAllTween()
      if not self.useHeroData then
        local rankCfg = (ConfigData.hero_rank)[heroCfg.rank]
        if rankCfg == nil then
          error("Can\'t find rankCfg, id = " .. tostring(heroCfg.rank))
        else
          for k,itemId in ipairs(rankCfg.repeat_extra_trans_id) do
            local itemNum = (rankCfg.repeat_extra_trans_num)[k]
            local convertItem = (self.cardConvertItemPool):GetOne()
            convertItem:InitHeroCardConvert(itemId, itemNum)
          end
        end
      end
      do
        ;
        ((self.ui).isNew):SetActive(isNew)
        -- DECOMPILER ERROR at PC139: Confused about usage of register: R5 in 'UnsetPending'

        ;
        ((self.ui).tex_HeroID_Big).text = HeroIdTo4Hex(heroId)
        -- DECOMPILER ERROR at PC145: Confused about usage of register: R5 in 'UnsetPending'

        ;
        ((self.ui).tex_HeroID_Small).text = HeroIdTo4Hex(heroId)
        local campCfg = (ConfigData.camp)[heroCfg.camp]
        local campIcon = (LanguageUtil.GetLocaleText)(campCfg.icon)
        ;
        (self.resloader):LoadABAssetAsync(PathConsts:GetCampPicPath(campIcon), function(texture)
    -- function num : 0_5_2 , upvalues : _ENV, self
    if IsNull(self.transform) then
      return 
    end
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

    ;
    ((self.ui).img_Camp).texture = texture
  end
)
        if self.bigImgResloader ~= nil then
          (self.bigImgResloader):Put2Pool()
          self.bigImgResloader = nil
        end
        local resCfg = (ConfigData.resource_model)[heroCfg.src_id]
        if resCfg == nil then
          error("resource model Cfg is null,id:" .. tostring(heroCfg.src_id))
        end
        self.bigImgResloader = (cs_ResLoader.Create)()
        ;
        (self.bigImgResloader):LoadABAssetAsync(PathConsts:GetCharacterBigImgPrefabPath(resCfg.res_Name), function(prefab)
    -- function num : 0_5_3 , upvalues : _ENV, self
    DestroyUnityObject(self.bigImgGameObject)
    self.bigImgGameObject = prefab:Instantiate((self.ui).heroHolder)
    local commonPicCtrl = (self.bigImgGameObject):FindComponent(eUnityComponentID.CommonPicController)
    commonPicCtrl:SetPosType("HeroList")
  end
)
        ;
        ((self.ui).img_Carrer):SetIndex(heroCfg.career - 1)
        -- DECOMPILER ERROR at PC205: Confused about usage of register: R8 in 'UnsetPending'

        ;
        ((self.ui).tex_Name).text = (LanguageUtil.GetLocaleText)(heroCfg.name)
        local enName = (LanguageUtil.GetLocaleText)(heroCfg.name_en)
        -- DECOMPILER ERROR at PC212: Confused about usage of register: R9 in 'UnsetPending'

        ;
        ((self.ui).tex_NameEN_Big).text = enName
        -- DECOMPILER ERROR at PC215: Confused about usage of register: R9 in 'UnsetPending'

        ;
        ((self.ui).tex_NameEN_small).text = enName
        self:ShowTags(heroCfg.tag)
        local heroStar, heroRare = nil, nil
        if self.useHeroData then
          heroStar = heroData.star
          heroRare = heroData.rare
        else
          local rankCfg = (ConfigData.hero_rank)[heroCfg.rank]
          if rankCfg == nil then
            error("Can\'t find rankCfg, id = " .. tostring(heroCfg.rank))
            return 
          end
          heroStar = rankCfg.star
          heroRare = rankCfg.rare
        end
        do
          self:ShowStars(heroStar)
          local qualityColor = HeroRareColor[heroRare]
          -- DECOMPILER ERROR at PC249: Confused about usage of register: R12 in 'UnsetPending'

          ;
          ((self.ui).img_Quality).color = qualityColor
          self:SetPlayEffectColor(qualityColor)
          self:ShowTimeAndTimeZone()
          -- DECOMPILER ERROR at PC259: Confused about usage of register: R12 in 'UnsetPending'

          ;
          ((self.ui).tex_Signet).text = PlayerDataCenter.playerName
        end
      end
    end
  end
end

UIGetHero.SetPlayEffectColor = function(self, qualityColor)
  -- function num : 0_6 , upvalues : _ENV, cs_ParticleSystem
  if (self.ui).mainEffect == nil then
    return 
  end
  if ((self.ui).mainEffect).isPlaying then
    ((self.ui).mainEffect):Stop()
    ;
    (((self.ui).mainEffect).gameObject):SetActive(false)
  end
  ;
  ((self.ui).mainEffect):Play()
  ;
  (((self.ui).mainEffect).gameObject):SetActive(true)
  for _,effect in ipairs((self.ui).Eff_QualityList) do
    local minMaxGradient = cs_ParticleSystem:MinMaxGradient()
    minMaxGradient.color = qualityColor
    -- DECOMPILER ERROR at PC40: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (effect.main).startColor = minMaxGradient
  end
end

UIGetHero.ShowTimeAndTimeZone = function(self)
  -- function num : 0_7 , upvalues : _ENV
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  ((self.ui).tex_Time).text = (os.date)("%m/%d %H:%M", (os.time)())
end

UIGetHero.PlayAllTween = function(self)
  -- function num : 0_8 , upvalues : _ENV
  if IsNull(self.gameObject) then
    return 
  end
  local cvCtr = ControllerManager:GetController(ControllerTypeId.Cv, true)
  if cvCtr:HasCv(self.curHeroId) then
    ((self.ui).dialogue):SetActive(true)
    local voiceId = nil
    if self.useHeroData then
      voiceId = eVoiceType.RANKUP
    else
      voiceId = eVoiceType.GAIN
    end
    local cvText = cvCtr:GetCvText(self.curHeroId, voiceId)
    if self.dialogueTween ~= nil then
      (self.dialogueTween):Kill()
    end
    -- DECOMPILER ERROR at PC43: Confused about usage of register: R4 in 'UnsetPending'

    ;
    ((self.ui).tex_Dialogue).text = ""
    self.dialogueTween = ((self.ui).tex_Dialogue):DOText(cvText, 1.5)
    self.auBack_Voice = cvCtr:PlayCv(self.curHeroId, voiceId, function()
    -- function num : 0_8_0 , upvalues : self
    self.auBack_Voice = nil
  end
)
  else
    do
      ;
      ((self.ui).dialogue):SetActive(false)
      -- DECOMPILER ERROR at PC65: Confused about usage of register: R2 in 'UnsetPending'

      ;
      ((self.ui).ui_timeline).time = 0
      ;
      ((self.ui).ui_timeline):Play()
      self:_ReturnMovie()
      for i = 0, (self.allTweens).Length - 1 do
        local tween = (self.allTweens)[i]
        tween:DOPause()
        tween:DORewind()
        tween:DOPlay()
      end
    end
  end
end

UIGetHero.CheckIsTweening = function(self)
  -- function num : 0_9 , upvalues : _ENV
  if not IsNull(self.allTweens) then
    for i = 0, (self.allTweens).Length - 1 do
      local tween = ((self.allTweens)[i]).tween
      local loopNum = tween:Loops()
      if loopNum ~= -1 then
        local isPlaying = tween:IsPlaying()
        if isPlaying then
          return true
        end
      end
    end
  end
  do
    return false
  end
end

UIGetHero.GotoTweenAnimation = function(self, rate, keepPlay)
  -- function num : 0_10 , upvalues : _ENV
  self:_StopAllAudio()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R3 in 'UnsetPending'

  ;
  ((self.ui).ui_timeline).time = 3.5
  if not IsNull(self.allTweens) then
    for i = 0, (self.allTweens).Length - 1 do
      local tween = ((self.allTweens)[i]).tween
      local loopNum = tween:Loops()
      if loopNum ~= -1 then
        local duration = tween:Duration()
        tween:SetDelay(0)
        tween:Goto(duration * rate, keepPlay)
      end
    end
  end
end

UIGetHero.ShowStars = function(self, num)
  -- function num : 0_11 , upvalues : _ENV
  for _,starGo in ipairs(self.StarList) do
    (starGo.gameObject):SetActive(false)
  end
  local count = (math.ceil)(num / 2)
  local isHalf = num % 2 == 1
  for i = 1, count do
    if (self.StarList)[i] ~= nil then
      (((self.StarList)[i]).gameObject):SetActive(true)
      ;
      ((self.StarList)[i]):SetIndex(0)
    else
      local imgItemInfo = (((self.ui).img_star):Instantiate()):GetComponent(typeof(CS.UiImageItemInfo))
      ;
      (table.insert)(self.StarList, imgItemInfo)
      ;
      (imgItemInfo.gameObject):SetActive(true)
    end
  end
  if isHalf then
    ((self.StarList)[#self.StarList]):SetIndex(1)
  end
  self.starCount = count
  -- DECOMPILER ERROR: 4 unprocessed JMP targets
end

UIGetHero.ShowTags = function(self, tagList)
  -- function num : 0_12 , upvalues : _ENV
  for _,starGo in ipairs(self.TagList) do
    starGo:SetActive(false)
  end
  for index,tagId in ipairs(tagList) do
    if (self.TagList)[index] ~= nil then
      ((self.TagList)[index]):SetActive(true)
      local textItemInfo = ((self.TagList)[index]):GetComponentInChildren(typeof(CS.UiTextItemInfo))
      textItemInfo:SetIndex(tagId)
      local imgItem = ((self.TagList)[index]):GetComponentsInChildren(typeof(((CS.UnityEngine).UI).Image))
      local spriteName = eHeroShowTag[tagId]
      -- DECOMPILER ERROR at PC50: Confused about usage of register: R10 in 'UnsetPending'

      ;
      (imgItem[1]).sprite = CRH:GetSprite(spriteName)
    else
      do
        local item = ((self.ui).tagItem):Instantiate()
        local textItemInfo = item:GetComponentInChildren(typeof(CS.UiTextItemInfo))
        local imgItem = item:GetComponentsInChildren(typeof(((CS.UnityEngine).UI).Image))
        ;
        (table.insert)(self.TagList, item)
        textItemInfo:SetIndex(tagId)
        do
          local spriteName = eHeroShowTag[tagId]
          -- DECOMPILER ERROR at PC85: Confused about usage of register: R11 in 'UnsetPending'

          ;
          (imgItem[1]).sprite = CRH:GetSprite(spriteName)
          -- DECOMPILER ERROR at PC86: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC86: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC86: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

UIGetHero._OnCamZoomIn = function(self)
  -- function num : 0_13 , upvalues : _ENV
  self.auBack_Zoomin = AudioManager:PlayAudioById(1043, function()
    -- function num : 0_13_0 , upvalues : self
    self.auBack_Zoomin = nil
  end
)
end

UIGetHero._OnCamZoomOut = function(self)
  -- function num : 0_14 , upvalues : _ENV
  if self.withGetHeroSound then
    local audioId = nil
    if self.starCount == 1 then
      audioId = 1020
    else
      if self.starCount == 2 then
        audioId = 1021
      else
        if self.starCount == 3 then
          audioId = 1022
        end
      end
    end
    self.auBack_ShowHero = AudioManager:PlayAudioById(audioId, function()
    -- function num : 0_14_0 , upvalues : self
    self.auBack_ShowHero = nil
  end
)
  end
end

UIGetHero._StopAllAudio = function(self)
  -- function num : 0_15 , upvalues : _ENV
  if self.auBack_Zoomin ~= nil then
    AudioManager:StopAudioByBack(self.auBack_Zoomin)
    self.auBack_Zoomin = nil
  end
  if self.auBack_ShowHero ~= nil then
    AudioManager:StopAudioByBack(self.auBack_ShowHero)
    self.auBack_ShowHero = nil
  end
end

UIGetHero._StopHeroVoice = function(self)
  -- function num : 0_16 , upvalues : _ENV
  if self.auBack_Voice ~= nil then
    AudioManager:StopAudioByBack(self.auBack_Voice)
    self.auBack_Voice = nil
  end
end

UIGetHero._StopCampAudio = function(self)
  -- function num : 0_17 , upvalues : _ENV
  if self.auBack_camp ~= nil then
    AudioManager:StopAudioByBack(self.auBack_camp)
    self.auBack_camp = nil
  end
end

UIGetHero.OnClickClose = function(self)
  -- function num : 0_18 , upvalues : m_moviePlayer
  if m_moviePlayer ~= nil then
    self:_ReturnMovie()
    self:_StopCampAudio()
    return 
  end
  if not self.isNew and self:CheckIsTweening() then
    if not self.isSkipAllTween then
      self:GotoTweenAnimation(0.4, true)
      self.isSkipAllTween = true
      return 
    else
      self.isSkipAllTween = false
    end
  end
  if not self:CheckIsTweening() then
    self.isNew = false
  end
  do return  end
  self:_TryShowNext()
end

UIGetHero.OnClickSkip = function(self)
  -- function num : 0_19 , upvalues : eSkipMode
  if self.skipMode == eSkipMode.SkipOldHero then
    self.skipMode = eSkipMode.NotNewStar3
    self:_TryShowNext()
  else
    if self.skipMode == eSkipMode.None then
      self.skipMode = eSkipMode.SkipOldHero
      self:_TryShowNext()
    end
  end
end

UIGetHero._OnComplete = function(self)
  -- function num : 0_20
  if self.closeFunc ~= nil then
    local func = self.closeFunc
    self.closeFunc = nil
    func()
  else
    do
      self:Delete()
    end
  end
end

UIGetHero._ReturnMovie = function(self)
  -- function num : 0_21 , upvalues : m_moviePlayer, cs_MovieManager
  if m_moviePlayer ~= nil then
    cs_MovieManager:ReturnMoviePlayer(m_moviePlayer)
    m_moviePlayer = nil
  end
end

UIGetHero.SetCloseFunction = function(self, closeFunc)
  -- function num : 0_22
  self.closeFunc = closeFunc
end

UIGetHero.OnDelete = function(self)
  -- function num : 0_23 , upvalues : base
  self:_StopAllAudio()
  self:_StopCampAudio()
  if self.bigImgResloader ~= nil then
    (self.bigImgResloader):Put2Pool()
    self.bigImgResloader = nil
  end
  if self.resloader ~= nil then
    (self.resloader):Put2Pool()
    self.resloader = nil
  end
  self:_ReturnMovie()
  if self.dialogueTween ~= nil then
    (self.dialogueTween):Kill()
    self.dialogueTween = nil
  end
  ;
  (base.OnDelete)(self)
end

return UIGetHero

