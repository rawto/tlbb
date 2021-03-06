--调整脸型
--脚本号
x805029_g_ScriptId = 805029

--调整脸型UI 21

--**********************************
--列举事件
--**********************************
function x805029_OnEnumerate( sceneId, selfId, targetId )
	-- 调试信息
	--BeginEvent(sceneId)
	--	AddText(sceneId, "进入调整脸型脚本");
	--EndEvent(sceneId)
	--DispatchMissionTips(sceneId,selfId)	
	
	-- 为什么要 NPC 名字？
	local TransportNPCName=GetName(sceneId,targetId);

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddString(sceneId,TransportNPCName)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 928)
	return
end

--**********************************
--调整脸型
--**********************************
function x805029_FinishAdjust( sceneId, selfId, styleId)

	-- 得到调整脸型所需物品的id及其数量
	local ItemId, ItemCount = GetChangeFaceItemIdAndItemCount(styleId)
		
	-- 返回值非法
	if ItemId < 0 or ItemCount < 0 then
		return
	end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, ItemId )

	-- 物品是否够用或锁定
	if ItemCount > nItemNum then
		BeginEvent(sceneId)
			AddText(sceneId, "C醕 h� kh鬾g c� 懈nh Nhan Ch鈛 ho 懈nh Nhan Ch鈛 疸 疬㧟 c� 鸶nh!");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
		-- 获得定颜珠在背包中的位置（定颜珠会在改变脸型的过程中被删除，所以需要先保存它的信息）
	local ItemPos = LuaFnGetItemPosByItemDataID(sceneId, selfId, ItemId, 0)
	local szItemTransfer = GetBagItemTransfer(sceneId, selfId, ItemPos)
	
	-- 物品检测通过，再检查玩家金钱
	local moneyJZ = GetMoneyJZ (sceneId, selfId)
	local money = GetMoney (sceneId, selfId)
	
	-- 物品和金钱检测都通过
	if (moneyJZ + money >= 50000)	then	
		-- 设置玩家新脸型（会在这个过程中消耗物品和金钱）
		local ret = ChangeHumanFaceModel( sceneId, selfId, styleId )
		if ret == 0  then
			BeginEvent(sceneId)
				AddText(sceneId,"Thay 鸨i ngo読 h靚h th鄋h c鬾g!");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		
		-- 改变脸型失败
		elseif ret == 1 then
			BeginEvent(sceneId)
				AddText(sceneId,"H銀 l馻 ch鱪 m祎 lo読 ngo読 h靚h");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		elseif ret == 3 then
			BeginEvent(sceneId)
				AddText(sceneId, "C醕 h� kh鬾g c� 懈nh Nhan Ch鈛 ho 懈nh Nhan Ch鈛 疸 疬㧟 c� 鸶nh!");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		elseif ret == 4 then	
			BeginEvent(sceneId)
				AddText(sceneId, "Kh鬾g 瘘 Ng鈔 L唼ng");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		else
			return
		end

	-- 金钱不足
	else
		BeginEvent(sceneId)
			AddText(sceneId, "Kh鬾g 瘘 Ng鈔 L唼ng");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end	
	
	-- 发送广播
	local message;	
	local randMessage = random(3);
	local nsex = LuaFnGetSex(sceneId, selfId)
	local str1,str2
	if nsex == 0  then
		str1 = "n鄋g "
		str2 = "皓p"
	else
		str1 = "huynh "
		str2 = "xo"
	end
	
	if randMessage == 1 then
		message = format("#HGiang h� tr tr� ng㱮 khen #W#{_INFOUSR%s}#H g呓ng m m緄 tr� trung, ch韓h l� do s� d鴑g #W#{_INFOMSG%s}#H m� th鄋h. Th khi猲 Phan An ph鋓 t裞 ch猼, 衖陁 Thuy玭 c鹡g cay c� kh鬾g ch竨 n眎!", LuaFnGetName(sceneId, selfId), szItemTransfer);
	elseif randMessage == 2 then
		message = format("#HS 皓p l� v鄋g, #W#{_INFOUSR%s}#H � th裞 疬㧟 s 皓p c黙 m靚h, " .. str1 .. " 疸 s� d鴑g #W#{_INFOMSG%s}#H thay 鸨i khu鬾 m m緄, th khi猲 ng叨i ta tr tr� ng㱮 khen!", LuaFnGetName(sceneId, selfId), szItemTransfer);
	else
		message = format("#HChim tr阯 tr秈 h鬽 nay 鸬t nhi阯 ng譶g bay, con n鄌 con n n im trong t�, c� d呔i n呔c im lg kh鬾g 鸬ng 皈y. Kh鬾g bi猼 c� ph鋓 tr鷑g 鸬c g� kh鬾g. �, kh鬾g ph鋓 疴u, nguy阯 nh鈔 l� do #W#{_INFOUSR%s}#H "..str1.." 疸 s� d鴑g #W#{_INFOMSG%s}#H thay 鸨i g呓ng m, khi猲 ch鷑g ph鋓 tr tr� ng ngh韆 v� th痶 l阯 m祎 ch� \"些p\"", LuaFnGetName(sceneId, selfId), szItemTransfer);
	end

	BroadMsgByChatPipe(sceneId, selfId, message, 4);
end
