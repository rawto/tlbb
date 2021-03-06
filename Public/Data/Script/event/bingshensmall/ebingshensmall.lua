--缥缈峰副本....   ____、飞翔 By：403413393 修复

--脚本号
x895063_g_ScriptId = 895063

x895063_g_CopySceneType = FUBEN_BINGSHENZHEN	--副本类型，定义在ScriptGlobal.lua里面
x895063_g_LimitMembers = 1					-- 可以进副本的最小队伍人数

x895063_g_TickTime		= 1				--回调脚本的时钟时间（单位：秒/次）
x895063_g_NoUserTime	= 10			--副本中没有人后可以继续保存的时间（单位：秒）
x895063_g_Fuben_X			= 123			--进入副本的位置X
x895063_g_Fuben_Z			= 138			--进入副本的位置Z
x895063_g_FuBenTime		= 3*60*60	--副本关闭时间....

--BOSS表....
x895063_g_BOSSList =
{
	["XiaoYiFeng_NPC"]				= { DataID=15006, Title="T Nh� Phong", posX=51, posY=53, Dir=27, BaseAI=3, AIScript=0, ScriptID=895070 },
	["XiaoYiFeng_BOSS"]				= { DataID=15010, Title="T Nh� Phong", posX=51, posY=53, Dir=27, BaseAI=27, AIScript=301, ScriptID=895064 },
	["XuanFeng_BOSS"]			= { DataID=15015, Title="", posX=0, posY=0, Dir=0, BaseAI=3, AIScript=0, ScriptID=895096 },
	["FengLei_BOSS"]			= { DataID=15020, Title="", posX=0, posY=0, Dir=0, BaseAI=27, AIScript=302, ScriptID=-1 },

	["XiaoRuJun_NPC"]		= { DataID=15026, Title="T� Nh� L鈓", posX=173, posY=36, Dir=0, BaseAI=3, AIScript=0, ScriptID=895071 },
	["XiaoRuJun_BOSS"]		= { DataID=15030, Title="T� Nh� L鈓", posX=173, posY=36, Dir=0, BaseAI=27, AIScript=0, ScriptID=895065 },
	["XiaoRuWei_NPC"]		= { DataID=15031, Title="T� Nh� L鈓", posX=173, posY=100, Dir=0, BaseAI=3, AIScript=0, ScriptID=895068 },
	["XiaoRuWei_BOSS"]		= { DataID=15035, Title="T� Nh� L鈓", posX=173, posY=100, Dir=0, BaseAI=27, AIScript=0, ScriptID=895067 },

	["ZhuBai_BOSS"]			= { DataID=15040, Title="Ngo読 C鬾g Ph騨g Ng�", posX=169, posY=36, Dir=0, BaseAI=28, AIScript=0, ScriptID=895080 },
	["ZhuHong_BOSS"]			= { DataID=15060, Title="Kh醤g H鯽", posX=173, posY=32, Dir=0, BaseAI=28, AIScript=0, ScriptID=895083 },
	["ZhuHuang_BOSS"]			= { DataID=15050, Title="Kh醤g Huy玭", posX=177, posY=36, Dir=0, BaseAI=28, AIScript=0, ScriptID=895082 },
	["ZhuLan_BOSS"]			= { DataID=15065, Title="Kh醤g B錸g", posX=176, posY=39, Dir=0, BaseAI=28, AIScript=0, ScriptID=895084 },
	["ZhuLv_BOSS"]			= { DataID=15055, Title="Kh醤g 械c", posX=170, posY=33, Dir=0, BaseAI=28, AIScript=0, ScriptID=895085 },
	["ZhuZi_BOSS"]			= { DataID=15045, Title="N礽 C鬾g Ph騨g Ng�", posX=173, posY=38, Dir=0, BaseAI=28, AIScript=0, ScriptID=895081 },

	["Bai_BOSS"]			= { DataID=15140, Title="Ngo読 C鬾g Ph騨g Ng�", posX=169, posY=100, Dir=0, BaseAI=28, AIScript=0, ScriptID=895086 },
	["Hong_BOSS"]			= { DataID=15160, Title="Kh醤g H鯽", posX=173, posY=97, Dir=0, BaseAI=28, AIScript=0, ScriptID=895089 },
	["Huang_BOSS"]			= { DataID=15150, Title="Kh醤g Huy玭", posX=177, posY=98, Dir=0, BaseAI=28, AIScript=0, ScriptID=895088 },
	["Lan_BOSS"]			= { DataID=15165, Title="冰抗", posX=176, posY=101, Dir=0, BaseAI=28, AIScript=0, ScriptID=895090 },
	["Lv_BOSS"]			= { DataID=15155, Title="毒抗", posX=175, posY=104, Dir=0, BaseAI=28, AIScript=0, ScriptID=895091 },
	["Zi_BOSS"]			= { DataID=15145, Title="N礽 C鬾g Ph騨g Ng�", posX=173, posY=101, Dir=0, BaseAI=28, AIScript=0, ScriptID=895087 },

	["YeLvYan_NPC"]				= { DataID=15071, Title="X鈓 L唼c Nh� H鯽", posX=192, posY=195, Dir=27, BaseAI=3, AIScript=0, ScriptID=895072 },
	["YeLvYanLoss_NPC"]		= { DataID=14216, Title="", posX=117, posY=49, Dir=0, BaseAI=3, AIScript=0, ScriptID=895075 },
	["YeLvYan_BOSS"]			= { DataID=15075, Title="X鈓 L唼c Nh� H鯽", posX=192, posY=195, Dir=27, BaseAI=27, AIScript=0, ScriptID=895066 },
	["HuoNiu_BOSS"]			= { DataID=15080, Title="", posX=0, posY=0, Dir=0, BaseAI=27, AIScript=0, ScriptID=895097 },

	["YaoBoDang_BOSS"]		= { DataID=42202, Title="", posX=129, posY=108, Dir=0, BaseAI=27, AIScript=0, ScriptID=890067 },
	["SiMaLing_BOSS"]	= { DataID=42203, Title="", posX=131, posY=109, Dir=0, BaseAI=27, AIScript=0, ScriptID=890068 },

	["YouDanZhi_BOSS"]		= { DataID=42204, Title="", posX=129, posY=126, Dir=0, BaseAI=0, AIScript=0, ScriptID=890074 },

	["LiFan_NPC"]				= { DataID=15086, Title="B 械ng Nh� S絥", posX=52, posY=203, Dir=27, BaseAI=3, AIScript=0, ScriptID=895075 },
	["YeLvLian_BOSS"]		= { DataID=15090, Title="B 械ng Nh� S絥", posX=52, posY=203, Dir=27, BaseAI=27, AIScript=0, ScriptID=895069 },

	["ShiDui_BOSSA"]			= { DataID=15095, Title="Mi璶 D竎h Ngo読 C鬾g", posX=52, posY=218, Dir=0, BaseAI=28, AIScript=0, ScriptID=-1 },
	["ShiDui_BOSSB"]			= { DataID=15095, Title="Mi璶 D竎h Ngo読 C鬾g", posX=63, posY=213, Dir=0, BaseAI=28, AIScript=0, ScriptID=-1 },
	["ShiDui_BOSSC"]			= { DataID=15095, Title="Mi璶 D竎h Ngo読 C鬾g", posX=67, posY=203, Dir=0, BaseAI=28, AIScript=0, ScriptID=-1 },
	["ShiDui_BOSSD"]			= { DataID=15095, Title="Mi璶 D竎h Ngo読 C鬾g", posX=63, posY=192, Dir=0, BaseAI=28, AIScript=0, ScriptID=-1 },
	["ShiDui_BOSSE"]			= { DataID=15095, Title="Mi璶 D竎h N礽 C鬾g", posX=53, posY=188, Dir=0, BaseAI=28, AIScript=0, ScriptID=-1 },
	["ShiDui_BOSSF"]			= { DataID=15095, Title="Mi璶 D竎h N礽 C鬾g", posX=42, posY=192, Dir=0, BaseAI=28, AIScript=0, ScriptID=-1 },
	["ShiDui_BOSSG"]			= { DataID=15095, Title="Mi璶 D竎h N礽 C鬾g", posX=38, posY=203, Dir=0, BaseAI=28, AIScript=0, ScriptID=-1 },
	["ShiDui_BOSSH"]			= { DataID=15095, Title="Mi璶 D竎h N礽 C鬾g", posX=42, posY=213, Dir=0, BaseAI=28, AIScript=0, ScriptID=-1 },
	["TieGu_BOSS"]			= { DataID=15085, Title="Mi璶 D竎h Ngo読 C鬾g", posX=0, posY=0, Dir=0, BaseAI=28, AIScript=0, ScriptID=895092 },
	["YuanShen_BOSS"]			= { DataID=15100, Title="Mi璶 D竎h N礽 C鬾g", posX=0, posY=0, Dir=0, BaseAI=28, AIScript=0, ScriptID=895093 },
	["TieFuZhen_BOSS"]			= { DataID=15205, Title="", posX=46, posY=795, Dir=0, BaseAI=3, AIScript=0, ScriptID=895094 },
	["YuanFuZhen_BOSS"]			= { DataID=15206, Title="", posX=54, posY=213, Dir=0, BaseAI=3, AIScript=0, ScriptID=895095 },

}

