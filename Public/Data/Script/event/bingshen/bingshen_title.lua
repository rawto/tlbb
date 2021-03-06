
-- 缥缈峰称号	20090220 by zhangguoxin
x894100_g_scriptId = 894100
--所拥有的事件ID列表

--征南先锋印
x894100_g_XuanFuID = 20310184

--兑换需求
x894100_g_Cost = {30,60,90,120,150,180,210}
--称号id
x894100_g_TitleID = {447,448,449,450,451,471,472,473,474,475,476,477,478,479,480}
--不同等级的失败提示
x894100_g_FailMsg = {"斜i danh hi畊 n鄖 c #W30 c醝 Chinh Nam Ti阯 Phong ?n","斜i danh hi畊 n鄖 c #W60 c醝 Chinh Nam Ti阯 Phong ?n","斜i danh hi畊 n鄖 c #W90 c醝 Chinh Nam Ti阯 Phong ?n","斜i danh hi畊 n鄖 c #W120 c醝 Chinh Nam Ti阯 Phong ?n","斜i danh hi畊 n鄖 c #W150 c醝 Chinh Nam Ti阯 Phong ?n","斜i danh hi畊 n鄖 c #W180 c醝 Chinh Nam Ti阯 Phong ?n","斜i danh hi畊 n鄖 c #W210 c醝 Chinh Nam Ti阯 Phong ?n"}
--称号等级
x894100_g_TitleLvNum = 7;
--称号idx 程序用
x894100_g_TitleIndex = 19;


