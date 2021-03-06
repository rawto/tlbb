--城市NPC
--衙役

x805009_g_scriptId = 805009
x805009_g_BuildingID1 = 0

--所拥有的事件ID列表
x805009_g_eventList = { 600035, 600040 }

-- 任务集事件 ID 列表，这类事件包含子事件
x805009_g_eventSetList = { 600035, 600040 }

--官票类型ID
x805009_g_TicketItemIdx	=	40002000

-- 银票ID
x805009_g_Yinpiao = 40002000


-- 贡献都称号
x805009_g_GuildContriTitle = 
{
	{ currName="",	nextId=242, needContri=250, 	name=".Quan N礽 H"},
	{ currName=".Quan N礽 H",	nextId=243, needContri=750, 	name=".徐nh H"},
	{ currName=".徐nh H", 	nextId=244, needContri=1500, 	name=".H呓ng H"},
	{ currName=".H呓ng H", 	nextId=245, needContri=3000, 	name=".Huy畁 H"},
	{ currName=".Huy畁 H", 	nextId=246, needContri=7500, 	name=".Qu H"},
	{ currName=".Qu H", 	nextId=247, needContri=15000, 	name=".Huy畁 C鬾g"},
	{ currName=".Huy畁 C鬾g", 	nextId=248, needContri=30000, 	name=".Qu C鬾g"},
	{ currName=".Qu C鬾g", 	nextId=249, needContri=60000, 	name=".Qu痗 C鬾g"},
	{ currName=".Qu痗 C鬾g", 	nextId=250, needContri=125000, 	name=".Qu V呓ng"},
	{ currName=".Qu V呓ng", 	nextId=251, needContri=250000, 	name=".Th鈔 V呓ng"}
}


--**********************************
--事件列表
--**********************************
function x805009_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0

	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)

	BeginEvent( sceneId )
		if(Humanguildid == cityguildid) then