x895063_g_FightBOSSList =
{
	[1] = x895063_g_BOSSList["XiaoYiFeng_BOSS"].DataID,
	[2] = x895063_g_BOSSList["XiaoRuJun_BOSS"].DataID,
	[3] = x895063_g_BOSSList["YeLvYan_BOSS"].DataID,
	[4] = x895063_g_BOSSList["XiaoRuWei_BOSS"].DataID,
	[5] = x895063_g_BOSSList["SiMaLing_BOSS"].DataID,
	[6] = x895063_g_BOSSList["YeLvLian_BOSS"].DataID
}

--是否可以挑战某个BOSS的标记列表....
x895063_g_BattleFlagTbl = 
{
	["XiaoYiFeng"]			= 8,	--是否可以挑战哈大霸...
	["XiaoRuJun"]	= 9,	--是否可以挑战桑土公....
	["YeLvYan"]			= 10,	--是否可以挑战乌老大....
	["ShuangZi"]		= 11,	--是否可以挑战双子....
	["YeLvLian"]		= 12,	--是否可以挑战李秋水....
	["PlayHp"]		= 21,	--玩家血量....
}

--场景变量索引....是否可以挑战某个BOSS的标记....
-- 0=不能挑战 1=可以挑战 2=已经挑战过了
x895063_g_IDX_BattleFlag_XiaoYiFeng			= 8
x895063_g_IDX_BattleFlag_XiaoRuJun	= 9
x895063_g_IDX_BattleFlag_YeLvYan		= 10
x895063_g_IDX_BattleFlag_Shuangzi		= 11
x895063_g_IDX_BattleFlag_YeLvLian	= 12
x895063_g_IDX_BattleFlag_PlayHp	= 21

