--高俅

--脚本号
x000003_g_scriptId = 000003

--所拥有的事件ID列表
x000003_g_eventList={201211,201312}		

--**********************************
--事件列表
--**********************************
function x000003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"邪ng 鹫i nh鈔 疸 ti猲 c� ta tr呔c m 衞an v呓ng, c� h礽 c黙 ta 疸 皙n ch� c ng叨i theo ta, t nhi阯 vinh hoa ph� qu� h叻ng kh鬾g h猼, ha ha!");
	for i, eventId in x000003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000003_OnDefaultEvent( sceneId, selfId,targetId )
	x000003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000003_g_eventList do
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
function x000003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000003_g_eventList do
		if missionScriptId == findId then
			x000003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000003_OnDie( sceneId, selfId, killerId )
end
