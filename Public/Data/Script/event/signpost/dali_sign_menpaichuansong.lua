-- 大理
--门派传送人
--问路脚本
x500041_g_scriptId = 500041

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500041_g_Signpost = {
	{ type=2, name="Thi猽 L鈓", x=276, y=229, tip="Tu� D竎h ", desc="T錸g nh鈔 Tu� D竎h [276,229], ng叨i d鏽 疬秐g ph醝 Thi猽 L鈓, � g骳 恤ng B Ng� Hoa 朽n trung t鈓 姓i L�,  ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Thi阯 Long", x=288, y=228, tip="Ph� Tham ", desc="T錸g nh鈔 Ph� Tham [288,228], ng叨i d鏽 疬秐g ph醝 Thi阯 Long, � g骳 恤ng B Ng� Hoa 朽n trung t鈓 姓i L�,  ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Ti陁 Dao", x=288, y=225, tip="朽m T� V� ", desc="朽m T� V� [288,225], ng叨i d鏽 疬秐g ph醝 Ti陁 Dao, � g骳 恤ng B Ng� Hoa 朽n trung t鈓 姓i L�,  ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Nga My", x=276, y=235, tip="L� Tam N呓ng ", desc="C� c� L� Tam N呓ng [276,235], ng叨i d鏽 疬秐g ph醝 Nga My, � g骳 恤ng B Ng� Hoa 朽n trung t鈓 姓i L�,  ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Thi阯 S絥", x=288, y=235, tip="Tr靚h Thanh S呓ng ", desc="Tr靚h Thanh S呓ng [288,235], ng叨i d鏽 疬秐g ph醝 Thi阯 S絥, � g骳 T鈟 B Ng� Hoa 朽n trung t鈓 姓i L�, c醕h Nhi猵 Ch韓h-ng叨i gi緄 thi畊 b醝 s� kh鬾g xa. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Tinh T鷆", x=288, y=232, tip="H鋓 Phong T� ", desc="挟 t� H鋓 Phong T� [288,232], ng叨i d鏽 疬秐g ph醝 Tinh T鷆, � g骳 T鈟 B Ng� Hoa 朽n trung t鈓 姓i L�, c醕h Nhi猵 Ch韓h-ng叨i gi緄 thi畊 b醝 s� kh鬾g xa. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Minh Gi醥", x=288, y=238, tip="Th誧h B鋙 ", desc="S� Th誧h B鋙 [288,238], ng叨i d鏽 疬秐g ph醝 Minh Gi醥, � g骳 T鈟 B Ng� Hoa 朽n trung t鈓 姓i L�, c醕h Nhi猵 Ch韓h-ng叨i gi緄 thi畊 b醝 s� kh鬾g xa. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="V� 衋ng", x=276, y=225, tip="Tr呓ng Ho誧h ", desc="Tr呓ng Ho誧h 鹫o tr叻ng [276,225], ng叨i d鏽 疬秐g ph醝 V� 衋ng, � g骳 T鈟 B Ng� Hoa 朽n trung t鈓 姓i L�, c醕h Nhi猵 Ch韓h-ng叨i gi緄 thi畊 b醝 s� kh鬾g xa. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="C醝 Bang", x=276, y=232, tip="Gi鋘 Ninh ", desc="Tr叻ng l鉶 Gi鋘 Ninh [276,232], ng叨i d鏽 疬秐g ph醝 C醝 Bang, � g骳 T鈟 B Ng� Hoa 朽n trung t鈓 姓i L�, c醕h Nhi猵 Ch韓h-ng叨i gi緄 thi畊 b醝 s� kh鬾g xa. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500041_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500041_g_Signpost do
		AddNumText(sceneId, x500041_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500041_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500041_g_Signpost[GetNumText()]

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