x895063_g_IDX_FuBenOpenTime		= 13	--副本建立的时间....
x895063_g_IDX_FuBenLifeStep		= 14	--副本生命期的step....(包括建立NPC....关闭倒计时提示....)

--场景变量索引....通用的缥缈峰计时器....主要用于激活BOSS战斗....
x895063_g_IDX_BQZTimerStep			= 15
x895063_g_IDX_BQZTimerScriptID	= 16

--场景变量索引....乌老大死亡的计时器....用于处理死亡逻辑....
x895063_g_IDX_YeLvYanDieStep				= 17
x895063_g_IDX_YeLvYanDieScriptID		= 18
x895063_g_IDX_YeLvYanDiePosX				=	19
x895063_g_IDX_YeLvYanDiePosY				=	20


--**********************************
--任务入口函数....
--**********************************
function x895063_OnDefaultEvent( sceneId, selfId, targetId )

	--检测是否可以进入副本....
	local ret, msg = x895063_CheckCanEnter( sceneId, selfId, targetId )
	if 1 ~= ret then
		BeginEvent(sceneId)
			AddText(sceneId,msg)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--关闭NPC对话窗口....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

	x895063_MakeCopyScene( sceneId, selfId )
	local	nam	= LuaFnGetName( sceneId, selfId )
	BroadMsgByChatPipe( sceneId, selfId, "#YNh課 M鬾 Quan#W c b醥: G 疴y Khi猼 衋n b� t礳 t K� Tr, v鄆 ng鄖 n鎍 s� xu qu鈔 nam chinh ph誸 Trung Nguy阯. Nh 疬㧟 tin kh, #gffff00"..nam.."#W 疸 d鏽 d 鸬i ng� l t裞 l阯 疬秐g ti猲 皙n K� Tr th� s痭g ch猼 c呔p 疬㧟 #GChinh Nam Ti阯 Phong ?n#W 餰m v�.", 4 )

