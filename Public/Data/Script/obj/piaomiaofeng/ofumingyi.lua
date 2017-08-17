--��翷帱��....
--�����ǶԻ��ű�....

--�ű���
x402273_g_ScriptId = 402273

--�����߼��ű���....
x402273_g_FuBenScriptId = 402263

--����buff��....
x402273_g_ZhenSheBuffTbl = { 10264, 10265, 10266 }
--��Ȥbuff��....
x402273_g_YouQuBuffTbl = { 10261, 10262, 10263 }


--**********************************
--������ں���....
--**********************************
function x402273_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "#{PMF_20080521_12}" )

		--�жϵ�ǰ�Ƿ������ս˫��....	
		if 1 == CallScriptFunction( x402273_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "ShuangZi" ) then
			AddNumText( sceneId, x402273_g_ScriptId, "Khi�u chi�n B�t B�nh ��o Nh�n c�ng Tr�c B�t Ph�m", 10, 1 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x402273_OnEventRequest( sceneId, selfId, targetId, eventId )

	--������ڼ���BOSS�򷵻�....
	if 1 == CallScriptFunction( x402273_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
		return
	end

	--�ǲ��Ƕӳ�....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		BeginEvent(sceneId)
			AddText( sceneId, "#{PMF_20080521_07}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�жϵ�ǰ�Ƿ������ս˫��....	
	if 1 ~= CallScriptFunction( x402273_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "ShuangZi" ) then
		return
	end

	--������ںͱ��BOSSChi�n �u �򷵻�....
	local ret, msg = CallScriptFunction( x402273_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--������翷��ʱ���������Լ�....
	CallScriptFunction( x402273_g_FuBenScriptId, "OpenPMFTimer", sceneId, 16, x402273_g_ScriptId, -1 ,-1 )
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--��翷��ʱ����OnTimer....
--**********************************
function x402273_OnPMFTimer( sceneId, step, data1, data2 )

	if 16 == step then
		MonsterTalk(sceneId, -1, "", "#{PMF_20080521_13}" )
		return
	end

	if 13 == step then
		MonsterTalk(sceneId, -1, "", "#{PMF_20080521_14}" )
		return
	end

	if 10 == step then
		MonsterTalk(sceneId, -1, "", "#{PMF_20080521_15}" )
		return
	end

	if 7 == step then
		MonsterTalk(sceneId, -1, "", "#{PMF_20080521_16}" )
		x402273_UseZhenShe( sceneId )
		CallScriptFunction( x402273_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 5 gi�y sau b�t �u." )
		return
	end

	if 6 == step then
		CallScriptFunction( x402273_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 4 gi�y sau b�t �u." )
		return
	end

	if 5 == step then
		CallScriptFunction( x402273_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 3 gi�y sau b�t �u." )
		return
	end

	if 4 == step then
		MonsterTalk(sceneId, -1, "", "#{PMF_20080521_17}" )
		x402273_UseYouQu( sceneId )
		CallScriptFunction( x402273_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 2 gi�y sau b�t �u." )
		return
	end

	if 3 == step then
		CallScriptFunction( x402273_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 1 gi�y sau b�t �u." )
		return
	end

	if 2 == step then
		--��ʾChi�n �u b�t �u.....
		CallScriptFunction( x402273_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u b�t �u." )
		return
	end

	if 1 == step then
		--����BOSS....
		CallScriptFunction( x402273_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuoBuFan_BOSS", -1, -1 )
		CallScriptFunction( x402273_g_FuBenScriptId, "CreateBOSS", sceneId, "BuPingDaoRen_BOSS", -1, -1 )
		return
	end

end

--**********************************
--��������....
--**********************************
function x402273_UseZhenShe( sceneId )

	local bossId = CallScriptFunction( x402273_g_FuBenScriptId, "FindBOSS", sceneId, "FuMinYi_NPC" )
	if bossId == -1 then
		return
	end

	local idx = random( getn(x402273_g_ZhenSheBuffTbl) )
	local buffId = x402273_g_ZhenSheBuffTbl[idx]

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, buffId, 0 )
		end
	end

end

--**********************************
--������Ȥ....
--**********************************
function x402273_UseYouQu( sceneId )

	local bossId = CallScriptFunction( x402273_g_FuBenScriptId, "FindBOSS", sceneId, "FuMinYi_NPC" )
	if bossId == -1 then
		return
	end

	local idx = random( getn(x402273_g_YouQuBuffTbl) )
	local buffId = x402273_g_YouQuBuffTbl[idx]

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, buffId, 0 )
		end
	end

end