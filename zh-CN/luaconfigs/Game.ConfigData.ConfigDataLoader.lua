-- params : ...
-- function num : 0 , upvalues : _ENV
require("Game.ConfigData.ConfigData")
local ConfigDataLoader = {}
local data_name_list = {
{"init_logic", "init_logic"}
, 
{"locale_text", "locale_text"}
, 
{"factory", "factory"}
, 
{"shop", "shop"}
, 
{"shop_normal", "shop_normal"}
, 
{"item_currency", "item_currency_price"}
, 
{"lottery_para", "lottery_para"}
, 
{"lottery", "lottery"}
, 
{"lottery_reward_pool", "lottery_reward_pool"}
, 
{"building", "oasis_building"}
, 
{"oasis_weather_preset", "oasis_weather_preset"}
, 
{"oasis_building_model", "oasis_building_model"}
, 
{"buildingLevel", "oasis_building_level"}
, 
{"buildingBuff", "building_buff"}
, 
{"training", "training"}
, 
{"task", "task"}
, 
{"taskStep", "task_step"}
, 
{"sectorAchievement", "sector_achievement"}
, 
{"game_config", "game_config"}
, 
{"hero_data", "hero_data"}
, 
{"hero_level", "hero_level"}
, 
{"hero_skill", "hero_skill"}
, 
{"hero_skill_level", "hero_skill_level"}
, 
{"hero_rank", "hero_rank"}
, 
{"hero_star", "hero_star"}
, 
{"item", "item"}
, 
{"sector", "sector"}
, 
{"sector_stage", "sector_stage"}
, 
{"sector_unlock_mention", "sector_unlock_mention"}
, 
{"active", "active"}
, 
{"achievement_level", "achievement_level"}
, 
{"achievement", "achievement"}
, 
{"chip", "chip"}
, 
{"chip_tag", "chip_tag"}
, 
{"chip_intro", "chip_intro"}
, 
{"resource_model", "resource_model"}
, 
{"reward_purchase", "reward_purchase"}
, 
{"camp", "camp"}
, 
{"career", "career"}
, 
{"camp_connection", "camp_connection"}
, 
{"camp_active_skill", "camp_active_skill"}
, 
{"exploration_treasure", "exploration_treasure"}
, 
{"treasure_logic2", "treasure_logic2"}
, 
{"monster", "monster"}
, 
{"event", "event"}
, 
{"event_choice", "event_choice"}
, 
{"event_upgrade", "event_upgrade"}
, 
{"event_jump", "event_jump"}
, 
{"event_assist", "event_assist"}
, 
{"exploration_reconsitution", "exploration_reconsitution"}
, 
{"exploration", "exploration"}
, 
{"exploration_monster_room", "exploration_monster_room"}
, 
{"exploration_type", "exploration_type"}
, 
{"ep_function_pool", "exploration_function_pool"}
, 
{"attribute", "attribute"}
, 
{"exploration_buff", "exploration_buff"}
, 
{"exploration_roomtype", "exploration_roomtype"}
, 
{"exploration_shop", "exploration_shop"}
, 
{"audio", "audio"}
, 
{"audio_category", "audio_category"}
, 
{"audio_voice", "audio_voice"}
, 
{"audio_voice_point", "audio_voice_point"}
, 
{"audio_voice_hero", "audio_voice_hero"}
, 
{"system_open", "system_open"}
, 
{"guide", "guide"}
, 
{"guide_step", "guide_step"}
, 
{"tips_guide", "tips_guide"}
, 
{"oasis_area", "oasis_area"}
, 
{"system_jump", "system_jump"}
, 
{"arithmetic", "arithmetic"}
, 
{"ath_affix_pool", "ath_affix_pool"}
, 
{"ath_attribute_pool", "ath_attribute_pool"}
, 
{"ath_efficiency", "ath_efficiency"}
, 
{"ath_suit", "ath_suit"}
, 
{"ath_area", "ath_area"}
, 
{"ath_shard", "ath_shard"}
, 
{"ath_affix_lv", "ath_affix_lv"}
, 
{"ath_reconsitution", "ath_reconsitution"}
, 
{"anti_addiction", "anti_addiction"}
, 
{"dorm_house", "dorm_house"}
, 
{"dorm_room", "dorm_room"}
, 
{"dorm_comfort", "dorm_comfort"}
, 
{"dorm_furniture", "dorm_furniture"}
, 
{"dorm_ai", "dorm_ai"}
, 
{"dorm_action", "dorm_action"}
, 
{"dorm_interpoint", "dorm_interpoint"}
, 
{"tip_language", "tip_language"}
, 
{"star_score", "star_score"}
, 
{"life_skill", "life_skill"}
, 
{"friendship_level", "friendship_level"}
, 
{"friendship_gift", "friendship_gift"}
, 
{"friendship_hero", "friendship_hero"}
, 
{"friendship_foster", "friendship_foster"}
, 
{"friendship_total_level", "friendship_total_level"}
, 
{"battle_dungeon", "battle_dungeon"}
, 
{"material_dungeon", "material_dungeon"}
, 
{"hero_score", "hero_score"}
, 
{"scene", "scene"}
, 
{"level_arrange", "level_arrange"}
, 
{"overclock", "overclock"}
, 
{"event_random", "event_random"}
, 
{"story_avg", "story_avg"}
, 
{"story_condition_text", "story_condition_text"}
, 
{"commander_skill", "commander_skill"}
, 
{"commander_skill_unlock", "commander_skill_unlock"}
, 
{"commander_skill_level", "commander_skill_level"}
, 
{"commander_skill_master_level", "commander_skill_master_level"}
, 
{"monster_tag", "monster_tag"}
, 
{"battle_grid", "battle_grid"}
, 
{"shop_page", "shop_page"}
, 
{"shop_hero", "shop_hero"}
, 
{"shop_resource", "shop_resource"}
, 
{"shop_recharge", "shop_recharge"}
, 
{"exploration_discard", "exploration_discard"}
, 
{"banner", "banner"}
, 
{"avg_character", "avg_character"}
, 
{"homeside_info", "homeside_info"}
, 
{"homeside_switch", "homeside_switch"}
, 
{"overload", "overload"}
, 
{"dungeon_info", "dungeon_info"}
, 
{"attr_combat", "attr_combat"}
, 
{"battle_skill", "battle_skill"}
, 
{"battle_creation", "battle_creation"}
, 
{"performance_device", "performance_device"}
, 
{"performance_gpu", "performance_gpu"}
, 
{"performance_setting", "performance_setting"}
, 
{"performance_typeinfo", "performance_typeinfo"}
, 
{"hero_potential", "hero_potential"}
, 
{"daily_challenge", "daily_challenge"}
, 
{"skill_label_info", "skill_label_info"}
, 
{"dungeonSubInfo", "dungeonSubInfo"}
, 
{"factory_order", "factory_order"}
, 
{"rookie_star", "rookie_star"}
, 
{"dungeon_material_count", "dungeon_material_count"}
, 
{"offline_push", "offline_push"}
, 
{"loading_tips", "loading_tips"}
, 
{"pay_sdk", "pay_sdk"}
, 
{"pay_product", "pay_product"}
, 
{"pay_recharge", "pay_recharge"}
, 
{"battlepass_type", "battlepass_type"}
, 
{"battlepass", "battlepass"}
, 
{"month_card", "month_card"}
, 
{"daily_bonus", "daily_bonus"}
, 
{"mail", "mail"}
, 
{"skin", "skin"}
, 
{"skinTheme", "skinTheme"}
, 
{"shop_classification", "shop_classification"}
, 
{"shop_classification", "shop_classification"}
, 
{"navigation_main", "navigation_main"}
, 
{"navigation_sub", "navigation_sub"}
, 
{"weekly_challenge", "weekly_challenge"}
, 
{"banner_tv", "banner_tv"}
, 
{"weekly_challenge_score", "weekly_challenge_score"}
, 
{"weekly_challenge_rank_reward", "weekly_challenge_rank_reward"}
, 
{"weekly_challenge_base_reward", "weekly_challenge_base_reward"}
, 
{"weekly_challenge_shop", "weekly_challenge_shop"}
, 
{"weekly_challenge_config", "weekly_challenge_config"}
, 
{"sign_activity", "sign_activity"}
, 
{"sign_activity_award", "sign_activity_award"}
, 
{"pay_gift_type", "pay_gift_type"}
, 
{"shop_recommend", "shop_recommend"}
, 
{"friendship_award", "friendship_award"}
, 
{"activity_name", "activity_name"}
, 
{"monster_level", "monster_level"}
, 
{"wave_battles", "wave_battles"}
, 
{"endless", "endless"}
, 
{"endless_layer", "endless_layer"}
, 
{"recommend_dialogue", "recommend_dialogue"}
, 
{"warehouse", "warehouse"}
, 
{"sector_career_info", "sector_career_info"}
}
ConfigDataLoader.LoadConfigHead = "LuaConfigs."
ConfigDataLoader.GetConfigNameList = function()
  -- function num : 0_0 , upvalues : data_name_list
  return data_name_list
end

ConfigDataLoader.AfterLoadConfigComplete = function()
  -- function num : 0_1 , upvalues : data_name_list, _ENV
  data_name_list = nil
  ConfigData:InitConfigData()
  ;
  ((CS.GameData).instance):InitGameConfigFromLua(ConfigData.game_config, ConfigData.buildinConfig)
  require("Game.ConfigData.LanguageUtil")
end

return ConfigDataLoader

