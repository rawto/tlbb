--苏州NPC
--张择端
--一般

--**********************************
--事件交互入口
--**********************************
function x001011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"M ng鄖 n鎍 l� t緄 ti猼 thanh minh r癷. B猲 T� Ch鈛 l鷆 痼 nh 鸶nh 痿ng vui l. N猽 c� th� 餰m c鋘h v 皓p 皎 c黙 T� Ch鈛 v鄌 trong tranh v� th� hay bi猼 m.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
