-- params : ...
-- function num : 0 , upvalues : _ENV
local UINLtrResultHero = class("UINLtrResultHero", UIBaseNode)
local base = UIBaseNode
UINLtrResultHero.OnInit = function(self)
  -- function num : 0_0 , upvalues : _ENV
  (UIUtil.LuaUIBindingTable)(self.transform, self.ui)
  self.starItemList = {}
  ;
  (((self.ui).img_star).gameObject):SetActive(false)
  self.starRareColor = {[eHeroCardRareType.SSR] = (Color.New)(1, 0.974, 0.58, 1), [eHeroCardRareType.SR] = (Color.New)(0.997, 0.853, 1, 1), [eHeroCardRareType.R] = (Color.New)(0.643, 0.952, 1, 1)}
end

UINLtrResultHero.InitLtrResultHero = function(self, heroData, isNew, resLoader)
  -- function num : 0_1 , upvalues : _ENV
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R4 in 'UnsetPending'

  ((self.ui).canvasGroup).alpha = 1
  resLoader:LoadABAssetAsync(PathConsts:GetCampPicPath((heroData:GetCampCfg()).icon), function(texture)
    -- function num : 0_1_0 , upvalues : _ENV, self
    if IsNull(texture) then
      return 
    end
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

    ;
    ((self.ui).img_Camp).texture = texture
  end
)
  resLoader:LoadABAssetAsync(PathConsts:GetCharacterPicPath(heroData:GetResName()), function(texture)
    -- function num : 0_1_1 , upvalues : _ENV, self
    if IsNull(texture) then
      return 
    end
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

    ;
    ((self.ui).img_Hero).texture = texture
  end
)
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R4 in 'UnsetPending'

  ;
  ((self.ui).img_Carrer).sprite = CRH:GetSprite((heroData:GetCareerCfg()).icon, CommonAtlasType.CareerCamp)
  ;
  ((self.ui).obj_IsNew):SetActive(isNew)
  local rankCfg = (ConfigData.hero_rank)[(heroData.heroCfg).rank]
  if rankCfg == nil then
    error("Can\'t find rankCfg, id = " .. tostring((heroData.heroCfg).rank))
  end
  self:__HideAllStar()
  self:__UpdateStar(rankCfg.star, (self.starRareColor)[heroData.rare])
  for k,go in ipairs((self.ui).rareBg) do
    go:SetActive(rankCfg.rare == k)
  end
  for k,go in ipairs((self.ui).rareStarBg) do
    go:SetActive(rankCfg.rare == k + 1)
  end
  -- DECOMPILER ERROR: 4 unprocessed JMP targets
end

UINLtrResultHero.__UpdateStar = function(self, starCount, rareColor)
  -- function num : 0_2
  local twoStarCount = starCount // 2
  local oneStarCount = starCount % 2
  for i = 1, twoStarCount do
    local starItem = self:__GetStar(i)
    starItem:SetIndex(0)
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (starItem.image).color = rareColor
  end
  if oneStarCount ~= 0 then
    local starItem = self:__GetStar(twoStarCount + 1)
    starItem:SetIndex(1)
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (starItem.image).color = rareColor
  end
end

UINLtrResultHero.__GetStar = function(self, index)
  -- function num : 0_3
  local starItem = (self.starItemList)[index]
  if starItem == nil then
    starItem = ((self.ui).img_star):Instantiate()
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (self.starItemList)[index] = starItem
  end
  ;
  (starItem.gameObject):SetActive(true)
  return starItem
end

UINLtrResultHero.__HideAllStar = function(self)
  -- function num : 0_4 , upvalues : _ENV
  for k,v in pairs(self.starItemList) do
    (v.gameObject):SetActive(false)
  end
end

UINLtrResultHero.SetLtrHeroConvertAlpha = function(self)
  -- function num : 0_5
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  ((self.ui).canvasGroup).alpha = 0.2
end

UINLtrResultHero.SetStarQualityActive = function(self, active)
  -- function num : 0_6
  ((self.ui).obj_quality):SetActive(active)
end

UINLtrResultHero.OnDelete = function(self)
  -- function num : 0_7 , upvalues : base
  (base.OnDelete)(self)
end

return UINLtrResultHero

