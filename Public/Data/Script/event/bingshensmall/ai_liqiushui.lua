--飘渺峰 不平道人AI

--F	【暗雷】对自己用一个空技能....再给玩家加个结束后会回调脚本的buff....回调时让BOSS给其周围人加伤寒buff并喊话....
--G 【精算】给自己用一个加buff的技能....
--H 【烟花】对自己用一个空技能....再给玩家加个结束后会回调脚本的buff....回调时喊话....
--I	【朋友】Tr醕 B Ph鄊死时给自己用一个加buff的技能....


--全程都带有免疫制定技能的buff....
--每隔30秒对随机玩家随机使用FH....
--每隔45秒对自己使用G....
--死亡或脱离战斗时给所有玩家清除FH的buff....
--死亡时寻找不平道人....设置其需要使用狂暴技能....
--死亡时发现不平道人已经死了....则创建另一个BOSS....


--脚本号
x895069_g_ScriptId	= 895069

--副本逻辑脚本号....
x895069_g_FuBenScriptId = 895063

--免疫Buff....
x895069_Buff_MianYi1	= 10472	--免疫一些负面效果....
x895069_Buff_MianYi2	= 10471	--免疫普通隐身....

--技能....
x895069_SkillID_F		= 1820  --普通攻击
x895069_SkillID_F2		= 1821
x895069_BuffID_F		= 19451

--石堆
x895069_SkillID_G		= 1822

x895069_SkillID_H		= 1823
x895069_BuffID_H		= 19741

x895069_SkillID_I		= 1036
x895069_BuffID_I1		= 10253
x895069_BuffID_I2		= 10254

x895069_SkillID_J		= 1824
x895069_BuffID_J		= 19434

x895069_SkillCD_FH	=	8000
x895069_SkillCD_G		=	45000
x895069_SkillCD_J	=	31000
x895069_SkillCD_H		=	60000
x895069_SkillCD_K	=	5000


x895069_MyName			= "Gia Lu Li阯 Th鄋h"	--自己的名字....

--AI Index....
x895069_IDX_KuangBaoMode	= 1	--狂暴模式....0未狂暴 1需要进入狂暴 2已经进入狂暴
x895069_IDX_CD_SkillFH		= 2	--FH技能的CD....
x895069_IDX_CD_SkillG			= 3	--G技能的CD....
x895069_IDX_CD_Talk				= 4	--FH技能喊话的CD....
x895069_IDX_CD_SkillJ			= 5	--G技能的CD....
x895069_IDX_CD_SkillH			= 6	--G技能的CD....
x895069_IDX_CD_SkillK			= 7	--G技能的CD....

x895069_IDX_CombatFlag 		= 1	--是否处于战斗状态的标志....

x895069_LootItem_1 = {
39901048, 39901048, 
}

x895069_LootItem_2 = {
20310184,
}
--**********************************
--初始化....
--**********************************
function x895069_OnInit(sceneId, selfId)
	--重置AI....
	x895069_ResetMyAI( sceneId, selfId )
end


--**********************************
--心跳....
--**********************************
function x895069_OnHeartBeat(sceneId, selfId, nTick)

	--检测是不是死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--检测是否不在战斗状态....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x895069_IDX_CombatFlag ) then
		return
	end

	--FH技能心跳....
	if 1 == x895069_TickSkillFH( sceneId, selfId, nTick ) then
		return
	end

	--G技能心跳....
	if 1 == x895069_TickSkillG( sceneId, selfId, nTick ) then
		return
	end

	--H技能心跳....
	if 1 == x895069_TickSkillH( sceneId, selfId, nTick ) then
		return
	end

	--I技能心跳....
	if 1 == x895069_TickSkillI( sceneId, selfId, nTick ) then
		return
	end

	--J技能心跳....
	if 1 == x895069_TickSkillJ( sceneId, selfId, nTick ) then
		return
	end

	--K技能心跳....
	if 1 == x895069_TickSkillK( sceneId, selfId, nTick ) then
		return
	end
end


--**********************************
--进入战斗....
--**********************************
function x895069_OnEnterCombat(sceneId, selfId, enmeyId)

	--加初始buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x895069_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x895069_Buff_MianYi2, 0 )

	--重置AI....
	x895069_ResetMyAI( sceneId, selfId )

	--设置进入战斗状态....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x895069_IDX_CombatFlag, 1 )

end


