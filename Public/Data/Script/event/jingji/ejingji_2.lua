-- 125021
-- 竞技场 辅助功能，兑换腰带
x125021_g_ScriptId = 125021

--盟主之印		Buff6_1		30505143
--铜腰带		Girdle3_4		10421018
--银腰带		Girdle3_3		10421019
--金腰带		Girdle3_2		10421020
--七宝腰带	Girdle3_1		10421021

x125021_g_StoneId = 30505143

x125021_g_Item_1 = 10421018
x125021_g_Item_2 = 10421019
x125021_g_Item_3 = 10421020
x125021_g_Item_4 = 10421021

x125021_g_Exp = 50000

--**********************************
--列举事件
--**********************************
function x125021_OnEnumerate( sceneId, selfId, targetId )	
	AddNumText( sceneId, x125021_g_ScriptId, "Minh ch� 鸢ng y陁 疳i 鸨i minh ch� chi ", 12, 1 )
	AddNumText( sceneId, x125021_g_ScriptId, "Minh ch� ng鈔 y陁 疳i 鸨i minh ch� chi ", 12, 2 )
	AddNumText( sceneId, x125021_g_ScriptId, "Minh ch� kim y陁 疳i 鸨i minh ch� chi ", 12, 3 )

	AddNumText( sceneId, x125021_g_ScriptId, "Th錸g c minh ch� 鸢ng y陁 疳i", 6, 7 )
	AddNumText( sceneId, x125021_g_ScriptId, "Th錸g c minh ch� ng鈔 y陁 疳i", 6, 4 )
	AddNumText( sceneId, x125021_g_ScriptId, "Th錸g c minh ch� kim y陁 疳i", 6, 5 )
	AddNumText( sceneId, x125021_g_ScriptId, "Th錸g c minh ch� th b鋙 y陁 疳i", 6, 6 )
end

