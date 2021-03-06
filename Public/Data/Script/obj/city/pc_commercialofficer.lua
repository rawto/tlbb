--城市NPC
--商业官员

x805017_g_scriptId = 805017
x805017_g_BuildingID12 = 9

--所拥有的事件ID列表
x805017_g_eventList = { 600017 }

-- 任务集事件 ID 列表，这类事件包含子事件
x805017_g_eventSetList = { 600017 }

--**********************************
--事件列表
--**********************************
function x805017_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0
	local PlayerName = GetName( sceneId, selfId )

	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)

	BeginEvent( sceneId )
		if Humanguildid == cityguildid then
			AddText( sceneId, "Ta t� tr呔c t緄 nay coi 朽o Chu C鬾g l� t鬾 s�, con 疬秐g bu鬾 b醤, hai huynh 甬 ta c� th� c鵱g nhau nghi阯 c製" )
			for i, eventId in x805017_g_eventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
			AddNumText( sceneId, x805017_g_scriptId, "Gi緄 thi畊 nhi甿 v� th� t", 11, 1 )
			AddNumText( sceneId, x805017_g_scriptId, "Qu鋘 l� v騨g th呓ng nghi畃", 6, 3 )
			AddNumText( sceneId, x805017_g_scriptId, "Gi緄 thi畊 th� ph叨ng", 11, 2 )
			--life 添加这个建筑物的相应生活技能选项
			CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "AddCityLifeAbilityOpt",sceneId, selfId, x805017_g_scriptId,x805017_g_BuildingID12,888)
		else
			AddText( sceneId, "Kh鬾g ph鋓 l� ng叨i c黙 bang ta, suy ngh� c黙 h� ch ch ph鋓 穑c bi畉, th呓ng tr叨ng nh� chi猲 tr叨ng, ta t痶 nh kh鬾g n阯 nhi玼 l秈 v鏽 l� h絥" )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件交互入口
--**********************************
function x805017_OnDefaultEvent( sceneId, selfId, targetId )
	x805017_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- 判断某个事件是否可以通过此 NPC 执行
--**********************************
function x805017_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805017_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805017_g_eventSetList do
			if CallScriptFunction( findId, "IsInEventList", sceneId, selfId, eventId ) == 1 then
				bValid = 1
				break
			end
		end
	end

	return bValid
end

--**********************************
--事件列表选中一项
--**********************************
function x805017_OnEventRequest( sceneId, selfId, targetId, eventId )
	if x805017_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	--life 处理这个建筑物的相应生活技能选项
	elseif eventId ~= x805017_g_scriptId then
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnDefaultEvent",sceneId, selfId, targetId, eventId, x805017_g_scriptId, x805017_g_BuildingID12 )
		return
	end
	if GetNumText() == 1 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Market_Mission_Help}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 2 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_JiFang}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 3 then
		BeginEvent(sceneId)
			AddText( sceneId, "Ch裞 n錸g n鄖 s 疬㧟 th馽 hi畁" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 888 then
		BeginEvent(sceneId)
		--life 添加这个建筑物的相应生活技能选项
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnEnumerate",sceneId, selfId, targetId, x805017_g_BuildingID12 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x805017_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805017_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805017_NotifyFailTips( sceneId, selfId, "Ng呓i hi畁 kh鬾g th� nh nhi甿 v� n鄖" )
		elseif ret == -2 then
			x805017_NotifyFailTips( sceneId, selfId, "Kh鬾g th� ti猵 nh nhi玼 nhi甿 v�" )
		end

		return
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x805017_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805017_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805017_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x805017_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805017_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x805017_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805017_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--死亡事件
--**********************************
function x805017_OnDie( sceneId, selfId, killerId )
end

function x805017_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
