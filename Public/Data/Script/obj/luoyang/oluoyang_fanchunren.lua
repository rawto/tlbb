--洛阳NPC
--范纯仁
--建立帮会
--脚本号
x000030_g_scriptId = 000030

--所拥有的事件ID列表
x000030_g_eventList={600000}

--**********************************
--事件交互入口
--**********************************
function x000030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Mu痭 s醤g l bang h礽 th� 皙n t靘 t読 h� nh�!")
	
	AddNumText( sceneId, x000030_g_scriptId, "Gi緄 thi畊 bang h礽 v� l鉵h 鸶a", 11, 10 )
	
		AddNumText(sceneId,x000030_g_scriptId,"Xem danh m鴆 bang h礽",6,2)	
		if IsShutout( sceneId, selfId, ONOFF_T_GUILD ) == 0 then
			AddNumText(sceneId,x000030_g_scriptId,"S醤g l bang h礽",6,1)
		end
		AddNumText(sceneId,x000030_g_scriptId,"Qu鋘 l� th鬾g tin h礽 vi阯",6,3)
		AddNumText(sceneId,x000030_g_scriptId,"Xem th鬾g tin bang h礽",6,4)
		if(GetHumanGuildID(sceneId, selfId) ~= -1) then
			if IsShutout( sceneId, selfId, ONOFF_T_CITY ) == 0 then
				AddNumText(sceneId,x000030_g_scriptId,"绣ng k� th鄋h ph�",6,5)
			end
			if(CityGetSelfCityID(sceneId, selfId) ~= -1) then
				AddNumText(sceneId,x000030_g_scriptId,"V鄌 th鄋h ph� c黙 b眓 bang",9,6)
			end
		end
		AddNumText(sceneId,x000030_g_scriptId,"Li阯 quan 鸬 ph皀 vinh c黙 bang ph醝",11,11)
		AddNumText(sceneId,x000030_g_scriptId,"Gi緄 thi畊 邪ng Minh",11,12)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000030_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_069}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	if GetNumText() == 11 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{Guild_Boom_Help}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	if GetNumText() == 12 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{TM_20080331_07}".."#{TM_20080320_02}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	local sel = GetNumText();
	for i, eventId in x000030_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId, sel)
	end
end
