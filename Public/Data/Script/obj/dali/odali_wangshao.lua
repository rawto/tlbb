--大理NPC
--王韶
--普通

--脚本号
x002000_g_scriptId = 002000

--所拥有的事件ID列表
x002000_g_eventList = { 212117, 228902, 228904, 212140, 212144 }

--**********************************
--事件列表
--**********************************
function x002000_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "Nhung l鴄 c� 鸲i, ph� qu� ho鄋g kim c鹡g ch� xem nh� l� m鈟 kh骾. 姓i T痭g 姓i L� hai n呔c h騛 b靚h th竛h v唼ng, d鈔 ch鷑g c鹡g 疬㧟  no h課h ph鷆..." )
		for i, eventId in x002000_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件交互入口
--**********************************
function x002000_OnDefaultEvent( sceneId, selfId, targetId )
	x002000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002000_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002000_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002000_g_eventList do
		if missionScriptId == findId then
			local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end

			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x002000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002000_g_eventList do
		if missionScriptId == findId then
			x002000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002000_OnDie( sceneId, selfId, killerId )
end
