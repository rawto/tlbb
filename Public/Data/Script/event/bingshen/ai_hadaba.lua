--飘渺峰 李秋水AI

--A 【小无相功】给自己用个空技能....再给随机给一个玩家失明....
--B 【剑舞】给自己用一个空技能....接下来15s内依次给全副本玩家加伤害值逐渐加大的伤害buff....
--C 【洒脱】给自己用一个清buff的技能....
--D 【冰爆】给自己用个空技能....再给随机给玩家脚下放个陷阱....
--E 【狂暴】给自己加疯狂的buff....不再使用其他技能....

--全程都带有免疫制定技能的buff....
--战斗开始同时每隔10秒用A技能....
--当HP降为66%和33%时分别使用B技能....B技能的持续时间内....其它技能CD到了不使用....
--每隔20秒用C技能....
--每隔20秒用D技能....


--脚本号
x894064_g_ScriptId	= 894064

--副本逻辑脚本号....
x894064_g_FuBenScriptId = 894063

x894064_MyName			= "Ti陁 D Phong"	--自己的名字....

--免疫特定技能buff....
x894064_Buff_MianYi1	= 10472	--免疫一些负面效果....
x894064_Buff_MianYi2	= 10471	--免疫普通隐身....

--A神来之笔....
x894064_SkillA_ID			= 1800
x894064_SkillA_Buff		=	19404
x894064_SkillA_CD			= 5000

--B剑舞....
x894064_SkillB_ID		= 1803
x894064_SkillB_CD		= 22000


--C洒脱....
x894064_SkillC_ID		= 1802
x894064_SkillC_CD		= 20000

--D冰爆....
x894064_SkillD_ID		= 1801
x894064_SkillD_CD		= 20000
x894064_SkillD_SpecObj = 200
x894064_SkillD_Buff		=	19405

--E狂暴....
x894064_SkillE_Buff1	= 10234
x894064_SkillE_Buff2	= 10235
--开始进入狂暴状态的时间....
x894064_EnterKuangBaoTime	= 10*60*1000

--AI Index....
x894064_IDX_StopWatch						= 1	--秒表....
x894064_IDX_SkillA_CD						= 2	--A技能的CD时间....
x894064_IDX_SkillB_HPStep				= 3	--血量级别....
x894064_IDX_SkillB_Step					= 4	--B技能的Step....0=未发动 15=buff1 14=buff2 …… 1=buff15
x894064_IDX_SkillB_Type					= 5	--当前正在使用哪种类型的剑舞....
x894064_IDX_SkillC_CD						= 6	--C技能的CD时间....
x894064_IDX_SkillD_CD						= 7	--C技能的CD时间....
x894064_IDX_KuangBaoTimer				= 8	--狂暴的计时器....
x894064_IDX_SkillB_CD						= 9	--C技能的CD时间....


x894064_IDX_CombatFlag 			= 1	--是否处于战斗状态的标志....
x894064_IDX_IsKuangBaoMode	= 2	--是否处于狂暴模式的标志....

x894064_LootItem_1 = {
39910001, 39910002, 39910003, 
}

x894064_LootItem_2 = {
20310184,
}
--**********************************
--初始化....
--**********************************
function x894064_OnInit(sceneId, selfId)
	--重置AI....
	x894064_ResetMyAI( sceneId, selfId )
end


--**********************************
--心跳....
--**********************************
function x894064_OnHeartBeat(sceneId, selfId, nTick)

	--检测是不是死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--检测是否不在战斗状态....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x894064_IDX_CombatFlag ) then
		return
	end

	--狂暴状态不需要走逻辑....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x894064_IDX_IsKuangBaoMode ) then
		return
	end

	--A技能心跳....
	if 1 == x894064_TickSkillA( sceneId, selfId, nTick ) then
		return
	end

	--B技能心跳....
	if 1 == x894064_TickSkillB( sceneId, selfId, nTick ) then
		return
	end

	--C技能心跳....
	if 1 == x894064_TickSkillC( sceneId, selfId, nTick ) then
		return
	end

	--D技能心跳....
	if 1 == x894064_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

	--E技能心跳....
	if 1 == x894064_TickSkillE( sceneId, selfId, nTick ) then
		return
	end

	--秒表心跳....
	x894064_TickStopWatch( sceneId, selfId, nTick )

