--����Ԫ�� NPC
--ע�Ȿ�ű���������Ԫ����ع��ܣ���һ���������е����ӽ����޸ġ�

x181003_g_scriptId 	= 181003
x181003_g_buyrate 	= 0.5

x181003_g_shoptableindex=120
x181003_g_zengdianshop=121

x181003_g_goodact		= 1		--Ԫ���̵�
x181003_g_buyact	 	= 2		--�һ�Ԫ��
x181003_g_ticketact = 3		--�һ�Ԫ��Ʊ
x181003_g_zdianact	= 4		--�����̵�
x181003_g_gotodali	= 5		--��������

x181003_g_normalzdianshop	= 6		--��ͨ�����̵�
x181003_g_lv1zdianshop	= 7			--һNguy�n li�u c�p 
x181003_g_lv2zdianshop	= 8			--��Nguy�n li�u c�p 
x181003_g_lv3zdianshop	= 9			--��Nguy�n li�u c�p 
x181003_g_lv4zdianshop	= 10		--��Nguy�n li�u c�p 
x181003_g_lv5zdianshop	= 11		--��Nguy�n li�u c�p 
x181003_g_lv6zdianshop	= 12		--��Nguy�n li�u c�p 
x181003_g_lv7zdianshop	= 13		--��Nguy�n li�u c�p 
x181003_g_lv8zdianshop	= 14		--��Nguy�n li�u c�p 
x181003_g_lv9zdianshop	= 15		--��Nguy�n li�u c�p 
x181003_g_lv10zdianshop	= 16		--ʮNguy�n li�u c�p 
x181003_g_newprize	= 17		--�鿴�н�
x181003_g_YuanBaoIntro	= 18	--Ԫ������

x181003_g_leave			= 20	--�뿪
x181003_g_return		= 21	--����(���˵�)
x181003_g_return1		= 22	--����(Ԫ���̵�)
x181003_g_DZYBact		= 23	--����ͼԪ���̵�

--Ԫ���̵�	-modify by xindefeng
x181003_g_YBShop		=
{
	--������˳����� 1-N����name = �̵����ƣ�id = �̵�ID��key = GetNumText��˳����� 101-N��
	[1]	= { name = "#gff00f0Nhi�t m�i th߽ng ph�m", id = 151, key = 101 },
	[2]	= { name = "#c6de4feThi�n Long s�ng v�t qu�n", id = -1, key = 102 },
	[3]	= { name = "Thi�n cung ng� m� gi�m", id = 134, key = 103 },	
	[4]	= { name = "#c6de4feThi�n Long h�nh t��ng qu�n", id = -1, key = 104 },
	[5]	= { name = "L�u D߽ng ph�o hoa �i�m", id = 132, key = 105 },
	[6]	= { name = "Xu�n th�nh b�ch hoa cung", id = 133, key = 106 },	
	[7]	= { name = "Bi�n Th߾c linh d��c �i�m", id = 136, key = 107 },
	[8]	= { name = "#gff00f0K� tr�n d� b�o", id = 137, key = 108 },	
	[9] = { name = "#c6de4feThi�n Long b�o th�ch trai", id = -1, key = 109 },	
	[10]	= { name = "Ho�n thi th�y c�c", id = 146, key = 110 },
	[11]	= { name = "Tam thanh th�n ph�", id = 144, key = 111 }
}

--Ԫ�����޵�--add by xindefeng
x181003_g_YBPetShops =
{
	[1]	= { name = "Phi Phi tr�n th� qu�n", id = 152, key = 112 },
	[2]	= { name = "Phi�u Phi�u tr�n th� qu�n", id = 135, key = 113 }
}

--Ԫ�������--add by xindefeng
x181003_g_YBXingXiangShops =
{
	[1]	= { name = "M� Lan th�i trang �i�m", id = 120, key = 114 },
	[2] = { name = "Nh� � bi�n th�n trai", id = 181, key = 115 },
	[3] = { name = "Thi�n D߽ng ph�t ngh� qu�n", id = 145, key = 116 },
	[4] = { name = "Lan V� m� dung ph߶ng", id = 182, key = 117 }	--add by zchw
}

