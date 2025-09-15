MSlocked = 0;
MStop = 0;
MSleft = 0;
MStooltip = 1;

function ManaStones_OnLoad()	
        SLASH_MANASTONES1 = "/ms";
	SLASH_MANASTONES2 = "/manastones";
	SLASH_MANASTONES3 = "/manastone";
	SLASH_MANASTONES4 = "/MS";
	SLASH_MANASTONES5 = "/ManaStone";
        SlashCmdList["MANASTONES"] = ManaStones_SlashHandler;
        this:RegisterEvent("VARIABLES_LOADED");
        --ManaStones_Init();
end



-----------------
function ManaStones_SlashHandler(msg)
	if ( string.lower(string.sub(msg, 1, 7)) == "conjure" ) then
		ManaStones_conjure();
	elseif ( string.lower(string.sub(msg, 1, 3)) == "use" ) then
		ManaStones_use();
        elseif ( string.lower(string.sub(msg, 1, 4)) == "show" ) then
                ShowUIPanel(ManaStonesTemp);
        elseif ( string.lower(string.sub(msg, 1, 4)) == "hide" ) then
                HideUIPanel(ManaStonesTemp);
        elseif ( string.lower(string.sub(msg, 1, 4)) == "lock" ) then
                MSlocked = 1;
        elseif ( string.lower(string.sub(msg, 1, 6)) == "unlock" ) then
                MSlocked = 0;
        elseif ( string.lower(string.sub(msg, 1, 7)) == "tooltip on" ) then
                MStooltip = 1;
        elseif ( string.lower(string.sub(msg, 1, 7)) == "tooltip off" ) then
                MStooltip = 0;
        else
		DEFAULT_CHAT_FRAME:AddMessage("<ManaStones> Commands:");
		DEFAULT_CHAT_FRAME:AddMessage(MS_TEXT.help1);
		DEFAULT_CHAT_FRAME:AddMessage(MS_TEXT.help2);
		DEFAULT_CHAT_FRAME:AddMessage(MS_TEXT.help3);
		DEFAULT_CHAT_FRAME:AddMessage(MS_TEXT.help4);
		DEFAULT_CHAT_FRAME:AddMessage(MS_TEXT.help5);
        end
end
-----------------
function ManaStones_OnEvent(event)
   if (event == "VARIABLES_LOADED") then
     ManaStonesTemp:ClearAllPoints();
     ManaStonesTemp:SetPoint("CENTER", MSleft, MStop);
   end
end 
----------------
function ManaStones_check( manastonen )
local manan = 0;
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if (GetContainerItemLink(bag, slot)) then
				if (string.find(GetContainerItemLink(bag, slot), manastonen)) then
				        manan = 1
				end
			end
		end
	end
end
-----------------
-----------------
function ManaStones_checkms1()
Rred = 1;
Rgreen = 0;
Cred = 1;
Cgreen = 0;
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if (GetContainerItemLink(bag, slot)) then
				if (string.find(GetContainerItemLink(bag, slot), MS_STONESN.ruby)) then
				        Rred = 0;
				        Rgreen = 1;
				end
			end
		end
	end
        if (Rred == 0) then
        else
           Rred = 1;
           Rgreen = 0;
        end
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if (GetContainerItemLink(bag, slot)) then
				if (string.find(GetContainerItemLink(bag, slot), MS_STONESN.citrine)) then
				        Cred = 0;
				        Cgreen = 1;
				end
			end
		end
	end
        if (Cred == 0) then
        else
           Cred = 1;
           Cgreen = 0;
        end
end
-----------------
function ManaStones_checkms2()
Jred = 1;
Jgreen = 0;
Ared = 1;
Agreen = 0;
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if (GetContainerItemLink(bag, slot)) then
				if (string.find(GetContainerItemLink(bag, slot), MS_STONESN.jade)) then
				        Jred = 0;
				        Jgreen = 1;
				end
			end
		end
	end
        if (Jred == 0) then
        else
           Jred = 1;
           Jgreen = 0;
        end
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if (GetContainerItemLink(bag, slot)) then
				if (string.find(GetContainerItemLink(bag, slot), MS_STONESN.agate)) then
				        Ared = 0;
				        Agreen = 1;
				end
			end
		end
	end
        if (Ared == 0) then
        else
           Ared = 1;
           Agreen = 0;
        end
