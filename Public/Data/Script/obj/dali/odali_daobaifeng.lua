--大理NPC
--刀白凤
--普通

--**********************************
--事件交互入口
--**********************************
function x002006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Ai? D� nhi 餴 l鈛 nh� v v鏽 ch遖 tr� v�. Ta lo lg giang h� hi琺 醕 kh鬾g bi猼 n� c� g ph鋓 chuy畁 g� kh鬾g...")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end