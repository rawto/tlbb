x400926_g_ScriptId = 400926

x400926_left 	=91.0000
x400926_right	=95.0000

x400926_top  	=42.0000
x400926_bottom	=46.0000


--玩家进入一个 area 时触发
function x400926_OnEnterArea( sceneId, selfId )

BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400926_g_ScriptId);
		UICommand_AddString(sceneId, "GotoYexihu");
		UICommand_AddString(sceneId, "D� T鈟 H� l� khu v馽 kh鬾g t錸g s醫 kh�, c醕 h� x醕 nh ti猲 v鄌?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 121,84,48)
end

--玩家在一个 area 呆了一段时间没走则定时触发
function x400926_OnTimer( sceneId, selfId )
	-- 毫秒，看在这个 area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5秒后仍未传送
	if StandingTime >= 5000 then
		x400926_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开一个 area 时触发
function x400926_OnLeaveArea( sceneId, selfId )
end

--**********************************
--任务入口函数
--**********************************
function x400926_GotoYexihu( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	
	-- 检查玩家是不是还在这个范围内
	if sceneId ~= 30   then
		--C � 瘊ng 餴琺 truy玭 t痭g!
		BeginEvent(sceneId)
			AddText(sceneId,"C � 瘊ng 餴琺 truy玭 t痭g!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400926_left or
			targetX > x400926_right or
			targetZ < x400926_top  or
			targetZ > x400926_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"C � 瘊ng 餴琺 truy玭 t痭g!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 121,84,48)
		
end
