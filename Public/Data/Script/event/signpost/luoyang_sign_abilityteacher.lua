-- L誧 D呓ng
--生活技能导师
--问路脚本
x500005_g_scriptId = 500005

-- 问路类型 type: 1 为二c菜单, 2 为直接问路
x500005_g_Signpost = {
	{ type=2, name="姓i s� tr皀g tr鱰", x=314, y=401, tip="L遳 Di甤 N鬾g", desc="衖 ra kh鰅 L誧 D呓ng, Nam M鬾, qua c ph韆 tr呔c, 餴 v� h呔ng 恤ng, t靘 鹫i s� tr皀g tr鱰 L遳 Di甤 N鬾g � th豠 ru祅g (314,401). 刵 ph韒 TAB 瓞 xem tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� khai th醕 m�", x=310, y=228, tip="Ti猼 邪ng Chuy", desc="姓i s� khai kho醤g Ti猼 邪ng Chuy (310,228) trong ti甿 v� kh� � 恤ng Th�. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� h醝 thu痗", x=216, y=308, tip="Nghi阭 B醕h Th鋙", desc="姓i s� h醝 thu痗 Nghi阭 B醕h Th鋙 (216,308) � 疬秐g l緉 ph韆 恤ng T鈟 Th�,  ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Ng� phu", x=306, y=324, tip="Kh呓ng Ng�", desc="Ng� phu Kh呓ng Ng� (306,324) � Nam M鬾 恤ng Th�,  ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� c鬾g ngh�", x=157, y=286, tip="Long Tam Thi猽 ", desc="姓i s� c鬾g ngh� Long Tam Thi猽 � (157,286) � 疬秐g l緉 ph韆 T鈟. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� may v�", x=290, y=309, tip="Ph� M鏽 Chi", desc="姓i s� may v� Ph� M鏽 Chi (290,309) � 恤ng Th�. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� luy畁 kim", x=309, y=302, tip="V呓ng 醒c Ph�", desc="喧c ki猰 鹫i s� V呓ng 醒c Ph� (309,302) � trong ti甿 binh kh� � 恤ng Th�. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� n 錸", x=236, y=292, tip="L� 姓i Ch鼀", desc="姓i s� n n呔ng L� 姓i Ch鼀 (236,292) � trong t豼 餴猰 ch� giao nhau gi鎍 T鈟 Th� v� 疬秐g l緉 ph韆 T鈟. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� ch� du㧟", x=232, y=308, tip="Tr呓ng Minh C鋘h", desc="姓i s� ch� d唼c Tr呓ng Minh C鋘h (232,308) � ti甿 thu痗 gi鎍 T鈟 Th� v� 疬秐g l緉 ph韆 Nam. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� d咿ng sinh ph醦", x=234, y=297, tip="S Vi", desc="姓i s� d咿ng sinh ph醦 S Vi (234,297) � ti甿 thu痗 ch� giao nhau gi鎍 T鈟 Th� v� 疬秐g l緉 ph韆 T鈟. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� d唼c l� h鱟", x=229, y=302, tip="B誧h D頽h Minh", desc="姓i s� d唼c l� h鱟 B誧h D頽h Minh (229,302) � ti甿 thu痗 gi鎍 T鈟 Th� v� 疬秐g l緉 ph韆 Nam. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	--{ type=2, name="重购配方", x=141, y=133, tip="小高", desc="#G重购配方: #W因某种不可控原因造成玩家已学会to� 鸬 #G加工材料类配方、馒头配方、初/中/高c食材类配方、咫尺天涯配方#W丢失,可以到#GT� Ch鈛#Wto� 鸬 #G小高(96,127)#W购买重#G购配方#W,其出售价格#G统m祎 为1银#W.", eventId=-1 },
	--{ type=2, name="材料加工介绍", x=153, y=171, tip="冯铸铁", desc="#{CLJG_20071204}", eventId=-1 },	
}

--**********************************
--列举事件
--**********************************
function x500005_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500005_g_Signpost do
		AddNumText(sceneId, x500005_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500005_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500005_g_Signpost[GetNumText()]

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
