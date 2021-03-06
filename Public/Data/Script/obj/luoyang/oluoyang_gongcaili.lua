--洛阳NPC
--龚彩丽
--普通

x000132_g_ScriptId	= 000132

--操作集
x000132_g_Key				=
{
	["chg"]	=	1,			--我想兑换墨镜猫
	["in1"]	= 2,			--关于兑换
	["in2"]	= 3,			--关于暗金宝箱
	["bak"]	= 4,			--返回上一页
}

--事件
x000132_g_eventList = { 808065 }

--兑换列表
x000132_g_ChangeLst	=
{
	--描述，玩家可得到的物品，GetNumText，兑换所需物品，兑换所需物品数量
	[1]	= { des = "斜i M K韓h Mi陁 鹌ng c 5 c� th� mang theo",  id = 30505109, key = 101, NeedItm = 30008026, NeedNum = 30 },
	[2]	= { des = "斜i L遳 H鄋h Mi陁 鹌ng c 45 c� th� mang theo", id = 30505110, key = 102, NeedItm = 30008026, NeedNum = 40 },
	[3]	= { des = "斜i Th秈 Th唼ng Mi陁 鹌ng c 55 c� th� mang theo", id = 30505111, key = 103, NeedItm = 30008026, NeedNum = 43 },
	[4]	= { des = "斜i Ng鐄 T唼ng Mi陁 鹌ng c 65 c� th� mang theo", id = 30505112, key = 104, NeedItm = 30008026, NeedNum = 46 },
	[5]	= { des = "斜i Qu醤 Qu鈔 Mi陁 鹌ng c 75 c� th� mang theo", id = 30505113, key = 105, NeedItm = 30008026, NeedNum = 50 },
	[6]	= { des = "斜i Qu醤 Qu鈔 Mi陁 鹌ng c 85 c� th� mang theo", id = 30505154, key = 106, NeedItm = 30008026, NeedNum = 80 },
}

--**********************************
--事件交互入口
--**********************************
function x000132_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, "#{ANXIANG_DLG}" )
		AddNumText( sceneId, x000132_g_ScriptId, "Ta mu痭 鸨i M鑟", 6, x000132_g_Key["chg"] )
		AddNumText( sceneId, x000132_g_ScriptId, "Li阯 quan ho醤 鸨i", 11, x000132_g_Key["in1"] )
		AddNumText( sceneId, x000132_g_ScriptId, "Li阯 quan 耺 Kim B鋙 S呓ng", 11, x000132_g_Key["in2"] )	
		
		local i, eventId
		for i, eventId in x000132_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--事件列表选中一项
--**********************************
function x000132_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	key	= GetNumText()
	
	--抽奖活动
	local i, findId
	for i, findId in x000132_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

	if key == x000132_g_Key["chg"] then
		BeginEvent( sceneId )
			AddText( sceneId, "C醕 h� mu痭 鸨i lo読 Tr鈔 th� n鄌?" )
			for i = 1, getn( x000132_g_ChangeLst ) do
				AddNumText( sceneId, x000132_g_ScriptId, x000132_g_ChangeLst[i].des, 6, x000132_g_ChangeLst[i].key )
			end
			AddNumText( sceneId, x000132_g_ScriptId, "Tr� v� trang tr呔c", -1, x000132_g_Key["bak"] )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif key == x000132_g_Key["in1"] then
		x000132_MsgBox( sceneId, selfId, targetId, "#{ANXIANG_CHG}" )

	elseif key == x000132_g_Key["in2"] then
		x000132_MsgBox( sceneId, selfId, targetId, "#{ANXIANG_INF}" )
	
	elseif key == x000132_g_Key["bak"] then
		x000132_OnDefaultEvent( sceneId, selfId, targetId )

	else
		for i = 1, getn( x000132_g_ChangeLst ) do
			if key == x000132_g_ChangeLst[i].key then
				x000132_OnMyChange( sceneId, selfId, targetId, x000132_g_ChangeLst[i] )
				break
			end
		end
	end

end

--**********************************
--兑换
--**********************************
function x000132_OnMyChange( sceneId, selfId, targetId, unt )

	if unt == nil then
		return
	end
	
	if LuaFnGetAvailableItemCount( sceneId, selfId, unt.NeedItm ) < unt.NeedNum then
		x000132_MsgBox( sceneId, selfId, targetId, "    "..unt.des..", tr阯 ng叨i c醕 h� kh鬾g 瘘 m鋘h v鴑 鸢 s� c�"..unt.NeedNum.." c醝. (M鋘h v鴑 鸢 s� c� c� th� c� th鬾g qua m� 耺 Kim B鋙 S呓ng)" )
		return
	end
	
	BeginAddItem( sceneId )
	AddItem( sceneId, unt.id, 1 )
	if EndAddItem( sceneId, selfId ) > 0 then
		if LuaFnDelAvailableItem( sceneId, selfId, unt.NeedItm, unt.NeedNum ) == 1 then
			AddItemListToHuman( sceneId, selfId )
		else
			x000132_MsgBox( sceneId, selfId, targetId, "Kh tr� v ph th b読!" )
			return
		end
	else
		x000132_MsgBox( sceneId, selfId, targetId, "Xin l瞚, tay n鋓 c黙 c醕 h� 疸 馥y, kh鬾g th� ho醤 鸨i." )
		return
	end
	
	local	szTran	= GetItemTransfer( sceneId, selfId, 0 )
	local szUser	= "#{_INFOUSR"..GetName( sceneId, selfId ).."}"
	local szItem	= "#{_INFOMSG"..szTran.."}"
	local	szMsg		= format( "#W%s#cff99cc t t鈓 t l馽 v�#G L誧 D呓ng (111, 163) #YCung Th醝 L�#cff99cc t靘 瘘 #YC� t� to醝 phi猲#cff99cc, Cung Th醝 L� r vui m譶g, l %s ra l鄊 qu� tg.", szUser, szItem )
	x000132_MsgBox( sceneId, selfId, targetId, "C醕 h� ho醤 鸨i th鄋h c鬾g r癷"..GetItemName( sceneId, unt.id ).."." )
	BroadMsgByChatPipe( sceneId, selfId, szMsg, 4 )

end

--**********************************
--Message Box
--**********************************
function x000132_MsgBox( sceneId, selfId, targetId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end
