--生活技能
--活血

--2006-9-18 17:05 (这个文件存在的意义是为了兼容、及扩展，所有真正的判断，都在ecity_lifeskillstudy.lua中实现)
x713622_g_ScriptId 		= 713622
x713622_g_AbilityName	= "Ho誸 huy猼"
x713622_g_AbilityID		= ABILITY_HUOXUE

-- 处理玩家所做的选择
function x713622_OnDefaultEvent( sceneId, selfId, targetId, nNum, npcScriptId, bid )
	if bid then
		if 0 == nNum then	--学习
			if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
				return
			end
			BeginEvent(sceneId)
			local lv,money,con
			lv,money,con = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713622_g_AbilityID, bid, 4)
			local studyMsg = format("N猽 c醕 h� 鹫t t緄 c %d, ph鋓 ti陁 t痭 #{_MONEY%d} v� %d 餴琺 bang h礽 m緄 c� th� h鱟 k� n錸g huy猼 h鱟. C醕 h� c� quy猼 鸶nh h鱟 kh鬾g?", lv, money, con)
			AddText(sceneId,studyMsg)
			--确定学习按钮
					AddNumText(sceneId,x713622_g_ScriptId,"T読 h� x醕 鸶nh mu痭 h鱟", 6, 3)
			--取消学习按钮
					AddNumText(sceneId,x713622_g_ScriptId,"T読 h� ch� mu痭 coi", 8, 4)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif 1 == nNum then	--升级
			if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
				return
			end
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713622_g_AbilityID, bid, 2)
			if ret > 0 then
				CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713622_g_AbilityID, bid, 2)
			end
		elseif 2 == nNum then	--了解
			local dialog = "#{event_liveabilityevent_0031}"
			BeginEvent(sceneId)
				AddText(sceneId, dialog)
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
		elseif 3 == nNum then	--确定学习
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713622_g_AbilityID, bid, 1)
			if ret > 0 then
				CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713622_g_AbilityID, bid, 1)
			end
		elseif 4 <= nNum then	--只来看看
			CallScriptFunction( npcScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
		end
	else
		-- 目前活血技能必须在城市里才能学习、升级、了解
	end
end

-- 列举选项
-- nNum == 1 学习
-- nNum == 2 升级
-- nNum == 3 了解
function x713622_OnEnumerate( sceneId, selfId, targetId, bid, nNum)
	if bid then
		if 1 == nNum then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713622_g_AbilityID, bid, 5)
			if ret > 0 then AddNumText(sceneId,x713622_g_ScriptId,"H鱟 "..x713622_g_AbilityName.." k� n錸g", 12, 0) end
			return
		elseif 2 == nNum then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713622_g_AbilityID, bid, 6)
			if ret > 0 then AddNumText(sceneId,x713622_g_ScriptId,"Th錸g c "..x713622_g_AbilityName.." k� n錸g", 12, 1) end
			return
		elseif 3 == nNum then
			AddNumText(sceneId,x713622_g_ScriptId,"T読 h� mu痭 t靘 hi瑄 huy猼 h鱟",11,2)
			AddNumText(sceneId,x713622_g_ScriptId,"Quay l読",8,5)
		end
	else
		-- 目前活血技能必须在城市里才能学习、升级、了解
	end
end
