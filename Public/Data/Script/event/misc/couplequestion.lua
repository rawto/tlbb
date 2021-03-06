-- 夫妻回答问题
-- 脚本号
-- UI_COMMAND 888901

x888901_g_ScriptId = 888901  -- 代码中也使用这个编号了。严禁修改
x888901_g_Item		 = 30505134

-- 问题表
x888901_g_FemaleType = 6
x888901_g_MaleType = 7

x888901_g_OptPos = {
	{1,2,3},{1,3,2},{2,1,3},{2,3,1},{3,1,2},{3,2,1}
}

-- 客户端动作表
x888901_g_ClientOp = {
	"answer","clientstop","askstop"
}

-- 上一题的回答情况
x888901_g_AnswerState = {
	["start"]			= "B 馥u",
	["timeout"]		= "H猼 th秈 gian",
	["oknext"]		= "Ch韓h x醕",
	["failnext"]	= "Sai r癷",
	["cancel"]		= "Ch遖 r�",
}

--**********************************
-- 列举事件
--**********************************
function x888901_OnEnumerate( sceneId, selfId, targetId )
	local CurMonthDay = LuaFnGetDayOfThisMonth()
	if CurMonthDay and mod(CurMonthDay,2) == 0 then
		AddNumText( sceneId, x888901_g_ScriptId, "T鈓 h鎢 Linh T�", 2, 100 )
	end
	--AddNumText(sceneId,x888901_g_ScriptId,"直接结婚", 5, 2)
end

--**********************************
-- 事件列表选中一项
--**********************************
function x888901_OnDefaultEvent( sceneId, selfId, targetId, eventId )
	local opt = GetNumText()
	if opt == 1 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		x888901_BeginCoupleQuestion(sceneId,selfId,targetId)
	elseif opt == 2 then
		x888901_DirectMary(sceneId,selfId)
	elseif opt == 3 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	elseif opt == 100 then
		BeginEvent( sceneId )
			local strText = "Phu th� c醕 ng呓i c� t鈓 馥u � h䅟 nhau kh鬾g. Ch� ta c� m祎 th� nghi甿 ch裯g t� l騨g chung th鼀 c黙 c醕 ng呓i. 畜 l� #GLinh T�#W. Trong kho鋘g th秈 gian nh 鸶nh, c醕 ng呓i ph鋓 tr� l秈 nh� nhau."
			AddText( sceneId, strText )
			AddText( sceneId,"Th� nghi甿 n鄖 m瞚 2 ng鄖 ch� c� th� tham gia 1 l duy nh, c醕 ng呓i c� mu痭 th� kh鬾g?")
			AddNumText( sceneId, x888901_g_ScriptId, "Ta mu痭 tham gia", 2, 1)
			AddNumText( sceneId, x888901_g_ScriptId, "Ta c suy ngh� th阭", 8, 3);
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

-- 方便结婚的功能，测试代码
function x888901_DirectMary(sceneId,selfId)
	--1.是否组队
	local teamId = GetTeamId(sceneId,selfId)
	if teamId<0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_noteam")
		return
	end
	
	--2.是否夫妻俩人
	if GetTeamSize(sceneId,selfId)~=2 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_musttwo")
		return
	end
	
	--3.是否在附近
	if GetNearTeamCount(sceneId,selfId) ~= 2 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_mustnear")
		return
	end
	
	--4.是否是夫妻
	local tid1 = GetNearTeamMember(sceneId,selfId,0)
	local tid2 = GetNearTeamMember(sceneId,selfId,1)
	
	LuaFnMarry(sceneId, tid1, tid2, 1)
	x888901_NotifySystemMsg(sceneId,tid1,"directmarry")
	x888901_NotifySystemMsg(sceneId,tid2,"directmarry")
end

