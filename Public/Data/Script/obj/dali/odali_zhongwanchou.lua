--大理NPC
--钟万仇
--普通

--**********************************
--事件交互入口
--**********************************
function x002086_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"衞鄋 Ch韓h Thu tr秈 sinh t韓h phong l遳, t誳 nhi玼 oan nghi畉, k猼 qu� l� th鈔 sinh n� nh鈔 m玭 nhau th鄋h gian. Th l� ti b� v� s� chi c馽...")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