end

--**********************************
--列举事件
--**********************************
function x895063_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x894063_g_ScriptId, "#cFF0000S� chi猲 Binh Th醤h K� Tr", 10, 1 )

end

--**********************************
--检测是否可以进入此副本....
--**********************************
function x895063_CheckCanEnter( sceneId, selfId, targetId )
	--人数是否够....
	if GetTeamSize(sceneId,selfId) < x895063_g_LimitMembers then
		return 0, "械i ng� kh鬾g 瘘 3 ng叨i, kh鬾g th� ti猲 v鄌"
		end
	--是否有队伍....
	if LuaFnHasTeam(sceneId,selfId) ~= 1 then
		return 0, "#{PMF_20080521_02}"
	end

	--是不是队长....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		return 0, "#{PMF_20080521_03}"
	end

	--人数是否够....
	if GetTeamSize(sceneId,selfId) < x895063_g_LimitMembers then
		return 0, "械i ng� kh鬾g 瘘 3 ng叨i, kh鬾g th� ti猲 v鄌"
		end


	--是否都在附近....
	local NearTeamSize = GetNearTeamCount(sceneId,selfId)
	if GetTeamSize(sceneId,selfId) ~= NearTeamSize then
		return 0, "#{PMF_20080521_05}"
	end

	local Humanlist = {}
	local nHumanNum = 0

	--是否有人不够90级....
	for i=0, NearTeamSize-1 do
		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		if GetLevel( sceneId, PlayerId ) < 90 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end
	end

	if nHumanNum > 0 then

		local msg = "械i ng� "
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. ", "
		end
		msg = msg .. Humanlist[nHumanNum-1] .. " c 鸬 kh鬾g 瘘 C 120, kh鬾g th� ti猲 v鄌!"
		return 0, msg

	end


	--是否有人今天做过3次了....
	nHumanNum = 0
	local CurDayTime = GetDayTime()
	for i=0, NearTeamSize-1 do

		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		local lastTime = GetMissionData( sceneId, PlayerId, MD_GODOFFIRE_COMPLETE_DAYTIME )
		local lastDayTime = floor( lastTime / 100 )
		local lastDayCount = mod( lastTime, 100 )
	
		if CurDayTime > lastDayTime then
			lastDayTime = CurDayTime
			lastDayCount = 0
		end

		if lastDayCount >= 3 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end

	end

	if nHumanNum > 0 then

		local msg = ""
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. ", "
		end
		msg = msg .. Humanlist[nHumanNum-1] .. " 疸 tham gia ph� b鋘 3 l!"
		return 0, msg

	end
	--人数是否够....
	if GetTeamSize(sceneId,selfId) < x895063_g_LimitMembers then
		return 0, "械i ng� kh鬾g 瘘 3 ng叨i, kh鬾g th� ti猲 v鄌"
		end
	return 1

