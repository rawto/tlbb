--大理NPC
--门卫
--普通

--**********************************
--事件交互入口
--**********************************
function x002022_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� h� v� 姓i L� Th鄋h!")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
