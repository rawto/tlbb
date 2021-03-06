
-- 修改[褚少微 2008.5.29 添加,魔兵天将,极品装备放出。]

-- 894062 套装兑换NPC

-- 梁师成

--脚本号
x894062_g_ScriptId = 894062

--所拥有的事件ID列表
x894062_g_eventList={895063,894063,894100,894101}

--解决流失率兑换门派套装事件脚本
x894062_g_MenPaiTaoScriptId = 500617

x894062_g_EquipList={	
--       衣服－－－－－－－－腰带－－－－－－－－铠甲－－－－－
{n=1100,id=10102101},{n=1200,id=30308212},{n=1300,id=10412001},{n=1400,id=10411001},
{n=1100,id=10102102},{n=1200,id=10421001},{n=1300,id=10412001},{n=1400,id=10411001},
{n=1100,id=10102103},{n=1200,id=10421001},{n=1300,id=10412001},{n=1400,id=10411001},
{n=1100,id=10102104},{n=1200,id=10421001},{n=1300,id=10412001},{n=1400,id=10411001},
{n=1100,id=10102105},{n=1200,id=10421001},{n=1300,id=10412001},{n=1400,id=10411001},
{n=1100,id=10102106},
{n=1100,id=10102107},

-- 30级别的
{n=2100,id=10553250},{n=2100,id=10553259},{n=2100,id=10553268},{n=2100,id=10553277},{n=2100,id=10553286},{n=2100,id=10553295},
{n=2200,id=10451150},{n=2300,id=10451151},{n=2400,id=10451152},

-- 40级别的
{n=3100,id=10124183},{n=3200,id=10124188},{n=3300,id=10412009},{n=3400,id=10411009},{n=3500,id=10414024},
{n=3100,id=10124184},{n=3200,id=10124189},{n=3300,id=10412003},{n=3400,id=10411003},{n=3500,id=10414020},
{n=3100,id=10124185},{n=3200,id=10124190},{n=3300,id=10412009},{n=3400,id=10411009},{n=3500,id=10414024},
{n=3100,id=10124186},{n=3200,id=10124191},{n=3300,id=10412009},{n=3400,id=10411009},{n=3500,id=10414024},
{n=3100,id=10124187},

-- 50级别的
{n=4100,id=10156020},{n=4200,id=10156007},{n=4300,id=10412010},{n=4400,id=10411010},{n=4500,id=10414025},
{n=4100,id=10156024},{n=4200,id=10156009},{n=4300,id=10412004},{n=4400,id=10411004},{n=4500,id=10414021},
{n=4100,id=10156016},

-- 60级别的
{n=5100,id=30503065},{n=5200,id=30503062},{n=5300,id=10412011},{n=5400,id=10411011},{n=5500,id=10414026},{n=5600,id=10415018},
{n=5100,id=30503066},{n=5200,id=30503063},{n=5300,id=10412005},{n=5400,id=10411005},{n=5500,id=10414022},{n=5600,id=10415016},
{n=5100,id=30503067},{n=5200,id=30503064},{n=5300,id=10412005},{n=5400,id=10411005},{n=5500,id=10414022},{n=5600,id=10415016},
{n=5100,id=30503068},{n=5200,id=30503069},{n=5300,id=10412005},{n=5400,id=10411005},{n=5500,id=10414022},{n=5600,id=10415016},
{n=5100,id=30503070},

-- 70级别的
{n=6100,id=10413012},{n=6200,id=10421012},{n=6300,id=10412012},{n=6400,id=10411012},{n=6500,id=10414027},{n=6600,id=10415019},
{n=6100,id=10413006},{n=6200,id=10421006},{n=6300,id=10412006},{n=6400,id=10411006},{n=6500,id=10414023},{n=6600,id=10415017},
-- 80级别的
{n=7100,id=10413017},{n=7200,id=10421014},{n=7300,id=10412017},{n=7400,id=10411014},{n=7500,id=10414028},{n=7600,id=10415020},
{n=7100,id=10413018},{n=7200,id=10421015},{n=7300,id=10412018},{n=7400,id=10411015},{n=7500,id=10414029},{n=7600,id=10415021},
-- 90级别的
{n=8100,id=10413019},{n=8200,id=10421016},{n=8300,id=10412019},{n=8400,id=10411016},{n=8500,id=10414030},{n=8600,id=10415022},
{n=8100,id=10413020},{n=8200,id=10421017},{n=8300,id=10412020},{n=8400,id=10411017},{n=8500,id=10414031},{n=8600,id=10415023},

-- 褚少微，2008.5.29。极品装备放出。两个装备：10422016--重楼戒	10423024--重楼玉
{n=9100,id=10422016},
{n=9100,id=10423024},
}