-- 检查B 馥u答题条件
function x888901_BeginCoupleQuestion(sceneId,selfId,targetId)
	--1.是否组队
	local teamId = GetTeamId(sceneId,selfId)
	if teamId<0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_noteam")
		return
	end
	
	--2.是否俩人
	if GetTeamSize(sceneId,selfId)~=2 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_musttwo")
		return
	end
	
	--3.是否在附近
	if GetNearTeamCount(sceneId,selfId) ~= 2 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_mustnear")
		return
	end
	
	--4.是否是夫妻
	local tid1 = GetNearTeamMember(sceneId,selfId,0)
	local tid2 = GetNearTeamMember(sceneId,selfId,1)
	if LuaFnIsMarried(sceneId,tid1)<=0 or LuaFnIsMarried(sceneId,tid2)<=0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_nomarry")
		return
	else
		if LuaFnGetSpouseGUID(sceneId,tid1) ~= LuaFnGetGUID(sceneId,tid2) or LuaFnGetSpouseGUID(sceneId,tid2) ~= LuaFnGetGUID(sceneId,tid1) then
			x888901_NotifySystemMsg(sceneId,selfId,"err_mustcouple")
			return
		end
	end
	
	--5.是否MAC相同
	if IsSameMAC(sceneId,tid1,tid2) > 0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_samemac")
		return
	end
	
	--6.是否队长
	if LuaFnIsTeamLeader(sceneId,selfId)<=0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_mustleader")
		return
	end
	
	local CurDayTime = GetDayTime()
	local LastCoupleQuestionDayTime1 = GetMissionData(sceneId, tid1, MD_COUPLEQUESTION_DAYTIME)
	local LastCoupleQuestionDayTime2 = GetMissionData(sceneId, tid2, MD_COUPLEQUESTION_DAYTIME)
	
	--7.今天是否未参加
	if CurDayTime <= LastCoupleQuestionDayTime1 or CurDayTime <= LastCoupleQuestionDayTime2 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_already")
		return
	end
	
	--8.今天是否是双日
	local CurMonthDay = LuaFnGetDayOfThisMonth()
	if not CurMonthDay or mod(CurMonthDay,2) > 0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_notday")
		return
	end
	
	--检测成功，可以B 馥u初始化答题了
	SetMissionData( sceneId, tid1, MD_COUPLEQUESTION_DAYTIME, CurDayTime )
	SetMissionData( sceneId, tid2, MD_COUPLEQUESTION_DAYTIME, CurDayTime )
	
	local FriendPoint = LuaFnGetFriendPoint(sceneId,tid1,tid2)
	local MaxQuestion = 25

	if FriendPoint >=9000 then
		MaxQuestion = 100
	elseif FriendPoint >=6000 then
		MaxQuestion = 75
	elseif FriendPoint >= 3000 then
		MaxQuestion = 50
	end
	
	--设置双方人物的属性
	StopCoupleQuestion(sceneId,tid1)
	StopCoupleQuestion(sceneId,tid2)
	
	StartCoupleQuestion(sceneId,tid1,tid2,targetId,MaxQuestion)
	SetMissionData(sceneId, tid1, MD_COUPLEQUESTION_DAYTIME,CurDayTime)
	StartCoupleQuestion(sceneId,tid2,tid1,targetId,MaxQuestion)
	SetMissionData(sceneId, tid2, MD_COUPLEQUESTION_DAYTIME,CurDayTime)

	--记录统计日志
	x888901_LogCoupleAction(sceneId,tid1,tid2,COUPLE_LOG_STARTQUESTION)

	local question,qtype = x888901_RandomQuestion(sceneId,tid1)	
	x888901_SendCoupleQuestion(sceneId,tid1,targetId,question,qtype,"start")
	x888901_SendCoupleQuestion(sceneId,tid2,targetId,question,qtype,"start")
end

