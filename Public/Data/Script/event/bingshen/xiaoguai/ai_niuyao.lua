--飘渺峰 不平道人AI

--F	【暗雷】对自己用一个空技能....再给玩家加个结束后会回调脚本的buff....回调时让BOSS给其周围人加伤寒buff并喊话....
--G 【精算】给自己用一个加buff的技能....
--H 【烟花】对自己用一个空技能....再给玩家加个结束后会回调脚本的buff....回调时喊话....
--I	【朋友】卓不凡死时给自己用一个加buff的技能....


--全程都带有免疫制定技能的buff....
--每隔30秒对随机玩家随机使用FH....
--每隔45秒对自己使用G....
--死亡或脱离战斗时给所有玩家清除FH的buff....
--死亡时寻找不平道人....设置其需要使用狂暴技能....
--死亡时发现不平道人已经死了....则创建另一个BOSS....


--脚本号
x894097_g_ScriptId	= 894097

--副本逻辑脚本号....
x894097_g_FuBenScriptId = 894063

--免疫Buff....
x894097_Buff_MianYi1	= 10472	--免疫一些负面效果....
x894097_Buff_MianYi2	= 10471	--免疫普通隐身....

--技能....
x894097_SkillID_F		= 1825
x894097_BuffID_F1		= 19417

x894097_SkillID_G		= 1806
x894097_SkillID_G_SpecObj		= 188

x894097_SkillID_H		= 1807
x894097_BuffID_H		= 19629

x894097_SkillID_I		= 1804

x894097_SkillCD_FH	=	5000
x894097_SkillCD_G		=	12000
x894097_SkillCD_H	=	12000
x894097_SkillCD_I	=	5000

x894097_MyName			= "Ti陁 Nh� Qu鈔"	--自己的名字....
x894097_BrotherName			= "邪ng T鈓 Tr鷆 - B誧h"	--自己的名字....

--AI Index....
x894097_IDX_KuangBaoMode	= 1	--狂暴模式....0未狂暴 1需要进入狂暴 2已经进入狂暴
x894097_IDX_CD_SkillFH		= 2	--FH技能的CD....
x894097_IDX_CD_SkillG			= 3	--G技能的CD....
x894097_IDX_CD_Talk				= 4	--FH技能喊话的CD....
x894097_IDX_CD_SkillI			= 5	--G技能的CD....

x894097_IDX_CombatFlag 		= 1	--是否处于战斗状态的标志....


--**********************************
--初始化....
--**********************************
function x894097_OnInit(sceneId, selfId)
	--重置AI....
	x894097_ResetMyAI( sceneId, selfId )
end


--**********************************
--心跳....
--**********************************
function x894097_OnHeartBeat(sceneId, selfId, nTick)

	--检测是不是死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

		local enemyId = GetMonsterCurEnemy( sceneId, selfId )
		if enemyId > 0 then
			local x,z = GetWorldPos(sceneId,selfId)
			local DogX, DogZ = GetWorldPos( sceneId, enemyId )
			if (x - DogX) * (x - DogX) + (z - DogZ) * (z - DogZ) < 2*2 then
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, enemyId, 19434, 0 )
				LuaFnDeleteMonster( sceneId, selfId )
				--LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, enemyId, 19434, 0 )
			end
		end
end


--**********************************
--进入战斗....
--**********************************
function x894097_OnEnterCombat(sceneId, selfId, enmeyId)

	--加初始buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894097_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894097_Buff_MianYi2, 0 )

	--重置AI....
	x894097_ResetMyAI( sceneId, selfId )

	--设置进入战斗状态....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894097_IDX_CombatFlag, 1 )

end


--**********************************
--离开战斗....
--**********************************
function x894097_OnLeaveCombat(sceneId, selfId)

	--重置AI....
	x894097_ResetMyAI( sceneId, selfId )

	--删除自己....
	LuaFnDeleteMonster( sceneId, selfId )

end


--**********************************
--杀死敌人....
--**********************************
function x894097_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--死亡....
--**********************************
function x894097_OnDie( sceneId, selfId, killerId )

end


--**********************************
--重置AI....
--**********************************
function x894097_ResetMyAI( sceneId, selfId )

	--重置参数....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894097_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894097_IDX_CD_SkillFH, x894097_SkillCD_FH )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894097_IDX_CD_SkillG, x894097_SkillCD_G )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894097_IDX_CD_SkillH, x894097_SkillCD_H )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894097_IDX_CD_SkillI, x894097_SkillCD_I )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894097_IDX_CD_Talk, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894097_IDX_CombatFlag, 0 )

	--给所有玩家清除FH的buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x894097_BuffID_F1 )
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x894097_BuffID_H )
		end
	end

end


