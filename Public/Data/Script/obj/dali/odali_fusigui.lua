--傅思归

--脚本号
x002013_g_scriptId = 002013

--所拥有的事件ID列表
x002013_g_eventList={}
--x002013_g_eventList={201002,201101,201102,201103}

--**********************************
--事件列表
--**********************************
function x002013_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "C� n呓ng"
	else
		PlayerSex = "Thi猽 hi畃"
	end
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"Nghe n骾 � V� L唼ng S絥, Cao S絥 B誧h Vi阯 lu鬾 痄 th呓ng ng叨i, "..PlayerName..PlayerSex..", ch� th阭 v鄆 ng鄖 n鎍 r癷 c鵱g ch鷑g ta - T� 姓i H� V� c鵱g l阯 n鷌 m祎 chuy猲 tr� y陁 th叻ng ngo課 lu鬾 nh�!");
	for i, eventId in x002013_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002013_OnDefaultEvent( sceneId, selfId,targetId )
	x002013_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002013_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002013_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002013_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002013_g_eventList do
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
function x002013_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002013_g_eventList do
		if missionScriptId == findId then
			x002013_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002013_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002013_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002013_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002013_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002013_OnDie( sceneId, selfId, killerId )
end
