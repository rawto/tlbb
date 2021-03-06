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
x895080_g_ScriptId	= 895080

--副本逻辑脚本号....
x895080_g_FuBenScriptId = 895063

--免疫Buff....
x895080_Buff_MianYi1	= 10472	--免疫一些负面效果....
x895080_Buff_MianYi2	= 10471	--免疫普通隐身....

--技能....
x895080_SkillID_F		= 1825
x895080_BuffID_F1		= 19417

x895080_SkillID_G		= 1806
x895080_SkillID_G_SpecObj		= 188

x895080_SkillID_H		= 1807
x895080_BuffID_H		= 19629

x895080_SkillID_I		= 1804

x895080_SkillCD_FH	=	5000
x895080_SkillCD_G		=	12000
x895080_SkillCD_H	=	12000
x895080_SkillCD_I	=	5000

x895080_MyName			= "Ti陁 Nh� Qu鈔"	--自己的名字....
x895080_BrotherName			= "邪ng T鈓 Tr鷆 - B誧h"	--自己的名字....

--AI Index....
x895080_IDX_KuangBaoMode	= 1	--狂暴模式....0未狂暴 1需要进入狂暴 2已经进入狂暴
x895080_IDX_CD_SkillFH		= 2	--FH技能的CD....
x895080_IDX_CD_SkillG			= 3	--G技能的CD....
x895080_IDX_CD_Talk				= 4	--FH技能喊话的CD....
x895080_IDX_CD_SkillI			= 5	--G技能的CD....

x895080_IDX_CombatFlag 		= 1	--是否处于战斗状态的标志....


--**********************************
--初始化....
--**********************************
function x895080_OnInit(sceneId, selfId)
	--重置AI....
	x895080_ResetMyAI( sceneId, selfId )
end


--**********************************
--心跳....
--**********************************
function x895080_OnHeartBeat(sceneId, selfId, nTick)

	--检测是不是死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--检测是否不在战斗状态....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x895080_IDX_CombatFlag ) then
		return
	end

	--FH技能心跳....
	if 1 == x895080_TickSkillFH( sceneId, selfId, nTick ) then
		return
	end
	--遍历场景里所有的怪....寻找兄弟....给其设置需要使用狂暴技能....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x895080_MyName == GetName( sceneId, MonsterId ) and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			LuaFnUnitUseSkill( sceneId, selfId, x895080_SkillID_F, MonsterId, x, z, 0, 1 )
		end
	end
end


--**********************************
--进入战斗....
--**********************************
function x895080_OnEnterCombat(sceneId, selfId, enmeyId)

	--加初始buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x895080_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x895080_Buff_MianYi2, 0 )

	--重置AI....
	x895080_ResetMyAI( sceneId, selfId )

	--设置进入战斗状态....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x895080_IDX_CombatFlag, 1 )

end


--**********************************
--离开战斗....
--**********************************
function x895080_OnLeaveCombat(sceneId, selfId)

	--重置AI....
	x895080_ResetMyAI( sceneId, selfId )

	--删除自己....
	LuaFnDeleteMonster( sceneId, selfId )

end


--**********************************
--杀死敌人....
--**********************************
function x895080_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--死亡....
--**********************************
function x895080_OnDie( sceneId, selfId, killerId )

	--遍历场景里所有的怪....寻找兄弟....给其设置需要使用狂暴技能....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x895080_BrotherName == GetName( sceneId, MonsterId ) and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, 19411, 0 )
		end
	end

	CallScriptFunction( x894080_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: #c2ebeff"..GetName( sceneId, selfId ).." c黙 Ti陁 Nh� Qu鈔 疸 b� ph� h鼀." )


end


--**********************************
--重置AI....
--**********************************
function x895080_ResetMyAI( sceneId, selfId )

	--重置参数....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895080_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895080_IDX_CD_SkillFH, x895080_SkillCD_FH )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895080_IDX_CD_SkillG, x895080_SkillCD_G )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895080_IDX_CD_SkillH, x895080_SkillCD_H )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895080_IDX_CD_SkillI, x895080_SkillCD_I )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895080_IDX_CD_Talk, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x895080_IDX_CombatFlag, 0 )

	--给所有玩家清除FH的buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x895080_BuffID_F1 )
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x895080_BuffID_H )
		end
	end

end


--**********************************
--FH技能心跳....
--**********************************
function x895080_TickSkillFH( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895080_IDX_CD_SkillFH )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895080_IDX_CD_SkillFH, cd-nTick )
		return 0

	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895080_IDX_CD_SkillFH, x895080_SkillCD_FH-(nTick-cd) )
		return x895080_UseSkillF( sceneId, selfId )
	end

