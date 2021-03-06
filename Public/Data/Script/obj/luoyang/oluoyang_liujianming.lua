--刘健明

--脚本号
x311002_g_scriptId = 311002

--所拥有的事件ID列表
x311002_g_eventList={}--250036

x311002_g_eventDETime_1 = 0;
x311002_g_eventDETime_2 = 1;
x311002_g_eventDETime_4 = 2;
x311002_g_eventDETime_Lock = 3;
x311002_g_eventDETime_Unlock = 4;
x311002_g_eventDETime_Ask = 5;
x311002_g_Do_Unlock = 6;
x311002_g_Abandon_Unlock  = 7;

x311002_g_eventUpdateList = 100;
x311002_g_eventAddDETimeBegin = 200;

x311002_g_NpcSceneId = 0

-- 2000年1月3日凌晨0点的时间,双倍经验时间的基准
TIME_2000_01_03_	=		946828868


x311002_g_BuffPalyer_25 = 60
x311002_g_BuffAll_15 = 62
x311002_g_BuffPet_25 = 61
x311002_g_BuffPet_2 = 53

--**********************************
--事件列表
--**********************************
function x311002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)

		AddText(sceneId,"  #{LS_20080303}");
		
		AddNumText(sceneId, x311002_g_scriptId, "M祎 canh gi� g 痿i kinh nghi甿", 6,x311002_g_eventDETime_1 )
		AddNumText(sceneId, x311002_g_scriptId, "Hai canh gi� g 痿i kinh nghi甿", 6,x311002_g_eventDETime_2 )
		AddNumText(sceneId, x311002_g_scriptId, "B痭 canh gi� g 痿i kinh nghi甿", 6,x311002_g_eventDETime_4 )
		AddNumText(sceneId, x311002_g_scriptId, "T誱 d譶g g 痿i kinh nghi甿", 6,x311002_g_eventDETime_Lock )
		AddNumText(sceneId, x311002_g_scriptId, "Ti猵 t鴆 g 痿i kinh nghi甿", 6,x311002_g_eventDETime_Unlock )
		AddNumText(sceneId, x311002_g_scriptId, "Xem th秈 gian nh鈔 kinh nghi甿", 6,x311002_g_eventDETime_Ask )
		AddNumText( sceneId, x311002_g_scriptId, "Gi緄 thi畊 l頽h nh", 11, 10 )
			
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end	

