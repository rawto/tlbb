--001230

-- 报名进入Hoa S絥 Lu Ki猰的场景

--************************************************************************
--MisDescBegin
--脚本号
x001230_g_ScriptId = 1230

--事件
x001230_g_Update = {

    ["id01"] = 0,
    ["id02"] = 20,
    ["id03"] = 30,

}

--提示信息
x001230_g_msg = {

    ["cj"]	= "Tham gia Hoa S絥 lu ki猰",
    ["jl"]	= "Nh l頽h ph th叻ng Lu Ki猰 Hoa S絥",
    ["Mail"]	= "C醕 gi鋓 th叻ng",

}

--活动编号,这个数字需要和活动表中的对应
--其中的数据的第0位位置用来表示活动是否开启
x001230_g_nActivityId = 9

-- 这个活动其实不需要创建副本，直接把所有的人，放入一个场景就可以了 
x001230_g_nScnenId = 125

-- 现在是不是活动计数时间的标志
x001230_g_bHuashaning = 0

-- 9个门派的杀人数
x001230_g_nMenpaikills = {{id=0,kill=0},
													{id=1,kill=0},
													{id=2,kill=0},
													{id=3,kill=0},
													{id=4,kill=0},
													{id=5,kill=0},
													{id=6,kill=0},
													{id=7,kill=0},
													{id=8,kill=0},}

-- [ QUFEI 2007-07-27 17:27 UPDATE ]
-- 9个门派前三名的玩家ID		
-- 参数 take 表示该玩家是否领过奖励
x001230_g_nMenpaiQiansan = {{id=0,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},
													  {id=1,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},
													  {id=2,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},
													  {id=3,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},
												    {id=4,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},
													  {id=5,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},
													  {id=6,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},
													  {id=7,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},
													  {id=8,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},}

-- [ QUFEI 2007-07-27 17:27 UPDATE ]
-- 门派高级时装奖励
x001230_g_nMenpaiShiZhuang = {{id=10141155,name="Kh鬾g S"},
															{id=10124010,name="Th醤h H鯽"},
															{id=10124011,name="B韈h M"},
															{id=10124013,name="H誧 Tuy猼"},
															{id=10124012,name="Kh 膎h"},
															{id=10124014,name="Hung L誧"},
															{id=10124017,name="D呓ng Ti陁"},
															{id=10124015,name="Nguy畉 M課"},
															{id=10124016,name="Huy玭 Th呓ng"},}
															
-- 材料奖励
x001230_g_nCailiaoJiangli	 = {{id=20500007,name="Tinh Thi猼 To醝 Phi猲"},
															{id=20501000,name="Mi猲g V鋓 B鬾g V鴑"},
															{id=20502000,name="B� Ng鈔 To醝 Phi猲"},}

x001230_g_bEndTime = 0
x001230_g_bMenpai = ""

x001230_g_WorldGlobal = 21

x001230_g_PlayerKc = {}				-- 每个玩家杀人的数目
x001230_g_PlayerName = {}			-- 每个玩家的名字
x001230_g_PlayerNum = 0				-- 玩家数目

--[ QUFEI 2007-07-27 15:04 UPDATE ]
x001230_g_PlayerMenpai = {}		-- 每个玩家的门派
x001230_g_PlayerId = {}

x001230_g_PreTime = 0


--场景中央的2个秘籍刷新点....
x001230_g_MJPosA = {
	{x=135, y=125},{x=141, y=123}
}

--场景四周的6个秘籍刷新点....
x001230_g_MJPosB = {
	{x=143, y=140, rand=-1},
	{x=153, y=121, rand=-1},
	{x=150, y=110, rand=-1},
	{x=138, y=104, rand=-1},
	{x=125, y=107, rand=-1},
	{x=120, y=111, rand=-1},
	{x=122, y=132, rand=-1},
	{x=131, y=138, rand=-1}
}

--秘籍表....
x001230_g_MJTblA = {
	5009,5010
}

--秘籍表....
x001230_g_MJTblB = {
	5004,5005,5006,5007,5008
}

x001230_g_MJNameTbl = {
	"T� S B� K韕",
	"Ho鄋g S B� K韕",
	"L鴆 S B� K韕",
	"B誧h S B� K韕",
	"H S B� K韕",
	"Lam S B� K韕",
	"H皀g S B� K韕"
}

--秘籍脚本....
x001230_g_MJScript = 001235


--**********************************
--任务入口函数
--**********************************
function x001230_OnDefaultEvent( sceneId, selfId, targetId )
	
    local	key	= GetNumText()

	if key == x001230_g_Update["id01"] then
		if LuaFnHasTeam( sceneId, selfId ) ~= 0  then
			BeginEvent(sceneId)
				AddText(sceneId,"#BHoa S絥 Lu Ki猰");
				AddText(sceneId,"Xin h銀 r秈 kh鰅 t� 鸬i r癷 h銀 b醥 danh tham gia.");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			return 0
		end
    
        -- 0，处于双人骑乘状态的人，不能报名
        if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
            BeginEvent(sceneId)
                AddText(sceneId,"#BHoa S絥 Lu Ki猰");
                AddText(sceneId,"Trong tr課g th醝 c咿i th� c咿i 2 ng叨i, kh鬾g th� b醥 danh tham gia Lu Ki猰 Hoa S絥.");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            
            return 0
        end

        -- 1,人物等级高于30
        if GetLevel(sceneId, selfId) < 30  then
            BeginEvent(sceneId)
                AddText(sceneId,"#BHoa S絥 Lu Ki猰");
                AddText(sceneId,"Tham gia Hoa S絥 lu ki猰 nh thi猼 ph鋓 t� c 30 tr� l阯, c醕 h� kh鬾g 瘘, xin 瘙i sau khi 鹫t t緄 c 30 l読 t緄 t靘 ta");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            
            return 0
        end

        -- 2,检测活动是不是已经开始了，如果已经开始，就不能再进去了
        local nWeek = GetTodayWeek()
        if (nWeek==0 or nWeek==4 or nWeek==2) ~= 1  then
            BeginEvent(sceneId)
                AddText(sceneId,"#BHoa S絥 Lu Ki猰");
                AddText(sceneId,"  现在不是参加Hoa S絥 Lu Ki猰的报名时间，请于周二、周四和周日再来。");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            
            return
        end
        
        -- 3,时间检测，接受报名的时间，8点到8点30分
        --begin modified by zhangguoxin 090207
        --local nHour = GetHourTime()
        --local temp = floor(nHour/100)*100
        --PrintNum(nHour-temp)
        --if ((nWeek==0) and (nHour-temp<60 or nHour-temp>=62)) or 
        --     ( (nWeek==2 or nWeek==4) and (nHour-temp<76 or nHour-temp>=78))  then		--报名时间2 4的19:00-19:30，日的15:00-15:30
        local nQuarter = mod(GetQuarterTime(),100);
        if ((nWeek==0) and (nQuarter < 60 or nQuarter >= 62 )) or 
             ( (nWeek==2 or nWeek==4) and (nQuarter < 76 or nQuarter >= 78))  then		--报名时间2 4的19:00-19:30，日的15:00-15:30
        --end modified by zhangguoxin 090207
            BeginEvent(sceneId)
                AddText(sceneId,"#BHoa S絥 Lu Ki猰");
                AddText(sceneId,"Hi畁 kh鬾g ph鋓 l� th秈 gian b醥 danh Lu Ki猰 Hoa S絥, xin h銀 瘙i 皙n th� 3, th� 5 v� ch� nh h銀 皙n 疴y.");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            
            return
        end

        -- 4,人数检测,使用活动数据区的数据来保存这些数据
        local nMenpai = LuaFnGetMenPai(sceneId, selfId)
        
        if nMenpai == 9   then
            BeginEvent(sceneId)
                AddText(sceneId,"#BHoa S絥 Lu Ki猰");
                AddText(sceneId,"Xin l瞚, ng呓i kh鬾g c� m鬾 ph醝, sao l読 ki猰 疬㧟 t緄 c 30!!");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            return 0
        end
        
        local nPeopleNum = GetActivityParam(sceneId, x001230_g_nActivityId, nMenpai)
        -- a,检测玩家所在门派是不是已经有10人了，
        if nPeopleNum < 10 then
            -- 他可以进入
        elseif nPeopleNum >=10 and nPeopleNum < 30  then
            -- 判断是不是人数最多的门派，
            for i=0, 8   do
                if nMenpai ~= i   then
                    if GetActivityParam(sceneId, x001230_g_nActivityId, nMenpai) >= nPeopleNum  then
                        --可以进入
                    end
                end
            end
            -- 需要等待别的门派＋人后进入
            BeginEvent(sceneId)
                AddText(sceneId,"#BHoa S絥 Lu Ki猰");
                AddText(sceneId,"Xin l瞚, l唼ng ng叨i tham d� qu� m鬾 ph醝 c黙 Hoa S絥 lu ki猰 l n鄖 qu� 痿ng. Ph鋓 瘙i c醕 m鬾 ph醝 kh醕 v鄌 xong m緄 疬㧟 v鄌");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            return 0
            
        elseif nPeopleNum >= 30  then
            BeginEvent(sceneId)
                AddText(sceneId,"#BHoa S絥 Lu Ki猰");
                AddText(sceneId,"Xin l瞚, l唼ng ng叨i tham d� qu� m鬾 ph醝 疸 馥y 30 m課g");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            return 0
        end
        -- 其他的一些可以进入Hoa S絥 Lu Ki猰的判定
        -- PrintNum(selfId)
        -- local Name = GetName(sceneId, selfId)
        -- LuaFnSendSystemMail( sceneId, Name, "mail test" )
        -- 注意，这个系统是不创建副本的，直接进入场景就可以了
        local nPos_X;
        local nPos_Z;
        
        if nMenpai == 0  then
            nPos_X = 134
            nPos_Z = 18
        elseif nMenpai == 1   then
            nPos_X = 22
            nPos_Z = 123
        elseif nMenpai == 2   then
            nPos_X = 236
            nPos_Z = 108
        elseif nMenpai == 3   then
            nPos_X = 193
            nPos_Z = 233
        elseif nMenpai == 4   then
            nPos_X = 93
            nPos_Z = 236
        elseif nMenpai == 5   then
            nPos_X = 236
            nPos_Z = 174
        elseif nMenpai == 6   then
            nPos_X = 23
            nPos_Z = 182
        elseif nMenpai == 7   then
            nPos_X = 48
            nPos_Z = 34
        elseif nMenpai == 8   then
            nPos_X = 228
            nPos_Z = 38
        elseif nMenpai == 9   then
            nPos_X = 100
            nPos_Z = 100
        end
        
        -- [ QUFEI 2007-07-30 18:31 UPDATE ]
        -- 清空奖励标记
        -- PrintNum(selfId)
        SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 0 )
        SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 0 )
        SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 0 )
        
        CallScriptFunction((400900), "TransferFunc",sceneId, selfId, x001230_g_nScnenId, nPos_X, nPos_Z)
        --活动统计
        LuaFnAuditQuest(sceneId, selfId, "Hoa S絥 Lu Ki猰")
   
   elseif key == x001230_g_Update["id02"] then
        -- Hoa S絥 Lu Ki猰奖励 周日：16:00-17:00 周2、周4：20:00-21:00
        local nWeek = GetTodayWeek()
        --begin modified by zhangguoxin 090207
				--local nHour = GetHourTime()
				--local temp = floor(nHour/100)*100
				--if ((nWeek==0) and (nHour-temp<68 and nHour-temp>=64)) or 
        --    ( (nWeek==2 or nWeek==4) and (nHour-temp<84 and nHour-temp>=80))  then
        local nQuarter = mod(GetQuarterTime(),100);
        if ( (nWeek==0) and (nQuarter < 68 and nQuarter >= 64) ) 
        	or( (nWeek==2 or nWeek==4) and (nQuarter < 84 and nQuarter >= 80) )  then
        --end modified by zhangguoxin 090207
            x001230_OnHuashanJiangli( sceneId, selfId, targetId )
            return 0
        else            
            x001230_MyMsgBox( sceneId, selfId, "秀 qua th秈 gian nh鈔 l頽h ph th叻ng Lu Ki猰 Hoa S絥, h銀 瘙i khi 瘙i ho誸 鸬ng k猼 th鷆 trong v騨g 1 gi� h銀 皙n t靘 ta." )
            return 0		
        end
   elseif key == x001230_g_Update["id03"] then
   			
   			local index01 =	GetMissionFlag( sceneId, selfId, MF_LunjianJiangli01 )
				local index02 =	GetMissionFlag( sceneId, selfId, MF_LunjianJiangli02 )
				local index03 =	GetMissionFlag( sceneId, selfId, MF_LunjianJiangli03 )
   			   			
   			if ( index01 == 1 and index02 == 1 and index03 == 1 ) then
					BeginEvent(sceneId)
					local strText = "C醕 h� mu痭 nh th叻ng th� h銀 c� gg h絥. L sau 餺誸 gi鋓 nh 皙n t靘 ta s� 疬㧟 nh th叻ng 痼."
					AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)	
					
					return 0
   			end
   			
   			-- 检测SelfId是否有效
   			if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
					return 0
				end
				if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
					return 0
				end
   			
   			LuaFnAskNpcScriptMail(sceneId, selfId, MAIL_HUASHANJIANGLI)
   			
   			local strLogCheck = format(	"HuaShanLunJian_AskNpcScriptMail    id=%X, Param01=%d, Param02=%d, Param03=%d", LuaFnGetGUID(sceneId, selfId), index01, index02, index03 )
				LuaFnLogCheck(strLogCheck)
				
				return 0
   end
