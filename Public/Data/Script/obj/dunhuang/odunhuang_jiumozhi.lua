--敦煌NPC
--鸠摩智
--普通

--脚本号
x008011_g_scriptId = 008011

--所拥有的事件ID列表
x008011_g_eventList={200099,200100}

x008011_g_RSMissionId = 101
x008011_g_ActivateMissionId = 37			-- 激活条件
x008011_g_SongXinScriptId = 006668		-- 送信
x008011_g_ShaGuaiScriptId = 006666		-- 杀怪
x008011_g_XunWuScriptId = 006667			-- 寻物

x008011_g_RoundStorytelling = {
		[0] = { misIndex = { 1039550 }, script = x008011_g_XunWuScriptId },
		[1] = { misIndex = { 1039551 }, script = x008011_g_XunWuScriptId },
		[2] = { misIndex = { 1039552 }, script = x008011_g_XunWuScriptId },
		[3] = { misIndex = { 1039553 }, script = x008011_g_XunWuScriptId },
		[4] = { misIndex = { 1039554 }, script = x008011_g_XunWuScriptId }}
			
x008011_g_SongXinMissionList = {
		[0] = { misIndex = { 1018530,1018534,1018538 }, script = x008011_g_SongXinScriptId },
		[1] = { misIndex = { 1018531,1018535,1018539 }, script = x008011_g_SongXinScriptId },
		[2] = { misIndex = { 1018532,1018536,1018540 }, script = x008011_g_SongXinScriptId },
		[3] = { misIndex = { 1018533,1018537,1018541 }, script = x008011_g_SongXinScriptId }}
			
x008011_g_ShaGuaiMissionList = {
		[0] = { misIndex = { 1009100 }, script = x008011_g_ShaGuaiScriptId },
		[1] = { misIndex = { 1009101 }, script = x008011_g_ShaGuaiScriptId },
		[2] = { misIndex = { 1009102 }, script = x008011_g_ShaGuaiScriptId },
		[3] = { misIndex = { 1009103 }, script = x008011_g_ShaGuaiScriptId }}
			

