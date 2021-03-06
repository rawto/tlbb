--明教NPC
--问路
--脚本号
x011034_g_scriptId = 011034

--所拥有的事件ID列表
x011034_g_eventList={500062}	

--**********************************
--事件列表
--**********************************
function x011034_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = " c� n呓ng "
		else
			PlayerSex = " thi猽 hi畃 "
		end
		AddText(sceneId,"Quang Minh 衖畁 th醤h h鯽 r馽 ch醳, n猽 kh鬾g c th 瓞 r絠 xu痭g Li畉 H鯽 th� ch� c騨 疬秐g b醤 m課g cho Qu� D� Xoa. N猽 c鋗 th kh� kh錸 c醕 h� c� th� t靘 ta, ta s� ch� 疬秐g gi鷓.")
		for i, eventId in x011034_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x011034_OnDefaultEvent( sceneId, selfId,targetId )
	x011034_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x011034_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
	return
end

--**********************************
--接受此NPC的任务
--**********************************
function x011034_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x011034_g_eventList do
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
function x011034_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x011034_g_eventList do
		if missionScriptId == findId then
			x011034_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x011034_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x011034_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x011034_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x011034_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x011034_OnDie( sceneId, selfId, killerId )
end
