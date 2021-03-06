--副本任务
--木人

--************************************************************************
--MisDescBegin

--脚本号
x892009_g_ScriptId = 892009

--复活次数
x892009_g_ReLifeTimes = 10
--副本名称
x892009_g_CopySceneName="L鬷 朽i Sinh T�"

--MisDescEnd
--************************************************************************

--角色Mission变量说明
x892009_g_Param_huan		=0	--0号：已经完成的环数，在接收任务时候赋值
x892009_g_Param_ok			=1	--1号：当前任务是否完成(0未完成；1完成)
x892009_g_Param_sceneid		=2	--2号：当前副本任务的场景号
x892009_g_Param_teamid		=3	--3号：接副本任务时候的队伍号
x892009_g_Param_killcount	=4	--4号：杀死任务怪的数量
x892009_g_Param_time		=5	--5号：完成副本所用时间(单位：秒)
--6号：未用
--7号：未用

x892009_g_CopySceneType=FUBEN_GODFIRE	--副本类型，定义在ScriptGlobal.lua里面
x892009_g_LimitMembers=1			--可以进副本的最小队伍人数
x892009_g_TickTime=5				--回调脚本的时钟时间（单位：秒/次）
x892009_g_LimitTotalHoldTime=360	--360,1440副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x892009_g_LimitTimeSuccess=360		--360,1440副本时间限制（单位：次数），如果此时间到了，任务完成
x892009_g_CloseTick=6				--副本关闭前倒计时（单位：次数）
x892009_g_NoUserTime=5			--副本中没有人后可以继续保存的时间（单位：秒）
x892009_g_DeadTrans=0				--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x892009_g_Fuben_X=28				--进入副本的位置X
x892009_g_Fuben_Z=31				--进入副本的位置Z
x892009_g_Back_X=255				--源场景位置X
x892009_g_Back_Z=255				--源场景位置Z
x892009_g_TotalNeedKill=10			--需要杀死怪物数量
x892009_g_Param_sceneid=8			--设置场景ID