end


--**********************************
--列举事件
--**********************************
function x001230_OnEnumerate( sceneId, selfId, targetId )	
    AddNumText( sceneId, x001230_g_ScriptId, x001230_g_msg["cj"], 6, x001230_g_Update["id01"] )        
    
    --[ QUFEI 2007-07-27 11:13 UPDATE ]	
    --Hoa S絥 Lu Ki猰结束后一小时内领取奖励	周日：16:00-17:00 周2、周4：20:00-21:00
    local nWeek = GetTodayWeek()
    
    --begin modified by zhangguoxin 090207
    --local nHour = GetHourTime()
    --local temp = floor(nHour/100)*100
        
    --if ((nWeek==0) and (nHour-temp<68 and nHour-temp>=64)) or 
    --    ( (nWeek==2 or nWeek==4) and (nHour-temp<84 and nHour-temp>=80))  then
    local nQuarter = mod(GetQuarterTime(),100);    
    if ((nWeek==0) and (nQuarter < 68 and nQuarter >= 64)) or 
        ( (nWeek==2 or nWeek==4) and (nQuarter < 84 and nQuarter >= 80))  then
    --begin modified by zhangguoxin 090207
        AddNumText( sceneId, x001230_g_ScriptId, x001230_g_msg["Mail"], 6, x001230_g_Update["id03"] )
        AddNumText( sceneId, x001230_g_ScriptId, x001230_g_msg["jl"], 6, x001230_g_Update["id02"] )        
    end
    
end

--**********************************
--检测接受条件
--**********************************
function x001230_CheckAccept( sceneId, selfId )
	
end

