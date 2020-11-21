-- params : ...
-- function num : 0 , upvalues : _ENV
local UIEpEventNode = class("UIEpEventNode", UIBaseNode)
local UIChoiceItem =
    require("Game.Exploration.UI.EventRoom.UIEpEventChoiceItem")
local ExplorationEnum = require("Game.Exploration.ExplorationEnum")
local CS_DOTween = ((CS.DG).Tweening).DOTween
local base = UIBaseNode
UIEpEventNode.OnInit = function(self)
    -- function num : 0_0 , upvalues : _ENV
    (UIUtil.LuaUIBindingTable)(self.transform, self.ui)
    self.choiceItemPool = {};
    ((self.ui).obj_choiceItem):SetActive(false) -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'
    ;
    ((self.ui).tex_EventText).text = ""
end

UIEpEventNode.InitEpEventNode = function(self, eRoomData, onChoiceClick)
    -- function num : 0_1
    self.onChoiceClick = onChoiceClick
    self:__ShowEventText(eRoomData.eventId)
    self:__UpdateRoomUI(eRoomData.eRoomType)
    self:__CreatEventChoiceItem(eRoomData.choiceDatalist)
end

UIEpEventNode.__ShowEventText = function(self, eventId)
    -- function num : 0_2 , upvalues : _ENV, CS_DOTween
    local eRoomCfg = (ConfigData.event)[eventId]
    if eRoomCfg == nil then
        error("eRoomCfg null,id:" .. tostring(eventId))
        return
    end
    local eventText = (LanguageUtil.GetLocaleText)(eRoomCfg.event_txt)
    self.tween = ((CS_DOTween.To)(function()
        -- function num : 0_2_0 , upvalues : self
        return ((self.ui).tex_EventText).text
    end, function(x)
        -- function num : 0_2_1 , upvalues : self
        -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

        ((self.ui).tex_EventText).text = x
    end, eventText, (self.ui).ani_duration)):SetEase(
                     (((CS.DG).Tweening).Ease).Linear)
end

UIEpEventNode.__UpdateRoomUI = function(self, eRoomType)
    -- function num : 0_3 , upvalues : _ENV, ExplorationEnum
    local roomTypeCfg = (ConfigData.exploration_roomtype)[eRoomType]
    if roomTypeCfg == nil then
        error("exploration room type is null,id:" .. tostring(eRoomType))
        return
    end
    local colorCfg = roomTypeCfg.color
    local color = (Color.New)(colorCfg[1], colorCfg[2], colorCfg[3]) -- DECOMPILER ERROR at PC22: Confused about usage of register: R5 in 'UnsetPending'
    ;
    ((self.ui).img_TypeColor).color = color -- DECOMPILER ERROR at PC25: Confused about usage of register: R5 in 'UnsetPending'
    ;
    ((self.ui).img_RoomIcon).color = color -- DECOMPILER ERROR at PC34: Confused about usage of register: R5 in 'UnsetPending'
    ;
    ((self.ui).img_RoomIcon).sprite = CRH:GetSprite(roomTypeCfg.icon,
                                                    CommonAtlasType.ExplorationIcon)
    if eRoomType == (ExplorationEnum.eRoomType).recovery then
        ((self.ui).tex_RoomType):SetIndex(1)
    else
        if eRoomType == (ExplorationEnum.eRoomType).eventroom then
            ((self.ui).tex_RoomType):SetIndex(0)
        end
    end
end

UIEpEventNode.__CreatEventChoiceItem = function(self, chioceDataList)
    -- function num : 0_4 , upvalues : _ENV, UIChoiceItem
    for _, item in ipairs(self.choiceItemPool) do
        (item.gameObject):SetActive(false)
    end
    self.choiceItemArr = {}
    for index, choiceData in ipairs(chioceDataList) do
        local choiceItem = nil
        if #self.choiceItemPool > 0 then
            choiceItem = (table.remove)(self.choiceItemPool,
                                        #self.choiceItemPool)
        end
        if choiceItem == nil then
            local go = ((self.ui).obj_choiceItem):Instantiate()
            choiceItem = (UIChoiceItem.New)()
            choiceItem:Init(go)
            choiceItem:InitEventChoiceItem(choiceData, self.onChoiceClick)
        else
            do
                do
                    choiceItem:RefreshChoiceUI(choiceData) -- DECOMPILER ERROR at PC52: Confused about usage of register: R8 in 'UnsetPending'
                    ;
                    (choiceItem.gameObject).name = tostring(index);
                    (choiceItem.gameObject):SetActive(true);
                    (table.insert)(self.choiceItemArr, choiceItem)
                    -- DECOMPILER ERROR at PC62: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC62: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC62: LeaveBlock: unexpected jumping out IF_STMT

                end
            end
        end
    end
    local item = nil
    for i = 1, #self.choiceItemArr do
        item = (table.remove)(self.choiceItemArr, #self.choiceItemArr);
        (table.insert)(self.choiceItemPool, item)
    end
end

UIEpEventNode.SetNodeActive = function(self, active)
    -- function num : 0_5
    ((self.transform).gameObject):SetActive(active)
end

UIEpEventNode.OnDelete = function(self)
    -- function num : 0_6 , upvalues : _ENV, base
    if self.choiceItemDic ~= nil then
        for id, choiceItem in pairs(self.choiceItemDic) do
            choiceItem:OnDelete()
        end
        self.choiceItemDic = nil
    end
    if self.tween ~= nil then
        (self.tween):Kill()
        self.tween = nil
    end
    (base.OnDelete)(self)
end

return UIEpEventNode