function x888901_RandomQuestion(sceneId,userId)
	local coupleId = GetCoupleID(sceneId,userId)
	local nm = ""
	
	if coupleId>=0 then
		--男女判断
		local maleId = userId
		local femaleId = coupleId
		if GetSex(sceneId,userId) == 0 then
			maleId = coupleId
			femaleId = userId
		end
		
		--根据男女不同构造名称和题号
		local rp = random(1,2)
		if rp == 1 then
			nm = format("#G%s#W",GetName(sceneId,femaleId))
			return GetRandomQuestionsIndex(x888901_g_FemaleType),nm
		else
			nm = format("#G%s#W",GetName(sceneId,maleId))
			return GetRandomQuestionsIndex(x888901_g_MaleType),nm
		end
	else
		return GetRandomQuestionsIndex(x888901_g_FemaleType),nm
	end
end

-- 发送一个问题给客户端
function x888901_SendCoupleQuestion(sceneId,userId,targetId,question,qtype,act)
	local bStart,qmax,qcur,privity,maxprivity,samenum = GetCoupleQuestionState(sceneId,userId)
	if bStart > 0 then
		local con,opt0,opt1,opt2=GetQuestionsRecord(question)
		con = format(con,qtype)
		local coupleId = GetCoupleID(sceneId,userId)
		
		local rpos = random(1,getn(x888901_g_OptPos))
		local pt = x888901_g_OptPos[rpos]
	
		if act == "timeout" then privity=0 end
		if act == "oknext" then 
			privity=privity+1
			samenum=samenum+1
			LuaFnSendSpecificImpactToUnit(sceneId,userId,userId,userId,51,100)
		end
		if act == "failnext" then privity=0 end
		if act == "start" then qcur=0 else qcur=qcur+1 end
	
		--已经没有题可答了
		if qcur == qmax then
			--发送特殊奖励
				if qmax == 100 and privity == 100 and bStart > 0 then
				x888901_SendCoupleQuestionPrize(sceneId,userId,coupleId)
			end
			--通知客户端结束答题
			NextCoupleQuestion(sceneId,userId,qcur,privity,samenum)
			x888901_StopCoupleQuestionScript(sceneId,userId,coupleId,"finish")
			return
		end
	
		--上一题的回答情况
		local premsg = x888901_g_AnswerState[act]
		if not premsg then
			premsg = x888901_g_AnswerState["cancel"]
		end
		
		--通知客户端显示题目
		BeginUICommand(sceneId)
			UICommand_AddString(sceneId,act)
			UICommand_AddInt(sceneId,targetId)
			UICommand_AddInt(sceneId,qmax) --总题数
			UICommand_AddInt(sceneId,qcur+1) --当前题数
			UICommand_AddInt(sceneId,privity) --默契度
			UICommand_AddString(sceneId,con)	--问题
			UICommand_AddInt(sceneId,3)			--答案数量
			UICommand_AddString(sceneId,opt0)	--答案1
			UICommand_AddString(sceneId,opt1)	--答案2
			UICommand_AddString(sceneId,opt2)	--答案3
			UICommand_AddInt(sceneId,pt[1])	--显示位置1
			UICommand_AddInt(sceneId,pt[2]) --显示位置2
			UICommand_AddInt(sceneId,pt[3]) --显示位置3
			UICommand_AddString(sceneId,premsg)	--上一题的回答情况
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,userId, x888901_g_ScriptId)
	
		--修改服务器端数据状态
		NextCoupleQuestion(sceneId,userId,qcur,privity,samenum)
		SetCurCoupleQuestion(sceneId,userId,question,3,-1)
	end
end