--**********************************
--任务入口函数
--**********************************
function x892009_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "Kh鬾g bi猼 t� n絠 n鄌 皙n  m叨i hai t阯 醕 nh鈔, t� x遪g Th Nh� S醫 Tinh t読 L誧 D呓ng ho鄋h h鄋h v� k�, l鄊 nh鴆 b醕h t韓h. M叨i hai t阯 n鄖 v� ngh� cao c叨ng, ki陁 ng誳, 呓ng ng課h. G 疴y r nhi玼 giang h� 鹫o ch韈h linh tinh t靘 n絠 n呓ng t馻 d呔i ch呔ng b鱪 ch鷑g, khi猲 cho th� l馽 c黙 ch鷑g ng鄖 c鄋g l緉 m課h. A di 疣 ph. Thi畁 tai, thi畁 tai..." )	
		AddNumText( sceneId, x892009_g_ScriptId, "Khi陁 chi猲 Th Nh� S醫 Tinh", 10, 10 )
		AddNumText( sceneId, x892009_g_ScriptId, "----Gi緄 thi畊 Th Nh� S醫 Tinh----", 0, 30 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--列举事件
--**********************************
function x892009_OnEnumerate( sceneId, selfId, targetId )
	
end
--**********************************
--事件列表选中一项
--**********************************
function x892009_OnEventRequest( sceneId, selfId, targetId, eventId)
	if GetNumText() == 10 then

	local ret, msg = x892009_CheckAccept( sceneId, selfId, targetId )
	if 1 ~= ret then
		BeginEvent(sceneId)
			AddText(sceneId,msg)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

		BeginEvent( sceneId )
			AddText( sceneId, "B鱪 ch鷑g th� l馽 r m課h, v� c鬾g l読 cao c叨ng. Th� ch� h銀 tri畊 t 瘘 鸢ng 鸬i c黙 c醕 鹫i m鬾 ph醝 t緄 疴y, l鉶 n誴 s� gi鷓 疬a c醕 ng叨i 皙n L鬷 朽i Sinh T�." )
			AddNumText( sceneId, x892009_g_scriptId, "--歇n L鬷 朽i Sinh T�--", 10, 666)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 100  then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  0910281)
	elseif GetNumText() == 20 then
	BeginEvent( sceneId )
		AddText( sceneId, "C醕 h� mu痭 s� h鎢 m祎 Huy璶 H骯 Th Th�?. Gi猼 ch猼 BOSS c� th� 鹫t 疬㧟 nh鎛g v ph qu� gi� c鵱g tr鈔 th� Huy璶 H骯 t呓ng 裯g." )
		AddText( sceneId, "  #YHuy璶 H骯 tr鈔 th� c #G1 c醝#W Tr鈔 Th� Huy璶 H骯 餫n. Huy璶 H骯 衋n To醝 Phi猲 c� th� � ph� b鋘 S醫 Tinh 鹫t 疬㧟. #GTr鈔 th� Huy璶 H骯#W c� n錸g l馽 chi猲 黏u c鹡g nh� t� ch ti玬 n錸g c馽 k� m課h m�." )	
	
		AddNumText( sceneId, x892009_g_ScriptId, "Huy璶 H骯 B錸g Y陁", 6, 201 )
		AddNumText( sceneId, x892009_g_ScriptId, "Huy璶 H骯 C鬾g T鬾 Th醤h", 6, 202 )
		AddNumText( sceneId, x892009_g_ScriptId, "Huy璶 H骯 T鬾 M� M�", 6, 203 )
		AddNumText( sceneId, x892009_g_ScriptId, "Huy璶 H骯 L鈓 Sung", 6, 204 )
		AddNumText( sceneId, x892009_g_ScriptId, "Huy璶 H骯 Th鼀 Ph� 啸u L頽h", 6, 205 )
		AddNumText( sceneId, x892009_g_ScriptId, "Huy璶 H骯 L� Qu鈔 D", 6, 206 )
		AddNumText( sceneId, x892009_g_ScriptId, "Huy璶 H骯 T V呓ng", 6, 207 )
		AddNumText( sceneId, x892009_g_ScriptId, "Huy璶 H骯 Quan Th竛h", 6, 208 )
		AddNumText( sceneId, x892009_g_ScriptId, "Huy璶 H骯 L� Ch� Sinh", 6, 209 )
		AddNumText( sceneId, x892009_g_ScriptId, "Huy璶 H骯 T痭g Kh呓ng", 6, 210 )
		AddNumText( sceneId, x892009_g_ScriptId, "Huy璶 H骯 Vi璶 C� K� H皀", 6, 211 )
		AddNumText( sceneId, x892009_g_ScriptId, "Huy璶 H骯 C醦 姓i Ph醕h", 6, 212 )
		AddNumText( sceneId, x892009_g_ScriptId, "Gi緄 thi畊 S醫 Tinh", 0, 30 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 201 then
              if LuaFnGetAvailableItemCount(sceneId, selfId, 30502005) >=1 then
	          local bok = 0
	          PetNum = LuaFnGetPetCount(sceneId,selfId)
	          if PetNum ~= 0 then
		          for i = 1,PetNum,1 do
			          PetIndex = i - 1		--Tr鈔 Th� index从0开始
			          if LuaFnGetPet_DataID(sceneId, selfId, PetIndex) == 25011 then
	                             LuaFnDeletePet( sceneId, selfId, PetIndex, 1 )
	                             bok=1
			          else
			                 BeginEvent(sceneId)
				                 AddText(sceneId,"Tr鈔 th� Huy璶 H骯 c mang theo tr鈔 th� t呓ng 裯g. H銀 ki琺 tra xem trong � tr鈔 th� c� tr鈔 th�  #YB錸g Y陁 ch遖...")
			                 EndEvent(sceneId)
			                 DispatchEventList(sceneId,selfId,targetId)
			          return
			          end
		          end
	          end
	          if bok == 1 then
	             LuaFnDelAvailableItem(sceneId,selfId,30502005,1)
	             TryRecieveItem( sceneId, selfId, 30309802, 1)--给予物品
	          end
              else
		     BeginEvent(sceneId)
			       AddText(sceneId,"Tr鈔 th� Huy璶 H骯 ph鋓 mang theo #YTr鈔 Th� Huy璶 H骯 衋n#W. Ki琺 tra trong tay n鋓 疸 c� v ph n鄖 ch遖...")
	            EndEvent(sceneId)
	            DispatchEventList(sceneId,selfId,targetId)
	        end

	elseif GetNumText() == 202 then
              if LuaFnGetAvailableItemCount(sceneId, selfId, 30502005) >=1 then
	          local bok = 0
	          PetNum = LuaFnGetPetCount(sceneId,selfId)
	          if PetNum ~= 0 then
		          for i = 1,PetNum,1 do
			          PetIndex = i - 1		--Tr鈔 Th� index从0开始
			          if LuaFnGetPet_DataID(sceneId, selfId, PetIndex) == 13474 then
	                             LuaFnDeletePet( sceneId, selfId, PetIndex, 1 )
	                             bok=1
			          else
			                 BeginEvent(sceneId)
				                 AddText(sceneId,"Tr鈔 th� Huy璶 H骯 c mang theo tr鈔 th� t呓ng 裯g. H銀 ki琺 tra xem trong � tr鈔 th� c� tr鈔 th�  #YC鬾g T鬾 Th醤h ch遖...")
			                 EndEvent(sceneId)
			                 DispatchEventList(sceneId,selfId,targetId)
			          return
			          end
		          end
	          end
	          if bok == 1 then
	             LuaFnDelAvailableItem(sceneId,selfId,30502005,1)
	             TryRecieveItem( sceneId, selfId, 30309803, 1)--给予物品
	          end
              else
		     BeginEvent(sceneId)
			       AddText(sceneId,"Tr鈔 th� Huy璶 H骯 ph鋓 mang theo #YTr鈔 Th� Huy璶 H骯 衋n#W. Ki琺 tra trong tay n鋓 疸 c� v ph n鄖 ch遖...")
	            EndEvent(sceneId)
	            DispatchEventList(sceneId,selfId,targetId)
	        end

	elseif GetNumText() == 203 then
              if LuaFnGetAvailableItemCount(sceneId, selfId, 30502005) >=1 then
	          local bok = 0
	          PetNum = LuaFnGetPetCount(sceneId,selfId)
	          if PetNum ~= 0 then
		          for i = 1,PetNum,1 do
			          PetIndex = i - 1		--Tr鈔 Th� index从0开始
			          if LuaFnGetPet_DataID(sceneId, selfId, PetIndex) == 9560 then
	                             LuaFnDeletePet( sceneId, selfId, PetIndex, 1 )
	                             bok=1
			          else
			                 BeginEvent(sceneId)
				                 AddText(sceneId,"Tr鈔 th� Huy璶 H骯 c mang theo tr鈔 th� t呓ng 裯g. H銀 ki琺 tra xem trong � tr鈔 th� c� tr鈔 th�  #YT鬾 M� M� ch遖...")
			                 EndEvent(sceneId)
			                 DispatchEventList(sceneId,selfId,targetId)
			          return
			          end
		          end
	          end
	          if bok == 1 then
	             LuaFnDelAvailableItem(sceneId,selfId,30502005,1)
	             TryRecieveItem( sceneId, selfId, 30309804, 1)--给予物品
	          end
              else
		     BeginEvent(sceneId)
			       AddText(sceneId,"Tr鈔 th� Huy璶 H骯 ph鋓 mang theo #YTr鈔 Th� Huy璶 H骯 衋n#W. Ki琺 tra trong tay n鋓 疸 c� v ph n鄖 ch遖...")
	            EndEvent(sceneId)
	            DispatchEventList(sceneId,selfId,targetId)
	        end

	elseif GetNumText() == 204 then
              if LuaFnGetAvailableItemCount(sceneId, selfId, 30502005) >=1 then
	          local bok = 0
	          PetNum = LuaFnGetPetCount(sceneId,selfId)
	          if PetNum ~= 0 then
		          for i = 1,PetNum,1 do
			          PetIndex = i - 1		--Tr鈔 Th� index从0开始
			          if LuaFnGetPet_DataID(sceneId, selfId, PetIndex) == 13510 then
	                             LuaFnDeletePet( sceneId, selfId, PetIndex, 1 )
	                             bok=1
			          else
			                 BeginEvent(sceneId)
				                 AddText(sceneId,"Tr鈔 th� Huy璶 H骯 c mang theo tr鈔 th� t呓ng 裯g. H銀 ki琺 tra xem trong � tr鈔 th� c� tr鈔 th�  #YL鈓 Sung ch遖...")
			                 EndEvent(sceneId)
			                 DispatchEventList(sceneId,selfId,targetId)
			          return
			          end
		          end
	          end
	          if bok == 1 then
	             LuaFnDelAvailableItem(sceneId,selfId,30502005,1)
	             TryRecieveItem( sceneId, selfId, 30309805, 1)--给予物品
	          end
              else
		     BeginEvent(sceneId)
			       AddText(sceneId,"Tr鈔 th� Huy璶 H骯 ph鋓 mang theo #YTr鈔 Th� Huy璶 H骯 衋n#W. Ki琺 tra trong tay n鋓 疸 c� v ph n鄖 ch遖...")
	            EndEvent(sceneId)
	            DispatchEventList(sceneId,selfId,targetId)
	        end

	elseif GetNumText() == 205 then
              if LuaFnGetAvailableItemCount(sceneId, selfId, 30502005) >=1 then
	          local bok = 0
	          PetNum = LuaFnGetPetCount(sceneId,selfId)
	          if PetNum ~= 0 then
		          for i = 1,PetNum,1 do
			          PetIndex = i - 1		--Tr鈔 Th� index从0开始
			          if LuaFnGetPet_DataID(sceneId, selfId, PetIndex) == 32530 then
	                             LuaFnDeletePet( sceneId, selfId, PetIndex, 1 )
	                             bok=1
			          else
			                 BeginEvent(sceneId)
				                 AddText(sceneId,"Tr鈔 th� Huy璶 H骯 c mang theo tr鈔 th� t呓ng 裯g. H銀 ki琺 tra xem trong � tr鈔 th� c� tr鈔 th�  #YTh鼀 Ph� 啸u L頽h ch遖...")
			                 EndEvent(sceneId)
			                 DispatchEventList(sceneId,selfId,targetId)
			          return
			          end
		          end
	          end
	          if bok == 1 then
	             LuaFnDelAvailableItem(sceneId,selfId,30502005,1)
	             TryRecieveItem( sceneId, selfId, 30309806, 1)--给予物品
	          end
              else
		     BeginEvent(sceneId)
			       AddText(sceneId,"Tr鈔 th� Huy璶 H骯 ph鋓 mang theo #YTr鈔 Th� Huy璶 H骯 衋n#W. Ki琺 tra trong tay n鋓 疸 c� v ph n鄖 ch遖...")
	            EndEvent(sceneId)
	            DispatchEventList(sceneId,selfId,targetId)
	        end

	elseif GetNumText() == 206 then
              if LuaFnGetAvailableItemCount(sceneId, selfId, 30502005) >=1 then
	          local bok = 0
	          PetNum = LuaFnGetPetCount(sceneId,selfId)
	          if PetNum ~= 0 then
		          for i = 1,PetNum,1 do
			          PetIndex = i - 1		--Tr鈔 Th� index从0开始
			          if LuaFnGetPet_DataID(sceneId, selfId, PetIndex) == 13465 then
	                             LuaFnDeletePet( sceneId, selfId, PetIndex, 1 )
	                             bok=1
			          else
			                 BeginEvent(sceneId)
				                 AddText(sceneId,"Tr鈔 th� Huy璶 H骯 c mang theo tr鈔 th� t呓ng 裯g. H銀 ki琺 tra xem trong � tr鈔 th� c� tr鈔 th�  #YL� Qu鈔 D ch遖...")
			                 EndEvent(sceneId)
			                 DispatchEventList(sceneId,selfId,targetId)
			          return
			          end
		          end
	          end
	          if bok == 1 then
	             LuaFnDelAvailableItem(sceneId,selfId,30502005,1)
	             TryRecieveItem( sceneId, selfId, 30309807, 1)--给予物品
	          end
              else
		     BeginEvent(sceneId)
			       AddText(sceneId,"Tr鈔 th� Huy璶 H骯 ph鋓 mang theo #YTr鈔 Th� Huy璶 H骯 衋n#W. Ki琺 tra trong tay n鋓 疸 c� v ph n鄖 ch遖...")
	            EndEvent(sceneId)
	            DispatchEventList(sceneId,selfId,targetId)
	        end

	elseif GetNumText() == 207 then
              if LuaFnGetAvailableItemCount(sceneId, selfId, 30502005) >=1 then
	          local bok = 0
	          PetNum = LuaFnGetPetCount(sceneId,selfId)
	          if PetNum ~= 0 then
		          for i = 1,PetNum,1 do
			          PetIndex = i - 1		--Tr鈔 Th� index从0开始
			          if LuaFnGetPet_DataID(sceneId, selfId, PetIndex) == 1403 then
	                             LuaFnDeletePet( sceneId, selfId, PetIndex, 1 )
	                             bok=1
			          else
			                 BeginEvent(sceneId)
				                 AddText(sceneId,"Tr鈔 th� Huy璶 H骯 c mang theo tr鈔 th� t呓ng 裯g. H銀 ki琺 tra xem trong � tr鈔 th� c� tr鈔 th�  #YT V呓ng ch遖...")
			                 EndEvent(sceneId)
			                 DispatchEventList(sceneId,selfId,targetId)
			          return
			          end
		          end
	          end
	          if bok == 1 then
	             LuaFnDelAvailableItem(sceneId,selfId,30502005,1)
	             TryRecieveItem( sceneId, selfId, 30309808, 1)--给予物品
	          end
              else
		     BeginEvent(sceneId)
			       AddText(sceneId,"Tr鈔 th� Huy璶 H骯 ph鋓 mang theo #YTr鈔 Th� Huy璶 H骯 衋n#W. Ki琺 tra trong tay n鋓 疸 c� v ph n鄖 ch遖...")
	            EndEvent(sceneId)
	            DispatchEventList(sceneId,selfId,targetId)
	        end

	elseif GetNumText() == 208 then
              if LuaFnGetAvailableItemCount(sceneId, selfId, 30502005) >=1 then
	          local bok = 0
	          PetNum = LuaFnGetPetCount(sceneId,selfId)
	          if PetNum ~= 0 then
		          for i = 1,PetNum,1 do
			          PetIndex = i - 1		--Tr鈔 Th� index从0开始
			          if LuaFnGetPet_DataID(sceneId, selfId, PetIndex) == 13483 then
	                             LuaFnDeletePet( sceneId, selfId, PetIndex, 1 )
	                             bok=1
			          else
			                 BeginEvent(sceneId)
				                 AddText(sceneId,"Tr鈔 th� Huy璶 H骯 c mang theo tr鈔 th� t呓ng 裯g. H銀 ki琺 tra xem trong � tr鈔 th� c� tr鈔 th�  #YQuan Th竛h ch遖...")
			                 EndEvent(sceneId)
			                 DispatchEventList(sceneId,selfId,targetId)
			          return
			          end
		          end
	          end
	          if bok == 1 then
	             LuaFnDelAvailableItem(sceneId,selfId,30502005,1)
	             TryRecieveItem( sceneId, selfId, 30309809, 1)--给予物品
	          end
              else
		     BeginEvent(sceneId)
			       AddText(sceneId,"Tr鈔 th� Huy璶 H骯 ph鋓 mang theo #YTr鈔 Th� Huy璶 H骯 衋n#W. Ki琺 tra trong tay n鋓 疸 c� v ph n鄖 ch遖...")
	            EndEvent(sceneId)
	            DispatchEventList(sceneId,selfId,targetId)
	        end

	elseif GetNumText() == 209 then
              if LuaFnGetAvailableItemCount(sceneId, selfId, 30502005) >=1 then
	          local bok = 0
	          PetNum = LuaFnGetPetCount(sceneId,selfId)
	          if PetNum ~= 0 then
		          for i = 1,PetNum,1 do
			          PetIndex = i - 1		--Tr鈔 Th� index从0开始
			          if LuaFnGetPet_DataID(sceneId, selfId, PetIndex) == 13492 then
	                             LuaFnDeletePet( sceneId, selfId, PetIndex, 1 )
	                             bok=1
			          else
			                 BeginEvent(sceneId)
				                 AddText(sceneId,"Tr鈔 th� Huy璶 H骯 c mang theo tr鈔 th� t呓ng 裯g. H銀 ki琺 tra xem trong � tr鈔 th� c� tr鈔 th�  #YL� Ch� Sinh ch遖...")
			                 EndEvent(sceneId)
			                 DispatchEventList(sceneId,selfId,targetId)
			          return
			          end
		          end
	          end
	          if bok == 1 then
	             LuaFnDelAvailableItem(sceneId,selfId,30502005,1)
	             TryRecieveItem( sceneId, selfId, 30309810, 1)--给予物品
	          end
              else
		     BeginEvent(sceneId)
			       AddText(sceneId,"Tr鈔 th� Huy璶 H骯 ph鋓 mang theo #YTr鈔 Th� Huy璶 H骯 衋n#W. Ki琺 tra trong tay n鋓 疸 c� v ph n鄖 ch遖...")
	            EndEvent(sceneId)
	            DispatchEventList(sceneId,selfId,targetId)
	        end

	elseif GetNumText() == 210 then
              if LuaFnGetAvailableItemCount(sceneId, selfId, 30502005) >=1 then
	          local bok = 0
	          PetNum = LuaFnGetPetCount(sceneId,selfId)
	          if PetNum ~= 0 then
		          for i = 1,PetNum,1 do
			          PetIndex = i - 1		--Tr鈔 Th� index从0开始
			          if LuaFnGetPet_DataID(sceneId, selfId, PetIndex) == 13438 then
	                             LuaFnDeletePet( sceneId, selfId, PetIndex, 1 )
	                             bok=1
			          else
			                 BeginEvent(sceneId)
				                 AddText(sceneId,"Tr鈔 th� Huy璶 H骯 c mang theo tr鈔 th� t呓ng 裯g. H銀 ki琺 tra xem trong � tr鈔 th� c� tr鈔 th�  #YT痭g Kh呓ng ch遖...")
			                 EndEvent(sceneId)
			                 DispatchEventList(sceneId,selfId,targetId)
			          return
			          end
		          end
	          end
	          if bok == 1 then
	             LuaFnDelAvailableItem(sceneId,selfId,30502005,1)
	             TryRecieveItem( sceneId, selfId, 30309811, 1)--给予物品
	          end
              else
		     BeginEvent(sceneId)
			       AddText(sceneId,"Tr鈔 th� Huy璶 H骯 ph鋓 mang theo #YTr鈔 Th� Huy璶 H骯 衋n#W. Ki琺 tra trong tay n鋓 疸 c� v ph n鄖 ch遖...")
	            EndEvent(sceneId)
	            DispatchEventList(sceneId,selfId,targetId)
	        end

	elseif GetNumText() == 211 then
              if LuaFnGetAvailableItemCount(sceneId, selfId, 30502005) >=1 then
	          local bok = 0
	          PetNum = LuaFnGetPetCount(sceneId,selfId)
	          if PetNum ~= 0 then
		          for i = 1,PetNum,1 do
			          PetIndex = i - 1		--Tr鈔 Th� index从0开始
			          if LuaFnGetPet_DataID(sceneId, selfId, PetIndex) == 12040 then
	                             LuaFnDeletePet( sceneId, selfId, PetIndex, 1 )
	                             bok=1
			          else
			                 BeginEvent(sceneId)
				                 AddText(sceneId,"Tr鈔 th� Huy璶 H骯 c mang theo tr鈔 th� t呓ng 裯g. H銀 ki琺 tra xem trong � tr鈔 th� c� tr鈔 th�  #YVi璶 C� K� H皀 ch遖...")
			                 EndEvent(sceneId)
			                 DispatchEventList(sceneId,selfId,targetId)
			          return
			          end
		          end
	          end
	          if bok == 1 then
	             LuaFnDelAvailableItem(sceneId,selfId,30502005,1)
	             TryRecieveItem( sceneId, selfId, 30309812, 1)--给予物品
	          end
              else
		     BeginEvent(sceneId)
			       AddText(sceneId,"Tr鈔 th� Huy璶 H骯 ph鋓 mang theo #YTr鈔 Th� Huy璶 H骯 衋n#W. Ki琺 tra trong tay n鋓 疸 c� v ph n鄖 ch遖...")
	            EndEvent(sceneId)
	            DispatchEventList(sceneId,selfId,targetId)
	        end

	elseif GetNumText() == 212 then
              if LuaFnGetAvailableItemCount(sceneId, selfId, 30502005) >=1 then
	          local bok = 0
	          PetNum = LuaFnGetPetCount(sceneId,selfId)
	          if PetNum ~= 0 then
		          for i = 1,PetNum,1 do
			          PetIndex = i - 1		--Tr鈔 Th� index从0开始
			          if LuaFnGetPet_DataID(sceneId, selfId, PetIndex) == 9540 then
	                             LuaFnDeletePet( sceneId, selfId, PetIndex, 1 )
	                             bok=1
			          else
			                 BeginEvent(sceneId)
				                 AddText(sceneId,"Tr鈔 th� Huy璶 H骯 c mang theo tr鈔 th� t呓ng 裯g. H銀 ki琺 tra xem trong � tr鈔 th� c� tr鈔 th�  #YC醦 姓i Ph醕h ch遖...")
			                 EndEvent(sceneId)
			                 DispatchEventList(sceneId,selfId,targetId)
			          return
			          end
		          end
	          end
	          if bok == 1 then
	             LuaFnDelAvailableItem(sceneId,selfId,30502005,1)
	             TryRecieveItem( sceneId, selfId, 30309813, 1)--给予物品
	          end
              else
		     BeginEvent(sceneId)
			       AddText(sceneId,"Tr鈔 th� Huy璶 H骯 ph鋓 mang theo #YTr鈔 Th� Huy璶 H骯 衋n#W. Ki琺 tra trong tay n鋓 疸 c� v ph n鄖 ch遖...")
	            EndEvent(sceneId)
	            DispatchEventList(sceneId,selfId,targetId)
	        end

	elseif GetNumText() == 40 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310115)
              if c0 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,20310115,5)--删除物品
					TryRecieveItem( sceneId, selfId, 30502005, 1)--给予物品
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g, h䅟 th鄋h H皀 B錸g Ch鈛 th鄋h c鬾g."
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     BeginEvent(sceneId)
			       AddText(sceneId,"H䅟 th鄋h ph鋓 mang theo #YTr鈔 Th� Huy璶 H骯 衋n To醝 Phi猲  #G50 c醝 #W. H銀 ki琺 tra 瘘 s� l唼ng.")
	            EndEvent(sceneId)
	            DispatchEventList(sceneId,selfId,targetId)
	      end

	elseif GetNumText() == 30 then
	BeginEvent( sceneId )
		AddText( sceneId, "S醫 tinh ph� b鋘 t眓g c祅g c� BOSS 12, c� th� khi陁 chi猲 t譶g t阯 m祎." )
		AddText( sceneId, "Ph� b鋘 m瞚 ng鄖 c� th� ti猲 v鄌 ba l唼t." )	
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 666 then
		local nearmembercount	= GetNearTeamCount( sceneId, selfId )
		x892009_MakeCopyScene( sceneId, selfId, nearmembercount )
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#gff00f0Ch鷆 m?ng #gffff00"..nam.."#gff00f0 c鵱g t� 鸬i ti猲 v鄌 Sinh T� L鬷 朽i th鄋h c鬾g. M鱥 ng叨i h銀 c鵱g nhau ch� tin t裞 t痶 l鄋h c黙 h� n鄌...", 4 )
	end
