--找人任务
--赵天师寻找V鈔 Phi陁 Phi陁
--MisDescBegin
--脚本号
x210214_g_ScriptId = 210214

--接受任务NPC属性
x210214_g_Position_X=400
x210214_g_Position_Z=218
x210214_g_SceneID=2
x210214_g_AccomplishNPC_Name="V鈔 Phi陁 Phi陁"

--任务号
x210214_g_MissionId = 454

--上一个任务的ID
--g_MissionIdPre = 

--目标NPC
x210214_g_Name	="V鈔 Phi陁 Phi陁"

--任务归类
x210214_g_MissionKind = 13

--任务等级
x210214_g_MissionLevel = 5

--是否是精英任务
x210214_g_IfMissionElite = 0

--任务名
x210214_g_MissionName="Con tr鈔 th� th� nh"
x210214_g_MissionInfo="#{event_dali_0020}"
x210214_g_MissionTarget="歇n #YTr鵱g 衖瑄 ph叨ng#W � #G疬秐g l緉 ph韆 恤ng c黙 th鄋h 姓i L�#W t靘 ph叨ng ch� #RV鈔 Phi陁 Phi陁 #W#{_INFOAIM400,218,2,V鈔 Phi陁 Phi陁}.#r#YNh nh�: #G?n chu祎 ph鋓 v鄌 t鱝 鸬 NPC c� th� t� 鸬ng d竎h chuy琻 皙n ch� NPC 痼!"
x210214_g_MissionComplete="Ta kh鬾g t鵼 ti畁 v緄 ng叨i b靚h th叨ng k猼 giao bg h鎢, nh遪g Ng呓i l� b課 c黙 T� 姓i Thi畁 Nh鈔. V ta s� n骾 cho ng呓i bi猼 m祎 v鄆 餴玼 hay."
x210214_g_MoneyBonus=72
x210214_g_SignPost = {x = 400, z = 218, tip = "V鈔 Phi陁 Phi陁"}

x210214_g_Custom	= { {id="秀 t靘 疬㧟 V鈔 Phi陁 Phi陁",num=1} }
x210214_g_IsMissionOkFail = 1		--变量的第0位

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210214_OnDefaultEvent( sceneId, selfId, targetId )
    --如果玩家完成过这个任务
    if (IsMissionHaveDone(sceneId,selfId,x210214_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210214_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210214_g_Name then
			x210214_OnContinue( sceneId, selfId, targetId )
		end
    --满足任务接收条件
    elseif x210214_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210214_g_Name then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x210214_g_MissionName)
				AddText(sceneId,x210214_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210214_g_MissionTarget)
				AddMoneyBonus( sceneId, x210214_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210214_g_ScriptId,x210214_g_MissionId)
		end
    end
end

--**********************************
--列举事件
--**********************************
function x210214_OnEnumerate( sceneId, selfId, targetId )
    --如果玩家还未完成上一个任务
    --if 	IsMissionHaveDone(sceneId,selfId,g_MissionIdPre) <= 0 then
    --	return
    --end
    --如果玩家完成过这个任务
    if IsMissionHaveDone(sceneId,selfId,x210214_g_MissionId) > 0 then
    	return 
    --如果已接此任务
    elseif IsHaveMission(sceneId,selfId,x210214_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210214_g_Name then
			AddNumText(sceneId, x210214_g_ScriptId,x210214_g_MissionName,2,-1);
		end
    --满足任务接收条件
    elseif x210214_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210214_g_Name then
			AddNumText(sceneId,x210214_g_ScriptId,x210214_g_MissionName,1,-1);
		end
    end
end

--**********************************
--检测接受条件
--**********************************
function x210214_CheckAccept( sceneId, selfId )
	--需要5级才能接
	if GetLevel( sceneId, selfId ) >= 5 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x210214_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210214_g_MissionId, x210214_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: Con tr鈔 th� th� nh",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210214_g_SignPost.x, x210214_g_SignPost.z, x210214_g_SignPost.tip )

	-- 设置任务完成标志
	local misIndex = GetMissionIndexByID(sceneId,selfId,x210214_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--放弃
--**********************************
function x210214_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x210214_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210214_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210214_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x210214_g_MissionName)
		AddText(sceneId,x210214_g_MissionComplete)
		AddMoneyBonus( sceneId, x210214_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210214_g_ScriptId,x210214_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210214_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210214_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x210214_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210214_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId,x210214_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,400)
		DelMission( sceneId,selfId,  x210214_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x210214_g_MissionId )
		Msg2Player(  sceneId, selfId,"#YNhi甿 v� ho鄋 th鄋h#W: Con tr鈔 th� th� nh",MSG2PLAYER_PARA )
		CallScriptFunction( 210215, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210214_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210214_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210214_OnItemChanged( sceneId, selfId, itemdataId )
end