--**********************************
--离开战斗....
--**********************************
function x895069_OnLeaveCombat(sceneId, selfId)

	--重置AI....
	x895069_ResetMyAI( sceneId, selfId )

	--删除自己....
	LuaFnDeleteMonster( sceneId, selfId )

	--创建对话NPC....
	local MstId = CallScriptFunction( x895069_g_FuBenScriptId, "CreateBOSS", sceneId, "LiFan_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )
end


--**********************************
--杀死敌人....
--**********************************
function x895069_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--死亡....
--**********************************
function x895069_OnDie( sceneId, selfId, killerId )

	--重置AI....
	x895069_ResetMyAI( sceneId, selfId )

	--设置已经挑战过李秋水....
	CallScriptFunction( x895069_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "YeLvLian", 2 )

	-- zchw 全球公告
	local	playerName	= GetName( sceneId, killerId )
	
	--杀死怪物的是宠物则获取其主人的名字....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		playerName = GetName( sceneId, playerID )
	end
	
	--如果玩家组队了则获取队长的名字....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		playerName = GetName( sceneId, leaderID )
	end
	
	if playerName ~= nil then
		str = format("嗅nh b読 #GGia Lu Li阯 Th鄋h#W nh遪g #{_INFOUSR%s}#P v� t� 鸬i v鏽 c騨 thoang tho鋘g s� h鉯. H銀 c騨 餫ng th� d鄆 th� vi阯 Th誧h Ti猼 tr呔c m v� v鴑 ra, b阯 trong ch補 m祎 c醝 B鋙 S呓ng qu� gi�...", playerName); --李秋水
		AddGlobalCountNews( sceneId, str )
	end

	--取得当前场景里的人数
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	
	for i = 0, num - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	for i = 0, num - 1 do
		if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 and LuaFnIsCharacterLiving( sceneId, mems[i] ) == 1 then					-- 不在场景的不做此操作

			local WuPin = random( getn(x895069_LootItem_1) )
			AddMonsterDropItem( sceneId, selfId, mems[i], x895069_LootItem_1[WuPin] )
			AddMonsterDropItem( sceneId, selfId, mems[i], 20700019 )

			rand = random(100)
			if rand < 90 then
				AddMonsterDropItem( sceneId, selfId, mems[i], 39910001 )--元宝1W
			end

			rand = random(100)
			if rand < 70 then
				AddMonsterDropItem( sceneId, selfId, mems[i], 20310184 )--玫瑰之恋
			end

			rand = random(100)
			if rand < 10 then
				AddMonsterDropItem( sceneId, selfId, mems[i], 20310184 )--镇南
			end

			rand = random(100)
			if rand < 100 then
				AddMonsterDropItem( sceneId, selfId, mems[i], 20310184 )--镇南
			end

			rand = random(100)
			if rand < 90 then
				local WuPin = random( getn(x895069_LootItem_2) )
				AddMonsterDropItem( sceneId, selfId, mems[i], x895069_LootItem_2[WuPin]  )

			end

			rand = random(100)
			if rand < 70 then
				AddMonsterDropItem( sceneId, selfId, mems[i], 39910003)--元宝5W
			end

		end
	end

end


--**********************************
--重置AI....
--**********************************
function x895069_ResetMyAI( sceneId, selfId )

	--重置参数....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillFH, x895069_SkillCD_FH )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillG, x895069_SkillCD_G )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillJ, x895069_SkillCD_J )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillH, x895069_SkillCD_H )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillK, x895069_SkillCD_K )

	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_Talk, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x895069_IDX_CombatFlag, 0 )

	--给所有玩家清除FH的buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x895069_BuffID_F1 )
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x895069_BuffID_H )
		end
	end

end


--**********************************
--FH技能心跳....
--**********************************
function x895069_TickSkillFH( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillFH )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillFH, cd-nTick )
		return 0

	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillFH, x895069_SkillCD_FH-(nTick-cd) )
		return x895069_UseSkillF( sceneId, selfId )
	end

end


--**********************************
--G技能心跳....
--**********************************
function x895069_TickSkillG( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent < 0.6666 then
		return 0
	end

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillG )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillG, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillG, x895069_SkillCD_G-(nTick-cd) )
		return x895069_UseSkillG( sceneId, selfId )
	end

end

--**********************************
--H技能心跳....
--**********************************
function x895069_TickSkillH( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.6 then
		return 0
	end

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillH )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillH, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillH, x895069_SkillCD_H-(nTick-cd) )
		return x895069_UseSkillH( sceneId, selfId )
	end

