--珍兽补充血和快乐度

--脚本号
x701603_g_ScriptId	= 701603

--**********************************
--任务入口函数
--**********************************
function x701603_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum )
	--计算珍兽数量，如果是0，则给出相应提示
	local PetNum		= LuaFnGetPetCount( sceneId, selfId )
	local NpcName
	if PetNum <= 0 then
		local NpcName	= GetName( sceneId, targetId )
		BeginEvent( sceneId )
			AddText( sceneId, "<"..NpcName.."> quan s醫 c醕 h� k� t� 馥u t緄 ch鈔, nh靚 b阯 tr醝, nh靚 b阯 ph鋓, nh靚 稷ng sau, nheo m n骾 v緄 c醕 h�:#RC� mang tr鈔 th� t緄 疴u..." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	--获取出战珍兽的ObjId
	local	ObjId			= x701603_FightingPet( sceneId, selfId )
	
	--计算给珍兽治疗需要多少钱
	local	MoneyCost	= 0
	local i
	for i=0, PetNum-1, 1 do
		MoneyCost	= MoneyCost + x701603_CalcMoney_hp( sceneId, selfId, i )
	end

	if MoneyCost == 0 then
		BeginEvent( sceneId )
			AddText(sceneId, "Tr鈔 th� c黙 c醕 h� r kho� m課h, kh鬾g c ch鎍 tr�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		--取消指定玩家身上的所有敌对可驱散驻留效果
		if ObjId >= 0 then
			LuaFnDispelAllHostileImpacts( sceneId, ObjId )
		end
		return
	end
	
	local	Pet_MaxHP
	local PetID_H, PetID_L
	if ButtomNum == PET_FULL then
		BeginEvent( sceneId )
			AddText( sceneId, "C醕 h� c t痭 #G#{_EXCHG"..MoneyCost.."}#W, xin x醕 鸶nh c� mu痭 tr鈔 th� h癷 ph鴆 kh鬾g?" )
			--确定给珍兽加血按钮
			AddNumText( sceneId, x701603_g_ScriptId, "邪ng �", 6, PET_FULL_OK )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif ButtomNum == PET_FULL_OK then
		-- 得到交子和金钱数目
		local nMoneyJZ = GetMoneyJZ ( sceneId, selfId )
		local nMoney = GetMoney ( sceneId, selfId )
		
		--检查玩家是否有足够的现金
		if (nMoneyJZ + nMoney >= MoneyCost) then

			--扣除交子和金钱
			local moneyJZ, money = LuaFnCostMoneyWithPriority ( sceneId, selfId, MoneyCost )
		
			--珍兽回血
			for i=0, PetNum-1, 1 do
				Pet_MaxHP	= LuaFnGetPet_MaxHP( sceneId, selfId, i )

				--根据珍兽index得到珍兽guid
				PetID_H, PetID_L = LuaFnGetPetGUID( sceneId, selfId, i )
				--提升HP
				LuaFnSetPetHP( sceneId, selfId, PetID_H, PetID_L, Pet_MaxHP )
			end
			
			--取消指定玩家身上的所有敌对可驱散驻留效果
			if ObjId >= 0 then
				LuaFnDispelAllHostileImpacts( sceneId, ObjId )
			end

			--在npc聊天窗口通知玩家花费了多少钱，并告诉玩家珍兽已经恢复了
			if (moneyJZ == MoneyCost) then
				-- 只扣交子
				BeginEvent( sceneId )
					AddText( sceneId, "C醕 h� 疸 chi #G#{_EXCHG"..moneyJZ.."}#W, tr鈔 th� c黙 c醕 h� 疸 h癷 ph鴆 kh鰁 m課h." )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )

			elseif (moneyJZ > 0) and (moneyJZ + money) == MoneyCost then
				-- 扣除交子和金钱
				BeginEvent( sceneId )
					AddText( sceneId, "C醕 h� 疸 chi #G#{_EXCHG"..moneyJZ.."}#W." )
					AddText( sceneId, "C醕 h� 疸 chi #G#{_MONEY"..money.."}#W." )
					AddText( sceneId, "Tr鈔 th� c黙 c醕 h� 疸 h癷 ph鴆 kh鰁 m課h." )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )

			elseif (moneyJZ == 0) and ( money == MoneyCost) then
				-- 扣除金钱
				BeginEvent( sceneId )
					AddText( sceneId, "C醕 h� 疸 chi #G#{_MONEY"..money.."}#W, tr鈔 th� c黙 c醕 h� 疸 h癷 ph鴆 kh鰁 m課h." )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )

			else			
				BeginEvent( sceneId )
					AddText( sceneId, "Tr鈔 th� n鄖 r kh鰁 m課h, kh鬾g c ch鎍 tr�!" )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
			end
			
		-- 钱不够
		else
			BeginEvent( sceneId )
				AddText( sceneId, "C醕 h� kh鬾g 瘘 ng鈔 l唼ng" )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
			return

		end
	end
end

--**********************************
--列举事件
--**********************************
function x701603_OnEnumerate( sceneId, selfId, targetId )
	--添加按钮
	AddNumText(sceneId,x701603_g_ScriptId,"Tr� th呓ng cho tr鈔 th�", 6,PET_FULL)	--这里的PET_FULL是用来表示这个按钮是第一个页面的显示按钮，不是确定恢复的按钮
	return
end

--**********************************
--检测接受条件
--**********************************
function x701603_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x701603_OnAccept( sceneId, selfId, ABILITY_CAIKUANG )
end

--**********************************
--计算恢复血费用
--**********************************
--单位血驯养价值：0.025+n*0.0005（n为珍兽等级）
--单位快乐度价值：0.373+0.44*n（n为珍兽等级）
function x701603_CalcMoney_hp( sceneId, selfId, index )
	local lv			= LuaFnGetPet_Level( sceneId, selfId, index )
	local	hp			= LuaFnGetPet_HP( sceneId, selfId, index )
	local	hp_max	= LuaFnGetPet_MaxHP( sceneId, selfId, index )
	if hp >= hp_max then
		return 0
	end

	local	gld	= floor( ( 0.025+lv*0.0005 ) * (hp_max-hp) )
	if gld < 1 then
		gld			= 1
	end
	return gld
end

--**********************************
--获取出战珍兽的ObjId
--**********************************
function x701603_FightingPet( sceneId, selfId )
	local	PetNum	= LuaFnGetPetCount( sceneId, selfId )
	local	i
	local	PetID_H, PetID_L
	local	objId
	if PetNum <= 0 then
		return -1
	end
	
	for i=0, PetNum-1, 1 do
		--根据珍兽index得到珍兽guid
		PetID_H, PetID_L = LuaFnGetPetGUID( sceneId, selfId, i )
		objId	= LuaFnGetPetObjIdByGUID( sceneId, selfId, PetID_H, PetID_L )
		
		if objId >= 0 then
			return objId
		end
	end
	return -1
end