--**********************************
--任务入口函数
--**********************************
function x125021_OnDefaultEvent( sceneId, selfId, targetId )
	local Num = GetNumText()
	if Num == 1  then
    BeginEvent(sceneId)
      AddText(sceneId,"#BMinh ch� 鸢ng y陁 疳i 鸨i minh ch� chi ");
      AddText(sceneId,"  1 c醝 minh ch� 鸢ng y陁 疳i c� th� 鸨i 1 c醝 minh ch� chi ");
      AddNumText( sceneId, x125021_g_ScriptId, "X醕 nh", 8, 10 )
      AddNumText( sceneId, x125021_g_ScriptId, "Hu� b�", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
	
	elseif Num == 2  then
    BeginEvent(sceneId)
      AddText(sceneId,"#BMinh ch� ng鈔 y陁 疳i 鸨i minh ch� chi ");
      AddText(sceneId,"  1 c醝 minh ch� ng鈔 y陁 疳i c� th� 鸨i 10 c醝 minh ch� chi ");
      AddNumText( sceneId, x125021_g_ScriptId, "X醕 nh", 8, 11 )
      AddNumText( sceneId, x125021_g_ScriptId, "Hu� b�", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
		
	elseif Num == 3  then
    BeginEvent(sceneId)
      AddText(sceneId,"#BMinh ch� kim y陁 疳i 鸨i minh ch� chi ");
      AddText(sceneId,"  1 c醝 minh ch� kim y陁 疳i c� th� 鸨i 100 c醝 minh ch� chi ");
      AddNumText( sceneId, x125021_g_ScriptId, "X醕 nh", 8, 12 )
      AddNumText( sceneId, x125021_g_ScriptId, "Hu� b�", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)

	elseif Num == 4  then
    BeginEvent(sceneId)
      AddText(sceneId,"#BTh錸g c minh ch� ng鈔 y陁 疳i");
      AddText(sceneId,"  Th錸g c tr� th鄋h minh ch� ng鈔 y陁 疳i c ti陁 hao:#r#G    1 c醝 minh ch� 鸢ng y陁 疳i#r    9 c醝 minh ch� chi #r    ng呓i x醕 鸶nh th錸g c kh鬾g?");
      AddNumText( sceneId, x125021_g_ScriptId, "X醕 nh", 8, 13 )
      AddNumText( sceneId, x125021_g_ScriptId, "Hu� b�", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)

	elseif Num == 5  then
    BeginEvent(sceneId)
      AddText(sceneId,"#BTh錸g c minh ch� kim y陁 疳i");
      AddText(sceneId,"  Th錸g c tr� th鄋h minh ch� kim y陁 疳i c ti陁 hao:#r#G    1 c醝 minh ch� ng鈔 y陁 疳i#r    90 c醝 minh ch� chi #r    #{_EXCHG"..tostring(500000).."}#W#r  ng呓i x醕 鸶nh th錸g c kh鬾g?");
      AddNumText( sceneId, x125021_g_ScriptId, "X醕 nh", 8, 14 )
      AddNumText( sceneId, x125021_g_ScriptId, "Hu� b�", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)

	elseif Num == 6  then
    BeginEvent(sceneId)
      AddText(sceneId,"#Th錸g c minh ch� th b鋙 y陁 疳i");
      AddText(sceneId,"  Th錸g c tr� th鄋h minh ch� th b鋙 y陁 疳i c ti陁 hao:#r#G    1 c醝 minh ch� kim y陁 疳i#r    400 c醝 minh ch� chi #r    #{_EXCHG"..tostring(1000000).."}#W#r  ng呓i x醕 鸶nh th錸g c kh鬾g?");
      AddNumText( sceneId, x125021_g_ScriptId, "X醕 nh", 8, 15 )
      AddNumText( sceneId, x125021_g_ScriptId, "Hu� b�", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)

	elseif Num == 7  then
    BeginEvent(sceneId)
      AddText(sceneId,"#BTh錸g c minh ch� 鸢ng y陁 疳i");
      AddText(sceneId,"  Th錸g c tr� th鄋h minh ch� 鸢ng y陁 疳i c ti陁 hao:#r#G    40 c醝 minh ch� 鸢ng y陁 疳i to醝 phi猲#W#r  ng呓i x醕 鸶nh th錸g c kh鬾g?");
      AddNumText( sceneId, x125021_g_ScriptId, "X醕 nh", 8, 16 )
      AddNumText( sceneId, x125021_g_ScriptId, "Hu� b�", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
	end
		
	if Num == 10  then
    x125021_ChangeItem( sceneId, selfId, 1 )
	elseif Num == 11  then
    x125021_ChangeItem( sceneId, selfId, 2 )
	elseif Num == 12  then
		x125021_ChangeItem( sceneId, selfId, 3 )
	end
	
	if Num == 13  then
		x125021_UpdateItem( sceneId, selfId, 1 )
	elseif Num == 14  then
		x125021_UpdateItem( sceneId, selfId, 2 )
	elseif Num == 15  then
		x125021_UpdateItem( sceneId, selfId, 3 )
	end	
	
	if Num == 16  then
		x125021_StoneToItem(sceneId, selfId)
	end
	
	if Num == 20  then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
	end

end

--**********************************
-- 碎片换腰带
--**********************************
function x125021_StoneToItem(sceneId, selfId)
	
	BeginAddItem(sceneId)
		AddItem( sceneId, x125021_g_Item_1, 1 )
	local ret = EndAddItem(sceneId,selfId)
	
	-- 腰带碎片的ID
	local nStoneId = 40004434
	if ret > 0  then
		if LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId)>=40 then
			LuaFnDelAvailableItem(sceneId,selfId,nStoneId,40)
			AddItemListToHuman(sceneId,selfId)
			x125021_DispatchTips(sceneId,selfId,1)
			-- 添加一个兑换日志
			LuaFnAuditPlayerBehavior(sceneId, selfId, "To醝 phi猲 鸨i y陁 疳i");
		else
			x125021_DispatchTips(sceneId,selfId,0)
		end
		
	else
		x125021_DispatchTips(sceneId,selfId,-2)
	end
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end

--**********************************
--x125021_UpdateItem
--**********************************
function x125021_UpdateItem( sceneId, selfId, nIndex )
	if nIndex == 1  then
	
		BeginAddItem(sceneId)
			AddItem( sceneId, x125021_g_Item_2, 1 )
		local ret = EndAddItem(sceneId,selfId)
		if ret > 0  then
			if LuaFnGetAvailableItemCount(sceneId,selfId,x125021_g_StoneId)>=9 and
				LuaFnGetAvailableItemCount(sceneId,selfId,x125021_g_Item_1)>=1  then
				
				LuaFnDelAvailableItem(sceneId,selfId,x125021_g_StoneId,9)
				LuaFnDelAvailableItem(sceneId,selfId,x125021_g_Item_1,1)
				
				AddItemListToHuman(sceneId,selfId)
				-- 添加装备升级日志
				LuaFnAuditPlayerBehavior(sceneId, selfId, "邪ng y陁 疳i 鸨i ng鈔 y陁 疳i");

		    	x125021_DispatchTips(sceneId,selfId,1)
				return
			end
		end
		
	elseif nIndex == 2  then
		
		if GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId) < 500000   then  
			x125021_DispatchTips(sceneId,selfId,-1)
			return
		end
	
		BeginAddItem(sceneId)
			AddItem( sceneId, x125021_g_Item_3, 1 )
		local ret = EndAddItem(sceneId,selfId)
		if ret > 0  then
			if LuaFnGetAvailableItemCount(sceneId,selfId,x125021_g_StoneId)>=90 and
				LuaFnGetAvailableItemCount(sceneId,selfId,x125021_g_Item_2)>=1  then
				
				LuaFnDelAvailableItem(sceneId,selfId,x125021_g_StoneId,90)
				LuaFnDelAvailableItem(sceneId,selfId,x125021_g_Item_2,1)
				
				-- 扣G
				--CostMoney(sceneId,selfId,500000)
				LuaFnCostMoneyWithPriority( sceneId, selfId, 500000 )  
				
				AddItemListToHuman(sceneId,selfId)
				-- 添加装备升级日志
				LuaFnAuditPlayerBehavior(sceneId, selfId, "Ng鈔 y陁 疳i 鸨i kim y陁 疳i");

		    	x125021_DispatchTips(sceneId,selfId,1)
				return
			end
		end
		
	elseif nIndex == 3  then
		
		if GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId)< 1000000   then
			x125021_DispatchTips(sceneId,selfId,-1)
			return
		end
	
		BeginAddItem(sceneId)
			AddItem( sceneId, x125021_g_Item_4, 1 )
		local ret = EndAddItem(sceneId,selfId)
		if ret > 0  then
			if LuaFnGetAvailableItemCount(sceneId,selfId,x125021_g_StoneId)>=400 and
					LuaFnGetAvailableItemCount(sceneId,selfId,x125021_g_Item_3)>=1  then
				
				LuaFnDelAvailableItem(sceneId,selfId,x125021_g_StoneId,400)
				LuaFnDelAvailableItem(sceneId,selfId,x125021_g_Item_3,1)
				
				-- 扣G
				--CostMoney(sceneId,selfId,1000000)
				LuaFnCostMoneyWithPriority( sceneId, selfId, 1000000 )  
				AddItemListToHuman(sceneId,selfId)
				
				
				-- 添加装备升级日志
				LuaFnAuditPlayerBehavior(sceneId, selfId, "Kim y陁 疳i 鸨i th b鋙 y陁 疳i");
	    	x125021_DispatchTips(sceneId,selfId,1)
		    	
		    -- 发送世界公告
				local szTransferEquip = GetItemTransfer(sceneId,selfId,0)
		    
				local str = ""
				str = format("#PVu C豼 Li阯 h� to: Thi阯 h� anh h鵱g! Anh h鵱g v� 鹫i #{_INFOUSR%s} nhi玼 n錷 qua t読 Phong Thi畁 朽i 痃m m醬 chi猲 黏u h錸g h醝, cu痠 c鵱g thg 疬㧟 v� l鈓 minh ch� ch韓h th裞! #{_INFOMSG%s}!", GetName(sceneId,selfId), szTransferEquip)
				BroadMsgByChatPipe(sceneId, selfId, str, 4)
		    
				return
			end
		end
		
	end
	
  x125021_DispatchTips(sceneId,selfId,0)
  