end

--**********************************
--J技能心跳....
--**********************************
function x895069_TickSkillJ( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.2 then
		return 0
	end

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillJ )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillJ, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillJ, x895069_SkillCD_J-(nTick-cd) )
		return x895069_UseSkillJ( sceneId, selfId )
	end

end

--**********************************
--K技能心跳....
--**********************************
function x895069_TickSkillK( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillK )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillK, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_CD_SkillK, x895069_SkillCD_K-(nTick-cd) )
		return x895069_UseSkillK( sceneId, selfId )
	end

end
--**********************************
--I技能心跳....
--**********************************
function x895069_TickSkillI( sceneId, selfId, nTick )

	--获得当前狂暴mode....
	local CurMode = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895069_IDX_KuangBaoMode )

	if CurMode == 0 or CurMode == 2 then

		--如果不需要狂暴或者已经狂暴了则返回....
		return 0

	elseif CurMode == 1 then

		--如果需要狂暴则使用狂暴技能....
		local ret =  x895069_UseSkillI( sceneId, selfId )
		if ret == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x895069_IDX_KuangBaoMode, 2 )
			return 1
		else
			return 0
		end

	end

end


--**********************************
--使用F技能....
--**********************************
function x895069_UseSkillF( sceneId, selfId )

	--副本中有效的玩家的列表....
	local PlayerList = {}

	--将有效的人加入列表....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--随机挑选一个玩家....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--对自己使用空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x895069_SkillID_F, PlayerId, x, z, 0, 1 )

	--给玩家加结束后回调脚本的buff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x895069_BuffID_F, 0 )

	--对自己使用空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x895069_SkillID_F2, selfId, x, z, 0, 1 )

	return 1

end


--**********************************
--使用G技能....
--**********************************
function x895069_UseSkillG( sceneId, selfId )

	--对其使用技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x895069_SkillID_G, selfId, x, z, 0, 1 )

	CallScriptFunction((200060), "Paopao",sceneId, "Gia Lu Li阯 Th鄋h", "Binh Th醤h K� Tr", "Kim gi醦 phi t鈔, b 鸬ng t馻 s絥. C醕 ng呓i chu b� n猰 痱n c黙 ta 疴y!" )
	CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: Gia Lu Li阯 Th鄋h tri畊 h癷 S絥 Tr. C醕 v� ph鋓 ph� h鼀 ch鷑g th nhanh. N猽 kh鬾g sau 30 gi鈟 ch苙g nh鎛g c醕 v� ph鋓 ch竨 th叻ng t眓 l緉 m� b鋘 th鈔 Gia Lu Li阯 Th鄋h s� 疬㧟 h癷 ph鴆 th� l馽..." )

	local MstIdA = CallScriptFunction( x895069_g_FuBenScriptId, "CreateBOSS", sceneId, "ShiDui_BOSSA", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdA, MstIdA, MstIdA, 19457, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 19459, 0 )
	SetCharacterDieTime( sceneId, MstIdA, 30000 )

	local MstIdB = CallScriptFunction( x895069_g_FuBenScriptId, "CreateBOSS", sceneId, "ShiDui_BOSSB", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdB, MstIdB, MstIdB, 19457, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 19459, 0 )
	SetCharacterDieTime( sceneId, MstIdB, 30000 )

	local MstIdC = CallScriptFunction( x895069_g_FuBenScriptId, "CreateBOSS", sceneId, "ShiDui_BOSSC", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdC, MstIdC, MstIdC, 19457, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 19459, 0 )
	SetCharacterDieTime( sceneId, MstIdC, 30000 )

	local MstIdD = CallScriptFunction( x895069_g_FuBenScriptId, "CreateBOSS", sceneId, "ShiDui_BOSSD", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdD, MstIdD, MstIdD, 19457, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 19459, 0 )
	SetCharacterDieTime( sceneId, MstIdD, 30000 )

	local MstIdE = CallScriptFunction( x895069_g_FuBenScriptId, "CreateBOSS", sceneId, "ShiDui_BOSSE", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdE, MstIdE, MstIdE, 19458, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 19459, 0 )
	SetCharacterDieTime( sceneId, MstIdE, 30000 )

	local MstIdF = CallScriptFunction( x895069_g_FuBenScriptId, "CreateBOSS", sceneId, "ShiDui_BOSSF", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdF, MstIdF, MstIdF, 19458, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 19459, 0 )
	SetCharacterDieTime( sceneId, MstIdF, 30000 )

	local MstIdG = CallScriptFunction( x895069_g_FuBenScriptId, "CreateBOSS", sceneId, "ShiDui_BOSSG", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdG, MstIdG, MstIdG, 19458, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 19459, 0 )
	SetCharacterDieTime( sceneId, MstIdG, 30000 )

	local MstIdH = CallScriptFunction( x895069_g_FuBenScriptId, "CreateBOSS", sceneId, "ShiDui_BOSSH", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdH, MstIdH, MstIdH, 19458, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 19459, 0 )
	SetCharacterDieTime( sceneId, MstIdH, 30000 )

       --自己隐身
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 19452, 0 )

	return 1

