--注意：

--物品技能的逻辑只能使用基础技能和脚本来实现

--脚本号
x300020_g_ScriptId = 300020

--任务号
x300020_g_MissionId = 1060

x300020_g_Impact = 213

x300020_g_TreasureAddress = {{scene=9,x1=84,x2=108,z1=64,z2=86},
						{scene=9,x1=122,x2=146,z1=132,z2=159},
						{scene=9,x1=89,x2=102,z1=110,z2=137},
						{scene=9,x1=54,x2=83,z1=52,z2=71}}

--**********************************
--事件交互入口
--**********************************
function x300020_OnDefaultEvent( sceneId, selfId, bagIndex )
--扫帚
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x300020_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x300020_CancelImpacts( sceneId, selfId )
	return 0;
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x300020_OnConditionCheck( sceneId, selfId )
	local x,z = GetWorldPos( sceneId, selfId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x300020_g_MissionId)
	if	sceneId ~= x300020_g_TreasureAddress[1].scene  then
		Msg2Player( sceneId,selfId,"B痠 c鋘h n鄖 kh鬾g th� ti猲 h鄋h d鱪 d﹑",MSG2PLAYER_PARA) --通知玩家
		return 0
	elseif	IsHaveMission(sceneId,selfId,x300020_g_MissionId) > 0	 then
		if	GetMissionParam( sceneId, selfId, misIndex,4) == 1  then
			if	x>x300020_g_TreasureAddress[1].x1  and  x<x300020_g_TreasureAddress[1].x2  and  z>x300020_g_TreasureAddress[1].z1  and  z<x300020_g_TreasureAddress[1].z2  then
				if	GetMissionParam( sceneId, selfId, misIndex,0) >= 1  then
					Msg2Player( sceneId,selfId,"姓i 餴畁 疸 疬㧟 d鱪 d﹑ s誧h s� r癷",MSG2PLAYER_PARA) --通知玩家
					return 0
				else
					Msg2Player( sceneId,selfId,"C醕 h� b 馥u d鱪 d﹑ 鹫i 餴畁...",MSG2PLAYER_PARA) --通知玩家
					return 1
				end
			else
				Msg2Player( sceneId,selfId,"C 皙n: 姓i 餴畁",MSG2PLAYER_PARA) --通知玩家
				return 0
			end
		elseif	GetMissionParam( sceneId, selfId, misIndex,4) == 2  then
			if  x>x300020_g_TreasureAddress[2].x1  and  x<x300020_g_TreasureAddress[2].x2  and  z>x300020_g_TreasureAddress[2].z1  and  z<x300020_g_TreasureAddress[2].z2  then
				if	GetMissionParam( sceneId, selfId, misIndex,0) >= 1  then
					Msg2Player( sceneId,selfId,"T鄋g Kinh C醕 疸 疬㧟 d鱪 d﹑ s誧h s� r癷",MSG2PLAYER_PARA) --通知玩家
					return 0
				else
					Msg2Player( sceneId,selfId,"C醕 h� b 馥u d鱪 d﹑ T鄋g Kinh C醕...",MSG2PLAYER_PARA) --通知玩家
					return 1
				end
			else
				Msg2Player( sceneId,selfId,"C 皙n: T鄋g Kinh C醕",MSG2PLAYER_PARA) --通知玩家
				return 0
			end
		elseif	GetMissionParam( sceneId, selfId, misIndex,4) == 3  then
			if  x>x300020_g_TreasureAddress[3].x1  and  x<x300020_g_TreasureAddress[3].x2  and  z>x300020_g_TreasureAddress[3].z1  and  z<x300020_g_TreasureAddress[3].z2  then
				if	GetMissionParam( sceneId, selfId, misIndex,0) >=1  then
					Msg2Player( sceneId,selfId,"S絥 M鬾 疸 疬㧟 d鱪 d﹑ s誧h s� r癷",MSG2PLAYER_PARA) --通知玩家
					return 0
				else
					Msg2Player( sceneId,selfId,"C醕 h� b 馥u d鱪 d﹑ S絥 M鬾...",MSG2PLAYER_PARA) --通知玩家
					return 1
				end
			else
				Msg2Player( sceneId,selfId,"C 皙n: S絥 M鬾",MSG2PLAYER_PARA) --通知玩家
				return 0
			end		
		elseif	GetMissionParam( sceneId, selfId, misIndex,4) == 4  then
			if  x>x300020_g_TreasureAddress[4].x1  and  x<x300020_g_TreasureAddress[4].x2  and  z>x300020_g_TreasureAddress[4].z1  and  z<x300020_g_TreasureAddress[4].z2  then
				if	GetMissionParam( sceneId, selfId, misIndex,0) >= 1  then
					Msg2Player( sceneId,selfId,"Th醦 邪ng H� 疸 疬㧟 d鱪 d﹑ s誧h s� r癷.",MSG2PLAYER_PARA) --通知玩家
					return 0
				else
					Msg2Player( sceneId,selfId,"C醕 h� b 馥u d鱪 d﹑ Th醦 邪ng H�...",MSG2PLAYER_PARA) --通知玩家
					return 1
				end
			else
				Msg2Player( sceneId,selfId,"C 皙n: Th醦 邪ng H�",MSG2PLAYER_PARA) --通知玩家
				return 0
			end
		end
	else
		return 0
	end
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x300020_OnDeplete( sceneId, selfId )
	return 1; --不消耗
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x300020_OnActivateOnce( sceneId, selfId )
	local misIndex = GetMissionIndexByID(sceneId,selfId,x300020_g_MissionId)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5900, 0);
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	BeginEvent(sceneId)
		AddText(sceneId,"Qu閠 d鱪 xong, nhi甿 v� 疸 ho鄋 th鄋h!")
	EndEvent( )
	DispatchMissionTips(sceneId,selfId)
	Msg2Player( sceneId,selfId,"D鱪 dep s誧h s� r癷, nhi甿 v� ho鄋 th鄋h",MSG2PLAYER_PARA) --通知玩家
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x300020_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end
