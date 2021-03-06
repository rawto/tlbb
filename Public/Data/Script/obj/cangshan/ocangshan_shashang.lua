--甘宝宝

--脚本号
x025002_g_scriptId = 025002

--所拥有的事件ID列表
x025002_g_eventList={}

--**********************************
--事件列表
--**********************************
function x025002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"锈y l� Quan Nguy畉 徐nh � Th呓ng S絥, ph韆 tr呔c ch韓h l� Nh� H鋓, v鄌 m瞚 痍m tr錸g, Nh� H鋓 phong 痨nh n呔c t頽h, 醤h tr錸g s醤g v鄋g v h騛 trong m h�, nh� ng鄋 v課 v� sao l l醤h, mu鬾 ng鄋 con s髇g b誧 l錸 t錸. #r#rV醕h n鷌 鸠i di畁 l� V鱪g Tuy猼 Nhai, 鹧ng tr阯 v醕h n鷌 痼 c� th� nh靚 th tuy猼 trg tr阯 痫nh Tang S絥. Tuy猼 trg phau phau nh� kho醕 chi猚 醥 trg tinh, d呔i 醤h m tr秈 chi猽 r鱥, trg s醤g long lanh. #r#rC鋘h 皓p nh� v m� 疸 l鈛 m� sao kh鬾g c� ai d醡 t緄 th叻ng th裞...");
	for i, eventId in x025002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x025002_OnDefaultEvent( sceneId, selfId,targetId )
	x025002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x025002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x025002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x025002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x025002_g_eventList do
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
function x025002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x025002_g_eventList do
		if missionScriptId == findId then
			x025002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x025002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x025002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x025002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x025002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x025002_OnDie( sceneId, selfId, killerId )
end