end


--**********************************
--使用H技能....
--**********************************
function x895069_UseSkillH( sceneId, selfId )

	--对其使用技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x895069_SkillID_H, selfId, x, z, 0, 1 )

	CallScriptFunction((200060), "Paopao",sceneId, "Gia Lu Li阯 Th鄋h", "Binh Th醤h K� Tr", "N鷌 non tr鵱g 餴畃, phong h骯 v課 ni阯, c醕 ng呓i 疸 d韓h v鄌 v騨g v鈟 th� 鹱ng c� tr醕h s� ki猵 疸 an b鄆..." )
	CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: Gia Lu Li阯 Th鄋h - Thi猼 C痶 ch� c� th� d鵱g N礽 C鬾g g鈟 th呓ng t眓 c騨 Gia Lu Li阯 Th鄋h - Nguy阯 Th c鹡g ch� nh s醫 th呓ng Ngo読 C鬾g m� th鬷..." )
	CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: Trong tr ph醦 n鄖, Gia Lu Li阯 Th鄋h - Thi猼 C痶 c醕 v� c� th� d鵱g N礽 C鬾g K韈h 瓞 nh d課g, c騨 Gia Lu Li阯 Th鄋h - Nguy阯 Th th� h銀 d鵱g Ngo読 C鬾g K韈h nh d課g..." )
	CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: Trong v騨g 60 gi鈟 疳nh b読 ph鈔 th鈔 c黙 Gia Lu Li阯 Th鄋h s� khi猲 h 鹫i th呓ng, nh th呓ng t眓 c馽 l緉. C醕 v� h銀 c� gg l阯!" )

	local x,z = GetWorldPos( sceneId, selfId )
	local MstIdI = CallScriptFunction( x895069_g_FuBenScriptId, "CreateBOSS", sceneId, "TieGu_BOSS", x, z )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdI, MstIdI, MstIdI, 19457, 0 )

	local x,z = GetWorldPos( sceneId, selfId )
	local MstIdJ = CallScriptFunction( x895069_g_FuBenScriptId, "CreateBOSS", sceneId, "YuanShen_BOSS", x, z )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdJ, MstIdJ, MstIdJ, 19458, 0 )

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 19453, 0 )

	local MstIdK = CallScriptFunction( x895069_g_FuBenScriptId, "CreateBOSS", sceneId, "TieFuZhen_BOSS", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdK, MstIdK, MstIdK, 19466, 0 )
	SetCharacterDieTime( sceneId, MstIdK, 60000 )

	local MstIdL = CallScriptFunction( x895069_g_FuBenScriptId, "CreateBOSS", sceneId, "YuanFuZhen_BOSS", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdL, MstIdL, MstIdL, 19467, 0 )
	SetCharacterDieTime( sceneId, MstIdL, 60000 )

	return 1

end

--**********************************
--使用J技能....
--**********************************
function x895069_UseSkillJ( sceneId, selfId )

	CallScriptFunction((200060), "Paopao",sceneId, "Gia Lu Li阯 Th鄋h", "Binh Th醤h K� Tr", "N鷌 non tr鵱g 餴畃. C醕 ng呓i th khinh ng叨i qu� 疳ng. H鬽 nay c醕 ng呓i s� b� ch鬾 v鵬 m鉯 m鉯 trong l騨g nh鎛g ng鱪 n鷌 n鄖..." )
	CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: N猽 trong 30 gi鈟 kh鬾g 疳nh ch猼 Gia Lu Li阯 Th鄋h th� h s� tri畊 h癷 tr ph醦 S絥 H䅟, l鷆 痼 ch鷑g ta s� t醤g m課g n絠 疴y..." )

	--对自己使用空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x895069_SkillID_J, selfId, x, z, 0, 1 )

	CallScriptFunction( x895069_g_FuBenScriptId, "OpenBQZTimer", sceneId, 30, x895069_g_ScriptId, -1 ,-1 )

	return 1