function x888901_SendCoupleQuestionPrize(sceneId,userId,coupleId)
	if coupleId>=0 then
		--发userId物品
		LuaFnBeginAddItem( sceneId )
		LuaFnAddItem( sceneId, x888901_g_Item, 1)
		local uret = LuaFnEndAddItem( sceneId, userId )
		if 1 == uret then
			AddItemListToHuman(sceneId,userId)
		end
		--发coupleId物品
		LuaFnBeginAddItem( sceneId )
		LuaFnAddItem( sceneId, x888901_g_Item, 1)
		local oret = LuaFnEndAddItem( sceneId, coupleId )
		if 1 == oret then
			AddItemListToHuman(sceneId,coupleId)
		end
		--发公告
		if 1 == oret and 1 == uret then
			local uname = format("#{_INFOUSR%s}",GetName(sceneId,userId))
			local oname = format("#{_INFOUSR%s}",GetName(sceneId,coupleId))
			local itemt = format("#{_INFOMSG%s}",GetItemTransfer(sceneId,coupleId,0))
			local str = format("%s#I c鵱g %s#I t読 ch� Nguy畉 L鉶 � L誧 D呓ng ti猲 h鄋h th� nghi甿 #RLinh T�#I. K猼 qu� l� v� ch皀g 鸢ng t鈓 鸢ng l㱮. Nguy畉 L鉶 d鄋h ri阯g %s th叻ng cho.",uname,oname,itemt)
			BroadMsgByChatPipe(sceneId, userId, str, 4)
		end
	end
end

-- 夫妻答题客户端接口(客户端调用)
function x888901_CoupleQuestion_ClientAction(sceneId,selfId,op,num,sequence)--modi:lby 增加题号检验检验当前问题是否是正在答题
	if nil == op or 1 > op then return end
	local client_op = x888901_g_ClientOp[op]
	
	if client_op == "answer" then
		x888901_ClientAnswerCoupleQuestion(sceneId,selfId,num,sequence)
	elseif client_op == "clientstop" then
		x888901_ClientStopCoupleQuestion(sceneId,selfId)
	elseif client_op == "askstop" then
		x888901_AskClientRealStop(sceneId,selfId)
	end
end

-- 客户端回答问题
function x888901_ClientAnswerCoupleQuestion(sceneId,selfId, num, sequence)--modi:lby 增加题号检验检验当前问题是否是正在答的题
	local bStart,_,qcur,privity = GetCoupleQuestionState(sceneId,selfId)
	if bStart>0 then
		local cq,_,_ = GetCurCoupleQuestion(sceneId,selfId)
		local ca = num
		local coupleId = GetCoupleID(sceneId,selfId)
		
		if coupleId>=0 and cq>=0 then
			local _,_,ocur,_ = GetCoupleQuestionState(sceneId,coupleId)
			local oq,_,oa = GetCurCoupleQuestion(sceneId,coupleId)
			--检查题是否相同
			if oq ~= cq or sequence ~= qcur+1 or ocur ~= qcur then		--modi:lby 增加题号检验
				--x888901_StopCoupleQuestionScript(sceneId,selfId,coupleId) --modi:lby 因为可能多次提交会有题的能容不相同不能退出
				return
			end
			
			local act = "failnext"
			--检查答案是否相同
			if oa <= 0 then
				SetCurCoupleQuestion(sceneId,selfId,cq,3,ca)
				return
			elseif oa == ca then
				act = "oknext"
			end
			--获得经验值
			if act == "oknext" then
				local cexp = floor(x888901_CaculPrivityExp(sceneId,selfId,privity))
				AddExp(sceneId,selfId,cexp)
				local oexp = floor(x888901_CaculPrivityExp(sceneId,coupleId,privity))
				AddExp(sceneId,coupleId,oexp)

				local tip_part1 = "Ch鷆 m譶g, 疳p 醤 gi痭g nhau, 2 ng呓i 皤u 鹫t 疬㧟 kinh nghi甿 th叻ng "
				local tip_part2 = "餴琺!"
				
				x888901_NotifySystemMsg(sceneId,selfId,act,tip_part1..tostring(cexp)..tip_part2)
				x888901_NotifySystemMsg(sceneId,coupleId,act,tip_part1..tostring(oexp)..tip_part2)
			else
				x888901_NotifySystemMsg(sceneId,selfId,act)
				x888901_NotifySystemMsg(sceneId,coupleId,act)
			end
			--继续发送问题
			local question,qtype = x888901_RandomQuestion(sceneId,selfId)	
			x888901_SendCoupleQuestion(sceneId,selfId,-1,question,qtype,act)
			x888901_SendCoupleQuestion(sceneId,coupleId,-1,question,qtype,act)
		else
			--对方已经结束答题，则自己也要结束
			x888901_StopCoupleQuestionScript(sceneId,selfId,coupleId)
		end
	end