end

--**********************************
--检测接受条件
--**********************************
function x892009_CheckAccept( sceneId, selfId, targetId )

	if LuaFnHasTeam(sceneId,selfId) ~= 1 then
		return 0, "Ph� b鋘 Th Nh� S醫 Tinh c c� t痠 thi瑄 3 th鄋h vi阯 trong m祎 鸬i. N猽 ng呓i c鋗 th m祎 m靚h m靚h 疸 gi鰅, h銀 tham gia Hoa S絥 Lu Ki猰 餴."
	end

	--是不是队长....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		return 0, "Ng呓i kh鬾g ph鋓 鸬i tr叻ng."
	end

	--人数是否够....
	if GetTeamSize(sceneId,selfId) < 1 then
		return 0, "械i ng� kh鬾g 瘘 3 ng叨i. Ti猲 v鄌 Sinh T� L鬷 朽i ch� c� n呔c n誴 m課g cho ch鷑g m� th鬷!"
	end

	--是否都在附近....
	local NearTeamSize = GetNearTeamCount(sceneId,selfId)
	if GetTeamSize(sceneId,selfId) ~= NearTeamSize then
		return 0, "C� th鄋h vi阯 kh鬾g � g 疴y."
	end

	local Humanlist = {}
	local nHumanNum = 0
	for i=0, NearTeamSize-1 do
		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		if GetLevel( sceneId, PlayerId ) < 80 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end
	end

	if nHumanNum > 0 then

		local msg = "Ng呓i c 鸬 c騨 d呔i 80"
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. ", "
		end
		msg = msg .. Humanlist[nHumanNum-1] .. " kh鬾g th� ti猲 v鄌."
		return 0, msg

	end

	--是否有人今天做过3次了....牙牙3.6修改 防止没有进去的当队长不检测
	nHumanNum = 0
	local CurDayTime = GetDayTime()
	for i=0, NearTeamSize-1 do

		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		local lastTime = GetMissionData( sceneId, PlayerId, MD_CHUNJIE_BIANPAO_DAYTIME )
		local lastDayTime = floor( lastTime / 100 )
		local lastDayCount = mod( lastTime, 100 )
	
		if CurDayTime > lastDayTime then
			lastDayTime = CurDayTime
			lastDayCount = 0
		end

		if lastDayCount >= 3 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end

	end

	if nHumanNum > 0 then

		local msg = "    "
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. ", "
		end
		msg = msg .. Humanlist[nHumanNum-1] .. " trong ng鄖 疸 khi陁 chi猲 qu� 3 l唼t r癷."
		return 0, msg

	end

	return	1
