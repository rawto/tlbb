--元宝 NPC
--注意本脚本含有随身元宝相关功能，请一定参照现有的例子进行修改。

x181000_g_scriptId 	= 181000
x181000_g_buyrate 	= 1

x181000_g_shoptableindex=120
x181000_g_zengdianshop=121

x181000_g_goodact		= 1		--元宝商店
x181000_g_buyact	 	= 2		--兑换元宝
x181000_g_ticketact = 3		--兑换元宝票
x181000_g_zdianact	= 4		--赠点商店
x181000_g_gotodali	= 5		--返回洛阳

x181000_g_normalzdianshop	= 6		--普通增点商店
x181000_g_lv1zdianshop	= 7			--一级材料
x181000_g_lv2zdianshop	= 8			--二级材料
x181000_g_lv3zdianshop	= 9			--三级材料
x181000_g_lv4zdianshop	= 10		--四级材料
x181000_g_lv5zdianshop	= 11		--五级材料
x181000_g_lv6zdianshop	= 12		--六级材料
x181000_g_lv7zdianshop	= 13		--七级材料
x181000_g_lv8zdianshop	= 14		--八级材料
x181000_g_lv9zdianshop	= 15		--九级材料
x181000_g_lv10zdianshop	= 16		--十级材料
x181000_g_newprize	= 17		--查看中奖
x181000_g_YuanBaoIntro	= 18	--元宝介绍

x181000_g_leave			= 20	--离开
x181000_g_return		= 21	--返回(主菜单)

--**********************************
--事件交互入口
--**********************************
function x181000_OnDefaultEvent( sceneId, selfId, targetId )	
	BeginEvent( sceneId )
		local strText = "C� ti玭 c� th� sai khi猲 疬㧟 c� Qu�, tuy tr阯 giang h� ch� tr鱪g v� l馽, nh遪g c� kim nguy阯 b鋙 r癷 c� th� khi猲 nh鎛g vi甤 tr呔c 疴y v痭 kh� l鄊 tr� n阯 d� d鄋g h絥, c醕 h� mu痭 l鄊 g�?"
		AddText( sceneId, strText )
		--AddNumText( sceneId, x181000_g_scriptId, "我想购买商品", 2, x181000_g_goodact)
		--AddNumText( sceneId, x181000_g_scriptId, "将点数兑换成元宝", 2, x181000_g_buyact)
		--if IsEnableYuanBaoPiao() == 1 then
		--	AddNumText( sceneId, x181000_g_scriptId, "将元宝兑换成元宝票", 2, x181000_g_ticketact)
		--end
		--AddNumText( sceneId, x181000_g_scriptId, "赠点商店", 2, x181000_g_zdianact)
		--AddNumText( sceneId, x181000_g_scriptId, "元宝和赠点商店介绍", 11, x181000_g_YuanBaoIntro)
		--AddNumText( sceneId, x181000_g_scriptId, "#{CZSBS_81218_2}", 11, 19)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x181000_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == x181000_g_buyact then
		--先询问自己的剩余点数
		CallScriptFunction( PRIZE_SCRIPT_ID, "AskPoint", sceneId, selfId )
		
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, x181000_g_buyrate*1000)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 2001 )

	elseif GetNumText() == x181000_g_newprize then
		CallScriptFunction( PRIZE_SCRIPT_ID, "AskPrize", sceneId, selfId)

	elseif GetNumText() == x181000_g_return then
		x181000_OnDefaultEvent( sceneId, selfId, targetId )
	elseif GetNumText() == x181000_g_goodact then
--	新元宝商店
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, 1 )
			UICommand_AddInt( sceneId, 1 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 888902)
	
	elseif GetNumText() == x181000_g_zdianact then
		BeginEvent( sceneId )
			strText = "  请根据需求选择不同的赠点商店："
			AddText( sceneId, strText )
			AddNumText( sceneId, x181000_g_scriptId, "普通赠点商品", 7, x181000_g_normalzdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "一级材料 ", 7, x181000_g_lv1zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "二级材料 ", 7, x181000_g_lv2zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "三级材料 ", 7, x181000_g_lv3zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "四级材料 ", 7, x181000_g_lv4zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "五级材料 ", 7, x181000_g_lv5zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "六级材料 ", 7, x181000_g_lv6zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "七级材料 ", 7, x181000_g_lv7zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "八级材料 ", 7, x181000_g_lv8zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "九级材料 ", 7, x181000_g_lv9zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "十级材料 ", 7, x181000_g_lv10zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "返回上一页", -1, x181000_g_return)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText() == x181000_g_gotodali then
		NewWorld(sceneId,selfId,0,200,177)

	elseif GetNumText() == x181000_g_ticketact then
		local _yes = LuaFnOpenPWBox(sceneId,selfId);
		if(_yes~=1)then
			local nYuanBao = YuanBao(sceneId,selfId,targetId,3,0)
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 2002 )
		end

	elseif GetNumText() == x181000_g_leave then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )

	elseif GetNumText() == x181000_g_normalzdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 121 )
	elseif GetNumText() == x181000_g_lv1zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 122 )
	elseif GetNumText() == x181000_g_lv2zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 123 )
	elseif GetNumText() == x181000_g_lv3zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 124 )
	elseif GetNumText() == x181000_g_lv4zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 125 )
	elseif GetNumText() == x181000_g_lv5zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 126 )
	elseif GetNumText() == x181000_g_lv6zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 127 )
	elseif GetNumText() == x181000_g_lv7zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 128 )
	elseif GetNumText() == x181000_g_lv8zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 129 )
	elseif GetNumText() == x181000_g_lv9zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 130 )
	elseif GetNumText() == x181000_g_lv10zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 131 )
	
	elseif GetNumText() == x181000_g_YuanBaoIntro	then
		BeginEvent( sceneId )
			AddText( sceneId, "#{INTRO_YUANBAO}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText() == 19 then          -- 换元宝送宝石
		BeginEvent( sceneId )
			AddText( sceneId, "#{CZSBS_81218_1}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )



	end
end

--**********************************
--客户端购买元宝接口
--**********************************
function x181000_BuyYuanbao( sceneId, selfId, nYuanBao )
	if nYuanBao and nYuanBao >= 1200 then
		if LuaFnGetMaterialBagSpace(sceneId, selfId) <= 0 and GetMissionFlag(sceneId, selfId, MF_GEM_PRIZE_FLAG) == 0 then
			BeginEvent(sceneId);
				AddText(sceneId, "#{CZSBS_81218_3}");
			EndEvent(sceneId);
			DispatchMissionTips(sceneId, selfId);
			return
		end
	end
	--购买元宝
	if nYuanBao then
		if nYuanBao > 0 and nYuanBao <= 10000 then
			CallScriptFunction( PRIZE_SCRIPT_ID, "AskYuanBao", sceneId, selfId, nYuanBao, nYuanBao*x181000_g_buyrate*1000)
		end
	end
end

--**********************************
--按需来弹出商店，分为随身商店和NPC商店
--**********************************
function x181000_NewDispatchShopItem(sceneId,selfId,targetId,shopId)
	if targetId >= 0 then
		DispatchShopItem( sceneId, selfId,targetId, shopId )
	else
		DispatchNoNpcShopItem( sceneId, selfId, shopId )
	end
end
