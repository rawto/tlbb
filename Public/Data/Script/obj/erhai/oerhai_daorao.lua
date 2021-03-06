--鲁平


--脚本号
x024001_g_scriptId = 024001

--所拥有的事件ID列表
x024001_g_eventList={808099, 808100, 808101, 808094}

--**********************************
--事件列表
--**********************************
function x024001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"Ng叨i tr� tu眎, � 疴y kh鬾g 疬㧟 ch誽 lung tung! #r#rNg叨i r譶g v� ng叨i s骾 皤u r 疳ng s�, h銀 xem t靚h h靚h trong l鄋g, c醕 h� s� hi瑄 b鱪 x鈓 l唼c 痼 hung d� 皙n 疴u. #r#rCon 疬秐g l緉 ph韆 tr呔c t阯 Tr� M� 姓o, r nhi玼 th呓ng nh鈔 v chuy琻 tr� 皙n c醕 n呔c xa x鬷, tr呔c 疴y 痿i khi c鹡g c� 鸬i ng馻 phi qua l鄋g, ti猲g nh誧 ng馻 c� th� vang r xa...")
	for i, eventId in x024001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x024001_OnDefaultEvent( sceneId, selfId,targetId )
	x024001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x024001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x024001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x024001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x024001_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x024001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x024001_g_eventList do
		if missionScriptId == findId then
			x024001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x024001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x024001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x024001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x024001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x024001_OnDie( sceneId, selfId, killerId )
end

