--大理NPC
--韩永安
--普通

x002029_g_shoptableindex_1=8


--**********************************
--事件交互入口
--**********************************
function x002029_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"锈y l� ti甿 c 鸢 l緉 nh Th鄋h 姓i L�. Ng呓i mu痭 g�?")
		--AddNumText(sceneId,g_scriptId,"购买普通材料",7,0)
		EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x002029_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText() == 0	then
		DispatchShopItem( sceneId, selfId,targetId, x002029_g_shoptableindex_1 )
	end
end