end

--**********************************
--创建副本....
--**********************************
function x895063_MakeCopyScene( sceneId, selfId )
	--人数是否够....
	if GetTeamSize(sceneId,selfId) < x895063_g_LimitMembers then
		return 0, "械i ng� kh鬾g 瘘 3 ng叨i, kh鬾g th� ti猲 v鄌"
		end
	local x = 0
	local z = 0
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)

	LuaFnSetSceneLoad_Map(sceneId, "BattleField.nav")
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid)
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x895063_g_NoUserTime*1000)
	LuaFnSetCopySceneData_Timer(sceneId, x895063_g_TickTime*1000)
	LuaFnSetCopySceneData_Param(sceneId, 0, x895063_g_CopySceneType)
	LuaFnSetCopySceneData_Param(sceneId, 1, x895063_g_ScriptId)
	LuaFnSetCopySceneData_Param(sceneId, 2, 0)
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)
	LuaFnSetCopySceneData_Param(sceneId, 4, x)
	LuaFnSetCopySceneData_Param(sceneId, 5, z)
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId))
	LuaFnSetCopySceneData_Param(sceneId, 7, 0)

	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	--人数是否够....
	if GetTeamSize(sceneId,selfId) < x895063_g_LimitMembers then
		return 0, "械i ng� kh鬾g 瘘 3 ng叨i, kh鬾g th� ti猲 v鄌"
		end
	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_BattleFlag_XiaoYiFeng, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_BattleFlag_XiaoRuJun, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_BattleFlag_YeLvYan, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_BattleFlag_Shuangzi, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_BattleFlag_YeLvLian, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_BattleFlag_PlayHp, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenOpenTime, LuaFnGetCurrentTime() )
	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_BQZTimerStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_BQZTimerScriptID, -1 )

	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_YeLvYanDieStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_YeLvYanDieScriptID, -1 )
	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_YeLvYanDiePosX, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_YeLvYanDiePosY, 0 )

	LuaFnSetSceneLoad_Area( sceneId, "BattleField_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "BattleField_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId)
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"D竎h chuy琻 th鄋h c鬾g!");
		else
			AddText(sceneId,"S� l唼ng b鋘 sao qu� t鋓, xin 瘙i m祎 l醫!");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

end

--**********************************
--副本事件....
--**********************************
function x895063_OnCopySceneReady( sceneId, destsceneId )

	--进入副本的规则
	-- 1，如果这个玩家没有组队，就传送这个玩家自己进入副本
	-- 2, 如果玩家有队伍，但是玩家不是队长，就传送自己进入副本
	-- 3，如果玩家有队伍，并且这个玩家是队长，就传送自己和附近队友一起进去

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
	local CurDayTime = GetDayTime()
	for	i=0,nearteammembercount-1 do

		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		local lastTime = GetMissionData( sceneId, PlayerId, MD_GODOFFIRE_COMPLETE_DAYTIME )
		local lastDayTime = floor( lastTime / 100 )
		local lastDayCount = mod( lastTime, 100 )

		if CurDayTime > lastDayTime then
			lastDayTime = CurDayTime
			lastDayCount = 0
		end

		if lastDayCount >= 3 then
			BeginEvent( sceneId )
				AddText( sceneId, "C醕 h� 疸 tham gia ph� b鋘 n鄖 3 l trong ng鄖 r癷!" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		return
		end
	end


	--统计创建副本次数....
	--AuditBQZCreateFuben( sceneId, leaderObjId )

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then
		NewWorld( sceneId, leaderObjId, destsceneId, x895063_g_Fuben_X, x895063_g_Fuben_Z) ;
	else
		local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
		local mems = {}
		for	i=0,nearteammembercount-1 do
			mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
			NewWorld( sceneId, mems[i], destsceneId, x895063_g_Fuben_X, x895063_g_Fuben_Z)
		end
	end

end

--**********************************
--副本场景定时器事件....
--**********************************
function x895063_OnCopySceneTimer( sceneId, nowTime )

	x895063_TickFubenLife( sceneId, nowTime )

	x895063_TickBQZTimer( sceneId, nowTime )

	x895063_TickYeLvYanDieTimer( sceneId, nowTime )

	x895063_TickJianWuArea( sceneId, nowTime )

end

--**********************************
--有玩家进入副本事件....
--**********************************
function x895063_OnPlayerEnter( sceneId, selfId )

	--设置死亡事件....
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x895063_g_Fuben_X, x895063_g_Fuben_Z )

	--设置挑战过一次缥缈峰....
	local lastTime = GetMissionData( sceneId, selfId, MD_GODOFFIRE_COMPLETE_DAYTIME )
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )
	local CurDayTime = GetDayTime()

	if CurDayTime > lastDayTime then
		lastDayTime = CurDayTime
		lastDayCount = 0
	end

	lastDayCount = lastDayCount + 1
	lastTime = lastDayTime * 100 + lastDayCount
	SetMissionData( sceneId, selfId, MD_GODOFFIRE_COMPLETE_DAYTIME, lastTime )

