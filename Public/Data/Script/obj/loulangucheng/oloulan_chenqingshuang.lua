--楼兰NPC....
--缥缈峰接引使....

--脚本号
x001159_g_ScriptId = 001159


--所拥有的事件ID列表
x001159_g_eventList={402276,402263,402289,402305}

--**********************************
--事件列表
--**********************************
function x001159_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#GPhi陁 Di陁 Phong#W l� n絠 v� c鵱g nguy hi琺 nh遪g n猽 nh� v� anh h鵱g n鄌 痼 疳nh b読 #GL� Thu Th鼀#W, s� nh 疬㧟 r nhi玼 v ph cao c 痼. C� l阯...")
		for i, eventId in x001159_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001159_OnDefaultEvent( sceneId, selfId,targetId )
	x001159_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001159_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001159_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001159_g_ScriptId )
		return
		end
	end
end
