--苏州NPC
--朱锋
--普通

x001069_g_ScriptId	= 001069

--操作集
x001069_g_Key				=
{
	["inf"]	= 1000,	--制造介绍
	["ln"]	= 1,		--我要学习精炼配方 - 精炼 - 铸造
	["zh"]	= 2,		--我要学习精制配方 - 精制 - 缝纫
	["gn"]	= 3,		--我要学习精工配方 - 精工 - 工艺
	["sh"]	= 4,		--精工配方商店
}

--商店编号
x001069_g_shoptableindex=196

--**********************************
--事件交互入口
--**********************************
function x001069_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, "10 n錷 瓞 r鑞 ra 1 c鈟 ki猰, 鸢 c黙 Chu Phong ta l鄊 ra l� t痶 nh!" )
		if GetLevel( sceneId, selfId ) >= 10 then
			AddNumText( sceneId, x001069_g_ScriptId, "Ta mu痭 h鱟 tinh luy畁 (R鑞) ph痠 ph呓ng", 2, x001069_g_Key["ln"] )
			AddNumText( sceneId, x001069_g_ScriptId, "Ta mu痭 h鱟 tinh ch� (May M) ph痠 ph呓ng", 2, x001069_g_Key["zh"] )
			AddNumText( sceneId, x001069_g_ScriptId, "Ta mu痭 h鱟 tinh c鬾g (C鬾g Ngh�) ph痠 ph呓ng", 2, x001069_g_Key["gn"] )
			AddNumText( sceneId, x001069_g_ScriptId, "Mua tinh c鬾g ph痠 ph呓ng", 7, x001069_g_Key["sh"])
		end
		AddNumText( sceneId, x001069_g_ScriptId, "Gi緄 thi畊 ch� t誳", 11, x001069_g_Key["inf"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--事件列表选中一项
--**********************************
function x001069_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	key	= GetNumText()

	if key == x001069_g_Key["inf"] then
		x001069_MsgBox( sceneId, selfId, targetId, "#{INTRO_ZHIZAO}" )
	
	elseif key == x001069_g_Key["ln"] then
		if QueryHumanAbilityLevel( sceneId, selfId, 46 ) ~= 1 then
			SetHumanAbilityLevel( sceneId, selfId, 46, 1 )
		end
		for i = 644, 703 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
		x001069_MsgBox( sceneId, selfId, targetId, "Ch鷆 m譶g c醕 h� 疸 h鱟 h猼 t c� ph痠 ph呓ng Tinh luy畁" )

	elseif key == x001069_g_Key["zh"] then
		if QueryHumanAbilityLevel( sceneId, selfId, 47 ) ~= 1 then
			SetHumanAbilityLevel( sceneId, selfId, 47, 1 )
		end
		for i = 704, 773 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
		for i = 804, 883 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
		x001069_MsgBox( sceneId, selfId, targetId, "Ch鷆 m譶g c醕 h� 疸 h鱟 h猼 t c� ph痠 ph呓ng Tinh ch�" )
	
	elseif key == x001069_g_Key["gn"] then
		if QueryHumanAbilityLevel( sceneId, selfId, 48 ) ~= 1 then
			SetHumanAbilityLevel( sceneId, selfId, 48, 1 )
		end
		for i = 774, 803 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
		
		for i = 1064, 1075 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
 		
		x001069_MsgBox( sceneId, selfId, targetId, "Ch鷆 m譶g c醕 h� 疸 h鱟 h猼 t c� ph痠 ph呓ng Tinh c鬾g" )
	elseif key == x001069_g_Key["sh"] then
		DispatchShopItem( sceneId, selfId, targetId, x001069_g_shoptableindex )
	end

end

--**********************************
--Message Box
--**********************************
function x001069_MsgBox( sceneId, selfId, targetId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end
