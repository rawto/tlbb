--人之初--阅读布告牌任务
--Tri畊 Thi阯 S�
--MisDescBegin
--脚本号
x210224_g_ScriptId = 210224

--接受任务NPC属性
x210224_g_Position_X=282
x210224_g_Position_Z=253
x210224_g_SceneID=2
x210224_g_AccomplishNPC_Name="Tri畊 Thi阯 S�"

--任务号
x210224_g_MissionId = 704

--上一个任务的ID
--g_MissionIdPre =

--目标NPC
x210224_g_Name	="Tri畊 Thi阯 S�"

--任务归类
x210224_g_MissionKind = 13

--任务等级
x210224_g_MissionLevel = 8

--是否是精英任务
x210224_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x210224_g_IsMissionOkFail = 0		--变量的第0位

--以上是动态**************************************************************

--任务文本描述
x210224_g_MissionName="衖 xem b� c醥"
x210224_g_MissionInfo="#{event_dali_0034}"
x210224_g_MissionTarget="绪c #RB鋘g c醥 th� � #G姓i L�#W#{_INFOAIM269,83,2,-1}, sau 痼 v�#G Ng� Hoa 朽n th鄋h 姓i L�#W t靘 #RTri畊 Thi阯 S� #W#{_INFOAIM282,253,2,Tri畊 Thi阯 S遾.#r#YNh nh�: #G?n chu祎 ph鋓 v鄌 t鱝 鸬 NPC c� th� t� 鸬ng d竎h chuy琻 皙n ch� NPC 痼!"
x210224_g_ContinueInfo="Ng呓i 疸 xem #YB鋘g c醥 th�#W ch遖?"
x210224_g_MissionComplete="Ng呓i 疸 xem #YB鋘g c醥 th� #Wch遖? L� ng叨i x nh� v, nh 鸶nh ph鋓 tr譶g tr� nghi阭 kh."
x210224_g_SignPost = {x = 269, z = 83, tip = "布告牌"}
--任务奖励
x210224_g_MoneyBonus=100
--g_ItemBonus={{id=40002108,num=1}}

x210224_g_Custom	= { {id="秀 瘅c C醥 th�",num=1} }
x210224_g_IsMissionOkFail = 1		--变量的第0位

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210224_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	--如果玩家完成过这个任务（实际上如果完成了任务这里就不会显示，但是再检测一次比较安全）
    --if IsMissionHaveDone(sceneId,selfId,x210224_g_MissionId) > 0 then
	--	return
	--end
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x210224_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x210224_g_MissionName)
			AddText(sceneId,x210224_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, x210224_g_MoneyBonus )
		EndEvent()
		bDone = x210224_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210224_g_ScriptId,x210224_g_MissionId,bDone)		
    --满足任务接收条件
    elseif x210224_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x210224_g_MissionName)
			AddText(sceneId,x210224_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x210224_g_MissionTarget)
			--for i, item in g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
			--for i, item in g_RadioItemBonus do
			--	AddRadioItemBonus( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, x210224_g_MoneyBonus )
			EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210224_g_ScriptId,x210224_g_MissionId)
    end
end

--**********************************
--列举事件
--**********************************
function x210224_OnEnumerate( sceneId, selfId, targetId )
    --如果玩家还未完成上一个任务
    --if 	IsMissionHaveDone(sceneId,selfId,g_MissionIdPre) <= 0 then
    --	return
    --end
    --如果玩家完成过这个任务
    if IsMissionHaveDone(sceneId,selfId,x210224_g_MissionId) > 0 then
    	return 
	end
    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x210224_g_MissionId) > 0 then
		AddNumText(sceneId,x210224_g_ScriptId,x210224_g_MissionName,2,-1);
		--满足任务接收条件
	elseif x210224_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210224_g_ScriptId,x210224_g_MissionName,1,-1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x210224_CheckAccept( sceneId, selfId )
	--需要8级才能接
	if GetLevel( sceneId, selfId ) >= 8 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x210224_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210224_g_MissionId, x210224_g_ScriptId, 1, 0, 0 )		--添加任务
	misIndex = GetMissionIndexByID(sceneId,selfId,x210224_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量的第1位置0
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: 绪c c醥 th�",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210224_g_SignPost.x, x210224_g_SignPost.z, x210224_g_SignPost.tip )
end

--**********************************
--放弃
--**********************************
function x210224_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x210224_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210224_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210224_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x210224_g_MissionName)
		AddText(sceneId,x210224_g_MissionComplete)
		AddMoneyBonus( sceneId, x210224_g_MoneyBonus )
		--for i, item in g_ItemBonus do
		--	AddItemBonus( sceneId, item.id, item.num )
		--end
		--for i, item in g_RadioItemBonus do
		--	AddRadioItemBonus( sceneId, item.id, item.num )
		--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210224_g_ScriptId,x210224_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210224_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210224_g_MissionId )
	if bRet ~= 0 then
		return 1
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x210224_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,0)
    if num == 1 then
		return 1
	end
	return 0
end

--**********************************
--提交
--**********************************
function x210224_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210224_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	--BeginAddItem(sceneId)
		--	for i, item in g_ItemBonus do
		--		AddItem( sceneId,item.id, item.num )
		--	end
		--ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
		--if ret > 0 then
		--else
		--任务奖励没有加成功
		--	BeginEvent(sceneId)
		--		strText = "背包已满,无法完成任务"
		--		AddText(sceneId,strText);
		--	EndEvent(sceneId)
		--	DispatchMissionTips(sceneId,selfId)
		--end
		AddMoney(sceneId,selfId,x210224_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, 100)
		--扣除任务物品
		--for i, item in g_DemandItem do
		--	DelItem( sceneId, selfId, item.id, item.num )
		--end
		ret = DelMission( sceneId, selfId, x210224_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x210224_g_MissionId )
			--AddItemListToHuman(sceneId,selfId)
			Msg2Player(  sceneId, selfId,"#YNhi甿 v� ho鄋 th鄋h#W: 绪c c醥 th�",MSG2PLAYER_PARA )
			CallScriptFunction( 210225, "OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210224_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210224_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210224_OnItemChanged( sceneId, selfId, itemdataId )
end
