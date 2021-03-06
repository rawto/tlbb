--杜子腾

--脚本号
x002028_g_scriptId = 002028

x002028_g_shoptableindex=5

--所拥有的事件ID列表
x002028_g_eventList = { 210201, 210202, 210203 }

x002028_g_ControlScript = 050009
x002028_g_ExchangeList = { id = 40004305, name = "Th唼ng h鋙 gi� 疬秐g", cost = 55 }

--**********************************
--事件列表
--**********************************
function x002028_UpdateEventList( sceneId, selfId, targetId )
    local PlayerName = GetName( sceneId, selfId )
	local PlayerSex = GetSex( sceneId, selfId )

	if PlayerSex == 0 then
		PlayerSex = "C� n呓ng"
	else
		PlayerSex = "Thi猽 hi畃"
	end

	BeginEvent( sceneId )
		AddText( sceneId, "  " .. PlayerName .. PlayerSex .. ", ng呓i c� ngh� � 姓i L� ch鷑g ta n眎 danh 錸 v? Su痶 ng鄖 B醫 O鋘 l読 B醫 O鋘, 餴 c鹡g ch苙g mu痭 r秈 餴!")
		AddNumText( sceneId, x002028_g_scriptId, "Mua Th馽 Ph", 7, 0 )

		for i, eventId in x002028_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end

		if CallScriptFunction( x002028_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
			--AddNumText( sceneId, x002028_g_scriptId, "换取食材", 6, 1 )
			--AddNumText( sceneId, x002028_g_scriptId, "食材有什么用", 11, 2 )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件交互入口
--**********************************
function x002028_OnDefaultEvent( sceneId, selfId, targetId )
	x002028_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002028_OnEventRequest( sceneId, selfId, targetId, eventId )
	local i, findId

	for i, findId in x002028_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x002028_g_shoptableindex )
	end

	if CallScriptFunction( x002028_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
		if GetNumText() == 1 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x002028_g_ExchangeList.cost then
				x002028_NotifyFailBox( sceneId, selfId, targetId, "Ho醤 鸨i m祎 ph" .. x002028_g_ExchangeList.name ..
				", c " .. x002028_g_ExchangeList.cost .. " 餴琺, ng呓i hi畁 t読 ch� c� " .. score .. " 餴琺, e rg kh鬾g 瘘!" )
				return
			end

			BeginEvent( sceneId )
				AddText( sceneId, "Ng呓i tr呔c m c�" .. score .. " 餴琺, 瓞 鸨i l m祎 ph " ..
					x002028_g_ExchangeList.name .. ", c " .. x002028_g_ExchangeList.cost .. " 餴琺, ng呓i x醕 鸶nh 鸨i?" )

				AddNumText( sceneId, x002028_g_scriptId, "X醕 鸶nh", -1, 3 )
				AddNumText( sceneId, x002028_g_scriptId, "Ta ch� 餴 ngang qua", -1, 4 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		elseif GetNumText() == 2 then
			x002028_NotifyFailBox( sceneId, selfId, targetId, "T読 L誧 D呓ng Kh呓ng L� [127," ..
				"154], t読 T� Ch鈛 Bao Th� Vinh [190,168], t読 姓i L� 胁 T� 孝ng [109,170] ho醤 鸨i" ..
				" ba lo読 nguy阯 li畊 穑c bi畉, t靘 T� Ch鈛 Nh誧 Th叨ng Vi阯 [193,148] 皙n T鈟 H� 鸨i Trung Thu" ..
				" 穑c th� v ph." )
			return
		elseif GetNumText() == 3 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x002028_g_ExchangeList.cost then
				return
			end

			if LuaFnTryRecieveItem( sceneId, selfId, x002028_g_ExchangeList.id, QUALITY_MUST_BE_CHANGE ) < 0 then
				x002028_NotifyFailBox( sceneId, selfId, targetId, "T鷌 kh鬾g 瘘 � ch補 v ph" )
			end

			score = score - x002028_g_ExchangeList.cost
			SetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE, score )
			x002028_NotifyFailBox( sceneId, selfId, targetId, "C騨 th譨 " .. score .. " 餴琺." )
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
function x002028_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x002028_g_eventList do
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
function x002028_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	local i, findId
	for i, findId in x002028_g_eventList do
		if missionScriptId == findId then
			x002028_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002028_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x002028_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002028_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	local i, findId
	for i, findId in x002028_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002028_OnDie( sceneId, selfId, killerId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x002028_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
