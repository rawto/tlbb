--大理NPC
--武士
--普通

--**********************************
--事件交互入口
--**********************************
function x002065_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Lu v� c鬾g, h銀 皙n L鬷 朽i...")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
