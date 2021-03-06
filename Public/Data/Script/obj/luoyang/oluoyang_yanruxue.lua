--脚本号
x000088_g_scriptId = 000088

--所拥有的事件ID列表
x000088_g_eventList = { 801010 }

--**********************************
--事件交互入口
--**********************************
function x000088_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Hoa t� phi陁 du thu� t� l遳, t� xanh nh鄋 nh誸 t� ti猲g s, xu鈔  thu s呓ng th呓ng tay 醥, 馥y th醤g m祎 v鄋h tr錸g l咿i c鈛. 秀 kh鬾g bi猼 n骾 c鵱g ai, sao kh鬾g 鸨i ki瑄 t骳 xem sao?")
		
		AddNumText( sceneId, x000088_g_scriptId, "Gi緄 thi畊 thay 鸨i ki瑄 t骳", 11, 10 )
		
		AddNumText(sceneId,x000088_g_scriptId,"Thay 鸨i ki瑄 t骳",6,1)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000088_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)
				AddText( sceneId, "#{function_help_061}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	
	if GetNumText() == 1 then
		-- 修改发型
		CallScriptFunction( 801010, "OnEnumerate",sceneId, selfId, targetId )
		return
	end

end