end

--**********************************
--接受
--**********************************
function x892009_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--放弃
--**********************************
function x892009_OnAbandon( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x892009_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mylevel = 120
	local iniLevel=120

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "shengsileitai.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x892009_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x892009_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x892009_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x892009_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --保存队伍号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--杀死Boss的数量
	LuaFnSetCopySceneData_PvpRuler( sceneId, 9 )

	local x,z = GetWorldPos( sceneId, selfId )		

	LuaFnSetSceneLoad_Monster( sceneId, "shengsileitai_monster2.ini" )
	
    local CopyScene_LevelGap = 31
	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --级别差，CopyScene_LevelGap 在 scene.lua 中赋值

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"Ti猲 v鄌 ph� b鋘 th鄋h c鬾g!");
		else
			AddText(sceneId,"S� l唼ng b鋘 sao 疸 qu� t鋓, h銀 瘙i m祎 l鷆.");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--继续
--**********************************
function x892009_OnContinue( sceneId, selfId, targetId )
	
end

--**********************************
--检测是否可以提交
--**********************************
function x892009_CheckSubmit( sceneId, selfId )
	
end

--**********************************
--提交
--**********************************
function x892009_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end
--**********************************
--怪物死亡
--**********************************
function x892009_OnDie(sceneId, objId, killerId)
    --PrintStr( "x892009_OnDie [objId]"..objId.." [killerId]"..killerId.."[sceneId]"..sceneId )
    local DataID = GetMonsterDataID( sceneId, objId )
    x892009_OnKillObject( sceneId, killerId, DataID, objId )
