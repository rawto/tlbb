--对话事件 npc白颖明

--脚本号
x713616_g_ScriptId = 713512

--对话内容
x713616_g_dialog = {"N猽 nh� c醕 h� mu痭 ch� th鄋h n阯 c醕 lo読 鸬c d唼c nguy hi琺, h銀 t靘 hi瑄 thu Ch� 械c c黙 Tinh T鷆 ta",
			"C鈛 h鰅 s� 2",
			"Ch� c c醕 h� h鱟 疬㧟 ph呓ng th裞 Ch� 械c, c� th� b鄌 ch� n阯 c醕 lo読 鸬c d唼c mang 鸬c t韓h c馽 cao.",
			"Ch� 械c c騨 ph� thu礳 v鄌 鹌ng c k� n錸g. 衅ng c k� n錸g c鄋g cao, 鸬c d唼c ch� ra 鸬c t韓h c鄋g m課h",
			"Kh鬾g ph鋓 ch� 鸬c 瓞 餴 h読 ng叨i, Tinh T鷆 ta c騨 s� d鴑g 鸬c d唼c 瓞 luy畁 c鬾g n鎍. T鵼 t譶g lo読 鸬c d唼c n鄌 s� c� c鬾g d鴑g ri阯g c黙 n�..."}
x713616_g_button = {"N骾 v� th馽 t� 餴",
			"L鄊 sao 瓞 ch� 鸬c?",
			"Sau 痼 ra sao?",
			"Ch� 鸬c 瓞 餴 h読 ng叨i?",
			}

--**********************************
--任务入口函数
--**********************************
function x713616_OnDefaultEvent( sceneId, selfId, targetId, MessageNum )	--MessageNum是对话编号，用于调用不同对话
		BeginEvent(sceneId)
			AddText(sceneId, x713616_g_dialog[MessageNum])
			if MessageNum ~= 5 then
				AddNumText(sceneId,MessageNum, x713616_g_button[MessageNum],11,-1)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713616_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713616_g_ScriptId,"T靘 hi瑄 ch� 鸬c",11,-1)
end

--**********************************
--检测接受条件
--**********************************
function x713616_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713616_OnAccept( sceneId, selfId, AbilityId )
end
