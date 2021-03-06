--随身元宝 NPC
--注意本脚本含有随身元宝相关功能，请一定参照现有的例子进行修改。

x181003_g_scriptId 	= 181003
x181003_g_buyrate 	= 0.5

x181003_g_shoptableindex=120
x181003_g_zengdianshop=121

x181003_g_goodact		= 1		--元宝商店
x181003_g_buyact	 	= 2		--兑换元宝
x181003_g_ticketact = 3		--兑换元宝票
x181003_g_zdianact	= 4		--赠点商店
x181003_g_gotodali	= 5		--返回洛阳

x181003_g_normalzdianshop	= 6		--普通增点商店
x181003_g_lv1zdianshop	= 7			--一Nguy阯 li畊 c 
x181003_g_lv2zdianshop	= 8			--二Nguy阯 li畊 c 
x181003_g_lv3zdianshop	= 9			--三Nguy阯 li畊 c 
x181003_g_lv4zdianshop	= 10		--四Nguy阯 li畊 c 
x181003_g_lv5zdianshop	= 11		--五Nguy阯 li畊 c 
x181003_g_lv6zdianshop	= 12		--六Nguy阯 li畊 c 
x181003_g_lv7zdianshop	= 13		--七Nguy阯 li畊 c 
x181003_g_lv8zdianshop	= 14		--八Nguy阯 li畊 c 
x181003_g_lv9zdianshop	= 15		--九Nguy阯 li畊 c 
x181003_g_lv10zdianshop	= 16		--十Nguy阯 li畊 c 
x181003_g_newprize	= 17		--查看中奖
x181003_g_YuanBaoIntro	= 18	--元宝介绍

x181003_g_leave			= 20	--离开
x181003_g_return		= 21	--返回(主菜单)
x181003_g_return1		= 22	--返回(元宝商店)
x181003_g_DZYBact		= 23	--打造图元宝商店

--元宝商店	-modify by xindefeng
x181003_g_YBShop		=
{
	--索引（顺序递增 1-N），name = 商店名称，id = 商店ID，key = GetNumText（顺序递增 101-N）
	[1]	= { name = "#gff00f0Nhi畉 m読 th呓ng ph", id = 151, key = 101 },
	[2]	= { name = "#c6de4feThi阯 Long s黱g v qu醤", id = -1, key = 102 },
	[3]	= { name = "Thi阯 cung ng� m� gi醡", id = 134, key = 103 },	
	[4]	= { name = "#c6de4feThi阯 Long h靚h t唼ng qu醤", id = -1, key = 104 },
	[5]	= { name = "L遳 D呓ng ph醥 hoa 餴猰", id = 132, key = 105 },
	[6]	= { name = "Xu鈔 th鄋h b醕h hoa cung", id = 133, key = 106 },	
	[7]	= { name = "Bi琻 Th呔c linh d唼c 餴猰", id = 136, key = 107 },
	[8]	= { name = "#gff00f0K� tr鈔 d� b鋙", id = 137, key = 108 },	
	[9] = { name = "#c6de4feThi阯 Long b鋙 th誧h trai", id = -1, key = 109 },	
	[10]	= { name = "Ho鄋 thi th鼀 c醕", id = 146, key = 110 },
	[11]	= { name = "Tam thanh th ph�", id = 144, key = 111 }
}

--元宝珍兽店--add by xindefeng
x181003_g_YBPetShops =
{
	[1]	= { name = "Phi Phi tr鈔 th� qu醤", id = 152, key = 112 },
	[2]	= { name = "Phi陁 Phi陁 tr鈔 th� qu醤", id = 135, key = 113 }
}

--元宝形象店--add by xindefeng
x181003_g_YBXingXiangShops =
{
	[1]	= { name = "M� Lan th秈 trang 餴猰", id = 120, key = 114 },
	[2] = { name = "Nh� � bi猲 th鈔 trai", id = 181, key = 115 },
	[3] = { name = "Thi阯 D呓ng ph醫 ngh� qu醤", id = 145, key = 116 },
	[4] = { name = "Lan V� m� dung ph叨ng", id = 182, key = 117 }	--add by zchw
}

