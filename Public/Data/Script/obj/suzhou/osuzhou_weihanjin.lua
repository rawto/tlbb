--苏州NPC
--魏汉津
--一般

--**********************************
--事件交互入口
--**********************************
function x001013_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"T� h鱟 s�, ti猲g c kh鬾g � 疣n, c鹡g kh鬾g � tr阯 ng髇 tay, m� � trong t鈓.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
