-- 领奖NPC

x892019_g_scriptId = 892019

x892019_g_MonsterId = 13558    ---npc怪物ID
x892019_g_CreateId = 13510     ----创建的怪物ID
x892019_g_posX = 41            ----创建怪物坐标x
x892019_g_posY = 23            ----创建怪物坐标y
x892019_g_AIScript = 258       ----创建怪物技能对应文件ID
x892019_g_Title = "Thi阯 H鵱g Tinh"       ----创建怪物称号
x892019_monster_groupId = 1


--**********************************
--事件交互入口
--**********************************
function x892019_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText( sceneId, "L鬷 疣i sinh t� kh鬾g ph鋓 l� n絠 mu痭 皙n th� 皙n mu痭 餴 th� 餴 疴u nha..." )
		AddNumText( sceneId, x892019_g_scriptId, "#c00ff00Quy猼 chi猲 L鈓 Sung", 6, 200)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--事件列表选中一项
--**********************************
function x892019_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 210 then
		BeginEvent( sceneId )
   		local n = GetMonsterCount(sceneId)
		if n>170 then
   		strText = "S� l唼ng qu醝 v hi畁 t読: "..n..". D呔i 170 con c� th� 皙n 疴y l鄊 m緄 l読 t� 馥u."
  		AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
   		else 
		BeginEvent( sceneId )
		LuaFnCreateMonster(531, 39339, 30, 30, 17, 0, 402030)
                AddText( sceneId, "L鄊 m緄 th鄋h c鬾g, s� l唼ng qu醝 v hi畁 t読 l� : "..n.."." )
           	AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		end
  
        elseif GetNumText() == 200 then
	--是不是队长....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		BeginEvent(sceneId)
			AddText( sceneId, "#{PMF_20080521_07}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		local MosDataID = GetMonsterDataID( sceneId, nObjId )
		if MosDataID == x892019_g_CreateId then
               	        BeginEvent( sceneId ) 
	        	           AddText( sceneId, "#G秀 b 馥u chi猲 黏u, kh鬾g th� l l読 thao t醕 n鄖." )
              	           EndEvent( sceneId )
               	        DispatchEventList( sceneId, selfId, targetId )
			return 
		end
	end
	CallScriptFunction( x892019_g_scriptId, "TipAllHuman", sceneId, "B 馥u chi猲 黏u." )
	local nMonsterNum = GetMonsterCount(sceneId)
	local Monsters = x892019_g_MonsterId
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if Monsters == GetMonsterDataID( sceneId, MonsterId ) then
			--LuaFnDeleteMonster( sceneId, MonsterId )
			LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 152, 0)
			SetCharacterDieTime( sceneId, MonsterId, 1000 )
		end
	end

	local posX = x892019_g_posX
	local posY = x892019_g_posY
	local AIScript = x892019_g_AIScript
	local Title = x892019_g_Title

	local MstId = LuaFnCreateMonster(sceneId, x892019_g_CreateId, posX, posY, 27, AIScript, 501000);
	SetMonsterFightWithNpcFlag( sceneId, MstId, 0 )
	SetUnitReputationID(sceneId, selfId, MstId, 29)
	SetMonsterGroupID(sceneId, MstId, x892019_monster_groupId)
	SetNPCAIType(sceneId, MstId, 1)
	if Title ~= "" then
		SetCharacterTitle(sceneId, MstId, Title)
	end
	LuaFnSendSpecificImpactToUnit(sceneId, MstId, MstId, MstId, 152, 0)

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

	 end
end

--**********************************
--提示所有副本内玩家....
--**********************************
function x892019_TipAllHuman( sceneId, Str )

	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, Str)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId, PlayerId)
		end
	end

end