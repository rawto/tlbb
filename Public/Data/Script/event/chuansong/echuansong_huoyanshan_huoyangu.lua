x400932_g_ScriptId = 400932

x400932_left 	=25.0000
x400932_right	=31.0000

x400932_top =100.0000
x400932_bottom	=106.0000

--玩家进入一个 area 时触发
function x400932_OnEnterArea( sceneId, selfId,a,b )

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400932_g_ScriptId);
		UICommand_AddString(sceneId, "GotoHuoyangu");
		UICommand_AddString(sceneId, "H鯽 Di甿 C痗 l� khu v馽 kh鬾g t錸g s醫 kh�, c醕 h� x醕 nh ti猲 v鄌?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 519,71,29)
end

--玩家在一个 area 呆了一段时间没走则定时触发
function x400932_OnTimer( sceneId, selfId )
	-- 毫秒，看在这个 area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5秒后仍未传送
	if StandingTime >= 5000 then
		x400932_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开一个 area 时触发
function x400932_OnLeaveArea( sceneId, selfId )
end

--**********************************
--任务入口函数
--**********************************
function x400932_GotoHuoyangu( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	
	-- 检查玩家是不是还在这个范围内
	if sceneId ~= 423   then
		--C � 瘊ng 餴琺 truy玭 t痭g!
		BeginEvent(sceneId)
			AddText(sceneId,"C � 瘊ng 餴琺 truy玭 t痭g!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400932_left or
			targetX > x400932_right or
			targetZ < x400932_top  or
			targetZ > x400932_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"C � 瘊ng 餴琺 truy玭 t痭g!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 519,71,29)
		
end
