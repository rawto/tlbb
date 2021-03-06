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
x895066_g_ScriptId	= 895066

--副本逻辑脚本号....
x895066_g_FuBenScriptId = 895063

--免疫Buff....
x895066_Buff_MianYi1	= 10472	--免疫一些负面效果....
x895066_Buff_MianYi2	= 10471	--免疫普通隐身....

--技能....
x895066_SkillID_F		= 1809
x895066_SkillID_F2		= 1810
x895066_BuffID_F1		= 19433

x895066_SkillID_G		= 1811
x895066_SkillID_G_SpecObj		= 188

x895066_SkillID_H		= 1813
x895066_SkillD_SpecObj = 190

x895066_SkillID_I		= 1814

x895066_SkillID_J		= 1817
x895066_SkillID_J2		= 1818
x895066_BuffID_J2		= 19435

x895066_SkillCD_FH	=	6000
x895066_SkillCD_G		=	45000
x895066_SkillCD_H	=	25000
x895066_SkillCD_I	=	50000
x895066_SkillCD_J	=	30000

x895066_MyName			= "Gia Lu Di璵"	--自己的名字....

--AI Index....
x895066_IDX_KuangBaoMode	= 1	--狂暴模式....0未狂暴 1需要进入狂暴 2已经进入狂暴
x895066_IDX_CD_SkillFH		= 2	--FH技能的CD....
x895066_IDX_CD_SkillG			= 3	--G技能的CD....
x895066_IDX_CD_Talk				= 4	--FH技能喊话的CD....
x895066_IDX_CD_SkillI			= 5	--G技能的CD....
x895066_IDX_CD_SkillJ			= 6	--G技能的CD....

x895066_IDX_CombatFlag 		= 1	--是否处于战斗状态的标志....

x895066_LootItem_1 = {
39901048, 39901048, 
}

x895066_LootItem_2 = {
20310184,
}
--**********************************
--初始化....
--**********************************
function x895066_OnInit(sceneId, selfId)
	--重置AI....
	x895066_ResetMyAI( sceneId, selfId )
end


--**********************************
--心跳....
--**********************************
function x895066_OnHeartBeat(sceneId, selfId, nTick)

	--检测是不是死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--检测是否不在战斗状态....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x895066_IDX_CombatFlag ) then
		return
	end

	--FH技能心跳....
	if 1 == x895066_TickSkillFH( sceneId, selfId, nTick ) then
		return
	end

	--G技能心跳....
	if 1 == x895066_TickSkillG( sceneId, selfId, nTick ) then
		return
	end

	--H技能心跳....
	if 1 == x895066_TickSkillH( sceneId, selfId, nTick ) then
		return
	end

	--I技能心跳....
	if 1 == x895066_TickSkillI( sceneId, selfId, nTick ) then
		return
	end

	--I技能心跳....
	if 1 == x895066_TickSkillJ( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--进入战斗....
--**********************************
function x895066_OnEnterCombat(sceneId, selfId, enmeyId)

	--加初始buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x895066_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x895066_Buff_MianYi2, 0 )

	--重置AI....
	x895066_ResetMyAI( sceneId, selfId )

	--设置进入战斗状态....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x895066_IDX_CombatFlag, 1 )

end