x894062_g_StoneList={
-- 1级石头
{n=1,id=20700019,num=10,str="#GM鈔 C鬷 Chi Luy猲#W"},
-- 2级石头
{n=2,id=20700019,num=10,str="#GM鈔 C鬷 Chi Luy猲#W"},
-- 3级石头
{n=3,id=30503087,num=40,str="#GLinh H皀 To醝 Phi猲#W"},
-- 4级石头
{n=4,id=30503087,num=50,str="#GLinh H皀 To醝 Phi猲#W"},
-- 5级石头
{n=5,id=30503087,num=60,str="#GLinh H皀 To醝 Phi猲#W"},
-- 6级石头
{n=6,id=30505192,num=20,str="#GQu醝 V T呓ng S醕h#W"},
--80,90级 装备 需要的石头
{n=7,id=30008081,num=100,str="#GTh T竎h Hoa Bi畁#W"},

{n=8,id=30008081,num=120,str="#GTh T竎h Hoa Bi畁#W"},

-- 褚少微，2008.5.29。极品装备放出。两个兑换需要的物品：20310101--重楼之泪	20310102--Tr鵱g L鈛 Chi Mang
{n=9,id=30503026,num=20,str="#GC� Th� T鄋 Hi畉#W"},
{n=10,id=20310102,num=20,str="Tr鵱g L鈛 Chi Mang"},

}

