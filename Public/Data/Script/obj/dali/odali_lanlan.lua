--大理NPC
--兰兰
--普通

--**********************************
--事件交互入口
--**********************************
function x002052_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"V呓ng phi ng鄖 ng鄖 錸 kh鬾g no, ng� kh鬾g y阯, th鈔 h靚h suy s鴓 tr鬾g th...")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
