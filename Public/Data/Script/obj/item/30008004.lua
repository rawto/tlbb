-- 300052 
-- 姓i T T鼀 衋n
-- 使用之后可以将所有的已分配点数变为潜能。


-- 脚本号
x300052_g_scriptId = 300052
x300052_g_ItemId = 30008004  -- 药水ID

--**********************************
-- 事件交互入口
--**********************************
function x300052_OnDefaultEvent( sceneId, selfId )

	-- 吃药洗点
	if GetNumText() == 1  then
		-- 检测这个人是不是有点可以洗。
		local bCan = LuaFnIsCanWashPiont(sceneId, selfId, 5)
		
		if bCan == 1  then
			local ret = DelItem(sceneId, selfId, x300052_g_ItemId, 1)
			if ret == 1  then
				LuaFnWashPoints(sceneId, selfId)
				BeginEvent(sceneId)
					AddText(sceneId, "#Y姓i T T鼀 衋n")
					AddText(sceneId, "C醕 h� mang #Yt c� thu礳 t韓h 疸 ph鈔 ph痠#W bi猲 th鄋h 餴琺 d� ti玬 n錸g.")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,-1)
			end

		else
			BeginEvent(sceneId)
				AddText(sceneId, "#Y姓i T T鼀 衋n")
				AddText(sceneId, "T c� thu礳 t韓h 皤u 疸 kh鬾g c騨 餴琺 ph鈔 ph痠 d�, kh鬾g th� ti猲 h鄋h ch飊h 餴琺.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)

		end
		return
	end
	
	-- 放弃了吃药
	if GetNumText() == 2  then
		-- 关闭界面
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
end

--**********************************
-- 
--**********************************
function x300052_IsSkillLikeScript( sceneId, selfId)
	return 0
end
