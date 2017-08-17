-- 000144
-- �ĺ���

--�ű���
x000144_g_scriptId = 000144

--��ӵ�е��¼�ID�б�
x000144_g_eventList={125020}

--**********************************
--�¼��б�
--**********************************
function x000144_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  #G$N#WAnh h�ng! Ъn Tung S�n phong thi�n ��i c�nh k� tr߶ng bi�u hi�n th�c l�c c�a c�c h� �i! #GC�c h� tr߾c khi b߾c v�o phong thi�n ��i nh�t thi�t ph�i l�p 1 t� �i, t�t c� ng߶i trong t� �i l�c v�o phong thi�n ��i s� thu�c tr�n h�nh");
		for i, eventId in x000144_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000144_OnDefaultEvent( sceneId, selfId,targetId )
	x000144_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000144_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000144_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000144_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000144_g_eventList do
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
function x000144_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000144_g_eventList do
		if missionScriptId == findId then
			x000144_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000144_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000144_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000144_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000144_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000144_OnDie( sceneId, selfId, killerId )
end