end


--**********************************
--进入战斗....
--**********************************
function x894064_OnEnterCombat(sceneId, selfId, enmeyId)

	--加初始buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894064_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894064_Buff_MianYi2, 0 )

	--重置AI....
	x894064_ResetMyAI( sceneId, selfId )

	--设置进入战斗状态....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894064_IDX_CombatFlag, 1 )

end


--**********************************
--离开战斗....
--**********************************
function x894064_OnLeaveCombat(sceneId, selfId)

	--重置AI....
	x894064_ResetMyAI( sceneId, selfId )

	--删除自己....
	LuaFnDeleteMonster( sceneId, selfId )

	--创建对话NPC....
	local MstId = CallScriptFunction( x894064_g_FuBenScriptId, "CreateBOSS", sceneId, "XiaoYiFeng_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )
end


--**********************************
--杀死敌人....
--**********************************
function x894064_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--死亡....
--**********************************
function x894064_OnDie( sceneId, selfId, killerId )

	--重置AI....
	x894064_ResetMyAI( sceneId, selfId )

	--设置已经挑战过哈大霸....
	CallScriptFunction( x894064_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "XiaoYiFeng", 2 )

	--如果还没有挑战过桑土公则可以挑战桑土公....
	if 2 ~= CallScriptFunction( x894064_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "XiaoRuJun" ) then
		CallScriptFunction( x894064_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "XiaoRuJun", 1 )
	end
		
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
		str = format("M cho b� v鈟 ch t� ph韆, #GTi陁 D Phong#W m kh鬾g bi猲 s, v鏽 thong dong nh遪g 鸬t nhi阯 l阯 ti猲g \"K� T Nh� Phong\" r癷 bi猲 m. #{_INFOUSR%s}#W c鵱g t� 鸬i ph鋓 th痶 l阯 \"Ti陁 D Phong qu� th l� danh b h� truy玭\"...", playerName); --哈大霸
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

			local WuPin = random( getn(x894064_LootItem_1) )
			AddMonsterDropItem( sceneId, selfId, mems[i], x894064_LootItem_1[WuPin] )
			AddMonsterDropItem( sceneId, selfId, mems[i], 39910001 )

			rand = random(100)
			if rand < 60 then
				AddMonsterDropItem( sceneId, selfId, mems[i], 39910001 )--元宝1W
			end

			rand = random(100)
			if rand < 60 then
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
			if rand < 60 then
				local WuPin = random( getn(x894064_LootItem_2) )
				AddMonsterDropItem( sceneId, selfId, mems[i], x894064_LootItem_2[WuPin]  )

			end

			rand = random(100)
			if rand < 40 then
				AddMonsterDropItem( sceneId, selfId, mems[i], 20310184 )--魔盒
			end

		end
	end
	
end


--**********************************
--重置AI....
--**********************************
function x894064_ResetMyAI( sceneId, selfId )

	--重置参数....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_StopWatch, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillA_CD, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_HPStep, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_Step, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_Type, 1 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_CD, x894064_SkillB_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillC_CD, x894064_SkillC_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillD_CD, x894064_SkillD_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_KuangBaoTimer, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894064_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894064_IDX_IsKuangBaoMode, 0 )

end

--**********************************
--A技能心跳....
--**********************************
function x894064_TickSkillA( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillA_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillA_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillA_CD, x894064_SkillA_CD-(nTick-cd) )
		return x894064_UseSkillA( sceneId, selfId )
	end

end

--**********************************
--B技能心跳....
--**********************************
function x894064_TickSkillB( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.3333 then
		return 0
	end

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_CD, x894064_SkillB_CD-(nTick-cd) )
		return x894064_UseSkillB( sceneId, selfId )
	end

end

