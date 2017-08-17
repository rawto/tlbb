--�Ϻ�NPC
--Ҷ����
--��ͨ

--�ű���
x034001_g_scriptId = 34001

--��ӵ�е��¼�ID�б�
x034001_g_eventList={212114}

--**********************************
--�¼��б�
--**********************************
function x034001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"R�t c�c l� ai g�y ra! Ta nh�t �nh ph�i t�m ra hung th�, ta mu�n �em �u h�n t� vong linh s� ph�, s� n߽ng v� t�t c� nh�ng ng߶i c�a Nam H�i ki�m ph�i! #r#rC�u s� mu�i ��ng th߽ng nh�t, s� mu�i nh�t �nh r�t �au l�ng... Trong tim n�ng �y, ch� c� ��i s� huynh.")
		for i, eventId in x034001_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x034001_OnDefaultEvent( sceneId, selfId,targetId )
	x034001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x034001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x034001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x034001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x034001_g_eventList do
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
function x034001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x034001_g_eventList do
		if missionScriptId == findId then
			x034001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x034001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x034001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x034001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x034001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x034001_OnDie( sceneId, selfId, killerId )
end