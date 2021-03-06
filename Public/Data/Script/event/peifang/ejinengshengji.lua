--升级技能的脚本

--脚本号
x713500_g_ScriptId = 713500

x713500_g_AbilityName = {}
x713500_g_AbilityDescription = {}
x713500_g_StudyCost = {}

x713500_g_AbilityName[1] = "N n呔ng"
x713500_g_AbilityName[2] = "Y h鱟"
x713500_g_AbilityName[3] = "Gia c鬾g"
x713500_g_AbilityName[8] = "Khai kho醤g"
x713500_g_AbilityName[9] = "H醝 d唼c"
x713500_g_AbilityName[10] = "C鈛 c�"
x713500_g_AbilityName[11] = "Tr皀g tr鱰"
x713500_g_AbilityDescription[1] = "Nh鎛g th� l鄊 ra 皤u c� th� 錸 疬㧟"
x713500_g_AbilityDescription[2] = "Y h鱟 kh鬾g th� h鱟 trong 1 s緈 1 chi玼"
x713500_g_AbilityDescription[3] = "K� n錸g c c� khi ch� t誳 trang b�, h䅟 th鄋h B鋙 Th誧h"
x713500_g_AbilityDescription[8] = "Khai kho醤g tuy v v�, nh遪g l� m祎 ngh� h醝 ra ti玭"
x713500_g_AbilityDescription[9] = "Ta c� th� truy玭 cho ng叨i b鋘 l頽h ph鈔 bi畉 th鋙 d唼c, kh鬾g c m c鬾g h鱟 恤ng Y, v鏽 c� th� h醝 ra ti玭"
x713500_g_AbilityDescription[10] = "Ng叨i kh鬾g ki阯 nh鏽 kh鬾g th� b 疬㧟 c� l緉"
x713500_g_AbilityDescription[11] = "L鄊 1 ch� n鬾g trang vui v�"


--测试时，升级使用同样的花费定义，正式制作的时候如果需要可以采用二维数组，例如：
--x713500_g_StudyCost[1][1] = 200
x713500_g_StudyCost[1] = 0
x713500_g_StudyCost[2] = 0
x713500_g_StudyCost[3] = 0
x713500_g_StudyCost[8] = 0
x713500_g_StudyCost[9] = 0
x713500_g_StudyCost[10] = 0
x713500_g_StudyCost[11] = 100
--**********************************
--任务入口函数
--**********************************
function x713500_OnDefaultEvent( sceneId, selfId, targetId, AbilityID )
	--玩家技能的等级
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, AbilityID)
	--玩家加工技能的熟练度
	ExpPoint = GetAbilityExp(sceneId, selfId, AbilityID)

	BeginEvent(sceneId)
		AddText(sceneId, "T阯 k� n錸g: " .. x713500_g_AbilityName[AbilityID])
		AddText(sceneId, x713500_g_AbilityDescription[AbilityID])

		if AbilityLevel < 1 then
			AddText(sceneId, "H鱟 k� n錸g n鄖 c m hai l唼ng b誧")
		else
			AddText(sceneId, "C k� n錸g hi畁 c�: " .. AbilityLevel .. "  c")
			AddText(sceneId, "Th錸g c k� n錸g n鄖 c m hai l唼ng b誧")
		end
	EndEvent(sceneId)

	--熟练度不足
	if ExpPoint < (AbilityLevel + 1) * 10 then
		BeginEvent(sceneId)
			strText = format("械 th鄋h th誳 c黙 c醕 h� kh鬾g 瘘")
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif GetMoney(sceneId, selfId) < x713500_g_StudyCost[AbilityID] then
		BeginEvent(sceneId)
			strText = format("Kh鬾g 瘘 Ng鈔 L唼ng")
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
		DispatchMissionInfo( sceneId, selfId, targetId, x713500_g_ScriptId, AbilityID )
	end

   	return 1
end

--**********************************
--列举事件   2006-01-06 新增
--**********************************
function x713500_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713500_g_ScriptId,"H鱟 k� n錸g",12,-1);
end

--**********************************
--检测接受条件
--**********************************
function x713500_CheckAccept( sceneId, selfId )
	return 1
end

--**********************************
--接受
--**********************************
function x713500_OnAccept( sceneId, selfId, AbilityID )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, AbilityID )
	SetHumanAbilityLevel( sceneId, selfId, AbilityID, AbilityLevel + 1 )
end
