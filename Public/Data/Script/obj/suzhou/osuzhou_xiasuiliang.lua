-- 001071
-- 夏遂良 

--脚本号
x001071_g_scriptId = 001071

--所拥有的事件ID列表
x001071_g_eventList={125020}

--**********************************
--事件列表
--**********************************
function x001071_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  #G$N#WAnh h鵱g, ti猲 v鄌 Tung S絥 Phong Thi玭 朽i ch裯g t� th馽 l馽 c黙 ng呓i 餴.#r#W C gia nh m祎 chi猲 鸬i m緄 c� th� ti猲 v鄌. Ch� � gi猼 h猼 c醕 鸶ch nh鈔 瓞 鹫t 疬㧟 b鋙 v trong 姓i B鋙 S呓ng nh�.");
		for i, eventId in x001071_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001071_OnDefaultEvent( sceneId, selfId,targetId )
	x001071_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001071_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001071_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001071_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001071_g_eventList do
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
function x001071_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001071_g_eventList do
		if missionScriptId == findId then
			x001071_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001071_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001071_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001071_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001071_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x001071_OnDie( sceneId, selfId, killerId )
	
end
