--大理NPC
--初击平
--鉴定符商人

x002077_g_scriptId = 002077
x002077_g_shoptableindex = 10

--**********************************
--事件交互入口
--**********************************
function x002077_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "B鋘 nh鈔 b醤 ra c醕 lo読 鸬c nh v� nh� b� ch� ph�, c� kh� n錸g gi醡 鸶nh thu礳 t韓h c醕 lo読 h靚h trang b�. Ng呓i c� mu痭 xem kh鬾g?" )
		AddNumText( sceneId, x002077_g_scriptId, "Xem ng呓i b醤 nh鎛g g�", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002077_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x002077_g_shoptableindex )
	end
end
