--大理NPC
--褚万里
--普通

--**********************************
--事件交互入口
--**********************************
function x002011_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "C� n呓ng"
	else
		PlayerSex = "Thi猽 hi畃"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"C鵱g nhau tu luy畁 m祎 lo読 tuy畉 th� v� c鬾g, ch苙g nh� ch鷑g ta c鵱g tr� th鄋h Ho鄋g Gia H� V� sao? "..PlayerName..PlayerSex..", ng呓i c� th� b醝 nh th 鹫i m鬾 ph醝. Ng� Hoa 朽n c� r nhi玼 Th 鹫i m鬾 ph醝 ch� d鏽 nh鈔, ng呓i c� th� 皙n 痼 h鱟 h鰅 th阭.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
