--苏州NPC
--公冶干
--一般

--**********************************
--事件交互入口
--**********************************
function x001017_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"C鬾g t� gia tr呔c nay n鷌 s kh鬾g bi猲 s, l n鄖 kh醕 h苙, nh 鸶nh g ph鋓 chuy畁 g� c馽 k� quan tr鱪g.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
