--武当NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x012032_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� 甬 t� c黙 ph醝 V� 衋ng.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
