--缥缈峰副本....
--乌老大对话脚本....

--脚本号
x890072_g_ScriptId = 890072

--副本逻辑脚本号....
x890072_g_FuBenScriptId = 890063

--战败乌老大对话脚本号....
x890072_g_LossScriptId = 890075

--**********************************
--任务入口函数....
--**********************************
function x890072_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)

		AddText( sceneId, "H遪g ph鴆 姓i Y猲 th t叻ng trong v� v鱪g...#rThi阯 羞秐g c� 疬秐g l緉 ng呓i kh鬾g 餴, 鸶a ng鴆 v� m鬾 ng呓i l読 d鏽 x醕 皙n.#r#b#YN誴 m課g 餴!...." )
		AddNumText( sceneId, x890072_g_ScriptId, "Khi陁 chi猲", 10, 1 )

		--判断当前是否可以挑战李秋水....	
		--if 1 == CallScriptFunction( x890072_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "DingChunQiu" ) then
			--AddNumText( sceneId, x890072_g_ScriptId, "决战李秋水？", 10, 2 )
		--end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件列表选中一项
--**********************************
function x890072_OnEventRequest( sceneId, selfId, targetId, eventId )

	--如果正在激活BOSS则返回....
	if 1 == CallScriptFunction( x890072_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
		return
	end

	--是不是队长....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		BeginEvent(sceneId)
			AddText( sceneId, "#{PMF_20080521_07}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--如果正在和别的BOSSChi猲 黏u 则返回....
	local ret, msg = CallScriptFunction( x890072_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	if GetNumText() == 1 then

		--判断当前是否可以挑战乌老大....	
		if 1 ~= CallScriptFunction( x890072_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "MuRongFu" ) then
			BeginEvent(sceneId)
				AddText( sceneId, "#{PMF_20080521_11}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		--开启缥缈峰计时器来激活自己....
		CallScriptFunction( x890072_g_FuBenScriptId, "OpenPMFTimer", sceneId, 7, x890072_g_ScriptId, -1 ,-1 )

	elseif GetNumText() == 2 then

		--判断当前是否可以挑战李秋水....	
		if 1 ~= CallScriptFunction( x890072_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "DingChunQiu" ) then
			return
		end
		--开启缥缈峰计时器来激活李秋水....
		CallScriptFunction( x890072_g_FuBenScriptId, "OpenPMFTimer", sceneId, 7, x890072_g_LossScriptId, -1 ,-1 )

	end

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--缥缈峰计时器的OnTimer....
--**********************************
function x890072_OnPMFTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x890072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 5 gi鈟 sau b 馥u." )
		return
	end

	if 6 == step then
		CallScriptFunction( x890072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 4 gi鈟 sau b 馥u." )
		return
	end

	if 5 == step then
		CallScriptFunction( x890072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 3 gi鈟 sau b 馥u." )
		return
	end

	if 4 == step then
		CallScriptFunction( x890072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 2 gi鈟 sau b 馥u." )
		return
	end

	if 3 == step then
		CallScriptFunction( x890072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 1 gi鈟 sau b 馥u." )
		return
	end

	if 2 == step then
		--提示Chi猲 黏u b 馥u.....
		CallScriptFunction( x890072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u b 馥u." )
		--删除NPC....
		CallScriptFunction( x890072_g_FuBenScriptId, "DeleteBOSS", sceneId, "MuRongFu_NPC" )
		return
	end

	if 1 == step then
		--建立BOSS....
		CallScriptFunction( x890072_g_FuBenScriptId, "CreateBOSS", sceneId, "MuRongFu_BOSS", -1, -1 )
		return
	end

end
