--NPC
--傀儡
--普通

--**********************************
--事件交互入口
--**********************************
function x014011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"B� nh靚 Ti陁 Dao lo読 F-17173 鸬ng t醕 b靚h th叨ng... Tuy畉 h鋙... V� 鹫i... Ki畉 xu... Ho鄋 m�...")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