end
-----------------

-----------------
function ManaStonesTooltipCheck()
 if ( MStooltip == 1 ) then
                   ManaStonesTooltip:SetOwner(ManaStonesTemp, "ANCHOR_BOTTOMRIGHT");
                   ManaStonesTooltip:AddDoubleLine(MS_MISC.left, MS_MISC.right, 0,1,1, 0,1,1);
                   ManaStonesTooltip:AddDoubleLine(MS_MISC.toconj, MS_MISC.touse, 0,1,1, 0,1,1);
                   ManaStones_checkms1()
                   ManaStonesTooltip:AddDoubleLine(MS_STONESN.ruby, MS_STONESN.citrine, Rred,Rgreen,0, Cred,Cgreen,0);
                   ManaStones_checkms2()
                   ManaStonesTooltip:AddDoubleLine(MS_STONESN.jade, MS_STONESN.agate, Jred,Jgreen,0, Ared,Agreen,0);
                   ManaStonesTooltip:Show();
 end
end
----------------
function ManaStonesCheckLock1()
 if ( MSlocked == 0 ) then
  ManaStonesTemp:StartMoving();
 end
end
----------------
function ManaStonesCheckLock2()
 if ( MSlocked == 0 ) then
  ManaStonesTemp:StopMovingOrSizing();
 end
end
----------------
function ManaStonesSavePosition()
      MSleft = ManaStonesTemp:GetLeft();
      MStop = ManaStonesTemp:GetTop();
end
-----------------
function ManaStones_Textu()
if ( manan == 1 ) then
 ManaStonesTemp:SetNormalTexture("Interface\\Icons\\INV_Misc_Gem_Ruby_01");
 return
elseif ( manan == 2 ) then
 ManaStonesTemp:SetNormalTexture("Interface\\Icons\\INV_Misc_Gem_Opal_01");
 return
elseif ( manan == 3 ) then
 ManaStonesTemp:SetNormalTexture("Interface\\Icons\\INV_Misc_Gem_Emerald_02");
 return
elseif ( manan == 4 ) then
 ManaStonesTemp:SetNormalTexture("Interface\\Icons\\INV_Misc_Gem_Emerald_01");
 return
else
 ManaStonesTemp:SetNormalTexture("Interface\\Icons\\INV_Misc_Gem_Emerald_01");
 return
end
end
-----------------
function ManaStones_Init()
local manan = 0
--- [ruby]
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if (GetContainerItemLink(bag, slot)) then
				if (string.find(GetContainerItemLink(bag, slot), MS_STONESN.ruby)) then
				        manan = 1
                                        ManaStones_Textu();
                                        return
				end
			end
		end
	end
--- [/ruby]
--- [citrine]
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if (GetContainerItemLink(bag, slot)) then
				if (string.find(GetContainerItemLink(bag, slot), MS_STONESN.citrine)) then
				        manan = 2
                                        ManaStones_Textu();
                                        return
				end
			end
		end
	end
--- [/citrine]
--- [jade]
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if (GetContainerItemLink(bag, slot)) then
				if (string.find(GetContainerItemLink(bag, slot), MS_STONESN.jade)) then
				        manan = 3
                                        ManaStones_Textu();
                                        return
				end
			end
		end
	end
--- [/jade]
--- [agate]
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if (GetContainerItemLink(bag, slot)) then
				if (string.find(GetContainerItemLink(bag, slot), MS_STONESN.agate)) then
				        manan = 4
                                        ManaStones_Textu();
                                        return
				end
			end
		end
	end
--- [/agate]	
end
-----------------
----- [Conjuring]
function ManaStones_conjure()
local exists = 0
local eftia = 0
local manes = 0
local maxmanes = 0
if (UnitLevel("player") > 57) then
 maxmanes = 4
elseif (UnitLevel("player") > 47) then
 maxmanes = 3
elseif (UnitLevel("player") > 37) then
 maxmanes = 2
elseif (UnitLevel("player") > 27) then
 maxmanes = 1
else
 maxmanes = 0
