--洛阳NPC
--巴天石
--普通

--**********************************
--事件交互入口
--**********************************
function x000019_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "C� n呓ng"
	else
		PlayerSex = "Thi猽 hi畃"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"Kh閛 th"..PlayerName..PlayerSex..", th� n鄌 l読 g nhau � 疴y. 姓i L� m瞚 l tham gia cu礳 thi t鷆 c, 皤u ch� l� ph� Th醝 t� 瘅c s醕h m� th鬷")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
