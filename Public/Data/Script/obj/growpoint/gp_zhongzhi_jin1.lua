--���� �i�m�ű�,������
--�ű���
--g_ScriptId = 711069

--������ �i�m���
x711069_g_GpId = 570

--��m�t c�i���� �i�mto� � ���
x711069_g_GpIdNext = 571

function	 x711069_OnRecycle(sceneId,selfId,targetId)
	itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
	itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
	ItemBoxId = ItemBoxEnterScene(itemBoxX,itemBoxZ,x711069_g_GpIdNext,sceneId,QUALITY_MUST_BE_CHANGE,0)
	-- �i�m������ �i�mto� � ����GUID
	ItemBoxOwnerGUID = GetItemBoxOwner(sceneId, targetId)		--������ngSceneID,ItemBoxID
	--��ItemBox�趨����
	SetItemBoxOwner(sceneId,ItemBoxId,ItemBoxOwnerGUID)

	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,450000)	--�趨����ʱ��
	return 1
end