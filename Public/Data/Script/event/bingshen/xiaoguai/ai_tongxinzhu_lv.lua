
--脚本号
x894085_g_ScriptId	= 894085

--副本逻辑脚本号....
x894085_g_FuBenScriptId = 890063

--免疫Buff....
x894085_Buff_MianYi1	= 10472	--免疫一些负面效果....
x894085_Buff_MianYi2	= 10471	--免疫普通隐身....

--技能....
x894085_SkillID_F		= 1830

x894085_SkillID_G		= 903
x894085_SkillID_G_SpecObj		= 1022

x894085_SkillID_H		= 905
x894085_SkillID_J		= 909
x894085_BuffID_H		= 19629

x894085_SkillID_I		= 1036
x894085_BuffID_I1		= 10253
x894085_BuffID_I2		= 10254

x894085_SkillCD_FH	=	5000
x894085_SkillCD_G		=	6000
x894085_SkillCD_H	=	12000


x894085_MyName			= "Ti陁 Nh� Qu鈔"	--自己的名字....
x894085_BrotherName			= "邪ng T鈓 Tr鷆 - L鴆"	--自己的名字....

--AI Index....
x894085_IDX_KuangBaoMode	= 1	--狂暴模式....0未狂暴 1需要进入狂暴 2已经进入狂暴
x894085_IDX_CD_SkillFH		= 2	--FH技能的CD....
x894085_IDX_CD_SkillG			= 3	--G技能的CD....
x894085_IDX_CD_Talk				= 4	--FH技能喊话的CD....
x894085_IDX_CD_SkillH			= 5	--G技能的CD....

x894085_IDX_CombatFlag 		= 1	--是否处于战斗状态的标志....


--**********************************
--初始化....
--**********************************
function x894085_OnInit(sceneId, selfId)
	--重置AI....
	x894085_ResetMyAI( sceneId, selfId )
end


--**********************************
--心跳....
--**********************************
function x894085_OnHeartBeat(sceneId, selfId, nTick)

	--检测是不是死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--检测是否不在战斗状态....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x894085_IDX_CombatFlag ) then
		return
	end

	--FH技能心跳....
	if 1 == x894085_TickSkillFH( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--进入战斗....
--**********************************
function x894085_OnEnterCombat(sceneId, selfId, enmeyId)

	--加初始buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894085_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894085_Buff_MianYi2, 0 )

	--重置AI....
	x894085_ResetMyAI( sceneId, selfId )

	--设置进入战斗状态....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894085_IDX_CombatFlag, 1 )

end


--**********************************
--离开战斗....
--**********************************
function x894085_OnLeaveCombat(sceneId, selfId)

	--重置AI....
	x894085_ResetMyAI( sceneId, selfId )

	--删除自己....
	LuaFnDeleteMonster( sceneId, selfId )

end


--**********************************
--杀死敌人....
--**********************************
function x894085_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--死亡....
--**********************************
function x894085_OnDie( sceneId, selfId, killerId )

	--遍历场景里所有的怪....寻找兄弟....给其设置需要使用狂暴技能....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x894085_BrotherName == GetName( sceneId, MonsterId ) and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, 19411, 0 )
		end
	end

	CallScriptFunction( x894085_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: #c2ebeff"..GetName( sceneId, selfId ).." c黙 Ti陁 Nh� Qu鈔 疸 b� ph� h鼀!" )

end


--**********************************
--重置AI....
--**********************************
function x894085_ResetMyAI( sceneId, selfId )

	--重置参数....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894085_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894085_IDX_CD_SkillFH, x894085_SkillCD_FH )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894085_IDX_CD_SkillG, x894085_SkillCD_G )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894085_IDX_CD_SkillH, x894085_SkillCD_H )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894085_IDX_CD_Talk, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894085_IDX_CombatFlag, 0 )

	--给所有玩家清除FH的buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x894085_BuffID_F1 )
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x894085_BuffID_H )
		end
	end

end


--**********************************
--FH技能心跳....
--**********************************
function x894085_TickSkillFH( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894085_IDX_CD_SkillFH )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894085_IDX_CD_SkillFH, cd-nTick )
		return 0

	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894085_IDX_CD_SkillFH, x894085_SkillCD_FH-(nTick-cd) )
		return x894085_UseSkillF( sceneId, selfId )
	end

end


--**********************************
--G技能心跳....
--**********************************
function x894085_TickSkillG( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent <= 0.6666 then
		return 0
	end

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894085_IDX_CD_SkillG )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894085_IDX_CD_SkillG, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894085_IDX_CD_SkillG, x894085_SkillCD_G-(nTick-cd) )
		return x894085_UseSkillG( sceneId, selfId )
	end

end

--**********************************
--H技能心跳....
--**********************************
function x894085_TickSkillH( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.3333 then
		return 0
	end

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894085_IDX_CD_SkillH )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894085_IDX_CD_SkillH, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894085_IDX_CD_SkillH, x894085_SkillCD_H-(nTick-cd) )
		return x894085_UseSkillH( sceneId, selfId )
	end

end

--**********************************
--I技能心跳....
--**********************************
function x894085_TickSkillI( sceneId, selfId, nTick )

	--获得当前狂暴mode....
	local CurMode = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894085_IDX_KuangBaoMode )

	if CurMode == 0 or CurMode == 2 then

		--如果不需要狂暴或者已经狂暴了则返回....
		return 0

	elseif CurMode == 1 then

		--如果需要狂暴则使用狂暴技能....
		local ret =  x894085_UseSkillI( sceneId, selfId )
		if ret == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x894085_IDX_KuangBaoMode, 2 )
			return 1
		else
			return 0
		end

	end

end


--**********************************
--使用F技能....
--**********************************
function x894085_UseSkillF( sceneId, selfId )

	--遍历场景里所有的怪....寻找兄弟....给其设置需要使用狂暴技能....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName( sceneId, MonsterId ) == "Ti陁 Nh� Qu鈔" and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			local x,z = GetWorldPos( sceneId, PlayerId )
			LuaFnUnitUseSkill( sceneId, selfId, x894085_SkillID_F, MonsterId, x, z, 0, 1 )
		end
	end

	return 1

end


--**********************************
--使用G技能....
--**********************************
function x894085_UseSkillG( sceneId, selfId )


	return 1

end


--**********************************
--使用H技能....
--**********************************
function x894085_UseSkillH( sceneId, selfId )


	return 1

end


--**********************************
--使用I技能....
--**********************************
function x894085_UseSkillI( sceneId, selfId )


	return 1

end


--**********************************
--暗雷和烟花的buff结束的时候回调本接口....
--**********************************
function x894085_OnImpactFadeOut( sceneId, selfId, impactId )

end

