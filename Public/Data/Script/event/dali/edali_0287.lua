-- 引荐加入门派任务
-- 在各门派的拜师NPC处增加一个选项：引荐加入门派!

x210287_g_ScriptId = 210287

--**********************************
--列举事件
--**********************************
function x210287_OnEnumerate( sceneId, selfId, targetId )
	local mp = GetMenPai(sceneId, selfId)
	if mp ~= 9 then 
		AddNumText(sceneId, x210287_g_ScriptId, "Ti猲 c� gia nh m鬾 ph醝", 1, 900);
	end
end

function x210287_OnDefaultEvent( sceneId, selfId, targetId )
	if GetNumText()==900  then
		local nNpcmenPai = -1
		-- 获得NPC的门派引导人的门派
		if GetName(sceneId, targetId) == "Tu� D竎h"  then
			nNpcmenPai = 0
		elseif GetName(sceneId, targetId) == "Th誧h B鋙"  then
			nNpcmenPai = 1
		elseif GetName(sceneId, targetId) == "Gi鋘 Ninh"  then
			nNpcmenPai = 2
		elseif GetName(sceneId, targetId) == "Tr呓ng Ho誧h"  then
			nNpcmenPai = 3
		elseif GetName(sceneId, targetId) == "L� Tam N呓ng"  then
			nNpcmenPai = 4
		elseif GetName(sceneId, targetId) == "H鋓 Phong T�"  then
			nNpcmenPai = 5
		elseif GetName(sceneId, targetId) == "Ph� Tham"  then
			nNpcmenPai = 6
		elseif GetName(sceneId, targetId) == "Tr靚h Thanh S呓ng"  then
			nNpcmenPai = 7
		elseif GetName(sceneId, targetId) == "朽m T� V�"  then
			nNpcmenPai = 8
		end	
		
		--1,点击的时候首先判定玩家是否为本门派弟子，如果不是则弹出对话：只有本门弟子才能引荐未加入门派的玩家加入本门
		if nNpcmenPai ~= GetMenPai(sceneId, selfId)   then
			BeginEvent(sceneId)
				AddText(sceneId,"Ch� c� 甬 t� b鋘 m鬾 m緄 c� th� ti猲 c� ng叨i ch絠 ch遖 gia nh m鬾 ph醝 gia nh m鬾 ph醝.");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		BeginEvent(sceneId)
			AddText(sceneId,"Hi畁 gi� c醕 m鬾 ph醝 tranh c呔p ng叨i t鄆 k竎h li畉, v� v t読 h� quy猼 鸶nh, ph鄊 l� 甬 t� b鋘 m鬾 ti猲 c� 甬 t� ch遖 gia nh m鬾 ph醝 c b 10 gia nh b鋘 m鬾, s� c� gi鋓 th叻ng nh 鸶nh.");
			AddNumText(sceneId, x210287_g_ScriptId, "T読 h� c ti猲 c� ng叨i gia nh m鬾 ph醝", 1, 901)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	
	elseif GetNumText()== 901  then
	
		--一天只能引荐3次....
		local lastDayTime = GetMissionData(sceneId, selfId, MD_JOINMEIPAI_DAYTIME)
		local curDayTime = GetDayTime()
		if curDayTime > lastDayTime then
			SetMissionData(sceneId, selfId, MD_JOINMEIPAI_DAYTIME, curDayTime )
			SetMissionData(sceneId, selfId, MD_JOINMEIPAI_COUNT, 0 )
		end

		local TodayCount = GetMissionData(sceneId, selfId, MD_JOINMEIPAI_COUNT)
		if TodayCount > 2 then
			BeginEvent(sceneId)
				AddText(sceneId,"C醕 h� v� ng叨i ti猲 c� m祎 m靚h 皙n tr呔c t� 鸬i.");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		-- 获得这个玩家是不是和一个人单独组队了
		--PrintNum(GetTeamSize(sceneId,selfId))
		if GetTeamSize(sceneId,selfId) < 2  then
			BeginEvent(sceneId)
				AddText(sceneId,"C ph鋓 c鵱g ng叨i ch絠 疬㧟 ti猲 c� 皙n tr呔c t� 鸬i m緄 疬㧟.");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if GetTeamSize(sceneId,selfId) > 2  then
			BeginEvent(sceneId)
				AddText(sceneId,"携i t唼ng c醕 h� c ti猲 c� kh鬾g � g 疴y.");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		--判断自己带来的人，是不是符合条件
		if GetNearTeamCount(sceneId,selfId) ~= 2 then
			BeginEvent(sceneId)
				AddText(sceneId,"携i t唼ng c醕 h� c ti猲 c� kh鬾g � g 疴y.");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		local nPlayerId = GetNearTeamMember(sceneId,selfId,0)
		if nPlayerId == selfId  then
			nPlayerId = GetNearTeamMember(sceneId,selfId,1)
		end
		
		local tarPosX, tarPosZ = LuaFnGetWorldPos(sceneId, nPlayerId);
		local npcPosX, npcPosZ = LuaFnGetWorldPos(sceneId, targetId);
		local distSqNpcToPlayer = (tarPosX - npcPosX) * (tarPosX - npcPosX) + (tarPosZ - npcPosZ) * (tarPosZ - npcPosZ);
		if distSqNpcToPlayer >= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"携i t唼ng c醕 h� c ti猲 c� kh鬾g � g 疴y.");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
