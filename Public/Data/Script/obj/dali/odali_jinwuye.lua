--大理NPC
--金五爷
--元宝商人

--**********************************
--事件交互入口
--**********************************
function x002059_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"H鄋h t giang h� 疬絥g nhi阯 k� ch裞 quy玭 c鄋g cao th� l読 c鄋g gi鄒 c�. T鴆 ng� c� c鈛 'C� ti玭 c� th� ma sui qu� khi猲'. Trong tay c� Nguy阯 B鋙 Kim T� c� th� l鄊 r nhi玼 vi甤 l緉, ng叨i ng叨i ph鋓 ng呔c nh靚...")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
