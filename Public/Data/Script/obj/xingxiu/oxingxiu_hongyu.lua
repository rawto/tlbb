--星宿NPC
--红玉
--普通

--五神洞副本任务npc

--脚本号
x016002_g_scriptId = 016002


--所拥有的事件ID列表
x016002_g_eventList={227901}

--**********************************
--事件列表
--**********************************
function x016002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName..", trong Ng� Th 械ng c� r nhi玼 qu醝 v 黏y, ch� c� Th� Trung ca ca khi 餴 c鵱g v緄 ta th� ta m緄 d醡 v鄌 trong 痼. Ng呓i c鹡g mu痭 v鄌 trong Ng� th 鸬ng khi陁 chi猲 hay sao?")
		for i, findId in x016002_g_eventList do
			CallScriptFunction( x016002_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x016002_OnDefaultEvent( sceneId, selfId,targetId )
	x016002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x016002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x016002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x016002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x016002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId , targetId)
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x016002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x016002_g_eventList do
		if missionScriptId == findId then
			x016002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x016002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x016002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x016002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x016002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x016002_OnDie( sceneId, selfId, killerId )
end

