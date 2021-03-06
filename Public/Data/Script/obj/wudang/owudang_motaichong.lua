--武当NPC
--莫太冲
--普通

--脚本号
x012009_g_ScriptId = 012009

x012009_g_xuanWuDaoId=400918 --[tx42913]

--门派信息(门派名称，SceneID，PosX，PosY，门派ID)
x012009_g_mpInfo		= {}
x012009_g_mpInfo[0]	= { "Tinh T鷆", 16,  96, 152, MP_XINGSU }
x012009_g_mpInfo[1]	= { "Ti陁 Dao", 14,  67, 145, MP_XIAOYAO }
x012009_g_mpInfo[2]	= { "Thi猽 L鈓",  9,  95, 137, MP_SHAOLIN }
x012009_g_mpInfo[3]	= { "Thi阯 S絥", 17,  95, 120, MP_TIANSHAN }
x012009_g_mpInfo[4]	= { "Thi阯 Long", 13,  96, 120, MP_DALI }
x012009_g_mpInfo[5]	= { "Nga My", 15,  89, 144, MP_EMEI }
x012009_g_mpInfo[6]	= { "V� 衋ng", 12, 103, 140, MP_WUDANG }
x012009_g_mpInfo[7]	= { "Minh Gi醥", 11,  98, 167, MP_MINGJIAO }
x012009_g_mpInfo[8]	= { "C醝 Bang", 10,  91, 116, MP_GAIBANG }

--**********************************
--事件交互入口
--**********************************
function x012009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{MPXL_090113_04}")
		if	GetLevel( sceneId, selfId)>=10  then	
			AddNumText(sceneId,x012009_g_ScriptId,"L誧 D呓ng",9,0)
			AddNumText(sceneId,x012009_g_ScriptId,"T� Ch鈛",9,1)
			AddNumText( sceneId, x012009_g_ScriptId, "L誧 D呓ng - C豼 Ch鈛 Th呓ng H礽", 9, 3 )
			AddNumText( sceneId, x012009_g_ScriptId, "T� Ch鈛 - Thi猼 T叨ng Ph�", 9, 4 )
		end

		--add by WTT
		if	GetLevel( sceneId, selfId)>=20  then	
			AddNumText( sceneId, x012009_g_ScriptId, "Th鷆 H� C� Tr", 9, 6 )
		end
		
		if	GetLevel( sceneId, selfId)>=75  then	
			AddNumText( sceneId, x012009_g_ScriptId, "#{MPCSLL_80925_01}", 9, 5 )
		end
		AddNumText(sceneId,x012009_g_ScriptId,"姓i L�",9,2)
		
    --[tx42913]
    CallScriptFunction( x012009_g_xuanWuDaoId, "OnEnumerate",sceneId, selfId, targetId )
		--[/tx42913]	
		
		AddNumText(sceneId,x012009_g_ScriptId,"#G#b羞a ta 餴 c醕 m鬾 ph醝 kh醕",9,11)
		-- 我怎样才能去敦煌和嵩山
		AddNumText( sceneId, x012009_g_ScriptId, "L鄊 th� n鄌 瓞 皙n 恤n Ho鄋g v� Tung S絥 ?", 11, 2000 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x012009_OnEventRequest( sceneId, selfId, targetId, eventId )

------------------------------------------------------------------------------------------
--[tx42913]
	if eventId == x012009_g_xuanWuDaoId then --去玄武岛
		CallScriptFunction( x012009_g_xuanWuDaoId, "OnDefaultEvent",sceneId, selfId, targetId )
		return
	end
--[/tx42913]
	if GetNumText() == 2000 then		--
		BeginEvent( sceneId )
			AddText( sceneId, "#{GOTO_DUNHUANF_SONGSHAN}" ) 
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return
	end
  
    if  GetNumText() == 11 then
        
		BeginEvent(sceneId)
		    
		    for i=0, 8 do
				AddNumText( sceneId, x012009_g_ScriptId, "M鬾 ph醝 - "..x012009_g_mpInfo[i][1], 9, i+12 )
			end		
			--AddNumText(sceneId,x009009_g_ScriptId,"M鬾 ph醝 - M� Dung",9,1000)--Add by S骾
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)	
		return 
    end
    
    num = GetNumText()

 	if num > 11 then
 		-- 检测玩家身上是不是有113号BUFF
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 113) == 1   then
			BeginEvent( sceneId )
				AddText( sceneId, "C醕 h� 餫ng trong tr課g th醝 T鄌 V ho th呓ng nh鈔, kh鬾g th� truy玭 t痭g." ) 
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			return
 		end
		
		--Add by S骾
		if GetNumText() == 1000 then
			CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId,435,91,116)
			return
		end
 	
 	    i = num - 12
		CallScriptFunction( (400900), "TransferFuncFromNpc", sceneId, selfId, x012009_g_mpInfo[i][2], x012009_g_mpInfo[i][3], x012009_g_mpInfo[i][4] )
		return
	end
------------------------------------------------------------------------------------------ 

	if	GetNumText()==0	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 0,233,321, 10)
	elseif	GetNumText()==1	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 1,202,257, 10)
	elseif	GetNumText()==3	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 0,325,270, 10)
	elseif	GetNumText()==4	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 1,331,226, 10)
	elseif	GetNumText()==2	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 2,252, 124)
	elseif  GetNumText()==5	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 186,288,136,75)
	end
	
	--add by WTT
	if GetNumText()== 6 then					--束河古镇		
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x012009_g_ScriptId);			
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "Th鷆 H� C� Tr l� n絠 kh鬾g t錸g s醫 kh�, c醕 h� h銀 ch� � an to鄋. X醕 nh ti猲 v鄌 ?");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end

	if GetNumText() == 2000 then		--
		BeginEvent( sceneId )
			AddText( sceneId, "#{GOTO_DUNHUANF_SONGSHAN}" ) 
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return
	end
end

--add by WTT
function x012009_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction((400900), "TransferFuncFromNpc", sceneId, selfId, 420, 200, 211, 20 );
	return
end
