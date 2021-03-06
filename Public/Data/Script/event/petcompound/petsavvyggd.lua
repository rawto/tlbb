-- 宠物悟性提升

-- 脚本号
x800106_g_ScriptId = 800106

-- NPC 名字
x800106_g_Name = "V鈔 Phi Phi"

	
--**********************************
-- 任务入口函数
--**********************************
function x800106_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本

	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 19820425 )
end

--**********************************
-- 列举事件
--**********************************
function x800106_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x800106_g_ScriptId, "S� d鴑g C錸 c痶 餫n th錸g c ng� t韓h" ,6,-1)
end


--**********************************
-- 宠物悟性提升
--**********************************
function x800106_PetSavvy( sceneId, selfId, mainPetGuidH, mainPetGuidL )
	
	local	SelfMoney = GetMoney(sceneId, selfId)
	
	local gengu = LuaFnGetPetGenGuByGUID(sceneId, selfId, mainPetGuidH, mainPetGuidL)
	local savvy = GetPetSavvy( sceneId, selfId, mainPetGuidH, mainPetGuidL )
	if savvy == 10 then
		x800106_NotifyTip(sceneId, selfId, "Ng� t韓h 疸 鹫t cao nh, kh鬾g th� th錸g c!" );
		return 0;
	end
	local cost = GetCostOfGenGuBySavvy(sceneId, selfId, savvy);
	local succRate = GetSuccrateOfGenGuBySavvy(sceneId, selfId, savvy);
	local rand = random(1000)
	
	--检查 跟骨 丹
	local nSavvyNeed = savvy+1;	
	local nItemIdGenGuDan = 0;
	local msgTemp;
	if nSavvyNeed >= 1 and nSavvyNeed <= 3 then
		msgTemp = "S� C";
		nItemIdGenGuDan = 30504038;
	elseif nSavvyNeed >= 4 and nSavvyNeed <= 6 then
		msgTemp = "Trung C"
		nItemIdGenGuDan = 30502001;
	elseif nSavvyNeed >= 7 and nSavvyNeed <= 10 then
		msgTemp = "Cao C"
		nItemIdGenGuDan = 30502002;
	end
	
	local nYaoDingCount = GetItemCount(sceneId, selfId, nItemIdGenGuDan);
	if nYaoDingCount <= 0 then
		if nSavvyNeed >= 1 and nSavvyNeed <= 3 then
			--没有绑定的低级根骨丹
			nItemIdGenGuDan = 30502000
			local nYaoDingCount = GetItemCount(sceneId, selfId, nItemIdGenGuDan);
			if nYaoDingCount<= 0 then
				local msg = format("Tr鈔 th� mu痭 th錸g c ng� t韓h 皙n %d c c� C錸 C痶 衋n %s", savvy+1, msgTemp )
				x800106_NotifyTip(sceneId, selfId, msg );
				return 0;
			end
		else
			local msg = format("Tr鈔 th� mu痭 th錸g c ng� t韓h 皙n %d c c� C錸 C痶 衋n %s", savvy+1, msgTemp )
			x800106_NotifyTip(sceneId, selfId, msg );
			return 0;
		end
	end
	local	SelfMoney = GetMoney(sceneId, selfId)  +  GetMoneyJZ(sceneId, selfId);   --交子普及 Vega
	if SelfMoney < cost then 
		return 0;
	end
	
	--删除跟骨 丹
	local bRet = DelItem(sceneId, selfId, nItemIdGenGuDan, 1)
	
	if bRet<=0 then
		local msg = format("H鼀 鹫o c� th b読!");
		x800106_NotifyTip(sceneId, selfId, msg );		
		return 0;
	end
	
	local costRet = LuaFnCostMoneyWithPriority(sceneId,selfId,cost)
	if costRet < 0 then
		return 0;
	end
		
	if rand > succRate then
		
		local nSavvyDown = GetLeveldownOfCompoundBySavvy( sceneId,selfId, savvy );
		if nSavvyDown > savvy then
			nSavvyDown = savvy;	
		end
		
		SetPetSavvy( sceneId, selfId, mainPetGuidH, mainPetGuidL, savvy - nSavvyDown );
		
		Audit_PetImproveWuxing( sceneId, selfId, mainPetGuidH, mainPetGuidL, 0, savvy - nSavvyDown );
		
		local msg = format("H䅟 th鄋h th b読, tr呔c m ng� t韓h c黙 Tr鈔 th� l� %d", savvy - nSavvyDown );
		x800106_NotifyTip(sceneId, selfId, msg );
		return 0;
	end
	
	SetPetSavvy( sceneId, selfId, mainPetGuidH, mainPetGuidL, nSavvyNeed )
	
	Audit_PetImproveWuxing( sceneId, selfId, mainPetGuidH, mainPetGuidL, 1, nSavvyNeed );
	
	local szPlayerName, szPetTransString;
	
	szPetTransString = GetPetTransString(  sceneId, selfId, mainPetGuidH, mainPetGuidL );
	szPlayerName = GetName( sceneId, selfId );
	
	local msg = format("H䅟 th鄋h th鄋h c鬾g, ng� t韓h tr鈔 th� c黙 c醕 h� gia t錸g 1 餴琺");
	x800106_NotifyTip(sceneId, selfId, msg );

	--公告精简，悟性提升到7和以上才公告
	if nSavvyNeed >= 11 then
		
		local szMsg;
		szMsg = format("#{_INFOUSR%s}#{ZW_1}#{_INFOMSG%s}#{ZW_2}%d#{ZW_3}",szPlayerName, szPetTransString, nSavvyNeed );
		
		AddGlobalCountNews( sceneId, szMsg );
	
	end
	
	--成功的光效
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
		
end


--**********************************
--醒目提示
--**********************************
function x800106_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
