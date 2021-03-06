--装备减少修理失败次数
--脚本号
x809265_g_ScriptId = 809265

--减少修理失败次数UI 1005

--**********************************
--列举事件
--**********************************
function x809265_OnEnumerate( sceneId, selfId, targetId )

end


--**********************************
--减少修理失败次数
--**********************************
function x809265_EquipFaileTimes( sceneId, selfId, nItemIndex1, nItemIndex2)

	local ret = LuaFnIsItemLocked( sceneId, selfId, nItemIndex1 )
	if ret ~= 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"Trang b� n鄖 kh鬾g th� gia t錸g s� l s豠 ch鎍");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	
	ret = LuaFnIsItemAvailable( sceneId, selfId, nItemIndex2 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"Kh鬾g th� s� d鴑g Nhu V L�");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local szTransfer = GetBagItemTransfer(sceneId,selfId, nItemIndex2);


	local sy_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, nItemIndex2 )
	if sy_index ~= 30900007 and sy_index ~= 30900000   then
		BeginEvent(sceneId)
		AddText(sceneId,"Gia t錸g s� l s豠 ch鎍 trang b� c c� Nhu V L�");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	local	text	= "Gia t錸g s� l s豠 ch鎍 th鄋h c鬾g"
	local money = GetMoney( sceneId, selfId )
	local jiaozi = GetMoneyJZ(sceneId, selfId);
	local need_money = GetBagItemLevel( sceneId, selfId, nItemIndex1 ) * 200
	if money+jiaozi < need_money then
		text="Gia t錸g s� l s豠 ch鎍 trang b� th b読 c c� #{_EXCHG%d}, ng鈔 l唼ng tr阯 ng叨i c醕 h� kh鬾g 瘘"
		text=format( text, need_money )
		BeginEvent(sceneId)
		AddText(sceneId,text);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	local szMsg;
	local szName;
	szName = GetName( sceneId, selfId );		
	
	if sy_index == 30900007  then
		ret = LuaFnFaileTimes( sceneId, selfId, nItemIndex1, nItemIndex2, 1 )
		szMsg = format( "#W#{_INFOUSR%s}#H sau khi 疸 s� d鴑g #W#{_INFOMSG%s}#H, h癷 ph鴆 th鄋h c鬾g s� l s鎍 ch鎍 c黙 trang b� l� 1 l, tr醤h g銀 v� sau 3 l s豠 ch鎍 trang b� th b読.", szName, szTransfer );
	elseif sy_index == 30900000  then
		ret = LuaFnFaileTimes( sceneId, selfId, nItemIndex1, nItemIndex2, 0 )
		szMsg = format( "#W#{_INFOUSR%s}#H sau khi 疸 s� d鴑g #W#{_INFOMSG%s}#H, h癷 ph鴆 th鄋h c鬾g s� l s鎍 ch鎍 c黙 trang b� l� 3 l, tr醤h g銀 v� sau 3 l s豠 ch鎍 trang b� th b読.", szName, szTransfer );
	end

	if ret == 0 then
		LuaFnCostMoneyWithPriority( sceneId, selfId, need_money ) --zchw
		LuaFnEraseItem( sceneId, selfId, nItemIndex2 )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);

		
		AddGlobalCountNews( sceneId, szMsg )
		
	end
	
	if ret == -1 then
		text="Thao t醕 b� l瞚"
	end

	if ret == -2 then
		text="Trang b� n鄖 kh鬾g th� gia t錸g s� l s豠 ch鎍"
	end
	
	if ret == -3 then
		text="Kh鬾g th� s� d鴑g Nhu V L�"
	end

	if ret == -4 then
		text="S� l s豠 ch鎍 疸 鹫t m裞 t痠 餫"
	end

	BeginEvent(sceneId)
		AddText(sceneId,text)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
