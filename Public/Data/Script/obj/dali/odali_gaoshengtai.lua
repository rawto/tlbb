--高升泰

--脚本号
x002018_g_scriptId = 002018


--所拥有的事件ID列表
x002018_g_eventList={}
--x002018_g_eventList={200301,200302}

--**********************************
--事件列表
--**********************************
function x002018_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "C� n呓ng"
	else
		PlayerSex = "Thi猽 hi畃"
	end
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"Hi畁 t読 c� r nhi玼 v� l鈓 nh鈔 s� t� t t読 th鄋h 姓i L�. "..PlayerName..PlayerSex..", n猽 ng呓i mu痭 痼ng g髉 hy sinh v� tri玼 痨nh, h銀 皙n Ng� Hoa 朽n t靘 L� C鬾g B�, 鬾g ta c� r nhi玼 nhi甿 v� c ng呓i gi鷓 疝! S� c� nh鎛g v ph qu� gi� th叻ng cho ng呓i sau khi ng呓i ho鄋 th鄋h nhi甿 v� 鬾g ta giao.")
	--四大恶人此次前来大理,不知有何所图,但总而言之,不是好事.");
	for i, eventId in x002018_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002018_OnDefaultEvent( sceneId, selfId,targetId )
	x002018_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002018_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002018_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002018_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002018_g_eventList do
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
function x002018_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002018_g_eventList do
		if missionScriptId == findId then
			x002018_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002018_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002018_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002018_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002018_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002018_OnDie( sceneId, selfId, killerId )
end
