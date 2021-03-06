-- 大理
--擂台
--问路脚本
x500048_g_scriptId = 500048

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500048_g_Signpost = {
	{ type=2, name="V� Qu醤 Qu醤 Ch�", x=174, y=348, tip="Ph呓ng Tri畊 D呓ng", desc="L鬷 朽i l� n絠 h鱟 h鰅 v� ngh�, c醕 h� c� th� t靘 ch� qu鋘 Ph呓ng Tri畊 D呓ng mu痭 t靘 hi瑄 g 鬾g tr阯 Th唼ng V� 疣i. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500048_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500048_g_Signpost do
		AddNumText(sceneId, x500048_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500048_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500048_g_Signpost[GetNumText()]

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
