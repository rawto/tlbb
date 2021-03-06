-- 洛阳NPC		酒店老板
-- 江鲤
-- 普通

-- 脚本号
x000102_g_scriptId = 000102
-- 商店号
x000102_g_ShopTabId = 15 
--所拥有的事件ID列表
x000102_g_eventList = { }

x000102_g_ControlScript = 050009
x000102_g_ExchangeList = { id = 40004303, name = "B祎 m� lo読 ngon", cost = 20 }

--**********************************
--事件列表
--**********************************
function x000102_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "Th� bay tr阯 tr秈, ch誽 d呔i 黏t, b絠 trong n呔c, mu痭 錸 th� n鄌 � Danh Tr鈔 l鈛 n鄖 皤u c� c�" )
		AddNumText(sceneId,x000102_g_scriptId,"Mua th馽 ph",7,1111)
		if CallScriptFunction( x000102_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
			--AddNumText( sceneId, x000102_g_scriptId, "换取食材", 6, 1 )
			--AddNumText( sceneId, x000102_g_scriptId, "食材有什么用", 11, 2 )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件交互入口
--**********************************
function x000102_OnDefaultEvent( sceneId, selfId, targetId )
	x000102_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000102_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1111 then
		DispatchShopItem( sceneId, selfId, targetId, x000102_g_ShopTabId);
	end
	local i, findId
	for i, findId in x000102_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

	if CallScriptFunction( x000102_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
		if GetNumText() == 1 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x000102_g_ExchangeList.cost then
				x000102_NotifyFailBox( sceneId, selfId, targetId, "C ph鋓 鸨i 1 ph" .. x000102_g_ExchangeList.name ..
				", c t韈h 餴琺 " .. x000102_g_ExchangeList.cost .. " 衖琺, hi畁 gi� ng呓i ch� c� " .. score .. " 衖琺, h靚h nh� kh鬾g 瘘" )
				return
			end

			BeginEvent( sceneId )
				AddText( sceneId, "衖琺 t韈h l鹹 trung thu c黙 ng呓i hi畁 " .. score .. " 衖琺, 鸨i l m祎 ph " ..
					x000102_g_ExchangeList.name .. ", c t韈h 餴琺 " .. x000102_g_ExchangeList.cost .. " 衖琺, ng呓i x醕 鸶nh 鸨i kh鬾g?" )

				AddNumText( sceneId, x000102_g_scriptId, "确定要换", -1, 3 )
				AddNumText( sceneId, x000102_g_scriptId, "我只是路过", -1, 4 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		elseif GetNumText() == 2 then
			x000102_NotifyFailBox( sceneId, selfId, targetId, "    Kh呓ng L� � L誧 D呓ng [127," ..
				"154], Bao Th� Vinh � T� Ch鈛 [190,168], 胁 T� 孝ng � 姓i L� [109,170] 瓞 鸨i" ..
				"Sau khi 疸 c� 3 lo読 nguy阯 li畊 鸢 錸 kh醕 nhau, h銀 t靘 Nh誧 Th叨ng Vi阯 � T� Ch鈛 [193,148] 疬a t緄 T鈟 H� 鸨i l B醤h Trung thu" ..
				"V ph 穑c bi畉" )
			return
		elseif GetNumText() == 3 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x000102_g_ExchangeList.cost then
				return
			end

			if LuaFnTryRecieveItem( sceneId, selfId, x000102_g_ExchangeList.id, QUALITY_MUST_BE_CHANGE ) < 0 then
				x000102_NotifyFailBox( sceneId, selfId, targetId, "Kh鬾g gian trong tay n鋓 疸 馥y" )
			end

			score = score - x000102_g_ExchangeList.cost
			SetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE, score )
			x000102_NotifyFailBox( sceneId, selfId, targetId, "衖琺 t韈h l鹹 d� th譨: " .. score .. "." )
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
--接受此NPC的任务
--**********************************
function x000102_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x000102_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x000102_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	local i, findId
	for i, findId in x000102_g_eventList do
		if missionScriptId == findId then
			x000102_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000102_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x000102_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000102_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000102_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000102_OnDie( sceneId, selfId, killerId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x000102_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
