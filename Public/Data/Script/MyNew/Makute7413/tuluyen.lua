--GetMissionData(sceneId, selfId, XIULIAN_GONGLI)--
--SetMissionData(sceneId, selfId, XIULIAN_GONGLI, X)--
--LuaFnWashSomePoints(sceneId, selfId, nType, nPoint)--
--0: Cuong Luc, 1: Noi Luc, 2: The Luc, 3: Tri Luc, 4: Than Phap--
x002193_g_scriptId = 002193

--**********************************
--事件交互入口
--**********************************


function x002193_OnDefaultEvent( sceneId, selfId, targetId)	
	BeginEvent(sceneId)
		AddText(sceneId, "Ta l� ng叨i chuy阯 tr醕h vi甤 tu luy畁 � 疴y, c醕 h� c g� h銀 n骾 cho ta bi猼?")
		AddText(sceneId, "鞋 b 馥u tu luy畁 c b� sung 韙 nh m祎 餴琺 ti玬 n錸g v鄌 thu礳 t韓h m� c醕 h� mu痭 tu luy畁.")
		--AddNumText(sceneId, x002193_g_scriptId, "TEST szAuthor", 6, 0)
		--AddNumText(sceneId, x002193_g_scriptId, "TEST Th 酗nh", 6, 4)
		AddNumText(sceneId, x002193_g_scriptId, "Xem t靚h tr課g tu luy畁", 6, 1)
		AddNumText(sceneId, x002193_g_scriptId, "Ti猲 h鄋h tu luy畁", 6, 7)
		AddNumText(sceneId, x002193_g_scriptId, "Ta s� quay l読 sau.", 8, 3)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x002193_OnEventRequest( sceneId, selfId, targetId, eventId )
	local key = GetNumText()

	if key == 0 then
		LuaFnSetItemCreator(sceneId,selfId,0,"000000002A7DBA7D907E01005C005E0056004E004D00610477000000")
	end
	
	if key == 4 then
		SetMissionData(sceneId, selfId, XIULIAN_GONGLI, 0)
		SetMissionData(sceneId, selfId, XIULIAN_LILIANG, 0)
		SetMissionData(sceneId, selfId, XIULIAN_LINGQI, 0)
		SetMissionData(sceneId, selfId, XIULIAN_TILI, 0)
		SetMissionData(sceneId, selfId, XIULIAN_DINGLI, 0)
		SetMissionData(sceneId, selfId, XIULIAN_SHENFA, 0)
		x002193_ReturnAttr(sceneId, selfId)
	end
	
	if key == 1 then
		x002193_XiulianOpen(sceneId, selfId)
	end
	
	if key == 3 then
		x002193_CloseMe(sceneId, selfId)
	end
	
	if key == 7 then
		local gongli = GetMissionData(sceneId, selfId, XIULIAN_GONGLI)
		local CuongLuc = GetMissionData(sceneId, selfId, XIULIAN_LILIANG)
		local NoiLuc = GetMissionData(sceneId, selfId, XIULIAN_LINGQI)
		local TheLuc = GetMissionData(sceneId, selfId, XIULIAN_TILI)
		local TriLuc = GetMissionData(sceneId, selfId, XIULIAN_DINGLI)
		local ThanPhap = GetMissionData(sceneId, selfId, XIULIAN_SHENFA)
		BeginUICommand( sceneId )
			UICommand_AddInt(sceneId, gongli)
			UICommand_AddInt(sceneId, CuongLuc)
			UICommand_AddInt(sceneId, NoiLuc)
			UICommand_AddInt(sceneId, TheLuc)
			UICommand_AddInt(sceneId, TriLuc)
			UICommand_AddInt(sceneId, ThanPhap)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 171717)
	end
end
function x002193_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end

function x002193_ReturnAttr(sceneId, selfId)
	local gongli = GetMissionData(sceneId, selfId, XIULIAN_GONGLI)
	local CuongLuc = GetMissionData(sceneId, selfId, XIULIAN_LILIANG)
	local NoiLuc = GetMissionData(sceneId, selfId, XIULIAN_LINGQI)
	local TheLuc = GetMissionData(sceneId, selfId, XIULIAN_TILI)
	local TriLuc = GetMissionData(sceneId, selfId, XIULIAN_DINGLI)
	local ThanPhap = GetMissionData(sceneId, selfId, XIULIAN_SHENFA)

	BeginUICommand( sceneId )
		UICommand_AddInt(sceneId, gongli)
		UICommand_AddInt(sceneId, CuongLuc)
		UICommand_AddInt(sceneId, NoiLuc)
		UICommand_AddInt(sceneId, TheLuc)
		UICommand_AddInt(sceneId, TriLuc)
		UICommand_AddInt(sceneId, ThanPhap)
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 20000001)
end