end

-- 答题经验值计算
-- 基础奖励=c*LV*LV
-- 每题实得奖励=基础奖励*（1+N*a）
-- c为奖励值计算参数，默认为0.573
-- LV为答题者等级
-- N为答该题时的默契指数值
-- a为答题时的经验加成系数，默认为0.01

function x888901_CaculPrivityExp(sceneId,userId,privity)
	local c = 0.573
	local a = 0.01
	local LV = GetLevel(sceneId,userId)
	local N = privity
	
	local baseExp=c*LV*LV
	local Exp=baseExp*(1+N*0.01)
	
	--print("x888901_CaculPrivityExp selfId="..tostring(userId).." baseExp="..tostring(baseExp).." Exp="..tostring(Exp))
	return Exp;
end
-- 询问客户端是否结束
function x888901_AskClientRealStop(sceneId,selfId)
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x888901_g_ScriptId);
		UICommand_AddInt(sceneId,2)
		UICommand_AddString(sceneId,"CoupleQuestion_ClientAction");
		UICommand_AddString(sceneId,"N猽 h鼀 b�, th� nghi甿 n鄖 s� ch d裻. Ng呓i x醕 鸶nh sao?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
end
-- 客户端结束
function x888901_ClientStopCoupleQuestion(sceneId,selfId)
	local coupleId = GetCoupleID(sceneId,selfId)
	x888901_StopCoupleQuestionScript(sceneId,selfId,coupleId,"clientstop")
end

-- 答题Th秈 gian ch�
function x888901_AnswerQuestionTimeOut(sceneId,selfId,coupleId)
	local question,qtype = x888901_RandomQuestion(sceneId,selfId)
	
	x888901_NotifySystemMsg(sceneId,selfId,"timeout")
	x888901_SendCoupleQuestion(sceneId,selfId,-1,question,qtype,"timeout")
	
	x888901_NotifySystemMsg(sceneId,coupleId,"timeout")
	x888901_SendCoupleQuestion(sceneId,coupleId,-1,question,qtype,"timeout")
	--print("x888901_AnswerQuestionTimeOut "..tostring(selfId))
end

-- 停止夫妻双方答题
function x888901_StopCoupleQuestionScript(sceneId,selfId,coupleId,act)
	local bStart,qmax,_,_,maxprivity,samenum = GetCoupleQuestionState(sceneId,selfId)
	local tipm = ""
	
	if bStart > 0 then
		tipm = format("Th� nghi甿 t眓g c祅g c� %d c鈛. Phu th� c醕 ng呓i 疳p 瘊ng %d c鈛. 械 錸 � c 鹫t t緄 %d c鈛!", qmax,samenum,maxprivity)
	end
	
	--统计所有结束的信息
	if coupleId >= 0 then
		if act == "finish" then
			x888901_LogCoupleAction(sceneId,selfId,coupleId,COUPLE_LOG_FINISHQUESTION)
		else
			x888901_LogCoupleAction(sceneId,selfId,coupleId,COUPLE_LOG_STOPQUESTION)
		end
	end
	
	StopCoupleQuestion(sceneId,selfId)
	x888901_SendStopCoupleQuestion(sceneId,selfId,act,tipm)
	
	if coupleId>=0 then 
		StopCoupleQuestion(sceneId,coupleId)
		x888901_SendStopCoupleQuestion(sceneId,coupleId,act,tipm)
	end
end

-- 取消客户端的显示
function x888901_SendStopCoupleQuestion(sceneId,userId,act,tip)
	if act then
		x888901_NotifySystemMsg(sceneId,userId,act,tip)
	else
		x888901_NotifySystemMsg(sceneId,userId,"cancel",tip)
	end
	
	BeginUICommand(sceneId)
		UICommand_AddString(sceneId,"cancel")
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,userId, x888901_g_ScriptId)
end