--**********************************
--事件列表
--**********************************
function x894062_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		--AddText(sceneId,"  #{JPZB_0610_01}")
		for i, eventId in x894062_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end

		AddText(sceneId,"Binh Th醤h K� Tr l� ph� b鋘 c� 鸬 kh� c馽 cao, 皤 ngh� xem x閠 k� t靚h h靚h chi猲 鸬i tr呔c khi quy猼 鸶nh c� ti猲 v鄌 hay kh鬾g.")

		--AddNumText( sceneId, x894062_g_ScriptId, "#c6699ffM鈔 C鬷 Chi Luy猲#W ho醤 鸨i #c6699ffV� kh� t靚h nh鈔", 6, 1100 )
		--AddNumText( sceneId, x894062_g_ScriptId, "#c6699ffM鈔 C鬷 Chi Luy猲#W ho醤 鸨i #c6699ffTh秈 trang t靚h nh鈔", 6, 2100 )
		--AddNumText( sceneId, x894062_g_ScriptId, "#GQu醝 V T呓ng S醕h#W兑换#cFF0000高级属性时装", 0, 3000 )
		--AddNumText( sceneId, x894062_g_ScriptId, "#G七夕花瓣#W兑换#cFF0000顶级暗器材料", 0, 4000 )
		--AddNumText( sceneId, x894062_g_ScriptId, "#GC� Th� T鄋 Hi畉#W兑换#cFF0000120级门派技能", 0, 5000 )
		--AddNumText( sceneId, x894062_g_ScriptId, "兑换70级套装", 0, 6000 )
		--AddNumText( sceneId, x894062_g_ScriptId, "兑换80级套装", 0, 7000 )
		--AddNumText( sceneId, x894062_g_ScriptId, "兑换90级套装", 0, 8000 )
		--AddNumText( sceneId, x894062_g_MenPaiTaoScriptId, "兑换师门套装", 0, 846 )
		
		-- 褚少微，2008.5.29。极品装备放出。
		--AddNumText( sceneId, x894062_g_ScriptId, "魔兵天降", 0, 9000 )
		--AddNumText( sceneId, x894062_g_ScriptId, "魔兵天降介绍", 11, 10000 )

		--AddNumText( sceneId, x894062_g_ScriptId, "#c6699ff时装染色#W—刷新—#c6699ffTh秈 trang t靚h nh鈔", 6, 600 )

		AddNumText( sceneId, x894062_g_ScriptId, "V� Binh Th醤h K� Tr", 0, 500 )
		
		--AddNumText( sceneId, x894062_g_ScriptId, "离开……", 0, 0 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x894062_OnDefaultEvent( sceneId, selfId,targetId )
	x894062_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x894062_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	
	if eventId == x894062_g_MenPaiTaoScriptId then
		if nNumText == 846 then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		elseif nNumText == 2500 or nNumText == 2600 or nNumText == 2700 then
			CallScriptFunction( eventId, "OnEventRequest",sceneId, selfId, targetId )
			return
		end
	end
	
	if nNumText == 0  then
		-- 关闭窗口
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end

	if nNumText == 500  then
		BeginEvent(sceneId)
		    AddText(sceneId,"Ph� b鋘 Binh Th醤h K� Tr ch� y猽 r絠 xu痭g nguy阯 li畊 th錸g c Long V錸. Ng鄖 3 l唼t, sau khi ti陁 di畉 BOSS s� nh 疬㧟 ph th叻ng.")
		    AddText(sceneId,"#YCh� �#W: Ph� b鋘 Binh Th醤h K� Tr c� 鸬 kh� c馽 cao, c醕 v� c c th tr呔c khi 疬a ra quy猼 鸶nh c黙 m靚h.")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	if nNumText == 600  then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  0910281)
		return
	end
	if nNumText == 1000 or nNumText == 2000 or nNumText == 3000 or nNumText == 4000 or nNumText == 5000 or nNumText == 6000 or nNumText == 7000 or nNumText == 8000  then
		BeginEvent(sceneId)
			AddText(sceneId, "  #G请选择您兑换的物品：")
				if nNumText < 2000  then
					AddNumText(sceneId, x894062_g_ScriptId, "#c009933兑换拉风武器", 4, nNumText+100)
					--AddNumText(sceneId, x894062_g_ScriptId, "#c009933飞龙神龙仙术", 4, nNumText+200)
				end
			if nNumText >= 2000 and nNumText < 3000 then
			AddNumText(sceneId, x894062_g_ScriptId, "#cFF0000御瑶盘（火）", 0, nNumText+100)
			AddNumText(sceneId, x894062_g_ScriptId, "#W御瑶盘（冰）", 0, nNumText+200)
			AddNumText(sceneId, x894062_g_ScriptId, "#Y御瑶盘（玄）", 0, nNumText+300)
			AddNumText(sceneId, x894062_g_ScriptId, "#c009933御瑶盘（毒）", 0, nNumText+400)
			end
			if nNumText >= 3000 and nNumText < 4000  then
					AddNumText(sceneId, x894062_g_ScriptId, "兑换#G高级属性时装#cFF0000①", 0, nNumText+100)
					AddNumText(sceneId, x894062_g_ScriptId, "兑换#G高级属性时装#cFF0000②", 0, nNumText+200)
				end
			if nNumText >= 4000 and nNumText < 5000  then
					AddNumText(sceneId, x894062_g_ScriptId, "#G兑换#cFF0000顶级暗器", 0, nNumText+100)
					AddNumText(sceneId, x894062_g_ScriptId, "#G兑换#cFF0000顶级武魂", 0, nNumText+200)
				end
			if nNumText >= 5000 then
					AddNumText(sceneId, x894062_g_ScriptId, "#G兑换#cFF0000内攻门派", 0, nNumText+100)
					AddNumText(sceneId, x894062_g_ScriptId, "#G兑换#cFF0000外攻门派", 0, nNumText+200)
				end
			AddNumText( sceneId, x894062_g_ScriptId, "离开……", 0, 0 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText > 1000 and nNumText < 9000  then
		BeginEvent(sceneId)
			
			local nLevel = 0
			if nNumText > 1000 then
				nLevel = 1
			end
			if nNumText > 1100 then
				nLevel = 2
			end
			if nNumText > 2000 then
				nLevel = 2
			end
			if nNumText > 2100 then
				nLevel = 3
			end
			if nNumText > 2200 then
				nLevel = 4
			end
			if nNumText > 2300 then
				nLevel = 5
			end
			if nNumText > 3000 then
				nLevel = 6
			end
			if nNumText > 4000 then
				nLevel = 7
			end
			if nNumText > 4100 then
				nLevel = 8
			end
			if nNumText > 5000 then
				nLevel = 9
			end
			if nNumText > 6000 then
				nLevel = 6
			end
			if nNumText > 7000 then
				nLevel = 7
			end
			if nNumText > 8000 then
				nLevel = 8
			end
			
			local szStr = "  兑换了送给您喜欢点人吧！呵呵 想得到先给我" .. x894062_g_StoneList[nLevel].str 
										.. "”“".. tostring(x894062_g_StoneList[nLevel].num) .. " #r #r #r "
			AddText(sceneId, szStr)
			
			for i, item in x894062_g_EquipList do
				if item.n == nNumText  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
    EndEvent(sceneId)
    --DispatchMissionDemandInfo(sceneId,selfId,targetId, x894062_g_ScriptId, x210200_g_MissionId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId, x894062_g_ScriptId, 0)
		
	end
	
	for i, findId in x894062_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
	-- 褚少微，2008.5.29。极品装备放出。添加两个按钮的处理事件
	if nNumText == 9000 then
		BeginEvent(sceneId)	
				local szStr = "  #{JPZB_0610_06}"
				AddText(sceneId, szStr)
				for i, item in x894062_g_EquipList do
					if item.n == 9100  then
						AddRadioItemBonus( sceneId, item.id, 4 )
					end
				end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId, x894062_g_ScriptId, 0)
	end
	-- 魔兵天降介绍
	if nNumText == 10000 then
		BeginEvent(sceneId)	
				AddText( sceneId, "#{JPZB_20080523_01}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
end

--**********************************
--接受此NPC的任务
--**********************************
function x894062_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x894062_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x894062_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x894062_g_eventList do
		if missionScriptId == findId then
			x894062_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x894062_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x894062_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x894062_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x894062_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	--处理提交后的显示情况
	--为了安全，这里要仔细，不能出错
	local nItemIndex = -1
	
	if missionScriptId == x894062_g_MenPaiTaoScriptId then
		CallScriptFunction( missionScriptId, "OnMissionSubmit", sceneId, selfId, targetId, missionScriptId, selectRadioId )
		return 0
	end
	
	for i, item in x894062_g_EquipList do
		if item.id == selectRadioId  then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- 看完家是不是够材料提交
	local nLevel = 0
	if x894062_g_EquipList[nItemIndex].n > 1000 then
		nLevel = 1
	end
	if x894062_g_EquipList[nItemIndex].n > 1100 then
		nLevel = 2
	end
	if x894062_g_EquipList[nItemIndex].n > 2000 then
		nLevel = 2
	end
	if x894062_g_EquipList[nItemIndex].n > 2100 then
		nLevel = 3
	end
	if x894062_g_EquipList[nItemIndex].n > 2200 then
		nLevel = 4
	end
	if x894062_g_EquipList[nItemIndex].n > 2300 then
		nLevel = 5
	end
	if x894062_g_EquipList[nItemIndex].n > 3000 then
		nLevel = 6
	end
	if x894062_g_EquipList[nItemIndex].n > 4000 then
		nLevel = 7
	end
	if x894062_g_EquipList[nItemIndex].n > 4100 then
		nLevel = 8
	end
	if x894062_g_EquipList[nItemIndex].n > 5000 then
		nLevel = 9
	end
	if x894062_g_EquipList[nItemIndex].n > 6000 then
		nLevel = 6
	end
	if x894062_g_EquipList[nItemIndex].n > 7000 then
		nLevel = 7
	end
	if x894062_g_EquipList[nItemIndex].n > 8000 then
		nLevel = 8
	end
	
	-- 褚少微，2008.5.29。极品装备放出。
	if x894062_g_EquipList[nItemIndex].n == 9100 then
		if selectRadioId == 10422016 then
			nLevel = 9
		else 
			if selectRadioId == 10423024 then
				nLevel = 10
			end
		end
	end
	
	local bStoneOk = 0
	if GetItemCount(sceneId, selfId, x894062_g_StoneList[nLevel].id) >= x894062_g_StoneList[nLevel].num  then
		bStoneOk = 1
	end
	
	if  bStoneOk == 0 then
		BeginEvent(sceneId)
			if nLevel == 9 then
				strText = "#{JPZB_0610_07}"
			elseif nLevel == 10 then 
					strText = "#{JPZB_0610_08}"
			else
				strText = "#{JPZB_0610_09}"
			end
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 检查是不是有足够的石头可以扣除
	if LuaFnGetAvailableItemCount(sceneId, selfId, x894062_g_StoneList[nLevel].id) < x894062_g_StoneList[nLevel].num   then
		BeginEvent(sceneId)
			-- 褚少微，2008.5.29。极品装备放出。
			if nLevel == 9 then
				strText = "#{JPZB_0610_07}"
			elseif nLevel == 10 then 
					strText = "#{JPZB_0610_08}"
			else
				strText = "#{JPZB_0610_10}"
			end
			
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
		
	end
	
	-- 检查背包空间
	BeginAddItem(sceneId)
		AddItem(sceneId, selectRadioId, 1)
	local bBagOk = EndAddItem(sceneId, selfId)
	
	if bBagOk < 1 then
		BeginEvent(sceneId)
			strText = "#{JPZB_0610_11}"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x894062_g_StoneList[nLevel].id)
	local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
	
	-- 删除相关的石头
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x894062_g_StoneList[nLevel].id, x894062_g_StoneList[nLevel].num)
	
	if bDelOk < 1  then
		BeginEvent(sceneId)
			strText = "#{JPZB_0610_12}"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	else
		--给完家东西，完成
		-- AddItemListToHuman(sceneId,selfId)
		--
		local nBagIndex = TryRecieveItem( sceneId, selfId, x894062_g_EquipList[nItemIndex].id, 1 );
		
		-- 褚少微，2008.5.29。极品装备放出。这两个极品装备无法打孔，强制刻铭
		-- LuaFnEquipLock( sceneId, selfId, nBagIndex )
		
		BeginEvent(sceneId)
			strText = "#{JPZB_0610_13}"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local message;	
		local randMessage = random(3);
		local sItemName = GetItemName(sceneId, x894062_g_EquipList[nItemIndex].id)
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		elseif randMessage == 2 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		else
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		end
		
		-- 褚少微，2008.5.29。极品装备放出。
		if nLevel == 9 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		end
		if nLevel == 10 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		return
	end

	for i, findId in x894062_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x894062_OnDie( sceneId, selfId, killerId )
end
