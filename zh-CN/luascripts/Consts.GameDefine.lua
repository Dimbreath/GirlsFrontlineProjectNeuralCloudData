-- params : ...
-- function num : 0 , upvalues : _ENV
eMsgEventId = {OnSceneLoadingProgress = 10, UpdateItem = 100, UpdateHero = 101, SyncUserData = 102, UpdateARGItem = 103, UserNameChanged = 110, OnCommanderSkillChande = 150, UIHeroListClosed = 200, UIOasisShow = 201, UIGetHeroClose = 202, OnHeroRankChange = 210, UpdateWarehouse = 301, UpdateBuildingProcess = 302, UpdateAutoRecoverItemSpeed = 303, UpdateTrainingProgress = 400, TaskUpdate = 500, TaskDelete = 501, TaskCommitComplete = 503, TaskReceived = 506, TaskSyncFinish = 507, SectorChipSet = 601, SectorPickReward = 602, PickFirstReward = 603, SectorStateUpdate = 604, BuildingUpgradeComplete = 700, BuildingSendUpgradeComplete = 701, BuildingCancelComplete = 702, BuildingProduceUpdate = 703, StaminaUpdate = 800, OnMailDiff = 850, OnMailDelete = 851, GetAchivLevelRewardComplete = 900, UpdatePlayerLevel = 901, UpdatePickedRewardLevel = 902, UpdatePickedAchivTask = 903, NewNotice = 950, CleanNotice = 951, ExplorationEnterComplete = 1000, ExplorationExit = 1001, OnHasUncompletedEp = 1002, OnEpSceneLoadRole = 1050, OnShowRoleHeadBar = 1051, OnShowExplorationUI = 1052, OnChangeEpRoomSelectAudio = 1053, OnEpSceneStateChanged = 1060, OnRoomSelected = 1101, OnEpOperatorDiff = 1102, OnEpGridDetailDiff = 1103, OnEpBackpackDiff = 1105, EpMoneyChange = 1106, OnEpFormationDetailDiff = 1107, OnEpBuffDiff = 1108, OnEpPlayerHeroDataChange = 1109, OnEpChipListChange = 1110, OnEpBuffListChange = 1111, OnShowBattleResultComplete = 1112, OnExitRoomComplete = 1113, OnEpResidentDiff = 1114, OnChipDataDiff = 1115, OnEpPlayerFightPowerChang = 1116, OnEpOpStateChanged = 1117, OnBeforeBattleRandomDataChange = 1120, OnEpPlayerMoveStart = 1121, OnEpPlayerMoveComplete = 1122, OnTreasureRoomUpdate = 1201, OnStoreRoomUpdate = 1202, OnEventAndRecoveryRoomUpdate = 1203, OnResetRoomUpdate = 1204, EpFocusPointChange = 1205, DungeonHeroListActiveSet = 1206, OnEnterBattle = 1300, OnExitBattle = 1301, OnBattleReady = 1302, OnBattleUpdateUltSkill = 1310, OnTimelineNoticeCreateResultUI = 1351, OnPlayChipEffect = 1400, OnDeployCoordChanged = 1401, OnChipLimitChange = 1405, OnChipDiscardChanged = 1406, EpSaveMoneyChange = 1407, OnAthDataUpdate = 1500, OnAthDataUpdate1 = 1501, OnHeroEnterDataUpdate = 1505, OnHeroFriendshipDataChange = 1510, OnCommanderSkillOverLoad = 1515, OnCommanderSkillTreeDataDiffer = 1516, OnCommanderSkillMasterLevelDiffer = 1517, OnCommanderSkillLevelDiffer = 1518, OnDungeonDetailWinChange = 1600, OnSettleMentTimeLinePlayToEnd = 1601, OnShowingMapRoomClick = 1602, OnSectorStageStateChange = 1700, OnBattleDungeonLimitChange = 1800, OnMainAvgStateChange = 1900, OnMainLevelStateChange = 1901}
eLogicType = {ResourceLimit = 3, ResourceOutput = 4, CampBuff = 5, CareerBuff = 6, FactoryPipelie = 7, GlobalExpCeiling = 8, StaminaCeiling = 9, StaminaOutput = 10, ResOutputEfficiency = 11, BuildQueue = 12, BuildSpeed = 13, GlobalExpRatio = 14, AllHeroBuff = 15, OverClock = 16, OverClockFreeNum = 17, FocusPointCeiling = 18, BattleExpBonus = 19, DynSkillUpgrade = 20, DynChipCountMax = 21, DynPlayerAttrBuff = 22, DungeonRewardRate = 23, HeroLevelCeiling = 24, AutoRecoverItem = 25, DungeonCountAdd = 26, FactoryEfficiency = 27}
eCustomWaitType = {TcpConnect = 1, WaitGateInfo = 2, WaitCheckVersion = 3, WaitAthDetailBatch = 4}
eHeroCardRareType = {SSR = 3, SR = 2, R = 1}
HeroRareColor = {[eHeroCardRareType.SSR] = (Color.New)(1, 0.545, 0.031, 1), [eHeroCardRareType.SR] = (Color.New)(0.701, 0.411, 0.952, 1), [eHeroCardRareType.R] = (Color.New)(0.172, 0.6, 1, 1)}
_ENV.HeroRareString = {[eHeroCardRareType.SSR] = "SSR", [eHeroCardRareType.SR] = "SR", [eHeroCardRareType.R] = "R"}
_ENV.eHeroShowAttrList = {2, 3, 4, 12, 5, 7, 9, 10, 13, 11}
_ENV.eHeroShowTag = {[1] = "tag_dps_1", [2] = "tag_assassin_2", [3] = "tag_healing_3", [4] = "tag_control_4", [5] = "tag_defense_5"}
_ENV.eItemType = {Resource = 1, GrowUp = 2, BattleUse = 3, ExplorationUse = 4, HeroCard = 5, ExplorationBuffer = 6, GlobalChip = 7, Package = 8, LimitRes = 9, FactoryRes = 10, Arithmetic = 11, DormRoom = 12, DormFurniture = 13, AutoGenerateResource = 14}
_ENV.ItemTypeMax = 14
_ENV.ItemIdOfG = 1003
_ENV.ItemIdOfKey = 1007
_ENV.eItemQualityType = {White = 1, Green = 2, Blue = 3, Purple = 4, Orange = 5}
_ENV.ItemQualityColor = {[(_ENV.eItemQualityType).White] = (Color.New)(0.603, 0.603, 0.603, 1), [(_ENV.eItemQualityType).Green] = (Color.New)(0.458, 0.725, 0.364, 1), [(_ENV.eItemQualityType).Blue] = (Color.New)(0, 0.592, 0.862, 1), [(_ENV.eItemQualityType).Purple] = (Color.New)(0.76, 0.333, 0.701, 1), [(_ENV.eItemQualityType).Orange] = (Color.New)(1, 0.517, 0, 1)}
_ENV.ItemQualitySprite = {[(_ENV.eItemQualityType).White] = "ItemQuailty_1", [(_ENV.eItemQualityType).Green] = "ItemQuailty_2", [(_ENV.eItemQualityType).Blue] = "ItemQuailty_3", [(_ENV.eItemQualityType).Purple] = "ItemQuailty_4", [(_ENV.eItemQualityType).Orange] = "ItemQuailty_5"}
_ENV.eItemActionType = {HeroExp = 2001, CommanderSkillExp = 3001, HeroCard = 4001, HeroCardFrag = 4002, BuildingAcc = 5001, AthAreaExp = 6001}
_ENV.eItemAvailableType = {NotUse = 0, Useable = 1, AutoUse = 2}
_ENV.eChipDetailPowerType = {Add = 1, None = 0, Subtract = -1}
_ENV.eChipCornerSprite = {[1] = "Corner_0", [2] = "Corner_1", [3] = "Corner_2", [4] = "Corner_3", [5] = "Corner_4", [6] = "Corner_5", [7] = "Corner_6", [8] = "Corner_7", [9] = "Corner_8", [10] = "Corner_9", [11] = "Corner_10", [12] = "Corner_11", [13] = "Corner_12", [14] = "Corner_13"}
_ENV.eHeroSkillType = {BattleSkill = 1, LifeSkill = 2, UltimateSkill = 3}
_ENV.eBattleSkillType = {Attack = 1, Recovery = 2, Defense = 3, Special = 4}
_ENV.eBattleSkillTypeColor = {[(_ENV.eBattleSkillType).Attack] = (Color.New)(0.82, 0.14, 0.14, 1), [(_ENV.eBattleSkillType).Recovery] = (Color.New)(0.57, 0.82, 0.16, 1), [(_ENV.eBattleSkillType).Defense] = (Color.New)(0.11, 0.63, 0.85, 1), [(_ENV.eBattleSkillType).Special] = (Color.New)(0.49, 0.54, 0.63, 1)}
_ENV.eBuildingId = {OasisMainBuilding = 1001, OasisConstructionBureau = 1002, OasisEnergeyStation = 1003, OasisSearchTerminal = 1004, DimensionBuildingId = 1004, OasisLibrary = 1007, OasisTrainingBuilding = 1008, OasisResourceWarehouse = 1011, OasisFactory = 1012, OasisOverclockTower = 1013}
_ENV.eBuildQueueType = {Oasis = 1, Sector = 2}
_ENV.eBattleState = {Init = 0, Deploy = 1, Running = 2, End = 3, Delete = 4}
_ENV.eGuideCondition = {None = 0, InHome = 1, InExploration = 2, InExplorationScene = 3, InBattleDeploy = 4, InSelectChip = 5, InBattleScene = 6, InEpTreasureRoom = 7, InEpEventRoom = 8, InSectorLevel = 9, InOassisBuildingDetail = 10, InFormation = 11, InSectorSceneNormal = 12, InMainScene = 13, InHeroStateUI = 14, InNewMonsterDetail = 15, InEpBattleResult = 16, InLottery = 17, InATHStrengthen = 18, FInHome = 101, FInSectorLevel = 109, FInSectorScene = 112}
_ENV.eAudioSourceType = {BgmSource = 1, SfxSource = 2, LoopSource = 3, VoiceSource = 4}
_ENV.eAudioVolumeType = {Bgm = 1, Sfx = 2, Voice = 3}
_ENV.eAuSelct = {
Home = {name = "Selector_Mus_Home", base = "SelectorLabel_Base", oasis = "SelectorLabel_Oasis", sector = "SelectorLabel_Sector"}
, 
Sector = {name = "Selector_Mus_Sector", roomSelect = "SelectorLabel_LevelSelect", normalCombat = "SelectorLabel_NormalCombat", bossCombat = "SelectorLabel_BossCombat"}
}
_ENV.eAuCueSheet = {Ambience = "Ambience", CommonSkill = "Common Skill", Music = "Music", UI = "UI", AVG_gf = "AVG_gf", Prefix_Character = "Chara_", Prefix_Monster = "Mon_"}
_ENV.eAvgTriggerType = {MainAvg = 1, MainAvgEp = 2, AvgDungeon = 3, AvgTask = 4, SubAvg = 5}
_ENV.eSectorStageDifficult = {Normal = 1, Hard = 2, Endless = 3}
_ENV.TipContent = {empty = 1, achievement_taskNotComplete = 2, achievement_taskCompleted = 3, arithmetic_Strengthlimt = 4, arithmetic_HasInstalledInfo = 5, arithmetic_UsableSpaceInsufficient = 6, arithmetic_RepeatedATH = 7, arithmetic_InstallSuccess = 8, arithmetic_UninstallSuccess = 9, arithmetic_ReplaceSuccess = 10, arithmetic_Slot_HasFullLevel = 11, arithmetic_Slot_MaterialShot = 12, arithmetic_Slot_ConfirmDecompose = 13, arithmetic_Inherit_Lock = 14, arithmetic_Inherit_RepeateAttr = 15, arithmetic_Inherit_AttrQualitylimt = 16, arithmetic_Inherit_ItemInsufficient = 17, arithmetic_Inherit_Success = 18, arithmetic_optimal_ItemInsufficient = 19, arithmetic_optimal_Success = 20, arithmetic_optimal_Failure = 21, dorm_HouseRoomNumLimt = 22, dorm_NotSlelctRoom = 23, dorm_ConfirmDecomposeRoom = 24, dorm_BuyItemInsufficient = 25, eventRoom_ItemInfficient = 26, exploration_StartFailure = 27, exploration_SelectRoomFailure = 28, exploration_Reconstitution_AchieveChip = 29, exploration_Reconstitution_ChipOperateSuccess = 30, exploration_Reconstitution_SelectOneHero = 31, exploration_Store_BuyItemInsufficient = 32, exploration_Stroe_BuySuccess = 33, exploration_Treasure_AtLeastSelectOne = 34, exploration_Treasure_MoneyInsufficient = 35, exploration_Treasure_RefreshNumInsufficient = 36, exploration_Player_CantSelectRoom = 37, exploration_Player_ExitExpo = 38, exploration_Player_ExitExpoWithStaminaBack = 39, exploration_Reconstitution_MoneyInsufficient = 40, exploration_Reconstitution_SelectCountReachMax = 41, exploration_Reconstitution_NotSelectEnourhChip = 42, exploration_Event_GetItem = 119, exploration_Event_GetBuff = 120, exploration_Event_NotAchieved = 121, exploration_Store_Exit = 122, exploration_Store_Sell = 256, exploration_Store_SellSuc = 257, exploration_Upgrade_UpgradeItemInsufficient = 258, exploration_Upgrade_UpgradeItemSuccess = 259, exploration_Upgrade_UpgradeItemLevelMax = 285, factory_LineNumReachMax = 43, exploration_Level_Chip_Unlock = 350, hero_CantUpgrade = 44, hero_level_Full = 46, hero_level_UpgradeMaterialFull = 47, heroEnter_HasEnteredOtherBuilding = 48, name_Exist = 49, name_Illegal = 50, login_NoticeUserName = 51, login_IllegalServer = 52, login_EmptyName = 53, lottery_ItemInsufficient = 54, lottery_DailyLimtFull = 106, mail_Notice = 55, mail_NotHaveAvailableMail = 56, mail_NotHaveAvailableMailReward = 57, Building_ConstructQueueFull = 58, Building_NotFillConstructCodition = 59, Oasis_Building_Overlapping = 60, Oasis_Building_StartConstruct = 61, Building_LevelFull = 62, Building_NotFitUpgradeStatue = 64, Oasis_Building_StartUpgrade = 65, Building_Incomplete = 66, Building_NoticeConstructFinish = 67, ItemInWarehouseFull = 68, Building_UnsatisfMinialRewardCycle = 69, Building_GainReward = 70, Oasis_MainBuldingUnlockInfo = 71, QuickPurchase_LowerThanMinimal = 72, QuickPurchase_MoreThan100 = 73, QuickPurchase_CurrencyLimt = 74, QuickPurchase_CurrencyInsuficient = 75, Sector_Locked = 76, Sector_HasExpNotFinished = 77, Sector_IsExploringOtherSector = 78, Sector_InifinityName = 261, Sector_HaveToClearanceLastLevelToUnlock = 79, Sector_LackOfStamina = 80, Sector_HeroNumInsufficient = 81, Sector_SelectLevel = 82, Sector_BuildingConfirmFinish = 83, QuickFormat_HroeAlreadyInFormat = 84, SectorTask_TaskUndone = 85, SectorTask_CanObtainReward = 86, SectorTask_ObtainedReward = 87, Shop_MoneyInsufficient = 88, Shop_PurchaseSuccess = 89, Shop_Refresh_MoneyInsufficient = 90, Shop_RefreshNotice = 91, Shop_SoldOut = 92, Shop_ConfirmPurchase = 93, Train_HeroNotExist = 94, Train_HeroLevelFull = 95, Train_HeroIsTraining = 96, Train_HeroReachTheMaxTrainLevel = 97, Train_GlobleEXPNotEnough = 98, Train_SelectPlan = 99, Train_LockedInfo = 100, arithmetic_DecomposeInfo = 101, HeroEnter_notHaveLifeSkill = 107, FunctionUnlockDescription_Level = 108, FunctionUnlockDescription_Task = 109, FunctionUnlockDescription_SectorStage = 110, FunctionUnlockDescription_Building = 111, FunctionUnlockDescription_Friendship = 112, FunctionUnlockDescription_BattleDungeon = 262, Formation_MaxHeroCount = 113, LevelDetail_GiveupEp = 123, CanFitAccBuild = 128, Avg_SkipAllAvg = 129, Building_BuildingNoRes = 130, Ath_MaxCount = 139, Ath_EfficiencyUpContainOrangeAth = 140, LevelDetail_GiveupEpWithStaminaReturn = 141, LevelUp_Limit = 143, Ath_AreaUpExpIsFull = 200, Ath_CantSelectLockAth = 201, Ath_CantInstall = 202, Ath_NotOneReplaceOne = 203, CommonItemDetailNoDesc = 266, Ltr_PoolExpired = 300, ChipAttrIncreaseDes = 1013, CommanderDPSName = 1014, Dorm_ChangeBindConfirm = 2001, Dorm_FntConfirmEdit = 2002, Dorm_FntMaxCount = 2003, Dorm_SelectWall = 2004, Dorm_WallId = 2005, Dorm_RoomBindMax = 2006, Dorm_HouseBindMax = 2007, BattleDungeon_DailyLimit = 3000, Overclock_AssembleNumLimit = 114, Overclock_GInsufficient = 115, Overclock_DonorHaveUnlockChip = 116, exploration_Treasure_AlertNotSelectAllReward = 117, ExpiredMention = 124, Battle_noBattleRole = 125, CST_unlockTip = 127, ResourceOverflow = 138, hero_Skill_notOpenYet = 250, hero_Skill_unLockWhernReachStar = 251, hero_Skill_materialInsufficient = 252, hero_Skill_upgradeSuccess = 253, bannerJumpMention = 263, commonConfirm = 264, commonCancle = 265, notUnlockShopCantBuyStamina = 267, HasNewVersionToUpdate = 268, Shop_CanNotRefresh_LackOfItem = 277, Shop_CanNotRefresh_RefreshCountInsufficient = 278, Factory_HeroEnterLimit = 500, Factory_EnergyInsufficient = 501, Factory_MatInsufficient = 502, Factory_HeroEnterSuccess = 503, Factory_ConfirmSwitchHero = 504, Factory_OrderUnlock = 505, Factory_WarehousFull = 506, Friendship_SkillUpgrade_MatInsufficient = 520, Friendship_SkillUpgrade_LevelInsufficient = 521, UserInfo_CopyUIDDone = 540, not_get_gateinfo = 10001, ATH_Dungeon_Area_Extra_Msg = 3001, ATH_Dungeon_All_Area_Extra_Msg = 3002, ultimateSkillUpgrade = 601, Overload_Tip = 700, Overload_Atn_Buff_Tip = 701, Overload_Hp_Buff_Tip = 702, Overload_Time_Tip = 703, Overload_Buff_Tip = 704}

