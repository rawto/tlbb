--武当NPC
--静初散人
--普通

x012066_g_ScriptId = 012066

--**********************************
--事件交互入口
--**********************************
function x012066_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Ta c� th� truy玭 th� cho khinh c鬾g 穑c bi畉 c黙 b鋘 ph醝, c� 餴玼 c t痭 50 #-03")
		AddNumText(sceneId, x012066_g_ScriptId, "H鱟 khinh c鬾g ph醝 V� 衋ng",12,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x012066_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==0	then
		
		if GetMenPai(sceneId, selfId) == 3 then
			if	HaveSkill( sceneId, selfId, 26)<0	then
				-- 检查钱
				if GetMoney(sceneId, selfId)+GetMoneyJZ(sceneId, selfId) < STUDY_MENPAI_QINGGONG_SPEND  then
					BeginEvent(sceneId)
						AddText(sceneId,"Ng鈔 l唼ng tr阯 ng叨i c醕 h� kh鬾g 瘘 50 #-03, v� v kh鬾g th� h鱟 khinh c鬾g b鋘 m鬾")
					EndEvent(sceneId)
					DispatchEventList(sceneId,selfId,targetId)
					return
				end
				-- 扣钱
				LuaFnCostMoneyWithPriority(sceneId,selfId,STUDY_MENPAI_QINGGONG_SPEND)

				AddSkill( sceneId, selfId, 26 )
				DelSkill( sceneId, selfId, 34 )
				BeginEvent(sceneId)
					AddText(sceneId,"Ch鷆 m譶g ng呓i 疸 h鱟 疬㧟 khinh c鬾g c黙 b鋘 m鬾, hy v鱪g ng呓i ti猵 t鴆 n� l馽 瓞 ph醫 huy danh ti猲g b鋘 m鬾.")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			else
				BeginEvent(sceneId)
					AddText(sceneId,"Ch苙g ph鋓 ng呓i 疸 h鱟 r癷 sao?")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		elseif GetMenPai(sceneId, selfId) == 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"Mu痭 h鱟 khinh c鬾g c黙 ph醝 V� 衋ng, tr呔c ti阯 ph鋓 gia nh ph醝 V� 衋ng tr呔c 疸!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Ng呓i kh鬾g ph鋓 l� 甬 t� b鋘 m鬾, ta kh鬾g th� truy玭 th� khinh c鬾g c黙 V� 衋ng cho ng呓i 疬㧟")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	end	
end

--**********************************
--接受此NPC的任务
--**********************************
function x012066_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x012066_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
end

--**********************************
--继续（已经接了任务）
--**********************************
function x012066_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--提交已做完的任务
--**********************************
function x012066_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
end

--**********************************
--死亡事件
--**********************************
function x012066_OnDie( sceneId, selfId, killerId )
end
