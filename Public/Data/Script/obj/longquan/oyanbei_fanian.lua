--鲁平


--脚本号
x031004_g_scriptId = 031004

--所拥有的事件ID列表
x031004_g_eventList={212119}

--**********************************
--事件列表
--**********************************
function x031004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"Y陁 疬絥g ham mu痭 ng叨i kh醕, th馽 gi痭g 饀痗 餴 ng唼c gi�, t c� c醝 h鱝 b鰊g tay. #r#rT� y陁 t sinh bu皀 r, c� y陁 t sinh lo s�, n猽 r秈 xa y陁, c騨 g� 瓞 bu皀 瓞 s�... #r#rTh� ch� c� hi瑄 ch錸g?")
	for i, eventId in x031004_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x031004_OnDefaultEvent( sceneId, selfId,targetId )
	x031004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x031004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x031004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x031004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x031004_g_eventList do
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
function x031004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x031004_g_eventList do
		if missionScriptId == findId then
			x031004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x031004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x031004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x031004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x031004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x031004_OnDie( sceneId, selfId, killerId )
end