--**********************************
--接受
--**********************************
function x001230_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x001230_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x001230_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--放弃
--**********************************
function x001230_OnAbandon( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x001230_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x001230_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x001230_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x001230_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x001230_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x001230_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--副本场景定时器事件
--**********************************
function x001230_OnCopySceneTimer( sceneId, nowTime )
	
end

--[ QUFEI 2007-07-27 11:13 UPDATE ]
--Hoa S絥 Lu Ki猰奖励事件
function x001230_OnHuashanJiangli( sceneId, selfId, targetId )
	--[ QUFEI 2007-07-27 11:18 UPDATE ]
	
	-- PrintStr(GetName(sceneId, selfId))	
	local name   	= GetName(sceneId, selfId)
	--向selfId所在的门派发送公告
	local strText = ""
	local menpai  = GetMenPai(sceneId, selfId)	
	menpai = menpai+1
	local temp		=	-1	
	local idx			= {}
	idx[1] = 0
	idx[2] = 0
	idx[3] = 0
	
	local strLogCheck = ""
		
	local	timeidx = GetMissionData( sceneId, selfId, MD_HUASHANJIANGLI_TIME )
	
	local nMonth = LuaFnGetThisMonth()
	local nDay   = LuaFnGetDayOfThisMonth()
	local nData  = (nMonth+1)*100+nDay
	local	timenow = LuaFnGetCurrentTime()
		
	if nData ~= 0 and nData ~= timeidx	then
		-- 该玩家领奖品超时
		SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 0 )
		SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 0 )
		SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 0 )
	end
	
	local index01 =	GetMissionFlag( sceneId, selfId, MF_LunjianJiangli01 )
	local index02 =	GetMissionFlag( sceneId, selfId, MF_LunjianJiangli02 )
	local index03 =	GetMissionFlag( sceneId, selfId, MF_LunjianJiangli03 )
	
	-- PrintNum(menpai)
	-- PrintNum(index01)
	-- PrintNum(index02)
	-- PrintNum(index03)
	
	-- 奖励标记	index01	index02	index03
	-- 奖励未取		0				0				0				(默认)
	-- 积分第一		0				0				1	
	-- 积分第二		0				1				0
	-- 积分第三		0				1				1
	-- 门派第一		1				0				0
	-- 门派第二		1				0				1
	-- 门派第三		1				1				0
	-- 奖励已取		1				1				1
	
	if ( index01 == 0 and index02 == 0 and index03 == 1 )
		 or ( index01 == 0 and index02 == 1 and index03 == 0 )
		 or ( index01 == 0 and index02 == 1 and index03 == 1 )
		 or ( index01 == 1 and index02 == 0 and index03 == 0 )
		 or ( index01 == 1 and index02 == 0 and index03 == 1 )
		 or ( index01 == 1 and index02 == 1 and index03 == 0 )
		 or ( index01 == 1 and index02 == 1 and index03 == 1 ) then
		 		if index01 == 1 and index02 == 1 and index03 == 1 then		 			
			 		BeginEvent(sceneId) 
					strText = "C醕 h� 疸 t譶g nh l頽h ph th叻ng, h銀 ti猵 t鴆 c� gg, l sau thg m緄 t靘 ta."
					AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)	
				else			 		
		 				if index01 == 0 and index02 == 0 and index03 == 1 then						 				
		 						BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nMenpaiShiZhuang[menpai].id, 1 )
								ret1 = EndAddItem( sceneId, selfId )
								
								BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nCailiaoJiangli[1].id, 3 )
								ret2 = EndAddItem( sceneId, selfId )
								
								if ret1 > 0 and ret2 > 0 then
								
										idx[1] = 0
										idx[2] = 0
										idx[3] = 0
										
										local	itemInfo	=	{}
										itemInfo[1]	=	""
										itemInfo[2]	=	""
										itemInfo[3]	=	""
										
										-- 奖励时装
										local bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nMenpaiShiZhuang[menpai].id, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
										local itemInfo01 = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--查询组日志
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nMenpaiShiZhuang[menpai].id, 1)
										LuaFnLogCheck(strLogCheck)
																				
										-- 强制绑定																													
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "V ph n鄖 疸 疬㧟 c� 鸶nh"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										-- 奖励材料
										temp = random(3)																								
										-- PrintNum(temp)
										-- PrintStr(x001230_g_nCailiaoJiangli[temp].name)
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--查询组日志
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- 强制绑定										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
																				
										if bindidx ~= 1 then
											local bindmsg = "V ph n鄖 疸 疬㧟 c� 鸶nh"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										-- PrintNum(idx[temp])
										
										temp = random(3)																				
										-- PrintNum(temp)
										-- PrintStr(x001230_g_nCailiaoJiangli[temp].name)
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )								
										
										--查询组日志
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- 强制绑定										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
																				
										if bindidx ~= 1 then
											local bindmsg = "V ph n鄖 疸 疬㧟 c� 鸶nh"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										-- PrintNum(idx[temp])
										
										temp = random(3)																											
										-- PrintNum(temp)
										-- PrintStr(x001230_g_nCailiaoJiangli[temp].name)
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )	
										
										--查询组日志
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)							
										
										-- 强制绑定										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
																				
										if bindidx ~= 1 then
											local bindmsg = "V ph n鄖 疸 疬㧟 c� 鸶nh"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										-- PrintNum(idx[temp])
										
										-- 该玩家领过奖品
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 1 )
										
										--向selfId所在的门派发送公告
										if idx[1] > 0 and idx[2] > 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d个#{_INFOMSG%s}，%d个#{_INFOMSG%s}，%d个#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[1], itemInfo[1], idx[2], itemInfo[2], idx[3], itemInfo[3] )
											-- PrintStr(strText)
										elseif idx[1] > 0 and idx[2] > 0 and idx[3] == 0 then
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d个#{_INFOMSG%s}，%d个#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[1], itemInfo[1], idx[2], itemInfo[2] )
											-- PrintStr(strText)
										elseif idx[1] > 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d个#{_INFOMSG%s}，%d个#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[1], itemInfo[1], idx[3], itemInfo[3] )
											-- PrintStr(strText)
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d个#{_INFOMSG%s}，%d个#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[2], itemInfo[2], idx[3], itemInfo[3] )
											-- PrintStr(strText)
										elseif idx[1] > 0 and idx[2] == 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d个#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[1], itemInfo[1] )
											-- PrintStr(strText)
										elseif idx[1] == 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d个#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[3], itemInfo[3] )
											-- PrintStr(strText)
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d个#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[2], itemInfo[2] )
											-- PrintStr(strText)
										end
										BroadMsgByChatPipe(sceneId,selfId, strText, 7)				 																			
								
								else
						 				BeginEvent(sceneId)
										strText = "C祎 v ph ho c祎 nguy阯 li畊 kh鬾g 瘘 ch� tr痭g, vui long s x猵 l読 r癷 h銀 皙n nh l頽h."
										AddText(sceneId,strText);
										EndEvent(sceneId)
										DispatchMissionTips(sceneId,selfId)
								end			 				
		 				elseif index01 == 0 and index02 == 1 and index03 == 0 then						 				
		 						BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nMenpaiShiZhuang[menpai].id, 1 )
								ret1 = EndAddItem( sceneId, selfId )
								
								BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nCailiaoJiangli[1].id, 2 )
								ret2 = EndAddItem( sceneId, selfId )
								
								if ret1 > 0 and ret2 > 0 then
										idx[1] = 0
										idx[2] = 0
										idx[3] = 0
										
										local	itemInfo	=	{}
										itemInfo[1]	=	""
										itemInfo[2]	=	""
										itemInfo[3]	=	""
										
										-- 奖励时装
										local bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nMenpaiShiZhuang[menpai].id, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
										local itemInfo01 = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--查询组日志
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nMenpaiShiZhuang[menpai].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- 强制绑定																													
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
																				
										if bindidx ~= 1 then
											local bindmsg = "V ph n鄖 疸 疬㧟 c� 鸶nh"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										-- 奖励材料
										temp = random(3)												
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--查询组日志
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- 强制绑定										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
																				
										if bindidx ~= 1 then
											local bindmsg = "V ph n鄖 疸 疬㧟 c� 鸶nh"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										
										temp = random(3)												
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--查询组日志
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- 强制绑定										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
																				
										if bindidx ~= 1 then
											local bindmsg = "V ph n鄖 疸 疬㧟 c� 鸶nh"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 1 )
																		
										--向selfId所在的门派发送公告
										if idx[1] > 0 and idx[2] > 0 and idx[3] == 0 then
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d个#{_INFOMSG%s}，%d个#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[1], itemInfo[1], idx[2], itemInfo[2] )
										elseif idx[1] > 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d个#{_INFOMSG%s}，%d个#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[1], itemInfo[1], idx[3], itemInfo[3] )
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d个#{_INFOMSG%s}，%d个#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[2], itemInfo[2], idx[3], itemInfo[3] )
										elseif idx[1] > 0 and idx[2] == 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d个#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[1], itemInfo[1] )
										elseif idx[1] == 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d个#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[3], itemInfo[3] )
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d个#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[2], itemInfo[2] )
										end
										BroadMsgByChatPipe(sceneId,selfId, strText, 7)				 											
						 		else
						 				BeginEvent(sceneId)
										strText = "C祎 v ph ho c祎 nguy阯 li畊 kh鬾g 瘘 ch� tr痭g, vui long s x猵 l読 r癷 h銀 皙n nh l頽h."
										AddText(sceneId,strText);
										EndEvent(sceneId)
										DispatchMissionTips(sceneId,selfId)
								end							 						 						 				 				
		 				elseif index01 == 0 and index02 == 1 and index03 == 1 then						 				
		 						BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nMenpaiShiZhuang[menpai].id, 1 )
								ret1 = EndAddItem( sceneId, selfId )
								
								BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nCailiaoJiangli[1].id, 1 )
								ret2 = EndAddItem( sceneId, selfId )
								
								if ret1 > 0 and ret2 > 0 then
										idx[1] = 0
										idx[2] = 0
										idx[3] = 0
										
										local	itemInfo	=	{}
										itemInfo[1]	=	""
										itemInfo[2]	=	""
										itemInfo[3]	=	""
										
										-- 奖励时装
										local bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nMenpaiShiZhuang[menpai].id, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
										local itemInfo01 = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--查询组日志
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nMenpaiShiZhuang[menpai].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- 强制绑定																													
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "V ph n鄖 疸 疬㧟 c� 鸶nh"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										-- 奖励材料
										temp = random(3)												
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--查询组日志
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- 强制绑定										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "V ph n鄖 疸 疬㧟 c� 鸶nh"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
					
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 1 )
																					
										--向selfId所在的门派发送公告
										if idx[1] > 0 and idx[2] == 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d个#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[1], itemInfo[1] )
										elseif idx[1] == 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d个#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[3], itemInfo[3] )
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d个#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[2], itemInfo[2] )
										end
										BroadMsgByChatPipe(sceneId,selfId, strText, 7)				 											
						 		else
						 				BeginEvent(sceneId)
										strText = "C祎 v ph ho c祎 nguy阯 li畊 kh鬾g 瘘 ch� tr痭g, vui long s x猵 l読 r癷 h銀 皙n nh l頽h."
										AddText(sceneId,strText);
										EndEvent(sceneId)
										DispatchMissionTips(sceneId,selfId)
								end								 								 			 				
		 				elseif index01 == 1 and index02 == 0 and index03 == 0 then						 				
		 						BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nCailiaoJiangli[1].id, 3 )
								ret = EndAddItem( sceneId, selfId )
								
								if ret > 0 then
										idx[1] = 0
										idx[2] = 0
										idx[3] = 0
										
										local	itemInfo	=	{}
										itemInfo[1]	=	""
										itemInfo[2]	=	""
										itemInfo[3]	=	""
										
										-- 奖励材料
										temp = random(3)												
										local bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--查询组日志
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- 强制绑定										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "V ph n鄖 疸 疬㧟 c� 鸶nh"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										
										temp = random(3)												
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )								
										
										--查询组日志
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- 强制绑定										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "V ph n鄖 疸 疬㧟 c� 鸶nh"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										
										temp = random(3)												
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )	
										
										--查询组日志
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)							
										
										-- 强制绑定										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "V ph n鄖 疸 疬㧟 c� 鸶nh"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 1 )
										
										--向selfId所在的门派发送公告
										if idx[1] > 0 and idx[2] > 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d个#{_INFOMSG%s}，%d个#{_INFOMSG%s}，%d个#{_INFOMSG%s}#{HSJL05}", name, idx[1], itemInfo[1], idx[2], itemInfo[2], idx[3], itemInfo[3] )
										elseif idx[1] > 0 and idx[2] > 0 and idx[3] == 0 then
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d个#{_INFOMSG%s}，%d个#{_INFOMSG%s}#{HSJL05}", name, idx[1], itemInfo[1], idx[2], itemInfo[2] )
										elseif idx[1] > 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d个#{_INFOMSG%s}，%d个#{_INFOMSG%s}#{HSJL05}", name, idx[1], itemInfo[1], idx[3], itemInfo[3] )
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d个#{_INFOMSG%s}，%d个#{_INFOMSG%s}#{HSJL05}", name, idx[2], itemInfo[2], idx[3], itemInfo[3] )
										elseif idx[1] > 0 and idx[2] == 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d个#{_INFOMSG%s}#{HSJL05}", name, idx[1], itemInfo[1] )
										elseif idx[1] == 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d个#{_INFOMSG%s}#{HSJL05}", name, idx[3], itemInfo[3] )
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d个#{_INFOMSG%s}#{HSJL05}", name, idx[2], itemInfo[2] )
										end
										BroadMsgByChatPipe(sceneId,selfId, strText, 7)				 											
						 		else
						 				BeginEvent(sceneId)
										strText = "C祎 v ph ho c祎 nguy阯 li畊 kh鬾g 瘘 ch� tr痭g, vui long s x猵 l読 r癷 h銀 皙n nh l頽h."
										AddText(sceneId,strText);
										EndEvent(sceneId)
										DispatchMissionTips(sceneId,selfId)
								end							 											 				
		 				elseif index01 == 1 and index02 == 0 and index03 == 1 then						 				
		 						BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nCailiaoJiangli[1].id, 2 )
								ret = EndAddItem( sceneId, selfId )
								
								if ret > 0 then
										idx[1] = 0
										idx[2] = 0
										idx[3] = 0
										
										local	itemInfo	=	{}
										itemInfo[1]	=	""
										itemInfo[2]	=	""
										itemInfo[3]	=	""
										
										-- 奖励材料
										temp = random(3)												
										local bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--查询组日志
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- 强制绑定										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "V ph n鄖 疸 疬㧟 c� 鸶nh"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										
										temp = random(3)												
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--查询组日志
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- 强制绑定										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "V ph n鄖 疸 疬㧟 c� 鸶nh"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
													
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 1 )
													
										--向selfId所在的门派发送公告
										if idx[1] > 0 and idx[2] > 0 and idx[3] == 0 then
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d个#{_INFOMSG%s}，%d个#{_INFOMSG%s}#{HSJL05}", name, idx[1], itemInfo[1], idx[2], itemInfo[2] )
										elseif idx[1] > 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d个#{_INFOMSG%s}，%d个#{_INFOMSG%s}#{HSJL05}", name, idx[1], itemInfo[1], idx[3], itemInfo[3] )
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d个#{_INFOMSG%s}，%d个#{_INFOMSG%s}#{HSJL05}", name, idx[2], itemInfo[2], idx[3], itemInfo[3] )
										elseif idx[1] > 0 and idx[2] == 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d个#{_INFOMSG%s}#{HSJL05}", name, idx[1], itemInfo[1] )
										elseif idx[1] == 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d个#{_INFOMSG%s}#{HSJL05}", name, idx[3], itemInfo[3] )
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d个#{_INFOMSG%s}#{HSJL05}", name, idx[2], itemInfo[2] )
										end
										BroadMsgByChatPipe(sceneId,selfId, strText, 7)				 											
						 		else
						 				BeginEvent(sceneId)
										strText = "C祎 v ph ho c祎 nguy阯 li畊 kh鬾g 瘘 ch� tr痭g, vui long s x猵 l読 r癷 h銀 皙n nh l頽h."
										AddText(sceneId,strText);
										EndEvent(sceneId)
										DispatchMissionTips(sceneId,selfId)
								end							 									 				 				
		 				elseif index01 == 1 and index02 == 1 and index03 == 0 then
		 						BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nCailiaoJiangli[1].id, 1 )
								ret = EndAddItem( sceneId, selfId )
					
								if ret > 0 then
										idx[1] = 0
										idx[2] = 0
										idx[3] = 0
										
										local	itemInfo	=	{}
										itemInfo[1]	=	""
										itemInfo[2]	=	""
										itemInfo[3]	=	""
										
										-- 奖励材料
										temp = random(3)												
										local bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--查询组日志
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- 强制绑定										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "V ph n鄖 疸 疬㧟 c� 鸶nh"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 1 )
													
										--向selfId所在的门派发送公告
										if idx[1] > 0 and idx[2] == 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d个#{_INFOMSG%s}#{HSJL05}", name, idx[1], itemInfo[1] )
										elseif idx[1] == 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d个#{_INFOMSG%s}#{HSJL05}", name, idx[3], itemInfo[3] )
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d个#{_INFOMSG%s}#{HSJL05}", name, idx[2], itemInfo[2] )
										end
										BroadMsgByChatPipe(sceneId,selfId, strText, 7)				 											
						 		else
						 				BeginEvent(sceneId)
										strText = "C祎 v ph ho c祎 nguy阯 li畊 kh鬾g 瘘 ch� tr痭g, vui long s x猵 l読 r癷 h銀 皙n nh l頽h."
										AddText(sceneId,strText);
										EndEvent(sceneId)
										DispatchMissionTips(sceneId,selfId)
								end							 							 				
		 				end				 		
				end				 
	else
		BeginEvent(sceneId)
		strText = "Xin l瞚, l n鄖 c醕 h� kh鬾g 鹫t 疬㧟 th鄋h t韈h 3 th� h課g 馥u r癷 l sau h銀 c� gg h絥 n鎍."
		AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)						
	end		
			
