-- 天工开物Nh ph th叻ng 人民币材料
-- 创建人[ QUFEI 2007-09-21 15:07 UPDATE BugID 24677 ]

x210244_g_ScriptId = 210244

x210244_g_Update = {

    ["id01"] = 50,
    ["id02"] = 60,
    ["id03"] = 70,
    ["id04"] = 80,
    ["id05"] = 90,
    ["id06"] = 100,
    ["id07"] = 130,
    ["id08"] = 140,

}

--提示信息
x210244_g_msg = {

    ["jl30"]	= "#c33ffccNh ph th叻ng #cFF0000C 30 #G [ B鋙 Th誧h C 4 ]#Y...", 
    ["jl40"]	= "#c33ffccNh ph th叻ng #cFF0000C 40 #G [ B鋙 Th誧h C 4 ]#Y...", 
    ["jl50"]	= "#c33ffccNh ph th叻ng #cFF0000C 50 #G [ B鋙 Th誧h C 5 ]#Y...", 
    ["jl60"]	= "#c33ffccNh ph th叻ng #cFF0000C 60 #G [ B鋙 Th誧h C 5 ]#Y...", 
    ["jl70"]	= "#c33ffccNh ph th叻ng #cFF0000C 70 #G [ B鋙 Th誧h C 6 ]#Y...", 
    ["jl80"]	= "#c33ffccNh ph th叻ng #cFF0000C 80 #G [ B鋙 Th誧h C 6 ]#Y...", 
    ["jl90"]	= "#c33ffccNh ph th叻ng #cFF0000C 90 #G [ B鋙 Th誧h C 7 ]#Y...", 
    ["jl100"]	= "#c33ffccNh ph th叻ng #cFF0000C 100 #G [ B鋙 Th誧h C 7 ]#Y...", 

}

--...标记
x210244_g_flag = {

    [30]	= MF_LINGQUYUANBAOVIP,
    [40]	= MF_TianGongJiangli60,
    [50]	= MF_TianGongJiangli70,
    [60]	= MF_TianGongJiangli80,
    [70]	= MF_BUCHANG_MONEY,
    [80]	= MF_BUCHANG_STONE,
    [90]	= MF_BUCHANG_EQUIP,
    [100]	= MF_ActiveJuCard,
}

--材料...
-- 60 棉布碎片
-- 70 精铁碎片
-- 80 秘银碎片
x210244_g_CaiLiaoJiangLi = {

    [30]	= { NG = 50413004, WG = 39910002 },
    [40]	= { NG = 50413004, WG = 39910002 },
    [50]	= { NG = 50513004, WG = 39910003 },
    [60]	= { NG = 50513004, WG = 39910003 },
    [70]	= { NG = 50613004, WG = 39910004 },
    [80]	= { NG = 50613004, WG = 39910004 },
    [90]	= { NG = 50713004, WG = 39910005 },
    [100]	= { NG = 50713004, WG = 39910005 },

}

x210244_g_PlayerLevel = 0

--**********************************
--列举事件
--**********************************
function x210244_OnEnumerate( sceneId, selfId, targetId )	
		
	BeginEvent(sceneId)
	
		if GetLevel( sceneId, selfId ) >= 10 then
			AddNumText( sceneId, x210244_g_ScriptId,"#e0e8de5#YNh ph th叻ng #GCao C B鋙 Th誧h#W...", 6, 105 )
			--AddNumText( sceneId, x210244_g_ScriptId, "#{TGKW_20070918_004}", 11, 106 )
		end	
			
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
		
end

function x210244_OnDefaultEvent( sceneId, selfId, targetId )
	
	local	key	= GetNumText()
	x210244_g_PlayerLevel = GetNumText()
			
	if key == 105 then
		BeginEvent(sceneId)
		
		AddText(sceneId,"#e0e8de5#YNhi畉 li畉 ch鄌 m譶g c醕 h� 皙n v緄 #cFF0000Thi阯 Long B醫 B�#e0e8de5#Y......")				
		AddNumText( sceneId, x210244_g_ScriptId, x210244_g_msg["jl50"], 6, x210244_g_Update["id01"] )	
		AddNumText( sceneId, x210244_g_ScriptId, x210244_g_msg["jl60"], 6, x210244_g_Update["id02"] )	
		AddNumText( sceneId, x210244_g_ScriptId, x210244_g_msg["jl70"], 6, x210244_g_Update["id03"] )	
		AddNumText( sceneId, x210244_g_ScriptId, x210244_g_msg["jl80"], 6, x210244_g_Update["id04"] )	
		AddNumText( sceneId, x210244_g_ScriptId, x210244_g_msg["jl90"], 6, x210244_g_Update["id05"] )	
		AddNumText( sceneId, x210244_g_ScriptId, x210244_g_msg["jl100"], 6, x210244_g_Update["id06"] )	
		AddNumText( sceneId, x210244_g_ScriptId, x210244_g_msg["jl130"], 6, x210244_g_Update["id07"] )	
		AddNumText( sceneId, x210244_g_ScriptId, x210244_g_msg["jl140"], 6, x210244_g_Update["id08"] )	
		
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	
	elseif key == 106 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{TGKW_20070918_002}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		return
	elseif key == x210244_g_Update["id01"] or key == x210244_g_Update["id02"] or key == x210244_g_Update["id03"] or key == x210244_g_Update["id04"] or key == x210244_g_Update["id05"] or key == x210244_g_Update["id06"] or key == x210244_g_Update["id07"] or key == x210244_g_Update["id08"] then
		x210244_OnTianGongKaiWu( sceneId, selfId, targetId )
		return
	end	
	
