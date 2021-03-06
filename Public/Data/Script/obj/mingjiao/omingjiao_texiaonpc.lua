--NPC演示技能特效用
--演示NPC
--普通
--这个NPC最好是不会还手，可攻击，但是不会受到任何伤害
--脚本号
x801002_g_ScriptId = 801002;

--要演示的技能列表 
x801002_g_DemoSkills = {};
--声明方法：  x801002_g_DemoSkills[技能的编号] = "技能的名字"; 注：后面会把技能的编号当事件号使用 

x801002_g_DemoSkills[768]="Th鬷 T鈓 Li畉 T�";
x801002_g_DemoSkills[769]="Huy玭 耺 Ch� D呓ng";
x801002_g_DemoSkills[770]="Thi阯 懈a 邪ng Th�";
x801002_g_DemoSkills[771]="Ng� Tinh Li阯 Ch鈛";
x801002_g_DemoSkills[772]="H鯽 Tinh Xung Nh";
x801002_g_DemoSkills[773]="Th Tinh L誧 Tr叨ng Kh鬾g";
x801002_g_DemoSkills[774]="Th H鄋h B醕h Bi猲";
x801002_g_DemoSkills[775]="Ch� L礳 Vi M�";
x801002_g_DemoSkills[776]="Th鈛 L呓ng Ho醤 Tr�";
x801002_g_DemoSkills[777]="Thi阯 N� Vu Nh鈔";
x801002_g_DemoSkills[778]="N� Ph醫 Xung Quan";
x801002_g_DemoSkills[779]="L鬷 徐nh Chi N�";
x801002_g_DemoSkills[780]="Ngh頰 Ph鏽 衖玭 縩g";
x801002_g_DemoSkills[781]="H T韈h B誧 Ph醫";
x801002_g_DemoSkills[782]="Nh鈔 Qu� 邪ng 邪";
 
--所拥有的事件Id列表
x801002_g_eventList={768,769,770,771,772,773,774,775,776,777,778,779,780,781,782};
--**********************************
--事件交互入口
--**********************************
function x801002_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "Hoan ngh阯h 疸 t緄. Xin m秈 l馻 ch鱪 c醕 k� n錸g mu痭 th錷 quan.");
--	for i=1,getn(x801002_g_eventList) do 
	for nIdx, nEvent in x801002_g_eventList do
		--添加演示技能的按钮 
		AddNumText(sceneId, nEvent, x801002_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--事件列表选中一项
--**********************************
function x801002_OnEventRequest( sceneId, selfId, targetId, eventId )
	--问题selfId,和TargetId分别是什么的ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId, targetId,1,0,0,0,0);
	--CallScriptFunction( 801001, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end
