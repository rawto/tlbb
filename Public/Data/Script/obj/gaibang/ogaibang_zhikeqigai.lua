--丐帮NPC
--问路
--脚本号
x010034_g_scriptId = 010034

--所拥有的事件ID列表
x010034_g_eventList={500063}	

--**********************************
--事件列表
--**********************************
function x010034_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = " c� n呓ng "
		else
			PlayerSex = " thi猽 hi畃 "
		end
		AddText(sceneId,"Hoan ngh阯h c醕 h� t緄 b鋘 bang. C� g� c gi鷓 疝 c� n骾 v緄 t読 h�, n猽 gi鷓 疬㧟, t読 h� s莕 s鄋g gi鷓 c醕 h� h猼 m靚h.")
		for i, eventId in x010034_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x010034_OnDefaultEvent( sceneId, selfId,targetId )
	x010034_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x010034_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
	return
end

--**********************************
--接受此NPC的任务
--**********************************
function x010034_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010034_g_eventList do
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
function x010034_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x010034_g_eventList do
		if missionScriptId == findId then
			x010034_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x010034_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010034_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x010034_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x010034_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x010034_OnDie( sceneId, selfId, killerId )
end
