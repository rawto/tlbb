-- 212220
-- 兑换物品
x212220_g_scriptId = 212220

x212220_g_Stone = {	{level=50,id=20310000,num=15},
										{level=60,id=20310000,num=30},
										{level=70,id=20310000,num=60},}
										
x212220_g_Stone2 = {	{level=50,id=20310003,num=15},
										{level=60,id=20310003,num=30},
										{level=70,id=20310003,num=60},}


x212220_g_Item = {
	{level=50,id=10410001},{level=50,id=10422013},{level=50,id=10420004},{level=50,id=10423021},
	{level=60,id=10410002},{level=60,id=10422014},{level=60,id=10420005},{level=60,id=10423022},
	{level=70,id=10410003},{level=70,id=10422015},{level=70,id=10420006},{level=70,id=10423023},
}

x212220_g_BossItem = {
	{item=10401002,boss="#{_BOSS33}",scene=0},
	{item=10403002,boss="#{_BOSS33}",scene=0},
	{item=10405001,boss="#{_BOSS33}",scene=0},
	{item=10404002,boss="#{_BOSS33}",scene=0},
				
	{item=10401003,boss="#{_BOSS37}",scene=0},
	{item=10403003,boss="#{_BOSS37}",scene=0},
	{item=10405002,boss="#{_BOSS37}",scene=0},
	{item=10404003,boss="#{_BOSS37}",scene=0},
	
	{item=10401004,boss="#{_BOSS41}",scene=0},
	{item=10403004,boss="#{_BOSS41}",scene=0},
	{item=10405003,boss="#{_BOSS41}",scene=0},
	{item=10404004,boss="#{_BOSS41}",scene=0},
}

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212220_OnDefaultEvent( sceneId, selfId, targetId )

	local nNum = GetNumText()
	if nNum == 50 or nNum == 60 or nNum == 70   then
		
		local str
		
		if nNum == 50  then
			str = "C醕 h� n猽 ch nh d鵱g 15 c醝 Y猲 Huy玭 Ng鱟 giao cho ta l� c� th� ch鱪 1 m髇 trang b� d呔i 疴y:"
		elseif nNum == 60  then
			str = "C醕 h� n猽 ch nh d鵱g 30 c醝 Y猲 Huy玭 Ng鱟 giao cho ta l� c� th� ch鱪 1 m髇 trang b� d呔i 疴y:"
		elseif nNum == 70  then
			str = "C醕 h� n猽 ch nh d鵱g 60 c醝 Y猲 Huy玭 Ng鱟 giao cho ta l� c� th� ch鱪 1 m髇 trang b� d呔i 疴y:"
	
		end
		BeginEvent(sceneId)
			AddText(sceneId,str);
			for i, temp in x212220_g_Item do
				if temp.level == nNum  then
					AddRadioItemBonus( sceneId, temp.id, 1 )
				end
			end
		EndEvent( )
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x212220_g_scriptId,0)
	end
	

end

--**********************************
--列举事件
--**********************************
function x212220_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x212220_g_scriptId, "斜i l b� trang b� c 50", 0, 50 )
	AddNumText( sceneId, x212220_g_scriptId, "斜i l b� trang b� c 60", 0, 60 )
	AddNumText( sceneId, x212220_g_scriptId, "斜i l b� trang b� c 70", 0, 70 )
	
end

--**********************************
--检测接受条件
--**********************************
function x212220_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x212220_OnAccept( sceneId, selfId )

end

