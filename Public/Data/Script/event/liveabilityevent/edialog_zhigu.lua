--对话事件 npc白颖明

--脚本号
x713615_g_ScriptId = 713512

--对话内容
x713615_g_dialog = {"#{event_liveabilityevent_0019}",
			"C鈛 h鰅 s� 2",
			"Ch� c c醕 h� h鱟 疬㧟 ph呓ng th裞 M� Thu, c� th� b鄌 ch� n阯 c醕 lo読 thu痗 c� t韓h m� ho c馽 cao.",
			"M� Thu c騨 ph� thu礳 v鄌 鹌ng c k� n錸g. 衅ng c k� n錸g c鄋g cao, thu痗 ch� ra 鸬c t韓h c鄋g m課h",
			"#{event_liveabilityevent_0020}"}
x713615_g_button = {"N骾 v� th馽 t� 餴",
			"L鄊 sao 瓞 ch� thu痗 m�?",
			"Sau 痼 ra sao?",
			"Thu痗 m� 瓞 l鄊 g�?",
			}

--**********************************
--任务入口函数
--**********************************
function x713615_OnDefaultEvent( sceneId, selfId, targetId, MessageNum )	--MessageNum是对话编号，用于调用不同对话
		BeginEvent(sceneId)
			AddText(sceneId, x713615_g_dialog[MessageNum])
			if MessageNum ~= 5 then
				AddNumText(sceneId,MessageNum, x713615_g_button[MessageNum],11,-1)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713615_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713615_g_ScriptId,"T靘 hi瑄 ch� 鸬c",11,-1)
end

--**********************************
--检测接受条件
--**********************************
function x713615_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713615_OnAccept( sceneId, selfId, AbilityId )
end
