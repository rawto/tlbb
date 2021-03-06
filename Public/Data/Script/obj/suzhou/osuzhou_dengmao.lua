--苏州NPC
--邓茂
--普通

x001081_g_ScriptId	= 001081

--门派信息(门派名称，SceneID，PosX，PosY，门派ID)
x001081_g_mpInfo		= {}
x001081_g_mpInfo[0]	= { "Tinh T鷆", 16,  96, 152, MP_XINGSU }
x001081_g_mpInfo[1]	= { "Ti陁 Dao", 14,  67, 145, MP_XIAOYAO }
x001081_g_mpInfo[2]	= { "Thi猽 L鈓",  9,  96, 127, MP_SHAOLIN }
x001081_g_mpInfo[3]	= { "Thi阯 S絥", 17,  95, 120, MP_TIANSHAN }
x001081_g_mpInfo[4]	= { "Thi阯 Long", 13,  96, 120, MP_DALI }
x001081_g_mpInfo[5]	= { "Nga My", 15,  89, 139, MP_EMEI }
x001081_g_mpInfo[6]	= { "V� 衋ng", 12, 103, 140, MP_WUDANG }
x001081_g_mpInfo[7]	= { "Minh Gi醥", 11,  98, 167, MP_MINGJIAO }
x001081_g_mpInfo[8]	= { "C醝 Bang", 10,  91, 116, MP_GAIBANG }

x001081_g_Yinpiao = 40002000

x001081_g_Impact_NotTransportList = { 5929, 5944 } -- 禁止传送的Impact
x001081_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}", "#{XSHCD_20080418_099}" } -- 禁止传送的Impact提示信息

--**********************************
--事件交互入口
--**********************************
function x001081_OnDefaultEvent( sceneId, selfId,targetId )
	CallScriptFunction( (300053), "ChuanSong", sceneId, selfId, 400, 1 )
end

--**********************************
--事件列表选中一项
--**********************************
function x001081_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction( (300053), "ChuanSong", sceneId, selfId, GetNumText(),1)
end
--  add by zchw
function x001081_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 200, 211, 20 );
	return
end
--**********************************
--根据门派ID获取门派信息
--**********************************
function x001081_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x001081_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--对话窗口信息提示
--**********************************
function x001081_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
