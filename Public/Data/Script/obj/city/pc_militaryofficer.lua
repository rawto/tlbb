--城市NPC
--武大威

x805028_g_scriptId=805028
x805028_g_BuildingID16 = 11

--所拥有的事件ID列表
x805028_g_eventList = {600030} --zchw

-- 任务集事件 ID 列表，这类事件包含子事件
x805028_g_eventSetList = {600030}

x805028_TIME_2000_01_03_ = 946828868

x805028_g_BuffPalyer_25 = 60
x805028_g_BuffAll_15    = 62

x805028_g_BangGongLimit    = 20 --[tx43764]
x805028_g_Item = 40004426

--**********************************
--事件列表
--**********************************
function x805028_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0
	local PlayerName = GetName( sceneId, selfId )

	--是否是本帮成员
	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
	local strText

	if(guildid ~= cityguildid) then
		BeginEvent(sceneId)
			strText = "Ng叨i n鄌! d醡 x鬾g v鄌 bang c黙 ta!"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	BeginEvent( sceneId )
		strText = "L鉶 V� l� quan v� c黙 b眓 th鄋h, m d� V� m� th鄋h th誳 v� ngh�, c� c� h礽 c� th� c鵱g ta th� s裞. 喧ng r癷, c騨 c� 餴玼 g� ch� gi醥? L鉶 C� l� quan v� c黙 B眓 th鄋h, m d� V� m鐄"
		AddText(sceneId,strText);
		AddText(sceneId, "    " .. PlayerName .. "! T緄 l鄊 nhi甿 v� qu痗 ph騨g!")
		if CityGetSelfCityID( sceneId, selfId ) == sceneId then
			for i, eventId in x805028_g_eventList do
				--PrintStr("eventId" .. eventId)
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
		end
		AddNumText( sceneId, x805028_g_scriptId, "Gi緄 thi畊 nhi甿 v� qu痗 ph騨g", 11, 1 )
		AddNumText( sceneId, x805028_g_scriptId, "Tu s豠 x鈟 d駈g l ki猰", 6, 3 )
		AddNumText( sceneId, x805028_g_scriptId, "Tu luy畁 t c鬾g", 6, 4 )
		AddNumText( sceneId, x805028_g_scriptId, "Mua gi v� ph騨g c�", 7, 5 )
		AddNumText( sceneId, x805028_g_scriptId, "Gi緄 thi畊 v� ph叨ng", 11, 2 )

		-- 城市领双
		AddNumText( sceneId, x805028_g_scriptId, "L頽h 2 l kinh nghi甿", 6, 6 )
		
		AddNumText( sceneId, x805028_g_scriptId, "#{YPLJ_090116_01}", 6, 7 )--[tx43764]

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件交互入口
--**********************************
function x805028_OnDefaultEvent( sceneId, selfId,targetId )
	x805028_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- 判断某个事件是否可以通过此 NPC 执行
--**********************************
function x805028_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805028_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805028_g_eventSetList do
			if CallScriptFunction( findId, "IsInEventList", sceneId, selfId, eventId ) == 1 then
				bValid = 1
				break
			end
		end
	end

	return bValid
end