--元宝宝石店--add by xindefeng
x181003_g_YBBaoshiShops =
{
	[1]	= { name = "Ph騨g b鋙 th誧h 姓i L�", id = 149, key = 118 },
	[2]	= { name = "Ph騨g b鋙 th誧h T� Ch鈛", id = 150, key = 119 },
	[3]	= { name = "Ph騨g b鋙 th誧h L誧 D呓ng", id = 178, key = 120 },
	[4]	= { name = "#gff00f0B鋙 th誧h tinh hoa 餴猰", id = 198, key = 132 }   -- added by houzhifang in 20081107 tt:40793; 120--131被用过了
}

--打造图商店
x181003_g_DZYBShop	=
{
	--索引（顺序递增 1-N），name = 商店名称，id = 商店ID，key = GetNumText（顺序递增 201-N）
	[1]	= { name = "衋o ph� - Th呓ng b眓g", id = 156, key = 201 },
	[2]	= { name = "薪n 餺鋘 - Song 餺鋘", id = 157, key = 202 },
	[3]	= { name = "Phi猲 - Ho鄋", id = 158, key = 203 },
	[4]	= { name = "M鉶 - Y ph鴆", id = 159, key = 204 },
	[5]	= { name = "Th� s醥 - H鄆", id = 160, key = 205 },
	[6]	= { name = "H� uy琻 - H� ki阯", id = 161, key = 206 },
	[7]	= { name = "Y陁 疳i", id = 162, key = 207 },
	[8]= { name = "H課g li阯", id = 163, key = 208 },
	[9]	= { name = "Gi緄 ch�", id = 164, key = 209 },
	[10]	= { name = "H� ph�", id = 165, key = 210 },
}

--浏阳花炮店
x181003_g_YBHuaPaoShops =
{
	[1]	= { name = "需n 饀痗 r馽 r�", id = 190, key = 300 },
	[2]	= { name = "V ph ng鄖 l�", id = 191, key = 301 },
	[3]	= { name = "Khuynh th鄋h chi t�", id = 192, key = 302 },
}

--桃堡奇物店
x181003_g_YBQiWuShops =
{
	[1]	= { name = "Lung linh th誧h 馥u k�", id = 193, key = 303 },
	[2]	= { name = "D� th� gia c鬾g ph叨ng", id = 194, key = 304 },
	[3]	= { name = "Nam b k� h骯 餴猰", id = 195, key = 305 },
	[4]	= { name = "Nguy阯 b鋙 k� v 餴猰", id = 137, key = 306 },
}

--热卖商店
x181003_g_YBReMaiShops =
{
	[1]	= { name = "V ph m緄", id = 188, key = 307 },
	[2] = { name = "Nh鈔 kh� th呓ng ph", id = 189, key = 309 },
}

--**********************************
--事件交互入口
--**********************************
function x181003_OnDefaultEvent( sceneId, selfId, targetId )
	if targetId == -1 then
		x181003_OnEventRequest( sceneId, selfId, targetId, nil )
	else
		BeginEvent( sceneId )
