--汪延
--敦煌传送火焰山

--脚本号
x008112_g_ScriptId	= 008112

--所拥有的事件ID列表
x008112_g_Transport = 400900

x008112_g_Impact_Transport_Mission = 113 -- 运输状态特效--[tx45130]
--目标场景
--**********************************
--事件交互入口
--**********************************
function x008112_OnDefaultEvent( sceneId, selfId, targetId )
	local	nam	= GetName( sceneId, selfId )

	BeginEvent( sceneId )
	AddText( sceneId, nam..", ti猲 v鄌 Sa M誧 Phi Sa 餴 theo h呔ng t鈟 ch韓h l� H鯽 Di甿 S絥! T� H鯽 Di甿 S絥 c� th� 皙n 疬㧟 Cao X呓ng C� Qu痗. 衞課 疬秐g n鄖 r nguy hi琺, ch� c� nh鎛g anh h鵱g #Gtr阯 c 90 #Wm緄 c� 瘘 t� c醕h b呔c v鄌." )
	AddNumText( sceneId, x008112_g_ScriptId, "歇n H鯽 Di甿 S絥", 9, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x008112_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetLevel( sceneId, selfId ) < 90 then 
		BeginEvent( sceneId )
			AddText( sceneId, "N絠 n鄖 v� c鵱g nguy hi琺 m� h靚h nh� c醕 h� ch遖 瘘 鹌ng c 90. H銀 ngh� cho s� an to鄋 c黙 c醕 h� � h銀 r鑞 luy畁 ti猵. Sau n鄖 h銀 皙n t靘 ta." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	else 
		--[tx45130]	
		local haveImpact = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x008112_g_Impact_Transport_Mission)
		if haveImpact == 1 then
				BeginEvent(sceneId)
					AddText(sceneId,"#{Transfer_090304_1}");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end
		--[/tx45130]
		CallScriptFunction((x008112_g_Transport), "TransferFunc",sceneId, selfId, 423, 223, 29, 90, 1000)
	end
end
