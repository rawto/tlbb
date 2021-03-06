--耶律余睹

--脚本号
x019003_g_scriptId = 019003


--所拥有的事件ID列表
x019003_g_eventList={200032,200033}--211001,211006,211007}

--**********************************
--事件列表
--**********************************
function x019003_UpdateEventList( sceneId, selfId,targetId )

	BeginEvent(sceneId)
	AddText(sceneId,"M d� M� Ph� t c鬾g 鹫i doanh c黙 ta, nh遪g ta lo lg nh v鏽 l� T痭g tri玼 #RKh鷆 衞an#W, kh鬾g ti陁 di畉 疬㧟 con ng叨i n鄖, th� bi阯 c呓ng ph韆 Nam c黙 n呔c Li陁 kh鬾g bao gi� 疬㧟 b靚h y阯.")
	for i, eventId in x019003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x019003_OnDefaultEvent( sceneId, selfId,targetId )
	x019003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x019003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x019003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x019003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x019003_g_eventList do
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
function x019003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x019003_g_eventList do
		if missionScriptId == findId then
			x019003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x019003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x019003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x019003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x019003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x019003_OnDie( sceneId, selfId, killerId )

end

