-- 苏州NPC
-- 岳常圆
-- 中秋任务

x050001_g_scriptId = 050001

--所拥有的事件ID列表
x050001_g_eventList = { 050017, 808064, 050020 } --050009,

x050001_g_ControlScript = 050009

--**********************************
--事件列表
--**********************************
function x050001_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		if CallScriptFunction( x050001_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
			AddText( sceneId, "嘘m r trung thu, hoa 皓p tr錸g tr騨, x髆 ng� b靚h th叨ng b鄖 the g" ..
				"L cao m n絠 di璶 t nh誧 qu鋘 huy玭. Nh遪g ch韓h trong gi鈟 ph鷗 n鄖, t呔ng s� c黙 ta 餫ng c� gg chi猲 黏u v緄 gi � bi阯 gi緄" ..
				", m緄 c� th� gi緄 r馽 r� c黙 ch鷑g ta" )
		else
			AddText( sceneId, "T� h鱟 s� c� c鈛 vi猼 r hay, ng叨i c� l鷆 bi hoan ly h䅟.#r" ..
				"Tr錸g c� l鷆 tr騨 l鷆 khuy猼, vi甤 c鹡g c� l鷆 kh� ki畁 to鄋. Tuy 痍m nay tr錸g kh鬾g tr騨, nh遪g " ..
				"trong l騨g ta, tr錸g v� ng叨i c鹡g gi痭g nhau, lu鬾 餺鄋 vi阯" )
		end

		local i, eventId
		for i, eventId in x050001_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
		--AddNumText(sceneId, x050001_g_scriptId, "中秋活动介绍", 11, 1010);
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件交互入口
--**********************************
function x050001_OnDefaultEvent( sceneId, selfId, targetId )
	x050001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x050001_OnEventRequest( sceneId, selfId, targetId, eventId )
	local Num = GetNumText();
	if(Num == 1010) then
		BeginEvent(sceneId);
			AddNumText(sceneId, 808064, "#{ZQHD_20070916_010}", 11, 705 )
			AddNumText(sceneId, 050017, "#{ZQHD_20070916_011}", 11, 10);
			AddNumText(sceneId, 050020, "#{ZQHD_20070916_012}", 11, 102);
		EndEvent(sceneId);
		DispatchEventList(sceneId,selfId,targetId)
	end
	local i, findId
	for i, findId in x050001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x050001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x050001_g_eventList do
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
function x050001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	local i, findId
	for i, findId in x050001_g_eventList do
		if missionScriptId == findId then
			x050001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end
