--苏州NPC
--呼延豹
--普通

--脚本号
x001061_g_ScriptId	= 001061

--所拥有的事件ID列表
x001061_g_EventList	= { 232000, 232001, 500618 }

--缺省对话
x001061_g_dlg	= "姓i s� kh鬾g may r癷, ph誱 nh鈔 trong thu� tr読 ch鷑g ta b誳 鸬ng, ph l緉 binh l韓h l読 皤u r秈 h� 餴 luy畁 t, khi猲 ng叨i trong thu� tr読 kh鬾g 瘘. Ta ph鋓 c c製 Tri ph� T� Ch鈛. Sao? C醕 h� t靚h nguy畁 gi鷓 ch鷑g ta t緄 thu� tr読 b靚h 鸶nh ph誱 nh鈔 ph鋘 lo課?"

--**********************************
--事件列表
--**********************************
function x001061_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, x001061_g_dlg )

		for i, findId in x001061_g_EventList do
			if findId == 232000 or findId == 500618 then
				CallScriptFunction( findId, "OnEnumerate", sceneId, selfId, targetId )
			end
		end

		AddNumText( sceneId, x001061_g_ScriptId, "Gi緄 thi畊 nhi甿 v� th鼀 tr読", 11, 10 )

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--事件交互入口
--**********************************
function x001061_OnDefaultEvent( sceneId, selfId, targetId )

	x001061_UpdateEventList( sceneId, selfId, targetId )

end

--**********************************
--事件列表选中一项
--**********************************
function x001061_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_074}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end

	local i				= 1
	local findId	= 0
	for i, findId in x001061_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--接受此NPC的任务
--**********************************
function x001061_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	local i				= 1
	local findId	= 0
	for i, findId in x001061_g_EventList do
		if missionScriptId == findId then
			local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
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
function x001061_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

	local i				= 1
	local findId	= 0
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001061_g_EventList do
		if missionScriptId == findId then
			x001061_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--继续（已经接了任务）
--**********************************
function x001061_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	local i				= 1
	local findId	= 0
	for i, findId in x001061_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--提交已做完的任务
--**********************************
function x001061_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	local i				= 1
	local findId	= 0
	for i, findId in x001061_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end

end

--**********************************
--死亡事件
--**********************************
function x001061_OnDie( sceneId, selfId, killerId )
end