end

--**********************************
--Hoa S絥 Lu Ki猰场景定时器事件
--**********************************
function x001230_OnHuashanSceneTimer( sceneId, selfId )

	local nNowTimeEX = LuaFnGetCurrentTime()
	if x001230_g_bEndTime ~= 0 and nNowTimeEX > x001230_g_bEndTime+60    then
		
		BroadMsgByChatPipe(sceneId,0,"@*;SrvMsg;SCA:" .. "#PTrong l Lu Ki猰 Hoa S絥 n鄖, #Y" .. x001230_g_bMenpai .. "#P tr鋓 qua nh鎛g n� l馽, cu痠 c鵱g 疸 鹫t 疬㧟 vinh quang,#Y Lu Ki猰 Hoa S絥 h課g nh#P, 瓞 kh韈h l�, t c� 甬 t� m鬾 h� m瞚 ng鄖 s� 疬㧟 tg th叻ng #Yg 3 l kinh nhi甿#W khi l鄊 v騨g nhi甿 v� s� m鬾 馥u ti阯 cho 皙n k� Lu Ki猰 Hoa S絥 l sau k猼 th鷆.",4)
		
		local mingci = 1
		local str = ""
		local MenpaiTbl = {	"Thi猽 L鈓",
												"Minh Gi醥",
												"C醝 Bang",
												"V� 衋ng",
												"Nga My",
												"Ti陁 Dao",
												"Thi阯 Long",
												"Thi阯 S絥",
												"Tinh T鷆"	}
		
		-- 在所有选手中找到前5名
		for i=1, x001230_g_PlayerNum  do				
			if mingci == 1  then
					str = "Gi鋓 nh: " .. x001230_g_PlayerName[i] .. "#Y[" .. MenpaiTbl[x001230_g_PlayerMenpai[i]+1] .. "]"
					mingci = 2					
			elseif mingci == 2  then
					str = "Gi鋓 nh�: " .. x001230_g_PlayerName[i]	.. "#Y[" .. MenpaiTbl[x001230_g_PlayerMenpai[i]+1] .. "]"					
					mingci = 3											
			elseif mingci == 3  then
					str = "Gi鋓 ba: " .. x001230_g_PlayerName[i] .. "#Y[" .. MenpaiTbl[x001230_g_PlayerMenpai[i]+1] .. "]"
					mingci = 4
			elseif mingci == 4  then
					str = "Gi鋓 t�: " .. x001230_g_PlayerName[i] .. "#Y[" .. MenpaiTbl[x001230_g_PlayerMenpai[i]+1] .. "]"
					mingci = 5					
			elseif mingci == 5  then
					str = "Gi鋓 n錷: " .. x001230_g_PlayerName[i] .. "#Y[" .. MenpaiTbl[x001230_g_PlayerMenpai[i]+1] .. "]"
					mingci = 6							
			elseif mingci == 6  then
					break
			end
			
			-- 向全组服务器发送新闻公告
			AddGlobalCountNews ( sceneId, str )
		end
		
		x001230_g_PlayerNum = 0
		x001230_g_bEndTime = 0
	end
		
	-- 检测这个场景内是不是有玩家，如果没有，直接返回
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	if nHumanNum == 0  then
		return
	end
	
	--检测当前是不是Hoa S絥 Lu Ki猰的活动时间，如果不是，就把场景内的所有玩家都T出去
	local bIsTime = 1
	
	local nWeek = GetTodayWeek()
	if (nWeek==0 or nWeek==4 or nWeek==2) ~= 1  then
		bIsTime = 0
	end
	
	--begin modified by zhangguoxin 090207
	--local nHour = GetHourTime()
	--local temp = floor(nHour/100)*100
	
	--	if nHour - temp < 60  or nHour - temp >= 64   then
	--  正式活动时间 周日：15:00-16:00 周2、周4：19:00-20:00
	--if ((nWeek==0) and (nHour-temp<60 or nHour-temp>=64)) or 
	--	 ( (nWeek==2 or nWeek==4) and (nHour-temp<76 or nHour-temp>=80))  then
	local nQuarter = mod(GetQuarterTime(),100);
		 
	if ((nWeek==0) and (nQuarter < 60 or nQuarter >= 64)) or 
		 ( (nWeek==2 or nWeek==4) and (nQuarter < 76 or nQuarter >= 80))  then
	--begin modified by zhangguoxin 090207
		bIsTime = 0
	end
	
	if bIsTime == 1   then
		if x001230_g_bHuashaning == 0   then
			x001230_g_bHuashaning = 1
			-- 开是一次新的活动前，需要清理杀人计数器
			
			for i=1 ,400  do
				x001230_g_PlayerKc[i] = 0
				x001230_g_PlayerName[i] = ""
				
				--[ QUFEI 2007-07-27 15:04 UPDATE ]
				x001230_g_PlayerMenpai[i] = -1
				x001230_g_PlayerId[i] = 0
			end
			x001230_g_PlayerNum = 0
			-- PrintNum(selfId)
			-- 清空相关的数值
			for i=1, 9  do
				x001230_g_nMenpaiQiansan[i].id = (i-1)
				x001230_g_nMenpaiQiansan[i].player01=""
				x001230_g_nMenpaiQiansan[i].player02=""
				x001230_g_nMenpaiQiansan[i].player03=""				
				x001230_g_nMenpaiQiansan[i].playerid01=0
				x001230_g_nMenpaiQiansan[i].playerid02=0
				x001230_g_nMenpaiQiansan[i].playerid03=0				
			end			
			
			-- [ QUFEI 2007-07-30 18:31 UPDATE ]
			-- 清空奖励标记
			if LuaFnIsObjValid(sceneId, selfId) == 1 and LuaFnIsCanDoScriptLogic(sceneId,selfId) == 1 then
				SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 0 )
				SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 0 )
				SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 0 )
			end
			
		end
		
		if x001230_g_bHuashaning == 1   then
			-- 获得当前的时间
			local nNowTime = LuaFnGetCurrentTime()
			if x001230_g_PreTime == 0    then
				x001230_g_PreTime = nNowTime
				return
			end
			-- 1，每间隔5分钟，需要通知玩家，前3名的门派，发送给全世界
			if nNowTime > x001230_g_PreTime+300    then
			
				x001230_g_PreTime = nNowTime
				
				--刷新秘籍....
				x001230_GiveMJ( sceneId )
				
				-- 做一次排序，
				for i=1, 9    do
					for j=1, i   do
						if x001230_g_nMenpaikills[i].kill > x001230_g_nMenpaikills[j].kill   then
							local nTempMenpai = x001230_g_nMenpaikills[j].id
							local nKills = x001230_g_nMenpaikills[j].kill
							x001230_g_nMenpaikills[j].id = x001230_g_nMenpaikills[i].id
							x001230_g_nMenpaikills[j].kill = x001230_g_nMenpaikills[i].kill
							
							x001230_g_nMenpaikills[i].id = nTempMenpai
							x001230_g_nMenpaikills[i].kill = nKills
						end
					end
				end
				
				-- 发当前的相关公告
				local nMingci = 1
				
				local szStr = "#{HSJL_090113_01}" --"华山之颠，天下门派各呈雄风，目前从实力上排名在第一第二与第三名的门派：分别为" zchw

				szStr = szStr .. x001230_Id2Menpai(x001230_g_nMenpaikills[1].id) .. x001230_g_nMenpaikills[1].kill .. "#{HSJL_090113_02}"
				szStr = szStr .. x001230_Id2Menpai(x001230_g_nMenpaikills[2].id) .. x001230_g_nMenpaikills[2].kill .. "#{HSJL_090113_02}"
				szStr = szStr .. x001230_Id2Menpai(x001230_g_nMenpaikills[3].id) .. x001230_g_nMenpaikills[3].kill .. "#{HSJL_090113_03}"
				
				AddGlobalCountNews(sceneId, szStr)
				
			end
		end
	end
	
	-- 如果 bIsTime == 0 ,就把所有的玩家T出去
	if bIsTime == 0   then
		
		if x001230_g_bHuashaning == 1   then
			-- 活动结束的时刻，这是时候要处理比较多东西，注意！！！
			-- 1，看下谁是今天的胜利者，如果有多个并列第一，就“随机”出一个胜利者
			--  a，现排序所有的杀人数
				x001230_g_bHuashaning = 0
				x001230_g_bEndTime = LuaFnGetCurrentTime()
				
				for i=1, 9    do
					for j=1, i   do
						if x001230_g_nMenpaikills[i].kill > x001230_g_nMenpaikills[j].kill   then
							local nTempMenpai = x001230_g_nMenpaikills[j].id
							local nKills = x001230_g_nMenpaikills[j].kill
							x001230_g_nMenpaikills[j].id = x001230_g_nMenpaikills[i].id
							x001230_g_nMenpaikills[j].kill = x001230_g_nMenpaikills[i].kill
							
							x001230_g_nMenpaikills[i].id = nTempMenpai
							x001230_g_nMenpaikills[i].kill = nKills
						end
					end
				end
				
				local nMax = 0
				
				for i=1, 9   do
					if x001230_g_nMenpaikills[i].kill == x001230_g_nMenpaikills[1].kill   then
						nMax = nMax+1
					end
				end

				-- 在得到的杀人数1的门派中去随机一个，呵呵，传说中的强X
				local nVMenpai = random(nMax)

				if x001230_g_nMenpaikills[nVMenpai].kill < 1  then
					-- 本次活动无效，都没有杀人，哪里来的胜利者
					return
				end
				
				-- 设置全局的数据，胜利着门派，注意，这里+是特别需要的，因为0是一个初始值
				LuaFnSetWorldGlobalData(x001230_g_WorldGlobal, x001230_g_nMenpaikills[nVMenpai].id + 10)

				-- 发相关门派的通告
				local szMenpai = ""
				if x001230_g_nMenpaikills[nVMenpai].id == 0  then
					szMenpai = "Thi猽 L鈓"
				elseif x001230_g_nMenpaikills[nVMenpai].id == 1  then
					szMenpai = "Minh Gi醥"
				elseif x001230_g_nMenpaikills[nVMenpai].id == 2  then
					szMenpai = "C醝 Bang"
				elseif x001230_g_nMenpaikills[nVMenpai].id == 3  then
					szMenpai = "V� 衋ng"
				elseif x001230_g_nMenpaikills[nVMenpai].id == 4  then
					szMenpai = "Nga My"
				elseif x001230_g_nMenpaikills[nVMenpai].id == 5  then
					szMenpai = "Tinh T鷆"
				elseif x001230_g_nMenpaikills[nVMenpai].id == 6  then
					szMenpai = "Thi阯 Long"
				elseif x001230_g_nMenpaikills[nVMenpai].id == 7  then
					szMenpai = "Thi阯 S絥"
				elseif x001230_g_nMenpaikills[nVMenpai].id == 8  then
					szMenpai = "Ti陁 Dao"
				end
				--AddGlobalCountNews( sceneId, "#P在本届Hoa S絥 Lu Ki猰当中，#W" .. szMenpai .. "#P经过上下一心的努力，终于获得Hoa S絥 Lu Ki猰第一的荣誉，作为奖励，其门下所有弟子在下届Hoa S絥 Lu Ki猰活动结束前，每天的第一轮师门任务将会变为#Y3倍#P经验。" )
				
				x001230_g_bMenpai = szMenpai
				-- BroadMsgByChatPipe(sceneId,0,"@*;SrvMsg;SCA:" .. "#P在本届Hoa S絥 Lu Ki猰当中，#Y" .. szMenpai .. "#P经过上下一心的努力，终于获得Hoa S絥 Lu Ki猰第一的荣誉，作为奖励，其门下所有弟子在下届Hoa S絥 Lu Ki猰活动结束前，每天的第一轮师门任务将会变为#Y3倍经验。",4)

				-- 记录门派杀人数log
				for i=1, 9   do
					local strLog = "[huashan end]: menpai=" .. tostring(x001230_g_nMenpaikills[i].id) .. "   KillNum=" .. tostring(x001230_g_nMenpaikills[i].kill)
					MissionLog(sceneId,strLog)
				end
				
				-- 清空相关的数值
				for i=1, 9  do
					x001230_g_nMenpaikills[i].id = i-1
					x001230_g_nMenpaikills[i].kill = 0
				end
				
				-- 排序所有的玩家杀人数
				for i=1, x001230_g_PlayerNum   do
					for j=1, i   do
						-- local	objid = LuaFnGuid2ObjId( sceneId, x001230_g_PlayerId[i] )
						
						-- if objid == -1 then											-- 找不到该玩家
							-- PrintNum(i)
						-- end
						if x001230_g_PlayerKc[i] > x001230_g_PlayerKc[j]  then
							local Killcount = x001230_g_PlayerKc[i]
							local KillName  = x001230_g_PlayerName[i]
							local KillMenpai  = x001230_g_PlayerMenpai[i]
							local UserId  = x001230_g_PlayerId[i]
							
							x001230_g_PlayerKc[i] = x001230_g_PlayerKc[j]
							x001230_g_PlayerName[i] = x001230_g_PlayerName[j]
							x001230_g_PlayerMenpai[i] = x001230_g_PlayerMenpai[j]
							x001230_g_PlayerId[i] = x001230_g_PlayerId[j]
							
							x001230_g_PlayerKc[j] = Killcount
							x001230_g_PlayerName[j] = KillName
							x001230_g_PlayerMenpai[j] = KillMenpai
							x001230_g_PlayerId[j] = UserId
						end
					end
				end
				
				-- [ QUFEI 2007-07-27 17:24 UPDATE ]
				-- 获得门派前三名的玩家名字
				local num = {}
				for i=0 ,8  do
					num[i] = 0
				end

				for i=1, x001230_g_PlayerNum   do
					for j=0, 8   do
						if x001230_g_PlayerMenpai[i] == j then
								if num[j] == 0 then
									x001230_g_nMenpaiQiansan[j+1].player01 = x001230_g_PlayerName[i]
									x001230_g_nMenpaiQiansan[j+1].playerid01 = x001230_g_PlayerId[i]
									num[j] = 1
								elseif num[j] == 1 then
									x001230_g_nMenpaiQiansan[j+1].player02 = x001230_g_PlayerName[i]
									x001230_g_nMenpaiQiansan[j+1].playerid02 = x001230_g_PlayerId[i]
									num[j] = 2
								elseif num[j] == 2 then
									x001230_g_nMenpaiQiansan[j+1].player03 = x001230_g_PlayerName[i]
									x001230_g_nMenpaiQiansan[j+1].playerid03 = x001230_g_PlayerId[i]
									num[j] = 3
								end																							
						end					
					end
				end
				
				--查询组日志
				local strLogCheck = format(	"HuaShanLunJian_Rank_All    no.1=(id=%X, name=%s), no.2=(id=%X, name=%s), no.3=(id=%X, name=%s), ",
											LuaFnGetGUID(sceneId, x001230_g_PlayerId[1]),x001230_g_PlayerName[1],
											LuaFnGetGUID(sceneId, x001230_g_PlayerId[2]),x001230_g_PlayerName[2],
											LuaFnGetGUID(sceneId, x001230_g_PlayerId[3]),x001230_g_PlayerName[3]
											)
				LuaFnLogCheck(strLogCheck)
				for i=1, 9  do					
					strLogCheck = format(	"HuaShanLunJian_Rank_MenPai(%s)    no.1=(id=%X, name=%s), no.2=(id=%X, name=%s), no.3=(id=%X, name=%s), ",
											x001230_Id2Menpai(x001230_g_nMenpaiQiansan[i].id),
											LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid01),x001230_g_nMenpaiQiansan[i].player01,
											LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid02),x001230_g_nMenpaiQiansan[i].player02,
											LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid03),x001230_g_nMenpaiQiansan[i].player03
											)
					LuaFnLogCheck(strLogCheck)	
					AuditHuashanThreeWinners(sceneId,x001230_g_nMenpaiQiansan[i].playerid01)
				  AuditHuashanThreeWinners(sceneId,x001230_g_nMenpaiQiansan[i].playerid02)
          AuditHuashanThreeWinners(sceneId,x001230_g_nMenpaiQiansan[i].playerid03)
				end		
								
				-- 排序完成，开始公告
				local mingci = 1
				local KillCounts = 0
				local str = ""
				local mailStr = ""
				for i=1, x001230_g_PlayerNum  do
				
					if mingci == 1 and x001230_g_PlayerName[i] ~= "" then
						-- str = "第一名：" .. x001230_g_PlayerName[i]
						mailStr = "Ch鷆 m譶g c醕 h� tham gia Hoa S絥 Lu Ki猰 v� gi鄋h th� h課g s� 1. C� th� t靘 ng叨i ch� tr� Hoa S絥 Lu Ki猰 t読 T� Ch鈛 - T� Ki猰 L頽h (294,234) l頽h th叻ng.#r#YCh� �: #GSau 1 gi� c醕 h� kh鬾g nh th叻ng th� s� kh鬾g c騨 c� h礽 nh th叻ng n鎍!"
						
						local StartTime = LuaFnGetCurrentTime()
												
						x001230_g_bMenpai = szMenpai
						
						local nMonth = LuaFnGetThisMonth()
						local nDay   = LuaFnGetDayOfThisMonth()
						local nData  = (nMonth+1)*100+nDay						
						-- 发可执行邮件给前三名玩家
						LuaFnSendScriptMail( sceneId, x001230_g_PlayerName[i], MAIL_HUASHANJIANGLI, nData, 1, 1)
						
						strLogCheck = format(	"HuaShanLunJian_ScriptMail    FULL_NO.1=(id=%X, name=%s, Param01=%d, Param02=%d, Param03=%d)", LuaFnGetGUID(sceneId, x001230_g_PlayerId[i]), x001230_g_PlayerName[i], nData, 1, 1 )
						LuaFnLogCheck(strLogCheck)

						LuaFnSendSystemMail( sceneId, x001230_g_PlayerName[i], mailStr )

						strLogCheck = format(	"HuaShanLunJian_SystemMail    FULL_NO.1=(id=%X, name=%s)", LuaFnGetGUID(sceneId, x001230_g_PlayerId[i]), x001230_g_PlayerName[i] )
						LuaFnLogCheck(strLogCheck)
						
						mingci = 2
						if x001230_g_PlayerKc[i] ~= x001230_g_PlayerKc[i+1]  then
							mingci = 2
						end
					elseif mingci == 2 and x001230_g_PlayerName[i] ~= "" then
						-- str = "第二名：" .. x001230_g_PlayerName[i]
						mailStr = "Ch鷆 m譶g c醕 h� tham gia Hoa S絥 Lu Ki猰 v� gi鄋h th� h課g s� 2. C� th� t靘 ng叨i ch� tr� Hoa S絥 Lu Ki猰 t読 T� Ch鈛 - T� Ki猰 L頽h (294,234) l頽h th叻ng.#r#YCh� �: #GSau 1 gi� c醕 h� kh鬾g nh th叻ng th� s� kh鬾g c騨 c� h礽 nh th叻ng n鎍!"
						
						local StartTime = LuaFnGetCurrentTime()
						
						local nMonth = LuaFnGetThisMonth()
						local nDay   = LuaFnGetDayOfThisMonth()
						local nData  = (nMonth+1)*100+nDay						
						-- 发可执行邮件给前三名玩家
						LuaFnSendScriptMail( sceneId, x001230_g_PlayerName[i], MAIL_HUASHANJIANGLI, nData, 1, 2)

						strLogCheck = format(	"HuaShanLunJian_ScriptMail    FULL_NO.2=(id=%X, name=%s, Param01=%d, Param02=%d, Param03=%d)", LuaFnGetGUID(sceneId, x001230_g_PlayerId[i]), x001230_g_PlayerName[i], nData, 1, 2 )
						LuaFnLogCheck(strLogCheck)

						LuaFnSendSystemMail( sceneId, x001230_g_PlayerName[i], mailStr )
						
						strLogCheck = format(	"HuaShanLunJian_SystemMail    FULL_NO.2=(id=%X, name=%s)", LuaFnGetGUID(sceneId, x001230_g_PlayerId[i]), x001230_g_PlayerName[i] )
						LuaFnLogCheck(strLogCheck)

						mingci = 3
						if x001230_g_PlayerKc[i] ~= x001230_g_PlayerKc[i+1]  then
							mingci = 3
						end
						
					elseif mingci == 3 and x001230_g_PlayerName[i] ~= "" then
						-- str = "第三名：" .. x001230_g_PlayerName[i]
						mailStr = "Ch鷆 m譶g c醕 h� tham gia Hoa S絥 Lu Ki猰 v� gi鄋h th� h課g s� 3. C� th� t靘 ng叨i ch� tr� Hoa S絥 Lu Ki猰 t読 T� Ch鈛 - T� Ki猰 L頽h (294,234) l頽h th叻ng.#r#YCh� �: #GSau 1 gi� c醕 h� kh鬾g nh th叻ng th� s� kh鬾g c騨 c� h礽 nh th叻ng n鎍!"
						
						local StartTime = LuaFnGetCurrentTime()
						
						local nMonth = LuaFnGetThisMonth()
						local nDay   = LuaFnGetDayOfThisMonth()
						local nData  = (nMonth+1)*100+nDay						
						-- 发可执行邮件给前三名玩家
						LuaFnSendScriptMail( sceneId, x001230_g_PlayerName[i], MAIL_HUASHANJIANGLI, nData, 1, 3)
						
						strLogCheck = format(	"HuaShanLunJian_ScriptMail    FULL_NO.3=(id=%X, name=%s, Param01=%d, Param02=%d, Param03=%d)", LuaFnGetGUID(sceneId, x001230_g_PlayerId[i]), x001230_g_PlayerName[i], nData, 1, 3 )
						LuaFnLogCheck(strLogCheck)

						LuaFnSendSystemMail( sceneId, x001230_g_PlayerName[i], mailStr )
						
						strLogCheck = format(	"HuaShanLunJian_SystemMail    FULL_NO.3=(id=%X, name=%s)", LuaFnGetGUID(sceneId, x001230_g_PlayerId[i]), x001230_g_PlayerName[i] )
						LuaFnLogCheck(strLogCheck)

						mingci = 4
						if x001230_g_PlayerKc[i] ~= x001230_g_PlayerKc[i+1]  then
							mingci = 4
						end
						
					elseif mingci == 4  then
						-- str = "第四名：" .. x001230_g_PlayerName[i]
						mingci = 5
						if x001230_g_PlayerKc[i] ~= x001230_g_PlayerKc[i+1]  then
							mingci = 5
						end
						
					elseif mingci == 5  then
						-- str = "第五名：" .. x001230_g_PlayerName[i]
						mingci = 6
						if x001230_g_PlayerKc[i] ~= x001230_g_PlayerKc[i+1]  then
							mingci = 6
							break
						end
					end
					-- PrintStr(str)
					-- AddGlobalCountNews( sceneId, str)

				end

				for i=1, 9  do
					--向每个门派发送前三名的门派公告
					str = "#PLu Ki猰 Hoa S絥 l n鄖 疸 k猼 th鷆, c醕 鸢ng m鬾 tr呔c sau 疸 d痗 s裞 v� m鬾 ph醝, 疸 th� hi畁 s� d鹡g c鋗 trong chi猲 黏u, trong s� h� ng叨i 疬㧟 x猵 cao nh l�: #W"
					-- PrintNum(x001230_g_nMenpaiQiansan[i].playerid01)
					-- PrintNum(x001230_g_nMenpaiQiansan[i].playerid02)
					-- PrintNum(x001230_g_nMenpaiQiansan[i].playerid03)
					if x001230_g_nMenpaiQiansan[i].playerid01 ~= 0 and x001230_g_nMenpaiQiansan[i].player01 ~= "" then
						BroadMsgByChatPipe(sceneId,x001230_g_nMenpaiQiansan[i].playerid01, str, 7)
						str = "Gi鋓 nh: " .. x001230_g_nMenpaiQiansan[i].player01
						BroadMsgByChatPipe(sceneId,x001230_g_nMenpaiQiansan[i].playerid01, str, 7)	
					end
					
					if x001230_g_nMenpaiQiansan[i].playerid02 ~= 0 and x001230_g_nMenpaiQiansan[i].player02 ~= "" then
						str = "Gi鋓 nh�: " .. x001230_g_nMenpaiQiansan[i].player02
						BroadMsgByChatPipe(sceneId,x001230_g_nMenpaiQiansan[i].playerid02, str, 7)			
					end
					
					if x001230_g_nMenpaiQiansan[i].playerid03 ~= 0 and x001230_g_nMenpaiQiansan[i].player03 ~= "" then
						str = "Gi鋓 ba: " .. x001230_g_nMenpaiQiansan[i].player03
						BroadMsgByChatPipe(sceneId,x001230_g_nMenpaiQiansan[i].playerid03, str, 7)							
					end
					
					if x001230_g_nMenpaiQiansan[i].player01 ~= ""
						and x001230_g_nMenpaiQiansan[i].player01 ~= x001230_g_PlayerName[1] 
						and x001230_g_nMenpaiQiansan[i].player01 ~= x001230_g_PlayerName[2] 
						and x001230_g_nMenpaiQiansan[i].player01 ~= x001230_g_PlayerName[3] then
						mailStr = "Ch鷆 m譶g m鬾 ph醝 c黙 c醕 h� tham gia Hoa S絥 Lu Ki猰 v� gi鄋h th� h課g s� 1. C� th� t靘 ng叨i ch� tr� Hoa S絥 Lu Ki猰 t読 T� Ch鈛 - T� Ki猰 L頽h (294,234) l頽h th叻ng.#r#YCh� �: #GSau 1 gi� c醕 h� kh鬾g nh th叻ng th� s� kh鬾g c騨 c� h礽 nh th叻ng n鎍!"
																
						local StartTime = LuaFnGetCurrentTime()
						
						local nMonth = LuaFnGetThisMonth()
						local nDay   = LuaFnGetDayOfThisMonth()
						local nData  = (nMonth+1)*100+nDay						
						--发可执行邮件给前三名玩家																		
						LuaFnSendScriptMail( sceneId, x001230_g_nMenpaiQiansan[i].player01, MAIL_HUASHANJIANGLI, nData, 2, 1)

						strLogCheck = format(	"HuaShanLunJian_ScriptMail    MenPai_NO.1=(id=%X, name=%s, Param01=%d, Param02=%d, Param03=%d)", LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid01), x001230_g_nMenpaiQiansan[i].player01, nData, 2, 1 )
						LuaFnLogCheck(strLogCheck)

						LuaFnSendSystemMail( sceneId, x001230_g_nMenpaiQiansan[i].player01, mailStr )

						strLogCheck = format(	"HuaShanLunJian_SystemMail    MenPai_NO.1=(id=%X, name=%s)", LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid01), x001230_g_nMenpaiQiansan[i].player01 )
						LuaFnLogCheck(strLogCheck)

					end
					if x001230_g_nMenpaiQiansan[i].player02 ~= ""
						and x001230_g_nMenpaiQiansan[i].player02 ~= x001230_g_PlayerName[1] 
						and x001230_g_nMenpaiQiansan[i].player02 ~= x001230_g_PlayerName[2] 
						and x001230_g_nMenpaiQiansan[i].player02 ~= x001230_g_PlayerName[3] then						
						mailStr = "Ch鷆 m譶g m鬾 ph醝 c黙 c醕 h� tham gia Hoa S絥 Lu Ki猰 v� gi鄋h th� h課g s� 2. C� th� t靘 ng叨i ch� tr� Hoa S絥 Lu Ki猰 t読 T� Ch鈛 - T� Ki猰 L頽h (294,234) l頽h th叻ng.#r#YCh� �: #GSau 1 gi� c醕 h� kh鬾g nh th叻ng th� s� kh鬾g c騨 c� h礽 nh th叻ng n鎍!"
						
						local StartTime = LuaFnGetCurrentTime()
						
						local nMonth = LuaFnGetThisMonth()
						local nDay   = LuaFnGetDayOfThisMonth()
						local nData  = (nMonth+1)*100+nDay						
						--发可执行邮件给前三名玩家												
						LuaFnSendScriptMail( sceneId, x001230_g_nMenpaiQiansan[i].player02, MAIL_HUASHANJIANGLI, nData, 2, 2)
						
						strLogCheck = format(	"HuaShanLunJian_ScriptMail    MenPai_NO.2=(id=%X, name=%s, Param01=%d, Param02=%d, Param03=%d)", LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid02), x001230_g_nMenpaiQiansan[i].player02, nData, 2, 2 )
						LuaFnLogCheck(strLogCheck)

						LuaFnSendSystemMail( sceneId, x001230_g_nMenpaiQiansan[i].player02, mailStr )
						
						strLogCheck = format(	"HuaShanLunJian_SystemMail    MenPai_NO.2=(id=%X, name=%s)", LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid02), x001230_g_nMenpaiQiansan[i].player02 )
						LuaFnLogCheck(strLogCheck)

					end				
					if x001230_g_nMenpaiQiansan[i].player03 ~= ""
						and	x001230_g_nMenpaiQiansan[i].player03 ~= x001230_g_PlayerName[1] 
						and x001230_g_nMenpaiQiansan[i].player03 ~= x001230_g_PlayerName[2] 
						and x001230_g_nMenpaiQiansan[i].player03 ~= x001230_g_PlayerName[3] then						
						mailStr = "Ch鷆 m譶g m鬾 ph醝 c黙 c醕 h� tham gia Hoa S絥 Lu Ki猰 v� gi鄋h th� h課g s� 3. C� th� t靘 ng叨i ch� tr� Hoa S絥 Lu Ki猰 t読 T� Ch鈛 - T� Ki猰 L頽h (294,234) l頽h th叻ng.#r#YCh� �: #GSau 1 gi� c醕 h� kh鬾g nh th叻ng th� s� kh鬾g c騨 c� h礽 nh th叻ng n鎍!"
						
						local StartTime = LuaFnGetCurrentTime()
						
						local nMonth = LuaFnGetThisMonth()
						local nDay   = LuaFnGetDayOfThisMonth()
						local nData  = (nMonth+1)*100+nDay						
						--发可执行邮件给前三名玩家
						LuaFnSendScriptMail( sceneId, x001230_g_nMenpaiQiansan[i].player03, MAIL_HUASHANJIANGLI, nData, 2, 3)
						
						strLogCheck = format(	"HuaShanLunJian_ScriptMail    MenPai_NO.3=(id=%X, name=%s, Param01=%d, Param02=%d, Param03=%d)", LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid03), x001230_g_nMenpaiQiansan[i].player03, nData, 2, 3 )
						LuaFnLogCheck(strLogCheck)

						LuaFnSendSystemMail( sceneId, x001230_g_nMenpaiQiansan[i].player03, mailStr )
						
						strLogCheck = format(	"HuaShanLunJian_SystemMail    MenPai_NO.3=(id=%X, name=%s)", LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid03), x001230_g_nMenpaiQiansan[i].player03 )
						LuaFnLogCheck(strLogCheck)

					end									
				end						

				-- 清空相关内容
				for i=1, x001230_g_PlayerNum   do
					x001230_g_PlayerKc[i] = 0										
				end				
				
		end
		
		local i
		for i=0, nHumanNum-1  do

			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			if LuaFnIsObjValid( sceneId, nHumanId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, nHumanId ) == 1 then
			  BeginEvent(sceneId)
			  	AddText(sceneId, "#PK猼 th鷆 Lu Ki猰 Hoa S絥.")
			  EndEvent()
			  DispatchMissionTips(sceneId, nHumanId)
		
				local nMenpaiScene
				local nPos_X
				local nPos_Z
				local nMempai = LuaFnGetMenPai(sceneId, nHumanId)
				if 		 nMempai == 0    then
					nMenpaiScene = 9
					nPos_X			 = 62
					nPos_Z			 = 63
				elseif nMempai == 1    then
					nMenpaiScene = 11
					nPos_X			 = 82
					nPos_Z			 = 57
				elseif nMempai == 2    then
					nMenpaiScene = 10
					nPos_X			 = 42
					nPos_Z			 = 145
				elseif nMempai == 3    then
					nMenpaiScene = 12
					nPos_X			 = 99
					nPos_Z			 = 69
				elseif nMempai == 4    then
					nMenpaiScene = 15
					nPos_X			 = 97
					nPos_Z			 = 74
				elseif nMempai == 5    then
					nMenpaiScene = 16
					nPos_X			 = 126
					nPos_Z			 = 77
				elseif nMempai == 6    then
					nMenpaiScene = 13
					nPos_X			 = 37
					nPos_Z			 = 86
				elseif nMempai == 7    then
					nMenpaiScene = 17
					nPos_X			 = 100
					nPos_Z			 = 46
				elseif nMempai == 8    then
					nMenpaiScene = 14
					nPos_X			 = 61
					nPos_Z			 = 69
				elseif nMempai == 9    then
					--没有门派的人应该是不出现的，避免错误出现，设置个位置
					nMenpaiScene = 1
					nPos_X			 = 191
					nPos_Z			 = 138
					--PrintStr("你这个家伙，被人K的都不知道自己门派了？？？")
				end
				CallScriptFunction((400900), "TransferFunc",sceneId, nHumanId, nMenpaiScene, nPos_X, nPos_Z)
			end

		end --END for i=0, nHumanNum-1  do

	end --END if bIsTime == 0