-- 系统提示
function x888901_NotifySystemMsg(sceneId,selfId,txtId,tip)
	BeginEvent(sceneId)
	if txtId == "err_noteam" then
		AddText(sceneId,"Ph鋓 c� m祎 t� 鸬i m緄 c� th� ti猲 h鄋h tham gia!")
	elseif txtId == "err_musttwo" then
		AddText(sceneId,"Ph鋓 l� phu th� 2 ng叨i m祎 t� 鸬i.")
	elseif txtId == "err_mustnear" then
		AddText(sceneId,"Phu th� 2 ng叨i ph鋓 � g 疴y!")
	elseif txtId == "err_nomarry" then
		AddText(sceneId,"Ph鋓 l� phu th� 2 ng叨i m祎 t� 鸬i.")
	elseif txtId == "err_mustcouple" then
		AddText(sceneId,"Ph鋓 l� phu th� 2 ng叨i m祎 t� 鸬i.")
	elseif txtId == "err_mustleader" then
		AddText(sceneId,"Ph鋓 l� 鸬i tr叻ng m緄 c� th� quy猼 鸶nh tham gia!")
	elseif txtId == "err_already" then
		AddText(sceneId,"C醕 ng呓i h鬽 nay 疸 tham gia ho誸 鸬ng n鄖 r癷!")
	elseif txtId == "timeout" then
		AddText(sceneId,"秀 h猼 th秈 gian ch�!")
	elseif txtId == "directmarry" then
		AddText(sceneId,"Tr馽 ti猵 k猼 h鬾 th鄋h c鬾g!")
	elseif txtId == "cancel" then
		AddText(sceneId,"Thi阯 h鎢 b tr phong v鈔, th� nghi甿 疸 k猼 th鷆!"..tip)
	elseif txtId == "finish" then
		AddText(sceneId,"C醕 ng呓i 疸 ho鄋 th鄋h th� nghi甿"..tip)
	elseif txtId == "clientstop" then
		AddText(sceneId,"C醕 ng呓i 疸 ng譶g tham gia th� nghi甿"..tip)
	elseif txtId == "oknext" then
		AddText(sceneId,tip)
	elseif txtId == "failnext" then
		AddText(sceneId,"Th 疳ng ti猚, 疳p 醤 c黙 phu th� 疬a ra b 鸢ng v緄 nhau. Th飊h l sau c� gg!")
	elseif txtId == "err_notday" then
		AddText(sceneId,"H鬽 nay c醕 ng叨i kh鬾g th� tham gia th� nghi甿")
	elseif txtId == "err_samemac" then
		AddText(sceneId,"C醕 h� v� 鸠i ph呓ng kh鬾g th� s� d鴑g c鵱g m祎 m醳 vi t韓h 瓞 th� nghi甿")
	end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--统计信息
function x888901_LogCoupleAction(sceneId,tid1,tid2,logid)
	local bStart,qmax,_,_,maxprivity = GetCoupleQuestionState(sceneId,tid1)
	--print(tostring(bStart).." "..tostring(logid).." "..tostring(COUPLE_LOG_DETAIL[logid]))
	if bStart > 0 and logid and COUPLE_LOG_DETAIL[logid] then		
		local maleId = tid1
		local femaleId = tid2
		if GetSex(sceneId,tid1) == 0 then
			maleId = tid2
			femaleId = tid1
		end
		
		--CPL:编号,说明,GUID1,GUID2,总题数,最大默契数,时间
		local logstr = format("CPL:%d,%s,0x%X,0x%X,%d,%d",
									 				logid,
									 				COUPLE_LOG_DETAIL[logid],
									 				LuaFnGetGUID(sceneId,maleId),
									 				LuaFnGetGUID(sceneId,femaleId),
									 				qmax,
									 				maxprivity)
		LogCouple(logstr)
	end
end