-- params : ...
-- function num : 0 , upvalues : _ENV
local UINLtrResultHero = class("UINLtrResultHero", UIBaseNode)
local base = UIBaseNode
UINLtrResultHero.OnInit = function(self)
    -- function num : 0_0 , upvalues : _ENV
    (UIUtil.LuaUIBindingTable)(self.transform, self.ui)
    self.starItemList = {};
    (((self.ui).img_star).gameObject):SetActive(false)
    self.starRareColor = {
        [eHeroCardRareType.SSR] = (Color.New)(1, 0.974, 0.58, 1),
        [eHeroCardRareType.SR] = (Color.New)(0.997, 0.853, 1, 1),
        [eHeroCardRareType.R] = (Color.New)(0.643, 0.952, 1, 1)
    }
end

UINLtrResultHero.InitLtrResultHero = function(self, heroData, isNew, resLoader)
    -- function num : 0_1 , upvalues : _ENV
    -- DECOMPILER ERROR at PC2: Confused about usage of register: R4 in 'UnsetPending'

    ((self.ui).canvasGroup).alpha = 1
    resLoader:LoadABAssetAsync(PathConsts:GetCampPicPath(
                                   (heroData:GetCampCfg()).icon),
                               function(texture)
        -- function num : 0_1_0 , upvalues : _ENV, self
        if IsNull(texture) then return end -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'
        
        ((self.ui).img_Camp).texture = texture
    end)
    resLoader:LoadABAssetAsync(PathConsts:GetCharacterPicPath(
                                   heroData:GetResName()), function(texture)
        -- function num : 0_1_1 , upvalues : _ENV, self
        if IsNull(texture) then return end -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'
        
        ((self.ui).img_Hero).texture = texture
    end) -- DECOMPILER ERROR at PC30: Confused about usage of register: R4 in 'UnsetPending'
    ;
    ((self.ui).img_Carrer).sprite = CRH:GetSprite(
                                        (heroData:GetCareerCfg()).icon,
                                        CommonAtlasType.CareerCamp);
    ((self.ui).obj_IsNew):SetActive(isNew)
    local rankCfg = (ConfigData.hero_rank)[(heroData.heroCfg).rank]
    if rankCfg == nil then
        error("Can\'t find rankCfg, id = " .. tostring((heroData.heroCfg).rank))
    end
    self:__HideAllStar()
    self:__UpdateStar(rankCfg.star, (self.starRareColor)[heroData.rare])
    for k, go in ipairs((self.ui).rareBg) do go:SetActive(rankCfg.rare == k) end
    for k, go in ipairs((self.ui).rareStarBg) do
        go:SetActive(rankCfg.rare == k + 1)
    end
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
end

UINLtrResultHero.__UpdateStar = function(self, starCount, rareColor)
    -- function num : 0_2
    local twoStarCount = starCount // 2
    local oneStarCount = starCount % 2
    for i = 1, twoStarCount do
        local starItem = self:__GetStar(i)
        starItem:SetIndex(0) -- DECOMPILER ERROR at PC13: Confused about usage of register: R10 in 'UnsetPending'
        ;
        (starItem.image).color = rareColor
    end
    if oneStarCount ~= 0 then
        local starItem = self:__GetStar(twoStarCount + 1)
        starItem:SetIndex(1) -- DECOMPILER ERROR at PC24: Confused about usage of register: R6 in 'UnsetPending'
        ;
        (starItem.image).color = rareColor
    end
end

UINLtrResultHero.__GetStar = function(self, index)
    -- function num : 0_3
    local starItem = (self.starItemList)[index]
    if starItem == nil then
        starItem = ((self.ui).img_star):Instantiate() -- DECOMPILER ERROR at PC10: Confused about usage of register: R3 in 'UnsetPending'
        ;
        (self.starItemList)[index] = starItem
    end
    (starItem.gameObject):SetActive(true)
    return starItem
end

UINLtrResultHero.__HideAllStar = function(self)
    -- function num : 0_4 , upvalues : _ENV
    for k, v in pairs(self.starItemList) do (v.gameObject):SetActive(false) end
end

UINLtrResultHero.SetLtrHeroConvertAlpha =
    function(self)
        -- function num : 0_5
        -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

        ((self.ui).canvasGroup).alpha = 0.2
    end

UINLtrResultHero.SetStarQualityActive = function(self, active)
    -- function num : 0_6
    ((self.ui).obj_quality):SetActive(active)
end

UINLtrResultHero.OnDelete = function(self)
    -- function num : 0_7 , upvalues : base
    (base.OnDelete)(self)
end

return UINLtrResultHero
