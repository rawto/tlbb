--陈孤雁

--脚本号
x010000_g_scriptId = 010000

--所拥有的事件ID列表
x010000_g_eventList={221900,808004}
--x010000_g_eventList={200922,201021,201121,221900}

--**********************************
--事件列表
--**********************************
function x010000_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"Ta l� Tr C� Nh課, c醕 h� 皙n t靘 ta c� 餴玼 g� ch� gi醥?");
	for i, eventId in x010000_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	local mp = GetMenPai(sceneId, selfId)
	if mp == 9 then 
		AddNumText(sceneId, x010000_g_scriptId, "Gia nh m鬾 ph醝",6,0)
	end
	AddNumText(sceneId, x010000_g_scriptId, "Gi緄 thi畊 m鬾 ph醝",8,1)
	AddNumText(sceneId, x010000_g_scriptId, "H鱟 K� n錸g c黙 m鬾 ph醝?",8,6)		--指路到技能学习人
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x010000_OnDefaultEvent( sceneId, selfId,targetId )
	x010000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x010000_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText()==0	then

		x010000_g_MenPai = GetMenPai(sceneId, selfId)
		if x010000_g_MenPai == 2 then
			BeginEvent(sceneId)
				AddText(sceneId, "Ng呓i l読 t緄 phi玭 nhi璾 s� ph�, ng呓i 疸 l� 甬 t� C醝 Bang r癷, c騨 mu痭 b醝 s� g� n鎍")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if x010000_g_MenPai ~= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"Ng呓i 疸 l� cao 鸢 c黙 m鬾 ph醝 kh醕, C醝 Bang kh鬾g thu nh ng呓i")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		BeginEvent(sceneId)
			AddText(sceneId, "#{MenpaiInfo_002}")
			AddNumText(sceneId, x010000_g_scriptId, "Ta mu痭 gia nh C醝 Bang",6,3)
			AddNumText(sceneId, x010000_g_scriptId, "T読 h� ch遖 mu痭 b醝 s�",8,4)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		 
		return
	end
	
	if GetNumText()==4	then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
	
	if	GetNumText()==3	then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
			BeginEvent(sceneId)
				AddText(sceneId,"H銀 s x猵 l読 tay n鋓, c 2 v� tr� tr痭g, ta s� th叻ng cho ng呓i!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif GetLevel( sceneId, selfId ) < 10 then
			BeginEvent(sceneId)
				AddText(sceneId,"C醕 h� h銀 瘙i t緄 sau c 10 l読 t緄 b醝 s� h鱟 ngh�!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			x010000_g_MenPai = GetMenPai(sceneId, selfId)
			if x010000_g_MenPai == 2 then
				BeginEvent(sceneId)
					AddText(sceneId, "Ng呓i l読 t緄 phi玭 nhi璾 s� ph�, ng呓i 疸 l� 甬 t� C醝 Bang r癷, c騨 mu痭 b醝 s� g� n鎍")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			--返回值为9表示无门派
			elseif x010000_g_MenPai==9	then
				AddText(sceneId,"V th� b 馥u t� b鈟 gi�, ng呓i 疸 l� 甬 t� c黙 C醝 Bang ta r癷")
				LuaFnJoinMenpai(sceneId, selfId, targetId, 2)

				-- 设置初始的Npc关系值
				CallScriptFunction( 200099, "InitRelation", sceneId, selfId )

				-- 把相关的心法设置为10级别  13,16,17
				LuaFnSetXinFaLevel(sceneId,selfId,13,10)
				LuaFnSetXinFaLevel(sceneId,selfId,16,10)
				LuaFnSetXinFaLevel(sceneId,selfId,17,10)

				BeginEvent(sceneId)
					AddText(sceneId,"C醕 h� 疸 gia nh C醝 Bang!");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				
				if TryRecieveItem( sceneId, selfId, 10124002, 1 ) >= 0 then
					str		= "#YC醕 h� 疸 nh 疬㧟 "..GetItemName( sceneId, 10124002 ).."."
					x010000_MsgBox( sceneId, selfId, str)					
				end
				
				--给玩家发信,告诉他到哪里打怪,怎样赚钱
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_6}" )
				--LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{OBJ_gaibang_0001}" )
				
				--门派奖励召集令
				for i=1, 20 do
					TryRecieveItem( sceneId, selfId, 30501001, 1 )
				end
				x010000_MsgBox( sceneId, selfId, "Nh 疬㧟 20 c醝 M鬾 Ph醝 Tri畊 T L畁h" )

				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnMsg2Player( sceneId, selfId,"C醕 h� 疸 gia nh C醝 Bang!",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 162, 0)
					CallScriptFunction( 221900, "OnDefaultEvent",sceneId, selfId, targetId )
				else
					LuaFnMsg2Player( sceneId, selfId,"C醕 h� 疸 gia nh C醝 Bang!",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 162, 0)
					CallScriptFunction( 221900, "OnDefaultEvent",sceneId, selfId, targetId )
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId,"Ng呓i 疸 l� cao 鸢 c黙 m鬾 ph醝 kh醕, C醝 Bang kh鬾g thu nh ng呓i")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		end
	elseif	GetNumText()==1	then
		BeginEvent(sceneId)
			AddText(sceneId, "#{OBJ_gaibang_0002}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		for i, findId in x010000_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_GAIBANG )
				return
			end
		end
	end
	--指路
	if GetNumText()==6 then
		BeginEvent(sceneId)
			AddText(sceneId, "H� Tam K� (93, 99) c� th� d誽 ng呓i k� n錸g chi猲 黏u c黙 b眓 ph醝, 鬾g ngay � b阯 c課h ta.")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 93, 99, "H� Tam K�" )
		return
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x010000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010000_g_eventList do
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
function x010000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x010000_g_eventList do
		if missionScriptId == findId then
			x010000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x010000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x010000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x010000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x010000_OnDie( sceneId, selfId, killerId )
end

--**********************************
--消息提示
--**********************************
function x010000_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