--		if CityGetSelfCityID( sceneId, selfId ) == sceneId then
			AddText( sceneId, "S� v� l緉 nh� trong bang, c� c ta gi鷓 g� huynh kh鬾g? huynh 甬 1 nh� kh鬾g c kh醕h s醥." )

			--AddNumText( sceneId, x805009_g_scriptId, "设置建筑到一级", 6, 1 )
			--AddNumText( sceneId, x805009_g_scriptId, "设置建筑到二级", 6, 2 )
			--AddNumText( sceneId, x805009_g_scriptId, "设置建筑到三级", 6, 3 )
			--AddNumText( sceneId, x805009_g_scriptId, "设置建筑到四级", 6, 4 )
			--AddNumText( sceneId, x805009_g_scriptId, "设置建筑到五级", 6, 5 )

			--AddNumText( sceneId, x805009_g_scriptId, "设置场景到一级", 6, 6 )
			--AddNumText( sceneId, x805009_g_scriptId, "设置场景到二级", 6, 7 )
			--AddNumText( sceneId, x805009_g_scriptId, "设置场景到三级", 6, 8 )
			--AddNumText( sceneId, x805009_g_scriptId, "设置场景到四级", 6, 9 )
			--AddNumText( sceneId, x805009_g_scriptId, "设置场景到五级", 6, 10 )

			--AddNumText( sceneId, x805009_g_scriptId, "调整六率方向", 6, 13 )
			AddNumText( sceneId, x805009_g_scriptId, "Thi猼 l/ki琺 tra tin nh tr阯 m課g", 6, 22 )
			AddNumText( sceneId, x805009_g_scriptId, "X鈟 d駈g th鄋h th�", 6, 12 )
			AddNumText( sceneId, x805009_g_scriptId, "Nghi阯 c製 th鄋h th�", 6, 14 )

			for i, eventId in x805009_g_eventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
			--AddNumText( sceneId, x805009_g_scriptId, "帮会徽章", 6, 15 )
			--AddNumText( sceneId, x805009_g_scriptId, "获得跑商官票", 7, 16 )
			--AddNumText( sceneId, x805009_g_scriptId, "交回跑商官票", 7, 17 )
			AddNumText( sceneId, x805009_g_scriptId, "Con 疬秐g th呓ng nghi畃", 12, 18 )
			AddNumText( sceneId, x805009_g_scriptId, "Gi緄 thi畊 nha huy畁", 11, 19 )
			AddNumText( sceneId, x805009_g_scriptId, "Gi緄 thi畊 nhi甿 v� x鈟 d駈g", 11, 20 )
			AddNumText( sceneId, x805009_g_scriptId, "Gi緄 thi畊 nhi甿 v� nghi阯 c製", 11, 21 )
			AddNumText( sceneId, x805009_g_scriptId, "#{BGCH_8829_02}", 11, 25 )--关于兑换帮贡牌
			AddNumText( sceneId, x805009_g_scriptId, "Xin tr� th鄋h Bang ch�", 6, 23 )
			AddNumText( sceneId, x805009_g_scriptId, "#{SQBZ_090205_01}", 11, 26 )
			--AddNumText( sceneId, x805009_g_scriptId, "回到洛阳", 9, 11 )
			--AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090219_02}", 9, 27 )
			--AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090219_03}", 9, 28 )
			AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090226_10}", 9, 29 )
			local currGuildContriSum = CityGetAttr(sceneId, selfId, 15);
			local currGuildContriTitle = GetGuildContriTitle(sceneId, selfId);
			local guildName = LuaFnGetGuildName(sceneId, selfId);
			for i, titleItem in x805009_g_GuildContriTitle do
				if currGuildContriTitle == "" then
					currGuildContriTitle = guildName
				end
				if currGuildContriTitle == guildName..titleItem.currName then
					AddNumText( sceneId, x805009_g_scriptId, "Th錸g ch裞 l� "..titleItem.name, 6, 30 )
					break;
				end
			end
			
			AddNumText( sceneId, x805009_g_scriptId, "#{BGCH_8829_01}", 6, 24 )--将帮贡兑换成帮贡牌

		else
			local PlayerGender = GetSex( sceneId, selfId )
			local rank

			if PlayerGender == 0 then
				rank = "N� hi畃"
			elseif PlayerGender == 1 then
				rank = "姓i hi畃"
			else
				rank = "V� n鄖"
			end

			AddText( sceneId, "" .. rank .. "M tr鬾g l� l, ta l� ch� qu鋘 c黙 b眓 th鄋h, c� vi甤 g� ta c� th� ti猵 疸i kh醕h l�." )
		end

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件交互入口
--**********************************
function x805009_OnDefaultEvent( sceneId, selfId, targetId )
	x805009_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- 判断某个事件是否可以通过此 NPC 执行
--**********************************
function x805009_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805009_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805009_g_eventSetList do
			if CallScriptFunction( findId, "IsInEventList", sceneId, selfId, eventId ) == 1 then
				bValid = 1
				break
			end
		end
	end

	return bValid
end

