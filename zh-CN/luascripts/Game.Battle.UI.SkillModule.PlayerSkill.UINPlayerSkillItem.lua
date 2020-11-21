-- params : ...
-- function num : 0 , upvalues : _ENV
local UINPlayerSkillItem = class("UINPlayerSkillItem", UIBaseNode)
local base = UIBaseNode
UINPlayerSkillItem.OnInit = function(self)
    -- function num : 0_0 , upvalues : _ENV
    (UIUtil.LuaUIBindingTable)(self.transform, self.ui);
    (((self.ui).btnPlus_Root).onClick):AddListener(
        BindCallback(self, self.__OnSkillClicked));
    (((self.ui).btnPlus_Root).onPress):AddListener(
        BindCallback(self, self.__OnSkillLongPress));
    (((self.ui).btnPlus_Root).onPressUp):AddListener(
        BindCallback(self, self.__OnSkillPressUp)) -- DECOMPILER ERROR at PC34: Confused about usage of register: R1 in 'UnsetPending'
    ;
    ((self.ui).img_CD).enabled = false -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'
    ;
    ((self.ui).tran_Line).localScale = Vector3.zero -- DECOMPILER ERROR at PC45: Confused about usage of register: R1 in 'UnsetPending'
    ;
    (((self.ui).ani_mpMax).transform).localScale = Vector3.zero;
    (((self.ui).Ani_Item).onComplete):AddListener(
        function()
            -- function num : 0_0_0 , upvalues : self, _ENV
            -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

            ((self.ui).tran_Line).localScale = Vector3.zero
        end);
    (((self.ui).Ani_Item).onPlay):AddListener(
        function()
            -- function num : 0_0_1 , upvalues : self, _ENV
            -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

            ((self.ui).tran_Line).localScale = Vector3.one
        end)
end

UINPlayerSkillItem.InitPlayerSkillItem =
    function(self, battleSkill, reslaoder, clickFunc, longPressFunc, pressUpFunc)
        -- function num : 0_1 , upvalues : _ENV
        self.battleSkill = battleSkill
        self.clickFunc = clickFunc
        self.longPressFunc = longPressFunc
        self.pressUpFunc = pressUpFunc
        self.isSkillNoCD = battleSkill.totalCDTime == 0 -- DECOMPILER ERROR at PC16: Confused about usage of register: R6 in 'UnsetPending'
        ;
        ((self.ui).tex_Cost).text =
            tostring((battleSkill.skillCfg).PlayerMpCost) -- DECOMPILER ERROR at PC19: Confused about usage of register: R6 in 'UnsetPending'
        ;
        ((self.ui).img_Icon).enabled = false
        if not (string.IsNullOrEmpty)((battleSkill.skillCfg).Icon) then
            reslaoder:LoadABAssetAsync(PathConsts:GetAtlasAssetPath(
                                           "CommanderSkillIcons"),
                                       function(spriteAtlas)
                -- function num : 0_1_0 , upvalues : self, battleSkill
                if spriteAtlas == nil then return end -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'
                
                ((self.ui).img_Icon).sprite =
                    spriteAtlas:GetSprite((battleSkill.skillCfg).Icon) -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'
                ;
                ((self.ui).img_Icon).enabled = true
            end)
        end
        -- DECOMPILER ERROR: 2 unprocessed JMP targets
    end

UINPlayerSkillItem.RefreshPlayerSkillItemMp =
    function(self, curMp, isMax)
        -- function num : 0_2
        self.curMp = curMp
        local decoloration = 0.5
        decoloration = curMp == nil or
                           (((self.battleSkill).skillCfg).PlayerMpCost <= curMp and
                               1) or 0.5 -- DECOMPILER ERROR at PC15: Confused about usage of register: R4 in 'UnsetPending'
        ;
        ((self.ui).Fade).alpha = decoloration
        self:__SetPlayerSkillMPMaxUI(isMax)
    end

UINPlayerSkillItem.OnUpdateLogic_PlayerSkillItem =
    function(self)
        -- function num : 0_3 , upvalues : _ENV
        if not self.isSkillNoCD then
            local skill = self.battleSkill
            if skill:IsReadyToTake() then
                if ((self.ui).img_CD).enabled then
                    self:RefreshPlayerSkillItemMp(self.curMp)
                end -- DECOMPILER ERROR at PC18: Confused about usage of register: R2 in 'UnsetPending'
                
                ((self.ui).img_CD).enabled = false
            else
                -- DECOMPILER ERROR at PC22: Confused about usage of register: R2 in 'UnsetPending'


                ((self.ui).img_CD).enabled = true
                self.curCDRatio = (skill.totalCDTime - skill.curCDTime) /
                                      skill.totalCDTime
                self.nextCDRatio = (skill.totalCDTime - skill.curCDTime - 1) /
                                       skill.totalCDTime -- DECOMPILER ERROR at PC39: Confused about usage of register: R2 in 'UnsetPending'
                ;
                ((self.ui).img_CD).fillAmount = self.curCDRatio -- DECOMPILER ERROR at PC42: Confused about usage of register: R2 in 'UnsetPending'
                ;
                ((self.ui).Fade).alpha = 0.5 -- DECOMPILER ERROR at PC48: Confused about usage of register: R2 in 'UnsetPending'
                ;
                (((self.ui).ani_mpMax).transform).localScale = Vector3.zero
            end
        end
    end

UINPlayerSkillItem.OnUpdateRender_PlayerSkillItem =
    function(self, deltaTime, interpolation)
        -- function num : 0_4 , upvalues : _ENV
        -- DECOMPILER ERROR at PC16: Confused about usage of register: R3 in 'UnsetPending'

        if not self.isSkillNoCD and ((self.ui).img_CD).enabled then
            ((self.ui).img_CD).fillAmount =
                (Mathf.Lerp)(self.curCDRatio, self.nextCDRatio, interpolation)
        end
    end

UINPlayerSkillItem.__OnSkillClicked = function(self)
    -- function num : 0_5
    if ((self.ui).Fade).alpha == 1 then ((self.ui).Ani_Item):DORestart() end
    if self.clickFunc ~= nil then (self.clickFunc)(self.battleSkill) end
end

UINPlayerSkillItem.__OnSkillLongPress = function(self)
    -- function num : 0_6
    if self.longPressFunc ~= nil then
        (self.longPressFunc)(self, self.battleSkill)
    end
end

UINPlayerSkillItem.__OnSkillPressUp = function(self)
    -- function num : 0_7
    if self.pressUpFunc ~= nil then (self.pressUpFunc)() end
end

UINPlayerSkillItem.__SetPlayerSkillMPMaxUI =
    function(self, isMax)
        -- function num : 0_8 , upvalues : _ENV
        -- DECOMPILER ERROR at PC11: Confused about usage of register: R2 in 'UnsetPending'

        if not isMax or not Vector3.one then
            (((self.ui).ani_mpMax).transform).localScale = Vector3.zero
            if isMax then
                ((self.ui).ani_mpMax):DORestart()
            else

                ((self.ui).ani_mpMax):DOPause()
            end
        end
    end

UINPlayerSkillItem.OnDelete = function(self)
    -- function num : 0_9 , upvalues : base
    ((self.ui).ani_mpMax):DOKill();
    (base.OnDelete)(self)
end

return UINPlayerSkillItem
