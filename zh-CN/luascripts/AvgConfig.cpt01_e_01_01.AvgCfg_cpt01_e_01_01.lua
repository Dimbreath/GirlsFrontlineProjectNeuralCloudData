-- params : ...
-- function num : 0 , upvalues : _ENV
local AvgCfg_cpt01_e_01_01 = {
[1] = {content = 10, contentType = 1, scrambleTypeWriter = true, 
images = {
{imgId = 1, imgType = 1, alpha = 1, imgPath = "cpt00/cpt00_e_bg001", fullScreen = true}
, 
{imgId = 2, imgType = 2, alpha = 0, imgPath = "cpt00/cpt00_e_bg004", fullScreen = true}
, 
{imgId = 3, imgType = 2, alpha = 0, imgPath = "cpt00/cpt00_e_bg005", fullScreen = true}
, 
{imgId = 101, imgType = 3, alpha = 0, imgPath = "persicaria_avg"}
, 
{imgId = 102, imgType = 3, alpha = 0, imgPath = "sol_avg"}
}
, 
audio = {
bgm = {stop = true, sheet = "Music"}
, 
sfx = {cue = "AVG_ElecSpace", sheet = "AVG_gf"}
}
}
, 
[2] = {content = 20, contentType = 1, scrambleTypeWriter = true}
, 
[3] = {content = 30, contentType = 1}
, 
[4] = {content = 40, contentType = 1}
, 
[5] = {content = 50, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 1, 
imgTween = {
{imgId = 3, delay = 0, duration = 1.5, alpha = 1}
, 
{imgId = 101, delay = 1.5, duration = 0, posId = 1, alpha = 0}
, 
{imgId = 101, delay = 1.5, duration = 0.2, posId = 2, alpha = 1}
}
, 
audio = {
bgm = {stop = false, cue = "Mus_Story_General", sheet = "Music", fadeIn = 2, fadeOut = 3}
, 
sfx = {cue = "AVG_tele_connect", sheet = "AVG_gf"}
}
}
, 
[6] = {content = 60, contentType = 3, speakerHeroId = 1003, speakerHeroPosId = 3, 
images = {
{imgId = 104, imgType = 3, alpha = 0, imgPath = "sol_avg", comm = true}
}
, 
imgTween = {
{imgId = 101, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = true}
, 
{imgId = 104, delay = 0, duration = 0, posId = 4, alpha = 0}
, 
{imgId = 104, delay = 0, duration = 0.2, posId = 4, alpha = 1}
}
, 
heroFace = {
{imgId = 104, faceId = 3}
}
}
, 
[7] = {content = 70, contentType = 3, speakerHeroId = 1003, speakerHeroPosId = 3, 
heroFace = {
{imgId = 104, faceId = 0}
}
}
, 
[8] = {content = 80, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 1, 
imgTween = {
{imgId = 101, delay = 0, duration = 0, posId = 2, alpha = 1, isDark = false}
, 
{imgId = 104, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = true}
}
, 
heroFace = {
{imgId = 101, faceId = 4}
}
}
, 
[9] = {content = 90, contentType = 3, speakerHeroId = 1003, speakerHeroPosId = 3, 
imgTween = {
{imgId = 101, delay = 0, duration = 0.2, posId = 2, alpha = 2, isDark = true}
, 
{imgId = 104, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = false}
}
}
, 
[10] = {content = 100, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 1, 
imgTween = {
{imgId = 101, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = false}
, 
{imgId = 104, isDark = true}
}
, 
heroFace = {
{imgId = 101, faceId = 0}
}
}
, 
[11] = {content = 110, contentType = 3, speakerHeroId = 1003, speakerHeroPosId = 3, 
imgTween = {
{imgId = 101, delay = 0, duration = 0.2, posId = 2, alpha = 2, isDark = true}
, 
{imgId = 104, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = false}
}
}
, 
[12] = {content = 120, contentType = 3, speakerHeroId = 1003, speakerHeroPosId = 3}
, 
[13] = {content = 130, contentType = 3, speakerHeroId = 1003, speakerHeroPosId = 3, 
heroFace = {
{imgId = 104, faceId = 3}
}
}
, 
[14] = {content = 140, contentType = 3, speakerHeroId = 1003, speakerHeroPosId = 3}
, 
[15] = {content = 150, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 1, 
imgTween = {
{imgId = 101, delay = 0, duration = 0, posId = 2, alpha = 1, isDark = false}
, 
{imgId = 104, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = true}
}
, 
audio = {
bgm = {stop = true}
, 
sfx = {cue = "AVG_whitenoise", sheet = "AVG_gf"}
}
}
, 
[16] = {content = 160, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 1}
, 
[17] = {content = 170, contentType = 3, speakerHeroId = 1003, speakerHeroPosId = 3, 
imgTween = {
{imgId = 101, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = true}
, 
{imgId = 104, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = false}
}
, 
audio = {
bgm = {stop = false, cue = "Mus_Story_BattleTension", sheet = "Music", fadeIn = 2}
}
, 
heroFace = {
{imgId = 104, faceId = 4}
}
}
, 
[18] = {content = 180, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 1, 
imgTween = {
{imgId = 101, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = false}
, 
{imgId = 104, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = true}
}
, 
heroFace = {
{imgId = 101, faceId = 4}
}
}
, 
[19] = {
heroFace = {
{imgId = 101, faceId = 0}
}
, content = 190, contentType = 2, 
images = {
{imgId = 104, imgType = 3, alpha = 0, imgPath = "sol_avg", comm = false}
}
, 
imgTween = {
{imgId = 101, delay = 0, duration = 0.6, posId = 2, alpha = 0}
, 
{imgId = 104, delay = 0, duration = 0.2, posId = 4, alpha = 0}
}
, 
audio = {
sfx = {cue = "AVG_tele_disconnect", sheet = "AVG_gf"}
}
}
, 
[20] = {content = 200, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
imgTween = {
{imgId = 101, posId = 3}
}
, 
heroFace = {
{imgId = 101, faceId = 4}
}
}
, 
[21] = {content = 210, contentType = 4, speakerName = 12, 
imgTween = {
{imgId = 101, isDark = true}
}
, 
audio = {
sfx = {cue = "Skill_Guardian_01_Start", sheet = "Mon_Guardian"}
}
}
, 
[22] = {content = 220, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
imgTween = {
{imgId = 101, isDark = false}
}
}
, 
[23] = {content = 230, contentType = 4, speakerName = 12, contentShake = true, 
imgTween = {
{imgId = 101, isDark = true}
}
, 
audio = {
sfx = {cue = "Atk_Guardian_02", sheet = "Mon_Guardian"}
}
, 
heroFace = {
{imgId = 101, faceId = 0}
}
}
, 
[24] = {content = 240, contentType = 4, speakerName = 11, 
heroFace = {
{imgId = 101, faceId = 4}
}
}
, 
[25] = {content = 250, contentType = 4, speakerName = 11, 
heroFace = {
{imgId = 101, faceId = 0}
}
}
, 
[26] = {content = 260, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
imgTween = {
{imgId = 101, isDark = false}
}
}
, 
[27] = {content = 270, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
imgTween = {
{imgId = 101, isDark = false}
}
}
, 
[28] = {
audio = {
sfx = {cue = "AVG_RunStep", sheet = "AVG_gf"}
}
, content = 280, contentType = 4, speakerName = 11, 
imgTween = {
{imgId = 3, duration = 0.6, alpha = 0}
, 
{imgId = 3, delay = 1.5, duration = 0.6, posId = 0, alpha = 1}
, 
{imgId = 101, delay = 0, duration = 0.6, posId = 3, alpha = 0}
, 
{imgId = 101, delay = 1.5, duration = 0.6, posId = 3, alpha = 1, isDark = true}
}
, 
heroFace = {
{imgId = 101, faceId = 0}
}
}
, 
[29] = {
heroFace = {
{imgId = 101, faceId = 4}
}
, content = 290, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
imgTween = {
{imgId = 101, isDark = false}
}
}
, 
[30] = {content = 300, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2}
, 
[31] = {content = 310, contentType = 4, speakerName = 11, 
imgTween = {
{imgId = 101, isDark = true}
}
, 
heroFace = {
{imgId = 101, faceId = 0}
}
}
, 
[32] = {content = 320, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
imgTween = {
{imgId = 101, isDark = false}
}
, 
heroFace = {
{imgId = 101, faceId = 5}
}
}
, 
[33] = {content = 330, contentType = 4, speakerName = 11, 
imgTween = {
{imgId = 101, isDark = true}
}
}
, 
[34] = {content = 340, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
imgTween = {
{imgId = 101, isDark = false}
}
, 
heroFace = {
{imgId = 101, faceId = 0}
}
}
, 
[35] = {content = 350, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2}
, 
[36] = {content = 360, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
heroFace = {
{imgId = 101, faceId = 4}
}
}
, 
[37] = {content = 370, contentType = 4, speakerName = 11, 
imgTween = {
{imgId = 101, isDark = true}
}
, 
heroFace = {
{imgId = 101, faceId = 0}
}
}
, 
[38] = {content = 380, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
imgTween = {
{imgId = 101, isDark = false}
}
}
, 
[39] = {
imgTween = {
{imgId = 101, delay = 0, duration = 1, posId = 3, alpha = 1, shake = true}
}
, 
audio = {
{cue = "Atk_Raider_01", sheet = "Mon_Raider"}
; 
sfx = {cue = "AVG_Explode", sheet = "AVG_gf"}
}
, 
heroFace = {
{imgId = 101, faceId = 4}
}
, autoContinue = true}
, 
[40] = {content = 400, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
imgTween = {
{imgId = 101, isDark = false}
}
}
, 
[41] = {content = 410, contentType = 4, speakerName = 12, 
imgTween = {
{imgId = 101, isDark = true}
}
, 
audio = {
sfx = {cue = "Skill_Guardian_01_Start", sheet = "Mon_Guardian"}
}
}
, 
[42] = {content = 420, contentType = 4, speakerName = 11}
, 
[43] = {content = 430, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, contentShake = true, 
imgTween = {
{imgId = 101, isDark = false}
}
}
, 
[44] = {content = 440, contentType = 4, speakerName = 12, 
imgTween = {
{imgId = 101, isDark = true}
}
, 
audio = {
sfx = {cue = "Skill_Chong_01", sheet = "Mon_Chong"}
}
}
, 
[45] = {content = 450, contentType = 4, speakerName = 11}
, 
[46] = {content = 460, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
imgTween = {
{imgId = 101, isDark = false}
}
}
, 
[47] = {content = 470, contentType = 2, 
imgTween = {
{imgId = 101, isDark = true}
}
, 
heroFace = {
{imgId = 101, faceId = 5}
}
}
, 
[48] = {content = 480, contentType = 4, speakerName = 11}
, 
[49] = {content = 490, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
imgTween = {
{imgId = 101, isDark = false}
}
}
, 
[50] = {content = 500, contentType = 4, speakerName = 11, 
imgTween = {
{imgId = 101, isDark = true}
}
}
, 
[51] = {content = 510, contentType = 2}
, 
[52] = {content = 520, contentType = 2}
, 
[53] = {
audio = {
sfx = {cue = "Atk_Persicaria_01_Hit", sheet = "Chara_Persicaria"}
}
, content = 540, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
imgTween = {
{imgId = 101, delay = 0, duration = 0.2, posId = 3, alpha = 1, isDark = false}
}
, 
heroFace = {
{imgId = 101, faceId = 4}
}
}
, 
[54] = {content = 550, contentType = 4, speakerName = 11, 
imgTween = {
{imgId = 101, isDark = true}
}
}
, 
[55] = {content = 560, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
imgTween = {
{imgId = 101, isDark = false}
}
}
, 
[56] = {content = 570, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2}
, 
[57] = {content = 580, contentType = 4, speakerName = 11, 
imgTween = {
{imgId = 101, isDark = true}
}
}
, 
[58] = {content = 590, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
imgTween = {
{imgId = 101, isDark = false}
}
}
, 
[59] = {
audio = {
sfx = {cue = "Skill_Persicaria_Ex_Start", sheet = "Chara_Persicaria"}
}
, content = 600, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2}
, 
[60] = {content = 610, contentType = 5, tipsTypeWriter = true, tipsShowDuration = 0.2, autoContinue = true, 
imgTween = {
{imgId = 101, isDark = true}
}
}
, 
[61] = {content = 620, contentType = 4, speakerName = 11, 
imgTween = {
{imgId = 101, isDark = false}
}
}
, 
[62] = {content = 630, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
imgTween = {
{imgId = 101, isDark = false}
}
}
, 
[63] = {content = 640, contentType = 5, tipsTypeWriter = true, tipsShowDuration = 0.2, autoContinue = true, 
imgTween = {
{imgId = 101, isDark = true}
}
, 
audio = {
sfx = {cue = "AVG_ElecSpace", sheet = "AVG_gf", audioId = 6}
}
}
, 
[64] = {content = 641, contentType = 5, tipsTypeWriter = true, tipsShowDuration = 0.2, autoContinue = true}
, 
[65] = {content = 642, contentType = 5, tipsTypeWriter = true, tipsShowDuration = 0.2}
, 
[66] = {content = 650, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, contentShake = true, 
imgTween = {
{imgId = 101, isDark = false}
}
}
, 
[67] = {content = 660, contentType = 5, tipsTypeWriter = true, tipsShowDuration = 0.1, autoContinue = true, 
imgTween = {
{imgId = 101, isDark = true}
}
}
, 
[68] = {content = 660, contentType = 5, tipsTypeWriter = true, tipsShowDuration = 0.1, autoContinue = true, 
imgTween = {
{imgId = 101, isDark = true}
}
}
, 
[69] = {content = 660, contentType = 5, tipsTypeWriter = true, tipsShowDuration = 0.1, 
imgTween = {
{imgId = 101, isDark = true}
}
}
, 
[70] = {
imgTween = {
{imgId = 3, duration = 3, shake = true}
, 
{imgId = 101, delay = 3, duration = 0.6, posId = 3, alpha = 0}
}
, 
audio = {
sfx = {cue = "AVG_Explode", sheet = "AVG_gf"}
}
, content = 670, contentType = 2}
, 
[71] = {
imgTween = {
{imgId = 3, delay = 1, duration = 3, posId = 0, alpha = 0}
}
, 
audio = {
sfx = {cue = "AVG_tinnitus", sheet = "AVG_gf"}
, 
bgm = {stop = true, cue = "Mus_Story_BattleTension", sheet = "Music", fadeOut = 2}
}
, content = 680, contentType = 4, speakerName = 11}
, 
[72] = {content = 690, contentType = 4, speakerName = 11}
, 
[73] = {content = 700, contentType = 2}
, 
[74] = {content = 710, contentType = 2, 
audio = {
sfx = {cue = "AVG_Heartbeat", sheet = "AVG_gf"}
}
}
, 
[75] = {content = 720, contentType = 4, speakerName = 691}
, 
[76] = {content = 730, contentType = 2}
}
return AvgCfg_cpt01_e_01_01

