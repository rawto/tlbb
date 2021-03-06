
--门派引导任务

--MisDescBegin
--脚本号
x210238_g_ScriptId = 210238

--接受任务NPC属性
x210238_g_Position_X=160.0895
x210238_g_Position_Z=156.9309
x210238_g_SceneID=2
x210238_g_AccomplishNPC_Name="Tri畊 Thi阯 S�"

--任务号
x210238_g_MissionId = 718

--目标NPC
x210238_g_Name	="Tri畊 Thi阯 S�"

--任务归类
x210238_g_MissionKind = 13

--任务等级
x210238_g_MissionLevel = 1

--是否是精英任务
x210238_g_IfMissionElite = 0
x210238_g_IsMissionOkFail = 0		--变量的第0位
--任务名
x210238_g_MissionName="10 n錷"
--任务描述
x210238_g_MissionInfo  = "M l鉶 gi� T� 姓i Thi畁 Nh鈔 ch鷑g ta v譨 g c醕 h�, Li玭 c鋗 th c醕 h� 瘊ng l� 1 v� h鱟 k� t鄆 ng鄋 n錷 m緄 g. N猽 疬㧟 danh s� truy玭 th�, ti玭 鸢 t kh鬾g th� l叨ng."
x210238_g_MissionInfo1 = "Nh遪g gi� 疴y vi甤 quan tr鱪g nh c黙 c醕 h�, l� ph鋓 n v鎛g c錸 c� v� h鱟. Sau khi n v鎛g c錸 c�, c� th� t靘 m祎 v� danh s�, h鱟 v� c鬾g uy阯 th鈓 h絥. Sau n鄖 tr� th鄋h m祎 鹫i anh h鵱g, 鹫i hi畃 s�!"
x210238_g_MissionInfo2 = "Nh� th� n鄖, 瘙i c醕 h� 鹫t t緄 c 10, h銀 t緄 t靘 Tri畊 Thi阯 S� ta. M l鉶 gi� ch鷑g ta s� chu b� m祎 ph qu� 穑c bi畉 cho c醕 h�."
--任务目标
x210238_g_MissionTarget="#{MIS_dali_ZTS_002}"		
--未完成任务的npc对话
x210238_g_ContinueInfo="C醕 h� 疸 鹫t t緄 c 10 ch遖?"
--提交时npc的话
x210238_g_MissionComplete="T痶 qu�, c醕 h� c� th� gia nh m鬾 ph醝 r癷!"		


x210238_g_exp=0
x210238_g_ItemBonus={}

x210238_g_Custom	= { {id="秀 鹫t 鹌ng c ",num=10} }--变量的第1位

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210238_OnDefaultEvent( sceneId, selfId, targetId )

  --如果玩家完成过这个任务
  if (IsMissionHaveDone(sceneId,selfId,x210238_g_MissionId) > 0 ) then
    return

	elseif( IsHaveMission(sceneId,selfId,x210238_g_MissionId) > 0)  then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId, x210238_g_MissionName)
			AddText(sceneId, x210238_g_ContinueInfo)
		EndEvent( )
		local bDone = x210238_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210238_g_ScriptId,x210238_g_MissionId,bDone)
				
	--满足任务接收条件
  elseif x210238_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x210238_g_MissionName)
			AddText(sceneId,x210238_g_MissionInfo)
			AddText(sceneId,x210238_g_MissionInfo1)			
			AddText(sceneId,x210238_g_MissionInfo2)
			
			--AddText(sceneId,"#{M_MUBIAO}")
			--AddText(sceneId,x210238_g_MissionTarget)
			--AddText(sceneId,"#{M_SHOUHUO}")
			--AddMoneyBonus( sceneId, x210238_g_MoneyBonus )
			--for i, item in x210238_g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210238_g_ScriptId,x210238_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x210238_OnEnumerate( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x210238_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x210238_g_MissionId) > 0 then
	    
	    local bDone = x210238_CheckSubmit( sceneId, selfId ) 
	    if( 1 == bDone ) then
	        AddNumText(sceneId, x210238_g_ScriptId, x210238_g_MissionName, 2, -1);
	    else
	        AddNumText(sceneId, x210238_g_ScriptId, x210238_g_MissionName, 1, -1);
	    end	
	    			
	--满足任务接收条件
	elseif x210238_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x210238_g_ScriptId, x210238_g_MissionName, 1, -1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x210238_CheckAccept( sceneId, selfId )

	--要求完成的前续任务
	--if IsMissionHaveDone(sceneId,selfId,645) <= 0 then
	--	return 0

	--需要1级才能接
	if GetLevel( sceneId, selfId ) >= x210238_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x210238_OnAccept( sceneId, selfId )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x210238_g_MissionId) > 0 then
		return 
	end
		
	-- 加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x210238_g_MissionId, x210238_g_ScriptId, 1, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v�#W c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end
	
	--设置任务变量宝物的场景编号和坐标位置
	--local misIndex = GetMissionIndexByID(sceneId, selfId, x210238_g_MissionId)--得到任务在20个任务中的序列号
	--SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--根据序列号把任务变量的第一位置0	第一位是完成/失败情况

	--Msg2Player(  sceneId, selfId,"#Y接受任务" .. x210238_g_MissionName, MSG2PLAYER_PARA )
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: #G" .. x210238_g_MissionName, MSG2PLAYER_PARA )
	local misIndex = GetMissionIndexByID(sceneId, selfId, x210238_g_MissionId)--得到任务在20个任务中的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,1,1)
	
end

--**********************************
--放弃
--**********************************
function x210238_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x210238_g_MissionId )
end

--**********************************
--继续
--**********************************
function x210238_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
	BeginEvent(sceneId)
		AddText(sceneId,x210238_g_MissionName)
		AddText(sceneId,x210238_g_MissionComplete)

		for i, item in x210238_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x210238_g_ScriptId,x210238_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210238_CheckSubmit( sceneId, selfId )

    local Level = GetLevel( sceneId, selfId )
    
    if( Level < 10 ) then
        return 0
    end

	return 1

end

--**********************************
--提交
--**********************************
function x210238_OnSubmit( sceneId, selfId, targetId, selectRadioId )
		-- 安全性检测
		-- 1、检测玩家是不是有这个任务
		if IsHaveMission(sceneId,selfId,x210238_g_MissionId) <= 0 then
			return
		end
		
		-- 2、完成任务的情况检测
		if x210238_CheckSubmit(sceneId, selfId) <= 0    then
			return
		end
		
		-- 金钱和经验
		

		
		if( x210238_g_exp > 0 ) then
		    LuaFnAddExp( sceneId, selfId, x210238_g_exp)
		end
								
		DelMission( sceneId,selfId, x210238_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId, x210238_g_MissionId )
		
		
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210238_OnKillObject( sceneId, selfId, objdataId ,objId )

end

--**********************************
--进入区域事件
--**********************************
function x210238_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210238_OnItemChanged( sceneId, selfId, itemdataId )
end