end
--- [ruby]
       if (UnitLevel("player") > 57) then
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if (GetContainerItemLink(bag, slot)) then
				if (string.find(GetContainerItemLink(bag, slot), MS_STONESN.ruby)) then
				        exists = 1
                                        manes = manes + 1
				end
			end
		end
	end
        if (exists == 0) then
         if (UnitMana("player") > 1469) then
          eftia = 1
          CastSpellByName(MS_CONJTEXT.ruby)
          return
         ---else
         --- if (UnitMana("player") < 530) then UIErrorsFrame:AddMessage(ERR_OUT_OF_MANA,1)
         end
        end
        exists = 0
       end
----[/ruby]
--- [citrine]
       if (UnitLevel("player") > 47) then
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if (GetContainerItemLink(bag, slot)) then
				if (string.find(GetContainerItemLink(bag, slot), MS_STONESN.citrine)) then
                                         exists = 1
                                         manes = manes + 1
				end
			end
		end
	end
        if (exists == 0) then
         if (eftia == 0) then
          if (UnitMana("player") > 1129) then
           eftia = 1
           CastSpellByName(MS_CONJTEXT.citrine)
           return
          ---else
          --- if (UnitMana("player") < 530) then UIErrorsFrame:AddMessage(ERR_OUT_OF_MANA,1)
          end
         end
        end
        exists = 0
       end
--- [/citrine]
--- [jade]
       if (UnitLevel("player") > 37) then
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if (GetContainerItemLink(bag, slot)) then
				if (string.find(GetContainerItemLink(bag, slot), MS_STONESN.jade)) then
                                     exists = 1
                                     manes = manes + 1
				end
			end
		end
	end
        if (exists == 0) then
         if (eftia == 0) then
          if (UnitMana("player") > 799) then
           eftia = 1
           CastSpellByName(MS_CONJTEXT.jade)
           return
          ---else
          --- if (UnitMana("player") < 530) then UIErrorsFrame:AddMessage(ERR_OUT_OF_MANA,1)
          end
         end
        end
        exists = 0
       end
---- [/jade]
---- [agate]
       if (UnitLevel("player") > 27) then
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if (GetContainerItemLink(bag, slot)) then
				if (string.find(GetContainerItemLink(bag, slot), MS_STONESN.agate)) then
					exists = 1
                                        manes = manes + 1
				end
			end
		end
	end
        if (exists == 0) then
         if (eftia == 0) then
          if (UnitMana("player") > 529) then
           eftia = 1
           CastSpellByName(MS_CONJTEXT.agate)
           return
          else
          ---else
          --- if (UnitMana("player") < 530) then UIErrorsFrame:AddMessage(ERR_OUT_OF_MANA,1)
          end
         end
        end
        if (eftia == 0) then
         if (manes < maxmanes) then
          UIErrorsFrame:AddMessage(ERR_OUT_OF_MANA,1,0,0,0,0.1)
         end
        end
       else
        UIErrorsFrame:AddMessage(SPELL_FAILED_LEVEL_REQUIREMENT,1,0,0,0,0.1)
       end
       exists = 0
---- [/agate]
end
---- [/conjuring]
----------------

----------------
---- [Use]
function ManaStones_use()
--- [ruby]
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if (GetContainerItemLink(bag, slot)) then
				if (string.find(GetContainerItemLink(bag, slot), MS_STONESN.ruby)) then
				        UseContainerItem(bag,slot);
                                        --ManaStones_Init();
                                        return
				end
			end
		end
	end
--- [/ruby]
--- [citrine]
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if (GetContainerItemLink(bag, slot)) then
				if (string.find(GetContainerItemLink(bag, slot), MS_STONESN.citrine)) then
				        UseContainerItem(bag,slot);
                                        --ManaStones_Init();
                                        return
				end
			end
		end
	end
--- [/citrine]
--- [jade]
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if (GetContainerItemLink(bag, slot)) then
				if (string.find(GetContainerItemLink(bag, slot), MS_STONESN.jade)) then
				        UseContainerItem(bag,slot);
                                        --ManaStones_Init();
                                        return
				end
			end
		end
	end
--- [/jade]
--- [agate]
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if (GetContainerItemLink(bag, slot)) then
				if (string.find(GetContainerItemLink(bag, slot), MS_STONESN.agate)) then
				        UseContainerItem(bag,slot);
                                        --ManaStones_Init();
                                        return
				end
			end
		end
	end
--- [/agate]
end
----- [/use]
------------
