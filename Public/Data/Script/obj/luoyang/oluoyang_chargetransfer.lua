-- created by 左春伟

x400956_g_ScriptId = 400956; --脚本号
x400956_g_name	="Xa Truy玭 Ngh頰";

--传送目标
x400956_g_transfer_target =
{
	[1] = {x = 333, z = 249, scene_num = 1}, 		--苏州
	[2] = {x = 260, z = 85, scene_num = 2}, 		--大理
	[3] = {x = 294, z = 90, scene_num = 186}, 	--楼兰
	[4] = {x = 206, z = 266, scene_num = 34}, 	--南海
	[5] = {x = 186, z = 43, scene_num = 28},		--南诏
	[6] = {x = 158, z = 113, scene_num = 22}, 	--长白山
}

-- 收费金额
x400956_g_transfer_cost = 5000; -- 50银交子

--**********************************
--事件交互入口
--**********************************
function x400956_OnDefaultEvent( sceneId, selfId, targetId )
	x400956_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--事件列表
--**********************************
function x400956_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId);
		AddText( sceneId, "#{SFCS_80828_01}" );
		AddNumText(sceneId, x400956_g_ScriptId, "T� Ch鈛", 9, 1);
		AddNumText(sceneId, x400956_g_ScriptId, "姓i L�", 9, 2);
		AddNumText(sceneId, x400956_g_ScriptId, "L鈛 Lan", 9, 3);
		AddNumText(sceneId, x400956_g_ScriptId, "Nam H鋓", 9, 4);
		AddNumText(sceneId, x400956_g_ScriptId, "Nam Chi陁", 9, 5);
		AddNumText(sceneId, x400956_g_ScriptId, "Tr叨ng B誧h S絥", 9, 6);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--事件列表选中一项
--**********************************
function x400956_OnEventRequest( sceneId, selfId, targetId, eventId )
	--跑商相关
	if GetItemCount(sceneId, selfId, 40002000)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "Tr阯 ng叨i ng呓i c� ng鈔 phi猽, ta kh鬾g th� gi鷓 g� ng呓i 疬㧟." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	--队伍相关
	if GetTeamId(sceneId,selfId)>=0 and 
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		BeginEvent( sceneId )
			AddText( sceneId, "Th th� l瞚. 羞秐g s� xa x鬷, ta kh鬾g th� ti猵 nh c� t� 鸬i, c鋗 phi玭 c醕 h� r秈 t� 鸬i tr呔c 疸." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	--漕运相关
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent(sceneId)
			AddText(sceneId, "Ng呓i 餫ng trong tr課g th醝 t鄌 v, ta kh鬾g th� gi鷓 g� ng呓i 疬㧟.")
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	--
	local id = GetNumText();
	if id >=1 and id <= 6 then
		BeginEvent(sceneId)
			--"本次传送收取50银交子，你要传送吗？"
			AddText(sceneId, "#{FFCS_081210_1}")
			if id == 1 then	
				AddNumText(sceneId, x400956_g_ScriptId, "X醕 鸶nh", 0, 11);
			elseif id == 2 then
				AddNumText(sceneId, x400956_g_ScriptId, "X醕 鸶nh", 0, 21);
			elseif id == 3 then
				AddNumText(sceneId, x400956_g_ScriptId, "X醕 鸶nh", 0, 31);
			elseif id == 4 then
				AddNumText(sceneId, x400956_g_ScriptId, "X醕 鸶nh", 0, 41);
			elseif id == 5 then
				AddNumText(sceneId, x400956_g_ScriptId, "X醕 鸶nh", 0, 51);
			elseif id == 6 then
				AddNumText(sceneId, x400956_g_ScriptId, "X醕 鸶nh", 0, 61);
			end
			AddNumText(sceneId, x400956_g_ScriptId, "H鼀 b�", 0, 100);
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
	elseif id == 100 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )		
	else
		local index = floor(id/10);
		--楼兰75级限制
		if index == 3 then
			if GetLevel(sceneId, selfId) < 75 then
				BeginEvent(sceneId)
					AddText(sceneId, "C 鸬 c黙 ng呓i kh鬾g 瘘 75, kh鬾g th� truy玭 t痭g.")
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
				return
			end
			--同骑带小号限制
			if LuaFnGetDRideFlag(sceneId, selfId) == 1 then
				local objId = LuaFnGetDRideTargetID(sceneId, selfId);
				if objId ~= -1 and GetLevel(sceneId, objId) < 75 then
					BeginEvent(sceneId)
						AddText(sceneId, "#{SRCS_090203_1}")
					EndEvent()
					DispatchEventList(sceneId, selfId, targetId)
					return					
				end
			end
		end
		--[tx44121]bug这里没有设置最低级别，导致低级别可通过双骑乘进高级别场景
		local minLevel = 10
		if index == 3 then
			minLevel = 75
		end
		if LuaFnGetDRideFlag(sceneId, selfId) == 1 then
			local objId = LuaFnGetDRideTargetID(sceneId, selfId);
			if objId ~= -1 and GetLevel(sceneId, objId) < minLevel then
				local Tip = format("#{CQTS_90227_1}%d#{CQTS_90227_2}", minLevel)
				x400956_NotifyFailTips( sceneId, selfId, targetId, Tip )
				return					
			end
		end	
		--[/tx44121]	
			
		local pos_x = x400956_g_transfer_target[index]["x"];
		local pos_z = x400956_g_transfer_target[index]["z"];
		local scene_num = x400956_g_transfer_target[index]["scene_num"];
			
		local nMoneyJZ = GetMoneyJZ (sceneId, selfId)
		local nMoney = GetMoney (sceneId, selfId)

		--钱够吗？
		if (nMoneyJZ + nMoney) >= x400956_g_transfer_cost then 
				
			-- 收费
			-- 使用带优先级的金钱消耗函数
			if LuaFnCostMoneyWithPriority (sceneId, selfId, x400956_g_transfer_cost) == -1 then
				BeginEvent(sceneId)
					AddText(sceneId, "Thu ph� th b読!");
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				return
			else
				CallScriptFunction((400900), "TransferFunc",sceneId, selfId, scene_num, pos_x, pos_z, minLevel); 
			end

		-- 钱不够
		else
			BeginEvent(sceneId)
				AddText(sceneId, "S� ti玭 kh鬾g 瘘!");
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
			return

		end
	end	
end
--**********************************
-- 屏幕中间信息提示
--**********************************
function x400956_NotifyFailTips( sceneId, selfId, targetId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
