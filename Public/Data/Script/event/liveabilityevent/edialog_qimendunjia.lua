--对话事件 npc白颖明

--脚本号
x713619_g_ScriptId = 713512

--对话内容
x713619_g_dialog = {"#{event_liveabilityevent_0023}",
			"C鈛 h鰅 th� 2",
			"Ch� c c醕 h� h鱟 疬㧟 ph呓ng th裞 K� M鬾 械n Gi醦, c� th� ch� ra c醕 lo読 ph� 鸬c nh v� nh� r癷",
			"羞絥g nhi阯, 鹌ng c k� n錸g c鄋g cao, ph� ch� ch� ra c� s裞 m課h c鄋g l緉",
			"#{event_liveabilityevent_0024}"}
x713619_g_button = {"N骾 v� th馽 t� ch鷗 餴",
			"L鄊 sao 瓞 ch� ph�?",
			"Sau 痼 ra sao?",
			"K猼 qu� th� n鄌?",
			}

--**********************************
--任务入口函数
--**********************************
function x713619_OnDefaultEvent( sceneId, selfId, targetId, MessageNum )	--MessageNum是对话编号，用于调用不同对话
		BeginEvent(sceneId)
			AddText(sceneId, x713619_g_dialog[MessageNum])
			if MessageNum ~= 5 then
				AddNumText(sceneId,MessageNum, x713619_g_button[MessageNum],11,-1)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713619_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713619_g_ScriptId,"T靘 hi瑄 K� M鬾 械n Gi醦",11,-1)
end

--**********************************
--检测接受条件
--**********************************
function x713619_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713619_OnAccept( sceneId, selfId, AbilityId )
end
