--马植

--脚本号
x018003_g_scriptId = 018003


--所拥有的事件ID列表
x018003_g_eventList={}

--**********************************
--事件列表
--**********************************
function x018003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"Gia Lu t呔ng qu鈔, nghe n骾 ng叨i n呔c Kim kh鬾g 疬㧟 瘘 m祎 v課, n猽 瘘 m祎 v課 th� thi阯 h� v� 鸶ch, c� 瘊ng l� th nh� v kh鬾g?")
	for i, eventId in x018003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x018003_OnDefaultEvent( sceneId, selfId,targetId )
	x018003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x018003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x018003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x018003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018003_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x018003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x018003_g_eventList do
		if missionScriptId == findId then
			x018003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x018003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x018003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x018003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x018003_OnDie( sceneId, selfId, killerId )
end
