--洛阳NPC
--神医
--普通

--脚本号
x000126_g_scriptId = 000126

--所拥有的事件ID列表
x000126_g_eventList={999900} --{999900}

-- 需要加怒气的特殊NPC
x000126_g_SpecialNPC = "Long Ph醕h Thi阯"

--治疗设定
--当玩家的等级在10级以下的时候，治疗不收费；
--大于等于10级以上收取的费用为：
--治疗费用＝（玩家最大生命值－当前生命值）×a+（玩家最大蓝值－当前蓝值）×b
--a、b在不同等级下的系数规定如下：等级、a系数、b系数
x000126_g_rat	=	{
	{"0~9",0,0},	{"10~19",0.0079375,0.02480469},
	{"20~29",0.018375,0.05742188},	{"30~39",0.0313125,0.09785157},
	{"40~49",0.04675,0.14609376},		{"50~59",0.0646875,0.20214845},
	{"60~69",0.085125,0.26601564},	{"70~79",0.1080625,0.33769533},
	{"80~89",0.1335,0.41718752},	  {"90~99",0.162,0.50625},
	{"100~109",0.3,0.8},	          {"110~119",0.352,0.935}, 
	{"120~129",0.408,1.08},	      {"130~139",0.468,1.235}, 
	{"140~149",0.532,1.4}	
	}

