-- 珍兽洗点

-- 脚本号
x800107_g_ScriptId = 800107;

x800107_g_resetptItemDataID = 30503021;	--炼兽丹

--**********************************
-- 任务入口函数
--**********************************
function x800107_OnDefaultEvent(sceneId, selfId, targetId)
	--珍兽洗点
	BeginUICommand(sceneId);
		UICommand_AddInt(sceneId, targetId);
	EndUICommand(sceneId);
	DispatchUICommand(sceneId, selfId, 800107);
end

--**********************************
-- 列举事件
--**********************************
function x800107_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x800107_g_ScriptId, "T 餴琺 tr鈔 th�" , 6, -1);
end

--**********************************
-- 珍兽洗点
--**********************************
function x800107_ResetPetAttrPt(sceneId, selfId, petGUID_H, petGUID_L, itemPos)
	if not sceneId or not selfId or not petGUID_H or not petGUID_L or not itemPos then
		return 0;
	end
	
	local checkPet = LuaFnIsPetAvailableByGUID(sceneId, selfId, petGUID_H, petGUID_L);
	if not checkPet or checkPet ~= 1 then
		x800107_ShowTips(sceneId, selfId, "Kh鬾g th� ti猲 h鄋h thao t醕 v緄 tr鈔 th� xu chi猲.");
		return 0;
	end

	local checkRet = LuaFnCheckResetPetAttrPt(sceneId, selfId, petGUID_H, petGUID_L);
	if not checkRet or checkRet ~= 1 then
		return 0;
	end

	--④ 特殊道具栏中有“炼兽丹”	需要“炼兽丹”
	local itemDataID = GetItemTableIndexByIndex(sceneId, selfId, itemPos);
	if not itemDataID or itemDataID ~= x800107_g_resetptItemDataID then
		x800107_ShowTips(sceneId, selfId, "C c� Luy畁 Th� 衋n");
		return 0;
	end
	
	local itemAvailable = LuaFnIsItemAvailable(sceneId, selfId, itemPos);
	if not itemAvailable or itemAvailable ~= 1 then
		x800107_ShowTips(sceneId, selfId, "Kh鬾g th� thao t醕 v緄 Luy畁 Th� 衋n c� 鸶nh");
		return 0;
	end
	
	local eraseRet = LuaFnEraseItem(sceneId, selfId, itemPos);
	if not eraseRet or eraseRet ~= 1 then
		x800107_ShowTips(sceneId, selfId, "Thao t醕 Luy畁 Th� 衋n th b読");
		return 0;
	end

	local ret = LuaFnResetPetAttrPt(sceneId, selfId, petGUID_H, petGUID_L);
	if not ret or ret ~= 1 then
		return 0;
	end
	x800107_ShowTips(sceneId, selfId, "T 餴琺 tr鈔 th� th鄋h c鬾g!");
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
	return 1;
end

--**********************************
-- 提示信息
--**********************************
function x800107_ShowTips(sceneId, selfId, tipMsg)
	BeginEvent(sceneId);
		AddText(sceneId, tipMsg);
	EndEvent(sceneId);
	DispatchMissionTips(sceneId, selfId);
end