--			local strText = "    有钱能使鬼推磨，虽然江湖当中以武力为上，但是有了元宝可能会使原来很多比较难办的事情变得简单起来，您想做些什么呢？"
--			AddText( sceneId, strText )
--			AddNumText( sceneId, x181003_g_scriptId, "我想购买商品", 2, x181003_g_goodact)
--			if targetId >= 0 then
--				AddNumText( sceneId, x181003_g_scriptId, "我想兑换元宝", 2, x181003_g_buyact)
--				if IsShutout( sceneId, selfId, ONOFF_T_YBCASH ) == 0 then
--					AddNumText( sceneId, x181003_g_scriptId, "我想兑换元宝票", 2, x181003_g_ticketact)
--				end
--			else
--				targetId = -1	--为了能正常弹出选项
--			end
			for i = 1, getn( x181003_g_YBShop ) do
				AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBShop[i].name, 7, x181003_g_YBShop[i].key )
			end
			AddNumText(sceneId,x181003_g_scriptId, "袖 t誳 鸢", 7, x181003_g_DZYBact)
			AddNumText( sceneId, x181003_g_scriptId, "Gi緄 thi畊 Ti玭 Trang", 11, x181003_g_YuanBaoIntro)
			if targetId < 0 then
				targetId = -1
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--事件列表选中一项
--**********************************
function x181003_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == x181003_g_buyact then
		--先询问自己的剩余点数
		CallScriptFunction( PRIZE_SCRIPT_ID, "AskPoint", sceneId, selfId )
		
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, x181003_g_buyrate*1000)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 2001 )
	elseif GetNumText() == x181003_g_newprize then
		CallScriptFunction( PRIZE_SCRIPT_ID, "AskPrize", sceneId, selfId)
	elseif GetNumText() == x181003_g_return then
		local nID = targetId;
		if nID < 0 then nID = -2 end -- -2是菜单，-1是响应
		x181003_OnDefaultEvent( sceneId, selfId, nID )
	elseif GetNumText() == x181003_g_goodact or GetNumText() == x181003_g_return1 then