--		-- 获得这个新手的信息，
		if GetMenPai(sceneId,nPlayerId)~=9 or GetLevel(sceneId,nPlayerId)~= 10  then
			BeginEvent(sceneId)
				AddText(sceneId,"Ch� c� ng叨i ch絠 鹫t c b 10 v� kh鬾g gia nh m鬾 ph醝 kh醕, m緄 c� th� th鬾g qua ti猲 c� gia nh b鋘 m鬾.");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- 执行到这里，就可以给新手打开对话框
		BeginEvent(sceneId)
			local szStr = "" .. GetName(sceneId,selfId) .. " ti猲 c� c醕 h� gia nh m鬾 ph醝 " .. x210287_GetMenPaiName(GetMenPai(sceneId,selfId)) .. ", c醕 h� c� 鸢ng � gia nh kh鬾g?"
			AddText(sceneId, szStr)
			AddNumText(sceneId, x210287_g_ScriptId, "邪ng � gia nh", 1, 905)
			AddNumText(sceneId, x210287_g_ScriptId, "T読 h� c騨 suy ngh�", 1, 906)
		EndEvent(sceneId)
		DispatchEventList(sceneId,nPlayerId,targetId)
		
		BeginEvent(sceneId)
			AddText(sceneId,"C醕 h� 疸 疬a th� ti猲 c� cho t� 鸬i.")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif GetNumText()== 905  then
		-- 把自己加入这个门派，给介绍人，自己当前队友门派贡献度
		x210287_PlayerJoinMenpai(sceneId,selfId,targetId)
		
--		-- 关闭对话框
--		BeginUICommand(sceneId)
--		EndUICommand(sceneId)
--		DispatchUICommand(sceneId,selfId, 1000)
		
	elseif GetNumText()== 906  then
		-- 关闭对话框
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		
		--给队长提示我拒绝了引荐....
		if GetNearTeamCount(sceneId,selfId) ~= 2 then
			return
		end

		local nPlayerId = GetNearTeamMember(sceneId,selfId,0)
		if nPlayerId == selfId  then
			nPlayerId = GetNearTeamMember(sceneId,selfId,1)
		end

		if LuaFnIsCanDoScriptLogic(sceneId, nPlayerId) ~= 0  then
			BeginEvent(sceneId)
				AddText(sceneId,"携i ph呓ng t� ch痠 gi緄 thi畊 c黙 c醕 h�.")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nPlayerId)
		end

	end
	
end

function x210287_GetMenPaiName(nMenPaiId)
	local szMenPai = ""
	if nMenPaiId == 0 then
		szMenPai = "Thi猽 L鈓"
	elseif nMenPaiId == 1 then
		szMenPai =  "Minh Gi醥"
	elseif nMenPaiId == 2 then
		szMenPai =  "C醝 Bang"
	elseif nMenPaiId == 3 then
		szMenPai =  "V� 衋ng"
	elseif nMenPaiId == 4 then
		szMenPai =  "Nga My"
	elseif nMenPaiId == 5 then
		szMenPai =  "Tinh T鷆"
	elseif nMenPaiId == 6 then
		szMenPai =  "Thi阯 Long"
	elseif nMenPaiId == 7 then
		szMenPai =  "Thi阯 S絥"
	elseif nMenPaiId == 8 then
		szMenPai =  "Ti陁 Dao"
	end	
	
	return szMenPai
