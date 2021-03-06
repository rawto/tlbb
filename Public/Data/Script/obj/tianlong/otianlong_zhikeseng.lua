--天龙寺NPC
--问路
--脚本号
x013034_g_scriptId = 013034

--所拥有的事件ID列表
x013034_g_eventList={500066}	

--**********************************
--事件列表
--**********************************
function x013034_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = " c� n呓ng "
		else
			PlayerSex = " thi猽 hi畃 "
		end
		AddText(sceneId,"Thi阯 Long T� l� ch痭 tu h鄋h c黙 c醕 v� vua n呔c 姓i L� sau khi tr� v�. C醕 h� m緄 皙n, ch� l鄊 phi玭 h�. C� g� kh� kh錸 ti瑄 t錸g s� gi鷓 疝 c醕 h�.")
		for i, eventId in x013034_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x013034_OnDefaultEvent( sceneId, selfId,targetId )
	x013034_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x013034_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
	return
end

--**********************************
--接受此NPC的任务
--**********************************
function x013034_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x013034_g_eventList do
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
function x013034_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x013034_g_eventList do
		if missionScriptId == findId then
			x013034_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x013034_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x013034_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x013034_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x013034_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x013034_OnDie( sceneId, selfId, killerId )
end