end

--**********************************
--有玩家在副本中死亡事件....
--**********************************
function x895063_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--提示所有副本内玩家....
--**********************************
function x895063_TipAllHuman( sceneId, Str )

	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, Str)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId, PlayerId)
		end
	end

end

--**********************************
--Tick副本生命期....
--**********************************
function x895063_TickFubenLife( sceneId, nowTime )

	local openTime = LuaFnGetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenOpenTime )
	local leftTime = openTime + x895063_g_FuBenTime - LuaFnGetCurrentTime()
	local lifeStep = LuaFnGetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep )

	if lifeStep == 15 then

		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep, 16 )

		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		local oldSceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )
		local oldX = LuaFnGetCopySceneData_Param( sceneId, 4 )
		local oldZ = LuaFnGetCopySceneData_Param( sceneId, 5 )
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
				NewWorld( sceneId, PlayerId, oldSceneId, oldX, oldZ )
			end
		end

		return

	end

	if lifeStep == 14 then
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep, 15 )
		x895063_TipAllHuman( sceneId, "Ph� b鋘 s� 痼ng c豠 sau 1 gi鈟!" )
		return
	end

	if lifeStep == 13 then
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep, 14 )
		x895063_TipAllHuman( sceneId, "Ph� b鋘 s� 痼ng c豠 sau 2 gi鈟!" )
		return
	end

	if lifeStep == 12 then
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep, 13 )
		x895063_TipAllHuman( sceneId, "Ph� b鋘 s� 痼ng c豠 sau 3 gi鈟!" )
		return
	end

	if lifeStep == 11 then
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep, 12 )
		x895063_TipAllHuman( sceneId, "Ph� b鋘 s� 痼ng c豠 sau 4 gi鈟!" )
		return
	end

	if lifeStep == 10 then
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep, 11 )
		x895063_TipAllHuman( sceneId, "Ph� b鋘 s� 痼ng c豠 sau 5 gi鈟!" )
		return
	end

	if leftTime <= 10 and lifeStep == 9 then
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep, 10 )
		x895063_TipAllHuman( sceneId, "Ph� b鋘 s� 痼ng c豠 sau 10 gi鈟!" )
		return
	end

	if leftTime <= 30 and lifeStep == 8 then
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep, 9 )
		x895063_TipAllHuman( sceneId, "Ph� b鋘 s� 痼ng c豠 sau 30 gi鈟!" )
		return
	end

	if leftTime <= 60 and lifeStep == 7 then
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep, 8 )
		x895063_TipAllHuman( sceneId, "Ph� b鋘 s� 痼ng c豠 sau 1 ph鷗!" )
		return
	end

	if leftTime <= 120 and lifeStep == 6 then
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep, 7 )
		x895063_TipAllHuman( sceneId, "Ph� b鋘 s� 痼ng c豠 sau 2 ph鷗!" )
		return
	end

	if leftTime <= 180 and lifeStep == 5 then
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep, 6 )
		x895063_TipAllHuman( sceneId, "Ph� b鋘 s� 痼ng c豠 sau 3 ph鷗!" )
		return
	end

	if leftTime <= 300 and lifeStep == 4 then
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep, 5 )
		x895063_TipAllHuman( sceneId, "Ph� b鋘 s� 痼ng c豠 sau 5 ph鷗!" )
		return
	end

	if leftTime <= 900 and lifeStep == 3 then
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep, 4 )
		x895063_TipAllHuman( sceneId, "Ph� b鋘 s� 痼ng c豠 sau 15 ph鷗!" )
		return
	end

	if leftTime <= 1800 and lifeStep == 2 then
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep, 3 )
		x895063_TipAllHuman( sceneId, "Ph� b鋘 s� 痼ng c豠 sau 30 ph鷗!" )
		return
	end

	if leftTime <= 3600 and lifeStep == 1 then
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep, 2 )
		x895063_TipAllHuman( sceneId, "Ph� b鋘 s� 痼ng c豠 sau 60 ph鷗!" )
		return
	end

	--初始化副本内的NPC....
	if lifeStep == 0 then

		local MstId = x895063_CreateBOSS( sceneId, "XiaoYiFeng_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x895063_CreateBOSS( sceneId, "XiaoRuJun_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x895063_CreateBOSS( sceneId, "XiaoRuWei_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x895063_CreateBOSS( sceneId, "YeLvYan_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x895063_CreateBOSS( sceneId, "LiFan_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_FuBenLifeStep, 1 )

		return
	end

end

--**********************************
--Tick缥缈峰计时器....
--**********************************
function x895063_TickBQZTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x895063_g_IDX_BQZTimerStep )
	if step <= 0 then
		return
	end
	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x895063_g_IDX_BQZTimerScriptID )

	--回调指定脚本的OnTimer....
	CallScriptFunction( scriptID, "OnBQZTimer", sceneId, step )

	--如果已经走完所有step则关闭计时器....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_BQZTimerStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_BQZTimerScriptID, -1 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_BQZTimerStep, step )
	end

