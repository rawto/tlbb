--梅岭NPC
--月季
--普通

--脚本号
x033009_g_scriptId = 033009

--所拥有的事件ID列表
x033009_g_eventList={212113}

--**********************************
--事件列表
--**********************************
function x033009_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"G 疴y Th醝 D呓ng Hoa t� t� r hay n眎 gi v� c�, l� l鵱g th! C鹡g ch苙g bi猼 T� Vi t� t� b阯 痼 c� vi甤 g� kh鬾g, 疸 l鈛 r癷 kh鬾g c� tin t裞 g� c�. #r#rC鹡g ch苙g bi猼 Kinh C鷆 餫ng l鄊 c醝 g�, m h鬽 nay c鋗 gi醕 r ng n�, t馻 nh� s c� g� 痼 x鋣 ra. 詉, ch l� m靚h l読 餫 ngh� r癷.")
		for i, eventId in x033009_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x033009_OnDefaultEvent( sceneId, selfId,targetId )
	x033009_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x033009_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x033009_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x033009_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x033009_g_eventList do
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
function x033009_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x033009_g_eventList do
		if missionScriptId == findId then
			x033009_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x033009_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x033009_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x033009_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x033009_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x033009_OnDie( sceneId, selfId, killerId )
end
