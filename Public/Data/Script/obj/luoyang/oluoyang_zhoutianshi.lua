--NPC
--
--脚本号
x000148_g_scriptId = 000148

--所拥有的事件ID列表
x000148_g_eventList={500619, 500600, 500606, 500601, 500602, 500603, 500604, 500605, 500607, 500608, 500612, 500613, 500614, 500615, 500616}

--普通

--**********************************
--事件交互入口
--**********************************
function x000148_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"Giang s絥 b痠 h� nh鈔 t鄆 xu, c醕 l鉵h phong tao s� b醕h ni阯. B� Nh鈔 v� Tri畊 Thi阯 S� c黙 姓i L� l� huynh 甬 鸢ng m鬾. Nay tr阯 giang h� xu hi畁 nh鈔 t鄆, ta vui m譶g kh鬾 xi猼. Con 疬秐g v� h鱟 th� kh鬾g h猼 bg ph苙g. C醕 h� c� ch� n鄌 kh鬾g")
		for i, eventId in x000148_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x000148_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000148_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000148_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000148_g_eventList do
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
function x000148_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000148_g_eventList do
		if missionScriptId == findId then
			x000148_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000148_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000148_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000148_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000148_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000148_OnDie( sceneId, selfId, killerId )
end