--**********************************
--放弃
--**********************************
function x212220_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x212220_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x212220_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x212220_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	-- 检测传过来的这个值是不是有效的
	local logNum1 = 0
	local logNum2 = 0
	local item
	local stone
	local stone2
	local bHaveItem = 0
	local bHaveStone = 0
	local temp
	local temp1
	for i, temp in x212220_g_Item do
		if temp.id == selectRadioId  then
			item = temp
			bHaveItem = 1
		end
	end
	
	-- 提交的物品不对应，直接返回，不做处理
	if bHaveItem == 0  then
		return
	end
	
	for i, temp1 in x212220_g_Stone do
		if temp1.level == item.level   then
			stone = temp1
			bHaveStone = 1
		end
	end
	
	--检测有没有第二种石头
	for i, temp1 in x212220_g_Stone2 do
		if temp1.level == item.level   then
			stone2 = temp1
			bHaveStone = 1
		end
	end
	
	-- 找不到对应的石头，直接返回
	if bHaveStone == 0    then
		return
	end
	
	-- 1，检测玩家身上是不是有位置能够放下物品
	BeginAddItem(sceneId)
		AddItem( sceneId, item.id, 1 )
	local ret = EndAddItem(sceneId,selfId)

	if ret < 1 then
		BeginEvent(sceneId)
			strText = "Tay n鋓 疸 馥y, kh鬾g th� trao 鸨i."
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 2，计算石头数量
	local selfStoneCount = GetItemCount(sceneId,selfId, stone.id) + GetItemCount(sceneId,selfId, stone2.id)
	if stone.num > selfStoneCount   then
		BeginEvent(sceneId)
			strText = "C醕 h� kh鬾g 瘘 nguy阯 li畊 瓞 鸨i v ph n鄖."
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
		
	end
	
	-- 3，检测背包中，如果有石头上锁，就不让执行下去
	if LuaFnGetAvailableItemCount( sceneId, selfId, stone.id ) + LuaFnGetAvailableItemCount( sceneId, selfId, stone2.id ) < stone.num  then
		BeginEvent(sceneId)
			strText = "Trao 鸨i th b読, vui l騨g ki琺 tra l読 v ph ph鋓 ch錸g 疸 kh骯"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end	
	
	-- 4，删除物品 先删除绑定的
	local BangdingNum = LuaFnGetAvailableItemCount( sceneId, selfId, stone.id );
	if(BangdingNum >= stone.num) then
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, stone.id, stone.num)
		if ret1 < 1  then
			BeginEvent(sceneId)
				strText = "X骯 b� th b読, vui l騨g ki琺 tra l読 v ph ph鋓 ch錸g 疸 kh骯"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		logNum1 = stone.num;
	elseif(BangdingNum == 0) then
		
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, stone2.id, stone2.num)
		if ret1 < 1  then
			BeginEvent(sceneId)
				strText = "X骯 b� th b読, vui l騨g ki琺 tra l読 v ph ph鋓 ch錸g 疸 kh骯"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		logNum2 = stone2.num;	
	
	else
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, stone.id, BangdingNum)
		if ret1 < 1  then
			BeginEvent(sceneId)
				strText = "X骯 b� th b読, vui l騨g ki琺 tra l読 v ph ph鋓 ch錸g 疸 kh骯"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		logNum1 = BangdingNum;
		
		--删没绑定的
		local Delete = stone.num - BangdingNum;
		ret1 = LuaFnDelAvailableItem(sceneId,selfId, stone2.id, Delete)
		if ret1 < 1  then
			BeginEvent(sceneId)
				strText = "X骯 b� th b読, vui l騨g ki琺 tra l読 v ph ph鋓 ch錸g 疸 kh骯"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		logNum2 = Delete;
	end
	
	-- 给奖励
	AddItemListToHuman(sceneId,selfId)

	-- 记录Log
	LuaFnAuditYanXuanYuExchange(sceneId, selfId, stone.id, logNum1, item.id)
	LuaFnAuditYanXuanYuExchange(sceneId, selfId, stone2.id, logNum2, item.id)
	
	--兑换成功，播放特效
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
	
	-- 发世界公告
	local szItem = GetItemTransfer(sceneId,selfId,0)
	local randMessage = random(3);

	if randMessage == 1 then
   	message = format("#Y M鴆 袖o#cff99cc d鵱g m鹖 ch誱 v鄌#Y Y猲 Huy玭 Ng鱟#cff99cc c黙#{_INFOUSR%s}#cff99cc mang 皙n h韙 1 h絠 s鈛. M祎 l鷆 sau g 馥u n骾: h鄋g nh ph, c醝 #{_INFOMSG%s}#cff99cc n鄖 thu礳 v� c醕 h�.", 
   										GetName(sceneId, selfId), szItem);

	elseif randMessage == 2 then		
		message = format("#Y M鴆 袖o#cff99cc l #YY猲 Huy玭 Ng鱟#W#cff99cc c黙 #{_INFOUSR%s}#cff99cc mang 皙n th眎 1 h絠, v鄌 r癷 瓞 l阯 tai nghe sau 痼 g 馥u n骾: r thu khi猼, c醝 #{_INFOMSG%s}#cff99cc n鄖 thu礳 v� c醕 h�.", 
											GetName(sceneId, selfId), szItem);
	else
		message = format("#Y M鴆 袖o#cff99cc l #YY猲 Huy玭 Ng鱟#W#cff99cc c黙#{_INFOUSR%s}#cff99cc mang 皙n, soi d呔i 醤h ng m tr秈 g 馥u n骾: l� th, c醝 #{_INFOMSG%s}#cff99cc n鄖 thu礳 v� c醕 h�.", 
											GetName(sceneId, selfId), szItem);
	end
	
	AddGlobalCountNews( sceneId, message )
	
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212220_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x212220_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212220_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--杀死BOSS拾取装备的世界公告
--**********************************
function x212220_ItemBulletin( sceneId, selfId, itemId, bagidx, bGem )
	local bHaveItem = 0
	local bossitem
	for i, temp in x212220_g_BossItem do
		if temp.item == itemId  then
			bossitem = temp
			bHaveItem = 1
		end
	end
	
	if bHaveItem == 0  then
		return
	end
	
	if sceneId ~= 167 then --by hukai 2008.10.06 BugID38192
		return
	end
	
	local szItem = GetBagItemTransfer(sceneId, selfId, bagidx)
	
	local randMessage = random(3);
	
	randMessage =3
	
	
	if randMessage == 1 then
   message = format("#{_INFOUSR%s}#cff99cc �#G%s#cff99cc d鵱g \"Oa T鈓 C呔c\" 疳 tr鷑g ch鈔 c黙 #Y%s#cff99cc,gi鄋h 疬㧟 ph thg, nh 疬㧟 1 m髇 #{_INFOMSG%s}.", 
   										GetName(sceneId, selfId), GetSceneName(sceneId), bossitem.boss, szItem );

	elseif randMessage == 2 then		
		message = format("#{_INFOUSR%s}#cff99cc �#G%s#cff99cc xu 1 chi陁 \"L鴆 M誧h Th Ki猰\" h� g鴆#Y%s#cff99cc, nh 疬㧟 #Y%s#cff99cc 疳nh r絠 c黙#{_INFOMSG%s}#cff99cc r癷 c叨i to b� 餴.", 
											GetName(sceneId, selfId), GetSceneName(sceneId), bossitem.boss, bossitem.boss, szItem);
	else
		message = format("#Y%s#cff99cc �#G%s#cff99cc b�#W#{_INFOUSR%s}#cff99cc ch叻ng m課h t� ph韆 sau, 疣nh ph鋓 giao n祊 1#{_INFOMSG%s}#cff99cc.", 
											bossitem.boss, GetSceneName(sceneId), GetName(sceneId, selfId), szItem);
	end
	
	AddGlobalCountNews( sceneId, message )
	
end

