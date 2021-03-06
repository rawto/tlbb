-- 大理
--钱庄
--问路脚本
x500044_g_scriptId = 500044

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500044_g_Signpost = {
	{ type=2, name="Ti玭 trang", x=333, y=277, tip="V呓ng D頽h", desc="詎g ch� V呓ng c黙 Ti玭 Trang � h呔ng Nam 疬秐g l緉 ph韆 恤ng c醕h Ng� Hoa 朽n kh鬾g xa,  ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳. N� b礳 � Ti玭 Trang c� th� gi鷓 c醕 h� c gi� v ph鏼 v� ng鈔 l唼ng", eventId=-1 },
	{ type=2, name="Ti甿 c 鸢", x=180, y=284, tip="H鄋 V頽h An", desc="詎g ch� H鄋 V頽h An c黙 ti甿 c 鸢 � h呔ng Nam 疬秐g l緉 ph韆 T鈟. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500044_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500044_g_Signpost do
		AddNumText(sceneId, x500044_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500044_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500044_g_Signpost[GetNumText()]

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
