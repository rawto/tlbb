--武当NPC
--俞远山
--普通

x012010_g_scriptId = 012010

--**********************************
--事件交互入口
--**********************************
function x012010_OnDefaultEvent( sceneId, selfId,targetId )
	x012010_g_MenPai = GetMenPai(sceneId, selfId)
	if x012010_g_MenPai == 3 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{TYJZ_081103_02}")
			AddNumText(sceneId, x012010_g_scriptId, "K� n錸g h鱟 t",12,0)
			AddNumText(sceneId, x012010_g_scriptId, "Gi緄 thi畊 v� t鈓 ph醦",11,10)
			--AddNumText(sceneId, x012010_g_scriptId, "#{JZBZ_081031_02}",11,11)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
			BeginEvent(sceneId)
			AddText(sceneId,"Ng呓i t靘 ta c� vi甤 g�?")
			AddNumText(sceneId, x012010_g_scriptId, "Gi緄 thi畊 v� t鈓 ph醦",11,10)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--事件列表选中一项
--**********************************
function x012010_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_xinfajieshao_001}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	elseif GetNumText() == 11 then
		BeginEvent(sceneId)					
			AddText( sceneId, "#{JZBZ_081031_01}" )							
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 3 );
end