--**********************************
--事件列表选中一项
--**********************************
function x805028_OnEventRequest( sceneId, selfId, targetId, eventId )
	if x805028_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	end
	if GetNumText() == 1 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Defance_Mission_Help}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 2 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Intro_WuFang}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	 elseif GetNumText() == 3 then
		BeginEvent(sceneId)
		AddText( sceneId, "Ch裞 n錸g n鄖 s 疬㧟 th馽 hi畁" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 4 then
		BeginEvent(sceneId)
		AddText( sceneId, "Ch裞 n錸g n鄖 s 疬㧟 th馽 hi畁" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 5 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )								--调用城市商店界面
			UICommand_AddInt( sceneId, x805028_g_BuildingID16 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 104 )

	elseif GetNumText() == 6 then
		-- 检测帮会是不是处于低维护状态，
		-- 1，看玩家城市是不是处于低维护状态中
		if CityGetMaintainStatus(sceneId, selfId, sceneId) == 1  then
			BeginEvent(sceneId)
				AddText( sceneId, "Hi畁 b眓 bang 餫ng � tr課g th醝 duy tr� th, m鱥 ph鷆 l㱮 皤u kh鬾g th� cung c cho ch� v�, 鸢ng cam c祅g kh� c� gg ki猰 疬㧟 c鄋g nhi玼 v痭 cho b眓 th鄋h v鏽 l� t痶 nh." )
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		BeginEvent(sceneId)
			AddText( sceneId, "H鄋h t tr阯 giang h�, coi tr鱪g hi畊 qu� t痗 鸬, c� ph鋓 mu痭 l頽h th秈 gian g 痿i kinh nghi甿 kh鬾g?" )
			AddNumText( sceneId, x805028_g_scriptId, "Nh 1 gi� g 痿i kinh nghi甿", 6, 111 )
			AddNumText( sceneId, x805028_g_scriptId, "Nh 2 gi� g 痿i kinh nghi甿", 6, 222 )
			AddNumText( sceneId, x805028_g_scriptId, "Nh 4 gi� g 痿i kinh nghi甿", 6, 333 )
			AddNumText( sceneId, x805028_g_scriptId, "Xem th秈 gian nh鈔 kinh nghi甿", 6, 444 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		
	elseif GetNumText() == 7 then
	
		if GetItemCount(sceneId, selfId, x805028_g_Item) >= 1  then
			BeginEvent(sceneId)
				AddText( sceneId, "#{YPLJ_090116_02}" )--[tx43764]
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		if CityGetAttr(sceneId, selfId, 6) < x805028_g_BangGongLimit   then --[tx43764]
			BeginEvent(sceneId)
				AddText( sceneId, "#{YPLJ_090116_03}" )--[tx43764]
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		BeginEvent(sceneId)
			AddText( sceneId, "#{YPLJ_090116_04}" )--[tx43764]
			AddNumText( sceneId, x805028_g_scriptId, "#{YPLJ_090116_05}", 6, 8 )--[tx43764]
			AddNumText( sceneId, x805028_g_scriptId, "#{YPLJ_090116_06}", 6, 9 )--[tx43764]
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return
		
	elseif GetNumText() == 8 then
		if GetItemCount(sceneId, selfId, x805028_g_Item) >= 3  then
			return
		end

		local nGuildPoint = CityGetAttr(sceneId, selfId, 6)
		if nGuildPoint<x805028_g_BangGongLimit then --[tx43764]
			return
		end
		
		-- 添加物品
		BeginAddItem(sceneId)
			AddItem( sceneId, x805028_g_Item, 1 )
		local ret = EndAddItem(sceneId,selfId)
		
		if ret ~= 1  then
			BeginEvent(sceneId)
				AddText( sceneId, "#{YPLJ_090116_07}" )--[tx43764]
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		if CityChangeAttr(sceneId, selfId, 6, -x805028_g_BangGongLimit) ~= 1  then--[tx43764]
			BeginEvent(sceneId)
				AddText( sceneId, "#{YPLJ_090116_08}" )--[tx43764]
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		AddItemListToHuman(sceneId,selfId)
		
		BeginEvent(sceneId)
			AddText( sceneId, "#{YPLJ_090116_09}" )--[tx43764]
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return
	
	elseif GetNumText() == 9 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)

		return
	
	elseif GetNumText() == 111 then
		x805028_DoubleExpTime(sceneId, selfId, targetId, 1)

	elseif GetNumText() == 222 then
		x805028_DoubleExpTime(sceneId, selfId, targetId, 2)

	elseif GetNumText() == 333 then
		x805028_DoubleExpTime(sceneId, selfId, targetId, 4)

	elseif GetNumText() == 444 then
		-- 查询本周的双倍经验时间
		local _,nCount = DEGetCount(sceneId, selfId)
		if nCount==0  then
			BeginEvent(sceneId)
				AddText(sceneId,"Th 疳ng ti猚, th秈 gian g 痿i kinh nghi甿 m� ta c� th� cung c cho ng呓i 疸 l� #R0 gi�#W r癷.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)

		else
			BeginEvent(sceneId)
				AddText(sceneId,"Th秈 gian g 痿i kinh nghi甿 trong tu m� ta c� th� cung c cho ng呓i l� #R" .. nCount .. " gi�#W, mau t d鴑g t痶.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)

		end

	elseif GetNumText() == 201 then
		x805028_DealDoubleExpTime(sceneId, selfId, targetId, GetNumText()-200)
		
	elseif GetNumText() == 202 then
		x805028_DealDoubleExpTime(sceneId, selfId, targetId, GetNumText()-200)
		
	elseif GetNumText() == 204 then
		x805028_DealDoubleExpTime(sceneId, selfId, targetId, GetNumText()-200)
		
	elseif GetNumText() == 300 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)

		return
	end
end

function x805028_DealDoubleExpTime(sceneId, selfId, targetId, nPoint)

	-- 获得玩家在帮会中的等级
	-- 帮主可以不用消耗帮贡，副帮主半价
	local nGuildPos = GetGuildPos(sceneId, selfId)
	
	local BasePoint = 25
	if nGuildPos == 8  then
		BasePoint = 12.5
	elseif nGuildPos == 9  then
		BasePoint = 0
	else
		BasePoint = 25
	end
	
	local bTimeOk = 1
	
	-- 帮主是不是当够时间的检测
	if nGuildPos==8 or nGuildPos==9  then
		local isPosLongEnough = IsGuildPosLongEnough(sceneId, selfId)
		if isPosLongEnough < 1 then
			bTimeOk = 0
			BasePoint = 25
		end
	else
		bTimeOk = -1
	end

	-- 检测玩家是不是有足够的帮会贡献值
	local nCity = CityGetAttr(sceneId, selfId, 6)
	if nCity < floor(BasePoint*nPoint)   then
		BeginEvent(sceneId)
			AddText(sceneId,"械 c痭g hi猲 bang h礽 c黙 ng呓i kh鬾g 瘘, c� th� ti陁 hao.")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if BasePoint ~= 0  then
		if CityChangeAttr( sceneId, selfId, 6, -(floor(BasePoint*nPoint)) ) ~= 1  then
			BeginEvent(sceneId)
				AddText( sceneId, "Kh tr� 鸬 c痭g hi猲 bang h礽 th b読, xin l鷆 sau th� l読.." )
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
	end
	
	local _,nCount = DEGetCount(sceneId, selfId)
	if nCount < nPoint    then
		return
	end

	local nCurHave = DEGetFreeTime(sceneId, selfId)
	nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)

	local nFreeTime = DEGetFreeTime(sceneId, selfId)

	-- 先计算下当前玩家身上剩下的时间
	local nTrueTime = nCurHave;

	if nTrueTime < 0 then
		nTrueTime = 0
	end

	-- 换个新的接口
	WithDrawFreeDoubleExpTime(sceneId, selfId, 0, nPoint, 0 )

	local nCurTime = LuaFnGetCurrentTime()

	BeginEvent(sceneId)
		AddText(sceneId,"C醕 h� 疸 l頽h th鄋h c鬾g #R".. nPoint .."gi� #Wg 痿i kinh nghi甿. Hi畁 c醕 h� c� #Y".. tostring(floor((nTrueTime + nPoint*3600)/60)) .. " ph鷗 #Wg 痿i kinh nghi甿.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"C醕 h� 疸 l頽h th鄋h c鬾g #R".. nPoint .."gi� #Wg 痿i kinh nghi甿. Hi畁 c醕 h� c� #Y".. tostring(floor((nTrueTime + nPoint*3600)/60)) .. " ph鷗 #Wg 痿i kinh nghi甿.")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	if bTimeOk == 1  then
		if nGuildPos == 8  then -- 副帮主
			BeginEvent(sceneId)
				AddText(sceneId,"Do c醕 h� 痄m nhi甿 Ph� bang ch� tr阯 1 tu, n阯 l l頽h song n鄖 hao t痭 餴琺 c痭g hi猲 bang h礽 疬㧟 gi鋗 1 n豠.")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif nGuildPos == 9  then  --帮主
			BeginEvent(sceneId)
				AddText(sceneId,"Do c醕 h� 痄m nhi甿 Bang ch� tr阯 1 tu, l l頽h song n鄖 kh鬾g hao t痭 餴琺 c痭g hi猲 bang h礽.")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end

	-- 同步数据到客户端
	SendDoubleExpToClient(sceneId,selfId)

end

--**********************************
--处理领双的函数
--**********************************
function x805028_DoubleExpTime(sceneId, selfId, targetId, nTime)

	-- 1，看玩家城市是不是处于低维护状态中
	if CityGetMaintainStatus(sceneId, selfId, sceneId) == 1  then
		BeginEvent(sceneId)
			AddText( sceneId, "Hi畁 b眓 bang 餫ng � tr課g th醝 duy tr� th, m鱥 ph鷆 l㱮 皤u kh鬾g th� cung c cho ch� v�, 鸢ng cam c祅g kh� c� gg ki猰 疬㧟 c鄋g nhi玼 v痭 cho b眓 th鄋h v鏽 l� t痶 nh." )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	-- 检测是不是需要从新刷新数据
	-- 现在时间
	local nCurTime = LuaFnGetCurrentTime()
	-- 上次刷新数据的时间
	local nPreTime = DEGetPreTime(sceneId, selfId)

	if (nCurTime - nPreTime  >= 3600*24*7)  or
		 (floor((nCurTime-x805028_TIME_2000_01_03_)/(3600*24*7)) ~= floor((nPreTime-x805028_TIME_2000_01_03_)/(3600*24*7)))   then
		----DESetLock(sceneId, selfId, 0)
		----DESetBeginTime(sceneId, selfId, 0)
		--DESetFreeTime(sceneId, selfId, 0)
		--DESetPreTime(sceneId, selfId, nCurTime)
		--DESetCount(sceneId, selfId, 5, 4, 0)

		DEResetWeeklyFreeTime(sceneId, selfId)
	end

	--
	x805028_AddDETime( sceneId, selfId, targetId, nTime, nCurTime, nPreTime )

end

function x805028_AddDETime(sceneId, selfId, targetId, nPoint, nCurTime, nPreTime)
		local nCurHave = DEGetFreeTime(sceneId, selfId)
		nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)
		-- 先计算下当前玩家身上剩下的时间
		local nTrueTime = nCurHave;

		local nFreeTime = DEGetFreeTime(sceneId, selfId)

		if nTrueTime < 0 then
			nTrueTime = 0
		end

		-- 看还有没有时间可以领取
		local _,nCount = DEGetCount(sceneId, selfId)
		if(nCount <= 0)   then
			BeginEvent(sceneId)
				AddText(sceneId,"Th秈 gian g 痿i kinh nghi甿 trong tu c黙 c醕 h� h靚h nh� 疸 d鵱g h猼 r癷.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		if nCount < nPoint   then
			BeginEvent(sceneId)
				AddText(sceneId,"C醕 h� kh鬾g c� nhi玼 th秈 gian c� th� nh")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		-- 看身上是不是已经有比较多的时间了，2小时
		if nFreeTime >= 120*60   then
			BeginEvent(sceneId)
				AddText(sceneId,"Th秈 gian kinh nghi甿 g 痿i c醕 h� c� 疬㧟 � ba th鄋h ph� l緉 v� th鄋h ph� t� x鈟 疸 鹫t m裞 gi緄 h課 cao nh 疬㧟 nh.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		-- 检测玩家不能拥有超过4个小时的时间
		if nFreeTime + nPoint*3600 > 3600*4   then
			BeginEvent(sceneId)
				AddText(sceneId,"Th秈 gian kinh nghi甿 g 痿i c醕 h� c� 疬㧟 � ba th鄋h ph� l緉 v� th鄋h ph� t� x鈟 疸 鹫t m裞 gi緄 h課 cao nh 疬㧟 nh.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		-- 看身上是不是有冻结了的时间
		if DEIsLock(sceneId,selfId)  > 0    then
			BeginEvent(sceneId)
				AddText(sceneId,"Th秈 gian kinh nghi甿 g 痿i c醕 h� c� 疬㧟 � ba th鄋h ph� l緉 v� th鄋h ph� t� x鈟 疸 鹫t m裞 gi緄 h課 cao nh 疬㧟 nh.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		BeginEvent(sceneId)
			if (nTrueTime/60) > 0 then
				AddText(sceneId,"Tu n鄖, c醕 h� 疸 l頽h s� l d� c黙 th秈 gian g 痿i kinh nghi甿 #R" .. tostring(floor(nCount)) .. " gi�#W, 疸 c� th秈 gian g 痿i kinh nghi甿 #Y" .. tostring(floor(nTrueTime/60)) .. " ph鷗#W, c醕 h� x醕 nh mu痭 l頽h #Y" .. tostring(floor(nPoint*60)) .. " ph鷗 #W th秈 gian g 痿i kinh nghi甿 v� 鸢ng th秈 ti陁 hao 鸬 c痭g hi猲 bang ph醝" .. tostring(floor(nPoint*25)) .. "kh鬾g ?#r N猽 c醕 h� 痄m nhi甿 Bang ch� tr阯 1 tu, c� th� kh鬾g c hao t痭 餴琺 c痭g hi猲 bang h礽, Ph� bang ch� c� th� gi鋗 1 n豠.");
			else
				AddText(sceneId,"Tu n鄖, c醕 h� 疸 l頽h s� l d� c黙 th秈 gian g 痿i kinh nghi甿 #R" .. tostring(floor(nCount)) .. " gi�#W, c醕 h� x醕 nh mu痭 l頽h #Y" .. tostring(floor(nPoint*60)) .. " ph鷗 #W th秈 gian g 痿i kinh nghi甿 v� 鸢ng th秈 ti陁 hao 鸬 c痭g hi猲 bang ph醝" .. tostring(floor(nPoint*25)) .. "kh鬾g ?#r N猽 c醕 h� 痄m nhi甿 Bang ch� tr阯 1 tu, c� th� kh鬾g c hao t痭 餴琺 c痭g hi猲 bang h礽, Ph� bang ch� c� th� gi鋗 1 n豠.");
			end
			-- 如果这个时候玩家身上有双倍经验药水效果，需要给玩家提示
			if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x805028_g_BuffPalyer_25) == 1   
					or  LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x805028_g_BuffAll_15) == 1
					then
				AddText(sceneId,"#r#RXin ch� �: Tr阯 ng叨i c醕 h� 疸 c� t皀 t読 th秈 gian nh鈔 痿i kinh nghi甿, c� mu痭 x醕 nh nh l頽h kh鬾g?");
			end
			AddNumText(sceneId, x805028_g_scriptId, "喧ng v, ta mu痭 l頽h gi� g 痿i kinh nghi甿", -1,200+nPoint )
			AddNumText(sceneId, x805028_g_scriptId, "Kh鬾g, ta nh sai r癷", -1,300 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

end


--**********************************
--接受此NPC的任务
--**********************************
function x805028_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805028_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805028_NotifyFailTips( sceneId, selfId, "Ng呓i hi畁 kh鬾g th� nh nhi甿 v� n鄖" )
		elseif ret == -2 then
			x805028_NotifyFailTips( sceneId, selfId, "Kh鬾g th� ti猵 nh nhi玼 nhi甿 v�" )
		end

		return
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x805028_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805028_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805028_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x805028_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805028_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x805028_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805028_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--死亡事件
--**********************************
function x805028_OnDie( sceneId, selfId, killerId )
end

function x805028_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