--		BeginEvent( sceneId )
--			for i = 1, getn( x181003_g_YBShop ) do
--				AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBShop[i].name, 7, x181003_g_YBShop[i].key )
--			end
--			AddNumText(sceneId,x181003_g_scriptId, "打造图专卖", 7, x181003_g_DZYBact)
--			AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return)
--		EndEvent( sceneId )
--		DispatchEventList( sceneId, selfId, targetId )
		local nID = targetId;
		if nID < 0 then nID = -2 end -- -2是菜单，-1是响应
		x181003_OnDefaultEvent( sceneId, selfId, nID )
	elseif GetNumText() == x181003_g_DZYBact then
		BeginEvent( sceneId )
			local strText = "H銀 l馻 ch鱪 lo読 痄 t誳 鸢 t呓ng 裯g."
			AddText( sceneId, strText )
			
			for i = 1, getn( x181003_g_DZYBShop ) do
				AddNumText( sceneId, x181003_g_scriptId, x181003_g_DZYBShop[i].name, 7, x181003_g_DZYBShop[i].key )
			end
			AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == x181003_g_zdianact then
		BeginEvent( sceneId )
			strText = "H銀 l馻 ch鱪 m祎 lo読 c豠 h鄋g 餴琺 tg t呓ng 裯g"
			AddText( sceneId, strText )
			AddNumText( sceneId, x181003_g_scriptId, "Ph� th鬾g th呓ng ph", 7, x181003_g_normalzdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 1", 7, x181003_g_lv1zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 2", 7, x181003_g_lv2zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 3", 7, x181003_g_lv3zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 4", 7, x181003_g_lv4zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 5", 7, x181003_g_lv5zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 6", 7, x181003_g_lv6zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 7", 7, x181003_g_lv7zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 8", 7, x181003_g_lv8zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 9", 7, x181003_g_lv9zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 10", 7, x181003_g_lv10zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == x181003_g_gotodali then
		NewWorld(sceneId,selfId,0,200,177)
	elseif GetNumText() == x181003_g_ticketact then
		local nYuanBao = YuanBao(sceneId,selfId,targetId,3,0)
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 2002 )
	elseif GetNumText() == x181003_g_leave then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	elseif GetNumText() == x181003_g_normalzdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 121 )
	elseif GetNumText() == x181003_g_lv1zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 122 )
	elseif GetNumText() == x181003_g_lv2zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 123 )
	elseif GetNumText() == x181003_g_lv3zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 124 )
	elseif GetNumText() == x181003_g_lv4zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 125 )
	elseif GetNumText() == x181003_g_lv5zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 126 )
	elseif GetNumText() == x181003_g_lv6zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 127 )
	elseif GetNumText() == x181003_g_lv7zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 128 )
	elseif GetNumText() == x181003_g_lv8zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 129 )
	elseif GetNumText() == x181003_g_lv9zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 130 )
	elseif GetNumText() == x181003_g_lv10zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 131 )
	elseif GetNumText() == x181003_g_YuanBaoIntro	then
		BeginEvent( sceneId )
			AddText( sceneId, "#{INTRO_YUANBAO}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 102 then	--天龙珍兽店	--add by xindefeng
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBPetShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBPetShops[i].name, 7, x181003_g_YBPetShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 104 then	--天龙形象馆	--add by xindefeng
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBXingXiangShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBXingXiangShops[i].name, 7, x181003_g_YBXingXiangShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 109 then	--天龙宝石店--add by xindefeng
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBBaoshiShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBBaoshiShops[i].name, 7, x181003_g_YBBaoshiShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )		
	elseif GetNumText() == 105 then	--浏阳花炮店
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBHuaPaoShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBHuaPaoShops[i].name, 7, x181003_g_YBHuaPaoShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 108 then	--桃堡奇物店
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBQiWuShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBQiWuShops[i].name, 7, x181003_g_YBQiWuShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 101 then	--热卖商店
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBReMaiShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBReMaiShops[i].name, 7, x181003_g_YBReMaiShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	else
		--元宝商店
		for i = 1, getn( x181003_g_YBShop ) do
			if (GetNumText() == 102 or GetNumText() == 104 or GetNumText() == 109 or GetNumText() == 105 or GetNumText() == 108 or GetNumText() == 101) then	--商店类型选项--add by xindefeng
				break
			end
			if GetNumText() == x181003_g_YBShop[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBShop[i].id )
				break
			end
		end
		--天龙珍兽店--add by xindefeng
		for i = 1, getn( x181003_g_YBPetShops ) do
			if GetNumText() == x181003_g_YBPetShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBPetShops[i].id )
				break
			end
		end
		--天龙形象馆--add by xindefeng
		for i = 1, getn( x181003_g_YBXingXiangShops ) do
			if GetNumText() == x181003_g_YBXingXiangShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBXingXiangShops[i].id )
				break
			end
		end
		--宝石商店--add by xindefeng
		for i = 1, getn( x181003_g_YBBaoshiShops ) do
			if GetNumText() == x181003_g_YBBaoshiShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBBaoshiShops[i].id )
				break
			end
		end
		--打造图专卖
		for i = 1, getn( x181003_g_DZYBShop ) do
			if GetNumText() == x181003_g_DZYBShop[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_DZYBShop[i].id )
				break
			end
		end
		--浏阳花炮店
		for i = 1, getn( x181003_g_YBHuaPaoShops ) do
			if GetNumText() == x181003_g_YBHuaPaoShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBHuaPaoShops[i].id )
				break
			end
		end
		--桃堡奇物店
		for i = 1, getn( x181003_g_YBQiWuShops ) do
			if GetNumText() == x181003_g_YBQiWuShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBQiWuShops[i].id )
				break
			end
		end
		--热卖商店
		for i = 1, getn( x181003_g_YBReMaiShops ) do
			if GetNumText() == x181003_g_YBReMaiShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBReMaiShops[i].id )
				break
			end
		end
	end
end

--**********************************
--客户端购买元宝接口
--**********************************
function x181003_BuyYuanbao( sceneId, selfId, nYuanBao )
	--购买元宝
	if nYuanBao then
		if nYuanBao > 0 and nYuanBao <= 10000 then
			CallScriptFunction( PRIZE_SCRIPT_ID, "AskYuanBao", sceneId, selfId, nYuanBao, nYuanBao*x181003_g_buyrate*1000)
		end
	end
end

--**********************************
--按需来弹出商店，分为随身商店和NPC商店
--**********************************
function x181003_NewDispatchShopItem(sceneId,selfId,targetId,shopId)
	if targetId >= 0 then	
		DispatchShopItem( sceneId, selfId,targetId, shopId )
	else
		DispatchNoNpcShopItem( sceneId, selfId, shopId )
	end
end