end
--**********************************
--杀死怪物或玩家
--**********************************
function x892009_OnKillObject( sceneId, selfId, objdataId ,objId )
	local temp = random(2)
		if temp==1 then
			AddMonsterDropItem( sceneId, objId, selfId, 30900001 )
		end
end

--**********************************
--进入区域事件
--**********************************
function x892009_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x892009_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x892009_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
	NewWorld( sceneId,leaderObjId, destsceneId, x892009_g_Fuben_X, x892009_g_Fuben_Z)
	local nearmembercount	= GetNearTeamCount( sceneId, leaderObjId )
	local member
	local misIndex
	for	i=0, nearmembercount-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )
		if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then
		NewWorld( sceneId, member, destsceneId, x892009_g_Fuben_X, x892009_g_Fuben_Z )
		end
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x892009_OnPlayerEnter( sceneId, selfId )

--设置死亡后复活点位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x892009_g_Fuben_X, x892009_g_Fuben_Z );
	--SetUnitCampID(sceneId, selfId, selfId, 109)

	local lastTime = GetMissionData( sceneId, selfId, MD_CHUNJIE_BIANPAO_DAYTIME )
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )
	local CurDayTime = GetDayTime()

	if CurDayTime > lastDayTime then
		lastDayTime = CurDayTime
		lastDayCount = 0
	end

	lastDayCount = lastDayCount + 1
	lastTime = lastDayTime * 100 + lastDayCount
	SetMissionData( sceneId, selfId, MD_CHUNJIE_BIANPAO_DAYTIME, lastTime )

