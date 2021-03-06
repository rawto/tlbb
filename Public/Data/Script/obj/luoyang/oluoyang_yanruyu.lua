-- 000131
-- 
--脚本号
x000131_g_scriptId = 000131

--所拥有的事件ID列表
x000131_g_eventList = { 805029, 805030 }

--**********************************
--事件交互入口
--**********************************
function x000131_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"T鴆 ng� n骾, t呔ng do tr秈 sinh, kh醕h quan 鸠i v緄 di畁 m誳 c黙 b鋘 th鈔 疸 遪g � ch遖, c� mu痭 l鄊 ch鷗 thay 鸨i kh鬾g?")
		AddNumText( sceneId, x000131_g_scriptId, "Gi緄 thi畊 s豠 dung m誳", 11, 10 )
		AddNumText(sceneId,x000131_g_scriptId,"S豠 dung m誳",6,1)
		AddNumText( sceneId, x000131_g_scriptId, "Gi緄 thi畊 thay 鸨i h靚h bi瑄 t唼ng nh鈔 v", 11, 14 )
		AddNumText(sceneId,x000131_g_scriptId,"Thay 鸨i h靚h bi瑄 t唼ng nh鈔 v",6,4)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000131_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 10 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{function_help_088}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	if GetNumText() == 14 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{INTERHEAD_XML_008}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText() == 1 then
		-- 修改脸型
		CallScriptFunction( 805029, "OnEnumerate",sceneId, selfId, targetId )
		return
	end
	if GetNumText() == 4 then
		-- 修改头像
		CallScriptFunction( 805030, "OnEnumerate",sceneId, selfId, targetId )
		return
	end
	
end
