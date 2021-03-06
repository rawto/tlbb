-- 大理
--生活技能大师
--问路脚本
x500046_g_scriptId = 500046

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500046_g_Signpost = {
	{ type=2, name="姓i s� tr皀g tr鱰", x=431, y=289, tip="C鬾g T鬾 姓i Th鷆", desc="Mu痭 h鱟 l鄊 ru祅g xin t緄 ru祅g c黙 C鬾g T鬾 姓i Th鷆 g 恤ng M鬾 N礽, 鬾g ta � 痼. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� khai th醕 m�", x=214, y=117, tip="斜ng Hoa Thi猼", desc="Mu痭 h鱟 khai kho醤g xin t靘 斜ng Hoa Thi猼, 鬾g � ph韆 sau ti甿 binh kh�,  TAB ch韓h l� ch� vi猼 ch� \"Thi猼\" tr阯 b鋘 鸢", eventId=-1 },
	{ type=2, name="姓i s� h醝 thu痗", x=219, y=224, tip="L遳 K� N�", desc="姓i s� l鄊 thu痗 L遳 K� N� � ti甿 d唼c n tr阯 疬秐g l緉 ph韆 T鈟. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Ng� phu", x=225, y=251, tip="M鴆 T� L錸g", desc="Ng� phu M鴆 T� L錸g � h呔ng Nam 疬秐g l緉 ph韆 T鈟, c課h t豼 餴猰. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� c鬾g ngh�", x=343, y=284, tip="L� Minh Nguy畉", desc="姓i s� c鬾g ngh� L� Minh Nguy畉 � ph韆 sau Th呓ng Ph� . 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� may v�", x=381, y=294, tip="Ho鄋g L錸g Ba", desc="姓i s� may v� Ho鄋g L錸g Ba � h呔ng Nam 疬秐g l緉 ph韆 恤ng. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� luy畁 kim", x=351, y=186, tip="Qu� Tam Ch鵼", desc="姓i s� l� r鑞 Qu� Tam Ch鵼 � ph韆 sau ti甿 binh kh�. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� n 錸", x=235, y=251, tip="胁 T� Phi", desc="姓i s� n n呔ng 胁 T� Phi � h呔ng Nam 疬秐g l緉 ph韆 T鈟. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� ch� du㧟", x=219, y=218, tip="Ph� 羞絥g Quy", desc="姓i s� ch� d唼c Ph� 羞絥g Quy � h呔ng B 疬秐g l緉 ph韆 T鈟. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	--{ type=2, name="重购配方", x=141, y=133, tip="小高", desc="#G重购配方：#W因某种不可控原因造成玩家已学会的#G加工材料类配方、馒头配方、初/中/高级食材类配方、咫尺天涯配方#W丢失，可以到#G苏州#W的#G小高（96，127）#W购买重#G购配方#W，其出售价格#G统一为1银#W。", eventId=-1 },
	--{ type=2, name="材料加工介绍", x=-1, y=-1, tip="", desc="#{CLJG_20071204}", eventId=-1 },	
}

--**********************************
--列举事件
--**********************************
function x500046_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500046_g_Signpost do
		AddNumText(sceneId, x500046_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500046_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500046_g_Signpost[GetNumText()]

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
