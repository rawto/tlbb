-- 大理
--城门
--问路脚本
x500045_g_scriptId = 500045

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500045_g_Signpost = {
	{ type=2, name="Nam M鬾", x=293, y=456, tip="Nh� H鋓", desc="Nam M鬾 n痠 li玭 Nh� H鋓, n猽 ch遖 t緄 c 25, 鹱ng n阯 餴 t緄 痼", eventId=-1 },
	{ type=2, name="恤ng M鬾", x=65, y=245, tip="V� L唼ng S絥", desc="恤ng M鬾 n痠 li玭 V� L唼ng S絥, ng叨i ch絠 d呔i c 10 c� th� t緄 疴y", eventId=-1 },
	{ type=2, name="T鈟 M鬾", x=31, y=151, tip="Ki猰 C醕", desc="T鈟 M鬾 n痠 li玭 Ki猰 C醕, ng叨i ch絠 d呔i c 10 c� th� t緄 疴y", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500045_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500045_g_Signpost do
		AddNumText(sceneId, x500045_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500045_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500045_g_Signpost[GetNumText()]

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
