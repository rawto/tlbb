-- 002058
-- 白崇义

--脚本号
x002058_g_scriptId = 002058

--所拥有的事件ID列表
x002058_g_eventList={125020}

--**********************************
--事件列表
--**********************************
function x002058_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  #G$N#WAnh h鵱g! 歇n Phong Thi玭 朽i ch裯g t� th馽 l馽 c黙 ng呓i 餴! H銀 gia nh m祎 鸬t ng�, c鵱g 鸬i tr叻ng ti猲 v鄌 C課h K� Tr叨ng - Phong Thi玭 朽i, h銀 疳nh b読 t c� c醕 鸠i th� 瓞 gi鄋h c醕 b醬 v trong 姓i B鋙 S呓ng qu� hi猰 nh�!");
		for i, eventId in x002058_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002058_OnDefaultEvent( sceneId, selfId,targetId )
	x002058_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002058_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002058_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002058_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002058_g_eventList do
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
function x002058_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002058_g_eventList do
		if missionScriptId == findId then
			x002058_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002058_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002058_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002058_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002058_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002058_OnDie( sceneId, selfId, killerId )
end