--**********************************
--事件列表选中一项
--**********************************
function x805009_OnEventRequest( sceneId, selfId, targetId, eventId )
	-- 处理正常的事件列表中的事件
	if x805009_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	end

	-- 处理本脚本自带事件，孙雨写的，未作修改
	if GetNumText() == 1 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 0)
	elseif GetNumText() == 2 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 1)
	elseif GetNumText() == 3 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 2)
	elseif GetNumText() == 4 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 3)
	elseif GetNumText() == 5 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 4)
	elseif GetNumText() == 6 then
		CitySetLevel(sceneId, selfId, sceneId, 0)
	elseif GetNumText() == 7 then
		CitySetLevel(sceneId, selfId, sceneId, 1)
	elseif GetNumText() == 8 then
		CitySetLevel(sceneId, selfId, sceneId, 2)
	elseif GetNumText() == 9 then
		CitySetLevel(sceneId, selfId, sceneId, 3)
	elseif GetNumText() == 10 then
		CitySetLevel(sceneId, selfId, sceneId, 4)
	elseif GetNumText() == 11 then
		-- 如果玩家正在跑商，就不让玩家使用这个功能
		if GetItemCount(sceneId, selfId, x805009_g_Yinpiao)>=1  then
			BeginEvent( sceneId )
				AddText( sceneId, "Tr阯 ng叨i c醕 h� c� ng鈔 phi猽, 餫ng ch誽 tr痭 n�! Ta kh鬾g th� gi鷓 c醕 h�." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		--NewWorld(sceneId, selfId, 0, 144, 98)
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 0,239,239)

	elseif GetNumText() == 12 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --调用城市内政界面
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 100)
	elseif GetNumText() == 13 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --调用城市发展趋势界面
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 101)
	elseif GetNumText() == 14 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --调用城市研究界面
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 102)
	elseif GetNumText() == 15 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --调用帮会大旗界面
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 103)
	elseif GetNumText() == 18 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --调用城市商业路线界面
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 105)
	elseif GetNumText() == 16 then
		--获得官票，关闭，移到银行npc处

		--是否是本帮成员
		local guildid 		= GetHumanGuildID(sceneId,selfId)
		local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)

		if(guildid ~= cityguildid) then
				BeginEvent(sceneId)
					strText = "C醕 h� kh鬾g ph鋓 l� ng叨i c黙 bang h礽, nhi甿 v� c黙 bang h礽 kh鬾g ti畁 n骾 ra."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--是否是商人或帮主
		local	guildpos = GetGuildPos(sceneId, selfId)
		if ((guildpos ~= GUILD_POSITION_COM) and (guildpos ~= GUILD_POSITION_CHIEFTAIN)) then
				BeginEvent(sceneId)
					strText = "Xin l瞚, ch� c� quan ch裞 th呓ng nghi畃 ho bang ch� m緄 c� th� l 疬㧟 quan phi猽."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--级别是否够
		local level = GetLevel(sceneId, selfId)
		if(level<40) then
				BeginEvent(sceneId)
					strText = "V� huynh 甬 n鄖 b鈟 gi� m� kinh doanh, c� l� h絠 s緈 m祎 ch鷗. Hay l� 瘙i 皙n c 40 r癷 quay l読 t靘 ta, nh� th� s� t痶 h絥."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		local curMoney = 0
		local maxMoney = 0

		if level>=40 and level<55 then
			curMoney = 20000
			maxMoney = 100000
		elseif level>=55 and level<69 then
			curMoney = 30000
			maxMoney = 150000
		elseif level>=70 and level<84 then
			curMoney = 40000
			maxMoney = 250000
		elseif level>=85 and level<100 then
			curMoney = 50000
			maxMoney = 300000
		end

		--是否有银票
		local	bagpos = GetBagPosByItemSn(sceneId, selfId, x805009_g_TicketItemIdx)

		if bagpos ~= -1	then
				BeginEvent(sceneId)
					strText = "Xin l瞚, c醕 h� ch� 疬㧟 l m祎 t� quan phi猽 th鬷."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return

		elseif bagpos == -1 then

				--帮派资金是否够开出一张银票的
				local GuildMoney = CityGetAttr(sceneId, selfId, GUILD_MONEY)
				if GuildMoney <= curMoney then
						BeginEvent(sceneId)
							strText = "Qu� c黙 bang ph醝 kh鬾g 瘘 瓞 xu ng鈔 phi猽 cho c醕 h�."
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,selfId)
				end

				BeginAddItem( sceneId )
				AddItem( sceneId, x805009_g_TicketItemIdx, 1 )
				ret = EndAddItem( sceneId, selfId )
				if ret > 0 then
					AddItemListToHuman(sceneId,selfId )
					bagpos = GetBagPosByItemSn(sceneId, selfId, x805009_g_TicketItemIdx)
					--根据所在场景,物品类型获得应该的物品价值
					SetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_CUR_MONEY_START, TICKET_ITEM_PARAM_CUR_MONEY_TYPE, curMoney)
					SetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_MAX_MONEY_START, TICKET_ITEM_PARAM_MAX_MONEY_TYPE, maxMoney)
					CityChangeAttr(sceneId, selfId, GUILD_MONEY, (-1)*curMoney)
					LuaFnRefreshItemInfo(sceneId, selfId, bagpos)
					BeginEvent(sceneId)
						strText = "R t痶 r t痶, t� ng鈔 phi猽 n鄖 c醕 h� t誱 th秈 c� th� c 餴, gi鷓 b眓 bang ki猰 th阭 m祎 韙 ti玭, c鬾g lao kh鬾g nh� 疴u."
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				else
					BeginEvent(sceneId)
						strText = "T鷌 x醕h 疸 馥y, kh鬾g th� ti猵 nh th阭 nhi甿 v�"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				end
		end

	elseif GetNumText() == 17 then
		--交回银票，关闭，移到银行npc处

		--是否是本帮成员
		local guildid 		= GetHumanGuildID(sceneId, selfId)
		local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)

		if(guildid ~= cityguildid) then
				BeginEvent(sceneId)
					strText = "C醕 h� kh鬾g ph鋓 l� ng叨i c黙 b眓 bang.."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--是否是商人或帮主
		local	guildpos = GetGuildPos(sceneId, selfId)
		if ( (guildpos ~= GUILD_POSITION_COM) and (guildpos ~= GUILD_POSITION_CHIEFTAIN) ) then
				BeginEvent(sceneId)
					strText = "Xin l瞚, ch� c� quan ch裞 th呓ng nghi畃 ho bang ch� m緄 c� th� tr� 疬㧟 ng鈔 phi猽."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--级别是否够
		local level = GetLevel(sceneId, selfId)
		if(level<40) then
				BeginEvent(sceneId)
					strText = "V� huynh 甬 n鄖 b鈟 gi� m� kinh doanh, c� l� h絠 s緈 m祎 ch鷗.."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		local	bagpos = GetBagPosByItemSn(sceneId, selfId, x805009_g_TicketItemIdx)
		if bagpos ~= -1	then
			local	TicketMoney = GetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_CUR_MONEY_START, TICKET_ITEM_PARAM_CUR_MONEY_TYPE)
			local	MaxTicketMoney = GetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_MAX_MONEY_START, TICKET_ITEM_PARAM_MAX_MONEY_TYPE)
			if TicketMoney ~= 0 then

				if TicketMoney < MaxTicketMoney	then
						BeginEvent(sceneId)
							strText = "Ng鈔 phi猽 c黙 c醕 h� kh鬾g nh 疬㧟 s� ti玭 疳ng ph鋓 nh, ti猵 t鴆 餴 ki猰 ti玭 餴."
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,selfId)
						return
				end

				CityChangeAttr(sceneId, selfId, GUILD_CONTRIB_POINT, 50)
				CityChangeAttr(sceneId, selfId, GUILD_MONEY, TicketMoney*0.9)
				AddMoney(sceneId, selfId, TicketMoney*0.1)
				AddExp(sceneId, selfId, 20000)
				local ReturnType = DelItem(sceneId, selfId, x805009_g_TicketItemIdx, 1)
				if ReturnType == 0 then
					BeginEvent(sceneId)
						strText = "Kh鬾g th� x骯 ng鈔 phi猽"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return
				else
					BeginEvent(sceneId)
						strText = "X骯 ng鈔 phi猽 th鄋h c鬾g"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return
				end

			else
				BeginEvent(sceneId)
					strText = "Xin l瞚, ng鈔 phi猽 c黙 c醕 h� kh鬾g c� ti玭"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
		else
			BeginEvent(sceneId)
				strText = "Xin l瞚, c醕 h� kh鬾g c� ng鈔 phi猽"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	elseif GetNumText() == 19 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_XianYa}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 20 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_Build}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 21 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_Research}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 22 then
		local guildpos = GetGuildPos( sceneId, selfId )
		if guildpos ~= GUILD_POSITION_ASS_CHIEFTAIN and guildpos ~= GUILD_POSITION_CHIEFTAIN then
			--如果不是帮主或副帮主则打开查看留言界面....
			
			--准备打开查看留言界面....(等待LeaveWord更新....)
			--UI脚本不会直接打开界面而是向World请求帮会留言(更新本地帮会留言)....
			--当客户端的LeaveWord被更新后会发送UI消息....到那时查看留言界面才会打开....
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 19841120 )
			return
		else
			--如果是帮主或副帮主则打开设置留言界面....
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 19840424 )
			return
		end
		
	elseif GetNumText() == 23 then
		GuildPromoteToChief(sceneId, selfId)
		
	--将帮贡兑换成帮贡牌
	elseif GetNumText() == 24 then
	
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19821 )

	--关于兑换帮贡牌
	elseif GetNumText() == 25 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{BGCH_8829_05}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	
	--关于申请成为帮主
	elseif GetNumText() == 26 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SQBZ_090205_02}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

 --回到大理
	elseif GetNumText() == 27 then
		if GetItemCount(sceneId, selfId, x805009_g_Yinpiao)>=1  then
			BeginEvent( sceneId )
				AddText( sceneId, "Tr阯 ng叨i c醕 h� c� ng鈔 phi猽, 餫ng ch誽 tr痭 n�! Ta kh鬾g th� gi鷓 c醕 h�." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		--NewWorld(sceneId, selfId, 0, 144, 98)
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 2,181,120)
		
	--回到苏州
	elseif GetNumText() == 28 then
		if GetItemCount(sceneId, selfId, x805009_g_Yinpiao)>=1  then
			BeginEvent( sceneId )
				AddText( sceneId, "Tr阯 ng叨i c醕 h� c� ng鈔 phi猽, 餫ng ch誽 tr痭 n�! Ta kh鬾g th� gi鷓 c醕 h�." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		--NewWorld(sceneId, selfId, 0, 144, 98)
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 1,325,264)
	elseif GetNumText() == 29 then
		BeginEvent( sceneId )
		AddText( sceneId, "#{BHCS_090226_11}" )
		AddNumText( sceneId, x805009_g_scriptId, "Quay v� L誧 D呓ng", 9, 11 )
		AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090219_02}", 9, 27 )
		AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090219_03}", 9, 28 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
			
	--帮会贡献度称号
	elseif GetNumText() == 30 then
		
		local currGuildContriSum = CityGetAttr(sceneId, selfId, 15);
		local currGuildContriTitle = GetGuildContriTitle(sceneId, selfId);
		local guildName = LuaFnGetGuildName(sceneId, selfId);
		
		for i, titleItem in x805009_g_GuildContriTitle do
			if currGuildContriTitle == "" then
				currGuildContriTitle = guildName
			end
			if currGuildContriTitle == guildName..titleItem.currName then	
				local playerName = GetName(sceneId, selfId);

				if currGuildContriSum < titleItem.needContri then
					local strTip = "#R"..playerName.."#W! Mu痭 th錸g ch裞 #G"..guildName..titleItem.name.."#W c 餴琺 c痭g hi猲 l� #G"..titleItem.needContri.."#W 餴琺! C醕 h� ch遖 瘘, h銀 c� gg h絥 n豠.";
					BeginEvent( sceneId )
						AddText( sceneId, strTip )
					EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
					return
				end
				
				AwardGuildContriTitle( sceneId, selfId, guildName..titleItem.name);
				SetCurTitle( sceneId, selfId, 38, 0 );
				LuaFnDispatchAllTitle( sceneId, selfId )
				
				local strTip = "Ch鷆 m譶g #R"..playerName.."#W Tr� th鄋h th鄋h vi阯 Bang h礽 #G"..guildName..titleItem.name.."#W! 鞋 Bang h礽 h遪g th竎h xin h銀 c� gg."
				
				--增加特效
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		
				local sMessage = format("@*;SrvMsg;GLD:#WB眓 bang #R#{_INFOUSR%s}#W v� b眓 bang l 疬㧟 c鬾g l緉, ban cho ch裞 v� #G%s#W!#R#{_INFOUSR%s}#W h銀 ti猵 t鴆 c� gg!", playerName, guildName..titleItem.name ,playerName);	
	    		BroadMsgByChatPipe(sceneId, selfId, sMessage, 6);
			
			
				sMessage = format("#W#{_INFOUSR%s} v� #G%s#W kh鬾g ng譶g c� gg, ban cho ch裞 v�: #G%s#W!", playerName,guildName, guildName..titleItem.name );
				BroadMsgByChatPipe(sceneId, selfId, sMessage, 4);
		
				BeginEvent( sceneId )
					AddText( sceneId, strTip )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				
				break;
			end
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x805009_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805009_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805009_NotifyFailTips( sceneId, selfId, "Ng呓i hi畁 kh鬾g th� nh nhi甿 v� n鄖" )
		elseif ret == -2 then
			x805009_NotifyFailTips( sceneId, selfId, "Kh鬾g th� ti猵 nh nhi玼 nhi甿 v�" )
		end

		return
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x805009_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805009_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805009_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x805009_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805009_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x805009_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805009_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--死亡事件
--**********************************
function x805009_OnDie( sceneId, selfId, killerId )
end