end


--**********************************
--G技能心跳....
--**********************************
function x895080_TickSkillG( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.8333 then
		return 0
	end

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895080_IDX_CD_SkillG )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895080_IDX_CD_SkillG, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895080_IDX_CD_SkillG, x895080_SkillCD_G-(nTick-cd) )
		return x895080_UseSkillG( sceneId, selfId )
	end

end

--**********************************
--H技能心跳....
--**********************************
function x895080_TickSkillH( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.3333 then
		return 0
	end

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895080_IDX_CD_SkillH )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895080_IDX_CD_SkillH, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895080_IDX_CD_SkillH, x895080_SkillCD_H-(nTick-cd) )
		return x895080_UseSkillH( sceneId, selfId )
	end

end

--**********************************
--I技能心跳....
--**********************************
function x895080_TickSkillI( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895080_IDX_CD_SkillI )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895080_IDX_CD_SkillI, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895080_IDX_CD_SkillI, x895080_SkillCD_I-(nTick-cd) )
		return x895080_UseSkillI( sceneId, selfId )
	end

end


--**********************************
--使用F技能....
--**********************************
function x895080_UseSkillF( sceneId, selfId )

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

	--对其使用技能....
	local x,z = GetWorldPos( sceneId, PlayerId )
	LuaFnUnitUseSkill( sceneId, selfId, x895080_SkillID_F, PlayerId, x, z, 0, 1 )

	return 1

end


--**********************************
--使用G技能....
--**********************************
function x895080_UseSkillG( sceneId, selfId )


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

	local PlayerIdA = PlayerList[ random(numPlayer) ]
	local PlayerIdB = PlayerList[ random(numPlayer) ]

	--使用空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x895080_SkillID_G, selfId, x, z, 0, 1 )

	CallScriptFunction((200060), "Paopao",sceneId, "Ti陁 Nh� Qu鈔", "Binh Th醤h K� Tr", "N鷌 r譶g s鬾g n呔c, phong c鋘h h鎢 t靚h... #c2ebeff"..GetName( sceneId, PlayerIdA )..", "..GetName( sceneId, PlayerIdB )..",#W t読 sao c醕 ng呓i l読 kh鬾g b� m� ho b穒 c鋘h 皓p ti阯 l鉵g n鄖 nh�?" )
	CallScriptFunction( x894080_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: Ti陁 Nh� Qu鈔 ph髇g ra th� c誱 b鐈 v� h靚h d呔i ch鈔, c醕 v� ch� � c th. 凶ng b� m� ho b穒 v� b� ngo鄆 c黙 ch鷑g!" )

	local x,z = GetWorldPos( sceneId, PlayerIdA )
	CreateSpecialObjByDataIndex(sceneId, PlayerIdA, x895080_SkillID_G_SpecObj, x, z, 0)

	local x,z = GetWorldPos( sceneId, PlayerIdB )
	CreateSpecialObjByDataIndex(sceneId, PlayerIdB, x895080_SkillID_G_SpecObj, x, z, 0)

	return 1

end


--**********************************
--使用H技能....
--**********************************
function x895080_UseSkillH( sceneId, selfId )

		local Last = CallScriptFunction( x895080_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "PlayHp" )
		if Last > 1 then
			return 0
		end

		CallScriptFunction( x895080_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "PlayHp", 2 )

	       --使用空技能....
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x895080_SkillID_H, selfId, x, z, 0, 1 )

		CallScriptFunction((200060), "Paopao",sceneId, "Ti陁 Nh� Qu鈔", "Binh Th醤h K� Tr", "邪ng T鈓 L鴆 Tr鷆, h銀 nh h呔ng gi� m� 鹧ng, b鋙 v� ta ngh� ng絠 d咿ng s裞 ngh阯h 鸶ch..." )
		CallScriptFunction( x894080_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: Ti陁 Nh� Qu鈔 疸 k陁 g鱥 邪ng T鈓 L鴆 Tr鷆 b鋙 h� 瓞 d咿ng s裞. Hai huynh mu礽 ch鷑g t誱 th秈 mi璶 d竎h t c� s醫 th呓ng. H銀 ph� h鼀 邪ng T鈓 L鴆 tr鷆 瓞 ti陁 di畉 ch鷑g tr呔c khi ch鷑g h癷 ph鴆 tr� l読!" )

	return 1

end


--**********************************
--使用I技能....
--**********************************
function x895080_UseSkillI( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x895080_SkillID_I, selfId, x, z, 0, 1 )

	return 1

end