--**********************************
--离开战斗....
--**********************************
function x895066_OnLeaveCombat(sceneId, selfId)

	--重置AI....
	x895066_ResetMyAI( sceneId, selfId )

	--删除自己....
	LuaFnDeleteMonster( sceneId, selfId )

	--创建对话NPC....
	local MstId = CallScriptFunction( x895066_g_FuBenScriptId, "CreateBOSS", sceneId, "YeLvYan_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )

end


--**********************************
--杀死敌人....
--**********************************
function x895066_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--死亡....
--**********************************
function x895066_OnDie( sceneId, selfId, killerId )

	--重置AI....
	x895066_ResetMyAI( sceneId, selfId )

	--删除自己....
	SetCharacterDieTime( sceneId, selfId, 3000 )

	--开启乌老大死亡的计时器....
	--local x,z = GetWorldPos( sceneId, selfId )
	--CallScriptFunction( x895066_g_FuBenScriptId, "OpenYeLvYanDieTimer", sceneId, 4, x895066_g_ScriptId, x, z )

	--设置已经挑战过乌老大....
	CallScriptFunction( x895066_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "YeLvYan", 2 )

	--如果还没有挑战过双子则可以挑战双子....
	if 2 ~= CallScriptFunction( x895066_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "YeLvLian" )	then
		CallScriptFunction( x895066_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "YeLvLian", 1 )
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
		str = format("Phong h鯽 li畉 di甿 l豠 ch醳 ng鷗 tr秈.#{_INFOUSR%s}#P t読 Binh Th醤h K� Tr 疸 疳nh b読 #cFF0000Da Lu Di璵#W. Tuy Gia Lu Di璵 l� n� nhi Li陁 Qu痗 nh遪g v� c鬾g th� kh鬾g t th叨ng m祎 ch鷗 n鄌...", playerName); --乌老大
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

			local WuPin = random( getn(x895066_LootItem_1) )
			AddMonsterDropItem( sceneId, selfId, mems[i], x895066_LootItem_1[WuPin] )

			rand = random(100)
			if rand < 70 then
				AddMonsterDropItem( sceneId, selfId, mems[i], 39910001 )--元宝1W
			end

			rand = random(100)
			if rand < 80 then
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
			if rand < 70 then
				local WuPin = random( getn(x895066_LootItem_2) )
				AddMonsterDropItem( sceneId, selfId, mems[i], x895066_LootItem_2[WuPin]  )

			end

			rand = random(100)
			if rand < 60 then
				AddMonsterDropItem( sceneId, selfId, mems[i], 39910003)--元宝5W
			end
		end
	end

end


--**********************************
--重置AI....
--**********************************
function x895066_ResetMyAI( sceneId, selfId )

	--重置参数....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillFH, x895066_SkillCD_FH )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillG, x895066_SkillCD_G )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillH, x895066_SkillCD_H )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillI, x895066_SkillCD_I )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillJ, x895066_SkillCD_J )

	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_Talk, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x895066_IDX_CombatFlag, 0 )

	--给所有玩家清除FH的buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x895066_BuffID_F1 )
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x895066_BuffID_H )
		end
	end

	--遍历场景里所有的怪....寻找兄弟并将其删除....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if "地府牛妖" == GetName( sceneId, MonsterId ) then
			LuaFnDeleteMonster( sceneId, MonsterId )
		end
	end

end


--**********************************
--FH技能心跳....
--**********************************
function x895066_TickSkillFH( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillFH )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillFH, cd-nTick )
		return 0

	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillFH, x895066_SkillCD_FH-(nTick-cd) )
		return x895066_UseSkillF( sceneId, selfId )
	end

end


--**********************************
--G技能心跳....
--**********************************
function x895066_TickSkillG( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.8333 then
		return 0
	end

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillG )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillG, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillG, x895066_SkillCD_G-(nTick-cd) )
		return x895066_UseSkillG( sceneId, selfId )
	end

end

--**********************************
--H技能心跳....
--**********************************
function x895066_TickSkillH( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.6333 then
		return 0
	end

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillH )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillH, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillH, x895066_SkillCD_H-(nTick-cd) )
		return x895066_UseSkillH( sceneId, selfId )
	end

end

--**********************************
--I技能心跳....
--**********************************
function x895066_TickSkillI( sceneId, selfId, nTick )
	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.5333 then
		return 0
	end
	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillI )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillI, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillI, x895066_SkillCD_I-(nTick-cd) )
		return x895066_UseSkillI( sceneId, selfId )
	end

end

--**********************************
--I技能心跳....
--**********************************
function x895066_TickSkillJ( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.3333 then
		return 0
	end

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillJ )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillJ, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillJ, x895066_SkillCD_J-(nTick-cd) )
		return x895066_UseSkillJ( sceneId, selfId )
	end

end

--**********************************
--使用F技能....
--**********************************
function x895066_UseSkillF( sceneId, selfId )

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
	LuaFnUnitUseSkill( sceneId, selfId, x895066_SkillID_F, PlayerId, x, z, 0, 1 )

	--给玩家加结束后回调脚本的buff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x895066_BuffID_F1, 0 )
	LuaFnUnitUseSkill( sceneId, selfId, x895066_SkillID_F2, selfId, x, z, 0, 1 )

	return 1

end