--Ԫ����ʯ��--add by xindefeng
x181003_g_YBBaoshiShops =
{
	[1]	= { name = "Ph�ng b�o th�ch ��i L�", id = 149, key = 118 },
	[2]	= { name = "Ph�ng b�o th�ch T� Ch�u", id = 150, key = 119 },
	[3]	= { name = "Ph�ng b�o th�ch L�c D߽ng", id = 178, key = 120 },
	[4]	= { name = "#gff00f0B�o th�ch tinh hoa �i�m", id = 198, key = 132 }   -- added by houzhifang in 20081107 tt:40793; 120--131���ù���
}

--����ͼ�̵�
x181003_g_DZYBShop	=
{
	--������˳����� 1-N����name = �̵����ƣ�id = �̵�ID��key = GetNumText��˳����� 201-N��
	[1]	= { name = "�ao ph� - Th߽ng b�ng", id = 156, key = 201 },
	[2]	= { name = "нn �o�n - Song �o�n", id = 157, key = 202 },
	[3]	= { name = "Phi�n - Ho�n", id = 158, key = 203 },
	[4]	= { name = "M�o - Y ph�c", id = 159, key = 204 },
	[5]	= { name = "Th� s�o - H�i", id = 160, key = 205 },
	[6]	= { name = "H� uy�n - H� ki�n", id = 161, key = 206 },
	[7]	= { name = "Y�u ��i", id = 162, key = 207 },
	[8]= { name = "H�ng li�n", id = 163, key = 208 },
	[9]	= { name = "Gi�i ch�", id = 164, key = 209 },
	[10]	= { name = "H� ph�", id = 165, key = 210 },
}

--������ڵ�
x181003_g_YBHuaPaoShops =
{
	[1]	= { name = "��n �u�c r�c r�", id = 190, key = 300 },
	[2]	= { name = "V�t ph�m ng�y l�", id = 191, key = 301 },
	[3]	= { name = "Khuynh th�nh chi t�", id = 192, key = 302 },
}

--�ұ������
x181003_g_YBQiWuShops =
{
	[1]	= { name = "Lung linh th�ch �u k�", id = 193, key = 303 },
	[2]	= { name = "D� th� gia c�ng ph߶ng", id = 194, key = 304 },
	[3]	= { name = "Nam b�c k� h�a �i�m", id = 195, key = 305 },
	[4]	= { name = "Nguy�n b�o k� v�t �i�m", id = 137, key = 306 },
}

--�����̵�
x181003_g_YBReMaiShops =
{
	[1]	= { name = "V�t ph�m m�i", id = 188, key = 307 },
	[2] = { name = "Nh�n kh� th߽ng ph�m", id = 189, key = 309 },
}

--**********************************
--�¼��������
--**********************************
function x181003_OnDefaultEvent( sceneId, selfId, targetId )
	if targetId == -1 then
		x181003_OnEventRequest( sceneId, selfId, targetId, nil )
	else
		BeginEvent( sceneId )
