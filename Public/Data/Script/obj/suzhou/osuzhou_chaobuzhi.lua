--苏州NPC
--晁补之
--一般

--**********************************
--事件交互入口
--**********************************
function x001005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Tr呓ng L瞚 huynh v� H� Ch� huynh t鄆 hoa 皤u cao h絥 t読 h� r nhi玼")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
