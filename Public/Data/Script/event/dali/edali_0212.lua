--��������
--���үѰ��Tri�u Thi�n S�
--MisDescBegin
--�ű���
x210212_g_ScriptId = 210212

--��������NPC����
x210212_g_Position_X=282
x210212_g_Position_Z=253
x210212_g_SceneID=2
x210212_g_AccomplishNPC_Name="Tri�u Thi�n S�"

--�����
x210212_g_MissionId = 452

--��һ�������ID
x210212_g_MissionIdPre = 451

--Ŀ��NPC
x210212_g_Name	="Tri�u Thi�n S�"

--�������
x210212_g_MissionKind = 13

--����ȼ�
x210212_g_MissionLevel = 3

--�Ƿ��Ǿ�Ӣ����
x210212_g_IfMissionElite = 0

--������
x210212_g_MissionName="L� th� ti�n c� th� 3"
x210212_g_MissionInfo="#{event_dali_0016}"
x210212_g_MissionTarget="V� #GNg� Hoa ��n th�nh ��i L�#W t�m #RTri�u Thi�n S� #W#{_INFOAIM282,253,2,Tri�u Thi�n S�}.#r#YNh�c nh�: #G?n chu�t ph�i v�o t�a � NPC c� th� t� �ng d�ch chuy�n �n ch� NPC ��!"
x210212_g_MissionComplete="#{event_dali_0017}"
x210212_g_MoneyBonus=72
x210212_g_SignPost = {x = 282,z = 253, tip = "Tri�u Thi�n S�"}
x210212_g_ItemBonus={{id=40002108,num=1}}

x210212_g_Custom	= { {id="�� t�m th�y Tri�u Thi�n S�",num=1} }

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210212_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210212_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210212_g_MissionId) > 0)  then
			x210212_OnContinue( sceneId, selfId, targetId )
    --���������������
    elseif x210212_CheckAccept(sceneId,selfId) > 0 then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210212_g_MissionName)
				AddText(sceneId,x210212_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210212_g_MissionTarget)
				for i, item in x210212_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x210212_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210212_g_ScriptId,x210212_g_MissionId)
    end
end

--**********************************
--�о��¼�
--**********************************
function x210212_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210212_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210212_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210212_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210212_g_Name then
			AddNumText(sceneId, x210212_g_ScriptId,x210212_g_MissionName,2,-1);
		end
	--���������������
    elseif x210212_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210212_g_Name then
			AddNumText(sceneId,x210212_g_ScriptId,x210212_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x210212_CheckAccept( sceneId, selfId )
	--��Ҫ3�����ܽ�
	if GetLevel( sceneId, selfId ) >= 3 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210212_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210212_g_MissionId, x210212_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�#W: L� th� ti�n c� th� 3",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210212_g_SignPost.x, x210212_g_SignPost.z, x210212_g_SignPost.tip )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x210212_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
end

--**********************************
--����
--**********************************
function x210212_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210212_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210212_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210212_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210212_g_MissionName)
		AddText(sceneId,x210212_g_MissionComplete)
		AddMoneyBonus( sceneId, x210212_g_MoneyBonus )
		for i, item in x210212_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210212_g_ScriptId,x210212_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210212_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210212_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x210212_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210212_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x210212_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--����������
			if ret > 0 then
					AddMoney(sceneId,selfId,x210212_g_MoneyBonus );
					LuaFnAddExp( sceneId, selfId,200)
					ret = DelMission( sceneId, selfId, x210212_g_MissionId )
				if ret > 0 then
					MissionCom( sceneId, selfId, x210212_g_MissionId )
					AddItemListToHuman(sceneId,selfId)
					Msg2Player(  sceneId, selfId,"#YNhi�m v� ho�n th�nh#W: L� th� ti�n c� th� 3",MSG2PLAYER_PARA )
				end
			else
				--������û�мӳɹ�
				BeginEvent(sceneId)
					strText = "Nhi�m v� th�t b�i"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end
	end
end

--**********************************
--ɱ����������
--**********************************
function x210212_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210212_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210212_OnItemChanged( sceneId, selfId, itemdataId )
end
