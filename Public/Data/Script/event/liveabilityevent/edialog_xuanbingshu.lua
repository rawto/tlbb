--对话事件 npc白颖明

--脚本号
x713614_g_ScriptId = 713512

--对话内容
x713614_g_dialog = {"#{event_liveabilityevent_0017}",
			"C鈛 h鰅 s� 2",
			"Ch� c c醕 h� h鱟 疬㧟 ph呓ng th裞 Huy玭 B錸g Thu l� c� th� ch� ra 餫n d唼c c� s裞 m課h kh黱g khi猵",
			"N骾 l� v ch� th ra ch苙g 鸾n gi鋘 皙n th�. 衅ng c Huy玭 B錸g Thu c鄋g cao, 餫n d唼c ch� ra c鄋g m課h",
			"#{event_liveabilityevent_0018}"}
x713614_g_button = {"N骾 v� th馽 t� 餴",
			"L鄊 sao 瓞 ch� 餫n d唼c?",
			"Sau 痼 ra sao?",
			"K猼 qu� th� n鄌?",
			}

--**********************************
--任务入口函数
--**********************************
function x713614_OnDefaultEvent( sceneId, selfId, targetId, MessageNum )	--MessageNum是对话编号，用于调用不同对话
		BeginEvent(sceneId)
			AddText(sceneId, x713614_g_dialog[MessageNum])
			if MessageNum ~= 5 then
				AddNumText(sceneId,MessageNum, x713614_g_button[MessageNum],11,-1)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713614_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713614_g_ScriptId,"T靘 hi瑄 Huy玭 B錸g Thu",11,-1)
end

--**********************************
--检测接受条件
--**********************************
function x713614_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713614_OnAccept( sceneId, selfId, AbilityId )
end
