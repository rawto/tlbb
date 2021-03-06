--事件
--传送到珍兽岛

--脚本号
x400918_g_ScriptId = 400918

--任务文本描述
x400918_g_MissionName="衖 Huy玭 V� 袖o"
x400918_g_MissionInfo="歇n Huy玭 V� 袖o"  --任务描述
x400918_g_MissionTarget="歇n Huy玭 V� 袖o"		--任务目标
x400918_g_ContinueInfo="歇n Huy玭 V� 袖o"		--未完成任务的npc对话
x400918_g_MissionComplete="歇n Huy玭 V� 袖o"					--完成任务npc说话的话

--**********************************
--入口函数
--**********************************
function x400918_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本

	-- 检测玩家身上是不是有“银票”这个东西，有就不能使用这里的功能
	if GetItemCount(sceneId, selfId, 40002000) >= 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "  Ng呓i tr阯 ng叨i c� Ng鈔 Phi猽, ta kh鬾g th� gi鷓 g� 疬㧟." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	--漕运相关
	if GetTeamId(sceneId,selfId)>=0 and 
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		num=LuaFnGetFollowedMembersCount( sceneId, selfId)
		local mems = {}
		for	i=0,num-1 do
			mems[i] = GetFollowedMember(sceneId, selfId, i)
			if mems[i] == -1 then
				return
			end
			if IsHaveMission(sceneId,mems[i],4021) > 0 then
				BeginEvent( sceneId )
					AddText( sceneId, "  Trong 鸬i ng� c� th鄋h vi阯 餫ng trong tr課g th醝 T鄌 V, kh鬾g th� d竎h chuy琻." )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				return
			end
		end
	end

	if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent( sceneId )
			AddText( sceneId, "  Ng呓i 餫ng trong tr課g th醝 T鄌 V, kh鬾g th� d竎h chuy琻." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 39, 109, 25)

end

--**********************************
--列举事件
--**********************************
function x400918_OnEnumerate( sceneId, selfId, targetId )
	--等 tr� l阯 m緄 c� th� 皙n n絠 n鄖!达到10 tr� l阯 m緄 c� th� 皙n n絠 n鄖!就显示传送选项
	if GetLevel( sceneId, selfId ) >= 10 then
		AddNumText(sceneId,x400918_g_ScriptId,x400918_g_MissionName, 9, -1)
	else
		return
	end
end
