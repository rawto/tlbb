--缥缈峰副本....
--哈大霸对话脚本....

--脚本号
x895070_g_ScriptId = 895070

--副本逻辑脚本号....
x895070_g_FuBenScriptId = 895063

--**********************************
--任务入口函数....
--**********************************
function x895070_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"Thi阯 疬秐g c� 疬秐g ng呓i kh鬾g 餴, c� th韈h xu痭g t靘 g qu� d� xoa 鸶a ng鴆 l鄊 chi?")
		--判断当前是否可以挑战....	
		if 0 == CallScriptFunction( x895070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "XiaoYiFeng" ) then
		    AddNumText( sceneId, x895070_g_ScriptId, "Khi陁 chi猲", 10, 1 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件列表选中一项
--**********************************
function x895070_OnEventRequest( sceneId, selfId, targetId, eventId )

	--如果正在激活BOSS则返回....
	if 1 == CallScriptFunction( x895070_g_FuBenScriptId, "IBQZSTimerRunning", sceneId ) then
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
	local ret, msg = CallScriptFunction( x895070_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--判断当前是否可以挑战桑土公....	
	if 0 ~= CallScriptFunction( x895070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "XiaoYiFeng" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "Ng呓i 疸 khi陁 chi猲 r癷!" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--开启缥缈峰计时器来激活自己....
	CallScriptFunction( x895070_g_FuBenScriptId, "OpenBQZTimer", sceneId, 7, x895070_g_ScriptId, -1 ,-1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--缥缈峰计时器的OnTimer....
--**********************************
function x895070_OnBQZTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x895070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 5 gi鈟 sau b 馥u!" )
		return
	end

	if 6 == step then
		CallScriptFunction( x895070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 4 gi鈟 sau b 馥u!" )
		return
	end

	if 5 == step then
		CallScriptFunction( x895070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 3 gi鈟 sau b 馥u!" )
		return
	end

	if 4 == step then
		CallScriptFunction( x895070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 2 gi鈟 sau b 馥u!" )
		return
	end

	if 3 == step then
		CallScriptFunction( x895070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 1 gi鈟 sau b 馥u!" )
		return
	end

	if 2 == step then
		--提示Chi猲 黏u b 馥u!....
		CallScriptFunction( x895070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u b 馥u!" )
		--删除NPC....
		CallScriptFunction( x895070_g_FuBenScriptId, "DeleteBOSS", sceneId, "XiaoYiFeng_NPC" )
		return
	end

	if 1 == step then
		--建立BOSS....
		CallScriptFunction( x895070_g_FuBenScriptId, "CreateBOSS", sceneId, "XiaoYiFeng_BOSS", -1, -1 )
		return
	end

end
