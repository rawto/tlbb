--路三娘

--脚本号
x002042_g_scriptId = 002042


--所拥有的事件ID列表
x002042_g_eventList={210209,210287}

--**********************************
--事件列表
--**********************************
function x002042_UpdateEventList( sceneId, selfId,targetId )
	local  Menpai=LuaFnGetMenPai(sceneId,selfId)
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " S� mu礽 "
	else
		PlayerSex = " S� 甬 "
	end
	
	BeginEvent(sceneId)	
	if Menpai == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) <= 0 then --Add by S骾
		AddText(sceneId,"#{OBJ_dali_0021}")
	elseif Menpai == 4 then
		AddText(sceneId,"  "..PlayerSex..", nh靚 ng呓i ti猲 b� nhanh nh� v, M課h ch叻ng m鬾 nh鈔 h苙 vui l騨g l 疴y. H銀 v� Nga My S絥, ch叻ng m鬾 c� vi甤 nh� ng呓i 痼!")
	else
		AddText(sceneId,"A di 疣 ph. 醒c ph t� bi, ph� 鸬 ch鷑g sinh. Nh靚 c醕 h� th錸g ti猲 nhanh nh� v, m祎 nh鈔 t鄆 hi猰 c�, ti猚 thay kh鬾g � Nga My ta!...")
	end
	
	if	GetLevel( sceneId, selfId)<=10	then
		AddNumText(sceneId,x002042_g_scriptId,"衖 Nga My S絥 m祎 chuy猲",9,0)
	end
	misIndex = GetMissionIndexByID(sceneId,selfId,1060)			--得到任务的序列号
	if	IsHaveMission(sceneId,selfId,1060) > 0	 then
		if	GetMissionParam( sceneId, selfId, misIndex,0) < 1  and	 GetMissionParam( sceneId, selfId, misIndex,2) == 2   then
			AddNumText(sceneId,x002042_g_scriptId,"S� huynh c� m祎 b裞 th� 疬a cho ng呓i",4,1)
		end
	end
	for i, eventId in x002042_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002042_OnDefaultEvent( sceneId, selfId,targetId )
	x002042_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002042_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if IsHaveMission(sceneId,selfId,4021) > 0 then
			BeginEvent(sceneId)
				AddText(sceneId,"Tr阯 ng叨i ng呓i c� ng鈔 phi猽, kh鬾g th� truy玭 t痭g 疬㧟!");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else	
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 15,89,144)
		end
	elseif	GetNumText()==1	then
		misIndex = GetMissionIndexByID(sceneId,selfId,1060)			--得到任务的序列号
		DelItem (  sceneId, selfId, 40002115, 1)	
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		BeginEvent(sceneId)
			AddText(sceneId,"H銀 b醥 v緄 Tu� Ph呓ng s� huynh l� ta 疸 nh 疬㧟 th� c黙 huynh  r癷! C鋗 絥 ng呓i nhi玼")
		EndEvent( )
		DispatchEventList(sceneId,selfId,targetId)
		BeginEvent(sceneId)
			AddText(sceneId,"Nhi甿 v� ho鄋 th鄋h!")
		EndEvent( )
		DispatchMissionTips(sceneId,selfId)

	elseif   GetNumText()==10	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{MnepaiDesc_emei_1}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif   GetNumText()==11	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{MnepaiDesc_emei_2}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif   GetNumText()==12	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{MnepaiDesc_emei_3}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif   GetNumText()==13	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{MnepaiDesc_emei_4}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	else
		for i, findId in x002042_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
				return
			end
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002042_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002042_g_eventList do
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
function x002042_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002042_g_eventList do
		if missionScriptId == findId then
			x002042_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002042_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002042_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002042_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002042_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002042_OnDie( sceneId, selfId, killerId )
end