end

--**********************************
-- 杀人计数
--**********************************
function x001230_KillPlayer(sceneId, killerId, diedId)
	-- 只有在活动时间内杀的人才是有效的
	if x001230_g_bHuashaning == 0  then
		return
	end
	
	local IsAddCnt = 1	
	local killerLvl = GetLevel(sceneId, killerId)
	local diedLvl = GetLevel(sceneId, diedId)
	
	local lastplayer = GetMissionData( sceneId, killerId, MD_LASTPLAYER_ID )
	
	if killerLvl - diedLvl >= 40 or lastplayer == diedId then
		IsAddCnt = 0		
	end
	SetMissionData( sceneId, killerId, MD_LASTPLAYER_ID, diedId )
	
	if IsAddCnt == 0 then
		
		BeginEvent(sceneId)
			AddText(sceneId, "Khi c醕 h� l 餴 l l読 vi甤 gi猼 ch猼 1 ng叨i ch絠 c 鸬 nh� h絥 c 40, c醕 h� s� kh鬾g th� nh 疬㧟 痼ng g髉 v� l頽h nh ph th叻ng.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, killerId)
			
		return 0
	end
	
	-- 从ehuashan_4.lua中挪过来 changed by xindfeng
	local nMenpaiPoint = GetHumanMenpaiPoint(sceneId, killerId)
	SetHumanMenpaiPoint(sceneId, killerId, nMenpaiPoint+1)		--门派贡献度+1
		
	
	local nKillerMenpai = GetMenPai(sceneId, killerId)
	local nKillCount = 0
	
	for i=1, 9  do
		if x001230_g_nMenpaikills[i].id == nKillerMenpai   then
			x001230_g_nMenpaikills[i].kill = x001230_g_nMenpaikills[i].kill + 1
			nKillCount = x001230_g_nMenpaikills[i].kill
		end
	end
	
	-- 给所有场景中杀手门派的人发消息，告诉他们得分了
	--1，获得场景中的所有人，
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)

	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then

			if nKillerMenpai == GetMenPai(sceneId, PlayerId)    then
				BeginEvent(sceneId)
						AddText(sceneId, "Hi畁 gi� b眓 m鬾 ph醝 鹫t 餴琺 : " .. nKillCount)
				EndEvent(sceneId)
				DispatchMissionTips(sceneId, PlayerId)
			end

		end
	end
	
	-- 记录门派杀人数log
	local strLog = "[huashan]: menpai=" .. tostring(nKillerMenpai) .. "   KillNum=" .. tostring(nKillCount)
	MissionLog(sceneId,strLog)

	-- 给玩家的杀人数计数
	local KillerName = GetName(sceneId, killerId)
	local nIndex = 0
	for i=0, x001230_g_PlayerNum  do
		if KillerName == x001230_g_PlayerName[i]  then
			-- 找到人了
			x001230_g_PlayerKc[i] = x001230_g_PlayerKc[i]+1
			BeginEvent(sceneId)
				AddText(sceneId, "#{HSLJJF_1}" .. x001230_g_PlayerKc[i].."#{HSLJJF_2}")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId, killerId)
			return
		end
	end
	
	x001230_AddPlayer(sceneId, KillerName, killerId)

