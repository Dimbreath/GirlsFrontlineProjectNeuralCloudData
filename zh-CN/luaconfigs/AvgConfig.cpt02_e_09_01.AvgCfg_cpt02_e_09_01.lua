-- params : ...
-- function num : 0 , upvalues : _ENV
local AvgCfg_cpt02_e_09_01 = {
[1] = {content = 10, contentType = 3, speakerHeroId = 21, speakerHeroPosId = 2, bgColor = 2, 
images = {
{imgId = 2, imgType = 2, alpha = 0, imgPath = "cpt02/cpt02_e_bg004_2", fullScreen = true}
, 
{imgId = 101, imgType = 3, alpha = 0, imgPath = "persicaria_avg"}
, 
{imgId = 102, imgType = 3, alpha = 0, imgPath = "anna_avg"}
, 
{imgId = 103, imgType = 3, alpha = 0, imgPath = "sol_avg"}
, 
{imgId = 104, imgType = 3, alpha = 0, imgPath = "simo_avg"}
, 
{imgId = 105, imgType = 3, alpha = 0, imgPath = "croque_avg", 
rot = {0, 180, 0}
}
, 
{imgId = 19, imgType = 3, alpha = 0, imgPath = "olivia_avg"}
, 
{imgId = 20, imgType = 3, alpha = 0, imgPath = "arrow_avg"}
, 
{imgId = 21, imgType = 3, alpha = 0, imgPath = "mara_weapon_avg"}
}
, 
imgTween = {
{imgId = 2, delay = 0, duration = 0.6, alpha = 1}
, 
{imgId = 21, delay = 0, duration = 0, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 21, delay = 0, duration = 0.6, posId = 3, alpha = 1, isDark = false}
}
, 
audio = {
bgm = {stop = false, cue = "Mus_Story_Purifier", sheet = "Music", fadeIn = 3, fadeOut = 3}
}
, 
heroFace = {
{imgId = 21, faceId = 4}
}
}
, 
[2] = {content = 20, contentType = 3, speakerHeroId = 1003, speakerHeroPosId = 2, 
imgTween = {
{imgId = 21, delay = 0, duration = 0.2, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 103, delay = 0, duration = 0, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 103, delay = 0, duration = 0.2, posId = 3, alpha = 1, isDark = false}
}
, 
heroFace = {
{imgId = 103, faceId = 4}
}
}
, 
[3] = {content = 30, contentType = 3, speakerHeroId = 21, speakerHeroPosId = 2, 
imgTween = {
{imgId = 103, delay = 0, duration = 0.2, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 21, delay = 0, duration = 0, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 21, delay = 0, duration = 0.2, posId = 3, alpha = 1, isDark = false}
}
}
, 
[4] = {content = 40, contentType = 3, speakerHeroId = 21, speakerHeroPosId = 2}
, 
[5] = {content = 50, contentType = 3, speakerHeroId = 21, speakerHeroPosId = 2, 
imgTween = {
{imgId = 21, delay = 0, duration = 0.3, posId = 3, alpha = 1, shake = true, isDark = false}
}
}
, 
[6] = {content = 60, contentType = 3, speakerHeroId = 21, speakerHeroPosId = 2, contentShake = true, 
imgTween = {
{imgId = 21, delay = 0, duration = 0.6, posId = 3, alpha = 1, shake = true, isDark = false}
}
, 
audio = {
sfx = {cue = "Atk_Mala_03", sheet = "Mon_Mala"}
}
, 
heroFace = {
{imgId = 21, faceId = 6}
}
}
, 
[7] = {content = 70, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
imgTween = {
{imgId = 21, delay = 0, duration = 0.2, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 101, delay = 0, duration = 0, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 101, delay = 0, duration = 0.2, posId = 3, alpha = 1, isDark = false}
}
, 
heroFace = {
{imgId = 101, faceId = 4}
}
}
, 
[8] = {content = 80, contentType = 2, 
imgTween = {
{imgId = 101, delay = 0, duration = 0.2, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 2, duration = 0.2, shake = true}
}
, 
audio = {
sfx = {cue = "AVG_Door_Hit", sheet = "AVG_gf"}
}
}
, 
[9] = {content = 90, contentType = 2, 
audio = {
sfx = {cue = "Skill_Sol_Passive", sheet = "Chara_Sol"}
}
}
, 
[10] = {content = 100, contentType = 3, speakerHeroId = 21, speakerHeroPosId = 2, 
imgTween = {
{imgId = 21, delay = 0, duration = 0, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 21, delay = 0, duration = 0.2, posId = 3, alpha = 1, isDark = false}
}
}
, 
[11] = {content = 110, contentType = 3, speakerHeroId = 21, speakerHeroPosId = 2}
, 
[12] = {content = 120, contentType = 3, speakerHeroId = 1002, speakerHeroPosId = 1, 
imgTween = {
{imgId = 21, delay = 0, duration = 0.2, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 102, delay = 0, duration = 0, posId = 2, alpha = 0, isDark = false}
, 
{imgId = 102, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = false}
, 
{imgId = 103, delay = 0, duration = 0, posId = 4, alpha = 0, isDark = true}
, 
{imgId = 103, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = true}
}
, 
heroFace = {
{imgId = 102, faceId = 6}
, 
{imgId = 103, faceId = 4}
}
}
, 
[13] = {content = 130, contentType = 3, speakerHeroId = 1002, speakerHeroPosId = 1}
, 
[14] = {content = 140, contentType = 3, speakerHeroId = 1002, speakerHeroPosId = 1}
, 
[15] = {content = 150, contentType = 3, speakerHeroId = 1003, speakerHeroPosId = 3, 
imgTween = {
{imgId = 102, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = true}
, 
{imgId = 103, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = false}
}
}
, 
[16] = {content = 160, contentType = 3, speakerHeroId = 1003, speakerHeroPosId = 3, 
heroFace = {
{imgId = 103, faceId = 3}
}
}
, 
[17] = {
imgTween = {
{imgId = 102, delay = 0, posId = 1, alpha = 0, isDark = true}
, 
{imgId = 103, posId = 3, duration = 0.1, alpha = 1, isDark = false}
, 
{imgId = 103, delay = 0.2, shake = true, duration = 0.2, alpha = 1, isDark = false}
, 
{imgId = 103, delay = 0, duration = 0.2, posId = 3, delay = 0.5, alpha = 0, isDark = false}
, 
{imgId = 2, delay = 1.5, duration = 1, alpha = 0}
}
, 
audio = {
sfx = {cue = "Skill_Sol_Passive", sheet = "Chara_Sol"}
, 
bgm = {stop = true}
}
, autoContinue = true}
, 
[18] = {content = 180, contentType = 3, speakerHeroId = 1003, speakerHeroPosId = 3, 
imgTween = {
{imgId = 2, duration = 1, alpha = 1}
, 
{imgId = 102, delay = 0, duration = 0, posId = 2, alpha = 0, isDark = true}
, 
{imgId = 102, delay = 0, duration = 1, posId = 2, alpha = 1, isDark = true}
, 
{imgId = 103, delay = 0, duration = 0, posId = 4, alpha = 0, isDark = false}
, 
{imgId = 103, delay = 0, duration = 1, posId = 4, alpha = 1, isDark = false}
}
, 
audio = {
bgm = {cue = "Mus_Story_General", sheet = "Music", fadeIn = 2, fadeOut = 3}
}
, 
heroFace = {
{imgId = 103, faceId = 0}
, 
{imgId = 102, faceId = 2}
}
}
, 
[19] = {content = 190, contentType = 3, speakerHeroId = 1002, speakerHeroPosId = 1, 
imgTween = {
{imgId = 102, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = false}
, 
{imgId = 103, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = true}
}
}
, 
[20] = {content = 200, contentType = 3, speakerHeroId = 1003, speakerHeroPosId = 3, 
imgTween = {
{imgId = 102, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = true}
, 
{imgId = 103, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = false}
}
}
, 
[21] = {content = 210, contentType = 3, speakerHeroId = 1002, speakerHeroPosId = 1, 
imgTween = {
{imgId = 103, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = true}
, 
{imgId = 102, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = false}
}
}
, 
[22] = {content = 220, contentType = 3, speakerHeroId = 1002, speakerHeroPosId = 1}
, 
[23] = {content = 230, contentType = 3, speakerHeroId = 1003, speakerHeroPosId = 3, 
imgTween = {
{imgId = 103, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = false}
, 
{imgId = 102, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = true}
}
, 
heroFace = {
{imgId = 103, faceId = 5}
}
}
, 
[24] = {content = 240, contentType = 3, speakerHeroId = 19, speakerHeroPosId = 2, 
imgTween = {
{imgId = 103, delay = 0, duration = 0.2, posId = 4, alpha = 0, isDark = false}
, 
{imgId = 102, delay = 0, duration = 0.2, posId = 2, alpha = 0, isDark = true}
, 
{imgId = 19, delay = 0, duration = 0, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 19, delay = 0, duration = 0.2, posId = 3, alpha = 1, isDark = false}
}
}
, 
[25] = {content = 250, contentType = 3, speakerHeroId = 1005, speakerHeroPosId = 2, 
imgTween = {
{imgId = 19, delay = 0, duration = 0.2, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 105, delay = 0, duration = 0, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 105, delay = 0, duration = 0.2, posId = 3, alpha = 1, isDark = false}
}
, 
heroFace = {
{imgId = 105, faceId = 5}
}
}
, 
[26] = {content = 260, contentType = 3, speakerHeroId = 19, speakerHeroPosId = 2, 
imgTween = {
{imgId = 105, delay = 0, duration = 0.2, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 19, delay = 0, duration = 0, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 19, delay = 0, duration = 0.2, posId = 3, alpha = 1, isDark = false}
}
}
, 
[27] = {content = 270, contentType = 3, speakerHeroId = 19, speakerHeroPosId = 1, 
imgTween = {
{imgId = 19, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = false}
, 
{imgId = 20, delay = 0, duration = 0, posId = 4, alpha = 0, isDark = true}
, 
{imgId = 20, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = true}
}
, 
heroFace = {
{imgId = 19, faceId = 4}
}
}
, 
[28] = {content = 280, contentType = 3, speakerHeroId = 19, speakerHeroPosId = 1, 
heroFace = {
{imgId = 19, faceId = 0}
}
}
, 
[29] = {content = 290, contentType = 3, speakerHeroId = 20, speakerHeroPosId = 3, 
imgTween = {
{imgId = 19, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = true}
, 
{imgId = 20, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = false}
}
}
, 
[30] = {content = 300, contentType = 3, speakerHeroId = 19, speakerHeroPosId = 1, 
imgTween = {
{imgId = 19, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = false}
, 
{imgId = 20, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = true}
}
}
, 
[31] = {content = 310, contentType = 3, speakerHeroId = 1002, speakerHeroPosId = 2, 
imgTween = {
{imgId = 19, delay = 0, duration = 0.2, posId = 2, alpha = 0, isDark = false}
, 
{imgId = 20, delay = 0, duration = 0.2, posId = 4, alpha = 0, isDark = true}
, 
{imgId = 102, delay = 0, duration = 0, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 102, delay = 0, duration = 0.2, posId = 3, alpha = 1, isDark = false}
}
}
, 
[32] = {content = 320, contentType = 3, speakerHeroId = 1002, speakerHeroPosId = 2, 
heroFace = {
{imgId = 102, faceId = 5}
}
}
, 
[33] = {content = 330, contentType = 3, speakerHeroId = 1004, speakerHeroPosId = 2, 
imgTween = {
{imgId = 102, delay = 0, duration = 0.2, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 104, delay = 0, duration = 0, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 104, delay = 0, duration = 0.2, posId = 3, alpha = 1, isDark = false}
}
, 
audio = {
bgm = {stop = true, cue = "Mus_Story_BattleTension", sheet = "Music"}
}
}
, 
[34] = {content = 340, contentType = 3, speakerHeroId = 1002, speakerHeroPosId = 2, 
imgTween = {
{imgId = 104, delay = 0, duration = 0.2, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 102, delay = 0, duration = 0, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 102, delay = 0, duration = 0.2, posId = 3, alpha = 1, isDark = false}
}
, 
heroFace = {
{imgId = 102, faceId = 6}
}
}
, 
[35] = {
heroFace = {
{imgId = 104, faceId = 0}
}
, content = 350, contentType = 3, speakerHeroId = 1004, speakerHeroPosId = 2, 
imgTween = {
{imgId = 102, delay = 0, duration = 0.2, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 104, delay = 0, duration = 0, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 104, delay = 0, duration = 0.2, posId = 3, alpha = 1, isDark = false}
}
}
, 
[36] = {content = 360, contentType = 2, 
imgTween = {
{imgId = 104, delay = 0, duration = 0.2, posId = 3, alpha = 0, isDark = false}
}
, 
heroFace = {
{imgId = 104, faceId = 0}
}
}
, 
[37] = {content = 370, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 2, 
imgTween = {
{imgId = 101, delay = 0, duration = 0, posId = 3, alpha = 0, isDark = false}
, 
{imgId = 101, delay = 0, duration = 0.2, posId = 3, alpha = 1, isDark = false}
}
, 
heroFace = {
{imgId = 101, faceId = 5}
}
}
, 
[38] = {content = 380, contentType = 3, speakerHeroId = 20, speakerHeroPosId = 3, 
imgTween = {
{imgId = 101, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = true}
, 
{imgId = 20, delay = 0, duration = 0, posId = 4, alpha = 0, isDark = false}
, 
{imgId = 20, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = false}
}
}
, 
[39] = {content = 390, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 1, 
imgTween = {
{imgId = 20, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = true}
, 
{imgId = 101, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = false}
}
}
, 
[40] = {content = 400, contentType = 3, speakerHeroId = 1002, speakerHeroPosId = 1, 
imgTween = {
{imgId = 101, delay = 0, duration = 0.2, posId = 2, alpha = 0, isDark = false}
, 
{imgId = 102, delay = 0, duration = 0, posId = 2, alpha = 0, isDark = false}
, 
{imgId = 102, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = false}
, 
{imgId = 20, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = true}
}
}
, 
[41] = {content = 410, contentType = 3, speakerHeroId = 1002, speakerHeroPosId = 1, 
heroFace = {
{imgId = 102, faceId = 2}
}
}
, 
[42] = {content = 420, contentType = 3, speakerHeroId = 1002, speakerHeroPosId = 1}
, 
[43] = {content = 430, contentType = 3, speakerHeroId = 20, speakerHeroPosId = 3, 
imgTween = {
{imgId = 102, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = true}
, 
{imgId = 20, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = false}
}
}
, 
[44] = {content = 440, contentType = 3, speakerHeroId = 1005, speakerHeroPosId = 1, 
imgTween = {
{imgId = 102, delay = 0, duration = 0.2, posId = 2, alpha = 0, isDark = true}
, 
{imgId = 105, delay = 0, duration = 0, posId = 2, alpha = 0, isDark = false}
, 
{imgId = 105, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = false}
, 
{imgId = 20, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = true}
}
, 
heroFace = {
{imgId = 105, faceId = 0}
}
}
, 
[45] = {content = 450, contentType = 3, speakerHeroId = 20, speakerHeroPosId = 3, 
imgTween = {
{imgId = 105, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = true}
, 
{imgId = 20, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = false}
}
}
, 
[46] = {content = 460, contentType = 3, speakerHeroId = 19, speakerHeroPosId = 1, 
imgTween = {
{imgId = 105, delay = 0, duration = 0.2, posId = 2, alpha = 0, isDark = true}
, 
{imgId = 19, delay = 0, duration = 0, posId = 2, alpha = 0, isDark = false}
, 
{imgId = 19, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = false}
, 
{imgId = 20, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = true}
}
, 
heroFace = {
{imgId = 19, faceId = 4}
}
}
, 
[47] = {content = 470, contentType = 3, speakerHeroId = 19, speakerHeroPosId = 1, contentshake = true}
, 
[48] = {content = 480, contentType = 3, speakerHeroId = 20, speakerHeroPosId = 3, 
imgTween = {
{imgId = 19, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = true}
, 
{imgId = 20, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = false}
}
}
, 
[49] = {content = 490, contentType = 3, speakerHeroId = 20, speakerHeroPosId = 3}
, 
[50] = {content = 500, contentType = 4, speakerName = 11, 
imgTween = {
{imgId = 19, delay = 0, duration = 0.2, posId = 2, alpha = 0, isDark = true}
, 
{imgId = 20, delay = 0, duration = 0.2, posId = 4, alpha = 0, isDark = false}
}
}
, 
[51] = {content = 510, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 1, 
imgTween = {
{imgId = 101, delay = 0, duration = 0, posId = 2, alpha = 0, isDark = false}
, 
{imgId = 101, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = false}
, 
{imgId = 102, delay = 0, duration = 0, posId = 4, alpha = 0, isDark = true}
, 
{imgId = 102, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = true}
}
, 
heroFace = {
{imgId = 101, faceId = 5}
}
}
, 
[52] = {content = 520, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 1}
, 
[53] = {content = 530, contentType = 3, speakerHeroId = 1002, speakerHeroPosId = 3, 
imgTween = {
{imgId = 101, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = true}
, 
{imgId = 102, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = false}
}
, 
audio = {
bgm = {stop = false, cue = "Mus_Story_BattleTension", sheet = "Music", fadeIn = 3, fadeOut = 3}
}
, 
heroFace = {
{imgId = 102, faceId = 6}
}
}
, 
[54] = {content = 540, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 1, 
imgTween = {
{imgId = 102, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = true}
, 
{imgId = 101, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = false}
}
, 
heroFace = {
{imgId = 101, faceId = 4}
}
}
, 
[55] = {content = 550, contentType = 3, speakerHeroId = 1002, speakerHeroPosId = 3, 
imgTween = {
{imgId = 101, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = true}
, 
{imgId = 102, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = false}
}
, 
heroFace = {
{imgId = 102, faceId = 2}
}
}
, 
[56] = {content = 560, contentType = 3, speakerHeroId = 1001, speakerHeroPosId = 1, 
imgTween = {
{imgId = 101, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = false}
, 
{imgId = 102, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = true}
}
}
, 
[57] = {content = 570, contentType = 3, speakerHeroId = 1005, speakerHeroPosId = 3, 
imgTween = {
{imgId = 20, alpha = 0}
, 
{imgId = 102, delay = 0, duration = 0.2, posId = 4, alpha = 0, isDark = true}
, 
{imgId = 105, delay = 0, duration = 0, posId = 4, alpha = 0, isDark = false}
, 
{imgId = 105, delay = 0, duration = 0.2, posId = 4, alpha = 1, isDark = false}
, 
{imgId = 101, delay = 0, duration = 0.2, posId = 2, alpha = 1, isDark = true}
}
}
}
return AvgCfg_cpt02_e_09_01

