--大理NPC
--小钗
--服装店

x002055_g_scriptId = 002055
x002055_g_shoptableindex = 3

--**********************************
--事件交互入口
--**********************************
function x002055_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "Hoan ngh阯h c醕 h� 皙n v緄 b眓 ti甿..." )
		AddNumText( sceneId, x002055_g_scriptId, "M� c豠 h鄋g", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002055_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x002055_g_shoptableindex )
	end
end