--**********************************
--C技能心跳....
--**********************************
function x894064_TickSkillC( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.5333 then
		return 0
	end

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillC_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillC_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillC_CD, x894064_SkillC_CD-(nTick-cd) )
		return x894064_UseSkillC( sceneId, selfId )
	end

end

--**********************************
--D技能心跳....
--**********************************
function x894064_TickSkillD( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.8333 then
		return 0
	end

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillD_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillD_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillD_CD, x894064_SkillD_CD-(nTick-cd) )
		return x894064_UseSkillD( sceneId, selfId )
	end

end

--**********************************
--E技能心跳....
--**********************************
function x894064_TickSkillE( sceneId, selfId, nTick )

	--如果正在用B技能则先等待....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_Step ) > 0 then
		return 0
	end

	--检测是否到了狂暴的时候....
	local kbTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_KuangBaoTimer )
	if kbTime < x894064_EnterKuangBaoTime then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_KuangBaoTimer, kbTime+nTick )
		return 0

	else
		MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894064_IDX_IsKuangBaoMode, 1 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894064_SkillE_Buff1, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894064_SkillE_Buff2, 0 )
		return 1

	end
end

--**********************************
--秒表心跳....
--**********************************
function x894064_TickStopWatch( sceneId, selfId, nTick )

	--限制每秒才会执行一次....
	local time = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_StopWatch )
	if (time + nTick) > 1000 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_StopWatch, time+nTick-1000 )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_StopWatch, time+nTick )
		return
	end


	-------------------------
	--剑舞技能逻辑....
	-------------------------
	local buffStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_Step )
	local skillType = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_Type )
	if buffStep >= 1 and buffStep <= 15 then

		--寻找符敏仪....
		local bossId = CallScriptFunction( x894064_g_FuBenScriptId, "FindBOSS", sceneId, "FuMinYi_NPC" )
		if bossId <= 0 then
			return 0
		end

		--让符敏仪给玩家加buff....
		local buffTbl = x894064_SkillB_BuffIDTbl[skillType]
		local buffId = buffTbl[16-buffStep]
		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanCount-1 do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
				LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, buffId, 0 )
			end
		end

	end

	if buffStep > 0 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_Step, buffStep-1 )
	end


end

--**********************************
--使用A技能....
--**********************************
function x894064_UseSkillA( sceneId, selfId )

	--如果正在用B技能则跳过....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_Step ) > 0 then
		return 0
	end

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

	--对自己使用一个空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894064_SkillA_ID, selfId, x, z, 0, 1 )

	--给玩家加失明buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, x894064_SkillA_Buff, 0 )

	return 1

end

