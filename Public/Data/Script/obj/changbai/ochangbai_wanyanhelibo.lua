--完颜盈哥

--脚本号
x022008_g_scriptId = 022008

--所拥有的事件ID列表
x022008_g_eventList={}--211300,211306	

--**********************************
--事件列表
--**********************************
function x022008_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"校c s� 鹫i nh鈔, da c黙 Ho鄋 Nhan b� l誧 c痭g n誴 l� t痶 nh, t痶 h絥 nhi玼 so v緄 b� l誧 H痶 Th誧h Li畉. S� H� c痶 th唼ng h課 n鄖 l� cho 穑c s� 鹫i nh鈔, xin c醕 h� n骾 nh鎛g l秈 t痶 皓p tr呔c m 鹫i v呓ng, n骾 rg b� l誧 Ho鄋 Nhan m鉯 m鉯 trung th鄋h v緄 n呔c Li陁.")
	for i, eventId in x022008_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x022008_OnDefaultEvent( sceneId, selfId,targetId )
	x022008_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x022008_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x022008_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x022008_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022008_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
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
function x022008_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x022008_g_eventList do
		if missionScriptId == findId then
			x022008_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x022008_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x022008_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x022008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x022008_OnDie( sceneId, selfId, killerId )
end
