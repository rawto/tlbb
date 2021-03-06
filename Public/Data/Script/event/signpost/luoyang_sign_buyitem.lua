-- L誧 D呓ng
--购买物品
--问路脚本
x500001_g_scriptId = 500001

-- 问路类型 type: 1 为二c菜单, 2 为直接问路
x500001_g_Signpost = {
	{ type=2, name="Ti甿 binh kh�", x=308, y=294, tip="V呓ng 醒c Qu� ", desc="詎g ch� ti甿 binh kh� V呓ng 醒c Qu� (308,294) trong ti甿 v� kh� � 恤ng Th�. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="T誴 h骯 th呓ng nh鈔", x=348, y=285, tip="Nhu� Ph鷆 T叨ng ", desc="Th呓ng nh鈔 t誴 h骯 Nhu� Ph鷆 T叨ng (348,285) � 恤ng M鬾 N礽. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Ph鴆 s裞 餴猰", x=277, y=322, tip="Ch鈔 Duy T� ", desc="Tr叻ng qu ph鴆 s裞 餴猰 Ch鈔 Duy T� (277,322) � 疬秐g l緉 ph韆 Nam. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Ti甿 trang s裞", x=282, y=314, tip="C� T醕 Tr鈔 ", desc="Trang s裞 餴猰 ch叻ng qu C� T醕 Tr鈔 (282,314) � ph鴆 s裞 餴猰 疬秐g l緉 ph韆 Nam. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Ti甿 thu痗", x=229, y=302, tip="B誧h D頽h Minh ", desc="姓i 疬絥g gia c黙 T� Sinh 羞秐g B誧h D頽h Minh (229,302) � ti甿 thu痗 疬秐g l緉 ph韆 Nam. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="T豼 餴猰", x=243, y=282, tip="Ph誱 Th痭g ", desc="T豼 餴猰 ch叻ng qu Ph誱 Th痭g (243,282) � h呔ng Nam 疬秐g l緉 ph韆 T鈟. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Chu b鋙 th呓ng nh鈔", x=159, y=288, tip="L呓ng Ph� Nh鈔 ", desc="Chu b鋙 th呓ng nh鈔 L呓ng Ph� Nh鈔 (159,288) � 疬秐g l緉 ph韆 T鈟. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500001_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500001_g_Signpost do
		AddNumText(sceneId, x500001_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500001_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500001_g_Signpost[GetNumText()]

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
