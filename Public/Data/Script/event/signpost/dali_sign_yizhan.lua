-- 大理
--驿站
--问路脚本
x500043_g_scriptId = 500043

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500043_g_Signpost = {
	{ type=2, name="D竎h tr誱", x=282, y=270, tip="Th鬷 Ph鵱g C豼 ", desc="羞秐g xa v課 d, n醫 v課 cu痭 th�, mu痭 th錷 th� c醕 n絠 kh醕, D竎h tr誱 l� n絠 thu ti畁 nh. L鉶 Th鬷 � D竎h tr誱 � t読 h呔ng B 疬秐g l緉 ph韆 恤ng. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500043_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500043_g_Signpost do
		AddNumText(sceneId, x500043_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500043_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500043_g_Signpost[GetNumText()]

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