function x805009_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--帮贡界面UI 19821 Banggong Exchange调用到这里
--**********************************
function x805009_BanggongExchange( sceneId, selfId, nvalue ) --这个是玩家输入值，实际的扣除值还要在此基础上+10%的税率
	local haveBangGong = CityGetAttr(sceneId, selfId, GUILD_CONTRIB_POINT)
	
	--是否安全时间，这个判断函数里面自己有提示信息，不需要这里写提示信息
	if IsPilferLockFlag(sceneId, selfId) <= 0 then
		return
	end
	
	--输入是否超过已有数量
	if nvalue > haveBangGong then
		x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8829_03}")
		return
	end
	
	--帮贡牌的最大额度不能超过200。
	if nvalue > 200 then
		x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8922_25}")
		return
	end
	
	--帮贡牌的最小额度不能低于10。
	if nvalue < 10 then
		x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8922_26}")
		return
	end
	
	local totalvalue = floor( nvalue*0.1 ) + nvalue

	--加上税率之后是否有足够帮贡
	if totalvalue > haveBangGong then
		x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8922_27}")
		return
	end
	
	--道具栏是否有空间
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) <= 0 then
		x805009_NotifyFailTips( sceneId, selfId, "#{SJQM_8819_20}")
		return
	end
	
	local ret = CityChangeAttr(sceneId, selfId, GUILD_CONTRIB_POINT, -totalvalue)
	if ret == 1 then
		local BagIndex = TryRecieveItem( sceneId, selfId, 30900050, QUALITY_MUST_BE_CHANGE )
		local roleBangPaiID = GetHumanGuildID(sceneId, selfId)
		
		if BagIndex ~= -1 then
			SetBagItemParam(sceneId, selfId, BagIndex, 4, 2, roleBangPaiID) --帮派ID
			SetBagItemParam(sceneId, selfId, BagIndex, 8, 2, nvalue) --帮贡数值
			LuaFnRefreshItemInfo( sceneId, selfId, BagIndex )
			x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8829_10}"..nvalue.."#{BGCH_8829_11}")
		else
			x805009_NotifyFailTips( sceneId, selfId, "L瞚 t誳 v ph")
		end
	else
		x805009_NotifyFailTips( sceneId, selfId, "Kh tr� th b読")
	end
	
end