--**********************************
--事件交互入口
--**********************************
function x311002_OnDefaultEvent( sceneId, selfId, targetId )
	x311002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x311002_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 10 then
			BeginEvent(sceneId)	
				AddText( sceneId, "#{function_help_079}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end

	-- 判断玩家的等级，小于10就返回
	if GetLevel(sceneId, selfId) < 10  then
		BeginEvent(sceneId)
			AddText(sceneId,"衅ng c c黙 ng呓i v鏽 ch遖 t緄 c 10, h銀 ti猵 t鴆 r鑞 luy畁")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 
	end
	
	-- 检测是不是需要从新刷新数据
	-- 现在时间
	local nCurTime = LuaFnGetCurrentTime()
	-- 上次刷新数据的时间
	local nPreTime = DEGetPreTime(sceneId, selfId)

	if (nCurTime - nPreTime  >= 3600*24*7)  or
		 (floor((nCurTime-TIME_2000_01_03_)/(3600*24*7)) ~= floor((nPreTime-TIME_2000_01_03_)/(3600*24*7)))   then
		DEResetWeeklyFreeTime(sceneId, selfId)
	end
	
	local nNowGetTime = 0
	
	if GetNumText() == x311002_g_eventDETime_1	then
		nNowGetTime	= 1
		x311002_AddDETime(sceneId, selfId, targetId, 1, nCurTime, nPreTime)
		
	elseif GetNumText() == x311002_g_eventDETime_2	then
		nNowGetTime	= 2
		x311002_AddDETime(sceneId, selfId, targetId, 2, nCurTime, nPreTime)
		
	elseif GetNumText() == x311002_g_eventDETime_4	then
		nNowGetTime	= 4
		x311002_AddDETime(sceneId, selfId, targetId, 4, nCurTime, nPreTime)
		
	elseif GetNumText() == x311002_g_eventDETime_Lock	then
		
		-- 先检测一下是不是冻结状态，如果是，就返回，并直接提示
		if DEIsLock(sceneId, selfId) > 0   then
			BeginEvent(sceneId)
				AddText(sceneId,"Th秈 gian g 痿i kinh nghi甿 c黙 ng呓i 疸 r絠 v鄌 tr課g th醝 k猼 痿ng")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return			
		end
	
		-- 冻结的时候，
		local nCurHave = DEGetFreeTime(sceneId, selfId)
		nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)

		-- 先计算下当前玩家身上剩下的时间
		local nTrueTime = nCurHave;
		
		if nTrueTime <= 0 then 
			BeginEvent(sceneId)
				AddText(sceneId,"Ng呓i hi畁 kh鬾g c� th秈 gian g 痿i kinh nghi甿 疸 l頽h sao?")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			nTrueTime = 0
			return
		end
		
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x311002_g_scriptId);
			UICommand_AddInt(sceneId,targetId);
			UICommand_AddInt(sceneId,50)
			UICommand_AddString(sceneId,"LockTime");
			local str = format("Ng呓i hi畁 c� %d ph鷗 th秈 gian g 痿i, ng呓i x醕 鸶nh mu痭 t誱 d譶g kh鬾g?",floor(nTrueTime/60) ) 
			UICommand_AddString(sceneId,str);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)		

	elseif GetNumText() == x311002_g_eventDETime_Unlock	then
		-- 解冻的时候，
		-- 先判断是不是有双倍经验时间可以解除
		local bLock = DEIsLock(sceneId, selfId)
		if bLock <= 0    then
			BeginEvent(sceneId)
				AddText(sceneId,"C醕 h� kh鬾g c� k猼 痿ng th秈 gian g 痿i kinh nghi甿 � ch� ta?")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- 如果玩家身上有药水的BUFF，需要给玩家一个提示
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x311002_g_BuffPalyer_25) == 1   
				or  LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x311002_g_BuffAll_15) == 1
				then
			BeginEvent(sceneId)
				AddText(sceneId,"Tr阯 ng叨i c醕 h� 疸 t皀 t読 th秈 gian nh鈔 痿i kinh nghi甿, mu痭 x醕 nh gi鋓 痿ng ch錸g?")
				AddNumText(sceneId, x311002_g_scriptId, "X醕 nh gi鋓 痿ng", 6,x311002_g_Do_Unlock )
				AddNumText(sceneId, x311002_g_scriptId, "H鼀 b� gi鋓 痿ng", 6,x311002_g_eventUpdateList )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		DESetLock(sceneId, selfId, 0)
		--DESetBeginTime(sceneId, selfId, nCurTime)
		BeginEvent(sceneId)
			AddText(sceneId,"G 痿i th秈 gian kinh nghi甿 疬㧟 k猼 痿ng c黙 ng呓i 疸 疬㧟 gi鋓 痿ng")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

		-- 同步数据到客户端
		SendDoubleExpToClient(sceneId,selfId)
	
	elseif GetNumText() == x311002_g_Do_Unlock	then
		DESetLock(sceneId, selfId, 0)
		--DESetBeginTime(sceneId, selfId, nCurTime)
		BeginEvent(sceneId)
			AddText(sceneId,"G 痿i th秈 gian kinh nghi甿 疬㧟 k猼 痿ng c黙 ng呓i 疸 疬㧟 gi鋓 痿ng")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

		-- 同步数据到客户端
		SendDoubleExpToClient(sceneId,selfId)
	
	elseif GetNumText() == x311002_g_Abandon_Unlock	then
		return
		
	elseif GetNumText() == x311002_g_eventDETime_Ask	then
			
		local nCount = DEGetCount(sceneId, selfId)
	
		BeginEvent(sceneId)
			if nCount and nCount > 0 then
				AddText(sceneId,"Th秈 gian g 痿i kinh nghi甿 m� ng呓i c� th� l頽h � ch� ta trong tu n鄖 l� #R"..tostring(floor(nCount)).."小时#W，快好好利用吧。")
			else
				AddText(sceneId,"Th 疳ng ti猚, th秈 gian g 痿i kinh nghi甿 m� ta c� th� cung c cho c醕 h� trong tu n鄖 l� #R0 canh gi�#W")
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif GetNumText() == x311002_g_eventUpdateList	then
		x311002_UpdateEventList( sceneId, selfId,targetId )
	
	elseif GetNumText() >= x311002_g_eventAddDETimeBegin	then
		--验证并且增加
		local nPoint = GetNumText()-x311002_g_eventAddDETimeBegin;
		
		local nCount = DEGetCount(sceneId, selfId)
		if nCount < nPoint    then
			return
		end
		
		local nCurHave = DEGetFreeTime(sceneId, selfId)
		nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)
		-- 先计算下当前玩家身上剩下的时间
		local nTrueTime = nCurHave;
		
		if nTrueTime < 0 then 
			nTrueTime = 0
		end
		
		WithDrawFreeDoubleExpTime(sceneId, selfId, nPoint, 0, 0 )
		
		BeginEvent(sceneId)
			AddText(sceneId,"C醕 h� 疸 l頽h th鄋h c鬾g #R".. nPoint .." gi� #Wg 痿i kinh nghi甿. Hi畁 c醕 h� c� #Y".. tostring(floor((nTrueTime + nPoint*3600)/60)) .. " ph鷗 #Wg 痿i kinh nghi甿.")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

		BeginEvent(sceneId)
			AddText(sceneId,"C醕 h� 疸 l頽h th鄋h c鬾g #R".. nPoint .." gi� #Wg 痿i kinh nghi甿. Hi畁 c醕 h� c� #Y".. tostring(floor((nTrueTime + nPoint*3600)/60)) .. " ph鷗 #Wg 痿i kinh nghi甿.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		-- 同步数据到客户端
		SendDoubleExpToClient(sceneId,selfId)

	end

end

function x311002_AddDETime(sceneId, selfId, targetId, nPoint, nCurTime, nPreTime)
		local nCurHave = DEGetFreeTime(sceneId, selfId)
		nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)
		
		local nFreeTime = DEGetFreeTime(sceneId, selfId)
		-- 先计算下当前玩家身上剩下的时间
		local nTrueTime = nCurHave;
		
		if nTrueTime < 0 then 
			nTrueTime = 0
		end
		
		-- 看还有没有时间可以领取
		local nCount = DEGetCount(sceneId, selfId)
		
		if(nCount <= 0)   then
			BeginEvent(sceneId)
				AddText(sceneId,"Th秈 gian g 痿i kinh nghi甿 m� ng呓i 疸 l頽h � ch� ta trong tu n鄖, 疸 d鵱g h猼")
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
				AddText(sceneId,"C醕 h� c騨 l鄊 痿ng k猼 th秈 gian g 痿i kinh nghi甿, h銀 gi鋓 痿ng tr呔c r癷 t緄 nh th秈 gian g 痿i kinh nghi甿 m緄")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return 
		end
	
		BeginEvent(sceneId)
			if (nTrueTime/60) > 0 then
				AddText(sceneId,"Tu n鄖, c醕 h� 疸 l頽h s� l d� c黙 th秈 gian g 痿i kinh nghi甿 #R" .. tostring(floor(nCount)) .. "gi�#W, 疸 c� th秈 gian g 痿i kinh nghi甿 #Y" .. tostring(floor(nTrueTime/60)) .. " ph鷗#W, c醕 h� x醕 nh mu痭 l頽h #Y" .. tostring(floor(nPoint*60)) .. " ph鷗 #Wth秈 gian g 痿i kinh nghi甿 kh鬾g? ");
			else
				AddText(sceneId,"Tu n鄖, c醕 h� 疸 l頽h s� l d� c黙 th秈 gian g 痿i kinh nghi甿 #R" .. tostring(floor(nCount)) .. "gi�#W, c醕 h� x醕 nh mu痭 l頽h #Y" .. tostring(floor(nPoint*60)) .. " ph鷗 #Wth秈 gian g 痿i kinh nghi甿 kh鬾g? ");
			end
			
			-- 如果这个时候玩家身上有双倍经验药水效果，需要给玩家提示
			if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x311002_g_BuffPalyer_25) == 1   
					or  LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x311002_g_BuffAll_15) == 1
					then
				AddText(sceneId,"#r#RXin ch� �: Tr阯 ng叨i c醕 h� 疸 c� t皀 t読 th秈 gian nh鈔 痿i kinh nghi甿, c� mu痭 x醕 nh nh l頽h kh鬾g?");
			end
			
			AddNumText(sceneId, x311002_g_scriptId, "喧ng v, ta mu痭 l頽h gi� g 痿i kinh nghi甿", -1,x311002_g_eventAddDETimeBegin+nPoint )
			AddNumText(sceneId, x311002_g_scriptId, "Kh鬾g, ta nh sai r癷", -1,x311002_g_eventUpdateList )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
