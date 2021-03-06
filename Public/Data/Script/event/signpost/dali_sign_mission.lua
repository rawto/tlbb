-- 大理
--循环任务发布人
--问路脚本
x500047_g_scriptId = 500047

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500047_g_Signpost = {
	{ type=2, name="姓i L� T鄌 v S�", x=119, y=293, tip="姓i L� T鄌 v S�", desc="姓i L� T鄌 v s� V呓ng Nh唼c V� � 疬秐g l緉 ph韆 T鈟, 餴 v� h呔ng T鈟 s� nh靚 th. 刵 ph韒 TAB m� b鋘 鸢, ch韓h l� ch� vi猼 ch� \"T鄌\"", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500047_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500047_g_Signpost do
		AddNumText(sceneId, x500047_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500047_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500047_g_Signpost[GetNumText()]

	if signpost.type == 1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. ": ")
			CallScriptFunction( signpost.eventId, "OnEnumerate", sceneId, selfId, targetId )
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	elseif signpost.type == 2 then
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, signpost.x, signpost.y, signpost.tip )

		BeginEvent(sceneId)
			AddText(sceneId, signpost.desc)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	end

end
