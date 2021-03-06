--NPC演示技能特效用
--演示NPC
--普通
--这个NPC最好是不会还手，可攻击，但是不会受到任何伤害
--脚本号
x801008_g_ScriptId = 801008;

--要演示的技能列表 
x801008_g_DemoSkills = {};
--声明方法：  x801008_g_DemoSkills[技能的编号] = "技能的名字"; 注：后面会把技能的编号当事件号使用 

x801008_g_DemoSkills[865]="L誧 M礳 Ti陁 Ti陁";
x801008_g_DemoSkills[866]="V鱪g Mai Ch� Kh醫";
x801008_g_DemoSkills[867]="D呓ng Quan Tam 衖畃";
x801008_g_DemoSkills[868]="D呓ng Ph� 耺 Ph鋘";
x801008_g_DemoSkills[869]="D呓ng Ca Thi阯 Qu鈔";
x801008_g_DemoSkills[870]="D呓ng Xu鈔 B誧h Tuy猼";
x801008_g_DemoSkills[871]="姓p Tuy猼 V� Ng鈔";
x801008_g_DemoSkills[872]="Quy T裞 C鬾g";
x801008_g_DemoSkills[873]="M鬷 H� R錸g L課h";
x801008_g_DemoSkills[874]="Th Di畁 Mai Ph鴆";
x801008_g_DemoSkills[875]="Bao Bi畁 L鄊 Thay";
x801008_g_DemoSkills[876]="Quy Kh� Lai H�";
x801008_g_DemoSkills[877]="Bg H� Ng� Phong";
x801008_g_DemoSkills[878]="T頽h 膎h Tr B韈h";
x801008_g_DemoSkills[879]="姓i T唼ng V� H靚h";

--所拥有的事件Id列表
x801008_g_eventList={865,866,867,868,869,870,871,872,873,874,875,876,877,878,879};
--**********************************
--事件交互入口
--**********************************
function x801008_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "Hoan ngh阯h 疸 t緄. Xin m秈 l馻 ch鱪 c醕 k� n錸g mu痭 th錷 quan.");
--	for i=1,getn(x801008_g_eventList) do 
	for nIdx, nEvent in x801008_g_eventList do
		--添加演示技能的按钮 
		AddNumText(sceneId, nEvent, x801008_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--事件列表选中一项
--**********************************
function x801008_OnEventRequest( sceneId, selfId, targetId, eventId )
	--问题selfId,和TargetId分别是什么的ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId, targetId,1,0,0,0,0);
	--CallScriptFunction( 801008, "LuaFnUnitUseSkill",sceneId, selfId, eventId , targetId);
	--return;
end