--**********************************
--使用G技能....
--**********************************
function x895066_UseSkillG( sceneId, selfId )


	CallScriptFunction((200060), "Paopao",sceneId, "Da Lu Di璵", "Binh Th醤h K� Tr", "V課 Thi阯 H鯽 L遳. Xem ta 鸠t c醕 ng呓i th鄋h tro n鄖..." )
	CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: Sau khi tr ph醦 V課 Thi阯 H鯽 L遳 疬㧟 k韈h ho誸, c醕 v� ph鋓 nhanh ch髇g t靘 n絠 Th鼀 Tr韈h m課h 瓞 tr醤h b� li畉 h鯽 x鈓 h読 c� th�." )

	--使用空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x895066_SkillID_G, selfId, x, z, 0, 1 )
	CreateSpecialObjByDataIndex(sceneId, selfId, 189, 200, 184, 0)
	CallScriptFunction( x895066_g_FuBenScriptId, "OpenBQZTimer", sceneId, 15, x895066_g_ScriptId, -1 ,-1 )

	return 1

end


--**********************************
--使用H技能....
--**********************************
function x895066_UseSkillH( sceneId, selfId )

	--使用空技能....
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x895066_SkillID_H, selfId, x, z, 0, 1 )

		CallScriptFunction((200060), "Paopao",sceneId, "Da Lu Di璵", "Binh Th醤h K� Tr", "懈a H鯽 Ph Thi阯 C呔c. Nh靚 c醕 ng呓i th� kia l鄊 sao c� th� ch誽 tho醫 疬㧟?" )
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: 懈a H鯽 Ph Thi阯 C呔c do Da Lu Di璵 b鄖 ra � ngay d呔i 黏t r nhi玼. C醕 v� n阯 ch� � c th, nguy hi琺 v� c鵱g!" )

		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanCount-1 do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
				x,z = GetWorldPos( sceneId, nHumanId )
				CreateSpecialObjByDataIndex(sceneId, selfId, x895066_SkillD_SpecObj, x, z, 0)
			end
		end

	return 1

end


--**********************************
--使用I技能....
--**********************************
function x895066_UseSkillI( sceneId, selfId )

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
	LuaFnUnitUseSkill( sceneId, selfId, x895066_SkillID_I, selfId, x, z, 0, 1 )

	x,z = GetWorldPos( sceneId,selfId )
	local MstIdA = CallScriptFunction( x895066_g_FuBenScriptId, "CreateBOSS", sceneId, "HuoNiu_BOSS", x, z )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdA, PlayerIdA, MstIdA, 19443, 0 )

	local x,z = GetWorldPos( sceneId, selfId )
	local MstIdC = CallScriptFunction( x895066_g_FuBenScriptId, "CreateBOSS", sceneId, "HuoNiu_BOSS", x, z )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdC, PlayerIdA, MstIdC, 19443, 0 )

	local x,z = GetWorldPos( sceneId, selfId )
	local MstIdB = CallScriptFunction( x895066_g_FuBenScriptId, "CreateBOSS", sceneId, "HuoNiu_BOSS", x, z )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdB, PlayerIdB, MstIdB, 19443, 0 )

	local x,z = GetWorldPos( sceneId, selfId )
	local MstIdD = CallScriptFunction( x895066_g_FuBenScriptId, "CreateBOSS", sceneId, "HuoNiu_BOSS", x, z )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdD, PlayerIdB, MstIdD, 19443, 0 )

	CallScriptFunction((200060), "Paopao",sceneId, "Da Lu Di璵", "Binh Th醤h K� Tr", "H鯽 Ng遳 S醫 Tr. #c2ebeff"..GetName( sceneId, PlayerIdA )..", "..GetName( sceneId, PlayerIdB ).."#W c醕 ng呓i 疸 d韓h H鯽 Ng遳 c黙 ta th� kh鬾g l鈛 s� g M課h B� th鬷..." )
	CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: H鯽 Ng遳 疸 xu hi畁, c醕 v� anh h鵱g h銀 khoan 鸠i ph� v緄 Da Lu Di璵. Ti陁 di畉 H鯽 Ng遳 Tr呔c th� s� tr醤h 疬㧟 th呓ng t眓 l緉 痼." )

	return 1

end

