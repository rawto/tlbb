--苏州NPC
--风波恶
--一般

--**********************************
--事件交互入口
--**********************************
function x001019_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Mu痭 疳nh nhau kh鬾g? B阯 kia c� L鬷 疣i, ch鷑g ta th� 黏u 1 tr. Sao? Kh鬾g d醡 �?")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