function x894100_ChangePiaoMiaoTitle(sceneId, selfId, targetId,titleLv)
	
	--DeleteTitle(sceneId,selfId,x894100_g_TitleIndex);
	--合法性检查
	if titleLv < 1 and titleLv > x894100_g_TitleLvNum then
		return
	end
	
	--角色现有称号	
	local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
	
	if (titleLv == 1) then
		--是否已有称号
		if (HadTitleID == x894100_g_TitleID[1]
				or HadTitleID == x894100_g_TitleID[2]
				or HadTitleID == x894100_g_TitleID[3]
				or HadTitleID == x894100_g_TitleID[4]
				or HadTitleID == x894100_g_TitleID[5]
				or HadTitleID == x894100_g_TitleID[6]
				or HadTitleID == x894100_g_TitleID[7]
				or HadTitleID == x894100_g_TitleID[8]
				or HadTitleID == x894100_g_TitleID[9]
				or HadTitleID == x894100_g_TitleID[10]
				or HadTitleID == x894100_g_TitleID[11]
				or HadTitleID == x894100_g_TitleID[12]
				or HadTitleID == x894100_g_TitleID[13]
				or HadTitleID == x894100_g_TitleID[14]
				or HadTitleID == x894100_g_TitleID[15]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	

			return
		end
	end
	
	if (titleLv == 2) then
		--是否已有称号
		if (HadTitleID == x894100_g_TitleID[2]
				or HadTitleID == x894100_g_TitleID[3]
				or HadTitleID == x894100_g_TitleID[4]
				or HadTitleID == x894100_g_TitleID[5]
				or HadTitleID == x894100_g_TitleID[6]
				or HadTitleID == x894100_g_TitleID[7]
				or HadTitleID == x894100_g_TitleID[8]
				or HadTitleID == x894100_g_TitleID[9]
				or HadTitleID == x894100_g_TitleID[10]
				or HadTitleID == x894100_g_TitleID[11]
				or HadTitleID == x894100_g_TitleID[12]
				or HadTitleID == x894100_g_TitleID[13]
				or HadTitleID == x894100_g_TitleID[14]
				or HadTitleID == x894100_g_TitleID[15]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--是否有上一等级的称号
		if (HadTitleID ~= x894100_g_TitleID[1]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, x894100_g_FailMsg[titleLv])
			x894100_NotifyFailBox(sceneId, selfId, targetId, "C醕 h� c騨 ch遖 nh danh hi畊 tr呔c 痼")	

			return
		end
	end
	
	if (titleLv == 3) then
		--是否已有称号
		if (HadTitleID == x894100_g_TitleID[3]
				or HadTitleID == x894100_g_TitleID[4]
				or HadTitleID == x894100_g_TitleID[5]
				or HadTitleID == x894100_g_TitleID[6]
				or HadTitleID == x894100_g_TitleID[7]
				or HadTitleID == x894100_g_TitleID[8]
				or HadTitleID == x894100_g_TitleID[9]
				or HadTitleID == x894100_g_TitleID[10]
				or HadTitleID == x894100_g_TitleID[11]
				or HadTitleID == x894100_g_TitleID[12]
				or HadTitleID == x894100_g_TitleID[13]
				or HadTitleID == x894100_g_TitleID[14]
				or HadTitleID == x894100_g_TitleID[15]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--是否有上一等级的称号
		if (HadTitleID ~= x894100_g_TitleID[2]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, x894100_g_FailMsg[titleLv])
			x894100_NotifyFailBox(sceneId, selfId, targetId, "C醕 h� c騨 ch遖 nh danh hi畊 tr呔c 痼")	

			return
		end
	end
	
	if (titleLv == 4) then
		--是否已有称号
		if (HadTitleID == x894100_g_TitleID[4]
				or HadTitleID == x894100_g_TitleID[5]
				or HadTitleID == x894100_g_TitleID[6]
				or HadTitleID == x894100_g_TitleID[7]
				or HadTitleID == x894100_g_TitleID[8]
				or HadTitleID == x894100_g_TitleID[9]
				or HadTitleID == x894100_g_TitleID[10]
				or HadTitleID == x894100_g_TitleID[11]
				or HadTitleID == x894100_g_TitleID[12]
				or HadTitleID == x894100_g_TitleID[13]
				or HadTitleID == x894100_g_TitleID[14]
				or HadTitleID == x894100_g_TitleID[15]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--是否有上一等级的称号
		if (HadTitleID ~= x894100_g_TitleID[3]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, x894100_g_FailMsg[titleLv])
			x894100_NotifyFailBox(sceneId, selfId, targetId, "C醕 h� c騨 ch遖 nh danh hi畊 tr呔c 痼")	

			return
		end
	end

	if (titleLv == 5) then
		--是否已有称号
		if (HadTitleID == x894100_g_TitleID[5]
				or HadTitleID == x894100_g_TitleID[6]
				or HadTitleID == x894100_g_TitleID[7]
				or HadTitleID == x894100_g_TitleID[8]
				or HadTitleID == x894100_g_TitleID[9]
				or HadTitleID == x894100_g_TitleID[10]
				or HadTitleID == x894100_g_TitleID[11]
				or HadTitleID == x894100_g_TitleID[12]
				or HadTitleID == x894100_g_TitleID[13]
				or HadTitleID == x894100_g_TitleID[14]
				or HadTitleID == x894100_g_TitleID[15]) then

			x894100_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--是否有上一等级的称号
		if (HadTitleID ~= x894100_g_TitleID[4]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, x894100_g_FailMsg[titleLv])
			x894100_NotifyFailBox(sceneId, selfId, targetId, "C醕 h� c騨 ch遖 nh danh hi畊 tr呔c 痼")	

			return
		end
	end
	if (titleLv == 6) then
		--是否已有称号
		if (HadTitleID == x894100_g_TitleID[6]
				or HadTitleID == x894100_g_TitleID[7]
				or HadTitleID == x894100_g_TitleID[8]
				or HadTitleID == x894100_g_TitleID[9]
				or HadTitleID == x894100_g_TitleID[10]
				or HadTitleID == x894100_g_TitleID[11]
				or HadTitleID == x894100_g_TitleID[12]
				or HadTitleID == x894100_g_TitleID[13]
				or HadTitleID == x894100_g_TitleID[14]
				or HadTitleID == x894100_g_TitleID[15]) then

			x894100_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--是否有上一等级的称号
		if (HadTitleID ~= x894100_g_TitleID[5]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, x894100_g_FailMsg[titleLv])
			x894100_NotifyFailBox(sceneId, selfId, targetId, "C醕 h� c騨 ch遖 nh danh hi畊 tr呔c 痼")	

			return
		end
	end
	if (titleLv == 7) then
		--是否已有称号
		if (HadTitleID == x894100_g_TitleID[7]
				or HadTitleID == x894100_g_TitleID[8]
				or HadTitleID == x894100_g_TitleID[9]
				or HadTitleID == x894100_g_TitleID[10]
				or HadTitleID == x894100_g_TitleID[11]
				or HadTitleID == x894100_g_TitleID[12]
				or HadTitleID == x894100_g_TitleID[13]
				or HadTitleID == x894100_g_TitleID[14]
				or HadTitleID == x894100_g_TitleID[15]) then

			x894100_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--是否有上一等级的称号
		if (HadTitleID ~= x894100_g_TitleID[6]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, x894100_g_FailMsg[titleLv])
			x894100_NotifyFailBox(sceneId, selfId, targetId, "C醕 h� c騨 ch遖 nh danh hi畊 tr呔c 痼")	
			return
		end
	end

	--检查物玄符量
	local checkRet = x894100_CheckXuanFu(sceneId,selfId,targetId,x894100_g_Cost[titleLv]);
	if (checkRet ~= 1) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, x894100_g_FailMsg[titleLv])
			return
	end
	
	--扣除玄符
	local costRet = x894100_CostXuanFu(sceneId,selfId,targetId,x894100_g_Cost[titleLv]);
	if (costRet ~= 1) then
		x894100_NotifyFailBox(sceneId, selfId, targetId, "Kh鬾g 瘘 s� l唼ng Chinh Nam Ti阯 Phong ?n")
		return
	end
	
	--给予称号
	AwardTitle( sceneId, selfId, x894100_g_TitleIndex, x894100_g_TitleID[titleLv])
	--写audit日志 add by zhangguoxin 090226
	local guid = LuaFnObjId2Guid(sceneId, selfId);
	local LogInfo = format("LUAAUDIT_TITLE_GET,0X%08X,%d,",guid,x894100_g_TitleID[titleLv]);
	LuaFnAuditGeneralLog(LogInfo);
	--更新客户端
	DispatchAllTitle(sceneId,selfId)
	--设置当前称号
	SetCurTitle(sceneId,selfId,43,x894100_g_TitleID[titleLv])
	--关闭对话框
	x894100_CloseWindow(sceneId,selfId, targetId)
	--发送公告
	x894100_SendNotice(sceneId, selfId, targetId,titleLv)
	--放特效
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0)
	--醒目提示
	x894100_MsgBox(sceneId, selfId,"#{PMF_090302_6}")
end

--发送公告
function x894100_SendNotice(sceneId, selfId, targetId,lv)

	--合法性检查
	if lv < 1 and lv > x894100_g_TitleLvNum then
		return
	end
	local strformat;
	
	if (lv == 1) then
		strformat	= "#{_INFOUSR%s} c trong tay 30 c醝 #GChinh Nam Ti阯 Phong ?n#W 餰m 皙n giao cho L鈛 Lan - S� Gi� Binh Th醤h K� Tr, S� gi� vui m譶g kh鬾 xi猼 b鑞 ban tg cho danh hi畊 #cFF0000Hi畃 Gi� Nh鈔 T鈓#W!"
	end
	if (lv == 2) then
		strformat	= "#{_INFOUSR%s} c trong tay 60 c醝 #GChinh Nam Ti阯 Phong ?n#W 餰m 皙n giao cho L鈛 Lan - S� Gi� Binh Th醤h K� Tr, S� gi� vui m譶g kh鬾 xi猼 b鑞 ban tg cho danh hi畊 #cFF0000S醫 Tr H鄋h Gi�#W!"
	end
	if (lv == 3) then
		strformat	= "#{_INFOUSR%s} c trong tay 90 c醝 #GChinh Nam Ti阯 Phong ?n#W 餰m 皙n giao cho L鈛 Lan - S� Gi� Binh Th醤h K� Tr, S� gi� vui m譶g kh鬾 xi猼 b鑞 ban tg cho danh hi畊 #cFF0000H鵱g T鄆 V� L唼c#W!"
	end
	if (lv == 4) then
		strformat	= "#{_INFOUSR%s} c trong tay 120 c醝 #GChinh Nam Ti阯 Phong ?n#W 餰m 皙n giao cho L鈛 Lan - S� Gi� Binh Th醤h K� Tr, S� gi� vui m譶g kh鬾 xi猼 b鑞 ban tg cho danh hi畊 #cFF0000Ti阯 Th醤h Di Phong#W!"
	end

	if (lv == 5) then
		strformat	= "#{_INFOUSR%s} c trong tay 150 c醝 #GChinh Nam Ti阯 Phong ?n#W 餰m 皙n giao cho L鈛 Lan - S� Gi� Binh Th醤h K� Tr, S� gi� vui m譶g kh鬾 xi猼 b鑞 ban tg cho danh hi畊 #cFF0000Qu� C痗 V� Song#W!"
	end
	if (lv == 6) then
		strformat	= "#{_INFOUSR%s} c trong tay 180 c醝 #GChinh Nam Ti阯 Phong ?n#W 餰m 皙n giao cho L鈛 Lan - S� Gi� Binh Th醤h K� Tr, S� gi� vui m譶g kh鬾 xi猼 b鑞 ban tg cho danh hi畊 #cFF0000械c B� Giang H�#W!"
	end
	if (lv == 7) then
		strformat	= "#{_INFOUSR%s} c trong tay 210 c醝 #GChinh Nam Ti阯 Phong ?n#W 餰m 皙n giao cho L鈛 Lan - S� Gi� Binh Th醤h K� Tr, S� gi� vui m譶g kh鬾 xi猼 b鑞 ban tg cho danh hi畊 #cFF0000Thi阯 Nh鈔 H䅟 Nh#W!"
	end
	
	local strText = format(strformat, GetName(sceneId,selfId))	
	BroadMsgByChatPipe(sceneId, selfId, strText, 4)
end

--检查物品
function x894100_CheckXuanFu(sceneId, selfId, targetId,num)
	if num <= 0 then
		return 0
	end
	
	local nCount =LuaFnGetAvailableItemCount(sceneId, selfId,x894100_g_XuanFuID)
	
	if (nCount < num) then
		return 0;
	end
	
	return 1;
end

--扣除物品
function x894100_CostXuanFu(sceneId, selfId, targetId,num)
	if num <= 0 then
		return 0
	end
	
	local ret1 = LuaFnDelAvailableItem(sceneId,selfId, x894100_g_XuanFuID, num)
	if (ret1 < 1) then
		return 0;
	end
	
	return 1;
end

--关闭对话框
function x894100_CloseWindow(sceneId,selfId, targetId)
	BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
end

--**********************************
--任务入口函数
--**********************************
function x894100_OnDefaultEvent( sceneId, selfId, targetId )
	local nNum = GetNumText()
	
	--第一层界面
	if (nNum == 10) then
		BeginEvent(sceneId)
			AddText(sceneId,"Ch� tr� #GBinh Th醤h K� Tr#W l� #GGia Lu Li阯 Th鄋h#W ch韓h l� 疬㧟 Li陁 歇 giao tr鱪g tr醕h th鈔 chinh ph呓ng nam. N猽 疳nh b読 h nh 疬㧟 t韓 v c黙 Li陁 歇 #GChinh Nam Ti阯 Phong ?n#W trong ng叨i h, giao l読 cho ta, ta s� t鈛 l阯 th醤h th唼ng lu c鬾g ban th叻ng cho c醕 h�!")
			AddNumText( sceneId, x894100_g_scriptId, "   #G斜i danh hi畊 #cFF0000Hi畃 Gi� Nh鈔 T鈓", 6, 21 )
			AddNumText( sceneId, x894100_g_scriptId, "   #G斜i danh hi畊 #cFF0000S醫 Tr H鄋h Gi�", 6, 22 )
			AddNumText( sceneId, x894100_g_scriptId, "   #G斜i danh hi畊 #cFF0000H鵱g T鄆 V� L唼c", 6, 23 )
			AddNumText( sceneId, x894100_g_scriptId, "   #G斜i danh hi畊 #cFF0000Ti阯 Th醤h Di Phong", 6, 24 )
			AddNumText( sceneId, x894100_g_scriptId, "   #G斜i danh hi畊 #cFF0000Qu� C痗 V� Song", 6, 25 )
			AddNumText( sceneId, x894100_g_scriptId, "   #G斜i danh hi畊 #cFF0000械c B� Giang H�", 6, 26 )
			AddNumText( sceneId, x894100_g_scriptId, "   #G斜i danh hi畊 #cFF0000Thi阯 Nh鈔 H䅟 Nh", 6, 27 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end

	if (nNum == 200) then
		BeginEvent(sceneId)
			AddText(sceneId,"Ch� tr� #GBinh Th醤h K� Tr#W l� #GGia Lu Li阯 Th鄋h#W ch韓h l� 疬㧟 Li陁 歇 giao tr鱪g tr醕h th鈔 chinh ph呓ng nam. N猽 疳nh b読 h nh 疬㧟 t韓 v c黙 Li陁 歇 #GChinh Nam Ti阯 Phong ?n#W trong ng叨i h, giao l読 cho ta, ta s� t鈛 l阯 th醤h th唼ng lu c鬾g ban th叻ng cho c醕 h�!")
			AddNumText( sceneId, x894100_g_scriptId, "#GL頽h thu礳 t韓h #cFF0000Hi畃 Gi� Nh鈔 T鈓", 6, 210 )
			AddNumText( sceneId, x894100_g_scriptId, "#GL頽h thu礳 t韓h #cFF0000S醫 Tr H鄋h Gi�", 6, 220 )
			AddNumText( sceneId, x894100_g_scriptId, "#GL頽h thu礳 t韓h #cFF0000H鵱g T鄆 V� L唼c", 6, 230 )
			AddNumText( sceneId, x894100_g_scriptId, "#GL頽h thu礳 t韓h #cFF0000Ti阯 Th醤h Di Phong", 6, 240 )
			AddNumText( sceneId, x894100_g_scriptId, "#GL頽h thu礳 t韓h #cFF0000Qu� C痗 V� Song", 6, 250 )
			AddNumText( sceneId, x894100_g_scriptId, "#GL頽h thu礳 t韓h #cFF0000械c B� Giang H�", 6, 260 )
			AddNumText( sceneId, x894100_g_scriptId, "#GL頽h thu礳 t韓h #cFF0000Thi阯 Nh鈔 H䅟 Nh", 6, 270 )

			AddNumText( sceneId, x894100_g_scriptId, "#GL頽h thu礳 t韓h #cFF0000Tam Hoa T� 徐nh", 6, 280 )
			AddNumText( sceneId, x894100_g_scriptId, "#GL頽h thu礳 t韓h #cFF0000Ng� Kh� Tri玼 Nguy阯", 6, 290 )
			AddNumText( sceneId, x894100_g_scriptId, "#GL頽h thu礳 t韓h #cFF0000Si陁 Ph鄊 V� T鬾g", 6, 300 )
			AddNumText( sceneId, x894100_g_scriptId, "#GL頽h thu礳 t韓h #cFF0000Kinh Th� V� T鬾", 6, 310 )
			AddNumText( sceneId, x894100_g_scriptId, "#GL頽h thu礳 t韓h #cFF0000Kho醤g Th� Th醤h V�", 6, 320 )
			AddNumText( sceneId, x894100_g_scriptId, "#GL頽h thu礳 t韓h #cFF0000Th醤h V� V� Song", 6, 330 )
			AddNumText( sceneId, x894100_g_scriptId, "#GL頽h thu礳 t韓h #cFF0000Tuy畉 Th� Phong Hoa", 6, 340 )
			AddNumText( sceneId, x894100_g_scriptId, "#GL頽h thu礳 t韓h #cFF0000Si陁 Ph鄊 Nh Th醤h", 6, 350 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
	--关于
	if (nNum == 11) then
		BeginEvent(sceneId)
			AddText(sceneId,"#eaf0c14#YHi畃 Gi� Nh鈔 T鈓#r#GSinh l馽 t痠 餫 +2%#Ngo読 C鬾g +5%#rNgo読 Th� +6%#rN礽 C鬾g +5%#rN礽 Th� +6%#r")
			AddText(sceneId,"#eaf0c14#YS醫 Tr H鄋h Gi�#r#GSinh l馽 t痠 餫 +5%#Ngo読 C鬾g +10%#rNgo読 Th� +10%#rN礽 C鬾g +10%#rN礽 Th� +10%#r")
			AddText(sceneId,"#eaf0c14#YH鵱g T鄆 V� L唼c#r#GSinh l馽 t痠 餫 +8%#Ngo読 C鬾g +15%#rNgo読 Th� +15%#rN礽 C鬾g +15%#rN礽 Th� +15%#r")
			AddText(sceneId,"#eaf0c14#YTi阯 Th醤h Di Phong#r#GSinh l馽 t痠 餫 +10%#Ngo読 C鬾g +20%#rNgo読 Th� +20%#rN礽 C鬾g +20%#rN礽 Th� +20%#r")
			AddText(sceneId,"#eaf0c14#YQu� C痗 V� Song#r#GSinh l馽 t痠 餫 +12%#Ngo読 C鬾g +25%#rNgo読 Th� +25%#rN礽 C鬾g +25%#rN礽 Th� +25%#r")
			AddText(sceneId,"#eaf0c14#Y械c B� Giang H�#r#GSinh l馽 t痠 餫 +15%#Ngo読 C鬾g +30%#rNgo読 Th� +30%#rN礽 C鬾g +30%#rN礽 Th� +30%#r")
			AddText(sceneId,"#eaf0c14#YThi阯 Nh鈔 H䅟 Nh#r#GSinh l馽 t痠 餫 +18%#Ngo読 C鬾g +35%#rNgo読 Th� +35%#rN礽 C鬾g +35%#rN礽 Th� +35%#r")
			AddText(sceneId,"#eaf0c14#YTam Hoa T� 徐nh#r#GSinh l馽 t痠 餫 +20%#Ngo読 C鬾g +40%#rNgo読 Th� +40%#rN礽 C鬾g +40%#rN礽 Th� +40%#r")
			AddText(sceneId,"#eaf0c14#YNg� Kh� Tri玼 Nguy阯#r#GSinh l馽 t痠 餫 +23%#Ngo読 C鬾g +45%#rNgo読 Th� +45%#rN礽 C鬾g +45%#rN礽 Th� +45%#r")
			AddText(sceneId,"#eaf0c14#YSi陁 Ph鄊 V� T鬾g#r#GSinh l馽 t痠 餫 +25%#Ngo読 C鬾g +50%#rNgo読 Th� +50%#rN礽 C鬾g +50%#rN礽 Th� +50%#r")
			AddText(sceneId,"#eaf0c14#YKinh Th� V� T鬾#r#GSinh l馽 t痠 餫 +28%#Ngo読 C鬾g +55%#rNgo読 Th� +55%#rN礽 C鬾g +55%#rN礽 Th� +55%#r")
			AddText(sceneId,"#eaf0c14#YKho醤g Th� Th醤h V�#r#GSinh l馽 t痠 餫 +30%#Ngo読 C鬾g +60%#rNgo読 Th� +60%#rN礽 C鬾g +60%#rN礽 Th� +60%#r")
			AddText(sceneId,"#eaf0c14#YTh醤h V� V� Song#r#GSinh l馽 t痠 餫 +33%#Ngo読 C鬾g +65%#rNgo読 Th� +65%#rN礽 C鬾g +65%#rN礽 Th� +65%#r")
			AddText(sceneId,"#eaf0c14#YTuy畉 Th� Phong Hoa#r#GSinh l馽 t痠 餫 +35%#Ngo読 C鬾g +70%#rNgo読 Th� +70%#rN礽 C鬾g +70%#rN礽 Th� +70%#r")
			AddText(sceneId,"#eaf0c14#YSi陁 Ph鄊 Nh Th醤h#r#GSinh l馽 t痠 餫 +40%#Ngo読 C鬾g +80%#rNgo読 Th� +80%#rN礽 C鬾g +80%#rN礽 Th� +80%#r")


		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
	--第二层界面
	if (nNum == 21) then
		BeginEvent(sceneId)
			AddText(sceneId,"Mu痭 鸨i danh hi畊 n鄖 c giao cho ta #G30 c醝 Chinh Nam Ti阯 Phong ?n#W 瓞 giao cho Th醤h Th唼ng lu c鬾g ban th叻ng. C醕 h� c� x醕 nh giao l読 cho ta kh鬾g?")
			AddNumText( sceneId, x894100_g_scriptId, "X醕 nh", 6, 1 )
			AddNumText( sceneId, x894100_g_scriptId, "H鼀 b�", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
	end
	
	if (nNum == 22) then
		BeginEvent(sceneId)
			AddText(sceneId,"Mu痭 鸨i danh hi畊 n鄖 c giao cho ta #G60 c醝 Chinh Nam Ti阯 Phong ?n#W 瓞 giao cho Th醤h Th唼ng lu c鬾g ban th叻ng. C醕 h� c� x醕 nh giao l読 cho ta kh鬾g?")
			AddNumText( sceneId, x894100_g_scriptId, "X醕 nh", 6, 2 )
			AddNumText( sceneId, x894100_g_scriptId, "H鼀 b�", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
	end
	
	if (nNum == 23) then
		BeginEvent(sceneId)
			AddText(sceneId,"Mu痭 鸨i danh hi畊 n鄖 c giao cho ta #G90 c醝 Chinh Nam Ti阯 Phong ?n#W 瓞 giao cho Th醤h Th唼ng lu c鬾g ban th叻ng. C醕 h� c� x醕 nh giao l読 cho ta kh鬾g?")
			AddNumText( sceneId, x894100_g_scriptId, "X醕 nh", 6, 3 )
			AddNumText( sceneId, x894100_g_scriptId, "H鼀 b�", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
	end
	
	if (nNum == 24) then
		BeginEvent(sceneId)
			AddText(sceneId,"Mu痭 鸨i danh hi畊 n鄖 c giao cho ta #G120 c醝 Chinh Nam Ti阯 Phong ?n#W 瓞 giao cho Th醤h Th唼ng lu c鬾g ban th叻ng. C醕 h� c� x醕 nh giao l読 cho ta kh鬾g?")
			AddNumText( sceneId, x894100_g_scriptId, "X醕 nh", 6, 4 )
			AddNumText( sceneId, x894100_g_scriptId, "H鼀 b�", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
	end

	if (nNum == 25) then
		BeginEvent(sceneId)
			AddText(sceneId,"Mu痭 鸨i danh hi畊 n鄖 c giao cho ta #G150 c醝 Chinh Nam Ti阯 Phong ?n#W 瓞 giao cho Th醤h Th唼ng lu c鬾g ban th叻ng. C醕 h� c� x醕 nh giao l読 cho ta kh鬾g?")
			AddNumText( sceneId, x894100_g_scriptId, "X醕 nh", 6, 5 )
			AddNumText( sceneId, x894100_g_scriptId, "H鼀 b�", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
	end
	if (nNum == 26) then
		BeginEvent(sceneId)
			AddText(sceneId,"Mu痭 鸨i danh hi畊 n鄖 c giao cho ta #G180 c醝 Chinh Nam Ti阯 Phong ?n#W 瓞 giao cho Th醤h Th唼ng lu c鬾g ban th叻ng. C醕 h� c� x醕 nh giao l読 cho ta kh鬾g?")
			AddNumText( sceneId, x894100_g_scriptId, "X醕 nh", 6, 6 )
			AddNumText( sceneId, x894100_g_scriptId, "H鼀 b�", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
	end
	if (nNum == 27) then
		BeginEvent(sceneId)
			AddText(sceneId,"Mu痭 鸨i danh hi畊 n鄖 c giao cho ta #G210 c醝 Chinh Nam Ti阯 Phong ?n#W 瓞 giao cho Th醤h Th唼ng lu c鬾g ban th叻ng. C醕 h� c� x醕 nh giao l読 cho ta kh鬾g?")
			AddNumText( sceneId, x894100_g_scriptId, "X醕 nh", 6, 7 )
			AddNumText( sceneId, x894100_g_scriptId, "H鼀 b�", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
	end

	if (nNum == 210) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[1] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 27217, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "Nh danh hi畊 th鄋h c鬾g!")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Nh danh hi畊 th b読!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	
	if (nNum == 220) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[2] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 27218, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "Nh danh hi畊 th鄋h c鬾g!")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Nh danh hi畊 th b読!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	
	if (nNum == 230) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[3] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 27219, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "Nh danh hi畊 th鄋h c鬾g!")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Nh danh hi畊 th b読!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end

	if (nNum == 240) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[4] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 27220, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "Nh danh hi畊 th鄋h c鬾g!")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Nh danh hi畊 th b読!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end

	if (nNum == 250) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[5] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 27221, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "Nh danh hi畊 th鄋h c鬾g!")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Nh danh hi畊 th b読!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 260) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[6] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 27222, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "Nh danh hi畊 th鄋h c鬾g!")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Nh danh hi畊 th b読!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 270) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[7] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 27223, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "Nh danh hi畊 th鄋h c鬾g!")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Nh danh hi畊 th b読!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 280) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[8] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 27224, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "Nh danh hi畊 th鄋h c鬾g!")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Nh danh hi畊 th b読!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 290) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[9] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 27225, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "Nh danh hi畊 th鄋h c鬾g!")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Nh danh hi畊 th b読!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 300) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[10] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 27226, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "Nh danh hi畊 th鄋h c鬾g!")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Nh danh hi畊 th b読!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 310) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[11] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 27227, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "Nh danh hi畊 th鄋h c鬾g!")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Nh danh hi畊 th b読!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 320) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[12] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 27228, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "Nh danh hi畊 th鄋h c鬾g!")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Nh danh hi畊 th b読!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 330) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[13] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 27229, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "Nh danh hi畊 th鄋h c鬾g!")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Nh danh hi畊 th b読!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 340) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[14] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 27230, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "Nh danh hi畊 th鄋h c鬾g!")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Nh danh hi畊 th b読!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 350) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[15] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 27231, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "Nh danh hi畊 th鄋h c鬾g!")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Nh danh hi畊 th b読!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end

	if (nNum == 100) then
		--关闭对话框
		x894100_CloseWindow(sceneId,selfId, targetId)
	end
	
	--确认兑换
	if nNum >= 1 and nNum <= x894100_g_TitleLvNum then
		x894100_ChangePiaoMiaoTitle(sceneId, selfId, targetId,nNum)
	end
end

--**********************************
--列举事件
--**********************************
function x894100_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x894100_g_scriptId, "#W斜i danh hi畊 #GBinh Th醤h K� Tr", 1, 10 )	
	AddNumText( sceneId, x894100_g_scriptId, "#WNh BUFF hi畊 裯g #ccc33ccBinh Th醤h K� Tr", 3, 200 )	
	AddNumText( sceneId, x894100_g_scriptId, "--Nh thu礳 t韓h danh hi畊--", 11, 11 )	
end




--**********************************
--检测接受条件
--**********************************
function x894100_CheckAccept( sceneId, selfId )
	return 1
end

--**********************************
--接受
--**********************************
function x894100_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x894100_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x894100_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x894100_CheckSubmit( sceneId, selfId )
end

--**********************************
--送出宠物蛋的公告
--**********************************
function x894100_ShowSystemNotice( sceneId, selfId, strItemInfo,iIndex )
		
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x894100_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--醒目信息提示
--**********************************
function x894100_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x894100_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x894100_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x894100_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x894100_OnItemChanged( sceneId, selfId, itemdataId )
end