--**********************************
--使用J技能....
--**********************************
function x895066_UseSkillJ( sceneId, selfId )

	CallScriptFunction((200060), "Paopao",sceneId, "Da Lu Di璵", "Binh Th醤h K� Tr", "姓i Li陁 Vi阭 D呓ng, Th裞 Ph� Thi阯 H�, Th呓ng Sinh Chi M鴆, Giai T呓ng Th Minh..." )
	CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: C醕 v� 疸 b� H鯽 Di畊 l鄊 m� hai m t誱 th秈 di chuy琻 h瞡 lo課 kh鬾g l鄊 ch� 疬㧟 b鋘 th鈔." )

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			x,z = GetWorldPos( sceneId, selfId )
			LuaFnUnitUseSkill( sceneId, selfId, x895066_SkillID_J, nHumanId, x, z, 0, 1 )
		end
	end

	--对其使用技能....
	local x,z = GetWorldPos( sceneId, PlayerId )
	LuaFnUnitUseSkill( sceneId, selfId, x895066_SkillID_J2, selfId, x, z, 0, 1 )

	CallScriptFunction((200060), "Paopao",sceneId, "Da Lu Di璵", "Binh Th醤h K� Tr", "B醕h M誧h Th鬾g Huy玭, Phi H鯽 L遳 Tinh, Thi阯 H鯽 H鄋g Th�, S醫 Ph誸 Ch鷑g Sinh, xem t阯 n鄌 c� th� ch誽 tho醫?" )
	CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr D鹡g 姓o Nh鈔: Phi H鯽 L遳 Tinh s h䅟 nh, c醕 v� anh h鵱g h銀 t trung ph� h鼀 n� tr呔c khi n� b礳 ph醫..." )

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			--给玩家加结束后回调脚本的buff....
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, nHumanId, x895066_BuffID_J2, 0 )
		end
	end

	return 1

end

--**********************************
--暗雷和烟花的buff结束的时候回调本接口....
--**********************************
function x895066_OnImpactFadeOut( sceneId, selfId, impactId )

	--寻找BOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x895066_MyName == GetName( sceneId, MonsterId ) then
			bossId = MonsterId
		end
	end

	--没找到则返回....
	if bossId == -1 then
		return
	end

	--如果是暗雷的buff....则让BOSS给附近的玩家加一个伤害的buff并喊话....
	if impactId == x895066_BuffID_J2 then

		local x = 0
		local z = 0
		local xx = 0
		local zz = 0
		local count = 0

		x,z = GetWorldPos( sceneId,selfId )
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, PlayerId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, PlayerId) == 1 and LuaFnIsCharacterLiving(sceneId, PlayerId) == 1 and PlayerId ~= selfId then
				xx,zz = GetWorldPos(sceneId,PlayerId)
				if (x-xx)*(x-xx) + (z-zz)*(z-zz) < 10*10 then
					count = count + 1
				end
			end
		end

		if count == 0 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19434, 0 )
		elseif count == 1 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19392, 0 )
		elseif count == 2 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19393, 0 )
		elseif count == 3 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19394, 0 )
		elseif count == 4 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19395, 0 )
		elseif count == 5 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19396, 0 )
		elseif count == 6 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19397, 0 )
		elseif count == 7 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19398, 0 )
		elseif count == 8 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19399, 0 )
		elseif count == 9 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19400, 0 )
		elseif count == 10 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19401, 0 )
		elseif count == 11 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19402, 0 )
		end

		return

	end

end

--**********************************
--缥缈峰计时器的OnTimer....
--**********************************
function x895066_OnBQZTimer( sceneId, step, data1, data2 )

	--寻找BOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName( sceneId, MonsterId ) == "Gia Lu Di璵" then
			bossId = MonsterId
		end
	end

	--没找到则返回....
	if bossId == -1 then
		return
	end

	if 15 == step then
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "15 gi鈟 sau s� b礳 ph醫 Phi H鯽 L遳 Tinh!" )
		return
	end

	if 13 == step then
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "13 gi鈟 sau s� b礳 ph醫 Phi H鯽 L遳 Tinh!" )
		return
	end

	if 10 == step then
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "10 gi鈟 sau s� b礳 ph醫 Phi H鯽 L遳 Tinh!" )
		return
	end

	if 7 == step then
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "7 gi鈟 sau s� b礳 ph醫 Phi H鯽 L遳 Tinh!" )
		return
	end

	if 6 == step then
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "6 gi鈟 sau s� b礳 ph醫 Phi H鯽 L遳 Tinh!" )
		return
	end

	if 5 == step then
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "5 gi鈟 sau s� b礳 ph醫 Phi H鯽 L遳 Tinh!" )
		return
	end

	if 4 == step then
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "4 gi鈟 sau s� b礳 ph醫 Phi H鯽 L遳 Tinh!" )
		return
	end

	if 3 == step then
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "3 gi鈟 sau s� b礳 ph醫 Phi H鯽 L遳 Tinh!" )
		return
	end

	if 2 == step then
		--提示战斗开始....
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "2 gi鈟 sau s� b礳 ph醫 Phi H鯽 L遳 Tinh!" )
		return
	end

	if 1 == step then
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

