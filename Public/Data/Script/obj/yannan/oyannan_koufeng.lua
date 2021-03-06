--寇封

--脚本号
x018001_g_scriptId = 018001


--所拥有的事件ID列表
x018001_g_eventList={}--210902}

--**********************************
--事件列表
--**********************************
function x018001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"Ho課 quan gi醡 s醫 qu鈔 l韓h M� Th譨 S鋘h th叨ng xuy阯 c呔p c黙 c黙 d鈔 l鄋h � ch� Nh課 M鬾, t呔ng qu鈔 ho課 quan L誧 Ph鴑g Ti阯 thu礳 h� c黙 鬾g ta c騨 th叨ng xuy阯 餰m qu鈔 餴 c呔p c黙 d鈔 l鄋h d鈔 t礳 Kh� 薪n, g鱥 vi甤 n鄖 l� \"c呔p th鋙 c痗\", c� l鷆 c騨 xu痭g c呔p th鋙 c痗 c黙 ng叨i d鈔 t礳 H醤. C� theo 疣 n鄖, trong m b醕h t韓h tr錷 h�, qu鈔 l韓h ch苙g kh醕 n鄌 l� 醕 qu�.")
	for i, eventId in x018001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x018001_OnDefaultEvent( sceneId, selfId,targetId )
	x018001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x018001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x018001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x018001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018001_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x018001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x018001_g_eventList do
		if missionScriptId == findId then
			x018001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x018001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x018001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x018001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x018001_OnDie( sceneId, selfId, killerId )
end