--**********************************
--使用B技能....
--**********************************
function x894064_UseSkillB( sceneId, selfId )

	--使用空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894064_SkillB_ID, selfId, x, z, 0, 1 )

	CallScriptFunction((200060), "Paopao",sceneId, "Ti陁 D Phong", "Binh Th醤h K� Tr", "T nh� phong, kho醝 nh� hi琺, phong gi醦 ra th鈔. C醕 ng呓i s� d鴑g k� n錸g g� 餴 ch錸g n鎍 th� ta nh 鸶nh s� ho鄋 tr� c醕 ng叨i bg ch韓h k� n錸g 痼..." )
	CallScriptFunction( x894064_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: Ti陁 D Phong tri畊 h癷 T Phong H� Th�. Li阯 t鴆 trong v騨g 15 gi鈟, m鱥 s醫 th呓ng g鈟 ra cho h s� b� ph鋘 ho鄋 to鄋 tr� l読, c醕 v� ch� �!" )

	return 1

end

--**********************************
--使用C技能....
--**********************************
function x894064_UseSkillC( sceneId, selfId )

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

	--使用空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894064_SkillC_ID, PlayerId, x, z, 0, 1 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, 19408, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, 19406, 0 )
	local x,z = GetWorldPos( sceneId, PlayerId )
	CallScriptFunction( x894064_g_FuBenScriptId, "CreateBOSS", sceneId, "FengLei_BOSS", x, z )
	CallScriptFunction( x894064_g_FuBenScriptId, "CreateBOSS", sceneId, "FengLei_BOSS", x, z )
	CallScriptFunction( x894064_g_FuBenScriptId, "CreateBOSS", sceneId, "FengLei_BOSS", x, z )
	CallScriptFunction( x894064_g_FuBenScriptId, "CreateBOSS", sceneId, "FengLei_BOSS", x, z )
	CallScriptFunction((200060), "Paopao",sceneId, "Ti陁 D Phong", "Binh Th醤h K� Tr", "T� ti陁 v鈔 t�, L鬷 鸬ng c豼 thi阯, Cu皀g l鬷 k韈h s醫. Phong L鬷 姓n, m鴆 ti陁 l� t阯 #c2ebeff"..GetName( sceneId, PlayerId ).."#W..." )
	CallScriptFunction( x894064_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: #c2ebeff"..GetName( sceneId, PlayerId ).." 疸 tr鷑g Phong L鬷 姓n. 5 gi鈟 sau trong ng叨i t� kh sinh ra 4 tia Phong L鬷 姓n t鯽 ra xung quanh, c th!" )

	return 1


end

--**********************************
--使用D技能....
--**********************************
function x894064_UseSkillD( sceneId, selfId )

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

	--对自己使用一个空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894064_SkillD_ID, selfId, x, z, 0, 1 )

	CallScriptFunction((200060), "Paopao",sceneId, "Ti陁 D Phong", "Binh Th醤h K� Tr", "Cu皀g L鬷 Ch 懈a, phong t鯽 huy瑃 鹫o, ch� c 瘙i Thi阯 L鬷 gi醤g th� l� #c2ebeff"..GetName( sceneId, PlayerIdA )..", "..GetName( sceneId, PlayerIdB ).."#W t� kh xu痭g g M課h B� r癷. Ha ha..." )
	CallScriptFunction( x894064_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: Cu皀g L鬷 30 gi鈟 sau s� ph醫 t醕, l鷆 痼 s� g鈟 h読 cho c醕 v� r l緉, h銀 nhanh tay ph� h鼀 ch鷑g 餴..." )

	--给玩家加失明buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerIdA, x894064_SkillD_Buff, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerIdA, 19403, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerIdB, x894064_SkillD_Buff, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerIdB, 19403, 0 )

	local x,z = GetWorldPos( sceneId, PlayerIdA )
	CreateSpecialObjByDataIndex(sceneId, selfId, x894064_SkillD_SpecObj, x, z, 0)
	local MstIdA = CallScriptFunction( x894064_g_FuBenScriptId, "CreateBOSS", sceneId, "XuanFeng_BOSS", x, z )
	SetCharacterDieTime( sceneId, MstIdA, 31500 )

	local x,z = GetWorldPos( sceneId, PlayerIdB )
	CreateSpecialObjByDataIndex(sceneId, selfId, x894064_SkillD_SpecObj, x, z, 0)
	local MstIdB = CallScriptFunction( x894064_g_FuBenScriptId, "CreateBOSS", sceneId, "XuanFeng_BOSS", x, z )
	SetCharacterDieTime( sceneId, MstIdB, 31500 )

	return 1

end

--**********************************
--暗雷和烟花的buff结束的时候回调本接口....
--**********************************
function x894064_OnImpactFadeOut( sceneId, selfId, impactId )

	--寻找BOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName( sceneId, MonsterId ) == "Ti陁 D Phong" then
			bossId = MonsterId
		end
	end

	--没找到则返回....
	if bossId == -1 then
		return
	end

	--如果是烟花的buff则让BOSS喊话....
	if impactId == 19403 then

		x,z = GetWorldPos( sceneId,selfId )
		CreateSpecialObjByDataIndex(sceneId, bossId, 193, x, z, 0)

		return
	end

	--如果是烟花的buff则让BOSS喊话....
	if impactId == 19408 then
			LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19406, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19409, 0 )

		return
	end

	--如果是烟花的buff则让BOSS喊话....
	if impactId == 19409 then
		CreateSpecialObjByDataIndex(sceneId, bossId, 191, x, z, 0)
		return
	end

end

