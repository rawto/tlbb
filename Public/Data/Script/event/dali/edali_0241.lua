--门派指引

--MisDescBegin
--脚本号
x210241_g_ScriptId	= 210241
--MisDescEnd

--门派信息：门派名称，特色描述，NumText，接引人坐标，接引人名称
x210241_g_MPInfo		=
{
	{ nam="Thi猽 L鈓", des="#{event_dali_mp_sl}", key=1020, x=276, z=229, npc="Tu� D竎h"			},
	{ nam="Minh Gi醥",   des="#{event_dali_mp_mj}", key=1021, x=288, z=238, npc="Th誧h B鋙"			},
	{ nam="C醝 Bang",   des="#{event_dali_mp_gb}", key=1022, x=276, z=232, npc="Gi鋘 Ninh"			},
	{ nam="V� 衋ng", des="#{event_dali_mp_wd}", key=1023, x=276, z=225, npc="Tr呓ng Ho誧h"		},
	{ nam="Nga My", des="#{event_dali_mp_em}", key=1024, x=276, z=235, npc="L� Tam N呓ng"		},
	{ nam="Tinh T鷆", des="#{event_dali_mp_xx}", key=1025, x=288, z=232, npc="H鋓 Phong T�"		},
	{ nam="Thi阯 Long", des="#{event_dali_mp_tl}", key=1026, x=288, z=228, npc="Ph� Tham"			},
	{ nam="Thi阯 S絥", des="#{event_dali_mp_ts}", key=1027, x=288, z=235, npc="Tr靚h Thanh S呓ng"		},
	{ nam="Ti陁 Dao", des="#{event_dali_mp_xy}", key=1028, x=288, z=225, npc="朽m T� V�"	},
}

--**********************************
--任务入口函数
--**********************************
function x210241_OnDefaultEvent( sceneId, selfId, targetId )
  
	local	key	= GetNumText()
	local	MP

	if key == 1010 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{event_dali_mp_dlg}" )
			for _, MP in x210241_g_MPInfo do
				AddNumText( sceneId, x210241_g_ScriptId, MP.nam, 11, MP.key )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	else
		for _, MP in x210241_g_MPInfo do
			if key == MP.key then
				x210241_MsgBox( sceneId, selfId, targetId, MP.des )
				CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, MP.x, MP.z, MP.npc )
				break
			end
		end
	end

end

--**********************************
--列举事件
--**********************************
function x210241_OnEnumerate( sceneId, selfId, targetId )

	if GetLevel( sceneId, selfId ) >= 10 and GetMenPai( sceneId, selfId ) == MP_WUMENPAI then
		AddNumText( sceneId, x210241_g_ScriptId, "T靘 g ng叨i ti猵 d鏽 #GC豼 鹫i m鬾 ph醝", 11, 1010 )
	end

end

--**********************************
--检测接受条件
--**********************************
function x210241_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x210241_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x210241_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x210241_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x210241_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x210241_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210241_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x210241_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210241_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--Message Box
--**********************************
function x210241_MsgBox( sceneId, selfId, targetId, Msg )

	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end