--**********************************
--事件列表
--**********************************
function x008011_UpdateEventList( sceneId, selfId,targetId )
	
	local PlayerName = GetName( sceneId, selfId )
	local PlayerSex = GetSex( sceneId, selfId )
	if PlayerSex == 0 then
		PlayerSex = " c� n呓ng "
	else
		PlayerSex = " thi猽 hi畃 "
	end

	BeginEvent( sceneId )
		AddText(sceneId,"Th� ch� phong tr 疬秐g xa 皙n Ng鱟 M鬾 Quan l� 瓞 餴 n呔c T鈟 H� ch錸g? Th� l瞚 cho ti瑄 t錸g n骾 n錸g th苙g th,  疬秐g c黙 th� ch� t痠 m鄒, l n鄖 餴 T鈟 H�  h苙 l鄋h 韙 d� nhi玼, t痶 nh l� n阯 s緈 quay v� Trung Nguy阯, m緄 l� k� v課 to鄋")

		local missionIndex = GetScriptIDByMissionID( sceneId, selfId, x008011_g_RSMissionId )
		if missionIndex ~= -1 then
			local missionName = TGetMissionName( missionIndex )
			if missionName ~= "Nhi甿 v� C遳 Ma Tr�" and IsMissionHaveDone( sceneId, selfId, x008011_g_ActivateMissionId ) > 0 then
				AddNumText( sceneId, x008011_g_scriptId, "Nhi甿 v� C遳 Ma Tr�", 3, 1 )
			end
		elseif IsMissionHaveDone( sceneId, selfId, x008011_g_ActivateMissionId ) > 0 then
			AddNumText( sceneId, x008011_g_scriptId, "Nhi甿 v� C遳 Ma Tr�", 3, 1 )
		end

		for i, eventId in x008011_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
					
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--事件交互入口
--**********************************
function x008011_OnDefaultEvent( sceneId, selfId,targetId )
	x008011_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x008011_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x008011_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
		
	local num = GetNumText()
	if num == 1 then										-- Nhi甿 v� C遳 Ma Tr�
		if IsHaveMission( sceneId, selfId, x008011_g_RSMissionId ) > 0 then
			x008011_NotifyFailBox( sceneId, selfId, targetId, "C醕 h� c� nhi甿 v� ch遖 ho鄋 th鄋h, 瘙i ho鄋 th鄋h xong l読 皙n t靘 t読 h�." )
			return
		end
		
		-- 检测是否满足任务激活条件
		if IsMissionHaveDone( sceneId, selfId, x008011_g_ActivateMissionId ) <= 0 then
			return 0
		end
		
		--看下今天的Nhi甿 v� C遳 Ma Tr硎遣皇亲鐾�50次了
		--begin modified by zhangguoxin 090208
		local nDayCount = GetMissionData(sceneId, selfId, MD_JQXH_JIUMOZHI_LIMITI)
		local nCount = 		floor(nDayCount/100000)
		local nTime = 		mod(nDayCount,100000)
		--local nDayTime = 	floor(nTime/100)	--上一次交任务的时间(天数)
		local nDayTime = 	nTime								--上一次交任务的时间(天数)
		
		--local CurTime = GetHourTime()				--当前时间
		local CurTime = GetDayTime()					--当前时间
		--local CurDaytime = floor(CurTime/100)	--当前时间(天)
		local CurDaytime = CurTime							--当前时间(天)
		--end modified by zhangguoxin 090208
		
		if nDayTime == CurDaytime  then -- 当天
			if nCount >= 50  then
				BeginEvent( sceneId )
					AddText( sceneId, "H鬽 nay c醕 h� 疸 g qu� nhi玼 chuy畁 phi玭 ph裞 r癷, th xin l瞚, ng鄖 mai m緄 l鄊 phi玭 c醕 h� n鎍 v!" )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				return
			end
			
		else		-- 新的一天
			SetMissionData(sceneId, selfId, MD_JQXH_JIUMOZHI_LIMITI, 0)
		end

		local mission = x008011_g_RoundStorytelling[0];
		local relation = GetMissionData(sceneId, selfId, MD_RELATION_JIUMOZHI)
		local playerlevel = GetLevel( sceneId, selfId )
		
		-- 等级上限处理
		if playerlevel >= 100 then
			playerlevel = 90
		end
		
		playerlevel = floor( playerlevel / 10 ) * 10
		local randtype = random(100)
		
		-- 送信任务
		if randtype <= 60 then
			if playerlevel == 60 then
				mission = x008011_g_SongXinMissionList[0];
			elseif playerlevel == 70 then
				mission = x008011_g_SongXinMissionList[1];
			elseif playerlevel == 80 then
				mission = x008011_g_SongXinMissionList[2];
			elseif playerlevel == 90 then
				mission = x008011_g_SongXinMissionList[3];			
			end
		-- 杀怪任务
		elseif randtype <= 95 then
			if playerlevel == 60 then
				mission = x008011_g_ShaGuaiMissionList[0];
			elseif playerlevel == 70 then
				mission = x008011_g_ShaGuaiMissionList[1];
			elseif playerlevel == 80 then
				mission = x008011_g_ShaGuaiMissionList[2];
			elseif playerlevel == 90 then
				mission = x008011_g_ShaGuaiMissionList[3];			
			end
		-- 寻物任务
		elseif randtype <= 100 then
			if relation <= 999 then
				mission = x008011_g_RoundStorytelling[0];
			elseif relation <= 1999 then
				mission = x008011_g_RoundStorytelling[1];
			elseif relation <= 3999 then
				mission = x008011_g_RoundStorytelling[2];
			elseif relation <= 6499 then
				mission = x008011_g_RoundStorytelling[3];
			elseif relation <= 9999 then
				mission = x008011_g_RoundStorytelling[4];
			end
		end
				
		CallScriptFunction( mission.script, "OnDefaultEvent", sceneId, selfId, targetId, mission.misIndex[ random( getn(mission.misIndex) ) ] )		
		
		return
	end	
	
end

--**********************************
--接受此NPC的任务
--**********************************
function x008011_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x008011_g_eventList do
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
function x008011_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x008011_g_eventList do
		if missionScriptId == findId then
			x008011_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end	
end

--**********************************
--继续（已经接了任务）
--**********************************
function x008011_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x008011_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end	
end

--**********************************
--提交已做完的任务
--**********************************
function x008011_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x008011_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end	
end

--**********************************
--死亡事件
--**********************************
function x008011_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x008011_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--提交物品
--**********************************
function x008011_OnMissionCheck( sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
	
	for i, eventId in x008011_g_XunWuScriptId do
		
		if eventId == scriptId then
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
			return 1
		end
	end
		
end
