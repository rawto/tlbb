--商人的Npc
--普通

--脚本号
x125003_g_scriptId = 125003

--商店编号
x125003_g_ShopTabId_1	= 143
x125003_g_ShopTabId_2	= 27

--所拥有的事件ID列表
x125003_g_eventList={}

--**********************************
--事件交互入口
--**********************************

function x125003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"C醕 h� g鱥 ch鷗 g� kh鬾g? � 疴y t鬷 c� r nhi玼 鸢 錸 u痭g. Gi� c� c鹡g ngang v緄 th鄋h L誧 D呓ng 黏y!")
		AddNumText(sceneId,x125003_g_scriptId,"Mua thu痗 v� th裞 錸",7,0)
		AddNumText(sceneId,x125003_g_scriptId,"Mua 鸢 錸 cho tr鈔 th�",7,1)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x125003_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()
	
	if key == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x125003_g_ShopTabId_1 )
	end
	if key == 1 then
		DispatchShopItem( sceneId, selfId, targetId, x125003_g_ShopTabId_2 )
	end
end

