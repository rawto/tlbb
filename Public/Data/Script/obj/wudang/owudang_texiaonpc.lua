--NPC演示技能特效用
--演示NPC
--普通
--这个NPC最好是不会还手，可攻击，但是不会受到任何伤害
--脚本号
x801004_g_ScriptId = 801004;

--要演示的技能列表 
x801004_g_DemoSkills = {};
--声明方法：  x801004_g_DemoSkills[技能的编号] = "技能的名字"; 注：后面会把技能的编号当事件号使用 

x801004_g_DemoSkills[800]="Ng鱟 N� Xuy阯 Xoa";
x801004_g_DemoSkills[801]="Du Nh鏽 H鎢 D�";
x801004_g_DemoSkills[802]="Y猲 T� Sao Th鼀";
x801004_g_DemoSkills[803]="B誧h H誧 L唼ng S�";
x801004_g_DemoSkills[804]="H� Bao 啸u";
x801004_g_DemoSkills[805]="Song Phong Qu醤 Nh�";
x801004_g_DemoSkills[806]="Tam Ho鄋 S醥 Nguy畉";
x801004_g_DemoSkills[807]="L鉳 T呔c V�";
x801004_g_DemoSkills[808]="T呓ng Nho D� M";
x801004_g_DemoSkills[809]="Th� V鈔 Tung";
x801004_g_DemoSkills[810]="D� M� Ph鈔 Tung";
x801004_g_DemoSkills[811]="Nh� Phong T� B�";
x801004_g_DemoSkills[812]="H鄋 Mai 羘h Tuy猼";
x801004_g_DemoSkills[813]="姓i Kh鬷 Tinh";
x801004_g_DemoSkills[814]="Ch鈔 Th裞 Th Ti猼 Tr";

--所拥有的事件Id列表
x801004_g_eventList={800,801,802,803,804,805,806,807,808,809,810,811,812,813,814};
--**********************************
--事件交互入口
--**********************************
function x801004_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "Hoan ngh阯h 疸 t緄. Xin m秈 l馻 ch鱪 c醕 k� n錸g mu痭 th錷 quan.");
--	for i=1,getn(x801004_g_eventList) do 
	for nIdx, nEvent in x801004_g_eventList do
		--添加演示技能的按钮 
		AddNumText(sceneId, nEvent, x801004_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--事件列表选中一项
--**********************************
function x801004_OnEventRequest( sceneId, selfId, targetId, eventId )
	--问题selfId,和TargetId分别是什么的ID? 
	LuaFnUnitUseSkill(sceneId, selfId,  eventId,targetId,1,0,0,0,0);
	--CallScriptFunction( 801001, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end
