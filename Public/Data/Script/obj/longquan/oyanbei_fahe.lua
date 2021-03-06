--鲁平


--脚本号
x031006_g_scriptId = 031006

--所拥有的事件ID列表
x031006_g_eventList={}

--**********************************
--事件列表
--**********************************
function x031006_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"Nghe n骾 Ph醦 Ni甿 s� huynh tr呔c khi xu gia 疸 c� quan h� 穑c bi畉 v緄 v� s� ph� 瘊c ki猰 danh ti猲g L鬷 Ho醤, ch苙g bi猼 th馽 h� ra sao. #r#rC� 餴玼, m瞚 n錷 ti猼 Thanh Minh 皤u th m祎 n� th� ch� che m 皙n t靘 s� huynh, nh遪g m� s� huynh kh鬾g h� g m, h�, #r#rNghi畃 ch呔ng!")
	for i, eventId in x031006_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x031006_OnDefaultEvent( sceneId, selfId,targetId )
	x031006_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x031006_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x031006_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x031006_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x031006_g_eventList do
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
function x031006_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x031006_g_eventList do
		if missionScriptId == findId then
			x031006_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x031006_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x031006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x031006_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x031006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x031006_OnDie( sceneId, selfId, killerId )
end

