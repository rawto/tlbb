--武当NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x012030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Vi阯 chuy琻 nh� �, thanh t竛h v� vi, 疴y ch韓h l� n鷌 V� 衋ng. N猽 b課 c s� gi鷓 疝, m秈 皙n t靘 Tri kh醕h 鹫o nh鈔 � g 疴y 瓞 nh� gi鷓 疝.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
