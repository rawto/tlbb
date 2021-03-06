--简宁

--脚本号
x002039_g_scriptId = 002039


--所拥有的事件ID列表
x002039_g_eventList={210209,210287}

--**********************************
--事件列表
--**********************************
function x002039_UpdateEventList( sceneId, selfId,targetId )
	
	local  Menpai=LuaFnGetMenPai(sceneId,selfId)
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "Nha 馥u"
	else
		PlayerSex = "Huynh 甬"
	end
	
	BeginEvent(sceneId)	
	if Menpai == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) <= 0 then --Add by S骾
		AddText(sceneId,"#{OBJ_dali_0018}")
	elseif Menpai == 2 then
		AddText(sceneId,"  "..PlayerSex..", v� c鬾g c黙 ng呓i ti猲 b� nhanh th!#r#rTa 疴y C醝 Bang Tr叨ng Giang l緋 l緋 cao th� xu th�...#r#rKh� kh�... Xem ra l鉶 疴y 疸 gi� r癷...")
	else
		AddText(sceneId,"Kh� kh�...L鈛 r癷 kh鬾g g ng呓i, nh靚 ng呓i nh� v l鄊 ta ti猚 thay, ti猚 thay trong C醝 Bang kh鬾g c� m祎 ng叨i nh� ng呓i...")
	end
	
	if	GetLevel( sceneId, selfId)<=10	then
		AddNumText(sceneId,x002039_g_scriptId,"衖 C醝 Bang T眓g 朽 m祎 chuy猲.",9,0)
	end
	for i, eventId in x002039_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002039_OnDefaultEvent( sceneId, selfId,targetId )
	x002039_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002039_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if IsHaveMission(sceneId,selfId,4021) > 0 then
			BeginEvent(sceneId)
				AddText(sceneId,"Ng呓i 餫ng trong tr課g th醝 T鄌 V ho Th呓ng Nh鈔, kh鬾g th� d竎h chuy琻.");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else	
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 10,92,153)
		end

	elseif   GetNumText()==10	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{MnepaiDesc_gaibang_1}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif   GetNumText()==11	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{MnepaiDesc_gaibang_2}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif   GetNumText()==12	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{MnepaiDesc_gaibang_3}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif   GetNumText()==13	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{MnepaiDesc_gaibang_4}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	else
		for i, findId in x002039_g_eventList do
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
function x002039_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002039_g_eventList do
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
function x002039_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002039_g_eventList do
		if missionScriptId == findId then
			x002039_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002039_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002039_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002039_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002039_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002039_OnDie( sceneId, selfId, killerId )
end
