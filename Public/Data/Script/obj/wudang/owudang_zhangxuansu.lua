--武当NPC
--掌门人
--张玄素
--普通

x012006_g_scriptId = 012006
x012006_g_eventList={223900,229009,808004,229012, 808092}
--**********************************
--事件交互入口
--**********************************
function x012006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"B 鹫o ch韓h l� Tr呓ng Huy玭 T�, 痂n nhang 姓o gia tr阯 n鷌 V� 衋ng, 疬㧟 b 鹫o s醤g l m叨i l錷 n錷 v� tr呔c.")
		local mp = GetMenPai(sceneId, selfId)
		if mp == 9 then 
			AddNumText(sceneId, x012006_g_scriptId, "Gia nh m鬾 ph醝",6,0)
		end
		AddNumText(sceneId, x012006_g_scriptId, "Gi緄 thi畊 m鬾 ph醝",8,1)
		AddNumText(sceneId, x012006_g_scriptId, "H鱟 K� n錸g c黙 m鬾 ph醝?",8,6)		--指路到技能学习人
		for i, eventId in x012006_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x012006_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x012006_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_WUDANG )
			return
		end
	end

	if GetNumText()==0	then

		x012006_g_MenPai = GetMenPai(sceneId, selfId)
		if x012006_g_MenPai == 3   then
			BeginEvent(sceneId)
				AddText(sceneId, "Ng呓i l読 皙n ti陁 khi琻 vi s� r癷, ng呓i 疸 l� 甬 t� c黙 ph醝 V� 衋ng ta, c騨 皙n b醝 s� l鄊 g� n鎍 c� ch�. Gi辬 m �?")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if x012006_g_MenPai ~= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"Ng呓i 疸 l� cao 鸢 c黙 m鬾 ph醝 kh醕, ch鷑g ta kh鬾g thu nh ng呓i")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		BeginEvent(sceneId)
			AddText(sceneId, "#{MenpaiInfo_003}")
			AddNumText(sceneId, x012006_g_scriptId, "Ta mu痭 gia nh V� 衋ng",6,3)
			AddNumText(sceneId, x012006_g_scriptId, "T読 h� ch遖 mu痭 b醝 s�",8,4)
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

	if GetNumText()==3	then
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
			x012006_g_MenPai = GetMenPai(sceneId, selfId)
			if x012006_g_MenPai == 3 then
				BeginEvent(sceneId)
					AddText(sceneId, "Ng呓i l読 皙n ti陁 khi琻 vi s� r癷, ng呓i 疸 l� 甬 t� c黙 ph醝 V� 衋ng ta, c騨 皙n b醝 s� l鄊 g� n鎍 c� ch�. Gi辬 m �?")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			--返回值为9表示无门派
			elseif x012006_g_MenPai==9	then
				AddText(sceneId,"V th� b 馥u t� b鈟 gi�, ng呓i ch韓h th裞 l� 甬 t� ph醝 V� 衋ng c黙 ta!")
				LuaFnJoinMenpai(sceneId, selfId, targetId, 3)

				-- 设置初始的Npc关系值
				CallScriptFunction( 200099, "InitRelation", sceneId, selfId )

				-- 把相关的心法设置为10级别  19,22,23
				LuaFnSetXinFaLevel(sceneId,selfId,19,10)
				LuaFnSetXinFaLevel(sceneId,selfId,22,10)
				LuaFnSetXinFaLevel(sceneId,selfId,23,10)

				BeginEvent(sceneId)
	  				AddText(sceneId,"C醕 h� 疸 gia nh ph醝 V� 衋ng!");
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,selfId)
				--给玩家发信,告诉他到哪里打怪,怎样赚钱
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_9}" )
				--LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{OBJ_wudang_0002}" )
				
				--门派奖励召集令
				for i=1, 20 do
					TryRecieveItem( sceneId, selfId, 30501001, 1 )
				end
				x012006_MsgBox( sceneId, selfId, "Nh 疬㧟 20 c醝 M鬾 Ph醝 Tri畊 T L畁h" )

				if TryRecieveItem( sceneId, selfId, 10124004, 1 ) >= 0 then
					str		= "#YC醕 h� nh 疬㧟 "..GetItemName( sceneId, 10124004 ).."."
					x012006_MsgBox( sceneId, selfId, str )
				end
				
				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnMsg2Player( sceneId, selfId,"C醕 h� 疸 gia nh ph醝 V� 衋ng!",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 163, 0)
					CallScriptFunction( 223900, "OnDefaultEvent",sceneId, selfId, targetId )
				else
					LuaFnMsg2Player( sceneId, selfId,"C醕 h� 疸 gia nh ph醝 V� 衋ng!",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 163, 0)
					CallScriptFunction( 223900, "OnDefaultEvent",sceneId, selfId, targetId )
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId,"Ng呓i 疸 l� cao 鸢 c黙 m鬾 ph醝 kh醕, ch鷑g ta kh鬾g thu nh ng呓i")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		end
	elseif	GetNumText()==1	then
		BeginEvent(sceneId)
			AddText(sceneId, "#{OBJ_wudang_0003}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	--指路
	if GetNumText()==6 then
		BeginEvent(sceneId)
			AddText(sceneId, "Du Vi璶 S絥 [82,85] c� th� truy玭 d誽 k� n錸g chi猲 黏u c黙 m鬾 ph醝 ta cho ng呓i. Y 餫ng � b阯 c課h ta.")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 82, 85, "Du Vi璶 S絥" )
		return
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x012006_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x012006_g_eventList do
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
function x012006_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x012006_g_eventList do
		if missionScriptId == findId then
			x012006_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x012006_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x012006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x012006_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x012006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x012006_OnDie( sceneId, selfId, killerId )
end

--**********************************
--消息提示
--**********************************
function x012006_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