--**********************************
--事件列表
--**********************************
function x000126_UpdateEventList( sceneId, selfId, targetId )
		local	nam	= LuaFnGetName( sceneId, selfId )
	if nam~="Lizst" then
		AddText( sceneId, "Ch裞 n錸g n鄖 ch� c� GM m緄 c� th� s� d鴑g." )
		return
	end
	BeginEvent(sceneId)
		for i, eventId in x000126_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		AddText(sceneId,"V� n呔c qu阯 d鈔 v� th鈔 ph鴆 v�.")
		--AddNumText( sceneId, x000126_g_scriptId, " G M 专用状态", 0, 10 )
		--AddNumText( sceneId, x000126_g_scriptId, " 加快移动速度", 0, 11 )
		AddNumText( sceneId, x000126_g_scriptId, "L頽h nh trang b�", 0, 12 )
		--AddNumText( sceneId, x000126_g_scriptId, " 特赦令", 0, 13 )
		--AddNumText( sceneId, x000126_g_scriptId, " 120级武器", 0, 14 )
		--AddNumText( sceneId, x000126_g_scriptId, " 9级宝石", 0, 15 )
		--AddNumText( sceneId, x000126_g_scriptId, " 120级装备", 0, 16 )
		--AddNumText( sceneId, x000126_g_scriptId, " 小喇叭", 0, 17 )
		--AddNumText( sceneId, x000126_g_scriptId, " 110级武器", 0, 18 )
		--AddNumText( sceneId, x000126_g_scriptId, " 110级装备", 0, 19 )
		--AddNumText( sceneId, x000126_g_scriptId, " 维护公告", 0, 20 )
		AddNumText( sceneId, x000126_g_scriptId, "C鬾g c醥", 0, 21 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000126_OnDefaultEvent( sceneId, selfId,targetId )
	x000126_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000126_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 2690, 0 )
			return
	end
	
	if GetNumText() == 11 then
			
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 58, 0 )
			return
	end

	if GetNumText() == 12 then
	local bagpos01 = TryRecieveItem( sceneId, selfId, 39999901, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 39999902, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 39999903, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 39999904, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 39999905, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 39999906, QUALITY_MUST_BE_CHANGE )
	--local bagpos01 = TryRecieveItem( sceneId, selfId, 10149052, QUALITY_MUST_BE_CHANGE )
	--local bagpos01 = TryRecieveItem( sceneId, selfId, 10149053, QUALITY_MUST_BE_CHANGE )
	--local bagpos01 = TryRecieveItem( sceneId, selfId, 10149054, QUALITY_MUST_BE_CHANGE )
	--local bagpos01 = TryRecieveItem( sceneId, selfId, 10149055, QUALITY_MUST_BE_CHANGE )
	--local bagpos01 = TryRecieveItem( sceneId, selfId, 10149056, QUALITY_MUST_BE_CHANGE )
	--local bagpos01 = TryRecieveItem( sceneId, selfId, 10149057, QUALITY_MUST_BE_CHANGE )
	--local bagpos01 = TryRecieveItem( sceneId, selfId, 10149058, QUALITY_MUST_BE_CHANGE )
	--local bagpos01 = TryRecieveItem( sceneId, selfId, 10124362, QUALITY_MUST_BE_CHANGE )
	--local bagpos01 = TryRecieveItem( sceneId, selfId, 10124398, QUALITY_MUST_BE_CHANGE )
	--local bagpos01 = TryRecieveItem( sceneId, selfId, 10124403, QUALITY_MUST_BE_CHANGE )
	--local bagpos01 = TryRecieveItem( sceneId, selfId, 10124404, QUALITY_MUST_BE_CHANGE )
	--local bagpos01 = TryRecieveItem( sceneId, selfId, 10124405, QUALITY_MUST_BE_CHANGE )
	--local bagpos01 = TryRecieveItem( sceneId, selfId, 10124412, QUALITY_MUST_BE_CHANGE )
	--local bagpos01 = TryRecieveItem( sceneId, selfId, 10124451, QUALITY_MUST_BE_CHANGE )

	end
	
	if GetNumText() == 13 then
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )
	local itemInfo = GetBagItemTransfer( sceneId, selfId, bagpos01 )
	end
	
	if GetNumText() == 14 then
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10101012, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10100013, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10102015, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10103012, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10104012, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10105012, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
	local itemInfo = GetBagItemTransfer( sceneId, selfId, bagpos01 )
	end
	
	if GetNumText() == 15 then
			
			DispatchShopItem( sceneId, selfId, targetId, 132 )
	end
	
	if GetNumText() == 16 then
			
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10110052, QUALITY_MUST_BE_CHANGE )	
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10111052, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10112052, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10113052, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10114011, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10115011, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10120012, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10121012, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10122012, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10123012, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10122012, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10123012, QUALITY_MUST_BE_CHANGE )
	local itemInfo = GetBagItemTransfer( sceneId, selfId, bagpos01 )
	end
	
	if GetNumText() == 17 then
			
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10113052, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
	local itemInfo = GetBagItemTransfer( sceneId, selfId, bagpos01 )
	end
	
	
	
	if GetNumText() == 18 then
			
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10101011, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10100012, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10102011, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10103011, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10104011, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10105011, QUALITY_MUST_BE_CHANGE )	
	local itemInfo = GetBagItemTransfer( sceneId, selfId, bagpos01 )
	end
	
	
	
	if GetNumText() == 19 then
			
	local bagpos01 = TryRecieveItem( sceneId, selfId, 30509040, QUALITY_MUST_BE_CHANGE )	
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10111051, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10112051, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10113051, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10114010, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10115010, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10120011, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10121011, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10122011, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10123011, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10122011, QUALITY_MUST_BE_CHANGE )
	local bagpos01 = TryRecieveItem( sceneId, selfId, 10123011, QUALITY_MUST_BE_CHANGE )
	local itemInfo = GetBagItemTransfer( sceneId, selfId, bagpos01 )
	end
	
	
	
	
	if GetNumText() == 20 then
	message = format("@*;SrvMsg;SCA:#b#e6f00c7#c00ffff通知:服务器更新内容：增加马贼掉落低级宝石合成符号，所有boss有机会掉落6级材料10级11级装备鉴定符，圣火宫怪物，反贼喽啰很大机会掉落3/4级材料。 ", szNameSelf, szTransfer, szNameTarget );
	AddGlobalCountNews( sceneId, message )
	end
	
	if GetNumText() == 21 then
	message = format("@*;SrvMsg;SCA: Ph鋓 ch錸g c醕 h� 餫ng c� t靚h qu r痠 h� th痭g, ", szNameSelf, szTransfer, szNameTarget );
	AddGlobalCountNews( sceneId, message )
	end
	
	--加血
	if key == 0 then
		if GetHp( sceneId, selfId ) == GetMaxHp( sceneId, selfId ) and
			 GetMp( sceneId, selfId ) == GetMaxMp( sceneId, selfId ) then
			BeginEvent( sceneId )
			AddText( sceneId, "  你现在很健康，不需要治疗！" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			--取消指定玩家身上的所有敌对可驱散驻留效果
			LuaFnDispelAllHostileImpacts( sceneId, selfId )
			return
		end
	
		if gld <= 0 then
			x000126_Restore_hpmp( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId )
			AddText( sceneId, "  你需要花费#{_MONEY"..gld.."}来恢复血和气，确定要治疗嘛？" )
			AddNumText( sceneId, x000126_g_scriptId, "是", -1, 1001 )
			AddNumText( sceneId, x000126_g_scriptId, "否", -1, 1000 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	else
		for i, findId in x000126_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText() )	--GetNumText()是addnumtext中最后的变量
				return
			end
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000126_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000126_g_eventList do
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
function x000126_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000126_g_eventList do
		if missionScriptId == findId then
			x000126_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000126_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000126_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000126_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000126_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000126_OnDie( sceneId, selfId, killerId )
end

--**********************************
--恢复血和气
--**********************************
function x000126_Restore_hpmp( sceneId, selfId, targetId )
	RestoreHp( sceneId, selfId )
	RestoreMp( sceneId, selfId )
	
	local msg = ""
	-- 判断该npc是否是龙霸天
	if LuaFnGetName( sceneId, targetId ) == x000126_g_SpecialNPC then
		RestoreRage( sceneId, selfId )
		msg = "你的气血和怒气已经完全恢复。"
	else
		msg = "你的血和气已经恢复"
	end
	--取消指定玩家身上的所有敌对可驱散驻留效果
	LuaFnDispelAllHostileImpacts( sceneId, selfId )
	
	BeginEvent( sceneId )
		AddText( sceneId, msg );
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
end

--**********************************
--计算恢复血和气费用
--**********************************
--当玩家的等级在10级以下的时候，治疗不收费；
--大于等于10级以上收取的费用为：
--治疗费用＝（玩家最大生命值－当前生命值）×a+（玩家最大蓝值－当前蓝值）×b
function x000126_CalcMoney_hpmp( sceneId, selfId )
  
  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local	level	= GetLevel( sceneId, selfId )
	if level < 10 then	--如果玩家等级<10，则不需要钱
		return 0
	elseif level > PlayerMaxLevel then
		level	= PlayerMaxLevel
	end

	local	rat		= x000126_g_rat[ floor(level/10) + 1 ]
	local hp		= GetHp( sceneId, selfId )
	local maxhp	= GetMaxHp( sceneId, selfId )
	local mp		= GetMp( sceneId, selfId )
	local maxmp	= GetMaxMp( sceneId, selfId )
	local	gld		= floor( (maxhp-hp) * rat[2] + (maxmp-mp) * rat[3] )
	if gld < 1 then
		gld				= 100
	end
	return gld
end



