--120004

-- 苍茫山，阿紫

--脚本号
x120004_g_scriptId = 120004

--所拥有的事件ID列表
x120004_g_eventList={}

--**********************************
--事件列表
--**********************************
function x120004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		--
		local nRand = random( 3 )
		if nRand == 1  then
			AddText(sceneId,"Ph� m鐄, v� con ta 皤u n trong tay qu鈔 ph鋘 b礽, l鄊 th� n鄌 b鈟 gi�")
		elseif nRand == 2  then
			AddText(sceneId,"Ho鄋g 皙 b� h� c醕 h� minh th v�, Ti陁 鹫i hi畃 thi阯 h� v� 鸶ch, ch鷑g ta nh 鸶nh chi猲 thg qu鈔 t誳 ph鋘")
		elseif nRand == 3  then
			AddText(sceneId,"T靚h h靚h hi畁 r nguy c, nh遪g ch韓h l� l鷆 cho ta r靚h c� h礽 b醥 th�")
		end
		
		for i, eventId in x120004_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x120004_OnDefaultEvent( sceneId, selfId, targetId )
	x120004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x120004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x120004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x120004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x120004_g_eventList do
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
function x120004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x120004_g_eventList do
		if missionScriptId == findId then
			x120004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x120004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x120004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x120004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x120004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x120004_OnDie( sceneId, selfId, killerId )
end