--**********************************
--FH技能心跳....
--**********************************
function x894097_TickSkillFH( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894097_IDX_CD_SkillFH )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894097_IDX_CD_SkillFH, cd-nTick )
		return 0

	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894097_IDX_CD_SkillFH, x894097_SkillCD_FH-(nTick-cd) )
		return x894097_UseSkillF( sceneId, selfId )
	end

end


--**********************************
--G技能心跳....
--**********************************
function x894097_TickSkillG( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.8333 then
		return 0
	end

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894097_IDX_CD_SkillG )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894097_IDX_CD_SkillG, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894097_IDX_CD_SkillG, x894097_SkillCD_G-(nTick-cd) )
		return x894097_UseSkillG( sceneId, selfId )
	end

end

--**********************************
--H技能心跳....
--**********************************
function x894097_TickSkillH( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.3333 then
		return 0
	end

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894097_IDX_CD_SkillH )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894097_IDX_CD_SkillH, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894097_IDX_CD_SkillH, x894097_SkillCD_H-(nTick-cd) )
		return x894097_UseSkillH( sceneId, selfId )
	end

end

--**********************************
--I技能心跳....
--**********************************
function x894097_TickSkillI( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894097_IDX_CD_SkillI )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894097_IDX_CD_SkillI, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894097_IDX_CD_SkillI, x894097_SkillCD_I-(nTick-cd) )
		return x894097_UseSkillI( sceneId, selfId )
	end

end


--**********************************
--使用F技能....
--**********************************
function x894097_UseSkillF( sceneId, selfId )

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
	LuaFnUnitUseSkill( sceneId, selfId, x894097_SkillID_F, PlayerId, x, z, 0, 1 )

	return 1

end


--**********************************
--使用G技能....
--**********************************
function x894097_UseSkillG( sceneId, selfId )


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
	LuaFnUnitUseSkill( sceneId, selfId, x894097_SkillID_G, selfId, x, z, 0, 1 )

	CallScriptFunction((200060), "Paopao",sceneId, "Ti陁 Nh� Qu鈔", "Binh Th醤h K� Tr", "N鷌 r譶g s鬾g n呔c, c鋘h 皓p b ng� #c2ebeff"..GetName( sceneId, PlayerIdA )..", "..GetName( sceneId, PlayerIdB )..",#W t読 sao hai ng呓i kh鬾g b� cu痭 h鷗 b穒 c鋘h 皓p m� h皀 n鄖?" )
	CallScriptFunction( x894097_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: Ti陁 Nh� Qu鈔 ph醫 ra c誱 b鐈 d呔i ch鈔 c醕 v�, kh tr呓ng n� tr醤h, ch鷑g nguy hi琺 kh醕 h苙 v� b� ngo鄆 痼..." )

	local x,z = GetWorldPos( sceneId, PlayerIdA )
	CreateSpecialObjByDataIndex(sceneId, PlayerIdA, x894097_SkillID_G_SpecObj, x, z, 0)

	local x,z = GetWorldPos( sceneId, PlayerIdB )
	CreateSpecialObjByDataIndex(sceneId, PlayerIdB, x894097_SkillID_G_SpecObj, x, z, 0)

	return 1

end


--**********************************
--使用H技能....
--**********************************
function x894097_UseSkillH( sceneId, selfId )

		local Last = CallScriptFunction( x894097_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "PlayHp" )
		if Last > 1 then
			return 0
		end

		CallScriptFunction( x894097_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "PlayHp", 2 )

	       --使用空技能....
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x894097_SkillID_H, selfId, x, z, 0, 1 )

		CallScriptFunction((200060), "Paopao",sceneId, "Ti陁 Nh� Qu鈔", "Binh Th醤h K� Tr", "邪ng T鈓 L鴆 Tr鷆, h銀 痼n h呔ng gi� th眎, n鈔g 疝 th鈔 h靚h ta, ta c ngh� ng絠 l読 s裞 瓞 c騨 gi猼 鸶ch!" )
		CallScriptFunction( x894097_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: Ti陁 Nh� Qu鈔 疸 tri畊 t 邪ng T鈓 L鴆 Tr鷆 b鋙 h� 瓞 d咿ng s裞. Huynh mu礽 ch鷑g t誱 th秈 疬㧟 mi璶 d竎h. C醕 h� v� t� 鸬i h銀 mau mau ph� h鼀 邪ng T鈓 L鴆 Tr鷆 quy猼 tr� kh� ch鷑g m祎 phen, tr醤h r r痠 sau n鄖!" )

	return 1

end


--**********************************
--使用I技能....
--**********************************
function x894097_UseSkillI( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894097_SkillID_I, selfId, x, z, 0, 1 )

	return 1

end
