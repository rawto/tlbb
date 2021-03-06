-- 苏州NPC
-- 包世荣
-- 一般

-- 脚本号
x001037_g_scriptId = 001037

x001037_g_shoptableindex = 25

x001037_g_ControlScript = 050009
x001037_g_ExchangeList = { id = 40004304, name = "H呓ng li畊 lo読 ngon", cost = 30 }
x001037_g_yiexihuFlag = 1;

--**********************************
--事件交互入口
--**********************************
function x001037_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{BSR_80919_1}" )
		AddNumText( sceneId, x001037_g_scriptId, "Ng呓i mu痭 mua g� n鄌?", 7, 0 )
		--if x001037_g_yiexihuFlag == 1 then
		--	AddNumText( sceneId, x001037_g_scriptId, "去夜西湖", 6, 3 )
			AddNumText( sceneId, x001037_g_scriptId, "Gi緄 thi畊 b 餺m 痼m", 11, 14 )
			AddNumText( sceneId, x001037_g_scriptId, "Gi緄 thi畊 ho誸 鸬ng Tuy猼 c, L鴆 效u Thang, n呔c D遖 H", 11, 15 )
		--end

		if CallScriptFunction( x001037_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
			--AddNumText( sceneId, x001037_g_scriptId, "换取食材", 6, 1 )
			--AddNumText( sceneId, x001037_g_scriptId, "食材有什么用", 11, 2 )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001037_OnEventRequest( sceneId, selfId, targetId, eventId )
	if eventId == x001037_g_scriptId then
		local selectItem = GetNumText();
		if selectItem == 0 then
			DispatchShopItem( sceneId, selfId, targetId, x001037_g_shoptableindex )
		end
		
		if x001037_g_yiexihuFlag == 1 then
			if selectItem == 3 then
				--CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 121, 40, 52);
			elseif selectItem == 14 then
				BeginEvent(sceneId)
					AddText( sceneId, "#{function_help_091}" )
				EndEvent(sceneId)
				DispatchEventList( sceneId, selfId, targetId )
			elseif selectItem == 15 then
				BeginEvent(sceneId)
					AddText( sceneId, "#{function_help_092}" )
				EndEvent(sceneId)
				DispatchEventList( sceneId, selfId, targetId )
			end
		end
	end

	if CallScriptFunction( x001037_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
		if GetNumText() == 1 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x001037_g_ExchangeList.cost then
				x001037_NotifyFailBox( sceneId, selfId, targetId, "C ph鋓 鸨i 1 ph " .. x001037_g_ExchangeList.name ..
				", c t韈h 餴琺 " .. x001037_g_ExchangeList.cost .. " 衖琺, hi畁 gi� ng呓i ch� c� " .. score .. " 衖琺, h靚h nh� kh鬾g 瘘." )
				return
			end

			BeginEvent( sceneId )
				AddText( sceneId, "衖琺 t韈h l鹹 trung thu c黙 ng呓i hi畁 " .. score .. " 衖琺, 鸨i l m祎 ph" ..
					x001037_g_ExchangeList.name .. ", c t韈h 餴琺 " .. x001037_g_ExchangeList.cost .. " 衖琺, ng呓i x醕 鸶nh 鸨i kh鬾g?" )

				AddNumText( sceneId, x001037_g_scriptId, "X醕 鸶nh mu痭 鸨i", -1, 3 )
				AddNumText( sceneId, x001037_g_scriptId, "Ta ch� 餴 qua", -1, 4 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		elseif GetNumText() == 2 then
			x001037_NotifyFailBox( sceneId, selfId, targetId, "Kh呓ng L� � L誧 D呓ng [127," ..
				"154], Bao Th� Vinh � T� Ch鈛 [190,168], 胁 T� 孝ng � 姓i L� [109,170] 瓞 鸨i" ..
				"Sau khi 疸 c� 3 lo読 nguy阯 li畊 鸢 錸 kh醕 nhau, h銀 t靘 Nh誧 Th叨ng Vi阯 � T� Ch鈛 [193,148] 疬a t緄 T鈟 H� 鸨i l B醤h Trung thu" ..
				"V ph 穑c bi畉" )
			return
		elseif GetNumText() == 3 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x001037_g_ExchangeList.cost then
				return
			end

			if LuaFnTryRecieveItem( sceneId, selfId, x001037_g_ExchangeList.id, QUALITY_MUST_BE_CHANGE ) < 0 then
				x001037_NotifyFailBox( sceneId, selfId, targetId, "Kh鬾g gian trong tay n鋓 疸 馥y" )
			end

			score = score - x001037_g_ExchangeList.cost
			SetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE, score )
			x001037_NotifyFailBox( sceneId, selfId, targetId, "衖琺 t韈h l鹹 d� th譨: " .. score .. "." )
			return
		elseif GetNumText() == 4 then
			BeginUICommand( sceneId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
		end
		return
	end
end

--**********************************
--对话窗口信息提示
--**********************************
function x001037_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