end

function x210287_PlayerJoinMenpai(sceneId,selfId,targetId)
	
	-- 适当做点安全性检查
	if GetTeamSize(sceneId,selfId) < 2  then
		BeginEvent(sceneId)
			AddText(sceneId,"C醕 h� c c鵱g ng叨i ti猲 c� c黙 c醕 h� gi� t� 鸬i");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetTeamSize(sceneId,selfId) > 2  then
		BeginEvent(sceneId)
			AddText(sceneId,"C ph鋓 c鵱g ng叨i ch絠 疬㧟 ti猲 c� 皙n tr呔c t� 鸬i.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	--判断自己带来的人，是不是符合条件
	if GetNearTeamCount(sceneId,selfId) ~= 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"Ng叨i ti猲 c� c黙 c醕 h� c ph鋓 � g 疴y.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	local nPlayerId = GetNearTeamMember(sceneId,selfId,0)
	if nPlayerId == selfId  then
		nPlayerId = GetNearTeamMember(sceneId,selfId,1)
	end
	
	-- 验证这个Id是不是有效
	if LuaFnIsCanDoScriptLogic(sceneId, nPlayerId) == 0  then
		return
	end
	
	local nMenPaiId = GetMenPai(sceneId, nPlayerId)
	
	if nMenPaiId < 0  or nMenPaiId > 8  then
		return
	end
	
	local szMenpai = x210287_GetMenPaiName(nMenPaiId)
	
	-- 制定加入门派的操作
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"H銀 s x猵 l読 tay n鋓, c 2 v� tr� tr痭g, ta s� th叻ng cho ng呓i!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetLevel( sceneId, selfId ) < 10 then
		BeginEvent(sceneId)
			AddText(sceneId,"C醕 h� h銀 tu luy畁 sau khi 鹫t #GC 10#W m緄 c� th� b醝 s� h鱟 ngh�!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		x210287_g_MenPai = GetMenPai(sceneId, selfId)
		if x210287_g_MenPai == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "Ng呓i 疸 l� 甬 t� b鋘 m鬾, c騨 b醝 s� g� n鎍?")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		--返回值为9表示无门派
		elseif x210287_g_MenPai==9	then
			
			LuaFnJoinMenpai(sceneId, selfId, targetId, nMenPaiId)

			-- 设置门派关系值
			CallScriptFunction( 200099, "InitRelation", sceneId, selfId )

			BeginEvent(sceneId)
  			AddText(sceneId,"C醕 h� 疸 gia nh " .. szMenpai .. "!");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			-- 把相关的心法设置为10级
			LuaFnSetXinFaLevel(sceneId,selfId, 1 + nMenPaiId*6, 10)
			LuaFnSetXinFaLevel(sceneId,selfId, 4 + nMenPaiId*6, 10)
			LuaFnSetXinFaLevel(sceneId,selfId, 5 + nMenPaiId*6, 10)
			
			if nMenPaiId == 0  then 		-- 少林
	  		if TryRecieveItem( sceneId, selfId, 10124000, 1 ) >= 0 then
					str		= "#YC醕 h� 疸 nh 疬㧟 "..GetItemName( sceneId, 10124000).."!"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 160, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_3}" )
			elseif nMenPaiId == 1  then  --明教
	  		if TryRecieveItem( sceneId, selfId, 10124001, 1 ) >= 0 then
					str		= "#YC醕 h� 疸 nh 疬㧟 "..GetItemName( sceneId, 10124001).."!"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 161, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_2}" )
			elseif nMenPaiId == 2  then  --丐帮
	  		if TryRecieveItem( sceneId, selfId, 10124002, 1 ) >= 0 then
					str		= "#YC醕 h� 疸 nh 疬㧟 "..GetItemName( sceneId, 10124002).."!"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 162, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_6}" )
			elseif nMenPaiId == 3  then		--武当派
	  		if TryRecieveItem( sceneId, selfId, 10124004, 1 ) >= 0 then
					str		= "#YC醕 h� 疸 nh 疬㧟 "..GetItemName( sceneId, 10124004).."!"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 163, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_9}" )
			elseif nMenPaiId == 4  then  --峨嵋派
	  		if TryRecieveItem( sceneId, selfId, 10124003, 1 ) >= 0 then
					str		= "#YC醕 h� 疸 nh 疬㧟 "..GetItemName( sceneId, 10124003).."!"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 164, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_4}" )
			elseif nMenPaiId == 5  then  --星宿派
	  		if TryRecieveItem( sceneId, selfId, 10124005, 1 ) >= 0 then
					str		= "#YC醕 h� 疸 nh 疬㧟 "..GetItemName( sceneId, 10124005).."!"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 165, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_1}" )
			elseif nMenPaiId == 6  then  --天龙派
	  		if TryRecieveItem( sceneId, selfId, 10124008, 1 ) >= 0 then
					str		= "#YC醕 h� 疸 nh 疬㧟 "..GetItemName( sceneId, 10124008).."!"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 166, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_5}" )
			elseif nMenPaiId == 7  then  --天山派
	  		if TryRecieveItem( sceneId, selfId, 10124006, 1 ) >= 0 then
					str		= "#YC醕 h� 疸 nh 疬㧟 "..GetItemName( sceneId, 10124006).."!"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 167, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_7}" )
			elseif nMenPaiId == 8  then  --逍遥派
	  		if TryRecieveItem( sceneId, selfId, 10124007, 1 ) >= 0 then
					str		= "#YC醕 h� 疸 nh 疬㧟 "..GetItemName( sceneId, 10124007).."!"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 168, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_8}" )
			end

			--门派奖励召集令
			for i=1, 20 do
				TryRecieveItem( sceneId, selfId, 30501001, 1 )
			end
			x210287_MsgBox( sceneId, selfId, "Nh 疬㧟 20 c醝 M鬾 Ph醝 Tri畊 T L畁h" )

			if	LuaFnGetSex( sceneId, selfId)==0	then
				LuaFnMsg2Player( sceneId, selfId,"C醕 h� 疸 gia nh " .. szMenpai .. "!",MSG2PLAYER_PARA)
