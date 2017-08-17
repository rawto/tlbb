--��ɽNPC
--������
--÷��
--��ͨ

--�ű���
x017001_g_ScriptId = 017001

x017001_g_eventList={228900,229009,200096,200097,808004,229012, 808092}
--**********************************
--�¼��������
--**********************************
function x017001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� Mai Ki�m, l�o t�n ch� kh�ng c� � ��y, ta t�m th�i qu�n l� � t� c�a ph�i Thi�n S�n")
		local mp = GetMenPai(sceneId, selfId)
		if mp == 9 then 
			AddNumText(sceneId, x017001_g_ScriptId, "Gia nh�p m�n ph�i",6,0)
		end
		AddNumText(sceneId, x017001_g_ScriptId, "Gi�i thi�u m�n ph�i",8,1)
		AddNumText(sceneId, x017001_g_ScriptId, "H�c K� n�ng c�a m�n ph�i?",8,6)		--ָ·������ѧϰ��
		for i, eventId in x017001_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x017001_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x017001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_TIANSHAN )
			return
		end
	end

	if GetNumText()==0	then

		x017001_g_MenPai = GetMenPai(sceneId, selfId)
		if x017001_g_MenPai == 7   then
			BeginEvent(sceneId)
				AddText(sceneId, "Ng߽i l�i �n ti�u khi�n vi s� r�i, ng߽i �� l� � t� c�a ph�i Thi�n S�n ta, c�n b�i s� l�m g� n�a c� ch�. Gi�n m�t �?")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if x017001_g_MenPai ~= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"Ng߽i �� l� cao � c�a m�n ph�i kh�c, ch�ng ta kh�ng nh�n ng߽i n�a")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		BeginEvent(sceneId)
			AddText(sceneId, "#{MenpaiInfo_007}")
			AddNumText(sceneId, x017001_g_ScriptId, "Ta mu�n gia nh�p ph�i Thi�n S�n",6,3)
			AddNumText(sceneId, x017001_g_ScriptId, "T�i h� ch�a mu�n b�i s�",8,4)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		 
		return
	end
	
	if GetNumText()==4	then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
	
	if GetNumText()==3	then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
			BeginEvent(sceneId)
				AddText(sceneId,"H�y s�p x�p l�i tay n�i, c�n 2 v� tr� tr�ng, ta s� th߷ng cho ng߽i!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif GetLevel( sceneId, selfId ) < 10 then
			BeginEvent(sceneId)
				AddText(sceneId,"C�c h� h�y ��i t�i sau c�p 10 l�i t�i b�i s� h�c ngh�!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			x017001_g_MenPai = GetMenPai(sceneId, selfId)
			if x017001_g_MenPai == 7 then
				BeginEvent(sceneId)
					AddText(sceneId, "Ng߽i l�i �n ti�u khi�n vi s� r�i, ng߽i �� l� � t� c�a ph�i Thi�n S�n ta, c�n b�i s� l�m g� n�a c� ch�. Gi�n m�t �?")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			--����ֵΪ9��ʾ������
			elseif x017001_g_MenPai==9	then
				LuaFnJoinMenpai(sceneId, selfId, targetId, 7)

				-- ���ó�ʼ��Npc��ϵֵ
				CallScriptFunction( 200099, "InitRelation", sceneId, selfId )

				-- ����ص��ķ�����Ϊ10����  43,46,47
				LuaFnSetXinFaLevel(sceneId,selfId,43,10)
				LuaFnSetXinFaLevel(sceneId,selfId,46,10)
				LuaFnSetXinFaLevel(sceneId,selfId,47,10)

				BeginEvent(sceneId)
	  				AddText(sceneId,"C�c h� �� gia nh�p ph�i Thi�n S�n!");
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,selfId)
				--����ҷ���,��������������,����׬Ǯ
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_7}" )
				--LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{OBJ_tianshan_0001}" )
				
				--���ɽ����ټ���
				for i=1, 20 do
					TryRecieveItem( sceneId, selfId, 30501001, 1 )
				end
				x017001_MsgBox( sceneId, selfId, "Nh�n ���c 20 c�i M�n Ph�i Tri�u T�p L�nh" )

				if TryRecieveItem( sceneId, selfId, 10124006, 1 ) >= 0 then
					str		= "#YC�c h� �� nh�n ���c "..GetItemName( sceneId, 10124006 ).."."
					x017001_MsgBox( sceneId, selfId, str )
				end
					
				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnMsg2Player( sceneId, selfId,"C�c h� �� gia nh�p ph�i Thi�n S�n!",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 167, 0)
					CallScriptFunction( 228900, "OnDefaultEvent",sceneId, selfId, targetId )
				else
					LuaFnMsg2Player( sceneId, selfId,"C�c h� �� gia nh�p ph�i Thi�n S�n!",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 167, 0)
					CallScriptFunction( 228900, "OnDefaultEvent",sceneId, selfId, targetId )
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId,"Ng߽i �� l� cao � c�a m�n ph�i kh�c, ch�ng ta kh�ng nh�n ng߽i n�a.")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		end
	elseif	GetNumText()==1	then
		BeginEvent(sceneId)
			AddText(sceneId, "#{OBJ_tianshan_0003}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	--ָ·
	if GetNumText()==6 then
		BeginEvent(sceneId)
			AddText(sceneId, "Lan Ki�m [88,44] c� th� truy�n d�y k� n�ng chi�n �u c�a m�n ph�i ta cho ng߽i. Y �ang � c�nh ta.")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 88, 44, "Lan Ki�m" )
		return
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x017001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x017001_g_eventList do
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
function x017001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x017001_g_eventList do
		if missionScriptId == findId then
			x017001_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x017001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x017001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x017001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x017001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x017001_OnDie( sceneId, selfId, killerId )
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x017001_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end