end

--**********************************
--接受此NPC的任务
--**********************************
function x311002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x311002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x311002_g_eventList do
		if missionScriptId == findId then
			x311002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x311002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x311002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x311002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x311002_OnDie( sceneId, selfId, killerId )

end

function x311002_LockTime( sceneId, selfId, targetId, nTime )
	if nTime < 0 then
		return 
	end
	
	-- 只有在 洛阳，苏州，大理，楼兰，束河古镇 这几个场景能够冻结双倍经验
	if sceneId~=0 and sceneId~=1 and sceneId~=2 and sceneId~=186 and sceneId~=420 
			and sceneId ~= 193 and sceneId ~= 418 and sceneId ~= 419 and sceneId ~= 518  then	 -- zchw
		return
	end

	-- 获得服务器记录的实际的真实时间
	local nCurTime = LuaFnGetCurrentTime()
	local nCurHave = DEGetFreeTime(sceneId, selfId)
	nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)
	-- 先计算下当前玩家身上剩下的时间
	local nTrueTime = nCurHave;
	
	if nTrueTime < 0 then 
		nTrueTime = 0
	end

	DESetLock(sceneId, selfId, 1)
	--DESetFreeTime(sceneId, selfId, nTrueTime)
	
	BeginEvent(sceneId)
		AddText(sceneId,"秀 痿ng k猼 " .. tostring(floor(nTrueTime/60)) .. " ph鷗 th秈 gian g 痿i kinh nghi甿")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"秀 痿ng k猼 " .. tostring(floor(nTrueTime/60)) .. " ph鷗 th秈 gian g 痿i kinh nghi甿")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	-- 同步数据到客户端
	SendDoubleExpToClient(sceneId,selfId)

end


