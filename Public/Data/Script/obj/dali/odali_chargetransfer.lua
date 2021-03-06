-- created by ��ΰ

x400958_g_ScriptId = 400958; --�ű���
x400958_g_name	="Xa Truy�n Tr�";

--����Ŀ��
x400958_g_transfer_target =
{
	[1] = {x = 217, z = 339, scene_num = 0}, 		--����
	[2] = {x = 333, z = 249, scene_num = 1}, 		--����
	[3] = {x = 294, z = 90, scene_num = 186}, 	--¥��
	[4] = {x = 206, z = 266, scene_num = 34}, 	--�Ϻ�
	[5] = {x = 186, z = 43, scene_num = 28},		--��گ
	[6] = {x = 158, z = 113, scene_num = 22}, 	--����ɽ
}

-- �շѽ��
x400958_g_transfer_cost = 5000; -- 50������

--**********************************
--�¼��������
--**********************************
function x400958_OnDefaultEvent( sceneId, selfId, targetId )
	x400958_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--�¼��б�
--**********************************
function x400958_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId);
		AddText( sceneId, "#{SFCS_80828_01}" );
		AddNumText(sceneId, x400958_g_ScriptId, "L�c D߽ng", 9, 1);
		AddNumText(sceneId, x400958_g_ScriptId, "T� Ch�u", 9, 2);
		AddNumText(sceneId, x400958_g_ScriptId, "L�u Lan", 9, 3);
		AddNumText(sceneId, x400958_g_ScriptId, "Nam H�i", 9, 4);
		AddNumText(sceneId, x400958_g_ScriptId, "Nam Chi�u", 9, 5);
		AddNumText(sceneId, x400958_g_ScriptId, "Tr߶ng B�ch S�n", 9, 6);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x400958_OnEventRequest( sceneId, selfId, targetId, eventId )
	--10��
	if GetLevel(sceneId, selfId) < 10 then
		BeginEvent( sceneId )
			AddText( sceneId, "Sau khi ��t c�p 10 m�i c� th� di chuy�n �n c�c v�ng!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )	
		return	
	end
	--�������
	if GetItemCount(sceneId, selfId, 40002000)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "Tr�n ng߶i ng߽i c� Ng�n Phi�u, �ang � tr�ng th�i th߽ng nh�n, kh�ng th� d�ch chuy�n b�ng ch�c n�ng n�y!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	--�������
	if GetTeamId(sceneId,selfId)>=0 and 
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		BeginEvent( sceneId )
			AddText( sceneId, "Xin l�i, �߶ng s� xa x�i, ta kh�ng th� ti�p nh�n c� t� �i, h�y r�i t� �i r�i h�y �n g�p ta!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	--�������
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent(sceneId)
			AddText(sceneId, "Ng߽i �ang trong tr�ng th�i T�o V�n, ta kh�ng th� gi�p ng߽i ���c!")
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	--
	local id = GetNumText();
	if id >=1 and id <= 6 then
		BeginEvent(sceneId)
			--"���δ�����ȡ50�����ӣ���Ҫ������"
			AddText(sceneId, "#{FFCS_081210_1}")
			if id == 1 then	
				AddNumText(sceneId, x400958_g_ScriptId, "X�c �nh", 0, 11);
			elseif id == 2 then
				AddNumText(sceneId, x400958_g_ScriptId, "X�c �nh", 0, 21);
			elseif id == 3 then
				AddNumText(sceneId, x400958_g_ScriptId, "X�c �nh", 0, 31);
			elseif id == 4 then
				AddNumText(sceneId, x400958_g_ScriptId, "X�c �nh", 0, 41);
			elseif id == 5 then
				AddNumText(sceneId, x400958_g_ScriptId, "X�c �nh", 0, 51);
			elseif id == 6 then
				AddNumText(sceneId, x400958_g_ScriptId, "X�c �nh", 0, 61);
			end
			AddNumText(sceneId, x400958_g_ScriptId, "H�y b�", 0, 100);
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
	elseif id == 100 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )		
	else
		local index = floor(id/10);
		--¥��75������
		if index == 3 then
			if GetLevel(sceneId, selfId) < 75 then
				BeginEvent(sceneId)
					AddText(sceneId, "C�p � c�a ng߽i kh�ng �� 75, kh�ng th� ti�n v�o!")
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
				return
			end
			--ͬ���С������
			if LuaFnGetDRideFlag(sceneId, selfId) == 1 then
				local objId = LuaFnGetDRideTargetID(sceneId, selfId);
				if objId ~= -1 and GetLevel(sceneId, objId) < 75 then
					BeginEvent(sceneId)
						AddText(sceneId, "#{SRCS_090203_1}")
					EndEvent()
					DispatchEventList(sceneId, selfId, targetId)
					return					
				end
			end
		end
			--[tx44121]bug����û��������ͼ��𣬵��µͼ����ͨ��˫��˽��߼��𳡾�
		local minLevel = 10
		if index == 3 then
			minLevel = 75
		end
		if LuaFnGetDRideFlag(sceneId, selfId) == 1 then
			local objId = LuaFnGetDRideTargetID(sceneId, selfId);
			if objId ~= -1 and GetLevel(sceneId, objId) < minLevel then
				local Tip = format("#{CQTS_90227_1}%d#{CQTS_90227_2}", minLevel)
				x400958_NotifyFailTips( sceneId, selfId, targetId, Tip )
				return					
			end
		end		
		--[/tx44121]
				
		local pos_x = x400958_g_transfer_target[index]["x"];
		local pos_z = x400958_g_transfer_target[index]["z"];
		local scene_num = x400958_g_transfer_target[index]["scene_num"];

		local nMoneyJZ = GetMoneyJZ (sceneId, selfId)
		local nMoney = GetMoney (sceneId, selfId)

		--Ǯ����
		if (nMoneyJZ + nMoney) >= x400958_g_transfer_cost then 
				
			-- �շ�
			-- ʹ�ô����ȼ��Ľ�Ǯ���ĺ���					
			if LuaFnCostMoneyWithPriority (sceneId, selfId, x400958_g_transfer_cost) == -1 then
				BeginEvent(sceneId)
					AddText(sceneId, "�շ�ʧ�ܣ�");
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				return
			else
				CallScriptFunction((400900), "TransferFunc",sceneId, selfId, scene_num, pos_x, pos_z, minLevel); 
			end

		-- Ǯ����
		else
			BeginEvent(sceneId)
				AddText(sceneId, "Ng߽i kh�ng �� ti�n!");
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
			return

		end
	end	
end
--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x400958_NotifyFailTips( sceneId, selfId, targetId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