end

function x210244_OnTianGongKaiWu( sceneId, selfId, targetId )
		
	local mylevel = GetLevel( sceneId, selfId )
		
	if mylevel < x210244_g_PlayerLevel then
		local strText = format("C醕 h� c 鸬 kh鬾g 瘘. Khi n鄌 鹫t C %d h銀 皙n t靘 ta.", x210244_g_PlayerLevel )
		x210244_TalkMsg( sceneId, selfId, targetId, strText )	
		return
	end
		
	local index =	GetMissionFlag( sceneId, selfId, x210244_g_flag[x210244_g_PlayerLevel] )
		
	if index == 1 then
		x210244_TalkMsg( sceneId, selfId, targetId, "C醕 h� 疸 nh th叻ng r癷!" )	
		return
	end
	
	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 2 then
		x210244_TalkMsg( sceneId, selfId, targetId, "H銀 s x猵 l読 m祎 � tr痭g trong � Nguy阯 Li畊." )
		return
	end
	-- ...材料
	local bagpos01 = TryRecieveItem( sceneId, selfId, x210244_g_CaiLiaoJiangLi[x210244_g_PlayerLevel].NG, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
	local bagpos02 = TryRecieveItem( sceneId, selfId, x210244_g_CaiLiaoJiangLi[x210244_g_PlayerLevel].WG, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
	--local bagpos03 = TryRecieveItem( sceneId, selfId, x210244_g_CaiLiaoJiangLi[x210244_g_PlayerLevel], QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
	--local bagpos04 = TryRecieveItem( sceneId, selfId, x210244_g_CaiLiaoJiangLi[x210244_g_PlayerLevel], QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
	
	local itemInfo = GetBagItemTransfer( sceneId, selfId, bagpos01 )
	local itemName = GetBagItemTransfer( sceneId, selfId, bagpos02 )
		
	-- 强制绑定										
	local	bindidx01	=	LuaFnItemBind( sceneId, selfId, bagpos01 )
	local	bindidx02	=	LuaFnItemBind( sceneId, selfId, bagpos02 )
	--local	bindidx03	=	LuaFnItemBind( sceneId, selfId, bagpos03 )
	--local	bindidx04	=	LuaFnItemBind( sceneId, selfId, bagpos04 )
	
	if bindidx01 ~= 1 or bindidx02 ~= 1 then
		local bindmsg = "V ph 疸 b� kh骯"													
		BeginEvent( sceneId )
			AddText( sceneId, bindmsg )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return
	end
		
	SetMissionFlag( sceneId, selfId, x210244_g_flag[x210244_g_PlayerLevel], 1 )
	
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
	local retmsg = format("#Y%s#W 疸 nh th鄋h c鬾g ph th叻ng #G%s#W, ch鷆 m譶g!", GetItemName(sceneId,x210244_g_CaiLiaoJiangLi[x210244_g_PlayerLevel].NG), GetItemName(sceneId,x210244_g_CaiLiaoJiangLi[x210244_g_PlayerLevel].WG) )
	x210244_TalkMsg( sceneId, selfId, targetId, retmsg )	

	-- 发送系统公告										
	local playername = GetName(sceneId, selfId)
	local strText = format("#gffff00#{_INFOUSR%s}#{TGKW_20070918_005}#Y%d#{TGKW_20070918_006}#e0e8de5#G#{_INFOMSG%s}#W 疬㧟 #e0e8de5#G#{_INFOMSG%s}#W, ch鷆 m譶g!", playername, x210244_g_PlayerLevel, itemInfo, itemName)										
	BroadMsgByChatPipe(sceneId, selfId, strText, 4)
end

--**********************************
--消息提示
--**********************************
function x210244_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--对话提示
--**********************************
function x210244_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)      
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end