--**********************************
--醒目提示
--**********************************
function x002193_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--关闭对话框
--**********************************
function x002193_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end
--*****************
function x002193_XiulianOpen(sceneId, selfId)
	if GetLevel(sceneId,selfId) < 70 then
		 x002193_NotifyTip( sceneId, selfId, "Nh鈔 v 鹫t c 70 m緄 c� th� m� khung tu luy畁!" )
		return
	else
		local gongli = GetMissionData(sceneId, selfId, XIULIAN_GONGLI)
		local CuongLuc = GetMissionData(sceneId, selfId, XIULIAN_LILIANG)
		local NoiLuc = GetMissionData(sceneId, selfId, XIULIAN_LINGQI)
		local TheLuc = GetMissionData(sceneId, selfId, XIULIAN_TILI)
		local TriLuc = GetMissionData(sceneId, selfId, XIULIAN_DINGLI)
		local ThanPhap = GetMissionData(sceneId, selfId, XIULIAN_SHENFA)
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, gongli)
			UICommand_AddInt(sceneId, CuongLuc)
			UICommand_AddInt(sceneId, NoiLuc)
			UICommand_AddInt(sceneId, TheLuc)
			UICommand_AddInt(sceneId, TriLuc)
			UICommand_AddInt(sceneId, ThanPhap)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,74130001)
	end
end

function x002193_XiuLianLevelUp(sceneId, selfId, SkillId)
	if SkillId <= 0 or SkillId >= 6 then
		x002193_NotifyTip( sceneId, selfId, "H銀 ch鱪 s醕h tu luy畁 m� c醕 h� mu痭 luy畁." )
		return
	end

	local CongLuc = GetMissionData(sceneId, selfId, XIULIAN_GONGLI)
	if CongLuc <= 9 then
		x002193_NotifyTip( sceneId, selfId, "Kh鬾g 瘘 c鬾g l馽 瓞 tu luy畁." )
		return
	end
	
	local Exp = GetExp(sceneId,selfId)
	if Exp <= 999999 then
		x002193_NotifyTip( sceneId, selfId, "Kh鬾g 瘘 kinh nghi甿 瓞 tu luy畁." )
		return
	end
	
	if GetMoney(sceneId,selfId) >= 100000 then
		CostMoney(sceneId, selfId, 100000)
	else
		x002193_NotifyTip( sceneId, selfId, "Ng鈔 l唼ng kh鬾g 瘘 瓞 tu luy畁." )
		return
	end
	
	local Point = GetPlayerRemainPoints(sceneId, selfId)
	SetPlayerRemainPoints(sceneId, selfId, Point + 1)
	LuaFnAddExp(sceneId,selfId,-1000000)
	SetMissionData(sceneId, selfId, XIULIAN_GONGLI, CongLuc - 10)

	if SkillId == 1 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,171718)
		local CuongLuc = GetMissionData(sceneId, selfId, XIULIAN_LILIANG)
		if CuongLuc == -1 then
			SetMissionData(sceneId, selfId, XIULIAN_LILIANG, 1)
		else
			SetMissionData(sceneId, selfId, XIULIAN_LILIANG, CuongLuc + 1)
		end
	end

	if SkillId == 2 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,171719)
		local NoiLuc = GetMissionData(sceneId, selfId, XIULIAN_LINGQI)
		if NoiLuc == -1 then
			SetMissionData(sceneId, selfId, XIULIAN_LINGQI, 1)
		else
			SetMissionData(sceneId, selfId, XIULIAN_LINGQI, NoiLuc + 1)
		end
	end
	
	if SkillId == 3 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,171720)
		local TheLuc = GetMissionData(sceneId, selfId, XIULIAN_TILI)
		if TheLuc == -1 then
			SetMissionData(sceneId, selfId, XIULIAN_TILI, 1)
		else
			SetMissionData(sceneId, selfId, XIULIAN_TILI, TheLuc + 1)
		end
	end
	
	if SkillId == 4 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,171721)
		local TriLuc = GetMissionData(sceneId, selfId, XIULIAN_DINGLI)
		if TriLuc == -1 then
			SetMissionData(sceneId, selfId, XIULIAN_DINGLI, 1)
		else
			SetMissionData(sceneId, selfId, XIULIAN_DINGLI, TriLuc + 1)
		end
	end
	
	if SkillId == 5 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,171722)
		local ThanPhap = GetMissionData(sceneId, selfId, XIULIAN_SHENFA)
		if ThanPhap == -1 then
			SetMissionData(sceneId, selfId, XIULIAN_SHENFA, 1)
		else
			SetMissionData(sceneId, selfId, XIULIAN_SHENFA, ThanPhap + 1)
		end
	end

	x002193_ReturnAttr(sceneId, selfId)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
end