end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x892009_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--副本场景定时器事件
--**********************************
function x892009_OnCopySceneTimer( sceneId, nowTime )
	--副本时钟读取及设置
	TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--取得已经执行的定时次数
	TickCount = TickCount+1 ;
	LuaFnSetCopySceneData_Param(sceneId, 2, TickCount);--设置新的定时器调用次数

	--副本关闭标志
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;

	if leaveFlag == 1 then --需要离开

		--离开倒计时间的读取和设置
		leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, 5) ;
		leaveTickCount = leaveTickCount+1 ;
		LuaFnSetCopySceneData_Param(sceneId, 5, leaveTickCount) ;

		if leaveTickCount == x892009_g_CloseTick then --倒计时间到，大家都出去吧

			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号

			--将当前副本场景里的所有人传送回原来进入时候的场景
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				NewWorld( sceneId, mems[i], oldsceneId, x892009_g_Back_X, x892009_g_Back_Z )
			end

		elseif leaveTickCount<x892009_g_CloseTick then

			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号

			--通知当前副本场景里的所有人，场景关闭倒计时间
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
	  			BeginEvent(sceneId)
	  				strText = format("Ng呓i c騨 %d gi鈟 瓞 r秈 kh鰅 ph� b鋘.", (x892009_g_CloseTick-leaveTickCount)*x892009_g_TickTime )
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
			end
		end
	elseif TickCount == x892009_g_LimitTimeSuccess then
		--此处设置有时间限制的任务完成处理
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)

  			BeginEvent(sceneId)
  				AddText(sceneId,"Nhi甿 v� ho鄋 th鄋h!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
			misIndex = GetMissionIndexByID(sceneId,mems[i],x892009_g_MissionId)--取得任务数据索引值
			--将任务的第1号数据设置为1,表示完成的任务
			SetMissionByIndex(sceneId,mems[i],misIndex,x892009_g_Param_ok,1)--设置任务数据
			--完成副本所用时间
			SetMissionByIndex(sceneId,mems[i],misIndex,x892009_g_Param_time,TickCount*x892009_g_TickTime)--设置任务数据
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;

	elseif TickCount == x892009_g_LimitTotalHoldTime then --副本总时间限制到了
		--此处设置副本任务有时间限制的情况，当时间到后处理...
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			DelMission( sceneId, mems[i], x892009_g_MissionId );--任务失败,删除之

  			BeginEvent(sceneId)
  				AddText(sceneId,"Nhi甿 v� th b読.");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;

	end
end
--**********************************
--将某玩家传送出副本,回到进入时的位置
--**********************************
function x892009_KickOut( sceneId, objId )
    local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )	--取得副本入口场景号
	local x = 158 --进入时的坐标X
	local z = 130 --进入时的坐标Z
	
	if LuaFnIsObjValid( sceneId, objId ) == 1 then
	    NewWorld( sceneId, objId, oldsceneId, x, z )
	end
	