end

--**********************************
-- 增加一个玩家到杀手列表中去
--**********************************
function x001230_AddPlayer(sceneId, Name, PlayerId)
	
	for i=1, x001230_g_PlayerNum  do
		if Name == x001230_g_PlayerName[i]  then
			return
		end
	end
	
	x001230_g_PlayerNum = x001230_g_PlayerNum + 1;
	x001230_g_PlayerKc[x001230_g_PlayerNum] = 1
	BeginEvent(sceneId)
		AddText(sceneId, "#{HSLJJF_1}1#{HSLJJF_2}")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, PlayerId)
	x001230_g_PlayerName[x001230_g_PlayerNum] = Name
	x001230_g_PlayerId[x001230_g_PlayerNum] = PlayerId
	
	--[ QUFEI 2007-07-27 15:04 UPDATE ]
	--获得玩家的门派ID
	x001230_g_PlayerMenpai[x001230_g_PlayerNum] = GetMenPai(sceneId, PlayerId)

end

--**********************************
-- 增加一个玩家到杀手列表中去
--**********************************
function x001230_Id2Menpai(nMenpaiId)
	local szMenpai = ""
	if nMenpaiId == 0  then
		szMenpai = "Thi猽 L鈓"
	elseif nMenpaiId == 1  then
		szMenpai = "Minh Gi醥"
	elseif nMenpaiId == 2  then
		szMenpai = "C醝 Bang"
	elseif nMenpaiId == 3  then
		szMenpai = "V� 衋ng"
	elseif nMenpaiId == 4  then
		szMenpai = "Nga My"
	elseif nMenpaiId == 5  then
		szMenpai = " Tinh T鷆"
	elseif nMenpaiId == 6  then
		szMenpai = "Thi阯 Long"
	elseif nMenpaiId == 7  then
		szMenpai = "Thi阯 S絥"
	elseif nMenpaiId == 8  then
		szMenpai = "Ti陁 Dao"
	end
	
	return szMenpai
	