--				CallScriptFunction( 220900, "OnDefaultEvent",sceneId, selfId, targetId )
			else
				LuaFnMsg2Player( sceneId, selfId,"C醕 h� 疸 gia nh " .. szMenpai .. "!",MSG2PLAYER_PARA)
--				CallScriptFunction( 220900, "OnDefaultEvent",sceneId, selfId, targetId )
			end
			
			--给推荐人奖励 JOIN_MENPAI_WELCOME nPlayerId
			local nMenpaiPoint = GetHumanMenpaiPoint(sceneId, nPlayerId)
			SetHumanMenpaiPoint(sceneId, nPlayerId, nMenpaiPoint+20)
			LuaFnMsg2Player(sceneId, nPlayerId,"V� c� s� ti猲 c� c黙 c醕 h�, c醕 h� nh 疬㧟 鸬 c痭g hi猲 s� m鬾 s� m鬾!",MSG2PLAYER_PARA)
			
			--增加今天推荐的次数....
			local TodayCount = GetMissionData(sceneId, nPlayerId, MD_JOINMEIPAI_COUNT)
			SetMissionData(sceneId, nPlayerId, MD_JOINMEIPAI_COUNT, TodayCount+1 )

			-- 门派公告
			local szPlayer1 = GetName(sceneId, selfId)
			local szPlayer2 = GetName(sceneId, nPlayerId)
			local szBroad = "@*;SrvMsg;" .. "tuijian_join_menpai" ..";"..szPlayer1..";"..szPlayer2..";"..szPlayer2
			
			BroadMsgByChatPipe(sceneId, selfId, szBroad, 7)
			
			-- 给被引荐人一个对话提示
			BeginEvent(sceneId)
				AddText(sceneId, "C醕 h� 疸 tr� th鄋h 甬 t� c黙 b鋘 ph醝.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
		end
	end
	
end

--**********************************
--消息提示
--**********************************
function x210287_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