end
--**********************************
-- 对话窗口信息提示
--**********************************
function x892009_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x892009_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
-- 检测开放时间
--**********************************
function x892009_IsActivityOpen(sceneId)
	local nHour = GetHour();
	local nMinute = GetMinute();
	local nCurTempTime = nHour * 60 + nMinute;
	if nCurTempTime >= 20 * 60 and nCurTempTime < 21 * 60 + 20 then
		return 1;
	end
	return 0;
--	return 1
end
--**********************************
-- 检测开放时间2
--**********************************
function x892009_IsActivityOpen2(sceneId)
	local nHour = GetHour();
	local nMinute = GetMinute();
	local nCurTempTime = nHour * 60 + nMinute;
	if nCurTempTime >= 21 * 60 + 20 and nCurTempTime < 21 * 50 then
		return 1;
	end
	return 0;
--	return 1
end
--**********************************
-- 赋值
--**********************************
function x892009_ToMax( sceneId, selfId, killerId ,guildName,maxCount )
	PK_MAXCOUNTGUILD=guildName
	PK_MAXCOUNT=maxCount
end
--**********************************
-- 全球通告
--**********************************
function x892009_GlobalCountNews( sceneId, selfId, targetId,str )
	BeginEvent( sceneId )
        	AddGlobalCountNews( sceneId, str )
        EndEvent( sceneId )
        DispatchEventList( sceneId, selfId, targetId )
end
function x892009_ShowNotice( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
