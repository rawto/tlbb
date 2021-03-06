--鲁平


--脚本号
x024004_g_scriptId = 024004

--所拥有的事件ID列表
x024004_g_eventList={}

--**********************************
--事件列表
--**********************************
function x024004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"Ta l� k� m� c鬷, ch遖 bao gi� th m cha m�, ch韓h Th鷆 th鷆 nu鬷 ta t� b�, th鷆 th鷆 鸠i v緄 ta nh� con 痣, ta nh 鸶nh ph鋓 t靘 th 鬾g . #r#rTa 疸 t譶g nh靚 th b裞 v� c� c� trong ph騨g c黙 th鷆 th鷆, c� c� r xinh 皓p, th鷆 th鷆 m瞚 l u痭g say l読 nh靚 b裞 h鱝 痼, c� nh靚 m鉯. #r#rKh鬾g bi猼 th鷆 th鷆 c� 餴 t靘 c� c� kh鬾g?")
	for i, eventId in x024004_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x024004_OnDefaultEvent( sceneId, selfId,targetId )
	x024004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x024004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x024004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x024004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x024004_g_eventList do
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
function x024004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x024004_g_eventList do
		if missionScriptId == findId then
			x024004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x024004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x024004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x024004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x024004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x024004_OnDie( sceneId, selfId, killerId )
end

