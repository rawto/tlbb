--购买请帖

--脚本号
x806017_g_ScriptId = 806017;

x806017_g_invitationDataId_level1  = 30303100;		-- 普通请帖ID
x806017_g_invitationDataId_level2  = 30303101;		-- 高级请帖ID
x806017_g_invitationDataId_level3  = 30303102;		-- 豪华请帖ID


--EventId解释
--1234
--||++--购买个数(1,5,10)
--|+----购买等级(0,1,2)
--+-----菜单ID(0=刷新列表，1=选择等级，2=选择个数，3=是否确定)

x806017_g_eventId_update = 0;			--刷新列表
x806017_g_eventId_cancel = 1;			--关闭
x806017_g_eventId_select_level = 1000;	--选择等级
x806017_g_eventId_select_count = 2000;	--选择个数
x806017_g_eventId_select_buy = 3000;	--是否确定

--x806017_g_eventId_update = 0;				-- 购买请帖
--x806017_g_eventId_level_0 = 1000;			-- 普通请帖
--x806017_g_eventId_level_1 = 1100;			-- 高级请帖
--x806017_g_eventId_level_2 = 1200;			-- 豪华请帖

--x806017_g_eventId_count_0_1 = 2001;		-- 购买一张普通请帖
--x806017_g_eventId_count_0_5 = 2005;		-- 购买五张普通请帖
--x806017_g_eventId_count_0_10 = 2010;		-- 购买十张普通请帖
					   
--x806017_g_eventId_count_1_1 = 2101;		-- 购买一张高级请帖
--x806017_g_eventId_count_1_5 = 2105;		-- 购买五张高级请帖
--x806017_g_eventId_count_1_10 = 2110;		-- 购买十张高级请帖
					   
--x806017_g_eventId_count_2_1 = 2201;		-- 购买一张豪华请帖
--x806017_g_eventId_count_2_5 = 2205;		-- 购买五张豪华请帖
--x806017_g_eventId_count_2_10 = 2210;		-- 购买十张豪华请帖

--x806017_g_eventId_buy_0_1 = 3001;			-- 购买一张普通请帖
--x806017_g_eventId_buy_0_5 = 3005;			-- 购买五张普通请帖
--x806017_g_eventId_buy_0_10 = 3010;		-- 购买十张普通请帖
					  
--x806017_g_eventId_buy_1_1 = 3101;			-- 购买一张高级请帖
--x806017_g_eventId_buy_1_5 = 3105;			-- 购买五张高级请帖
--x806017_g_eventId_buy_1_10 = 3110;		-- 购买十张高级请帖
					  
--x806017_g_eventId_buy_2_1 = 3201;			-- 购买一张豪华请帖
--x806017_g_eventId_buy_2_5 = 3205;			-- 购买五张豪华请帖
--x806017_g_eventId_buy_2_10 = 3210;		-- 购买十张豪华请帖

--**********************************
--任务入口函数
--**********************************
function x806017_OnDefaultEvent(sceneId, selfId, targetId)
	local selectEventId = GetNumText();

	if selectEventId then
		if selectEventId > x806017_g_eventId_select_buy - 1 then
			local level = floor((selectEventId - x806017_g_eventId_select_buy)/100);
			local count = mod(selectEventId, 100);
			x806017_OnBuy(sceneId, selfId, targetId, level, count);
			
		elseif selectEventId > x806017_g_eventId_select_count - 1 then
			local level = floor((selectEventId - x806017_g_eventId_select_count)/100);
			local count = mod(selectEventId, 100);
			x806017_OnSelectCount(sceneId, selfId, targetId, level, count);
			
		elseif selectEventId > x806017_g_eventId_select_level - 1 then
			local level = floor((selectEventId - x806017_g_eventId_select_level)/100);
			x806017_OnSelectLevel(sceneId, selfId, targetId, level);
			
		elseif selectEventId == x806017_g_eventId_update then
			x806017_OnUpdate(sceneId, selfId, targetId);
		else
			BeginUICommand(sceneId);
			EndUICommand(sceneId);
			DispatchUICommand(sceneId, selfId, 1000);
		end
	end
end

--**********************************
--列举事件
--**********************************
function x806017_OnEnumerate(sceneId, selfId, targetId)
	--local isMarried = LuaFnIsMarried(sceneId, selfId);
	--if isMarried and isMarried == 0 then
		AddNumText(sceneId, x806017_g_ScriptId, "Mua thi畃 m秈", 7, x806017_g_eventId_update);
	--end
end

--**********************************
--刷新购买请帖的等级列表的事件
--**********************************
function x806017_OnUpdate(sceneId, selfId, targetId)
	BeginEvent(sceneId);
		AddText(sceneId, "Thi畃 m秈 c� th秈 h課 1 th醤g. N猽 ch遖 chu b� t痶 h鬾 l�, kh鬾g n阯 mua thi畃 tr呔c. anh ch� c giao ph� giao d竎h thi畃 m秈 cho b課 h鎢 m靚h. B課 c黙 c醕 h� c� th� s� s� d鴑g v ph tham gia h鬾 l� c黙 c醕 h�");
		AddNumText(sceneId, x806017_g_ScriptId, "Mua "..x806017_GetItemLevelNameByLevel(sceneId, selfId, 0).." Th飊h Thi畃", 7, 0 * 100 + x806017_g_eventId_select_level);
		AddNumText(sceneId, x806017_g_ScriptId, "Mua "..x806017_GetItemLevelNameByLevel(sceneId, selfId, 1).." Th飊h Thi畃", 7, 1 * 100 + x806017_g_eventId_select_level);
		AddNumText(sceneId, x806017_g_ScriptId, "Mua "..x806017_GetItemLevelNameByLevel(sceneId, selfId, 2).." Th飊h Thi畃", 7, 2 * 100 + x806017_g_eventId_select_level);
		AddNumText(sceneId, x806017_g_ScriptId, "R秈 餴...", 8, x806017_g_eventId_cancel);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--选择请帖的等级的事件
