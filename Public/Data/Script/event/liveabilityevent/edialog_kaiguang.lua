--对话事件 npc白颖明

--脚本号
x713611_g_ScriptId = 713512

--对话内容
x713611_g_dialog = {"#{event_liveabilityevent_0011}",
			"C鈛 n骾 th� hai",
			"Ch� c huynh h鱟 khai kho醤g l� c� th� khai kho醤g r癷. T nhi阯, 鹌ng c c黙 huynh c鄋g cao, ch黱g lo読 kho醤g th誧h khai th醕 疬㧟 c鄋g c� gi� tr�",
			"Ch� c h鱟 疬㧟 k� n錸g khai kho醤g, t読 m誧h kho醤g n鄌 痼 mi璶 sao 瘘 鹌ng c k� n錸g l� c� th� ti猲 h鄋h khai th醕 lo読 kho醤g 痼",
			"#{event_liveabilityevent_0012}"}
x713611_g_button = {"羞㧟 r癷, 疬㧟 r癷, n骾 g� th馽 t� 餴",
			"T読 h� l鄊 th� n鄌 瓞 khai kho醤g?",
			"Sau 痼 th� sao?",
			"Kho醤g th誧h sau 痼 瓞 l鄊 g�?",
			}

--**********************************
--任务入口函数
--**********************************
function x713611_OnDefaultEvent( sceneId, selfId, targetId, MessageNum )	--MessageNum是对话编号，用于调用不同对话
		BeginEvent(sceneId)
			AddText(sceneId, x713611_g_dialog[MessageNum])
			if MessageNum ~= 5 then
				AddNumText(sceneId,MessageNum, x713611_g_button[MessageNum],11,-1)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713611_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713611_g_ScriptId,"T靘 hi瑄 khai kho醤g",11,-1)
end

--**********************************
--检测接受条件
--**********************************
function x713611_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713611_OnAccept( sceneId, selfId, AbilityId )
end