end

--**********************************
--开启缥缈峰计时器....
--**********************************
function x895063_OpenBQZTimer( sceneId, allstep, ScriptID )

	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_BQZTimerStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_BQZTimerScriptID, ScriptID )

end

--**********************************
--当前缥缈峰计时器是否激活....
--**********************************
function x895063_IBQZSTimerRunning( sceneId )

	local step = LuaFnGetCopySceneData_Param( sceneId, x895063_g_IDX_BQZTimerStep )
	if step > 0 then
		return 1
	else
		return 0
	end

end

--**********************************
--Tick乌老大死亡计时器....
--**********************************
function x895063_TickYeLvYanDieTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x895063_g_IDX_YeLvYanDieStep )
	if step <= 0 then
		return
	end

	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x895063_g_IDX_YeLvYanDieScriptID )
	local posX = LuaFnGetCopySceneData_Param( sceneId, x895063_g_IDX_YeLvYanDiePosX )
	local posY = LuaFnGetCopySceneData_Param( sceneId, x895063_g_IDX_YeLvYanDiePosY )

	--回调指定脚本的OnTimer....
	CallScriptFunction( scriptID, "OnXiaoYiFengDieTimer", sceneId, step, posX, posY )

	--如果已经走完所有step则关闭计时器....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_YeLvYanDieStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_YeLvYanDieScriptID, -1 )
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_YeLvYanDiePosX, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_YeLvYanDiePosY, 0 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_YeLvYanDieStep, step )
	end

end

--**********************************
--开启乌老大死亡计时器....
--**********************************
function x895063_OpenYeLvYanDieTimer( sceneId, allstep, ScriptID, posX, posY )

	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_YeLvYanDieStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_YeLvYanDieScriptID, ScriptID )
	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_YeLvYanDiePosX, posX )
	LuaFnSetCopySceneData_Param( sceneId, x895063_g_IDX_YeLvYanDiePosY, posY )

