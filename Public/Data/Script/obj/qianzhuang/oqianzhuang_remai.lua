--热卖元宝 NPC
--注意本脚本含有随身元宝相关功能，请一定参照现有的例子进行修改。

x181002_g_scriptId 	= 181002
x181002_g_buyrate 	= 0.5

x181002_g_shoptableindex=151 --已经废弃了，现在用188和189
x181002_g_goodact		= 1		--热卖元宝商店
x181002_g_YuanBaoIntro	= 18	--元宝介绍

--**********************************
--事件交互入口
--**********************************
function x181002_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		strText = "歇n 疴y m� xem, th呓ng ph b醤 ch誽 nh, gi� r� nh. Kh醕h quan, ng鄆 mau ch鱪 v鄆 m髇 餴, b鋙 痄m ng鄆 mua v� xong 痍m nay n m� c鹡g ph鋓 c叨i"
		AddText( sceneId, strText )
		AddNumText( sceneId, x181002_g_scriptId, "Mua nhi畉 m読 th呓ng ph", 7, x181002_g_goodact)
		AddNumText( sceneId, x181002_g_scriptId, "Gi緄 thi畊 Nguy阯 B鋙", 11, x181002_g_YuanBaoIntro)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x181002_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == x181002_g_goodact then
	--新的元宝商店
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, 1)
			UICommand_AddInt( sceneId, 2 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 888902)
	elseif GetNumText() == x181002_g_YuanBaoIntro	then
		BeginEvent( sceneId )
			AddText( sceneId, "#{INTRO_YUANBAO}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--按需来弹出商店，分为随身商店和NPC商店
--**********************************
function x181002_NewDispatchShopItem(sceneId,selfId,targetId,shopId)
	if targetId >= 0 then
		DispatchShopItem( sceneId, selfId,targetId, shopId )
	else
		DispatchNoNpcShopItem( sceneId, selfId, shopId )
	end
end
