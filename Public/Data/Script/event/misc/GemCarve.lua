--宝石雕琢

--脚本号
x800117_g_ScriptId	= 800117
x800117_g_BINDED = 1              -- 已经绑定
			

function x800117_OnGemCarve( sceneId, selfId, GemItemPos, NeedItemPos,TargetID )

	if (TargetID == nil ) then
		return
	end 
	if (TargetID == -1) then
		return
	end
	if GemItemPos == -1 or NeedItemPos == -1 then
		return
	end

	local GemItemID = LuaFnGetItemTableIndexByIndex( sceneId, selfId, GemItemPos )
	local NeedItemID = LuaFnGetItemTableIndexByIndex( sceneId, selfId, NeedItemPos )

	--获得宝石雕琢的信息....
	local ProductID, NeedID, NeedMoney = LuaFnGetGemCarveInfo( GemItemID )
	if  -1 == ProductID then
		return
	end

	--检测是否有所需物品....
	if NeedID ~= NeedItemID then
		return
	end
	
	--检测金钱是否足够....
	local PlayerMoney = GetMoney( sceneId, selfId ) +  GetMoneyJZ(sceneId, selfId)  --交子普及 Vega
	if PlayerMoney < NeedMoney then
		return
	end

	local ProductNeedBind = 0    -- 产生的新宝石是否需要绑定 0是不需要绑定状态，1是需要绑定
	--根据宝石是否绑定和宝石雕琢符是否绑定，决定摘除后的宝石是否绑定
	if (LuaFnGetItemBindStatus(sceneId,selfId,GemItemPos) == x800117_g_BINDED or LuaFnGetItemBindStatus(sceneId,selfId,NeedItemPos) == x800117_g_BINDED) then
	  ProductNeedBind = 1
	end	

	local NeedItemInfo = GetBagItemTransfer( sceneId, selfId, NeedItemPos )

	--扣除宝石和所需物品....
	ret = LuaFnIsItemAvailable( sceneId, selfId, GemItemPos )
	if ret ~= 1 then
		x800117_NotifyTip( sceneId, selfId, "Lo読 b鋙 th誧h n鄖 kh鬾g th� t誳 h靚h 疬㧟" )
		return
	end
	ret = LuaFnIsItemAvailable( sceneId, selfId, NeedItemPos )
	if ret ~= 1 then
		x800117_NotifyTip( sceneId, selfId, "V ph kh鬾g th� s� d鴑g" )
		return
	end

	LuaFnEraseItem( sceneId, selfId, GemItemPos )
	LuaFnEraseItem( sceneId, selfId, NeedItemPos )

	--扣钱....
	ret = LuaFnCostMoneyWithPriority( sceneId, selfId, NeedMoney )    --交子普及 Vega
	if ret < 0 then
		x800117_NotifyTip( sceneId, selfId, "Kh鬾g 瘘 Ng鈔 L唼ng" )
		return
	end

	--给玩家雕琢后的宝石....不用检测背包是否有地方....没地方前边也del出地方了....
	local BagIndex = TryRecieveItem( sceneId, selfId, ProductID, QUALITY_MUST_BE_CHANGE )
	if BagIndex == -1 then
		x800117_NotifyTip( sceneId, selfId, "T鷌 餰o thi猽 kh鬾g gian" )
	end
	
	--根据宝石是否绑定和宝石雕琢符是否绑定，决定摘除后的宝石是否绑定
	if (ProductNeedBind == 1) then
	  local	bindidx	=	LuaFnItemBind(sceneId, selfId,BagIndex)
	  if bindidx ~= 1 then
		  local bindmsg = "V ph 疸 疬㧟 c� 鸶nh"													
		  BeginEvent( sceneId )
		    AddText( sceneId, bindmsg )
		  EndEvent( sceneId )
		  DispatchMissionTips( sceneId, selfId )
	  end
	end	

	--统计....
	LuaFnAuditGemCarve( sceneId, selfId, GemItemID)

	--醒目提示玩家雕琢成功....
	x800117_NotifyTip( sceneId, selfId, "#{_ITEM"..GemItemID.."} t誳 h靚h th鄋h c鬾g, tr� th鄋h #{_ITEM"..ProductID.."}" )

	--公告....
	local Name = GetName(sceneId, selfId)
	local SceneName = GetSceneName(sceneId)
	local NPCName   = GetName(sceneId,TargetID)
	local GemItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
	local gemQual = GetItemQuality( ProductID )
	--local strText = format("#{_INFOUSR%s}#I在%s#R彭怀玉#I处使用#{_INFOMSG%s}#I雕琢出一颗#{_INFOMSG%s}#I，洛阳城一时宝光冲天。", Name, SceneName,NeedItemInfo, GemItemInfo )
	local strText = format("#{_INFOUSR%s}#I S� d鴑g t読 #G%s#R%s#I s� d鴑g ch裞 n錸g t誳 h靚h c黙 #{_INFOMSG%s}#I t誳 ra m祎 vi阯 #{_INFOMSG%s}#I ph醫 quang s醤g ch骾...", Name, SceneName,NPCName,NeedItemInfo, GemItemInfo, SceneName)
	
	--公告精简，只保留3级以上的宝石雕琢公告
	if (gemQual > 3) then
		BroadMsgByChatPipe(sceneId,selfId, strText, 4)
	end

	-- 雕琢成功特效....
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);

end

--**********************************
--醒目提示
--**********************************
function x800117_NotifyTip( sceneId, selfId, Msg )

	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
