--洛阳NPC
--关汉寿
--普通

x000125_g_ScriptId	= 125

--操作集
x000125_g_Key				=
{
		["do"]					= 100,	--确定
		["undo"]				= 101,	--取消
		["del"]					= 103,	--我决定退出江湖
		["hlp"]					= 104,	--帮助
}

--**********************************
--事件交互入口
--**********************************
function x000125_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "Ta chuy阯 l� ng叨i l鄊 ch� tr� nghi th裞 R豠 Tay G醕 Ki猰 cho anh h鵱g giang h�. N猽 c醕 h� mu痭 x骯 nh鈔 v, r鷗 kh鰅 giang h�, th� h銀 皙n t靘 ta." )
		AddNumText( sceneId, x000125_g_ScriptId, "Ta mu痭 x骯 nh鈔 v", -1, x000125_g_Key["do"] )
		AddNumText( sceneId, x000125_g_ScriptId, "Li阯 quan 皙n x骯 nh鈔 v", 11, x000125_g_Key["hlp"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x000125_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()

	if key == x000125_g_Key["do"] then
		--1,		//请求成功，可以删除
		--2,		//在帮派中不可以自杀
		--3,		//结婚状态
		--4,		//物品上锁不能删除
		--5,		//拥有玩家商店
		--6,		//拥有结拜兄弟
		--7,		//拥有师徒关系
		BeginEvent(sceneId)
			local result = QueryDeleteCharState(sceneId,selfId)
			if result == 1 then
				AddText(sceneId,"R豠 tay g醕 ki猰, r秈 b� giang h�")
				AddNumText(sceneId,x000125_g_ScriptId,"我决定退出江湖",6,x000125_g_Key["del"])
			end
			if result == 2 then
				AddText(sceneId,"Kh鬾g th� t� s醫 trong bang ph醝")
			end
			if result == 3 then
				AddText(sceneId,"Ng呓i v鏽 trong tr課g th醝 k猼 h鬾, kh鬾g th� t� s醫")
			end
			if result == 4 then
				AddText(sceneId,"Ng呓i c� v ph b� kh骯, kh鬾g th� t� s醫")
			end
			if result == 5 then
				AddText(sceneId,"Ng呓i 餫ng s� h鎢 th呓ng ti甿, kh鬾g th� t� s醫")
			end
			if result == 6 then
				AddText(sceneId,"Ng呓i c� huynh 甬 k猼 b醝, kh鬾g th� t� s醫")
			end
			if result == 7 then
				AddText(sceneId,"Ng呓i c� quan h� s� 鸢, kh鬾g th� t� s醫")
			end
			if result == 8 then
					local lefttime = GetLeftDeleteTime(sceneId,selfId)-11
					if lefttime > 0 then
						AddText(sceneId,"Th秈 gian t� s醫 c黙 ng呓i ch遖 t緄, v鏽 c騨 thi猽 " ..lefttime.." ng鄖")
					else
						AddText(sceneId,"Ng呓i kh鬾g 疱ng k� xin t� s醫!");
					end
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif key == x000125_g_Key["del"] then
		--ExecuteDeleteChar(sceneId, selfId)
		x000125_OpenClientAcceptUI( sceneId, selfId, targetId, eventId )
		
	elseif key == x000125_g_Key["hlp"] then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_089}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return

	end
end

function x000125_OpenClientAcceptUI( sceneId, selfId, targetId, eventId )    
  BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x000125_g_ScriptId);
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddInt(sceneId,eventId)
		UICommand_AddString(sceneId,"OnMsgAccept");
		local str = format("Ng呓i x醕 鸶nh mu痭 x骯 nh鈔 v n鄖 kh鬾g?")
		UICommand_AddString(sceneId,str);
	EndUICommand(sceneId)
	
	DispatchUICommand(sceneId,selfId, 24)
end

function x000125_OnMsgAccept( sceneId, selfId, targetId, eventId )
    local result = QueryDeleteCharState(sceneId,selfId)
    
    if( 1 == result ) then        
        ExecuteDeleteChar(sceneId, selfId)
    end
    
end
