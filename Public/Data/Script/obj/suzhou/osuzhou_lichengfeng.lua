--苏州NPC
--驿站....

x001028_g_ScriptId	= 001028

--门派信息(门派名称，SceneID，PosX，PosY，门派ID)
x001028_g_mpInfo		= {}
x001028_g_mpInfo[0]	= { "Tinh T鷆", 16,  96, 152, MP_XINGSU }
x001028_g_mpInfo[1]	= { "Ti陁 Dao", 14,  67, 145, MP_XIAOYAO }
x001028_g_mpInfo[2]	= { "Thi猽 L鈓",  9,  96, 127, MP_SHAOLIN }
x001028_g_mpInfo[3]	= { "Thi阯 S絥", 17,  95, 120, MP_TIANSHAN }
x001028_g_mpInfo[4]	= { "Thi阯 Long", 13,  96, 120, MP_DALI }
x001028_g_mpInfo[5]	= { "Nga My", 15,  89, 139, MP_EMEI }
x001028_g_mpInfo[6]	= { "V� 衋ng", 12, 103, 140, MP_WUDANG }
x001028_g_mpInfo[7]	= { "Minh Gi醥", 11,  98, 167, MP_MINGJIAO }
x001028_g_mpInfo[8]	= { "C醝 Bang", 10,  91, 116, MP_GAIBANG }
--x001028_g_mpInfo[9]	= { "M� Dung", 435,  91, 116, MP_MURONG }--预留

x001028_g_Yinpiao = 40002000 

x001028_g_Impact_NotTransportList = { 5929, 5944 } -- 禁止传送的Impact
x001028_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}", "#{XSHCD_20080418_099}" } -- 禁止传送的Impact提示信息

--**********************************
--事件交互入口
--**********************************
function x001028_OnDefaultEvent( sceneId, selfId,targetId )
	
	-- 检测玩家身上是不是有“银票”这个东西，有就不能使用这里的功能
	if GetItemCount(sceneId, selfId, x001028_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "Xin th� l瞚 tr阯 ng叨i c醕 h� 餫ng gi� ng鈔 phi猽 ta kh鬾g th� gi鷓 疬㧟." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	local	mp
	local	i		= 0
	BeginEvent( sceneId )

		AddText( sceneId, "#{loulan_yizhan_20080329}")
		 
		AddNumText( sceneId, x001028_g_ScriptId, "Quay v� m鬾 ph醝", 9, 1000 )
		AddNumText( sceneId, x001028_g_ScriptId, "Th鄋h Th� - L誧 D呓ng", 9, 1001 )
		AddNumText( sceneId, x001028_g_ScriptId, "Th鄋h Th� - L誧 D呓ng C豼 Ch鈛 Th呓ng H礽", 9, 1002 )
		AddNumText( sceneId, x001028_g_ScriptId, "Th鄋h Th� - 姓i L�", 9, 1003 )
		AddNumText( sceneId, x001028_g_ScriptId, "Th鄋h Th� - L鈛 Lan", 9, 1005 )
		AddNumText( sceneId, x001028_g_ScriptId, "Th鄋h Th� - Th鷆 H� C� Tr", 9, 1016 )
		AddNumText( sceneId, x001028_g_ScriptId, "Th鄋h Th� - #GPh唼ng Minh Tr", 9, 1017 )
		 
		AddNumText( sceneId, x001028_g_ScriptId, "衖 c豼 鹫i m鬾 ph醝", 9, 1011 )
		
		--for i, mp in x001028_g_mpInfo do
			--AddNumText( sceneId, x001028_g_ScriptId, "门派 - "..mp[1], 9, i )
		--end

	
	
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--事件列表选中一项
--**********************************
function x001028_OnEventRequest( sceneId, selfId, targetId, eventId )

	--漕运禁止传送....
	if GetTeamId(sceneId,selfId)>=0 and 
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		num=LuaFnGetFollowedMembersCount( sceneId, selfId)
		local mems = {}
		for	i=0,num-1 do
			mems[i] = GetFollowedMember(sceneId, selfId, i)
			if mems[i] == -1 then
				return
			end
			if IsHaveMission(sceneId,mems[i],4021) > 0 then
				x001028_MsgBox( sceneId, selfId, targetId, "Trong 鸬i ng� c黙 c醕 h� c� ng叨i 餫ng l鄊 nhi甿 v� v chuy琻, th呓ng nh鈔 ta kh鬾g th� cung c d竎h v� cho c醕 h� 疬㧟." )
				return
			end
		end
	end

	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x001028_MsgBox( sceneId, selfId, targetId, "Xin th� l瞚! C醕 h� 餫ng mang trong m靚h nhi甿 v� v chuy琻, th呓ng nh鈔 ta kh鬾g th� cung c d竎h v� cho c醕 h�." )
		return
	end

	--检测Impact状态驻留效果
	for i, ImpactId in x001028_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			x001028_MsgBox( sceneId, selfId, targetId, x001028_g_TalkInfo_NotTransportList[i] )			
			return 0
		end
	end

	
	--返回门派....
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--返回门派
		if id < 0 or (id == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) <= 0) then --Add by S骾
			x001028_MsgBox( sceneId, selfId, targetId, "Ng呓i v鏽 ch遖 gia nh m鬾 ph醝." )
		elseif id == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) > 0 then --Add by S骾
			CallScriptFunction((400900),"TransferFunc",sceneId,selfId,435,91,116)
		else
			mp	= x001028_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			end
		end
		return
	end

	--L誧 D呓ng....
	if arg == 1001 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 233, 321 )
		return
	end

	--L誧 D呓ng九州....
	if arg == 1002 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 325, 270 )
		return
	end

	--大理....
	if arg == 1003 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 252, 124 )
		return
	end

	--苏州铁匠....
	if arg == 1004 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 331, 226 )
		return
	end

	--楼兰....
	if arg == 1005 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 286, 129 )
		return
	end

	--凤鸣镇....
	if arg == 1017 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 158, 120 )
		return
	end

	if arg == 1011 then		
		BeginEvent( sceneId )
			for i, mp in x001028_g_mpInfo do
				AddNumText( sceneId, x001028_g_ScriptId, "M鬾 ph醝 - "..mp[1], 9, i )
			end
			
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
		return
	end
	
	if arg == 1016 then		--束河古镇
			-- add by zchw
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x001028_g_ScriptId);
			-- zchw fix Transfer bug
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "Th鷆 H� C� Tr l� n絠 kh鬾g t錸g s醫 kh�, ph鋓 c th. C醕 h� x醕 nh ti猲 v鄌?");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end
	
	--门派....
	for i, mp in x001028_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			return
		end
	end

end
--  add by zchw
function x001028_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 200, 211, 20 );
	return
end
--**********************************
--根据门派ID获取门派信息
--**********************************
function x001028_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x001028_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--对话窗口信息提示
--**********************************
function x001028_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