end

--**********************************
--Tick剑舞区域....
--只要玩家站在场景里的6个光柱内....每秒都能获得一个免疫剑舞的buff....
--**********************************
function x895063_TickJianWuArea( sceneId, nowTime )

end

--**********************************
--创建指定BOSS....
--**********************************
function x895063_CreateBOSS( sceneId, name, x, y )

	local BOSSData = x895063_g_BOSSList[name]
	if not BOSSData then
		return
	end

	local posX = 0
	local posY = 0
	if x ~= -1 and y ~= -1 then
		posX = x
		posY = y
	else
		posX = BOSSData.posX
		posY = BOSSData.posY
	end

	local MstId = LuaFnCreateMonster( sceneId, BOSSData.DataID, posX, posY, BOSSData.BaseAI, BOSSData.AIScript, BOSSData.ScriptID )
	--SetUnitReputationID(sceneId, selfId, nMonsterId, 29)   --by yaya
	SetUnitCampID(sceneId, MstId, MstId, 110)

	--SetObjDir( sceneId, MstId, BOSSData.Dir )
	SetMonsterFightWithNpcFlag( sceneId, MstId, 0 )
	if BOSSData.Title ~= "" then
		SetCharacterTitle(sceneId, MstId, BOSSData.Title)
	end

	LuaFnSendSpecificImpactToUnit(sceneId, MstId, MstId, MstId, 152, 0)

	--统计创建BOSS....
	--AuditBQZCreateBoss( sceneId, BOSSData.DataID )

	return MstId

end

--**********************************
--删除指定BOSS....
--**********************************
function x895063_DeleteBOSS( sceneId, name )

	local BOSSData = x895063_g_BOSSList[name]
	if not BOSSData then
		return
	end

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if BOSSData.DataID == GetMonsterDataID( sceneId, MonsterId ) then
			--LuaFnDeleteMonster( sceneId, MonsterId )
			LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 152, 0)
			SetCharacterDieTime( sceneId, MonsterId, 1000 )
		end
	end

end

--**********************************
--寻找指定BOSS....
--**********************************
function x895063_FindBOSS( sceneId, name )

	local BOSSData = x895063_g_BOSSList[name]
	if not BOSSData then
		return -1
	end

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if BOSSData.DataID == GetMonsterDataID( sceneId, MonsterId ) then
			return MonsterId
		end
	end

	return -1

end

--**********************************
--检测当前是否已经存在一个BOSS了....
--**********************************
function x895063_CheckHaveBOSS( sceneId )

	local BossList = {}
	local nBossNum = 0

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			local DataID = GetMonsterDataID( sceneId, MonsterId )
			for j, dataId in x895063_g_FightBOSSList do
				if DataID == dataId then
					BossList[nBossNum] = GetName( sceneId, MonsterId )
					nBossNum = nBossNum + 1
				end
			end
		end
	end

	if nBossNum > 0 then
		local msg = "衋ng c鵱g "
		for i=0, nBossNum-2 do
			msg = msg .. BossList[i] .. ", "
		end
		msg = msg .. BossList[nBossNum-1] .. " chi猲 黏u sinh t� t読 Binh Th醤h K� Tr"
		return 1, msg
	end

	return 0, ""

end

--**********************************
--获取是否可以挑战某个BOSS的标记....
--**********************************
function x895063_GetBossBattleFlag( sceneId, bossName )

	local idx = x895063_g_BattleFlagTbl[ bossName ]
	return LuaFnGetCopySceneData_Param( sceneId, idx )

end

--**********************************
--设置是否可以挑战某个BOSS的标记....
--**********************************
function x895063_SetBossBattleFlag( sceneId, bossName, bCan )

	local idx = x895063_g_BattleFlagTbl[ bossName ]
	LuaFnSetCopySceneData_Param( sceneId, idx, bCan )

end