end

--**********************************
--使用I技能....
--**********************************
function x895069_UseSkillK( sceneId, selfId )

	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		local MosDataID = GetMonsterDataID( sceneId, nObjId )
		if MosDataID == 15085 or MosDataID == 15100 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 19453, 0 )
		end
	end

	return 1

end

--**********************************
--使用I技能....
--**********************************
function x895069_UseSkillI( sceneId, selfId )

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x895069_BuffID_I1, 5000 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x895069_BuffID_I2, 5000 )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x895069_SkillID_I, selfId, x, z, 0, 1 )

	CallScriptFunction( x895069_g_FuBenScriptId, "TipAllHuman", sceneId,  "#{PMF_20080530_02}" )

	return 1

end


--**********************************
--暗雷和烟花的buff结束的时候回调本接口....
--**********************************
function x895069_OnImpactFadeOut( sceneId, selfId, impactId )

	--寻找BOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x895069_MyName == GetName( sceneId, MonsterId ) then
			bossId = MonsterId
		end
	end

	--没找到则返回....
	if bossId == -1 then
		return
	end

	--如果是烟花的buff则让BOSS喊话....
	if impactId == 19459 then

		x,z = GetWorldPos( sceneId,selfId )
		CreateSpecialObjByDataIndex(sceneId, bossId, 192, x, z, 0)

		local bok = 0
		local nMonsterNum = GetMonsterCount( sceneId )
		for i=0, nMonsterNum-1 do
			local MonsterId = GetMonsterObjID(sceneId, i)
			if GetName(sceneId, MonsterId) == "石堆" and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
		          bok = 1
			end
		end

	       if bok == 1 then
			local nMonsterNum = GetMonsterCount( sceneId )
			for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId, i)
				if GetName(sceneId, MonsterId) == "Gia Lu Li阯 Th鄋h" and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
				 	 LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 19461, 0)
				end
			end
		end

		return
	end

end

--**********************************
--缥缈峰计时器的OnTimer....
--**********************************
function x895069_OnBQZTimer( sceneId, step, data1, data2 )
	--寻找BOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName( sceneId, MonsterId ) == "Gia Lu Li阯 Th鄋h" then
			bossId = MonsterId
		end
	end

	--没找到则返回....
	if bossId == -1 then
		return
	end
	if 30 == step then
		CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: C騨 30 gi鈟 瓞 疳nh ch猼 Gia Lu Li阯 Th鄋h!" )
		return
	end

	if 20 == step then
		CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: C騨 20 gi鈟 瓞 疳nh ch猼 Gia Lu Li阯 Th鄋h!" )
		return
	end

	if 15 == step then
		CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: C騨 15 gi鈟 瓞 疳nh ch猼 Gia Lu Li阯 Th鄋h!" )
		return
	end

	if 10 == step then
		CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: C騨 10 gi鈟 瓞 疳nh ch猼 Gia Lu Li阯 Th鄋h!" )
		return
	end

	if 6 == step then
		CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: C騨 6 gi鈟 瓞 疳nh ch猼 Gia Lu Li阯 Th鄋h!" )
		return
	end

	if 5 == step then
		CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: C騨 5 gi鈟 瓞 疳nh ch猼 Gia Lu Li阯 Th鄋h!" )
		return
	end

	if 4 == step then
CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: C騨 4 gi鈟 瓞 疳nh ch猼 Gia Lu Li阯 Th鄋h!" )
		return
	end

	if 3 == step then
		CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: C騨 3 gi鈟 瓞 疳nh ch猼 Gia Lu Li阯 Th鄋h!" )
		return
	end

	if 2 == step then
		--提示战斗开始....
		CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: C騨 2 gi鈟 瓞 疳nh ch猼 Gia Lu Li阯 Th鄋h!" )
		return
	end

	if 1 == step then
		CallScriptFunction((200060), "Paopao",sceneId, "Gia Lu Li阯 Th鄋h", "Binh Th醤h K� Tr", "K猼 th鄋h tr ph醦. Th鬾 th馽 thi阯 鸶a, v課 v t頽h t裞. C醕 ng呓i ch猼 餴!" )
		--伤害....
		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanCount-1 do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
				LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, 19434, 0 )
			end
		end
		return
	end

end
