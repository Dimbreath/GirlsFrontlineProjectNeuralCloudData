-- params : ...
-- function num : 0 , upvalues : _ENV
local UIBattleEnemyDetail = class("UIBattleEnemyDetail", UIBaseWindow)
local base = UIBaseWindow
local UINEnemySkillItem = require("Game.Battle.UI.UINEnemySkillItem")
local UINEnemyTagItem = require("Game.Battle.UI.UINEnemyTagItem")
local FloatAlignEnum = require("Game.CommonUI.FloatWin.FloatAlignEnum")
local HAType = FloatAlignEnum.HAType
local VAType = FloatAlignEnum.VAType
local CS_ResLoader = CS.ResLoader
UIBattleEnemyDetail.OnInit = function(self)
    -- function num : 0_0 , upvalues : _ENV, UINEnemySkillItem, UINEnemyTagItem
    ((self.ui).uINSkillItem):SetActive(false)
    self.skillItemPool = (UIItemPool.New)(UINEnemySkillItem,
                                          (self.ui).uINSkillItem);
    ((self.ui).obj_tag):SetActive(false)
    self.tagItemPool = (UIItemPool.New)(UINEnemyTagItem, (self.ui).obj_tag)
    self.__onShowSkillDetail = BindCallback(self, self.__ShowSkillDetail)
    self.__onHideSkillDetail = BindCallback(self, self.__HideSkillDetail)
end

UIBattleEnemyDetail.InitBattleEnemyDetail =
    function(self, dynRole, isNew)
        -- function num : 0_1 , upvalues : _ENV
        if isNew then
            ((self.ui).obj_isNew):SetActive(true)
        else

            ((self.ui).obj_isNew):SetActive(false)
        end
        local changeRole = self.dynRole ~= dynRole
        self.dynRole = dynRole -- DECOMPILER ERROR at PC23: Confused about usage of register: R4 in 'UnsetPending'
        ;
        ((self.ui).tex_Name).text = dynRole:GetName()
        local careerId = dynRole:GetCareer()
        local careerCfg = (ConfigData.career)[careerId]
        if careerCfg == nil then
            error("Can\'t find careerCfg, campId = " .. tostring(careerId))
        else
            -- DECOMPILER ERROR at PC47: Confused about usage of register: R6 in 'UnsetPending'

            ((self.ui).img_Career).sprite =
                CRH:GetSprite(careerCfg.icon, CommonAtlasType.CareerCamp)
        end -- DECOMPILER ERROR at PC54: Confused about usage of register: R6 in 'UnsetPending'
        
        ((self.ui).tex_Power).text = tostring(dynRole:GetFightingPower()) -- DECOMPILER ERROR at PC59: Confused about usage of register: R6 in 'UnsetPending'
        ;
        ((self.ui).tex_Content).text = dynRole:GetMonsterInfo();
        (self.skillItemPool):HideAll()
        local originSkiilList = dynRole:GetOriginSkillList()
        for k, skillData in pairs(originSkiilList) do
            if not skillData:IsCommonAttack() then
                local skillItem = (self.skillItemPool):GetOne()
                skillItem:InitEnemySkillItem(skillData, nil,
                                             self.__onShowSkillDetail,
                                             self.__onHideSkillDetail)
            end
        end
        if #(self.skillItemPool).listItem > 0 then
            ((self.ui).obj_skills):SetActive(true)
        else
            ((self.ui).obj_skills):SetActive(false)
        end
        (self.tagItemPool):HideAll()
        for _, tagId in ipairs(((self.dynRole).monsterCfg).monster_tag) do
            local tagCfg = (ConfigData.monster_tag)[tagId]
            if tagCfg == nil then
                error("Can\'t find tagCfg id=" .. tagId)
            else
                local item = (self.tagItemPool):GetOne(true)
                item:InitEnemyTagItem((LanguageUtil.GetLocaleText)(tagCfg.tag))
            end
        end
        -- DECOMPILER ERROR: 8 unprocessed JMP targets
    end

UIBattleEnemyDetail.__ShowSkillDetail = function(self, item, skillData)
    -- function num : 0_2 , upvalues : _ENV, HAType, VAType
    local win = UIManager:ShowWindow(UIWindowTypeID.FloatingFrame)
    win:SetTitleAndContext(skillData:GetName(), skillData:GetLevelDescribe())
    win:FloatTo(item.transform, HAType.center, VAType.up)
end

UIBattleEnemyDetail.__HideSkillDetail = function(self)
    -- function num : 0_3 , upvalues : _ENV
    UIManager:HideWindow(UIWindowTypeID.FloatingFrame)
end

UIBattleEnemyDetail.OnDelete = function(self)
    -- function num : 0_4 , upvalues : base
    (base.OnDelete)(self)
end

return UIBattleEnemyDetail