--			local strText = "    ��Ǯ��ʹ����ĥ����Ȼ��������������Ϊ�ϣ���������Ԫ�����ܻ�ʹԭ���ܶ�Ƚ��Ѱ�������ü�������������Щʲô�أ�"
--			AddText( sceneId, strText )
--			AddNumText( sceneId, x181003_g_scriptId, "���빺����Ʒ", 2, x181003_g_goodact)
--			if targetId >= 0 then
--				AddNumText( sceneId, x181003_g_scriptId, "����һ�Ԫ��", 2, x181003_g_buyact)
--				if IsShutout( sceneId, selfId, ONOFF_T_YBCASH ) == 0 then
--					AddNumText( sceneId, x181003_g_scriptId, "����һ�Ԫ��Ʊ", 2, x181003_g_ticketact)
--				end
--			else
--				targetId = -1	--Ϊ������������ѡ��
--			end
			for i = 1, getn( x181003_g_YBShop ) do
				AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBShop[i].name, 7, x181003_g_YBShop[i].key )
			end
			AddNumText(sceneId,x181003_g_scriptId, "�� t�o �", 7, x181003_g_DZYBact)
			AddNumText( sceneId, x181003_g_scriptId, "Gi�i thi�u Ti�n Trang", 11, x181003_g_YuanBaoIntro)
			if targetId < 0 then
				targetId = -1
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x181003_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == x181003_g_buyact then
		--��ѯ���Լ���ʣ�����
		CallScriptFunction( PRIZE_SCRIPT_ID, "AskPoint", sceneId, selfId )
		
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, x181003_g_buyrate*1000)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 2001 )
	elseif GetNumText() == x181003_g_newprize then
		CallScriptFunction( PRIZE_SCRIPT_ID, "AskPrize", sceneId, selfId)
	elseif GetNumText() == x181003_g_return then
		local nID = targetId;
		if nID < 0 then nID = -2 end -- -2�ǲ˵���-1����Ӧ
		x181003_OnDefaultEvent( sceneId, selfId, nID )
	elseif GetNumText() == x181003_g_goodact or GetNumText() == x181003_g_return1 then
