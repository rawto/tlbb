--苏州NPC
--谢尚
--一般

--**********************************
--事件交互入口
--**********************************
function x001027_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"C豼 ch鈛 th呓ng h礽 s l t裞 ch韓h th裞 m� h鄋g.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