end

--**********************************
--x125021_ChangeItem
--**********************************
function x125021_ChangeItem( sceneId, selfId, nIndex )
	if nIndex == 1  then
		BeginAddItem(sceneId)
			AddItem( sceneId, x125021_g_StoneId, 1 )
		local ret = EndAddItem(sceneId,selfId)
		if ret > 0  then
			if LuaFnDelAvailableItem(sceneId,selfId,x125021_g_Item_1,1) == 1  then
				AddItemListToHuman(sceneId,selfId)
				--添加兑换日志
				LuaFnAuditPlayerBehavior(sceneId, selfId, "邪ng y陁 疳i 鸨i 1 minh ch� ");
			    x125021_DispatchTips(sceneId,selfId,1)
			    return
			end
		end
		
	elseif nIndex == 2  then
		BeginAddItem(sceneId)
			AddItem( sceneId, x125021_g_StoneId, 10 )
		local ret = EndAddItem(sceneId,selfId)
		if ret > 0  then
			if LuaFnDelAvailableItem(sceneId,selfId,x125021_g_Item_2,1) == 1  then
				AddItemListToHuman(sceneId,selfId)
				--添加兑换日志
				LuaFnAuditPlayerBehavior(sceneId, selfId, "Ng鈔 y陁 疳i 鸨i 10 minh ch� ");
			    x125021_DispatchTips(sceneId,selfId,1)
			    return
			end
		end
		
	elseif nIndex == 3  then
		BeginAddItem(sceneId)
			AddItem( sceneId, x125021_g_StoneId, 100 )
		local ret = EndAddItem(sceneId,selfId)
		if ret > 0  then
			if LuaFnDelAvailableItem(sceneId,selfId,x125021_g_Item_3,1) == 1  then
				AddItemListToHuman(sceneId,selfId)
				--添加兑换日志
				LuaFnAuditPlayerBehavior(sceneId, selfId, "Kim y陁 疳i 鸨i 100 minh ch� ");
			  	x125021_DispatchTips(sceneId,selfId,1)
			    return
			end
		end
		
	end
	
 	x125021_DispatchTips(sceneId,selfId,0)  
  return
  
end

function x125021_DispatchTips(sceneId,selfId,bOk)
	if bOk == 0  then
	  BeginEvent(sceneId)
	    AddText(sceneId,"Trao 鸨i th b読, ki琺 tra v ph c� 瘘 hay kh鬾g.");
	  EndEvent(sceneId)
	  DispatchMissionTips(sceneId,selfId)
	elseif bOk == -1  then
	  BeginEvent(sceneId)
	    AddText(sceneId,"Kh鬾g 瘘 ng鈔 l唼ng");    
	  EndEvent(sceneId)
	  DispatchMissionTips(sceneId,selfId)
	elseif bOk == -2  then
	  BeginEvent(sceneId)
	    AddText(sceneId,"Tay n鋓 c黙 ng呓i kh鬾g 瘘 kh鬾g gian.");
	  EndEvent(sceneId)
	  DispatchMissionTips(sceneId,selfId)
	else
	  BeginEvent(sceneId)
	    AddText(sceneId,"Trao 鸨i th鄋h c鬾g");
	  EndEvent(sceneId)
	  DispatchMissionTips(sceneId,selfId)
	end
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end
