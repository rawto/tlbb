--对话事件 npc白颖明

--脚本号
x713618_g_ScriptId = 713512

--对话内容
x713618_g_dialog = {"#{event_liveabilityevent_0021}",
			"C鈛 n骾 th� hai",
			"Ch� c huynh h鱟 k� n錸g luy畁 餫n. T nhi阯, 鹌ng c c黙 huynh c鄋g cao, 餫n d唼c luy畁 th鄋h c鄋g m課h",
			"Ch� c h鱟 疬㧟 k� n錸g luy畁 餫n, ki猰 cho 瘘 nguy阯 li畊 l� c� th� th馽 h鄋h luy畁 餫n r癷",
			"#{event_liveabilityevent_0022}"}
x713618_g_button = {"羞㧟 r癷, 疬㧟 r癷, n骾 g� th馽 t� 餴",
			"T読 h� l鄊 th� n鄌 瓞 luy畁 餫n?",
			"Sau 痼 th� sao?",
			"K猼 qu� th� n鄌?",
			}

--**********************************
--任务入口函数
--**********************************
function x713618_OnDefaultEvent( sceneId, selfId, targetId, MessageNum )	--MessageNum是对话编号，用于调用不同对话
		BeginEvent(sceneId)
			AddText(sceneId, x713618_g_dialog[MessageNum])
			if MessageNum ~= 5 then
				AddNumText(sceneId,MessageNum, x713618_g_button[MessageNum],11,-1)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713618_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713618_g_ScriptId,"T靘 hi瑄 luy畁 餫n",11,-1)
end

--**********************************
--检测接受条件
--**********************************
function x713618_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713618_OnAccept( sceneId, selfId, AbilityId )
end