end

--**********************************
--对话框提示
--**********************************
function x001230_MyMsgBox( sceneId, selfId, str )
	BeginEvent(sceneId)    
    AddText(sceneId,str);
    EndEvent(sceneId)
    DispatchMissionTips(sceneId,selfId)	
end

--**********************************
--刷新秘籍
--**********************************
function x001230_GiveMJ( sceneId )

	-- 先删除旧的秘籍....
	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1 do
		local nMonsterId = GetMonsterObjID(sceneId, i)
		local szName = GetName(sceneId, nMonsterId)
		for j=1, getn(x001230_g_MJNameTbl)  do
			if szName == x001230_g_MJNameTbl[j]  then
				LuaFnDeleteMonster(sceneId, nMonsterId)
			end
		end
	end

	--场景中央刷新2个....
	for i=1, getn(x001230_g_MJPosA)  do
		local Rand = random(getn(x001230_g_MJTblA))
		LuaFnCreateMonster(sceneId, x001230_g_MJTblA[Rand],
																x001230_g_MJPosA[i].x, x001230_g_MJPosA[i].y,
																3, 0, x001230_g_MJScript )

	end

	--场景四周刷新4个....

		--重置权值....
	for i=1, getn(x001230_g_MJPosB) do
		x001230_g_MJPosB[i].rand = random(100)
	end

		--选出权值最大的4个点作为投放秘籍的点....
	for i=1, 4 do

		local MaxVal = -1
		local index = 1

		for j=1, getn(x001230_g_MJPosB) do
			if x001230_g_MJPosB[j].rand > MaxVal then
				MaxVal = x001230_g_MJPosB[j].rand
				x001230_g_MJPosB[j].rand = -1
				index = j
			end
		end

		--投放秘籍....
		local Rand = random(getn(x001230_g_MJTblB))
		LuaFnCreateMonster(sceneId, x001230_g_MJTblB[Rand],
																x001230_g_MJPosB[index].x, x001230_g_MJPosB[index].y,
																3, 0, x001230_g_MJScript )

	end


end
