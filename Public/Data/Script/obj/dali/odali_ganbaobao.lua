--大理NPC
--甘宝宝
--普通

--**********************************
--事件交互入口
--**********************************
function x002085_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"H�. K� n鄌 l鄊 vi甤 v� s�, tr醝 l呓ng t鈓, kh鬾g c n骾 ta c鹡g s� 皙n tr譶g tr� k� 痼 d� l� ai!")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
