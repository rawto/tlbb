--甘宝宝

--脚本号
x025001_g_scriptId = 025001

--所拥有的事件ID列表
x025001_g_eventList={}

--**********************************
--事件列表
--**********************************
function x025001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"H�! Ch� c ta c� m, kh鬾g ai 疬㧟 瘌ng t緄 T醫 Tang 鹫i nh鈔! #r#rT阯 m th鷌 T醫 L� kia n猽 ng呓i d醡 x鬾g v鄌, t緄 1 ta gi猼 1, t緄 2 ta gi猼 2!");
	for i, eventId in x025001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x025001_OnDefaultEvent( sceneId, selfId,targetId )
	x025001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x025001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x025001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x025001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x025001_g_eventList do
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
function x025001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x025001_g_eventList do
		if missionScriptId == findId then
			x025001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x025001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x025001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x025001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x025001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x025001_OnDie( sceneId, selfId, killerId )
end
