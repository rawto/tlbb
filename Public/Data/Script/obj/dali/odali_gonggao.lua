--大理公告牌

--任务号
x714014_g_MissionId = 704

x714014_g_SignPost = {x = 160, z = 156, tip = "Tri畊 Thi阯 S�"}

function x714014_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if	IsHaveMission(sceneId,selfId,x714014_g_MissionId)>0	 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x714014_g_MissionId)
	    SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	    SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
		BeginEvent(sceneId)
			AddText(sceneId,"#{BGDH_81009_01}")
		EndEvent( )
		DispatchMissionTips(sceneId,selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GThi阯 Long B醫 B� vi畉 h骯 b穒 #r#YH� Ho鄋g ( S骾 Kool - Facebook )#G. Have fun!...")
		EndEvent( )
		DispatchEventList(sceneId,selfId,targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId,sceneId, x714014_g_SignPost.x, x714014_g_SignPost.z, x714014_g_SignPost.tip )
	else
		BeginEvent(sceneId)
			AddText(sceneId,"Khai m誧 V� L鈓 姓i H礽 c騨 7 kh.")
		EndEvent( )
		DispatchEventList(sceneId,selfId,targetId)
	end
end
