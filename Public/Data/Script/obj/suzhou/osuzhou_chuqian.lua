--苏州NPC
--楚衍
--一般

--**********************************
--事件交互入口
--**********************************
function x001014_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Tr阯 c� thi阯 疣ng, d呔i c� T�, H鄋g. C鋘h 皓p c黙 T� Ch鈛 c醕 h� 疸 t譶g th ch遖?")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
