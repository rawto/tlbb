--苏州NPC
--柳金蟾
--一般

--**********************************
--事件交互入口
--**********************************
function x001038_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"C� th� sinh Nhan Tra T醤 皙n t� T� Ch鈛. Huynh  r bu皀 c叨i.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
