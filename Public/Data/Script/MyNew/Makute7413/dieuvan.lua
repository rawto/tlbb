--脚本号
x002196_g_scriptId = 002196
x002196_g_EquipID={}
--**********************************
--**********************************


--**********************************
--**********************************

--**********************************
--事件交互入口
--**********************************
function x002196_OnDefaultEvent( sceneId, selfId, targetId)
	BeginEvent(sceneId)     
		--AddText(sceneId, "#{ZBDW_091105_1}")
		AddText(sceneId, "Thu 餴陁 v錸 l� ma ph醦 m� ta 疸 ph鋓 luy畁 r gian kh� m緄 th鄋h th誳 疬㧟, n� c� th� gia t錸g 疳ng k� s裞 m課h c黙 trang b�.")
		AddText(sceneId, "Ta s� kh鬾g s� d鴑g n� b譨 b鉯, ch� nh鎛g trang b� c� ch鷗 s裞 m課h th� h銀 mang 皙n 疴y.")
		AddNumText(sceneId, x002196_g_scriptId,"H䅟 th鄋h 餴陁 v錸", 6, 1)
		AddNumText(sceneId, x002196_g_scriptId,"T誧 kh 餴陁 v錸", 6, 2)
		AddNumText(sceneId, x002196_g_scriptId,"C叨ng ho� 餴陁 v錸", 6, 3)
		AddNumText(sceneId, x002196_g_scriptId,"D� b� 餴陁 v錸", 6, 4)
		AddNumText(sceneId, x002196_g_scriptId,"V� thu 餴陁 v錸 trang b�", 11, 5)
		AddNumText(sceneId, x002196_g_scriptId,"R秈 餴", 8, 9999)										
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x002196_OnEventRequest( sceneId, selfId, targetId, eventId )
	local key=GetNumText()
	if key==9999 then
		x002196_CloseMe(sceneId, selfId)
	elseif key==1 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000156)
	elseif key==2 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 2000156)
	elseif key==3 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 3000156)
	elseif key==4 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 4000156)
	elseif key==5 then
		BeginEvent(sceneId)     
			AddText(sceneId, "#{ZBDW_091105_21}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
        elseif key==98 then
	         BeginAddItem(sceneId)
				--AddItem( sceneId, 30309758, 1 )
				--AddItem( sceneId, 30503148, 100 )


		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
       		BeginEvent(sceneId)
		--AddText(sceneId,"#Y领取#G随身宝石#Y成功。谢谢你对我们的支持。")
		--EndEvent(sceneId)
		--DispatchEventList(sceneId,selfId,targetId)
	end
end
--**********************************
--对话窗口信息提示
--**********************************
function x002196_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end


--**********************************
--醒目提示
--**********************************
function x002196_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--关闭对话框
--**********************************
function x002196_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end