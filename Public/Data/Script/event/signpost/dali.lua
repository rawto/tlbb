-- 大理问路脚本
x500040_g_scriptId = 500040

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500040_g_Signpost = {
		{ type=1, name="L鄊 sao gia nh m鬾 ph醝?", eventId=500049, x=0, y=0, tip=" ", desc=" " },		--注意,这m祎 条不喧ng调用另m祎 c醝脚本to� 鸬 方式,而喧ngT読 本文件内直接判断.不建议使用此种方式
		{ type=1, name="Ng叨i 疬a tin c豼 鹫i ph醝", eventId=500041, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="Mua c醕 lo読 v ph", eventId=500042, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="D竎h tr誱", eventId=500043, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="Ti玭 trang, 羞絥g ph�", eventId=500044, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="Ta mu痭 r鑞 luy畁 b鋘 l頽h", eventId=500045, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="H鱟 k� n錸g 鸲i s痭g", eventId=500046, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="Nhi甿 v� v� ph� b鋘", eventId=500047, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="L鬷 疣i", eventId=500048, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="B醝 s�", eventId=500049, x=0, y=0, tip=" ", desc=" " },
}

--{ type=2, name="东升客栈", x=100.7, y=124.2, tip="大理东升客栈", desc="大理最大的客栈之一，三教九流聚集之地。" },
--{ type=2, name="毕升", x=180.0, y=120.0, tip="毕升。娶妻拜师休妻叛师的好去处！", desc="毕升～，实现你毕生的梦想～～～" },


--**********************************
--列举事件
--**********************************
function x500040_OnEnumerate( sceneId, selfId, targetId )
--	AddNumText(sceneId, x500040_g_scriptId, "账号安全", -1, 1009)   --帐号  to  账号
	for i, signpost in x500040_g_Signpost do
		AddNumText(sceneId, x500040_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500040_OnDefaultEvent( sceneId, selfId, targetId )

--	if GetNumText() == 1009 then
--		OpenWorldReference(sceneId, selfId,"AccountSafe")
--		return
--	end
	signpost = x500040_g_Signpost[GetNumText()]
	
	if GetNumText()==1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. ": ")
			AddText(sceneId, "Xin t緄 m鱥 d竎h tr誱 c黙 c醕 th鄋h th� ( Tab c� th� m� b鋘 鸢 ra tra t靘 k� hi畊 ch� #GD竎h#W) chuy琻 t緄 m鬾 ph醝 m� c醕 h� mu痭 b醝 s�. Sau khi t緄 m鬾 ph醝 h銀  v鄌 #GNg叨i d鏽 疬秐g cho m鬾 ph醝 #W l� c� th� h鰅 疬㧟 v� tr� b醝 s�. Ho  ph韒 TAB m� b鋘 鸢 t靘 k� hi畊 ch� #GS� #W.")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 282, 270, "Th鬷 Ph鵱g C豼" )
		return
	end
	
	if signpost.type == 1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. ": ")
			CallScriptFunction( signpost.eventId, "OnEnumerate", sceneId, selfId, targetId )
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	elseif signpost.type == 2 then
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, signpost.x, signpost.y, signpost.tip )

		BeginEvent(sceneId)
			AddText(sceneId, signpost.desc)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	end

end
