--武当NPC
--萧天逸
--普通

x012035_g_scriptId = 012035

--**********************************
--事件交互入口
--**********************************
function x012035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Nh鎛g ng叨i tu luy畁 t� x遖 t緄 nay, 皤u g ph鋓 nh鎛g vi甤 xu ph醫 t� t鈓 ma, Th韈h Thi阯 S� 疸 b� tr� 鹫i tr � n鷌 V� 衋ng, c� th� s� c� c� h礽 疳nh b読 t鈓 ma, b課 mu痭 th� th馽 l馽 c黙 m靚h kh鬾g?")
		AddNumText(sceneId,x012035_g_scriptId,"姓i chi猲 T鈓 Ma",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x012035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<71  then	
			BeginEvent( sceneId )
			local strText = "C醝 n鄖 g鱥 l� r鑞 luy畁 b阯 ngo鄆 tr呔c, tu luy畁 b阯 trong sau, 鹌ng c c黙 ng呓i ch遖 皙n c 71, u眓g c鬾g ng呓i b呔c v鄌, ch� e s� b� t h鯽 nh ma - d� tr鄋g xe c醫"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 142,91,183)
		end
	end
end
