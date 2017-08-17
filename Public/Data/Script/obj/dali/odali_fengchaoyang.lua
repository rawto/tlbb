--�ﳯ��

--�ű���
x002037_g_scriptId = 002037


--��ӵ�е��¼�ID�б�
x002037_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x002037_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "C� n߽ng"
	else
		PlayerSex = "Thi�u hi�p"
	end
	BeginEvent(sceneId)
			AddText(sceneId,"  "..PlayerName..PlayerSex..", n�u ng߽i mu�n c�ng ng߶i kh�c lu�n b�n v� c�ng, h�y l�n tr�n L�i ��i �i!")
			AddNumText(sceneId,x002037_g_scriptId,"Ъn L�i ��i",11,0)
	for i, eventId in x002037_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002037_OnDefaultEvent( sceneId, selfId,targetId )
	x002037_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002037_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText() == 0	then
		BeginEvent(sceneId)
			local  PlayerName=GetName(sceneId,selfId)
			AddText(sceneId,"#{OBJ_dali_0055}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	for i, findId in x002037_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002037_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002037_g_eventList do
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
--�ܾ���NPC������
--**********************************
function x002037_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002037_g_eventList do
		if missionScriptId == findId then
			x002037_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002037_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002037_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002037_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002037_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002037_OnDie( sceneId, selfId, killerId )
end