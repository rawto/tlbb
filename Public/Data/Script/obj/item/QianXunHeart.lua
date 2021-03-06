-- 寻路之心 ItemID 40004435

-- 脚本号
x300085_g_scriptId = 300085

x300085_g_event = 229024				-- 千寻任务脚本
--任务号
x300085_g_MissionId			= 421

--任务环数
x300085_g_Mission_RoundNum	 = 5		--第5位参数

x300085_g_FuQiMission_IDX		 	= 131	--夫妻关系任务索引
x300085_g_JieBaiMission_IDX		= 132	--结拜关系任务索引
x300085_g_ShiTuMission_IDX		= 133	--师徒关系任务索引

x300085_g_scenePosInfoList = { {sceneId=7,  scenename="Ki猰 C醕", PosName="Ki猰 m鬾 餴畃 th鷜", PosX=130, PosY=140,  PosR=10, Area=711 },
															 {sceneId=8,  scenename="恤n Ho鄋g", PosName="H鉵 h鋓 c ph", PosX=267, PosY=251,  PosR=10, Area=811 },
															 {sceneId=5,  scenename="K韓h K�", PosName="Ng鱟 疳i l鈓 phong", PosX=35 , PosY=265,  PosR=10, Area=511 },
															 {sceneId=4,  scenename="Th醝 H�", PosName="V� t� ca 疣i", PosX=155, PosY=255,  PosR=10, Area=411 },
															 {sceneId=3,  scenename="Tung S絥", PosName="Giang s絥 餫 ki玼", PosX=280, PosY=80,   PosR=10, Area=311 },
															 {sceneId=30, scenename="T鈟 H�", PosName="Nh v鱪g h� b鄌", PosX=170, PosY=230,  PosR=10, Area=3011},															 
															 {sceneId=31, scenename="Long Tuy玭", PosName="Phi l遳 tr馽 h�", PosX=270, PosY=280,  PosR=10, Area=3111},
															 {sceneId=25, scenename="Th呓ng S絥", PosName="T� th鼀 ni阯 hoa", PosX=260, PosY=110,  PosR=10, Area=2512},															 
															 {sceneId=32, scenename="V� Di", PosName="Y阯 t鯽 nh� ki玼", PosX=50 , PosY=180,  PosR=10, Area=3211},															 
															 {sceneId=0,  scenename="L誧 D呓ng", PosName="Kim th鄋h thang tr�", PosX=50,  PosY=220,  PosR=10, Area=11  } }

--**********************************
--事件交互入口
--**********************************
function x300085_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end


--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x300085_IsSkillLikeScript( sceneId, selfId )
	return 1	 --这个脚本需要动作支持
end


--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x300085_CancelImpacts( sceneId, selfId )
	return 0	 --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x300085_OnActivateEachTick( sceneId, selfId )
	return 1	 --不是引导性脚本, 只保留空函数。
end


--**********************************
--信息提示
--**********************************
function x300085_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x300085_OnConditionCheck( sceneId, selfId )
	
	--背包中的位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end
	
	--校验使用的物品
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
		return 0
	end
	
	--检测物品是否加锁
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x300085_MsgBox( sceneId, selfId, "V ph n鄖 疸 b� kh骯!" )
		return 0
	end

	if IsHaveMission( sceneId, selfId, x300085_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x300085_g_MissionId)
	local nRoundNum = GetMissionParam(sceneId, selfId, misIndex, x300085_g_Mission_RoundNum)
	local ScintInfo = x300085_g_scenePosInfoList[nRoundNum]
	
	--取得玩家当前坐标
	local PlayerX = GetHumanWorldX(sceneId,selfId)
	local PlayerY = GetHumanWorldZ(sceneId,selfId)
	--计算玩家与目标点的距离
	local Distance = floor(sqrt((ScintInfo.PosX-PlayerX)*(ScintInfo.PosX-PlayerX)+(ScintInfo.PosY-PlayerY)*(ScintInfo.PosY-PlayerY)))
	local str = format("Ng呓i t靘 nhi甿 v� 甬 %d: 衖 #G%s#W th錷 d� #G%s#{_INFOAIM%d,%d,%d,%s}#W, v譨 xem c鋘h 皓p giang h� 餴. Th飊h s� d鴑g #YTi阯 Nh鈔 Ch� L�#W.", nRoundNum, ScintInfo.scenename, ScintInfo.PosName, ScintInfo.PosX, ScintInfo.PosY, ScintInfo.sceneId, ScintInfo.scenename)		
	if sceneId ~= ScintInfo.sceneId then
		BeginEvent(sceneId)
			AddText(sceneId, str)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
		return 0
	end
	
	--PrintStr("Distance=" .. Distance)

	if Distance > ScintInfo.PosR then
		BeginEvent(sceneId)
			AddText(sceneId,str)
			AddText(sceneId,"Kho鋘g c醕h c騨 "..Distance.." G誳")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	
	elseif Distance <= ScintInfo.PosR then  		
 		local	nMisType = GetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE )	--队员所选的任务类型
		-- 保证任务关系人也要在附近
		if nMisType == x300085_g_FuQiMission_IDX then
			if CallScriptFunction(x300085_g_event,"CheckMission_FuQi",sceneId, selfId) == 0 then
				return 0
			end
		elseif nMisType == x300085_g_JieBaiMission_IDX then
			if CallScriptFunction(x300085_g_event,"CheckMission_JieBai",sceneId, selfId) == 0 then			
				return 0
			end
		elseif nMisType == x300085_g_ShiTuMission_IDX then
			if CallScriptFunction(x300085_g_event,"CheckMission_ShiTu",sceneId, selfId) == 0 then			
				return 0
			end
		else		
			x300085_NotifyTip( sceneId, selfId, "S� d鴑g v ph th b読" )		
			return 0
		end  		
 		 		
 		return 1		
	end
	
	return 0
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x300085_OnDeplete( sceneId, selfId )	
	--
	--在此还要再次检测一下....
	--
	local ret
	ret = x300085_OnConditionCheck( sceneId, selfId )
	if 0 == ret then
		return 0
	end

	return 1

end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x300085_OnActivateOnce( sceneId, selfId )
	
	--背包中的位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end
	
	CallScriptFunction(x300085_g_event,"OnUseItem",sceneId, selfId, bagId)
	return 1

end
