--洛阳NPC
--孔宗渊
--普通

x000124_g_ScriptId	= 000124

--操作集
x000124_g_Key				=
{
		["do"]					= 100,	--确定
		["undo"]				= 101,	--取消
}

--******************************************************
--事件交互入口
--******************************************************
function x000124_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "Ta l� 姓i T痭g Di璶 Th醤h c鬾g, V錸 th醤h nh鈔 Kh眓g T鬾 Uy阯. N猽 c醕 h� c� th譨 鹫o c� nhi甿 v� chi猰 t痭 kh鬾g gian tay n鋓 qu� gi� th� c� th� giao cho ta x骯 b� 餴. Nh遪g tr呔c khi x骯 b� 鹫o c� c醕 h� ph鋓 c鈔 nh cho k�, c� ph鋓 ch ch kh鬾g c d鵱g 皙n n鎍" )
		AddNumText( sceneId, x000124_g_ScriptId, "Ta mu痭 x骯 鹫o c� nhi甿 v�", -1, x000124_g_Key["do"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000124_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()

	if key == x000124_g_Key["do"]	then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 42 )
	end
end

--******************************************************
--销毁任务物品
--由Client\Interface\MissionObjDel\MissionObjDel.lua发出
--******************************************************
function x000124_OnDestroy( sceneId, selfId, posItem )
	if posItem < 0 then
		return
	end
	
	local idItem = LuaFnGetItemTableIndexByIndex( sceneId, selfId, posItem )
	
	if idItem == 40002109 then 
		
		local ret = DelMission( sceneId, selfId, 4021 )
		if ret > 0 then		
			SetCurTitle(sceneId, selfId,  0, 124)
			DeleteTitle( sceneId, selfId,  5)
			LuaFnDispatchAllTitle(sceneId, selfId)			
			SetMissionData(sceneId,selfId,MD_CAOYUN_HUAN,0)
			SetMissionData(sceneId,selfId,MD_CAOYUN_MONSTERTIMER,0)
			LuaFnCancelSpecificImpact(sceneId,selfId,113)
		end
	
	end
	EraseItem( sceneId, selfId, posItem )
	x000124_OnDestroyLaborDay( sceneId, selfId, idItem )
end

--******************************************************
--销毁任务物品的特殊处理 五一节赠送活动
--刘盾 2008-04-17
--******************************************************
function x000124_OnDestroyLaborDay( sceneId, selfId, idItem )
	if(GlobalLaborDayActivityTable.PetCageCardID == idItem) then
		local hasImapct = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, GlobalLaborDayActivityTable.PetCageDelayBuff)
		if ( hasImapct > 0 ) then
			LuaFnCancelSpecificImpact(sceneId, selfId, GlobalLaborDayActivityTable.PetCageDelayBuff)
		end
	end
end