-- params : ...
-- function num : 0 , upvalues : _ENV
eMsgEventId = {
    OnSceneLoadingProgress = 10,
    UpdateItem = 100,
    UpdateHero = 101,
    SyncUserData = 102,
    UpdateARGItem = 103,
    UserNameChanged = 110,
    OnCommanderSkillChande = 150,
    UIHeroListClosed = 200,
    UIOasisShow = 201,
    UIGetHeroClose = 202,
    OnHeroRankChange = 210,
    UpdateWarehouse = 301,
    UpdateBuildingProcess = 302,
    UpdateAutoRecoverItemSpeed = 303,
    UpdateTrainingProgress = 400,
    TaskUpdate = 500,
    TaskDelete = 501,
    TaskCommitComplete = 503,
    TaskReceived = 506,
    TaskSyncFinish = 507,
    SectorChipSet = 601,
    SectorPickReward = 602,
    PickFirstReward = 603,
    SectorStateUpdate = 604,
    BuildingUpgradeComplete = 700,
    BuildingSendUpgradeComplete = 701,
    BuildingCancelComplete = 702,
    BuildingProduceUpdate = 703,
    StaminaUpdate = 800,
    OnMailDiff = 850,
    OnMailDelete = 851,
    GetAchivLevelRewardComplete = 900,
    UpdatePlayerLevel = 901,
    UpdatePickedRewardLevel = 902,
    UpdatePickedAchivTask = 903,
    NewNotice = 950,
    CleanNotice = 951,
    ExplorationEnterComplete = 1000,
    ExplorationExit = 1001,
    OnHasUncompletedEp = 1002,
    OnEpSceneLoadRole = 1050,
    OnShowRoleHeadBar = 1051,
    OnShowExplorationUI = 1052,
    OnChangeEpRoomSelectAudio = 1053,
    OnEpSceneStateChanged = 1060,
    OnRoomSelected = 1101,
    OnEpOperatorDiff = 1102,
    OnEpGridDetailDiff = 1103,
    OnEpBackpackDiff = 1105,
    EpMoneyChange = 1106,
    OnEpFormationDetailDiff = 1107,
    OnEpBuffDiff = 1108,
    OnEpPlayerHeroDataChange = 1109,
    OnEpChipListChange = 1110,
    OnEpBuffListChange = 1111,
    OnShowBattleResultComplete = 1112,
    OnExitRoomComplete = 1113,
    OnEpResidentDiff = 1114,
    OnChipDataDiff = 1115,
    OnEpPlayerFightPowerChang = 1116,
    OnEpOpStateChanged = 1117,
    OnBeforeBattleRandomDataChange = 1120,
    OnEpPlayerMoveStart = 1121,
    OnEpPlayerMoveComplete = 1122,
    OnTreasureRoomUpdate = 1201,
    OnStoreRoomUpdate = 1202,
    OnEventAndRecoveryRoomUpdate = 1203,
    OnResetRoomUpdate = 1204,
    EpFocusPointChange = 1205,
    DungeonHeroListActiveSet = 1206,
    OnEnterBattle = 1300,
    OnExitBattle = 1301,
    OnBattleReady = 1302,
    OnBattleUpdateUltSkill = 1310,
    OnTimelineNoticeCreateResultUI = 1351,
    OnPlayChipEffect = 1400,
    OnDeployCoordChanged = 1401,
    OnChipLimitChange = 1405,
    OnChipDiscardChanged = 1406,
    EpSaveMoneyChange = 1407,
    OnAthDataUpdate = 1500,
    OnAthDataUpdate1 = 1501,
    OnHeroEnterDataUpdate = 1505,
    OnHeroFriendshipDataChange = 1510,
    OnCommanderSkillOverLoad = 1515,
    OnCommanderSkillTreeDataDiffer = 1516,
    OnCommanderSkillMasterLevelDiffer = 1517,
    OnCommanderSkillLevelDiffer = 1518,
    OnDungeonDetailWinChange = 1600,
    OnSettleMentTimeLinePlayToEnd = 1601,
    OnShowingMapRoomClick = 1602,
    OnSectorStageStateChange = 1700,
    OnBattleDungeonLimitChange = 1800,
    OnMainAvgStateChange = 1900,
    OnMainLevelStateChange = 1901
}
eLogicType = {
    ResourceLimit = 3,
    ResourceOutput = 4,
    CampBuff = 5,
    CareerBuff = 6,
    FactoryPipelie = 7,
    GlobalExpCeiling = 8,
    StaminaCeiling = 9,
    StaminaOutput = 10,
    ResOutputEfficiency = 11,
    BuildQueue = 12,
    BuildSpeed = 13,
    GlobalExpRatio = 14,
    AllHeroBuff = 15,
    OverClock = 16,
    OverClockFreeNum = 17,
    FocusPointCeiling = 18,
    BattleExpBonus = 19,
    DynSkillUpgrade = 20,
    DynChipCountMax = 21,
    DynPlayerAttrBuff = 22,
    DungeonRewardRate = 23,
    HeroLevelCeiling = 24,
    AutoRecoverItem = 25,
    DungeonCountAdd = 26,
    FactoryEfficiency = 27
}
eCustomWaitType = {
    TcpConnect = 1,
    WaitGateInfo = 2,
    WaitCheckVersion = 3,
    WaitAthDetailBatch = 4
}
eHeroCardRareType = {SSR = 3, SR = 2, R = 1}
HeroRareColor = {
    [eHeroCardRareType.SSR] = (Color.New)(1, 0.545, 0.031, 1),
    [eHeroCardRareType.SR] = (Color.New)(0.701, 0.411, 0.952, 1),
    [eHeroCardRareType.R] = (Color.New)(0.172, 0.6, 1, 1)
}
_ENV.HeroRareString = {
    [eHeroCardRareType.SSR] = "SSR",
    [eHeroCardRareType.SR] = "SR",
    [eHeroCardRareType.R] = "R"
}
_ENV.eHeroShowAttrList = {2, 3, 4, 12, 5, 7, 9, 10, 13, 11}
_ENV.eHeroShowTag = {
    [1] = "tag_dps_1",
    [2] = "tag_assassin_2",
    [3] = "tag_healing_3",
    [4] = "tag_control_4",
    [5] = "tag_defense_5"
}
_ENV.eItemType = {
    Resource = 1,
    GrowUp = 2,
    BattleUse = 3,
    ExplorationUse = 4,
    HeroCard = 5,
    ExplorationBuffer = 6,
    GlobalChip = 7,
    Package = 8,
    LimitRes = 9,
    FactoryRes = 10,
    Arithmetic = 11,
    DormRoom = 12,
    DormFurniture = 13,
    AutoGenerateResource = 14
}
_ENV.ItemTypeMax = 14
_ENV.ItemIdOfG = 1003
_ENV.ItemIdOfKey = 1007
_ENV.eItemQualityType = {White = 1, Green = 2, Blue = 3, Purple = 4, Orange = 5}
_ENV.ItemQualityColor = {
    [(_ENV.eItemQualityType).White] = (Color.New)(0.603, 0.603, 0.603, 1),
    [(_ENV.eItemQualityType).Green] = (Color.New)(0.458, 0.725, 0.364, 1),
    [(_ENV.eItemQualityType).Blue] = (Color.New)(0, 0.592, 0.862, 1),
    [(_ENV.eItemQualityType).Purple] = (Color.New)(0.76, 0.333, 0.701, 1),
    [(_ENV.eItemQualityType).Orange] = (Color.New)(1, 0.517, 0, 1)
}
_ENV.ItemQualitySprite = {
    [(_ENV.eItemQualityType).White] = "ItemQuailty_1",
    [(_ENV.eItemQualityType).Green] = "ItemQuailty_2",
    [(_ENV.eItemQualityType).Blue] = "ItemQuailty_3",
    [(_ENV.eItemQualityType).Purple] = "ItemQuailty_4",
    [(_ENV.eItemQualityType).Orange] = "ItemQuailty_5"
}
_ENV.eItemActionType = {
    HeroExp = 2001,
    CommanderSkillExp = 3001,
    HeroCard = 4001,
    HeroCardFrag = 4002,
    BuildingAcc = 5001,
    AthAreaExp = 6001
}
_ENV.eItemAvailableType = {NotUse = 0, Useable = 1, AutoUse = 2}
_ENV.eChipDetailPowerType = {Add = 1, None = 0, Subtract = -1}
_ENV.eChipCornerSprite = {
    [1] = "Corner_0",
    [2] = "Corner_1",
    [3] = "Corner_2",
    [4] = "Corner_3",
    [5] = "Corner_4",
    [6] = "Corner_5",
    [7] = "Corner_6",
    [8] = "Corner_7",
    [9] = "Corner_8",
    [10] = "Corner_9",
    [11] = "Corner_10",
    [12] = "Corner_11",
    [13] = "Corner_12",
    [14] = "Corner_13"
}
_ENV.eHeroSkillType = {BattleSkill = 1, LifeSkill = 2, UltimateSkill = 3}
_ENV.eBattleSkillType = {Attack = 1, Recovery = 2, Defense = 3, Special = 4}
_ENV.eBattleSkillTypeColor = {
    [(_ENV.eBattleSkillType).Attack] = (Color.New)(0.82, 0.14, 0.14, 1),
    [(_ENV.eBattleSkillType).Recovery] = (Color.New)(0.57, 0.82, 0.16, 1),
    [(_ENV.eBattleSkillType).Defense] = (Color.New)(0.11, 0.63, 0.85, 1),
    [(_ENV.eBattleSkillType).Special] = (Color.New)(0.49, 0.54, 0.63, 1)
}
_ENV.eBuildingId = {
    OasisMainBuilding = 1001,
    OasisConstructionBureau = 1002,
    OasisEnergeyStation = 1003,
    OasisSearchTerminal = 1004,
    DimensionBuildingId = 1004,
    OasisLibrary = 1007,
    OasisTrainingBuilding = 1008,
    OasisResourceWarehouse = 1011,
    OasisFactory = 1012,
    OasisOverclockTower = 1013
}
_ENV.eBuildQueueType = {Oasis = 1, Sector = 2}
_ENV.eBattleState = {Init = 0, Deploy = 1, Running = 2, End = 3, Delete = 4}
_ENV.eGuideCondition = {
    None = 0,
    InHome = 1,
    InExploration = 2,
    InExplorationScene = 3,
    InBattleDeploy = 4,
    InSelectChip = 5,
    InBattleScene = 6,
    InEpTreasureRoom = 7,
    InEpEventRoom = 8,
    InSectorLevel = 9,
    InOassisBuildingDetail = 10,
    InFormation = 11,
    InSectorSceneNormal = 12,
    InMainScene = 13,
    InHeroStateUI = 14,
    InNewMonsterDetail = 15,
    InEpBattleResult = 16,
    InLottery = 17,
    InATHStrengthen = 18,
    FInHome = 101,
    FInSectorLevel = 109,
    FInSectorScene = 112
}
_ENV.eAudioSourceType = {
    BgmSource = 1,
    SfxSource = 2,
    LoopSource = 3,
    VoiceSource = 4
}
_ENV.eAudioVolumeType = {Bgm = 1, Sfx = 2, Voice = 3}
_ENV.eAuSelct = {
    Home = {
        name = "Selector_Mus_Home",
        base = "SelectorLabel_Base",
        oasis = "SelectorLabel_Oasis",
        sector = "SelectorLabel_Sector"
    },
    Sector = {
        name = "Selector_Mus_Sector",
        roomSelect = "SelectorLabel_LevelSelect",
        normalCombat = "SelectorLabel_NormalCombat",
        bossCombat = "SelectorLabel_BossCombat"
    }
}
_ENV.eAuCueSheet = {
    Ambience = "Ambience",
    CommonSkill = "Common Skill",
    Music = "Music",
    UI = "UI",
    AVG_gf = "AVG_gf",
    Prefix_Character = "Chara_",
    Prefix_Monster = "Mon_"
}
_ENV.eAvgTriggerType = {
    MainAvg = 1,
    MainAvgEp = 2,
    AvgDungeon = 3,
    AvgTask = 4,
    SubAvg = 5
}
_ENV.eSectorStageDifficult = {Normal = 1, Hard = 2, Endless = 3}
_ENV.TipContent = {
    empty = 1,
    achievement_taskNotComplete = 2,
    achievement_taskCompleted = 3,
    arithmetic_Strengthlimt = 4,
    arithmetic_HasInstalledInfo = 5,
    arithmetic_UsableSpaceInsufficient = 6,
    arithmetic_RepeatedATH = 7,
    arithmetic_InstallSuccess = 8,
    arithmetic_UninstallSuccess = 9,
    arithmetic_ReplaceSuccess = 10,
    arithmetic_Slot_HasFullLevel = 11,
    arithmetic_Slot_MaterialShot = 12,
    arithmetic_Slot_ConfirmDecompose = 13,
    arithmetic_Inherit_Lock = 14,
    arithmetic_Inherit_RepeateAttr = 15,
    arithmetic_Inherit_AttrQualitylimt = 16,
    arithmetic_Inherit_ItemInsufficient = 17,
    arithmetic_Inherit_Success = 18,
    arithmetic_optimal_ItemInsufficient = 19,
    arithmetic_optimal_Success = 20,
    arithmetic_optimal_Failure = 21,
    dorm_HouseRoomNumLimt = 22,
    dorm_NotSlelctRoom = 23,
    dorm_ConfirmDecomposeRoom = 24,
    dorm_BuyItemInsufficient = 25,
    eventRoom_ItemInfficient = 26,
    exploration_StartFailure = 27,
    exploration_SelectRoomFailure = 28,
    exploration_Reconstitution_AchieveChip = 29,
    exploration_Reconstitution_ChipOperateSuccess = 30,
    exploration_Reconstitution_SelectOneHero = 31,
    exploration_Store_BuyItemInsufficient = 32,
    exploration_Stroe_BuySuccess = 33,
    exploration_Treasure_AtLeastSelectOne = 34,
    exploration_Treasure_MoneyInsufficient = 35,
    exploration_Treasure_RefreshNumInsufficient = 36,
    exploration_Player_CantSelectRoom = 37,
    exploration_Player_ExitExpo = 38,
    exploration_Player_ExitExpoWithStaminaBack = 39,
    exploration_Reconstitution_MoneyInsufficient = 40,
    exploration_Reconstitution_SelectCountReachMax = 41,
    exploration_Reconstitution_NotSelectEnourhChip = 42,
    exploration_Event_GetItem = 119,
    exploration_Event_GetBuff = 120,
    exploration_Event_NotAchieved = 121,
    exploration_Store_Exit = 122,
    exploration_Store_Sell = 256,
    exploration_Store_SellSuc = 257,
    exploration_Upgrade_UpgradeItemInsufficient = 258,
    exploration_Upgrade_UpgradeItemSuccess = 259,
    exploration_Upgrade_UpgradeItemLevelMax = 285,
    factory_LineNumReachMax = 43,
    exploration_Level_Chip_Unlock = 350,
    hero_CantUpgrade = 44,
    hero_level_Full = 46,
    hero_level_UpgradeMaterialFull = 47,
    heroEnter_HasEnteredOtherBuilding = 48,
    name_Exist = 49,
    name_Illegal = 50,
    login_NoticeUserName = 51,
    login_IllegalServer = 52,
    login_EmptyName = 53,
    lottery_ItemInsufficient = 54,
    lottery_DailyLimtFull = 106,
    mail_Notice = 55,
    mail_NotHaveAvailableMail = 56,
    mail_NotHaveAvailableMailReward = 57,
    Building_ConstructQueueFull = 58,
    Building_NotFillConstructCodition = 59,
    Oasis_Building_Overlapping = 60,
    Oasis_Building_StartConstruct = 61,
    Building_LevelFull = 62,
    Building_NotFitUpgradeStatue = 64,
    Oasis_Building_StartUpgrade = 65,
    Building_Incomplete = 66,
    Building_NoticeConstructFinish = 67,
    ItemInWarehouseFull = 68,
    Building_UnsatisfMinialRewardCycle = 69,
    Building_GainReward = 70,
    Oasis_MainBuldingUnlockInfo = 71,
    QuickPurchase_LowerThanMinimal = 72,
    QuickPurchase_MoreThan100 = 73,
    QuickPurchase_CurrencyLimt = 74,
    QuickPurchase_CurrencyInsuficient = 75,
    Sector_Locked = 76,
    Sector_HasExpNotFinished = 77,
    Sector_IsExploringOtherSector = 78,
    Sector_InifinityName = 261,
    Sector_HaveToClearanceLastLevelToUnlock = 79,
    Sector_LackOfStamina = 80,
    Sector_HeroNumInsufficient = 81,
    Sector_SelectLevel = 82,
    Sector_BuildingConfirmFinish = 83,
    QuickFormat_HroeAlreadyInFormat = 84,
    SectorTask_TaskUndone = 85,
    SectorTask_CanObtainReward = 86,
    SectorTask_ObtainedReward = 87,
    Shop_MoneyInsufficient = 88,
    Shop_PurchaseSuccess = 89,
    Shop_Refresh_MoneyInsufficient = 90,
    Shop_RefreshNotice = 91,
    Shop_SoldOut = 92,
    Shop_ConfirmPurchase = 93,
    Train_HeroNotExist = 94,
    Train_HeroLevelFull = 95,
    Train_HeroIsTraining = 96,
    Train_HeroReachTheMaxTrainLevel = 97,
    Train_GlobleEXPNotEnough = 98,
    Train_SelectPlan = 99,
    Train_LockedInfo = 100,
    arithmetic_DecomposeInfo = 101,
    HeroEnter_notHaveLifeSkill = 107,
    FunctionUnlockDescription_Level = 108,
    FunctionUnlockDescription_Task = 109,
    FunctionUnlockDescription_SectorStage = 110,
    FunctionUnlockDescription_Building = 111,
    FunctionUnlockDescription_Friendship = 112,
    FunctionUnlockDescription_BattleDungeon = 262,
    Formation_MaxHeroCount = 113,
    LevelDetail_GiveupEp = 123,
    CanFitAccBuild = 128,
    Avg_SkipAllAvg = 129,
    Building_BuildingNoRes = 130,
    Ath_MaxCount = 139,
    Ath_EfficiencyUpContainOrangeAth = 140,
    LevelDetail_GiveupEpWithStaminaReturn = 141,
    LevelUp_Limit = 143,
    Ath_AreaUpExpIsFull = 200,
    Ath_CantSelectLockAth = 201,
    Ath_CantInstall = 202,
    Ath_NotOneReplaceOne = 203,
    CommonItemDetailNoDesc = 266,
    Ltr_PoolExpired = 300,
    ChipAttrIncreaseDes = 1013,
    CommanderDPSName = 1014,
    Dorm_ChangeBindConfirm = 2001,
    Dorm_FntConfirmEdit = 2002,
    Dorm_FntMaxCount = 2003,
    Dorm_SelectWall = 2004,
    Dorm_WallId = 2005,
    Dorm_RoomBindMax = 2006,
    Dorm_HouseBindMax = 2007,
    BattleDungeon_DailyLimit = 3000,
    Overclock_AssembleNumLimit = 114,
    Overclock_GInsufficient = 115,
    Overclock_DonorHaveUnlockChip = 116,
    exploration_Treasure_AlertNotSelectAllReward = 117,
    ExpiredMention = 124,
    Battle_noBattleRole = 125,
    CST_unlockTip = 127,
    ResourceOverflow = 138,
    hero_Skill_notOpenYet = 250,
    hero_Skill_unLockWhernReachStar = 251,
    hero_Skill_materialInsufficient = 252,
    hero_Skill_upgradeSuccess = 253,
    bannerJumpMention = 263,
    commonConfirm = 264,
    commonCancle = 265,
    notUnlockShopCantBuyStamina = 267,
    HasNewVersionToUpdate = 268,
    Shop_CanNotRefresh_LackOfItem = 277,
    Shop_CanNotRefresh_RefreshCountInsufficient = 278,
    Factory_HeroEnterLimit = 500,
    Factory_EnergyInsufficient = 501,
    Factory_MatInsufficient = 502,
    Factory_HeroEnterSuccess = 503,
    Factory_ConfirmSwitchHero = 504,
    Factory_OrderUnlock = 505,
    Factory_WarehousFull = 506,
    Friendship_SkillUpgrade_MatInsufficient = 520,
    Friendship_SkillUpgrade_LevelInsufficient = 521,
    UserInfo_CopyUIDDone = 540,
    not_get_gateinfo = 10001,
    ATH_Dungeon_Area_Extra_Msg = 3001,
    ATH_Dungeon_All_Area_Extra_Msg = 3002,
    ultimateSkillUpgrade = 601,
    Overload_Tip = 700,
    Overload_Atn_Buff_Tip = 701,
    Overload_Hp_Buff_Tip = 702,
    Overload_Time_Tip = 703,
    Overload_Buff_Tip = 704
}

