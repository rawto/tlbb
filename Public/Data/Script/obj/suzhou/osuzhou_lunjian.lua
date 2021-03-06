-- 1062

--苏州NPC
--华山论剑报名人
--普通

--脚本号
x001064_g_scriptId = 001064

--所拥有的事件ID列表
x001064_g_eventList={001230} --{001230}


--**********************************
--事件交互入口
--**********************************
function x001064_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"T鴆 ng� n骾 r 瘊ng, v錸 v� 甬 nh, v� v� 甬 nh�, nh鈔 s� v� l鈓 皤u 餫ng trong Lu Ki猰 Hoa S絥 tranh nhau danh hi畊 thi阯 h� 甬 nh . N猽 c醕 h� mu痭 tham gia Lu Ki猰 Hoa S絥, ta c� th� b醥 d鄋h gi鷓 c醕 h� v� 疬a c醕 h� 皙n Hoa S絥. N猽 ng叨i ch絠 tham gia Lu Ki猰 Hoa S絥 疬㧟 li畉 v鄌 3 th� h鄋g 馥u c黙 m鬾 ph醝, c� th� 皙n ch� ta nh l頽h 1 ph th叻ng c黙 tri玼 痨nh, c醕 v� h銀 c� gg l阯!")
		
		AddNumText( sceneId, x001064_g_scriptId, "Gi緄 thi畊 Hoa S絥 lu ki猰", 11, 10 )	
		
		for i, eventId in x001064_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- 选中一项
--**********************************
function x001064_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
				AddText( sceneId, "#{function_help_064}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	
	for i, findId in x001064_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end

end