--		BeginEvent( sceneId )
--			for i = 1, getn( x181003_g_YBShop ) do
--				AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBShop[i].name, 7, x181003_g_YBShop[i].key )
--			end
--			AddNumText(sceneId,x181003_g_scriptId, "����ͼר��", 7, x181003_g_DZYBact)
--			AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return)
--		EndEvent( sceneId )
--		DispatchEventList( sceneId, selfId, targetId )
		local nID = targetId;
		if nID < 0 then nID = -2 end -- -2�ǲ˵���-1����Ӧ
		x181003_OnDefaultEvent( sceneId, selfId, nID )
	elseif GetNumText() == x181003_g_DZYBact then
		BeginEvent( sceneId )
			local strText = "H�y l�a ch�n lo�i �� t�o � t߽ng �ng."
			AddText( sceneId, strText )
			
			for i = 1, getn( x181003_g_DZYBShop ) do
				AddNumText( sceneId, x181003_g_scriptId, x181003_g_DZYBShop[i].name, 7, x181003_g_DZYBShop[i].key )
			end
			AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == x181003_g_zdianact then
		BeginEvent( sceneId )
			strText = "H�y l�a ch�n m�t lo�i c�a h�ng �i�m t�ng t߽ng �ng"
			AddText( sceneId, strText )
			AddNumText( sceneId, x181003_g_scriptId, "Ph� th�ng th߽ng ph�m", 7, x181003_g_normalzdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy�n li�u c�p 1", 7, x181003_g_lv1zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy�n li�u c�p 2", 7, x181003_g_lv2zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy�n li�u c�p 3", 7, x181003_g_lv3zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy�n li�u c�p 4", 7, x181003_g_lv4zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy�n li�u c�p 5", 7, x181003_g_lv5zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy�n li�u c�p 6", 7, x181003_g_lv6zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy�n li�u c�p 7", 7, x181003_g_lv7zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy�n li�u c�p 8", 7, x181003_g_lv8zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy�n li�u c�p 9", 7, x181003_g_lv9zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy�n li�u c�p 10", 7, x181003_g_lv10zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == x181003_g_gotodali then
		NewWorld(sceneId,selfId,0,200,177)
	elseif GetNumText() == x181003_g_ticketact then
		local nYuanBao = YuanBao(sceneId,selfId,targetId,3,0)
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 2002 )
	elseif GetNumText() == x181003_g_leave then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	elseif GetNumText() == x181003_g_normalzdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 121 )
	elseif GetNumText() == x181003_g_lv1zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 122 )
	elseif GetNumText() == x181003_g_lv2zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 123 )
	elseif GetNumText() == x181003_g_lv3zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 124 )
	elseif GetNumText() == x181003_g_lv4zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 125 )
	elseif GetNumText() == x181003_g_lv5zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 126 )
	elseif GetNumText() == x181003_g_lv6zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 127 )
	elseif GetNumText() == x181003_g_lv7zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 128 )
	elseif GetNumText() == x181003_g_lv8zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 129 )
	elseif GetNumText() == x181003_g_lv9zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 130 )
	elseif GetNumText() == x181003_g_lv10zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 131 )
	elseif GetNumText() == x181003_g_YuanBaoIntro	then
		BeginEvent( sceneId )
			AddText( sceneId, "#{INTRO_YUANBAO}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 102 then	--�������޵�	--add by xindefeng
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBPetShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBPetShops[i].name, 7, x181003_g_YBPetShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 104 then	--���������	--add by xindefeng
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBXingXiangShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBXingXiangShops[i].name, 7, x181003_g_YBXingXiangShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 109 then	--������ʯ��--add by xindefeng
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBBaoshiShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBBaoshiShops[i].name, 7, x181003_g_YBBaoshiShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )		
	elseif GetNumText() == 105 then	--������ڵ�
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBHuaPaoShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBHuaPaoShops[i].name, 7, x181003_g_YBHuaPaoShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 108 then	--�ұ������
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBQiWuShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBQiWuShops[i].name, 7, x181003_g_YBQiWuShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 101 then	--�����̵�
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBReMaiShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBReMaiShops[i].name, 7, x181003_g_YBReMaiShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v�", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	else
		--Ԫ���̵�
		for i = 1, getn( x181003_g_YBShop ) do
			if (GetNumText() == 102 or GetNumText() == 104 or GetNumText() == 109 or GetNumText() == 105 or GetNumText() == 108 or GetNumText() == 101) then	--�̵�����ѡ��--add by xindefeng
				break
			end
			if GetNumText() == x181003_g_YBShop[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBShop[i].id )
				break
			end
		end
		--�������޵�--add by xindefeng
		for i = 1, getn( x181003_g_YBPetShops ) do
			if GetNumText() == x181003_g_YBPetShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBPetShops[i].id )
				break
			end
		end
		--���������--add by xindefeng
		for i = 1, getn( x181003_g_YBXingXiangShops ) do
			if GetNumText() == x181003_g_YBXingXiangShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBXingXiangShops[i].id )
				break
			end
		end
		--��ʯ�̵�--add by xindefeng
		for i = 1, getn( x181003_g_YBBaoshiShops ) do
			if GetNumText() == x181003_g_YBBaoshiShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBBaoshiShops[i].id )
				break
			end
		end
		--����ͼר��
		for i = 1, getn( x181003_g_DZYBShop ) do
			if GetNumText() == x181003_g_DZYBShop[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_DZYBShop[i].id )
				break
			end
		end
		--������ڵ�
		for i = 1, getn( x181003_g_YBHuaPaoShops ) do
			if GetNumText() == x181003_g_YBHuaPaoShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBHuaPaoShops[i].id )
				break
			end
		end
		--�ұ������
		for i = 1, getn( x181003_g_YBQiWuShops ) do
			if GetNumText() == x181003_g_YBQiWuShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBQiWuShops[i].id )
				break
			end
		end
		--�����̵�
		for i = 1, getn( x181003_g_YBReMaiShops ) do
			if GetNumText() == x181003_g_YBReMaiShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBReMaiShops[i].id )
				break
			end
		end
	end
end

--**********************************
--�ͻ��˹���Ԫ���ӿ�
--**********************************
function x181003_BuyYuanbao( sceneId, selfId, nYuanBao )
	--����Ԫ��
	if nYuanBao then
		if nYuanBao > 0 and nYuanBao <= 10000 then
			CallScriptFunction( PRIZE_SCRIPT_ID, "AskYuanBao", sceneId, selfId, nYuanBao, nYuanBao*x181003_g_buyrate*1000)
		end
	end
end

--**********************************
--�����������̵꣬��Ϊ�����̵��NPC�̵�
--**********************************
function x181003_NewDispatchShopItem(sceneId,selfId,targetId,shopId)
	if targetId >= 0 then	
		DispatchShopItem( sceneId, selfId,targetId, shopId )
	else
		DispatchNoNpcShopItem( sceneId, selfId, shopId )
	end
end