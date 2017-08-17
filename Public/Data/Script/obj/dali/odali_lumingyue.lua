--����NPC ���ռ���NPC   �������ܣ�1���ռ��ܵ�ѧϰ 2���⹤�ռ���
--³����
--��ͨ

--�ű���
x002064_g_ScriptId = 002064

--�̵���
x002064_g_shoptableindex=63

--��ӵ�е��¼�Id�б�
--estudy_gongyi = 713507
--elevelup_gongyi = 713566
--edialog_gongyi = 713606
--��ӵ�е��¼�ID�б�
x002064_g_eventList={713507,713566,713606}
--**********************************
--�¼��б�
--**********************************
function x002064_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_dali_0039}")
	for i, eventId in x002064_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--�̵�ѡ��
	AddNumText(sceneId,x002064_g_ScriptId,"Mua �� t�o �",7,ABILITY_TEACHER_SHOP)
	AddNumText(sceneId,x002064_g_ScriptId,"#{INTERFACE_XML_1196}",7,12)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002064_OnDefaultEvent( sceneId, selfId,targetId )
	x002064_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002064_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x002064_g_shoptableindex )
  elseif	GetNumText()==12	then
		DispatchShopItem( sceneId, selfId,targetId, 201 ) 
	end
	for i, findId in x002064_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x002064_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002064_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002064_g_eventList do
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
function x002064_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002064_g_eventList do
		if missionScriptId == findId then
			x002064_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002064_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002064_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002064_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002064_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002064_OnDie( sceneId, selfId, killerId )
end