--苏州NPC
--包不同
--一般

--**********************************
--事件交互入口
--**********************************
function x001018_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Phi d�, phi d�, 瘊ng ra l� \"C鵱g t b鉯 hoang l� n鷌 xu鈔, ng叨i 餴 l読 � n鷌 xu鈔 ngo読\" m緄 ph鋓.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