--**********************************
function x806017_OnSelectLevel(sceneId, selfId, targetId, itemLevel)
	BeginEvent(sceneId);
		AddText(sceneId, "H銀 ch鱪 s� l唼ng c醕 h� mu痭 mua: ");
		AddNumText(sceneId, x806017_g_ScriptId, "1 t", 6, itemLevel * 100 + x806017_g_eventId_select_count + 1);
		AddNumText(sceneId, x806017_g_ScriptId, "5 t", 6, itemLevel * 100 + x806017_g_eventId_select_count + 5);
		AddNumText(sceneId, x806017_g_ScriptId, "10 t", 6, itemLevel * 100 + x806017_g_eventId_select_count + 10);
		AddNumText(sceneId, x806017_g_ScriptId, "Quay l読...", 8, 0);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--选择请帖的数量的事件
--**********************************
function x806017_OnSelectCount(sceneId, selfId, targetId, itemLevel, itemCount)
	if itemLevel and itemCount then
		BeginEvent(sceneId);
			local szText = format("Mua %d t %s thi畃 m秈, t眓g c祅g ph鋓 t痭 #{_MONEY%d}, h銀 x醕 nh c� mua kh鬾g?", itemCount, x806017_GetItemLevelNameByLevel(sceneId, selfId, itemLevel), itemCount * x806017_GetItemPriceByLevel(sceneId, selfId, itemLevel) );
			AddText(sceneId, szText);
			AddNumText(sceneId, x806017_g_ScriptId, "X醕 nh", 6, itemLevel * 100 + x806017_g_eventId_select_buy + itemCount);
			AddNumText(sceneId, x806017_g_ScriptId, "Hu� b�", 8, itemLevel * 100 + x806017_g_eventId_select_level);
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);
	end
end

--**********************************
--选择请帖的等级
--**********************************
function x806017_OnBuy(sceneId, selfId, targetId, itemLevel, itemCount)
	if itemLevel and itemCount and itemCount > 0 then
		--检测有没有那么多钱
		local itemPrice = x806017_GetItemPriceByLevel(sceneId, selfId, itemLevel);
		local money = LuaFnGetMoney(sceneId, selfId);
		local moneyJZ = GetMoneyJZ(sceneId, selfId);
		local needMoney = itemPrice * itemCount;
		if money and needMoney and moneyJZ and (money + moneyJZ) < needMoney then
		  x806017_MessageBox(sceneId, selfId, targetId, "Th xin l瞚, ng鈔 l唼ng c黙 c醕 h� kh鬾g 瘘!", 1);
			return 0;
		end
		
		--检测有没有背包空间
		local selfProSpace = LuaFnGetPropertyBagSpace(sceneId, selfId);
		if selfProSpace and selfProSpace > itemCount - 1 then
		else
			x806017_MessageBox(sceneId, selfId, targetId, "Th xin l瞚, tay n鋓 c黙 c醕 h� kh鬾g 瘘 ch� tr痭g!", 1);
			return 0;
		end
		
		--扣钱
		LuaFnCostMoneyWithPriority(sceneId, selfId, needMoney);
		
		--加物品
		local selfName = LuaFnGetName(sceneId, selfId);
		local selfGUID = LuaFnGetGUID(sceneId, selfId);
		local itemId = x806017_GetItemDataByLevel(sceneId, selfId, itemLevel);
		local i;
		for i = 0, itemCount - 1 do
			pos	= TryRecieveItem(sceneId, selfId, itemId, 1);
			if pos and pos ~= -1 then
				LuaFnSetItemCreator(sceneId, selfId, pos, selfName);
				SetBagItemParam(sceneId, selfId, pos, 0, 2, selfGUID);
			end
		end
	end
	x806017_OnSelectLevel(sceneId, selfId, targetId, itemLevel);
end

--**********************************
--对话窗口信息提示
--**********************************
function x806017_MessageBox(sceneId, selfId, targetId, msg, showReturn)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
		if showReturn and showReturn == 1 then
			AddNumText(sceneId, x806017_g_ScriptId, "Quay l読...", 8, x806017_g_eventId_update);
		end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--取物品的名称
--**********************************
function x806017_GetItemLevelNameByLevel(sceneId, selfId, level)
	if level == 2 then
		return "H鄌 Hoa";
	elseif level == 1 then
		return "Cao C";
	else
		return "Ph� Th鬾g";
	end
	return "";
end

--**********************************
--取物品的ID
--**********************************
function x806017_GetItemDataByLevel(sceneId, selfId, level)
	local itemId = -1;
	if level == 2 then
		itemId = x806017_g_invitationDataId_level3;
	elseif level == 1 then
		itemId = x806017_g_invitationDataId_level2;
	else
		itemId = x806017_g_invitationDataId_level1;
	end
	return itemId;
end

--**********************************
--取物品的价格
--**********************************
function x806017_GetItemPriceByLevel(sceneId, selfId, level)
	local itemId = x806017_GetItemDataByLevel(sceneId, selfId, level);
	local price = LuaFnGetItemPrice(sceneId, itemId);
	return price;
end
