--Mage Nuggets 3.36 by B-Buck (Bbuck of Eredar)
local magenugVer = "3.36"

MageNugz = {
  spMonitorToggle = false;
  spCombatToggle = false;
  ssMonitorToggle = true;
  mageProcToggle = true;
  camZoomTogg = true;
  mirrorImageToggle = true;
  mageArmorToggle = true;
  evocationToggle = true;
  livingBombToggle = true;
  procMonitorToggle = true;
  arcaneBlastToggle = true;
  abCastTimeToggle = true;
  minimapToggle = true;
  buffmonToggle = false;
  polyToggle = true;
  spMonitorSize = 3;
  ssMonitorSize = 3;
  invokersMonitorSize = 3;
  mgCombatTog = false;
  procMonitorSize = 3;
  livingBCounterSize = 3;
  lockFrames = false;
  borderStyle = 0;
  transColor = 0;
  consoleTextEnabled = true;
  slowfallMsg = "Slowfall Cast On You";
  slowfallMsg2 = "Slowfall Cast On You";
  slowfallMsg3 = "Slowfall Cast On You";
  symbiosisNotify = "Symbiosis Cast On You";
  symbiosisNotify2 = "Symbiosis Cast On You";
  symbiosisNotify3 = "Symbiosis Cast On You";
  symbiosisThanks = "Thanks For Symbiosis";
  symbiosisThanks2 = "Thanks For Symbiosis";
  innervatThanks = "Thanks For The Innervate";
  innervatThanks2 = "Thanks For The Innervate";
  powerinfThanks = "Thanks For Power Infusion";
  darkIntentThanks = "Thanks For Dark Intent";
  powerinfNotify = "Power Infusion Cast On You";
  painSupNotify = "Pain Suppression Cast On You";
  gspiritNotify = "Guardian Spirit Cast On You";
  backdropR = 0.0;
  backdropG = 0.0;
  backdropB = 0.0;
  backdropA = 0.0;
  MinimapPos = 45;
  miSound = "mirror.mp3";
  miSoundToggle = true;
  procSound = "proc.mp3";
  polySound = "sheep.mp3";
  ABSound = "impact.mp3";
  hsSound = "hotstreak.mp3";
  impactSound = "impact.mp3";
  fofSound = "fof.mp3";
  brainfreezeSound = "brainfreeze.mp3";
  cauterizeSound = "toasty.mp3";
  timewarpSound = "timewarp.mp3";
  cauterizeSoundToggle = true;
  timewarpSoundToggle = true;
  procSoundToggle = true;
  polySoundToggle = true;
  ABSoundToggle = true;
  hsSoundToggle = true;
  impactSoundToggle = true;
  fofSoundToggle = true;
  brainfreezeSoundToggle = true;
  toolTips = true;
  clearcastToggle = true;
  managemToggle = true;
  clickthru = false;
  invokersToggle = false;
  polyFrameSize = 3;
  msgToggle = true;
  cooldownToggle = false;
  apCooldown = true;
  bwCooldown = true;
  cbCooldown = true;
  csCooldown = true;
  dfCooldown = true;
  dbCooldown = true;
  mwCooldown = true;
  miCooldown = true;
  frzCooldown = true;
  msCooldown = true;
  ibrCooldown = true;
  evoCooldown = true;
  ivCooldown = true;
  cooldownSize = 3;
  moonkinTog = false;
  moonkinSize = 3;
  moonkinCombat = false;
  treantSoundTog = true;
  treantSound = "mirror.mp3";
  moonkinProcTog = true;
  innervatNotify = "Innervate Cast On You!";
  castBoxes = true;
  igniteTog = true;
  moonkinProcSize = 3;
  starfallCooldown = true;
  blinkCooldown = true;
  treantCooldown = true;
  moonkinMin = false;
  moonkinAnchorTog = true;
  cauterizeToggle = true;
  moonkinBoxTog = true;
  symbiosisnToggle = true;
  symbiosistyToggle = true;
  innertyToggle = true;
  pityToggle = true;
  dityToggle = true;
  powerInfToggle = true;
  painSupToggle = true;
  gspiritToggle = true; 
  cautSize = 3;
  alterTimeToggle = true;
  simpleUiToggle = false;
 }

local livingBombCount = 0;
local mirrorImageTime = 0;
local livingbombGlobalTime = 0;
local livingbombTime = {};
local lbTargetId = {};
local spellStealTog = 0;
local misslebTog = 0;
local mageProcSSTime = 0;
local mageProcHSTime = 0;
local mageProcHUTime = 0;
local mageProcMBTime = 0;
local mageProcBFTime = 0
local fofProgMonTime = 0;
local mageImpProgMonTime = 0;
local combatTextCvar = GetCVar("enableCombatText");
local abProgMonTime = 0;
local ttwFlag = false;
local abCastTime = 2.5;
local abStackCount = 0;
local polyTimer = 0;
local scorchTime = 0;
local icyTimer = 0;
local apTimer = 0;
local lustTimer = 0;
local clearcastTime = 0;
local managemCooldown = 0;
local moonfireTime = 0;
local insectTime = 0;
local starsurgeTime = 0;
local moonkinCombatText = 0;
local incombat = 0;
local talentSpec = "damage";
local mnplayerClass = " "
local mnenglishClass = " "
local sstimeleft = 0;
local igniteTemp = 0;
local ignitetimer = 0;
local fbtime = 0;
local cauterizeTime = 0;
local bombType = "none";
local arcaneMissileCount = 0; 
local alterTime = 0;
local tierSix = "invokers";
local tierSixTime = 0;
local tierSixFlash = 0;
local tierSixIconFlash = 0;
local bombSpeced = "frost";
local soundPlayed = false;
local _, class _, class = UnitClass("player")

function MN_Start(self)
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    self:RegisterEvent("CVAR_UPDATE")
    self:RegisterEvent("VARIABLES_LOADED")
    self:RegisterEvent("ADDON_LOADED")
    self:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("CONFIRM_TALENT_WIPE")
    self:RegisterEvent("PLAYER_REGEN_DISABLED")
    self:RegisterEvent("PLAYER_TALENT_UPDATE")
    self:RegisterEvent("PLAYER_REGEN_ENABLED")
    self:RegisterEvent("PLAYER_UPDATE_RESTING")
    self:RegisterEvent("PLAYER_LOGOUT")
    MageNuggetsOptions()
    SlashCmdList['MAGENUGGETS_SLASHCMD'] = MageNuggets_SlashCommandHandler
    SLASH_MAGENUGGETS_SLASHCMD1 = "/magenuggets"
    
    for i=1, 8 do
      livingbombTime[i] = 0;
    end
    for j=1, 8 do
      lbTargetId[j] = 0;
    end
    
end

function MageNuggets_SlashCommandHandler(msg) --Handles the slash commands
    if (msg == "options") then
	    InterfaceOptionsFrame_OpenToCategory("Mage Nuggets");
    elseif (msg == "ports") then
        MageNuggets_Minimap_OnClick(); 
    else
    DEFAULT_CHAT_FRAME:AddMessage("|cffffffff------------|cff00BFFF".."Mage".." |cff00FF00".."Nuggets".."|cffffffff "..magenugVer.."--------------")
    DEFAULT_CHAT_FRAME:AddMessage("|cffffffff".."/magenuggets".." ".."options (Shows Option Menu)")
    DEFAULT_CHAT_FRAME:AddMessage("|cffffffff".."/magenuggets".." ".."ports (Shows Portal Menu)")
    end
end


--
local MN_UpdateInterval = 0.25;
function MageNuggets_OnUpdate(self, elapsed) 
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
 if (self.TimeSinceLastUpdate > MN_UpdateInterval) then
    --Ignite
    local h = 1;
    local dotUp = false;
    local combName, combRank, _, combCount, _, _, expireTime, _, _, _, combspellId = UnitAura("target", h, "PLAYER|HARMFUL");
    while combName do
        if(combspellId == 12654) then
            dotUp = true;  
            ignitetimer = RoundOne(expireTime - GetTime());
            MageNugIgnite_Frame_Bar:SetValue(ignitetimer);
            MageNugIgnite_FrameText2:SetText(ignitetimer);
        end
        h = h + 1;
        combName, combRank, _, combCount, _, _, _, _, _, _, combspellId = UnitAura("target", h, "PLAYER|HARMFUL");
    end 
    if(dotUp == true) then
        if(MageNugz.igniteTog == true)then 
              MageNugIgnite_Frame:Show();
        end
    else
        MageNugIgnite_Frame:Hide();
    end
    
    --Alter Time
    if(alterTime >= 0) then
        if(alterTime == 6) then
            MageNugInfo_FrameText:SetText("|cfffcea21 5");
        elseif(alterTime == 5) then
            MageNugInfo_FrameText:SetText("|cfffcea21 4");
        elseif(alterTime == 4) then
            MageNugInfo_FrameText:SetText("|cfffcea21 3");
        elseif(alterTime == 3) then
            MageNugInfo_FrameText:SetText("|cfffcea21 2");
        elseif(alterTime == 2) then
            MageNugInfo_FrameText:SetText("|cfffcea21 1");
        elseif(alterTime == 0.75) then
            MageNugInfo_FrameText:SetText("|cfffcea21 T I M E");
        else
            MageNugInfo_FrameText:SetText("");
        end
        alterTime = alterTime - 0.25;
    end
        
    --SpellSteal 
    if (spellStealTog >= 1) then 
        spellStealTog = spellStealTog - 1;
    else
        if (MageNugz.ssMonitorToggle == true) then
            if(mnenglishClass == 'MAGE')then
                local stealableBuffs, i = { }, 1;
                local buffName, _, _, _, _, _, expirationTime, _, isStealable = UnitAura("target", i, "HELPFUL");
                while buffName do
                    if(isStealable == 1) then
                        if(expirationTime ~= nil)then
                            sstimeleft = RoundZero(expirationTime - GetTime());    
                            if (sstimeleft > 60) then
                                sstimeleft = "+60";
                            end
                        end
                        stealableBuffs[#stealableBuffs + 1] = buffName.."  "..sstimeleft.."s";
                    end
                    i = i + 1;
                    buffName, _, _, _, _, _, expirationTime, _, isStealable = UnitAura("target", i, "HELPFUL");
                end
                if (#stealableBuffs < 1) then
                    MNSpellSteal_Frame:Hide(); 
                else
                    MNSpellSteal_Frame:Show(); 
                    stealableBuffs = table.concat(stealableBuffs, "\n");
                    MNSpellSteal_FrameBuffText:SetText("|cffFFFFFF"..stealableBuffs);
                end
                -----------
                local stealableBuffs2, i = { }, 1;
                local buffName2, _, _, _, _, _, expirationTime2, _, isStealable2 = UnitAura("focus", i, "HELPFUL");
                while buffName2 do
                    if(isStealable2 == 1) then
                        if(expirationTime2 ~= nil)then
                            sstimeleft2 = RoundZero(expirationTime2 - GetTime());    
                            if (sstimeleft2 > 60) then
                                 sstimeleft2 = "+60";
                           end
                        end
                        stealableBuffs2[#stealableBuffs2 + 1] = buffName2.."  "..sstimeleft2.."s";
                    end
                    i = i + 1;
                    buffName2, _, _, _, _, _, expirationTime2, _, isStealable2 = UnitAura("focus", i, "HELPFUL");
                end
                if (#stealableBuffs2 < 1) then
                    MNSpellStealFocus_Frame:Hide(); 
                else
                    MNSpellStealFocus_Frame:Show(); 
                  stealableBuffs2 = table.concat(stealableBuffs2, "\n");
                    MNSpellStealFocus_FrameBuffText:SetText("|cffFFFFFF"..stealableBuffs2);
                end
            -----------
            elseif(mnenglishClass == 'SHAMAN')then
                if(UnitCanAttack("player", "target"))then
                    local purgeableBuffs, i = { }, 1;
                    local buffName1, _, _, _, debuffType1, _, expirationTime1, _, _ = UnitAura("target", i, "HELPFUL");
                    while buffName1 do
                        if(debuffType1 == "Magic") then
                            purgeableBuffs[#purgeableBuffs + 1] = buffName1;
                        end
                        i = i + 1;
                        buffName1, _, _, _, debuffType1, _, expirationTime1, _, _ = UnitAura("target", i, "HELPFUL");
                    end
                    if (#purgeableBuffs < 1) then
                        MNSpellSteal_Frame:Hide(); 
                    else
                        MNSpellSteal_Frame:Show(); 
                        purgeableBuffs = table.concat(purgeableBuffs, "\n");
                        MNSpellSteal_FrameBuffText:SetText("|cffFFFFFF"..purgeableBuffs);
                    end
                else
                    MNSpellSteal_Frame:Hide(); 
                end
                -----------
                local stealableBuffs2, i = { }, 1;
                local buffName2, _, _, _, debuffTypep, _, expirationTime2, _, isStealable2 = UnitAura("focus", i, "HELPFUL");
                while buffName2 do
                    if(debuffTypep == "Magic") then
                        if(expirationTime2 ~= nil)then
                            sstimeleft2 = RoundZero(expirationTime2 - GetTime());    
                            if (sstimeleft2 > 60) then
                                 sstimeleft2 = "+60";
                           end
                        end
                        stealableBuffs2[#stealableBuffs2 + 1] = buffName2.."  "..sstimeleft2.."s";
                    end
                    i = i + 1;
                    buffName2, _, _, _, debuffTypep, _, expirationTime2, _, isStealable2 = UnitAura("focus", i, "HELPFUL");
                end
                if (#stealableBuffs2 < 1) then
                    MNSpellStealFocus_Frame:Hide(); 
                else
                    MNSpellStealFocus_Frame:Show(); 
                    stealableBuffs2 = table.concat(stealableBuffs2, "\n");
                    MNSpellStealFocus_FrameBuffText:SetText("|cffFFFFFF"..stealableBuffs2);
                end
            ----------
            elseif(mnenglishClass == 'PRIEST')then
                if(UnitCanAttack("player", "target"))then
                    local dispelBuffs, i = { }, 1;
                    local buffName2, _, _, _, debuffType2, _, expirationTime2, _, _ = UnitAura("target", i, "HELPFUL");
                    while buffName2 do
                        if(debuffType2 == "Magic") then
                            dispelBuffs[#dispelBuffs + 1] = buffName2;
                        end
                        i = i + 1;
                        buffName2, _, _, _, debuffType2, _, expirationTime2, _, _ = UnitAura("target", i, "HELPFUL");
                    end
                    if (#dispelBuffs < 1) then
                        MNSpellSteal_Frame:Hide(); 
                    else
                        MNSpellSteal_Frame:Show(); 
                        dispelBuffs = table.concat(dispelBuffs, "\n");
                        MNSpellSteal_FrameBuffText:SetText("|cffFFFFFF"..dispelBuffs);
                    end
                else
                    MNSpellSteal_Frame:Hide(); 
                end
            end
        end
    end
  self.TimeSinceLastUpdate = 0;
  end
end     
--------------------------------------------------------------------
function MageNuggetsHS_OnUpdate(self, elapsed) 
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        if (mageProcHSTime >= 0) then
            mageProcHSTime = RoundOne(mageProcHSTime - 0.1);
            MageNugProcFrame_ProcBar:SetValue(mageProcHSTime)
            MageNugProcFrameText2:SetText(mageProcHSTime)
            local position = (MageNugProcFrame_ProcBar:GetValue() / 14 * 120);
            MageNugProcFrame_ProcBarSpark:SetPoint("BOTTOMLEFT",MageNugProcFrame_ProcBar,"BOTTOMLEFT",position - 10,-6);
            if (mageProcHSTime <= 0) then
                MageNugProcFrame:Hide()
                MageNugProcFrame_ProcBar:SetValue(15)
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsHU_OnUpdate(self, elapsed) 
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        if (mageProcHUTime >= 0) then
            mageProcHUTime = RoundOne(mageProcHUTime - 0.1);
            MageNugProcHUFrame_ProcBar:SetValue(mageProcHUTime)
            MageNugProcHUFrameText2:SetText(mageProcHUTime)
            local position = (MageNugProcHUFrame_ProcBar:GetValue() / 8 * 120);
            MageNugProcHUFrame_ProcBarSpark:SetPoint("BOTTOMLEFT",MageNugProcHUFrame_ProcBar,"BOTTOMLEFT",position - 10,-6);
            if (mageProcHUTime <= 0) then
                MageNugProcHUFrame:Hide()
                MageNugProcHUFrame_ProcBar:SetValue(8)
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsMB_OnUpdate(self, elapsed) 
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        local i = 1;
        local buffName, rank, _, count, _, duration, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
        while buffName do
            if (spellId == 79683) then
                MageNugMBProcFrame_CountText:SetText(count);
                mageProcMBTime = RoundOne(expirationTime - GetTime());
                MageNugMBProcFrame_ProcBar:SetValue(mageProcMBTime)
                MageNugMBProcFrameText2:SetText(mageProcMBTime)
                local position = (MageNugMBProcFrame_ProcBar:GetValue() / 20 * 120);
                MageNugMBProcFrame_ProcBarSpark:SetPoint("BOTTOMLEFT",MageNugMBProcFrame_ProcBar,"BOTTOMLEFT",position - 10,-6);
            end                
            i = i + 1;
            buffName, rank, _, count, _, duration, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
        end     
        if (mageProcMBTime <= 0.1) then
            MageNugMBProcFrame:Hide()
            MageNugMBProcFrame_ProcBar:SetValue(14)
        end
    self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsBF_OnUpdate(self, elapsed) 
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        if (mageProcBFTime >= 0) then
            mageProcBFTime = RoundOne(mageProcBFTime - 0.1);
            MageNugBFProcFrame_ProcBar:SetValue(mageProcBFTime)
            MageNugBFProcFrameText2:SetText(mageProcBFTime)
            local position = (MageNugBFProcFrame_ProcBar:GetValue() / 14 * 120);
            MageNugBFProcFrame_ProcBarSpark:SetPoint("BOTTOMLEFT",MageNugBFProcFrame_ProcBar,"BOTTOMLEFT",position - 10, -6);
            if (mageProcBFTime <= 0) then
                MageNugBFProcFrame:Hide()
                MageNugBFProcFrame_ProcBar:SetValue(15)
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end
--    
function MageNuggetsAB_OnUpdate(self, elapsed) 
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        
        local _, _, _, _, _, _, castTime, _, _ = GetSpellInfo(30451)
        MNabCast_FrameText:SetText(RoundThree(castTime * 0.001))
        abProgMonTime = 0;
        local i = 1;
        local buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HARMFUL");
        while buffName do
            if(spellId == 36032) then
                abStackCount = count;
                MageNugAB_FrameText:SetText("|cffFF00FF"..abStackCount)
                abProgMonTime = RoundOne(expirationTime - GetTime());
                if (MageNugz.ABSoundToggle == true) and (abStackCount == 4)then
                    if(soundPlayed == false) then
                        soundPlayed = true;
                        PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.ABSound);
                    end
                end
            end
            i = i + 1;
            buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HARMFUL");
        end    
        
        MageNugAB_Frame_ABBar:SetValue(abProgMonTime)
        MageNugAB_FrameText2:SetText("|cffFFFFFF"..abProgMonTime)
        if (abProgMonTime <= 0) then
            MageNugAB_Frame:Hide();
        end
    self.TimeSinceLastUpdate = 0;
    end   
end
-- 
function MageNuggetsClearCast_OnUpdate(self, elapsed) 
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        if (clearcastTime >= 0) then
            clearcastTime = RoundOne(clearcastTime - 0.1);
            MageNugClearcast_Frame_Bar:SetValue(clearcastTime)
            MageNugClearcast_FrameText2:SetText(clearcastTime)
            if (clearcastTime <= 0) then
                MageNugClearcast_Frame:Hide();
            end
        end    
    self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsCritMass_OnUpdate(self, elapsed)  
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 1.0) then   
        if(scorchTime >= 0) then
            scorchTime = scorchTime - 1;
            MNcritMass_FrameText:SetText(scorchTime)
            if(scorchTime <= 0) then
                MNcritMass_Frame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsMI_OnUpdate(self, elapsed) 
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 1.0) then   
        if (mirrorImageTime >= 0) then
            mirrorImageTime = mirrorImageTime - 1.0;
            MageNugMI_Frame_MIText1:SetText(" "..mirrorImageTime)
            MageNugMI_Frame_MiBar:SetValue(mirrorImageTime)
            if (mirrorImageTime <= 0) then
                MageNugMI_Frame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNugInvokers_OnUpdate(self, elapsed) --invokers energy monitor
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        local tempTime = 0;
        local standSpot = false;
        if(tierSix == "invokers") then
            standSpot = true;
            tierSixTime = 0;
            local i = 1;
            local buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
            while buffName do
                if(spellId == 116257) then
                    tempTime = RoundOne(expirationTime - GetTime());
                end
                i = i + 1;
                buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
            end    
        elseif(tierSix == "runeOfPower") then
            tempTime = (60 - RoundOne(GetTime() - tierSixTime));
            local i = 1;
            local buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
            while buffName do
                if(spellId == 116014) then
                    standSpot = true;
                end
                i = i + 1;
                buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
            end
        end
        
        if(((standSpot == false) and (tierSix == "runeOfPower") and (tempTime > 7)))then
            if(tierSixIconFlash > 5) then
                tierSixIconFlash = 0;
                MageNugInvokers_FrameTexture1:SetAlpha(0.3);
            else
                tierSixIconFlash = tierSixIconFlash + 1;
                MageNugInvokers_FrameTexture1:SetAlpha(1);
            end
        else
            MageNugInvokers_FrameTexture1:SetAlpha(1);
        end
        
        if (tempTime > 0.1) then
            MageNugInvokers_Frame_Bar_Text1:SetText(" "..tempTime);
            MageNugInvokers_Frame_Bar:SetValue(tempTime);
            local _, max = MageNugInvokers_Frame_Bar:GetMinMaxValues()
            local position = (MageNugInvokers_Frame_Bar:GetValue() / max * MageNugInvokers_Frame_Bar:GetWidth());
            MageNugInvokers_Frame_BarSpark:ClearAllPoints();
            MageNugInvokers_Frame_BarSpark:SetPoint("CENTER",MageNugInvokers_Frame_Bar,"LEFT",position + 1 ,0);
            
            if(tempTime < 7.0) then
               if(tierSixFlash > 5) then
                    tierSixFlash = 0;
                    MageNugInvokers_Frame:SetAlpha(0.3);
                else
                    tierSixFlash = tierSixFlash + 1;
                    MageNugInvokers_Frame:SetAlpha(1);
                end
            end
        elseif (tempTime <= 0.1) then
            MageNugInvokers_Frame_Bar_Text1:SetText("!")
            MageNugInvokers_Frame:SetAlpha(1);
        end
    self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsCauterize_OnUpdate(self, elapsed) 
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 1.0) then   
        if (cauterizeTime >= 0) then
            cauterizeTime = cauterizeTime - 1.0;
            MageNugCauterize_Frame_Text1:SetText(" "..cauterizeTime)
            MageNugCauterize_Frame_Bar:SetValue(cauterizeTime)
            if (cauterizeTime <= 0) then
                MageNugCauterize_Frame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsPoly_OnUpdate(self, elapsed) 
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 1.0) then   
        if (polyTimer >= 0) then
            polyTimer = RoundZero(polyTimer - 1.0);
            MageNugPolyFrameTimerText:SetText(polyTimer);
            MageNugPolyFrame_Bar:SetValue(polyTimer);
            if(polyTimer <= 0) then
                MageNugPolyFrame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end  
--  
function MNManaGem_OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.3) then   
        local count = 0;
        local startTime = 0; 
        local duration = 0; 
        local enable = 0;
        
        if(GetItemCount(81901, nil, true) ~= 0) then
            startTime, duration, enable = GetItemCooldown(81901);
            count = GetItemCount(81901, nil, true);
            MageNugManaGem_Frame_Text:SetText("|cffffffff"..count);
            managemCooldown = RoundZero(startTime + duration - GetTime());
        elseif(GetItemCount(36799, nil, true) ~= 0) then
            startTime, duration, enable = GetItemCooldown(36799);
            count = GetItemCount(36799, nil, true);
            MageNugManaGem_Frame_Text:SetText("|cffffffff"..count);
            managemCooldown = RoundZero(startTime + duration - GetTime());
        else
            startTime, duration, enable = GetItemCooldown(36799);
            managemCooldown = RoundZero(startTime + duration - GetTime());
            local randomNum = math.random(1,2)
            if(randomNum == 1) then 
                MageNugManaGem_Frame_Text:SetText("|cffFF0000"..count)
            elseif(randomNum == 2) then
                MageNugManaGem_Frame_Text:SetText("|cffffffff"..count)
            end
        end
        
        if (managemCooldown > 0) then
            MageNugManaGem_Frame_Text2:SetText("|cffffffff"..managemCooldown.."s")
            MageNugManaGem_Frame_Bar:SetValue(managemCooldown)
        else
            if(count == 0) then
                local randomNum2 = math.random(1,2)
                if(randomNum2 == 1) then 
                    MageNugManaGem_Frame_Text2:SetText("|cffffffffEMPTY")
                    MageNugManaGem_Frame_Bar:SetValue(120)
                elseif(randomNum2 == 2) then
                    MageNugManaGem_Frame_Text2:SetText("|cffff0000EMPTY")
                    MageNugManaGem_Frame_Bar:SetValue(0)
                end
            else
                MageNugManaGem_Frame_Text2:SetText("|cffffffffREADY")
                MageNugManaGem_Frame_Bar:SetValue(120)
            end
        end    
    self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsIcy_OnUpdate(self, elapsed) 
  self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 1.0) then   
        if (icyTimer >= 0) then
            icyTimer = icyTimer - 1.0;
            MNicyveins_FrameText:SetText(icyTimer);
            if(icyTimer <= 0) then
                MNicyveins_Frame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end  
--
function MageNuggetsGem_OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 1.0) then   
        if (impGemTimer >= 0) then
            impGemTimer = impGemTimer - 1.0;
            MNimpGem_Frame_Text:SetText(impGemTimer);
            if(impGemTimer <= 0) then
                MNimpGem_Frame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsLust_OnUpdate(self, elapsed) 
  self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 1.0) then   
        if (lustTimer >= 0) then
            lustTimer = lustTimer - 1.0;
            MNlust_FrameText:SetText(lustTimer);
            if(lustTimer <= 0) then
                MNlust_Frame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end  
--
function MageNuggetsShootingStars_OnUpdate(self, elapsed)
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        if (mageProcSSTime >= 0) then
            mageProcSSTime = RoundOne(mageProcSSTime - 0.1);
            MageNugSSProcFrame_ProcBar:SetValue(mageProcSSTime)
            MageNugSSProcFrameText2:SetText(mageProcSSTime)
            local position = (MageNugSSProcFrame_ProcBar:GetValue() / 8 * 120);
            MageNugSSProcFrame_ProcBarSpark:SetPoint("BOTTOMLEFT",MageNugSSProcFrame_ProcBar,"BOTTOMLEFT",position - 10,-6);
            if (mageProcSSTime <= 0.1) then
                MageNugSSProcFrame:Hide()
                MageNugSSProcFrame_ProcBar:SetValue(8)
            end
        end
    self.TimeSinceLastUpdate = 0;
    end
end       
--
function MageNuggetsArcaneP_OnUpdate(self, elapsed) 
  self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 1.0) then   
        if (apTimer >= 0) then
            apTimer = apTimer - 1.0;
            MNarcanepower_FrameText:SetText(apTimer);
            if(apTimer <= 0) then
                MNarcanepower_Frame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end  
--
function MageNuggetsFoF_OnUpdate(self, elapsed) 
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        if (fofProgMonTime >= 0) then
            local i = 1;
            local buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
            while buffName do
                if(spellId == 44544) then
                MageNugFoFProcFrameCountText:SetText("|cffffffff"..count)
                fofProgMonTime = RoundOne(expirationTime - GetTime());
                end
                i = i + 1;
                buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
            end
            MageNugFoFProcFrame_ProcBar:SetValue(fofProgMonTime)
            MageNugFoFProcFrameText2:SetText(fofProgMonTime)
            local position = (MageNugFoFProcFrame_ProcBar:GetValue() / 14 * 120);
            MageNugFoFProcFrame_ProcBarSpark:SetPoint("BOTTOMLEFT",MageNugFoFProcFrame_ProcBar,"BOTTOMLEFT",position - 10,-6);
            if (fofProgMonTime <= 0) then
                MageNugFoFProcFrame:Hide()
                MageNugFoFProcFrame_ProcBar:SetValue(14)
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end  
--
function MageNuggetsImpact_OnUpdate(self, elapsed) 
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        if (mageImpProgMonTime >= 0) then
            mageImpProgMonTime = RoundOne(mageImpProgMonTime - 0.1);
            MageNugImpactProcFrame_ProcBar:SetValue(mageImpProgMonTime)
            MageNugImpactProcFrameText2:SetText(mageImpProgMonTime)
            local position = (MageNugImpactProcFrame_ProcBar:GetValue() / 9 * 120);
            MageNugImpactProcFrame_ProcBarSpark:SetPoint("BOTTOMLEFT",MageNugImpactProcFrame_ProcBar,"BOTTOMLEFT",position - 10,-6);
            if (mageImpProgMonTime <= 0) then
                MageNugImpactProcFrame:Hide()
                MageNugImpactProcFrame_ProcBar:SetValue(9)        
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end  
--
function MageNuggetsSP_OnUpdate(self, elapsed) 
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
 if (self.TimeSinceLastUpdate > 1.0) then   
 
    local critRating = RoundCrit(GetSpellCritChance(3));
    local hasteRating = ((GetCombatRatingBonus(20)/100) + 1);
    local mastery = 0;
    local combustCount = 0;
    local masteryText = " "
    local adept = 0;
    local spellHit = RoundCrit(GetCombatRatingBonus(8));
    local meleeHit = RoundCrit(GetCombatRatingBonus(6));
    local meleeCrit = RoundCrit(GetCritChance());
    local expertise = RoundCrit(GetCombatRating(24) / 340);
    spellHit = spellHit + expertise;
    talentSpec = "damage";
    currentSpec = GetSpecialization();
    if(mnenglishClass == 'MAGE') then
        if(currentSpec == 1) then --arcane
            mastery = (((GetCombatRatingBonus(26)) * 2) + 16);
            adept = UnitMana("Player") / UnitManaMax("Player");
            mastery = RoundCrit(mastery * adept);
            masteryText = "|cff9966FFAdept";
        elseif(currentSpec == 2) then --fire
            mastery = (((GetCombatRatingBonus(26)) * 1.5) + 12);
            mastery = RoundCrit(mastery)
            masteryText = "|cffFF3300Burn";
        elseif(currentSpec == 3) then --frost
            mastery = (((GetCombatRatingBonus(26)) * 2) + 16);
            mastery = RoundCrit(mastery)
            masteryText = "|cff66CCFFBurn";
        end
    elseif(mnenglishClass == 'DRUID') then
        if (currentSpec == 1) then
            mastery = (((GetCombatRatingBonus(26)) * 1.875) + 15);
            mastery = RoundCrit(mastery)
            masteryText = "|cff33FF33T.E.";
            talentSpec = "damage";
        elseif (currentSpec == 2) then
            mastery = (((GetCombatRatingBonus(26)) * 3.1291) + 25.04);
            mastery = RoundCrit(mastery)
            masteryText = "|cffFF0005Claw";
            talentSpec = "melee";
        elseif (currentSpec == 3) then
            mastery = (((GetCombatRatingBonus(26)) * 1.25) + 10);
            mastery = RoundCrit(mastery)
            masteryText = "|cff33FF33Guard";
            talentSpec = "melee";
        elseif (currentSpec == 4) then
            mastery = (((GetCombatRatingBonus(26)) * 1.25) + 10);
            mastery = RoundCrit(mastery)
            masteryText = "|cff33FF33Harm";
            talentSpec = "healer";
        end
    elseif(mnenglishClass == 'PRIEST') then
        if (currentSpec == 1) then
            mastery = (((GetCombatRatingBonus(26)) * 2.5) + 20);
            mastery = RoundCrit(mastery)
            masteryText = "|cffFFFFFFShld";
            talentSpec = "healer";
        elseif (currentSpec == 2) then
            mastery = (((GetCombatRatingBonus(26)) * 1.25) + 10);
            mastery = RoundCrit(mastery)
            masteryText = "|cffFFFFFFEcho";
            talentSpec = "healer";
        elseif (currentSpec == 3) then
            mastery = (((GetCombatRatingBonus(26)) * 1.8) + 14.4);
            mastery = RoundCrit(mastery)
            masteryText = "|cffFFFFFFShdw";
            talentSpec = "damage";
        end
    elseif(mnenglishClass == 'WARLOCK') then
        if (currentSpec == 1) then
            mastery = (((GetCombatRatingBonus(26)) * 3.1) + 24.80);
            mastery = RoundCrit(mastery)
            masteryText = "|cffFFFFFFP.A.";
        elseif (currentSpec == 2) then
            mastery = (((GetCombatRatingBonus(26)) * 1) + 8);
            mastery = RoundCrit(mastery)
            masteryText = "|cffFFFFFFMast";
        elseif (currentSpec == 3) then
            mastery = (((GetCombatRatingBonus(26)) * 3) + 24);
            mastery = RoundCrit(mastery)
            masteryText = "|cffFFFFFFStorm";
        end
    elseif(mnenglishClass == 'SHAMAN') then
        if (currentSpec == 1) then
            mastery = (((GetCombatRatingBonus(26)) * 2) + 16);
            mastery = RoundCrit(mastery)
            masteryText = "|cff33FF33E.O.";
            talentSpec = "damage";
            hasteRating = (hasteRating*1.05);
        elseif (currentSpec == 2) then
            mastery = (((GetCombatRatingBonus(26)) * 2) + 16);
            mastery = RoundCrit(mastery)
            masteryText = "|cffFF06FFE.E.";
            talentSpec = "melee";
        elseif (currentSpec == 3) then
            mastery = (((GetCombatRatingBonus(26)) * 3) + 24);
            mastery = RoundCrit(mastery)
            masteryText = "|cff33FF33D.H.";
            talentSpec = "healer";
        end
    else
        masteryText = "|cffFFFFFFMstry";
        mastery = 0;
    
    end
    
    local mnRace = UnitRace("player");
    local j = 1;
    local jj = 1;
    local h = 1;
    local combName, combRank, _, combCount, _, _, _, _, _, _, combspellId = UnitAura("target", h, "PLAYER|HARMFUL");
    while combName do
        if (MageNugz.buffmonToggle == false) then
            if (combstRank == 1) then
                if(combspellId == 44457) then
                    combustCount = combustCount + 1;
                    MNcombust_FrameText:SetText(combustCount)
                    MNcombust_Frame:Show();            
                end
                if(combspellId == 12654) then
                    combustCount = combustCount + 1;
                    MNcombust_FrameText:SetText(combustCount)
                    MNcombust_Frame:Show();            
                end
                if(combspellId == 44614) then
                    combustCount = combustCount + 1;
                    MNcombust_FrameText:SetText(combustCount)
                    MNcombust_Frame:Show();            
                end
                if(combspellId == 11366) then
                    combustCount = combustCount + 1;
                    MNcombust_FrameText:SetText(combustCount)
                    MNcombust_Frame:Show();            
                end
                if(combspellId == 92315) then --pyroblast!
                    combustCount = combustCount + 1;
                    MNcombust_FrameText:SetText(combustCount)
                    MNcombust_Frame:Show();            
                end
                if(combspellId == 83853) then --combustion
                    combustCount = combustCount + 1;
                    MNcombust_FrameText:SetText(combustCount)
                    MNcombust_Frame:Show();            
                end
            end
        end
        h = h + 1;
        combName, combRank, _, combCount, _, _, _, _, _, _, combspellId = UnitAura("target", h, "PLAYER|HARMFUL");
    end 
    if (combustCount == 0) then
        MNcombust_Frame:Hide();
    end
    
    -- Player helpful
    local buffName2, rank2, _, count2, _, _, _, _, _, _, spellId2 = UnitAura("player", jj, "HELPFUL");
    while buffName2 do
        if(spellId2 == 7302) then --Frost Armor 7% haste
            hasteRating = (hasteRating*1.07);
        end
        
        if(talentSpec == "damage") then
            if(mnenglishClass ~= 'SHAMAN') and (mnenglishClass ~= 'DRUID') and (mnenglishClass ~= 'PRIEST')then
                if(spellId2 == 49868) then --Mind Quickening
                    hasteRating = (hasteRating*1.05);
                end
                if(spellId2 == 51470) then --elemental oath 5% haste
                    hasteRating = (hasteRating*1.05);
                end
                if(spellId2 == 16886) then -- natures grace 15% haste
                    hasteRating = (hasteRating*1.15);
                end
            end
        end
        if(spellId2 == 28878) then -- heroic pres
            spellHit = spellHit + 1;
        end
        if(spellId2 == 6562) then --heroic pres
            spellHit = spellHit + 1;
        end
        if(spellId2 == 137590) then --legendary caster meta
            hasteRating = (hasteRating*1.30);
        end
            
            if(spellId2 == 10060) then --power infusion
                hasteRating = (hasteRating*1.20);
            end
            if(spellId2 == 70753) then --pushing the limit
                hasteRating = (hasteRating*1.12);
            end
            if(spellId2 == 24907) then --Moonkin Aura
                hasteRating = (hasteRating*1.05);
            end
            if(spellId2 == 26297) then --berserking
                hasteRating = (hasteRating*1.20);
            end
            if(spellId2 == 12472) then --icy veins
                hasteRating = (hasteRating*1.20);
            end
            if(spellId2 == 2825) then --bloodlust
                hasteRating = (hasteRating*1.30);
            end
            if(spellId2 == 65980) then --bloodlust argent turny
                hasteRating = (hasteRating*1.30);
            end
            if(spellId2 == 32182) then --heroism
                hasteRating = (hasteRating*1.30);
            end
            if(spellId2 == 65983) then --heroism argent turny
                hasteRating = (hasteRating*1.30);
            end
            jj = jj + 1;
            buffName2, rank2, _, count2, _, _, _, _, _, _, spellId2 = UnitAura("player", jj, "HELPFUL");
        end 
   
        local race, raceEn = UnitRace("player");
        if(raceEn == "Draenei") then
            spellHit = spellHit + 1;
        end
        if(mnRace == "Goblin") then
            hasteRating = (hasteRating*1.01);
        end 
        if(spellHit >= 15.0) then
            spellHit = "capped";
        else
            spellHit = spellHit.."%";
        end
        hasteRating = RoundCrit((hasteRating - 1)*100)
        local regenbase, regencasting = GetManaRegen();
        if(talentSpec == "damage")then
            MageNugSP_FrameText:SetText("|cffFF0000SP:|cffFFFFFF"..GetSpellBonusDamage(3).."\n|cffFF6600Crit:|cffFFFFFF"..critRating.."%".."\n|cffCC33FFHaste:|cffFFFFFF"..hasteRating.."%".."\n|cffFFFF33 Hit:|cffFFFFFF"..spellHit.."\n"..masteryText..":|cffFFFFFF"..mastery.."%");
        elseif(talentSpec == "melee")then
            local base, posBuff, negBuff = UnitAttackPower("player");
            MageNugSP_FrameText:SetText("|cffFF0000AP:|cffFFFFFF"..base.."\n|cffFF6600Crit:|cffFFFFFF"..meleeCrit.."%".."\n|cffCC33FFHaste:|cffFFFFFF"..hasteRating.."%".."\n|cffFFFF33 Hit:|cffFFFFFF"..meleeHit.."\n"..masteryText..":|cffFFFFFF"..mastery.."%");
        else
            if(incombat == 1) then    
                MageNugSP_FrameText:SetText("|cffFF0000SP:|cffFFFFFF"..GetSpellBonusDamage(3).."\n|cffFF6600Crit:|cffFFFFFF"..critRating.."%".."\n|cffCC33FFHaste:|cffFFFFFF"..hasteRating.."%".."\n|cffFFFF33 Regen:|cffFFFFFF"..RoundZero(regencasting*5).."\n"..masteryText..":|cffFFFFFF"..mastery.."%");
            else
                MageNugSP_FrameText:SetText("|cffFF0000SP:|cffFFFFFF"..GetSpellBonusDamage(3).."\n|cffFF6600Crit:|cffFFFFFF"..critRating.."%".."\n|cffCC33FFHaste:|cffFFFFFF"..hasteRating.."%".."\n|cffFFFF33 Regen:|cffFFFFFF"..RoundZero(regenbase*5).."\n"..masteryText..":|cffFFFFFF"..mastery.."%");
            end
        end
    self.TimeSinceLastUpdate = 0;
 
   end
end   


function MageNuggets_OnEvent(this, event, ...)
    local argin1, argin2, argin3, argin4, _, argin6 = ...
    if (event == "ADDON_LOADED") then
        if(argin1 == "MageNuggets") then
            MNVariablesLoaded_OnEvent();
            MageNugz_SetFrame_Positions();
            MageNuggetsLB_Prep();
        end
    end  
    if (event == "PLAYER_TALENT_UPDATE") then
       MNBombMonitorDress();
    end
    if (event == "ACTIVE_TALENT_GROUP_CHANGED") then
        MageNugCD1_Frame_Bar:SetValue(0);
        MageNugCD1_Frame:Hide();
        MageNugCD2_Frame_Bar:SetValue(0);
        MageNugCD2_Frame:Hide();
        MageNugCD3_Frame_Bar:SetValue(0);
        MageNugCD3_Frame:Hide();
        MageNugCD4_Frame_Bar:SetValue(0);
        MageNugCD4_Frame:Hide();
        MageNugCD5_Frame_Bar:SetValue(0);
        MageNugCD5_Frame:Hide();
        MageNugCD6_Frame_Bar:SetValue(0);
        MageNugCD6_Frame:Hide();
        if(mnenglishClass == 'DRUID') then
            currentSpec = GetSpecialization();
            if(currentSpec ~= 1) then
                MageNugMoonkinOptionFrame_CheckButton:SetChecked(1);
                MageNugz.moonkinTog = true;
                MageNugMoonkin_Frame:Hide()
                MNmoonFire_Frame:Hide()
                MNinsectSwarm_Frame:Hide()
                MNstarSurge_Frame:Hide()
            else
                if(MageNugz.moonkinBoxTog == true)then
                    if(MageNugz.moonkinTog == true) then
                        MageNugMoonkinToggle_Frame:Show();
                    end
                end
            end
        end
    end
     if (event == "CONFIRM_TALENT_WIPE") then
        MageNugCD1_Frame_Bar:SetValue(0);
        MageNugCD1_Frame:Hide();
        MageNugCD2_Frame_Bar:SetValue(0);
        MageNugCD2_Frame:Hide();
        MageNugCD3_Frame_Bar:SetValue(0);
        MageNugCD3_Frame:Hide();
        MageNugCD4_Frame_Bar:SetValue(0);
        MageNugCD4_Frame:Hide();
        MageNugCD5_Frame_Bar:SetValue(0);
        MageNugCD5_Frame:Hide();
        MageNugCD6_Frame_Bar:SetValue(0);
        MageNugCD6_Frame:Hide();
    end
    if (event == "PLAYER_LOGOUT") then       
        MageNugz_SaveFrame_Position();
    end
    if (event == "PLAYER_REGEN_ENABLED") then       
        incombat = 0;
        --MageNugInvokers_Frame:Hide();
        if(mnenglishClass == 'DRUID') or (mnenglishClass == 'MAGE') then
            MageNugCD_Frame_Text:SetText(" ")
        end
        if (MageNugz.spMonitorToggle == false) then
            if (MageNugz.spCombatToggle == true) then
                MageNugSP_Frame:Hide();
            end
        end    
        if (MageNugz.moonkinTog == false) then
            if (MageNugz.moonkinCombat == true) then
                MageNugMoonkin_Frame:Hide();
                MNmoonFire_Frame:Hide()
                MNinsectSwarm_Frame:Hide()
                MNstarSurge_Frame:Hide()
            end
        end
        if(MageNugz.managemToggle == true) then
            if(MageNugz.mgCombatTog == true) then
                MageNugManaGem_Frame:Hide();
            end
        end        
        MageNugCastInsectFrame:Hide();
        MageNugCastMoonFrame:Hide();
        MageNugCastStarsurgeFrame:Hide();
    end
    if (event == "PLAYER_REGEN_DISABLED") then       
        incombat = 1;
        if(mnenglishClass == 'DRUID') or (mnenglishClass == 'MAGE') then
            MageNugCD_Frame_Text:SetText("c o o l d o w n s")
        end
     
        if (MageNugz.spMonitorToggle == false) then
            if (MageNugz.spCombatToggle == true) then
                MageNugSP_Frame:Show();
            end
        end
        if (MageNugz.moonkinTog == false) then
            if (MageNugz.moonkinCombat == true) then
                MageNugMoonkin_Frame:Show();
                MNmoonFire_Frame:Show()
                MNinsectSwarm_Frame:Show()
                MNstarSurge_Frame:Show()
            end
        end
        if(MageNugz.managemToggle == true) then
            if(MageNugz.mgCombatTog == true) then
                MageNugManaGem_Frame:Show();
            end
        end
        if(mnenglishClass == 'MAGE') and (MageNugz.mageArmorToggle == true) then
        local i1 = 1; 
        local isMageArmorOn = false;
        local buffNamei1, _, _, _, _, _, _, _, _, _, spellIdi1 = UnitAura("player", i1, "HELPFUL");
        while buffNamei1 do
            if(spellIdi1 == 7302) or (spellIdi1 == 6117) or (spellIdi1 == 30482) then
                isMageArmorOn = true;
            end
            i1 = i1 + 1;
            buffNamei1, _, _, _, _, _, _, _, _, _, spellIdi1 = UnitAura("player", i1, "HELPFUL");
        end
        if (isMageArmorOn == false) then
            if(combatTextCvar == '1') then
                if (MageNugz.mageProcToggle == true) then
                    CombatText_AddMessage("BUFF MISSING: Mage Armor!", CombatText_StandardScroll, 1.0, 0, 0, "crit", isStaggered, nil);
			    end
            end
            if (MageNugz.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."BUFF MISSING: Mage Armor!")
            end
        end
        end
    end  
    if (event == "CVAR_UPDATE") then
        combatTextCvar = GetCVar("enableCombatText")
    end
    if (event == "PLAYER_ENTERING_WORLD") then
        MageNugHordeFrame:Hide();
        MageNugAlliFrame:Hide();
        MageNugz_SaveFrame_Position();
    end
    if (event == "PLAYER_UPDATE_RESTING") then
        MageNugHordeFrame:Hide();
        MageNugAlliFrame:Hide();
    end
    if (event == "COMBAT_LOG_EVENT_UNFILTERED")then   
        local timestamp, event1, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName = select(1, ...) 
        local arg, spellName, spellSchool, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 = select(12, ...) 
        
        --if((sourceName == UnitName("player")) or (destName == UnitName("player"))) then
         --  DEFAULT_CHAT_FRAME:AddMessage(arg.." "..event1);
       -- end
        
        if((event1 == "SPELL_DAMAGE") and (sourceName == UnitName("player")))then
            if (arg == 30451)then
                if(abStackCount == 3) then
                    abStackCount2 = 3;
                end
                if(abStackCount == 4) then
                    if(abStackCount2 ~= nil) then
                        abStackCount2 = abStackCount2 + 1;
                        MageNugAB_FrameText1:SetText("|cffFF0000"..abStackCount2)
                    end
                end 
            end
        end
        --
        if (event1 == "SPELL_DISPEL") and (sourceName == UnitName("player")) then
            if (MageNugz.ssMonitorToggle == true) then
                if(combatTextCvar == '1') then
                    CombatText_AddMessage("Dispelled"..":"..GetSpellLink(arg5), CombatText_StandardScroll, 0.10, 0, 1, "sticky", nil);
                end
                if (MageNugz.consoleTextEnabled == true) then
                    DEFAULT_CHAT_FRAME:AddMessage("|cffFFFFFF".."Dispelled "..GetSpellLink(arg5).." From "..destName)
	    	    end
            end
        end
        if (event1 == "SPELL_AURA_REFRESH") and (sourceName == UnitName("player")) then
            if (arg == 16870) then
                if (MageNugz.clearcastToggle == true) then
                    if(combatTextCvar == '1') then    
                        CombatText_AddMessage("Clearcast", CombatText_StandardScroll, 1, 1, 1, nil, isStaggered, nil);
                    end    
                    clearcastTime = 8;
                    MageNugClearcast_Frame:Show();
                end
            end
            if(arg == 48108) then --Hot Streak!
                if(MageNugz.procMonitorToggle == true) then
                    mageProcHSTime = 14;
                    MageNugProcFrameText:SetText("|cffFF0000".."HOT STREAK!")
                    MageNugProcFrame_ProcBar:SetValue(mageProcHSTime)
                    MageNugProcFrame:Show()
                end
                if(combatTextCvar == '1') then
                    if (MageNugz.mageProcToggle == true) then
                        CombatText_AddMessage("HOT STREAK!", CombatText_StandardScroll, 1, 0.10, 0, "crit", isStaggered,nil);
			        end
                end
                if (MageNugz.hsSoundToggle == true) then
                    PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.hsSound)
                end
            end  
            if(arg == 57761) then --Brain Freeze
                if(MageNugz.procMonitorToggle == true) then
                    mageProcBFTime = 14;     
                    MageNugBFProcFrameText:SetText("|cffFF3300".."BRAIN FREEZE!")
                    MageNugBFProcFrame_ProcBar:SetValue(mageProcBFTime)
                    MageNugBFProcFrame:Show()
                end
                if(combatTextCvar == '1') then
                    if (MageNugz.mageProcToggle == true) then
                        CombatText_AddMessage("BRAIN FREEZE!", CombatText_StandardScroll, 1, 0.20, 0, "crit", isStaggered);
			        end
                end
                if (MageNugz.brainfreezeSoundToggle == true) then
                   PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.brainfreezeSound)
                end
            end  
            if(arg == 44457) then -- living bomb
                if (MageNugz.livingBombToggle == true) then
                    _, _, _, _, _, _, lbrefreshexpTime, unitCaster, _, _, _ = UnitAura("target", livingBombId, nil,"PLAYER|HARMFUL")
                    livingbombGlobalTime = 20;
                    local currentTargetGuid = UnitGUID("target");
                    if(destGUID == currentTargetGuid) then
                        if(lbrefreshexpTime ~= nil) then
                            MNRefreshBomb(destGUID, lbrefreshexpTime);
                        end
                    else
                        MNRefreshBomb(destGUID, GetTime() + 12);
                    end   
                end
            end
            if(arg == 114923) then -- nether tempest
                if (MageNugz.livingBombToggle == true) then
                    _, _, _, _, _, _, lbrefreshexpTime, unitCaster, _, _, _ = UnitAura("target", netherTempestId, nil,"PLAYER|HARMFUL")
                    livingbombGlobalTime = 20;
                    local currentTargetGuid = UnitGUID("target");
                    if(destGUID == currentTargetGuid) then
                        if(lbrefreshexpTime ~= nil) then
                            MNRefreshBomb(destGUID, lbrefreshexpTime);
                        end
                    else
                        MNRefreshBomb(destGUID, GetTime() + 12);
                    end
                end
            end
            if(arg == 44544) then --Fingers of Frost
                if(MageNugz.procMonitorToggle == true) then
                    fofProgMonTime = 14;
                    MageNugFoFProcFrameText:SetText("|cffFFFFFF".."Fingers Of Frost")
                    MageNugFoFProcFrame_ProcBar:SetValue(fofProgMonTime)
                    MageNugFoFProcFrame:Show()
                end
                if(combatTextCvar == '1') then
                    if (MageNugz.mageProcToggle == true) then
                       CombatText_AddMessage("Fingers Of Frost", CombatText_StandardScroll, 1, 1, 1, "crit", 1);
			        end
                end
                if (MageNugz.fofSoundToggle == true) then
                   PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.fofSound)
                end
            end  
            if (MageNugz.polyToggle == true) then
                 
                 
                 if (arg == 115078) then -- Paralysis
                    _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", paralysisId, nil,"PLAYER|HARMFUL")
                    if(polyExpTime ~= nil) then
                        polyTimer = RoundZero(polyExpTime - GetTime());
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Paralysis "..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\ability_monk_paralysis");
                        MageNugPolyFrame:Show();
                    else
                        polyTimer = 40;
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Paralysis "..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\ability_monk_paralysis");
                        MageNugPolyFrame:Show();
                    end
                end
                 
                 if (arg == 9484) then -- shackle
                    _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", shackleId, nil,"PLAYER|HARMFUL")
                    if(polyExpTime ~= nil) then
                        polyTimer = RoundZero(polyExpTime - GetTime());
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Shackle "..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_nature_slow");
                        MageNugPolyFrame:Show();
                    else
                        polyTimer = 50;
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Shackle "..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_nature_slow");
                        MageNugPolyFrame:Show();
                    end
                end           
                if (arg == 2637) then -- hibernate
                    _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyPigId, nil,"PLAYER|HARMFUL")
                    if(polyExpTime ~= nil) then
                        polyTimer = RoundZero(polyExpTime - GetTime());
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Hibernate"..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_nature_sleep");
                        MageNugPolyFrame:Show();
                    else
                        polyTimer = 40;
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Hibernate"..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_nature_sleep");
                        MageNugPolyFrame:Show();
                    end
                end                
                if (arg == 51514) then -- hex
                    _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyPigId, nil,"PLAYER|HARMFUL")
                    if(polyExpTime ~= nil) then
                        polyTimer = RoundZero(polyExpTime - GetTime());
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Hex"..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_shaman_hex");
                        MageNugPolyFrame:Show();
                    else
                        polyTimer = 60;
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Hex"..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_shaman_hex");
                        MageNugPolyFrame:Show();
                    end
                end                
                if (arg == 28272) then -- pig
                    _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyPigId, nil,"PLAYER|HARMFUL")
                    if(polyExpTime ~= nil) then
                        polyTimer = RoundZero(polyExpTime - GetTime());
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_magic_polymorphpig");
                        MageNugPolyFrame:Show();
                    else
                        polyTimer = 50;
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_magic_polymorphpig");
                        MageNugPolyFrame:Show();
                    end
                end
                if (arg == 61305) then -- cat
                    _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyCatId, nil,"PLAYER|HARMFUL")
                    if(polyExpTime ~= nil) then
                        polyTimer = RoundZero(polyExpTime - GetTime());
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Achievement_halloween_cat_01");
                        MageNugPolyFrame:Show();
                    else
                        polyTimer = 50;
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Achievement_halloween_cat_01");
                        MageNugPolyFrame:Show();
                    end
                end
                if (arg == 61721) then -- rabbit
                    _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyRabbitId, nil,"PLAYER|HARMFUL")
                    if(polyExpTime ~= nil) then
                        polyTimer = RoundZero(polyExpTime - GetTime());
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_magic_polymorphrabbit");
                        MageNugPolyFrame:Show();
                    else
                        polyTimer = 50;
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_magic_polymorphrabbit");
                        MageNugPolyFrame:Show();
                    end
                end
                if (arg == 28271) then -- turtle
                    _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyTurtleId, nil,"PLAYER|HARMFUL")
                    if(polyExpTime ~= nil) then
                        polyTimer = RoundZero(polyExpTime - GetTime());
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Ability_hunter_pet_turtle");
                        MageNugPolyFrame:Show();
                    else
                        polyTimer = 50;
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Ability_hunter_pet_turtle");
                        MageNugPolyFrame:Show();
                    end
                end
                if (arg == 118)  then  --sheep
                    _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polySheepId, nil,"PLAYER|HARMFUL")
                    if(polyExpTime ~= nil) then
                        polyTimer = RoundZero(polyExpTime - GetTime());
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_nature_polymorph");
                        MageNugPolyFrame:Show();
                    else
                        polyTimer = 50;
                        MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                        MageNugPolyFrameTimerText:SetText(polyTimer);
                        MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                        MageNugPolyFrame_Bar:SetValue(polyTimer);
                        MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_nature_polymorph");
                        MageNugPolyFrame:Show();
                    end
                end
            end            
        end
        --
        if (event1 == "SPELL_CAST_SUCCESS") and (sourceName == UnitName("pet"))then 
            if(arg == 33395)then
                if (MageNugz.frzCooldown == true) then
                    freezeId, _, _, _, _, _, _, _, _ = GetSpellInfo(33395);
                    MNcooldownMonitor(freezeId, 25, "Interface\\Icons\\spell_frost_frostnova")
                end
            end
        end
        if (event1 == "SPELL_SUMMON") and (sourceName == UnitName("player")) then
            if (arg == 84714) then -- frozen orb
                --if (MageNugz.cbCooldown == true) then
                    local fostart, foduration, foenabled = GetSpellCooldown(84714);
                    local foTime = RoundOne(fostart + foduration - GetTime())       
                    frozenOrbID, _, _, _, _, _, _, _, _ = GetSpellInfo(84714);
                    MNcooldownMonitor(frozenOrbID, foTime, "Interface\\Icons\\spell_frost_frozenorb")
                --end
            end
            if (arg == 82676) then -- ring of frost
                --if (MageNugz.cbCooldown == true) then
                    local rfstart, rfduration, rfenabled = GetSpellCooldown(82676);
                    local rfTime = RoundOne(rfstart + rfduration - GetTime())       
                    ringfrostID, _, _, _, _, _, _, _, _ = GetSpellInfo(82676);
                    MNcooldownMonitor(ringfrostID, rfTime, "Interface\\Icons\\spell_frost_frozencore")
                --end
            end
            if (arg == 116011) then -- rune of power
                --if (MageNugz.cbCooldown == true) then
                    tierSixTime = GetTime();
                    tierSix = "runeOfPower"
                    MageNugInvokers_FrameTexture1:SetAlpha(1);
                    MageNugInvokers_Frame:SetAlpha(1);
                    MageNugInvokers_Frame_Bar:SetMinMaxValues(0,60);
                    MageNugInvokers_Frame_Bar_Text:SetText("Rune Of Power");
                    MageNugInvokers_FrameTexture1:SetTexture("Interface\\Icons\\spell_mage_runeofpower");
                --end
            end
            
            
        end
        if (event1 == "SPELL_CAST_SUCCESS") and (sourceName == UnitName("player"))then 
            if (arg == 111264) then -- ice ward
                --if (MageNugz.cbCooldown == true) then
                    iceWardID, _, _, _, _, _, _, _, _ = GetSpellInfo(111264);
                    MNcooldownMonitor(iceWardID, 20, "Interface\\Icons\\spell_frost_frostward")
                --end
            end
            if (arg == 33831) then
                if (MageNugz.treantCooldown == true) then
                    treantId, _, _, _, _, _, _, _, _ = GetSpellInfo(33831);
                    MNcooldownMonitor(treantId, 180, "Interface\\Icons\\ability_druid_forceofnature")
                end
                if (MageNugz.treantSoundTog == true) then
                    PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.treantSound)
                end
            end
            if (arg == 1953) then -- blink
                if (MageNugz.blinkCooldown == true) then
                    start, duration, enabled = GetSpellCooldown(1953);
                    blinkId, _, _, _, _, _, _, _, _ = GetSpellInfo(1953);
                    MNcooldownMonitor(blinkId, 15, "Interface\\Icons\\spell_arcane_blink")
                end         
            end
            if (arg == 11426) then -- ice barrier
                if (MageNugz.ibrCooldown == true) then
                    start, duration, enabled = GetSpellCooldown(11426);
                    icebarrierId, _, _, _, _, _, _, _, _ = GetSpellInfo(11426);
                    MNcooldownMonitor(icebarrierId, 24, "Interface\\Icons\\spell_ice_lament")
                end         
            end
            if (arg == 1463) then -- mana shield
                --if (MageNugz.cbCooldown == true) then
                    manashieldId, _, _, _, _, _, _, _, _ = GetSpellInfo(1463);
                    MNcooldownMonitor(manashieldId, 12, "Interface\\Icons\\spell_shadow_detectlesserinvisibility")
                --end
            end
            if (arg == 543) then -- mage ward
                --if (MageNugz.cbCooldown == true) then
                    wardId, _, _, _, _, _, _, _, _ = GetSpellInfo(543);
                    MNcooldownMonitor(wardId, 30, "Interface\\Icons\\spell_fire_twilightfireward")
                --end
            end
            if (arg == 122) then -- frost nova
                --if (MageNugz.cbCooldown == true) then
                    frostnovaId, _, _, _, _, _, _, _, _ = GetSpellInfo(122);
                    MNcooldownMonitor(frostnovaId, 25, "Interface\\Icons\\spell_frost_frostnova")
                --end
            end
            if (arg == 120) then -- cone of cold
                --if (MageNugz.cbCooldown == true) then
                    coneofcoldId, _, _, _, _, _, _, _, _ = GetSpellInfo(120);
                    MNcooldownMonitor(coneofcoldId, 10, "Interface\\Icons\\spell_frost_glacier")
                --end
            end
            if (arg == 45438) then -- Ice Block
                --if (MageNugz.cbCooldown == true) then
                    local ibstart, ibduration, ibenabled = GetSpellCooldown(78674);
                        local ibTime = RoundOne(ibstart + ibduration - GetTime())       
                    iceblockId, _, _, _, _, _, _, _, _ = GetSpellInfo(45438);
                    MNcooldownMonitor(iceblockId, ibTime, "Interface\\Icons\\spell_frost_frost")
                --end
            end
            if (arg == 82731) then -- Flame Orb
                --if (MageNugz.cbCooldown == true) then
                    flameOrbId, _, _, _, _, _, _, _, _ = GetSpellInfo(82731);
                    MNcooldownMonitor(flameOrbId, 60, "Interface\\Icons\\spell_mage_flameorb")
                --end
            end
            if (arg == 11129) then -- Combustion
                if (MageNugz.cbCooldown == true) then
                    combustionId, _, _, _, _, _, _, _, _ = GetSpellInfo(11129);
                    MNcooldownMonitor(combustionId, 120, "Interface\\Icons\\spell_fire_sealoffire")
                end
            end
            if (arg == 31661) then -- Dragons Breath
                if (MageNugz.dbCooldown == true) then
                    dragonsbreathId, _, _, _, _, _, _, _, _ = GetSpellInfo(31661);
                    MNcooldownMonitor(dragonsbreathId, 20, "Interface\\Icons\\inv_misc_head_dragon_01")
                end
            end
            if (arg == 11113) then -- blastwave
                if (MageNugz.bwCooldown == true) then
                    blastwaveId, _, _, _, _, _, _, _, _ = GetSpellInfo(11113);
                    MNcooldownMonitor(blastwaveId, 15, "Interface\\Icons\\spell_holy_excorcism_02")
                end
            end
            if (arg == 44572) then -- deep freeze
                if (MageNugz.dfCooldown == true) then
                    deepfreezeId, _, _, _, _, _, _, _, _ = GetSpellInfo(44572);
                    MNcooldownMonitor(deepfreezeId, 30, "Interface\\Icons\\ability_mage_deepfreeze")
                end
            end
            if (arg == 5405) then -- mana gem
                managemCooldown = 120;  
            end
            if (arg == 2139) then -- Counterspell
                if(MageNugz.csCooldown == true) then
                    counterspellId, _, _, _, _, _, _, _, _ = GetSpellInfo(2139);
                    MNcooldownMonitor(counterspellId, 24, "Interface\\Icons\\spell_frost_iceshock")
                end
            end
            if (arg == 8921) then
                moonfireTime = 18;
            end
            if (arg == 93402) then
                insectTime = 18;
            end
            if (arg == 78674) then
                starsurgeTime = 16.5;
            end
        end
        --
        if event1 == "SPELL_AURA_REMOVED" then 
            if sourceName == UnitName("player") then
                if(arg == 116257) then -- invokers energy
                    if(MageNugz.invokersToggle == false) then
                        if (MageNugz.consoleTextEnabled == true) then
                            DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."INVOKER'S ENERGY FADES!");
                        end
                        if(combatTextCvar == '1') then
                            CombatText_AddMessage("EVOCATE!", CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);  
                        end
                    end
                end
                if(arg == 110909) then -- alter time
                    start, duration, enabled = GetSpellCooldown(108978);
                    alterTimeId, _, _, _, _, _, _, _, _ = GetSpellInfo(108978);
                    MNcooldownMonitor(alterTimeId, RoundZero(start + duration - GetTime()), "Interface\\Icons\\spell_mage_altertime")
                end
                
                if (arg == 48107) then -- heating up
                    MageNugProcHUFrame:Hide();
                end
                if(arg == 57761) then
                    MageNugBFProcFrame:Hide()
                end
                if(arg == 44544) then
                    MageNugFoFProcFrame:Hide()
                end
                if(arg == 93400) then -- Shooting Stars
                   MageNugSSProcFrame:Hide()
                end
                if(arg == 79683) then
                    MageNugMBProcFrame:Hide();
                end
                if (arg == 64343) then
                    MageNugImpactProcFrame:Hide();
                end
                if(arg == 48108) then
                    MageNugProcFrame:Hide();
                end
                if(arg == 22959) then
                    MNcritMass_Frame:Hide();
                end
                if (arg == 36032) then -- arcane charge
                    abStackCount = 0;
                    abStackCount2 = 0;
                    MageNugAB_Frame:Hide();
                    MageNugAB_FrameText1:SetText(" ")
                    soundPlayed = false;
                end
                if (arg == 48505) then
                    if (MageNugz.starfallCooldown == true) then
                        start, duration, enabled = GetSpellCooldown(48505);
                        starFallId, _, _, _, _, _, _, _, _ = GetSpellInfo(48505);
                        MNcooldownMonitor(starFallId, RoundZero(start + duration - GetTime()), "Interface\\Icons\\ability_druid_starfall")
                    end
                end
                if (arg == 12051) then
                    if (MageNugz.evoCooldown == true) then
                        start, duration, enabled = GetSpellCooldown(12051);
                        evocateId, _, _, _, _, _, _, _, _ = GetSpellInfo(12051);
                        MNcooldownMonitor(evocateId, RoundZero(start + duration - GetTime()), "Interface\\Icons\\spell_nature_purge")
                    end
                end
                
                if (arg == 131078) then --icy veins
                    if (MageNugz.ivCooldown == true) then
                        start, duration, enabled = GetSpellCooldown(131078);
                        icyveinsId, _, _, _, _, _, _, _, _ = GetSpellInfo(131078);
                        MNcooldownMonitor(icyveinsId, RoundZero(start + duration - GetTime()), "Interface\\Icons\\Spell_frost_coldhearted")
                    end    
                end
                if (arg == 12472) then --icy veins
                    if (MageNugz.ivCooldown == true) then
                        start, duration, enabled = GetSpellCooldown(12472);
                        icyveinsId, _, _, _, _, _, _, _, _ = GetSpellInfo(12472);
                        MNcooldownMonitor(icyveinsId, RoundZero(start + duration - GetTime()), "Interface\\Icons\\Spell_frost_coldhearted")
                    end    
                end
                if (arg == 12042) then
                    if (MageNugz.apCooldown == true) then
                        start, duration, enabled = GetSpellCooldown(12042);
                        arcanePowerId, _, _, _, _, _, _, _, _ = GetSpellInfo(12042);
                        MNcooldownMonitor(arcanePowerId, RoundZero(start + duration - GetTime()), "Interface\\Icons\\spell_nature_lightning")
                    end    
                end
                if (arg == 11426) then
                    if (MageNugz.ibrCooldown == true) then
                        start, duration, enabled = GetSpellCooldown(11426);
                        icebarrierId, _, _, _, _, _, _, _, _ = GetSpellInfo(11426);
                        MNcooldownMonitor(icebarrierId, RoundZero(start + duration - GetTime()), "Interface\\Icons\\spell_ice_lament")
                    end         
                end
                if(arg == 87023) then
                    if(combatTextCvar == '1') then
                        if (MageNugz.mageProcToggle == true) then
                            CombatText_AddMessage("extinguished", CombatText_StandardScroll, 0.90, 0, 0, nil, isStaggered, nil);
			            end
                    end
                    if (MageNugz.cauterizeToggle == true) then
                        MageNugCauterizeFrame:Hide();
                    end
                end
                if (arg == 12536) or (arg == 16870) then
                    if (MageNugz.clearcastToggle == true) then
                        MageNugClearcast_Frame:Hide();
                    end
                end
                if(arg == 83098) then
                    MNimpGem_Frame:Hide();
                end
                if (arg == 114923) then -- nether tempest
                    MNRemoveBomb(destGUID);
                end
                if (arg == 44457) then --living bomb
                    MNRemoveBomb(destGUID);
                end
                if (MageNugz.polyToggle == true) then
                     if (arg == 9484) then
                        MageNugPolyFrame:Hide();
                        polyTimer = 0;
                        if(combatTextCvar == '1') then
                            CombatText_AddMessage("Shackle Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
                        end
                        if (MageNugz.consoleTextEnabled == true) then
                            DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Shackle Broken On"..":|cffFFFFFF "..destName);
                        end
                        if (MageNugz.polySoundToggle == true) then
                            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.polySound)
                        end
                    end
                    if (arg == 115078) then --paralysis
                        MageNugPolyFrame:Hide();
                        polyTimer = 0;
                        if(combatTextCvar == '1') then
                            CombatText_AddMessage("Paralysis Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
                        end
                        if (MageNugz.consoleTextEnabled == true) then
                            DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Paralysis Broken On"..":|cffFFFFFF "..destName);
                        end
                        if (MageNugz.polySoundToggle == true) then
                            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.polySound)
                        end
                    end
                     if (arg == 2637) then
                        MageNugPolyFrame:Hide();
                        polyTimer = 0;
                        if(combatTextCvar == '1') then
                            CombatText_AddMessage("Hibernate Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
                        end
                        if (MageNugz.consoleTextEnabled == true) then
                            DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Hibernate Broken On"..":|cffFFFFFF "..destName);
                        end
                        if (MageNugz.polySoundToggle == true) then
                            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.polySound)
                        end
                    end
                    if (arg == 76780) then -- bind elemental
                        MageNugPolyFrame:Hide();
                        polyTimer = 0;
                        if(combatTextCvar == '1') then
                            CombatText_AddMessage("Bind Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
                        end
                        if (MageNugz.consoleTextEnabled == true) then
                            DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Bind Broken On"..":|cffFFFFFF "..destName);
                        end
                        if (MageNugz.polySoundToggle == true) then
                            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.polySound)
                        end
                    end
                    if (arg == 51514) then
                        MageNugPolyFrame:Hide();
                        polyTimer = 0;
                        if(combatTextCvar == '1') then
                            CombatText_AddMessage("Hex Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
                        end
                        if (MageNugz.consoleTextEnabled == true) then
                            DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Hex Broken On"..":|cffFFFFFF "..destName);
                        end
                        if (MageNugz.polySoundToggle == true) then
                            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.polySound)
                        end
                    end
                    if (arg == 28272) then
                        MageNugPolyFrame:Hide();
                        polyTimer = 0;
                        if(combatTextCvar == '1') then
                            CombatText_AddMessage("Polymorph Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
                        end
                        if (MageNugz.consoleTextEnabled == true) then
                            DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Polymorph(Pig) Broken On"..":|cffFFFFFF "..destName);
                        end
                        if (MageNugz.polySoundToggle == true) then
                            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.polySound)
                        end
                    end
                    if (arg == 118) then
                        MageNugPolyFrame:Hide();
                        polyTimer = 0;
                        if(combatTextCvar == '1') then
                            CombatText_AddMessage("Polymorph Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
                        end
                        if (MageNugz.consoleTextEnabled == true) then
                            DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Polymorph(Sheep) Broken On"..":|cffFFFFFF "..destName);
                        end
                        if (MageNugz.polySoundToggle == true) then
                            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.polySound)
                        end
                    end
                    if (arg == 28271) then
                        MageNugPolyFrame:Hide();
                        polyTimer = 0;
                        if(combatTextCvar == '1') then
                            CombatText_AddMessage("Polymorph Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
                        end
                        if (MageNugz.consoleTextEnabled == true) then
                            DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Polymorph(Turtle) Broken On"..":|cffFFFFFF "..destName);
                        end
                        if (MageNugz.polySoundToggle == true) then
                            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.polySound)
                        end
                    end
                    if (arg == 61721) then
                        MageNugPolyFrame:Hide();
                        polyTimer = 0;
                        if(combatTextCvar == '1') then
                            CombatText_AddMessage("Polymorph Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
                        end
                        if (MageNugz.consoleTextEnabled == true) then
                            DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Polymorph(Rabbit) Broken On"..":|cffFFFFFF "..destName);
                        end
                        if (MageNugz.polySoundToggle == true) then
                            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.polySound)
                        end
                    end
                    if (arg == 61305) then
                        MageNugPolyFrame:Hide();
                        polyTimer = 0;
                        if(combatTextCvar == '1') then
                            CombatText_AddMessage("Polymorph Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
                        end
                        if (MageNugz.consoleTextEnabled == true) then
                            DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Polymorph(Black Cat) Broken On"..":|cffFFFFFF "..destName);
                        end
                        if (MageNugz.polySoundToggle == true) then
                            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.polySound)
                        end
                    end 
                end
            end
        end
        if event1 == "SPELL_PERIODIC_DAMAGE" then
            if sourceName == UnitName("player") then
                if(arg == 12654) then
                    if(MageNugz.igniteTog == true)then 
                        MageNugIgnite_FrameText:SetText(arg5);
                    end
                end
            end
        end
        if event1 == "SPELL_AURA_APPLIED" then
          if sourceName == UnitName("player") then
            if (arg == 116257) then -- invokers energy
                tierSix = "invokers";
                MageNugInvokers_FrameTexture1:SetAlpha(1);
                MageNugInvokers_Frame:SetAlpha(1);
                MageNugInvokers_Frame_Bar:SetMinMaxValues(0,60);
                MageNugInvokers_Frame_Bar_Text:SetText("INVOKER'S");
                MageNugInvokers_FrameTexture1:SetTexture("Interface\\Icons\\spell_arcane_arcane03");
            end
            
            if(arg == 110909) then
                if(MageNugz.alterTimeToggle == true) then
                    alterTime = 6;
                end
            end
            if (arg == 48107) then -- heating up!
                 if(MageNugz.procMonitorToggle == true) then
                    mageProcHUTime = 9.6;
                    MageNugProcHUFrameText:SetText("|cffFFCC00".."HEATING UP!")
                    MageNugProcHUFrame_ProcBar:SetValue(mageProcHUTime)
                    MageNugProcHUFrame:Show();
                end
                if(combatTextCvar == '1') then
                    if (MageNugz.mageProcToggle == true) then
                        CombatText_AddMessage("HEATING UP!", CombatText_StandardScroll, 1, 0.80, 0, "crit", isStaggered,nil);
			        end
                end
                if (MageNugz.impactSoundToggle == true) then
                    PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.impactSound)
                end
            end
            if (arg == 112948) and (MageNugz.livingBombToggle == true) then -- frost bomb
                local explodeTime = 0;
                MageNugLB_Frame:Show();
                livingbombGlobalTime = 20;
                
                --cooldown
                local fbstart, fbduration, fbenabled = GetSpellCooldown(112948);
                livingbombTime[1] = fbduration + GetTime();
                lbTargetId[1] = 1;
                MageNugLB1_Frame_Text:SetText(RoundOne(livingbombTime[1] - GetTime()));
                MageNugLB1_Frame_Bar:SetValue(RoundOne(livingbombTime[1] - GetTime()));
                MageNugLB1_Frame_Text2:SetText("Cooldown");
                MageNugLB1_Frame:Show();
                
                --detonation
                local i = 1;
                local spellName, _, _, _, _, _, expireTime, _, _, _, spellId = UnitAura("target", i, "PLAYER|HARMFUL");
                while spellName do
                    if(spellId == 112948) then
                        explodeTime = expireTime;
                    end
                    i = i + 1;
                    spellName, _, _, _, _, _, expireTime, _, _, _, spellId = UnitAura("target", i, "PLAYER|HARMFUL");
                end 
                livingbombTime[2] = explodeTime;
                lbTargetId[2] = 2;
                MageNugLB2_Frame_Text:SetText(RoundOne(livingbombTime[2] - GetTime()));
                MageNugLB2_Frame_Bar:SetValue(RoundOne(livingbombTime[2] - GetTime()));
                MageNugLB2_Frame_Text2:SetText("Detonation");
                MageNugLB2_Frame:Show();
                
            end
            if(arg == 83098) then -- imp mana gem
                if (MageNugz.buffmonToggle == false) then
                    impGemTimer = 14;
                    MNimpGem_Frame_Text:SetText(impGemTimer);
                    MNimpGem_Frame:Show();
                end
            end
            if (arg == 29166) then
                if (destName ~= UnitName("player")) then
                    if (MageNugz.msgToggle == true) then
                        SendChatMessage(MageNugz.innervatNotify, "WHISPER", nil, destName);   
                    end
                end
            end
            if(arg == 93400) then -- Shooting Stars
                if(MageNugz.moonkinProcTog == true) then
                   mageProcSSTime = 7;
                   starsurgeTime = 0;
                   MageNugSSProcFrameText:SetText("|cffFF33FF".."Shooting Stars")
                   MageNugSSProcFrame_ProcBar:SetValue(mageProcSSTime)
                   MageNugSSProcFrame:Show()
                end
                if(combatTextCvar == '1') then
                    if (MageNugz.moonkinCombatText == true) then
                        CombatText_AddMessage("Shooting Stars", CombatText_StandardScroll, 0.60, 0, 0.60, "crit", isStaggered, nil);
			        end
                end
                if (MageNugz.procSoundToggle == true) then
                    PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.procSound)
                end
            end    
            
            if(arg == 79683) then -- Arcane Missiles!
                if(MageNugz.procMonitorToggle == true) then
                    mageProcMBTime = 20;
                    MageNugMBProcFrameText:SetText("|cffFF33FF".."ARCANE MISSILES!")
                    MageNugMBProcFrame_ProcBar:SetValue(mageProcMBTime)
                    MageNugMBProcFrame:Show()
                end
                if(combatTextCvar == '1') then
                    if (MageNugz.mageProcToggle == true) then
                        CombatText_AddMessage("ARCANE MISSILES!", CombatText_StandardScroll, 0.60, 0, 0.60, "crit", isStaggered, nil);
			        end
                end
                if (MageNugz.procSoundToggle == true) then
                    PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.procSound)
                end
            end    
            if(arg == 87023) then
                if(combatTextCvar == '1') then
                    if (MageNugz.mageProcToggle == true) then
                        CombatText_AddMessage("Cauterize:", CombatText_StandardScroll, 0.90, 0, 0, nil, isStaggered, nil);
                        CombatText_AddMessage("EXTINGUISH YOURSELF", CombatText_StandardScroll, 0.90, 0, 0, nil, isStaggered, nil);
			        end
                end
                if (MageNugz.cauterizeToggle == true) then
                    MageNugCauterizeFrame:Show();
                    cauterizeTime = 120;
                    MageNugCauterize_Frame:Show();
                end
                if (MageNugz.cauterizeSoundToggle == true) then
                    PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.cauterizeSound)
                end
            end
            if(arg == 48108) then --Hot Streak!
                if(MageNugz.procMonitorToggle == true) then
                    mageProcHSTime = 14;
                    MageNugProcFrameText:SetText("|cffFF0000".."HOT STREAK!")
                    MageNugProcFrame_ProcBar:SetValue(mageProcHSTime)
                    MageNugProcFrame:Show()
                end
                if(combatTextCvar == '1') then
                    if (MageNugz.mageProcToggle == true) then
                        CombatText_AddMessage("HOT STREAK!", CombatText_StandardScroll, 1, 0.10, 0, "crit", isStaggered,nil);
			        end
                end
                if (MageNugz.hsSoundToggle == true) then
                    PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.hsSound)
                end
            end  
            if(arg == 57761) then --Brain Freeze
                if(MageNugz.procMonitorToggle == true) then
                    mageProcBFTime = 14;     
                    MageNugBFProcFrameText:SetText("|cffFF3300".."BRAIN FREEZE!")
                    MageNugBFProcFrame_ProcBar:SetValue(mageProcBFTime)
                    MageNugBFProcFrame:Show()
                end
                if(combatTextCvar == '1') then
                    if (MageNugz.mageProcToggle == true) then
                        CombatText_AddMessage("BRAIN FREEZE!", CombatText_StandardScroll, 1, 0.20, 0, "crit", isStaggered);
			        end
                end
                if (MageNugz.brainfreezeSoundToggle == true) then
                   PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.brainfreezeSound)
                end
            end  
            if(arg == 44544) then --Fingers of Frost
                if(MageNugz.procMonitorToggle == true) then
                    fofProgMonTime = 15;
                    MageNugFoFProcFrameText:SetText("|cffFFFFFF".."Fingers Of Frost")
                    MageNugFoFProcFrame_ProcBar:SetValue(fofProgMonTime)
                    MageNugFoFProcFrame:Show()
                end
                if(combatTextCvar == '1') then
                    if (MageNugz.mageProcToggle == true) then
                       CombatText_AddMessage("Fingers Of Frost", CombatText_StandardScroll, 1, 1, 1, "crit", 1);
			        end
                end
                if (MageNugz.fofSoundToggle == true) then
                   PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.fofSound)
                end
            end 
            if (arg == 36032) then -- Arcane Blast
                if (MageNugz.arcaneBlastToggle == true) then
                    MageNugAB_Frame:Show()
                end
            end
            if (arg == 12042) then
                if (MageNugz.buffmonToggle == false) then
                    apTimer = 14
                    MNarcanepower_FrameText:SetText(apTimer);
                    MNarcanepower_Frame:Show();
                end
            end
            if (arg == 12472) then --icy veins
                if (MageNugz.buffmonToggle == false) then
                    icyTimer = 19;
                    MNicyveins_FrameText:SetText(icyTimer);
                    MNicyveins_Frame:Show();
                end
            end    
            if (MageNugz.polyToggle == true) then
                     if (arg == 9484) then -- shackle
                       _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", shackleId, nil,"PLAYER|HARMFUL")
                        if (polyExpTime ~= nil) then
                            polyTimer = RoundZero(polyExpTime - GetTime());
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Shackle"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_nature_slow");
                            MageNugPolyFrame:Show();
                        else
                            polyTimer = 50;
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Shackle"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_nature_slow");
                            MageNugPolyFrame:Show();
                        end
                    elseif (arg == 2637) then -- hibernate
                        _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyPigId, nil,"PLAYER|HARMFUL")
                        if (polyExpTime ~= nil) then
                            polyTimer = RoundZero(polyExpTime - GetTime());
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Hibernate"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_nature_sleep");
                            MageNugPolyFrame:Show();
                        else
                            polyTimer = 40;
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Hibernate"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_nature_sleep");
                            MageNugPolyFrame:Show();
                        end
                        
                     elseif (arg == 76780) then -- bind elemental
                        _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyPigId, nil,"PLAYER|HARMFUL")
                        if (polyExpTime ~= nil) then
                            polyTimer = RoundZero(polyExpTime - GetTime());
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Bind"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_shaman_bindelemental");
                            MageNugPolyFrame:Show();
                        else
                            polyTimer = 50;
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Bind"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_shaman_bindelemental");
                            MageNugPolyFrame:Show();
                        end
                    elseif (arg == 115078) then -- paralysis
                        _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", paralysisId, nil,"PLAYER|HARMFUL")
                        if (polyExpTime ~= nil) then
                            polyTimer = RoundZero(polyExpTime - GetTime());
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Paralysis"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\ability_monk_paralysis");
                            MageNugPolyFrame:Show();
                        else
                            polyTimer = 50;
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Paralysis"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\ability_monk_paralysis");
                            MageNugPolyFrame:Show();
                        end
                    
                    elseif (arg == 51514) then -- HEX
                        _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyPigId, nil,"PLAYER|HARMFUL")
                        if (polyExpTime ~= nil) then
                            polyTimer = RoundZero(polyExpTime - GetTime());
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."HEX"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_shaman_hex");
                            MageNugPolyFrame:Show();
                        else
                            polyTimer = 60;
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."HEX"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_shaman_hex");
                            MageNugPolyFrame:Show();
                        end
                    elseif (arg == 28272) then -- pig
                        _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyPigId, nil,"PLAYER|HARMFUL")
                        if (polyExpTime ~= nil) then
                            polyTimer = RoundZero(polyExpTime - GetTime());
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_magic_polymorphpig");
                            MageNugPolyFrame:Show();
                        else
                            polyTimer = 50;
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_magic_polymorphpig");
                            MageNugPolyFrame:Show();
                        end
                    elseif (arg == 61305) then -- cat
                        _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyCatId, nil,"PLAYER|HARMFUL")
                        if (polyExpTime ~= nil) then
                            polyTimer = RoundZero(polyExpTime - GetTime());
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Achievement_halloween_cat_01");
                            MageNugPolyFrame:Show();
                        else
                            polyTimer = 50;
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Achievement_halloween_cat_01");
                            MageNugPolyFrame:Show();
                        end
                    elseif (arg == 61721) then -- rabbit
                        _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyRabbitId, nil,"PLAYER|HARMFUL")
                        if (polyExpTime ~= nil) then
                            polyTimer = RoundZero(polyExpTime - GetTime());
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_magic_polymorphrabbit");
                            MageNugPolyFrame:Show();
                        else
                            polyTimer = 50;
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_magic_polymorphrabbit");
                            MageNugPolyFrame:Show();
                        end
                    elseif (arg == 28271) then -- turtle
                        _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyTurtleId, nil,"PLAYER|HARMFUL")
                        if (polyExpTime ~= nil) then
                            polyTimer = RoundZero(polyExpTime - GetTime());
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Ability_hunter_pet_turtle");
                            MageNugPolyFrame:Show();
                        else
                            polyTimer = 50;
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Ability_hunter_pet_turtle");
                            MageNugPolyFrame:Show();
                        end
                    elseif (arg == 118)  then  --sheep
                        _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polySheepId, nil,"PLAYER|HARMFUL")
                        if (polyExpTime ~= nil) then
                            polyTimer = RoundZero(polyExpTime - GetTime());
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_nature_polymorph");
                            MageNugPolyFrame:Show();
                        else
                            polyTimer = 50;
                            MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                            MageNugPolyFrameTimerText:SetText(polyTimer);
                            MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                            MageNugPolyFrame_Bar:SetValue(polyTimer);
                            MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_nature_polymorph");
                            MageNugPolyFrame:Show();
                        end
                    end
                end            
                if(arg == 114923) then -- nether tempest
                    if (MageNugz.livingBombToggle == true) then
                        livingbombGlobalTime = 20;
                        _, _, _, _, _, _, lbexpirationTime, unitCaster, _, _, _ = UnitAura("target", netherTempestId, nil,"PLAYER|HARMFUL")
                        
                        local currentTargetGuid = UnitGUID("target");
                        if(destGUID == currentTargetGuid) then
                            if (lbexpirationTime ~= nil) then
                                MNApplyBomb(destGUID, destName, lbexpirationTime);
                            end
                        else
                           MNApplyBomb(destGUID, destName, GetTime() + 12);
                        end    
                    end
                end
                if(arg == 44457) then -- living bomb
                    if (MageNugz.livingBombToggle == true) then
                        livingbombGlobalTime = 20;
                        _, _, _, _, _, _, lbexpirationTime, unitCaster, _, _, _ = UnitAura("target", livingBombId, nil,"PLAYER|HARMFUL")
                       
                        local currentTargetGuid = UnitGUID("target");
                        if(destGUID == currentTargetGuid) then
                            if (lbexpirationTime ~= nil) then
                                MNApplyBomb(destGUID, destName, lbexpirationTime);
                            end    
                        else
                           MNApplyBomb(destGUID, destName, GetTime() + 12);
                        end    
                    end
                end
                if (arg == 55342) then
                    if (MageNugz.mirrorImageToggle == true) then
                        if (MageNugz.miSoundToggle == true) then
                            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.miSound)
                        end
                        mirrorImageTime = 30;
                        MageNugMI_Frame_MIText1:SetText(" "..mirrorImageTime)
                        MageNugMI_Frame_MiBar:SetValue(mirrorImageTime)
                        MageNugMI_Frame:Show();
                    end
                    if (MageNugz.miCooldown == true) then
                        mirrorImageId, _, _, _, _, _, _, _, _ = GetSpellInfo(55342);
                        MNcooldownMonitor(mirrorImageId, 180, "Interface\\Icons\\spell_magic_lesserinvisibilty")
                    end  
                end
                if (arg == 10060) then
                    if (destName ~= UnitName("player")) then
                        if (MageNugz.powerInfToggle == true) then
                            SendChatMessage(MageNugz.powerinfNotify, "WHISPER", nil, destName);
                        end
                    end
                end
                if (arg == 33206) then
                    if (destName ~= UnitName("player")) then
                        if (MageNugz.painSupToggle == true) then
                            SendChatMessage(MageNugz.painSupNotify, "WHISPER", nil, destName);
                        end
                    end
                end
                if (arg == 47788) then
                    if (destName ~= UnitName("player")) then
                        if (MageNugz.gspiritToggle == true) then
                            SendChatMessage(MageNugz.gspiritNotify, "WHISPER", nil, destName);
                        end
                    end
                end
                if (arg == 130) then
                    if (destName ~= UnitName("player")) then
                        if (MageNugz.msgToggle == true) then
                            local sfRandomNum = math.random(1,3)
                            if(sfRandomNum == 1) then 
                                SendChatMessage(MageNugz.slowfallMsg, "WHISPER", nil, destName);
                            end
                            if(sfRandomNum == 2) then
                                SendChatMessage(MageNugz.slowfallMsg2, "WHISPER", nil, destName);
                            end
                            if(sfRandomNum == 3) then
                                SendChatMessage(MageNugz.slowfallMsg3, "WHISPER", nil, destName);
                            end
                        end
                    end
                end
                if ((arg == 110478) or (arg == 110479) or (arg == 110483) or (arg == 110482) or (arg == 110484) or (arg == 110485)
                     or (arg == 110486) or (arg == 110488) or (arg == 110490) or (arg == 110491)) then -- symbiosis
                    if (destName ~= UnitName("player")) then
                        if (MageNugz.symbiosisnToggle == true) then
                            local symRandomNum = math.random(1,3)
                            if(symRandomNum == 1) then 
                                SendChatMessage(MageNugz.symbiosisNotify, "WHISPER", nil, destName);
                            end
                            if(symRandomNum == 2) then
                                SendChatMessage(MageNugz.symbiosisNotify2, "WHISPER", nil, destName);
                            end
                            if(symRandomNum == 3) then
                                SendChatMessage(MageNugz.symbiosisNotify3, "WHISPER", nil, destName);
                            end
                        end
                    end
                end
              
              
            end
            if destName == UnitName("player") then
                if ((arg == 110478) or (arg == 110479) or (arg == 110483) or (arg == 110484) or (arg == 110482) or (arg == 110485)
                    or (arg == 110486) or (arg == 110488) or (arg == 110490) or (arg == 110491)) then -- symbiosis
                    if(sourceName ~= UnitName("player")) then
                        if (MageNugz.symbiosistyToggle == true) then
                            local syRandomNum = math.random(1,3)
                            if(syRandomNum == 1) then 
                                SendChatMessage(MageNugz.symbiosisThanks, "WHISPER", nil, sourceName);
                            end
                            if(syRandomNum == 2) then
                                SendChatMessage(MageNugz.symbiosisThanks2, "WHISPER", nil, sourceName);
                            end
                        end
                    end
                end
                if(arg == 80353) then -- time warp
                    if (MageNugz.timewarpSoundToggle == true) then
                        PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNugz.timewarpSound) --lawl
                    end
                    if (MageNugz.buffmonToggle == false) then
                        lustTimer = 40;
                        MNlust_Frame:Show()
                    end
                    if sourceName ~= UnitName("player") then
                        if (MageNugz.consoleTextEnabled == true) then
                            DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Time Warp used by"..":|cff0000FF "..sourceName);
                        end
                        if(combatTextCvar == '1') then
                           CombatText_AddMessage(sourceName, CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);
                           CombatText_AddMessage("Time Warp!", CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);  
                        end
                    end
                end
                if (arg == 12536) then
                    if (MageNugz.clearcastToggle == true) then
                        if(combatTextCvar == '1') then    
                            CombatText_AddMessage("Clearcast", CombatText_StandardScroll, 1, 1, 1, nil, isStaggered, nil);
                        end    
                        clearcastTime = 15;
                        MageNugClearcast_Frame:Show();
                    end
                end
                if (arg == 16870) then
                    if (MageNugz.clearcastToggle == true) then
                        if(combatTextCvar == '1') then    
                            CombatText_AddMessage("Clearcast", CombatText_StandardScroll, 1, 1, 1, nil, isStaggered, nil);
                        end    
                        clearcastTime = 8;
                        MageNugClearcast_Frame:Show();
                    end
                end
                if (arg == 64868) then
				    if(combatTextCvar == '1') then
                        if (MageNugz.mageProcToggle == true) then
                            CombatText_AddMessage("Praxis", CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil, nil);
                            CombatText_AddMessage("+350 Spellpower", CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);
			            end
                    end
                end
		        if (arg == 10060) and (sourceName ~= UnitName("player")) then
                    if (MageNugz.consoleTextEnabled == true) then
                        DEFAULT_CHAT_FRAME:AddMessage("|cff0000FF".."Power Infusion By"..":|cffFFFFFF "..sourceName);
                    end
                    if(combatTextCvar == '1') then
                        CombatText_AddMessage(sourceName, CombatText_StandardScroll, 0, 0.10, 1, "sticky", nil);
                        CombatText_AddMessage("POWER INFUSION!", CombatText_StandardScroll, 0, 0.10, 1, "sticky", nil);  
                    end
                    if (MageNugz.pityToggle == true) then
                        SendChatMessage(MageNugz.powerinfThanks, "WHISPER", nil, sourceName);   
                    end
                end
                if(combatTextCvar == '1') then
                    if (arg == 63711) then
                        CombatText_AddMessage("STORM POWER".."!!", CombatText_StandardScroll, 1, 1, 1, "sticky", nil);
                        CombatText_AddMessage("(+135% Crit Damage)", CombatText_StandardScroll, 1, 1, 1, "sticky", nil);
                    end
                    if (arg == 65134) then
                        CombatText_AddMessage("STORM POWER".."!", CombatText_StandardScroll, 1, 1, 1, "sticky", nil);
                        CombatText_AddMessage("(+135% Crit Damage)", CombatText_StandardScroll, 1, 1, 1, "sticky", nil);
                    end
                    if (arg == 62821) then
                        CombatText_AddMessage("TOASTY FIRE!", CombatText_StandardScroll, 1, 0.20, 0, "sticky", nil);
                    end
                    if (arg == 29232) then
                        CombatText_AddMessage("Fungal Creep!", CombatText_StandardScroll, 0, 1, 0.2, "sticky", nil);
                        CombatText_AddMessage("(+50% Crit Rating)", CombatText_StandardScroll, 0, 1, 0,2, "sticky", nil);
                    end
                    if (arg == 62320) then
                        CombatText_AddMessage("Aura of Celerity!", CombatText_StandardScroll, 1, 1, 1, "sticky", nil);
                        CombatText_AddMessage("(+20% Haste)", CombatText_StandardScroll, 1, 1, 1, "sticky", nil);
                    end
                    if (arg == 62807) then
                        CombatText_AddMessage("Star Light!", CombatText_StandardScroll, 1, 1, 1, "sticky", nil);
                        CombatText_AddMessage("(50% Haste)", CombatText_StandardScroll, 1, 1, 1, "sticky", nil);
                    end
                end
                if (arg == 29166) then
                    if (sourceName ~= UnitName("player")) then
                        if (MageNugz.consoleTextEnabled == true) then
                            DEFAULT_CHAT_FRAME:AddMessage("|cff0000FF".."Innervated By"..":|cffFFFFFF "..sourceName);
                        end
                        if(combatTextCvar == '1') then
                            CombatText_AddMessage(sourceName, CombatText_StandardScroll, 0, 0.10, 1, "sticky", nil);
                            CombatText_AddMessage("INNERVATED YOU!", CombatText_StandardScroll, 0, 0.10, 1, "sticky", nil);  
                        end
                        if (MageNugz.innertyToggle == true) then
                            local inRandomNum = math.random(1,2)
                            if(inRandomNum == 1) then 
                                SendChatMessage(MageNugz.innervatThanks, "WHISPER", nil, sourceName);   
                            end
                            if(inRandomNum == 2) then 
                                SendChatMessage(MageNugz.innervatThanks2, "WHISPER", nil, sourceName);
                            end
                        end
                    end
                end
                if (arg == 2825) then
                    if sourceName ~= UnitName("player") then
                        if (MageNugz.buffmonToggle == false) then
                            lustTimer = 40;
                            MNlust_Frame:Show()
                        end
                        if (MageNugz.consoleTextEnabled == true) then
                            DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Blood Lust used by"..":|cff0000FF "..sourceName);
                        end
                        if(combatTextCvar == '1') then
                            CombatText_AddMessage(sourceName, CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);
                            CombatText_AddMessage("BLOOD LUSTED!", CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);  
                        end
                    end
                end
                if (arg == 32182) then
                    if sourceName ~= UnitName("player") then
                        lustTimer = 40;
                        MNlust_Frame:Show()
                        if (MageNugz.consoleTextEnabled == true) then
                            DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Heroism used by"..":|cff0000FF "..sourceName);
                        end
                        if(combatTextCvar == '1') then
                            CombatText_AddMessage(sourceName, CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);
                            CombatText_AddMessage("HEROISM!", CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);  
                        end
                    end
                end
  
            end
		end
        --
        if event1 == "SPELL_STOLEN" then
            if sourceName == UnitName("player") then
		        if(combatTextCvar == '1') then
                    CombatText_AddMessage("Stole"..":"..GetSpellLink(arg5), CombatText_StandardScroll, 0.10, 0, 1, "sticky", nil);
                end
                
                if (MageNugz.consoleTextEnabled == true) then
                   DEFAULT_CHAT_FRAME:AddMessage("|cffFFFFFF".."Spell Stolen"..":"..GetSpellLink(arg5).."From "..destName)
	    	    end
            end
		end
     end
end

--------------------------------------------------------------------------------------------------
--                                  Options Functions                                           --
--------------------------------------------------------------------------------------------------
function MNVariablesLoaded_OnEvent() --Takes care of the options on load up
        mnplayerClass, mnenglishClass = UnitClass("player");  
        if((mnenglishClass == 'WARRIOR') or (mnenglishClass == 'MONK') or (mnenglishClass == 'ROGUE') or (mnenglishClass == 'DEATHKNIGHT') or (mnenglishClass == 'PALADIN') or (mnenglishClass == 'HUNTER')) then
            MageNugz.spMonitorToggle = true;
            MageNugz.ssMonitorToggle = false;
            MageNugz.igniteTog = false;
            MageNugz.mageProcToggle = false;
            MageNugz.camZoomTogg = false;
            MageNugz.mirrorImageToggle = false;
            MageNugz.mageArmorToggle = false;
            MageNugz.evocationToggle = false;
            MageNugz.livingBombToggle = false;
            MageNugz.procMonitorToggle = false;
            MageNugz.consoleTextEnabled = false;
            MageNugz.arcaneBlastToggle = false;
            MageNugz.minimapToggle = false;
            MageNugz.invokersToggle = true;
            MageNugz.cooldownToggle = true;
            MageNugCD_Frame:Hide();
            MageNugz.moonkinTog = true;
            MageNugMoonkin_Frame:Hide()
            MageNugz.managemToggle = false;
            MageNugManaGem_Frame:Hide();
            MNmoonFire_Frame:Hide();
            MNinsectSwarm_Frame:Hide();
            MNstarSurge_Frame:Hide();
        end
        if(mnenglishClass == 'WARLOCK') then
            DEFAULT_CHAT_FRAME:AddMessage("|cff00BFFF".."Mage".."|cff00FF00".."Nuggets".."|cffffffff "..magenugVer.." loaded! Some Options Disabled (Class:"..UnitClass("Player")..")")
            MageNugz.igniteTog = false;
            MageNugz.ssMonitorToggle = false;
            MageNugz.mageProcToggle = false;
            MageNugz.mirrorImageToggle = false;
            MageNugz.mageArmorToggle = false;
            MageNugz.evocationToggle = false;
            MageNugz.livingBombToggle = false;
            MageNugz.procMonitorToggle = false;
            MageNugz.minimapToggle = false;
            MageNugz.cooldownToggle = true;
            MageNugCD_Frame:Hide();
            MageNugz.invokersToggle = true;
            MageNugz.moonkinTog = true;
            MageNugMoonkin_Frame:Hide()
            MageNugz.managemToggle = false;
            MageNugManaGem_Frame:Hide();
            MNmoonFire_Frame:Hide();
            MNinsectSwarm_Frame:Hide();
            MNstarSurge_Frame:Hide();
        end
        if(mnenglishClass == 'SHAMAN')then
            DEFAULT_CHAT_FRAME:AddMessage("|cff00BFFF".."Mage".."|cff00FF00".."Nuggets".."|cffffffff "..magenugVer.." loaded! Some Options Disabled (Class:"..UnitClass("Player")..")")
            MageNugz.igniteTog = false;
            MageNugz.mageProcToggle = false;
            MageNugz.mirrorImageToggle = false;
            MageNugz.mageArmorToggle = false;
            MageNugz.evocationToggle = false;
            MageNugz.livingBombToggle = false;
            MageNugz.procMonitorToggle = false;
            MageNugz.minimapToggle = false;
            MageNugz.cooldownToggle = true;
            MageNugCD_Frame:Hide();
            MageNugz.invokersToggle = true;
            MageNugz.moonkinTog = true;
            MageNugMoonkin_Frame:Hide()
            MageNugz.managemToggle = false;
            MageNugManaGem_Frame:Hide();
            MNmoonFire_Frame:Hide();
            MNinsectSwarm_Frame:Hide();
            MNstarSurge_Frame:Hide();
            MNSpellSteal_FrameTitleText:SetText("|cffffffffPURGEABLE")
        end
        if(mnenglishClass == 'PRIEST') then
            DEFAULT_CHAT_FRAME:AddMessage("|cff00BFFF".."Mage".."|cff00FF00".."Nuggets".."|cffffffff "..magenugVer.." loaded! Some Options Disabled (Class:"..UnitClass("Player")..")")
            MageNugz.igniteTog = false;
            MNSpellSteal_FrameTitleText:SetText("|cff33ccffD I S P E L");
            MageNugz.mageProcToggle = false;
            MageNugz.mirrorImageToggle = false;
            MageNugz.mageArmorToggle = false;
            MageNugz.evocationToggle = false;
            MageNugz.invokersToggle = true;
            MageNugz.livingBombToggle = false;
            MageNugz.procMonitorToggle = false;
            MageNugz.minimapToggle = false;
            MageNugz.cooldownToggle = true;
            MageNugCD_Frame:Hide();
            MageNugz.moonkinTog = true;
            MageNugMoonkin_Frame:Hide()
            MageNugz.managemToggle = false;
            MageNugManaGem_Frame:Hide();
            MNmoonFire_Frame:Hide();
            MNinsectSwarm_Frame:Hide();
            MNstarSurge_Frame:Hide();
        end
        if(mnenglishClass == 'DRUID') then
            DEFAULT_CHAT_FRAME:AddMessage("|cff00BFFF".."Mage".."|cff00FF00".."Nuggets".."|cffffffff "..magenugVer.." loaded! Some Options Disabled (Class:"..UnitClass("Player")..")")
            MageNugz.igniteTog = false;
            MageNugz.ssMonitorToggle = false;
            MageNugz.mirrorImageToggle = false;
            MageNugz.mageArmorToggle = false;
            MageNugz.evocationToggle = false;
            MageNugz.livingBombToggle = false;
            MageNugz.minimapToggle = false;
            MageNugz.managemToggle = false;
            MageNugz.invokersToggle = true;
            MageNugManaGem_Frame:Hide();
            MageNugCD_Frame_Text:SetText(" ");
            if(MageNugz.moonkinCombat == true) then
                MageNugMoonkin_Frame:Hide();
                MNmoonFire_Frame:Hide();
                MNinsectSwarm_Frame:Hide();
                MNstarSurge_Frame:Hide();
            else
                if (MageNugz.moonkinTog == false) or (MageNugz.moonkinTog == nil) then
                    MageNugMoonkin_Frame:Show();
                    MNmoonFire_Frame:Show();
                    MNinsectSwarm_Frame:Show();
                    MNstarSurge_Frame:Show();
                end
            end
            if (MageNugz.moonkinMin == true) then
                MageNugMoonkin_Frame_Texture:Hide();
            end
        end
        if(mnenglishClass == 'MAGE') then
            DEFAULT_CHAT_FRAME:AddMessage("|cff00BFFF".."Mage".."|cff00FF00".."Nuggets".."|cffffffff "..magenugVer.." loaded! (Use: /magenuggets options)")
            MageNugCD_Frame_Text:SetText(" ");
            MageNugz.moonkinTog = true;
            MageNugMoonkin_Frame:Hide()
            MNmoonFire_Frame:Hide();
            MNinsectSwarm_Frame:Hide();
            MNstarSurge_Frame:Hide();
            MNSpellSteal_FrameTitleText:SetText("|cff33ccffS P E L L S T E A L");
            MNSpellStealFocus_FrameTitleText:SetText("|cff33ccffFOCUS SPELLSTEAL");
            if(MageNugz.managemToggle == true) then
                if(MageNugz.mgCombatTog == true) then
                    MageNugManaGem_Frame:Hide();
                end
            end        
        end                
        -----Main Options----- 
        MageNugMoonkinToggle_FrameText:SetText("|cff00BFFF".."Mage".."|cff00FF00".." Nuggets")
        MageNugCauterizeFrame:Hide();
        if (MageNugz.minimapToggle == nil) then
            MageNugz.minimapToggle = true;
        end
        if (MageNugz.minimapToggle == true) then
            MageNug_MinimapFrame:Show();
            MageNugOption2Frame_MinimapCheckButton:SetChecked(0);
        else
            MageNug_MinimapFrame:Hide();
            MageNugOption2Frame_MinimapCheckButton:SetChecked(1);
        end
        combatTextCvar = GetCVar("enableCombatText")
        if (MageNugz.ssMonitorToggle == true) then
            MageNugOptionsFrame_CheckButton2:SetChecked(0);
        else
            MageNugOptionsFrame_CheckButton2:SetChecked(1);
        end
        if (MageNugz.mageProcToggle == true) then
            MageNugOptionsFrame_CheckButton3:SetChecked(0);
        else
            MageNugOptionsFrame_CheckButton3:SetChecked(1);
        end
        if(MageNugz.igniteTog == true) or (MageNugz.igniteTog == nil) then
            MageNugOptionsFrame_IgniteCheckButton:SetChecked(1);
            MageNugz.igniteTog = true;
        else
            MageNugOptionsFrame_IgniteCheckButton:GetChecked(0);
        end
        if (MageNugz.mirrorImageToggle == true) then
            MageNugOptionsFrame_CheckButton6:SetChecked(0);
        else
            MageNugOptionsFrame_CheckButton6:SetChecked(1);
        end
        if (MageNugz.mageArmorToggle == nil) then
            MageNugz.mageArmorToggle = true
        end
        if (MageNugz.mageArmorToggle == true) then
            MageNugOptionsFrame_CheckButton7:SetChecked(0);
        else
            MageNugOptionsFrame_CheckButton7:SetChecked(1);
        end
        if (MageNugz.evocationToggle == true) then
            MageNugOptionsFrame_CheckButton8:SetChecked(0);
        else
            MageNugOptionsFrame_CheckButton8:SetChecked(1);
        end
        if (MageNugz.livingBombToggle == true) then
            MageNugOptionsFrame_CheckButton9:SetChecked(0);
        else
            MageNugOptionsFrame_CheckButton9:SetChecked(1);
        end
        if(MageNugz.abCastTimeToggle == nil) then
            MageNugz.abCastTimeToggle = true;
        end
        if(MageNugz.abCastTimeToggle == true) then
            MageNugOptionsFrame_ABcastCheckButton:SetChecked(1);
            MNabCast_Frame:Show();
        else
            MageNugOptionsFrame_ABcastCheckButton:SetChecked(0);
            MNabCast_Frame:Hide();
        end   
        if (MageNugz.arcaneBlastToggle == true) then
            MageNugOptionsFrame_CheckButton13:SetChecked(0);
        else
            MageNugOptionsFrame_CheckButton13:SetChecked(1);
        end
        if (MageNugz.polyToggle == true) then
            MageNugOptionsFrame_CheckButton14:SetChecked(0);
        else
            MageNugOptionsFrame_CheckButton14:SetChecked(1);
        end
        if (MageNugz.clearcastToggle == nil) then
            MageNugz.clearcastToggle = true;
        end
        if (MageNugz.clearcastToggle == true) then
            MageNugOptionsFrame_CheckButtonCC:SetChecked(0);
        else
            MageNugOptionsFrame_CheckButtonCC:SetChecked(1);
        end  
        if(MageNugz.mgCombatTog == nil) then
            MageNugz.mgCombatTog = false;
        end
        if(MageNugz.mgCombatTog == true) then
            MageNugOptionsFrame_CheckButtonMGcombat:SetChecked(1);
        else
            MageNugOptionsFrame_CheckButtonMGcombat:SetChecked(0);
        end
        if(MageNugz.alterTimeToggle == nil) then
            MageNugz.alterTimeToggle = true;
        end
        if(MageNugz.alterTimeToggle == false) then
            MageNugOptionsFrame_CheckButtonAlterTime:SetChecked(1);
        else
            MageNugOptionsFrame_CheckButtonAlterTime:SetChecked(0);
        end
        if (MageNugz.managemToggle == nil) then
            MageNugz.managemToggle = true;
        end
        if (MageNugz.managemToggle == true) then
            MageNugOptionsFrame_CheckButtonMG:SetChecked(0);
            if(MageNugz.mgCombatTog == false) then    
                MageNugManaGem_Frame:Show();
            end
        else
            MageNugOptionsFrame_CheckButtonMG:SetChecked(1);
            MageNugManaGem_Frame:Hide()
        end
        
        if (MageNugz.invokersToggle == nil) then
            MageNugz.invokersToggle = false;
        end
        if (MageNugz.invokersToggle == false) then
            MageNugOptionsFrame_CheckButtonIE:SetChecked(0);
            MageNugInvokers_Frame:Show();
        else
            MageNugOptionsFrame_CheckButtonIE:SetChecked(1);
            MageNugInvokers_Frame:Hide();
        end
        
        
        if (MageNugz.procMonitorToggle == nil) then
            MageNugz.procMonitorToggle = true;
        end
        if (MageNugz.procMonitorToggle == true) then
            MageNugOptionsFrame_CheckButton11:SetChecked(0);
        else
            MageNugOptionsFrame_CheckButton11:SetChecked(1);
        end
        if (MageNugz.ssMonitorSize == nil) then
            MageNugOptionsFrame_Slider2:SetValue(3)
        else
            MageNugOptionsFrame_Slider2:SetValue(MageNugz.ssMonitorSize)
        end
        if (MageNugz.cautSize == nil) then
            MageNugOptionsFrame_Slider5:SetValue(3)
        else
            MageNugOptionsFrame_Slider5:SetValue(MageNugz.cautSize)
        end
        if (MageNugz.livingBCounterSize == nil) then
            MageNugOptionsFrame_Slider3:SetValue(3)
        else
            MageNugOptionsFrame_Slider3:SetValue(MageNugz.livingBCounterSize)
        end
        if (MageNugz.procMonitorSize == nil) then
            MageNugOptionsFrame_Slider4:SetValue(3)
        else
            MageNugOptionsFrame_Slider4:SetValue(MageNugz.procMonitorSize)
        end  
        if (MageNugz.invokersMonitorSize == nil) then
            MageNugOptionsFrame_InvokersSlider:SetValue(3)
        else
            MageNugOptionsFrame_InvokersSlider:SetValue(MageNugz.invokersMonitorSize)
        end  
        -----Messages Options----        
        if (MageNugz.msgToggle == nil) then
            MageNugz.msgToggle = true;
        end
        if (MageNugz.msgToggle == true) then
            MageNugMsgOptionFrame_CheckButton:SetChecked(1);
        else
            MageNugMsgOptionFrame_CheckButton:SetChecked(0);
        end
        if (MageNugz.symbiosisnToggle == nil) then
            MageNugz.symbiosisnToggle = true;
        end
        if (MageNugz.symbiosisnToggle == true) then
            MageNugMsgOptionFrame_CheckButton2:SetChecked(1);
        else
            MageNugMsgOptionFrame_CheckButton2:SetChecked(0);
        end
        if (MageNugz.symbiosistyToggle == nil) then
            MageNugz.symbiosistyToggle = true;
        end
        if (MageNugz.symbiosistyToggle == true) then
            MageNugMsgOptionFrame_CheckButton3:SetChecked(1);
        else
            MageNugMsgOptionFrame_CheckButton3:SetChecked(0);
        end
        if (MageNugz.innertyToggle == nil) then
            MageNugz.innertyToggle = true;
        end
        if (MageNugz.innertyToggle == true) then
            MageNugMsgOptionFrame_CheckButton4:SetChecked(1);
        else
            MageNugMsgOptionFrame_CheckButton4:SetChecked(0);
        end
        if (MageNugz.pityToggle == nil) then
            MageNugz.pityToggle = true;
        end
        if (MageNugz.pityToggle == true) then
            MageNugMsgOptionFrame_CheckButton5:SetChecked(1);
        else
            MageNugMsgOptionFrame_CheckButton5:SetChecked(0);
        end
        if (MageNugz.dityToggle == nil) then
            MageNugz.dityToggle = true;
        end
        if (MageNugz.dityToggle == true) then
            MageNugMsgOptionFrame_CheckButton6:SetChecked(1);
        else
            MageNugMsgOptionFrame_CheckButton6:SetChecked(0);
        end
       if (MageNugz.slowfallMsg == nil) or (MageNugz.slowfallMsg == "") then
            SlowFallMsgEditBox:SetText("Slowfall Cast On You")
        else
            SlowFallMsgEditBox:SetText(MageNugz.slowfallMsg)
        end
        if (MageNugz.slowfallMsg2 == nil) or (MageNugz.slowfallMsg2 == "") then
            SlowFallMsgEditBox2:SetText("Slowfall Cast On You")
        else
            SlowFallMsgEditBox2:SetText(MageNugz.slowfallMsg2)
        end
        if (MageNugz.slowfallMsg3 == nil) or (MageNugz.slowfallMsg3 == "")then
            SlowFallMsgEditBox3:SetText("Slowfall Cast On You")
        else
            SlowFallMsgEditBox3:SetText(MageNugz.slowfallMsg3)
        end
        if (MageNugz.symbiosisNotify == nil) or (MageNugz.symbiosisNotify == "") then
            FocMagNotifyEditBox:SetText("Symbiosis Cast On You")
            MageNugz.symbiosisNotify = "Symbiosis Cast On You";
        else
          FocMagNotifyEditBox:SetText(MageNugz.symbiosisNotify)
        end
        if (MageNugz.symbiosisNotify2 == nil) or (MageNugz.symbiosisNotify2 == "") then
            FocMagNotifyEditBox2:SetText("Symbiosis Cast On You")
            MageNugz.symbiosisNotify2 = "Symbiosis Cast On You";
        else
           FocMagNotifyEditBox2:SetText(MageNugz.symbiosisNotify2)
        end
        if (MageNugz.symbiosisNotify3 == nil) or (MageNugz.symbiosisNotify3 == "") then
            FocMagNotifyEditBox3:SetText("Symbiosis Cast On You")
            MageNugz.symbiosisNotify3 = "Symbiosis Cast On You";
        else
           FocMagNotifyEditBox3:SetText(MageNugz.symbiosisNotify3)
        end
        if (MageNugz.symbiosisThanks == nil) or (MageNugz.symbiosisThanks == "") then
            FocMagThankEditBox:SetText("Thanks For Symbiosis")
            MageNugz.symbiosisThanks = "Thanks For Symbiosis";
        else
            FocMagThankEditBox:SetText(MageNugz.symbiosisThanks)
        end
        if (MageNugz.symbiosisThanks2 == nil) or (MageNugz.symbiosisThanks2 == "") then
            FocMagThankEditBox2:SetText("Thanks For Symbiosis")
            MageNugz.symbiosisThanks2 = "Thanks For Symbiosis";
        else
            FocMagThankEditBox2:SetText(MageNugz.symbiosisThanks2)
        end
        if (MageNugz.innervatThanks == nil) or (MageNugz.innervatThanks == "") then
            InnervThankEditBox:SetText("Thanks For The Innervate")
        else
            InnervThankEditBox:SetText(MageNugz.innervatThanks)
        end
        if (MageNugz.innervatThanks2 == nil) or (MageNugz.innervatThanks2 == "") then
            InnervThankEditBox2:SetText("Thanks For The Innervate")
        else
            InnervThankEditBox2:SetText(MageNugz.innervatThanks2)
        end
        if (MageNugz.powerinfThanks == nil) or (MageNugz.powerinfThanks == "") then
            PowerInfusionEditBox:SetText("Thanks For Power Infusion")
        else
            PowerInfusionEditBox:SetText(MageNugz.powerinfThanks)
        end
        if (MageNugz.darkIntentThanks == nil) or (MageNugz.darkIntentThanks == "") then
            DarkIntentEditBox:SetText("Thanks For Dark Intent")
        else
           DarkIntentEditBox:SetText(MageNugz.darkIntentThanks)
        end
     
        ------Monitor Options------       
        MNcheckbox1FontString:SetText("Disable Stat Monitor")
        MNcheckbox2FontString:SetText("Disable Buff Monitors")
        MageNugStatMonOptionFrame_SPSliderFontString:SetText("Stat Monitor Size")
        MageNugStatMonOptionFrame_BorderSliderFontString:SetText("Border Type")
        MageNugStatMonOptionFrame_TransSliderFontString:SetText("Background Transparency")
        MageNugStatMonOptionFrame_ColorSliderFontString:SetText("Backdrop Color")
        if (MageNugz.spCombatToggle == nil)then
            MageNugz.spCombatToggle = false;
        end
        if (MageNugz.spCombatToggle == true) then
            MageNugStatMonOptionFrame_CheckButton0:SetChecked(1);
        else
            MageNugStatMonOptionFrame_CheckButton0:SetChecked(0);
        end
        if (MageNugz.spMonitorToggle == nil) then
            MageNugz.spMonitorToggle = false;
        end
        if (MageNugz.spMonitorToggle == true) then
            MageNugStatMonOptionFrame_CheckButton1:SetChecked(1);
            MageNugSP_Frame:Hide();
        else
            if (MageNugz.spCombatToggle == true) then
                MageNugSP_Frame:Hide();
            else
                MageNugSP_Frame:Show();
            end
            MageNugStatMonOptionFrame_CheckButton1:SetChecked(0);
        end
        if (MageNugz.buffmonToggle == nil) then
            MageNugz.buffmonToggle = false;
        end
        if (MageNugz.buffmonToggle == true) then
            MageNugStatMonOptionFrame_CheckButton2:SetChecked(1);
        else
            MageNugStatMonOptionFrame_CheckButton2:SetChecked(0);
        end
        if (MageNugz.spMonitorSize == nil) then
            MageNugStatMonOptionFrame_SPSizeSlider:SetValue(3)
        else
            MageNugStatMonOptionFrame_SPSizeSlider:SetValue(MageNugz.spMonitorSize)
        end
        if(MageNugz.borderStyle == nil) then
            MageNugStatMonOptionFrame_BorderSlider:SetValue(0);
        else
            MageNugStatMonOptionFrame_BorderSlider:SetValue(MageNugz.borderStyle);
        end
        if(MageNugz.transColor == nil) then
            MageNugStatMonOptionFrame_TransparencySlider:SetValue(0);
        else
            MageNugStatMonOptionFrame_TransparencySlider:SetValue(MageNugz.transColor);
        end
        --------Options 2--------
        MNcheckboxMiniMapFontString:SetText("Disable Minimap Button")
        MNcheckboxCameraFontString:SetText("Disable Maximum Camera Zoom Out")
        MNcheckboxConsoleTextFontString:SetText("Disable Console Text")
        MNcheckboxLockFramesFontString:SetText("Lock Frames")
        MNcheckboxTTFontString:SetText("Tool Tips")
        MNcheckboxClickThruFontString:SetText("Enable Frame Click Through")
        if (MageNugz.MinimapPos == nil) then
            MageNugz.MinimapPos = 45;
        end
        if (MageNugz.camZoomTogg == true) then
            ConsoleExec("cameraDistanceMax 50");
            MageNugOption2Frame_CameraCheckButton:SetChecked(0);
        else
            MageNugOption2Frame_CameraCheckButton:SetChecked(1);
        end
        if (MageNugz.lockFrames == nil) then
            MageNugz.lockFrames = false;
        end
        if (MageNugz.lockFrames == true) then
            MageNugOption2Frame_LockFramesCheckButton:SetChecked(1);
        else
            MageNugOption2Frame_LockFramesCheckButton:SetChecked(0);
        end
        if (MageNugz.consoleTextEnabled == nil) then
            MageNugz.consoleTextEnabled = true;
        end
        if (MageNugz.consoleTextEnabled == true) then
            MageNugOption2Frame_ConsoleTextCheckButton:SetChecked(0);
        else
            MageNugOption2Frame_ConsoleTextCheckButton:SetChecked(1);
        end
        if (MageNugz.toolTips == nil) then
            MageNugz.toolTips = true;
        end
        if (MageNugz.toolTips == true) then
            MageNugOption2Frame_CheckButtonTT:SetChecked(1);
        else
            MageNugOption2Frame_CheckButtonTT:SetChecked(0);
        end
        if (MageNugz.clickthru == nil) then
            MageNugz.clickthru = false;
        end
        if (MageNugz.clickthru == true) then
            MageNugOption2Frame_ClickThruCheckButton:SetChecked(1);
        else
            MageNugOption2Frame_ClickThruCheckButton:SetChecked(0);
        end
        if (MageNugz.simpleUiToggle == nil) then
            MageNugz.simpleUiToggle = false;
        end
        if (MageNugz.simpleUiToggle == true) then
            MageNugOption2Frame_SimpleUICheckButton:SetChecked(1);
        else
            MageNugOption2Frame_SimpleUICheckButton:SetChecked(0);
        end
        MNsimpleUItoggle();
        if (MageNugz.polyFrameSize == nil) then
            MageNugOptionsFrame_Slider1:SetValue(3)
        else
            MageNugOptionsFrame_Slider1:SetValue(MageNugz.polyFrameSize)
        end
        if (MageNugz.cauterizeToggle == true) or (MageNugz.cauterizeToggle == nil) then
            CauterizeCheckButton:SetChecked(1);
            MageNugz.cauterizeToggle = true;
        else
            CauterizeCheckButton:SetChecked(0);
        end
        
        -------Sounds Options-------
        if (MageNugz.miSound == nil) or (MageNugz.miSound == "") then
            MageNugSoundOptionFrame_MISoundEditBox:SetText("mirror.mp3")
        else
            MageNugSoundOptionFrame_MISoundEditBox:SetText(MageNugz.miSound)
        end
        if (MageNugz.procSound == nil) or (MageNugz.procSound == "") then
            MageNugSoundOptionFrame_ProcSoundEditBox:SetText("proc.mp3")
        else
            MageNugSoundOptionFrame_ProcSoundEditBox:SetText(MageNugz.procSound)
        end
        if (MageNugz.miSoundToggle == true) or (MageNugz.miSoundToggle == nil) then
            MageNugSoundOptionFrame_MICheckButton:SetChecked(1);
            MageNugz.miSoundToggle = true;
        else
            MageNugSoundOptionFrame_MICheckButton:SetChecked(0);
        end
        if (MageNugz.procSoundToggle == true) or (MageNugz.procSoundToggle == nil) then
            MageNugSoundOptionFrame_ProcCheckButton:SetChecked(1);
            MageNugz.procSoundToggle = true;
        else
            MageNugSoundOptionFrame_ProcCheckButton:SetChecked(0);
        end
        if (MageNugz.polySound == nil) or (MageNugz.polySound == "") then
            MageNugSoundOptionFrame_PolySoundEditBox:SetText("sheep.mp3")
        else
            MageNugSoundOptionFrame_PolySoundEditBox:SetText(MageNugz.polySound)
        end
        if (MageNugz.polySoundToggle == true) or (MageNugz.polySoundToggle == nil) then
            MageNugSoundOptionFrame_PolyCheckButton:SetChecked(1);
            MageNugz.polySoundToggle = true;
        else
            MageNugSoundOptionFrame_PolyCheckButton:SetChecked(0);
        end
        
        if (MageNugz.ABSound == nil) or (MageNugz.ABSound == "") then
            MageNugSoundOptionFrame_ABSoundEditBox:SetText("impact.mp3")
        else
            MageNugSoundOptionFrame_ABSoundEditBox:SetText(MageNugz.ABSound)
        end
        if (MageNugz.ABSoundToggle == true) or (MageNugz.ABSoundToggle == nil) then
            MageNugSoundOptionFrame_ABCheckButton:SetChecked(1);
            MageNugz.ABSoundToggle = true;
        else
            MageNugSoundOptionFrame_ABCheckButton:SetChecked(0);
        end
        
        if (MageNugz.hsSound == nil) or (MageNugz.hsSound == "") then
            MageNugSoundOptionFrame_HotStreakSoundEditBox:SetText("hotstreak.mp3")
        else
            MageNugSoundOptionFrame_HotStreakSoundEditBox:SetText(MageNugz.hsSound)
        end
        if (MageNugz.hsSoundToggle == true) or (MageNugz.hsSoundToggle == nil) then
            MageNugSoundOptionFrame_HotStreakCheckButton:SetChecked(1);
            MageNugz.hsSoundToggle = true;
        else
            MageNugSoundOptionFrame_HotStreakCheckButton:SetChecked(0);
        end
        if (MageNugz.impactSound == nil) or (MageNugz.impactSound == "") then
            MageNugSoundOptionFrame_ImpactSoundEditBox:SetText("impact.mp3")
        else
            MageNugSoundOptionFrame_ImpactSoundEditBox:SetText(MageNugz.impactSound)
        end
        if (MageNugz.impactSoundToggle == true) or (MageNugz.impactSoundToggle == nil) then
            MageNugSoundOptionFrame_ImpactCheckButton:SetChecked(1);
            MageNugz.impactSoundToggle = true;
        else
            MageNugSoundOptionFrame_ImpactCheckButton:SetChecked(0);
        end
        if (MageNugz.fofSound == nil) or (MageNugz.fofSound == "") then
            MageNugSoundOptionFrame_FoFSoundEditBox:SetText("fof.mp3")
        else
            MageNugSoundOptionFrame_FoFSoundEditBox:SetText(MageNugz.fofSound)
        end
        if (MageNugz.fofSoundToggle == true) or (MageNugz.fofSoundToggle == nil) then
            MageNugSoundOptionFrame_FoFCheckButton:SetChecked(1);
            MageNugz.fofSoundToggle = true;
        else
            MageNugSoundOptionFrame_FoFCheckButton:SetChecked(0);
        end
        if (MageNugz.brainfreezeSound == nil) or (MageNugz.brainfreezeSound == "") then
            MageNugSoundOptionFrame_BrainFreezeSoundEditBox:SetText("brainfreeze.mp3")
        else
            MageNugSoundOptionFrame_BrainFreezeSoundEditBox:SetText(MageNugz.brainfreezeSound)
        end
        if (MageNugz.brainfreezeSoundToggle == true) or (MageNugz.brainfreezeSoundToggle == nil) then
            MageNugSoundOptionFrame_BrainFreezeCheckButton:SetChecked(1);
            MageNugz.brainfreezeSoundToggle = true;
        else
            MageNugSoundOptionFrame_BrainFreezeCheckButton:SetChecked(0);
        end
        if (MageNugz.cauterizeSound == nil) or (MageNugz.cauterizeSound == "") then
            MageNugSoundOptionFrame_CauterizeSoundEditBox:SetText("toasty.mp3")
        else
            MageNugSoundOptionFrame_CauterizeSoundEditBox:SetText(MageNugz.cauterizeSound)
        end
        if (MageNugz.cauterizeSoundToggle == true) or (MageNugz.cauterizeSoundToggle == nil) then
            MageNugSoundOptionFrame_CauterizeCheckButton:SetChecked(1);
            MageNugz.cauterizeSoundToggle = true;
        else
            MageNugSoundOptionFrame_CauterizeCheckButton:SetChecked(0);
        end
        if (MageNugz.timewarpSound == nil) or (MageNugz.timewarpSound == "") then
            MageNugSoundOptionFrame_TimeWarpSoundEditBox:SetText("timewarp.mp3")
        else
            MageNugSoundOptionFrame_TimeWarpSoundEditBox:SetText(MageNugz.timewarpSound)
        end
        if (MageNugz.timewarpSoundToggle == true) or (MageNugz.timewarpSoundToggle == nil) then
            MageNugSoundOptionFrame_TimeWarpCheckButton:SetChecked(1);
            MageNugz.timewarpSoundToggle = true;
        else
            MageNugSoundOptionFrame_TimeWarpCheckButton:SetChecked(0);
        end
       
        ---cooldown options-----
        if (MageNugz.cooldownToggle == nil) then
            MageNugz.cooldownToggle = false;
        end
        if (MageNugz.cooldownToggle == true) then
            MageNugCooldownFrame_cdButton:SetChecked(1);        
        else
            MageNugCooldownFrame_cdButton:SetChecked(0); 
            MageNugCD_Frame:Show()
        end
        if (MageNugz.apCooldown == nil) or (MageNugz.apCooldown == true) then
            MageNugCooldownFrame_apButton:SetChecked(1);
            MageNugz.apCooldown = true;
        else
            MageNugCooldownFrame_apButton:SetChecked(0);
        end
        if (MageNugz.bwCooldown == nil) or (MageNugz.bwCooldown == true) then
            MageNugCooldownFrame_bwButton:SetChecked(1);
            MageNugz.bwCooldown = true;
        else
            MageNugCooldownFrame_bwButton:SetChecked(0);
        end
        if (MageNugz.cbCooldown == nil) or (MageNugz.cbCooldown == true) then
            MageNugCooldownFrame_cbButton:SetChecked(1);
            MageNugz.cbCooldown = true;
        else
            MageNugCooldownFrame_cbButton:SetChecked(0);
        end
        if (MageNugz.csCooldown == nil) or (MageNugz.csCooldown == true) then
            MageNugCooldownFrame_csButton:SetChecked(1);
            MageNugz.csCooldown = true;
        else
            MageNugCooldownFrame_csButton:SetChecked(0);
        end
        if (MageNugz.dfCooldown == nil) or (MageNugz.dfCooldown == true) then
            MageNugCooldownFrame_dfButton:SetChecked(1);
            MageNugz.dfCooldown = true;
        else
            MageNugCooldownFrame_dfButton:SetChecked(0);
        end
        if (MageNugz.dbCooldown == nil) or (MageNugz.dbCooldown == true) then
            MageNugCooldownFrame_dbButton:SetChecked(1);
            MageNugz.dbCooldown = true;
        else
            MageNugCooldownFrame_dbButton:SetChecked(0);
        end
        if (MageNugz.mwCooldown == nil) or (MageNugz.mwCooldown == true) then
            MageNugCooldownFrame_mwButton:SetChecked(1);
            MageNugz.mwCooldown = true;
        else
            MageNugCooldownFrame_mwButton:SetChecked(0);
        end
        if (MageNugz.miCooldown == nil) or (MageNugz.miCooldown == true) then
            MageNugCooldownFrame_miButton:SetChecked(1);
            MageNugz.miCooldown = true;
        else
            MageNugCooldownFrame_miButton:SetChecked(0);
        end
        if (MageNugz.frzCooldown == nil) or (MageNugz.frzCooldown == true) then
            MageNugCooldownFrame_frzButton:SetChecked(1);
            MageNugz.frzCooldown = true;
        else
            MageNugCooldownFrame_frzButton:SetChecked(0);
        end
        if (MageNugz.msCooldown == nil) or (MageNugz.msCooldown == true) then
            MageNugCooldownFrame_msButton:SetChecked(1);
            MageNugz.msCooldown = true;
        else
            MageNugCooldownFrame_msButton:SetChecked(0);
        end
        if (MageNugz.ibrCooldown == nil) or (MageNugz.ibrCooldown == true) then
            MageNugCooldownFrame_ibrButton:SetChecked(1);
            MageNugz.ibrCooldown = true;
        else
            MageNugCooldownFrame_ibrButton:SetChecked(0);
        end
        if (MageNugz.evoCooldown == nil) or (MageNugz.evoCooldown == true) then
            MageNugCooldownFrame_evoButton:SetChecked(1);
            MageNugz.evoCooldown = true;
        else
            MageNugCooldownFrame_evoButton:SetChecked(0);
        end
        if (MageNugz.ivCooldown == nil) or (MageNugz.ivCooldown == true) then
            MageNugCooldownFrame_ivButton:SetChecked(1);
            MageNugz.ivCooldown = true;
        else
            MageNugCooldownFrame_ivButton:SetChecked(0);
        end
        if (MageNugz.treantCooldown == nil) or (MageNugz.treantCooldown == true) then
            MageNugCooldownFrame_treantButton:SetChecked(1);
            MageNugz.treantCooldown = true;
        else
            MageNugCooldownFrame_treantButton:SetChecked(0);
        end
        if (MageNugz.starfallCooldown == nil) or (MageNugz.starfallCooldown == true) then
            MageNugCooldownFrame_starfallButton:SetChecked(1);
            MageNugz.starfallCooldown = true;
        else
            MageNugCooldownFrame_starfallButton:SetChecked(0);
        end
        if (MageNugz.blinkCooldown == nil) or (MageNugz.blinkCooldown == true) then
            MageNugCooldownFrame_blinkButton:SetChecked(1);
            MageNugz.blinkCooldown = true;
        else
            MageNugCooldownFrame_blinkButton:SetChecked(0);
        end
        if (MageNugz.cooldownSize == nil) then
            MageNugCooldownFrame_Slider1:SetValue(3);
        else
            MageNugCooldownFrame_Slider1:SetValue(MageNugz.cooldownSize);
        end
        --------Priest---------------
        
        if(MageNugz.powerInfToggle == true) or (MageNugz.powerInfToggle == nil)then
            MageNugPriestOptionFrame_CheckButton0:SetChecked(1);
            MageNugz.powerInfToggle = true;
        else
            MageNugPriestOptionFrame_CheckButton0:SetChecked(0);
            MageNugz.powerInfToggle = false;
        end
        if (MageNugz.powerinfNotify == nil) or (MageNugz.powerinfNotify == "") then
            MageNugPriestOptionFrame_EditBox1:SetText("Power Infusion Cast On You")
        else
            MageNugPriestOptionFrame_EditBox1:SetText(MageNugz.powerinfNotify)
        end
        if(MageNugz.painSupToggle == true) or (MageNugz.painSupToggle == nil)then
            MageNugPriestOptionFrame_CheckButton2:SetChecked(1);
            MageNugz.painSupToggle = true;
        else
            MageNugPriestOptionFrame_CheckButton2:SetChecked(0);
            MageNugz.painSupToggle = false;
        end
        if (MageNugz.painSupNotify == nil) or (MageNugz.painSupNotify == "") then
            MageNugPriestOptionFrame_EditBox2:SetText("Pain Suppression Cast On You")
        else
            MageNugPriestOptionFrame_EditBox2:SetText(MageNugz.painSupNotify)
        end
        if(MageNugz.gspiritToggle == true) or (MageNugz.gspiritToggle == nil)then
            MageNugPriestOptionFrame_CheckButton3:SetChecked(1);
            MageNugz.gspiritToggle = true;
        else
            MageNugPriestOptionFrame_CheckButton3:SetChecked(0);
            MageNugz.gspiritToggle = false;
        end
        if (MageNugz.gspiritNotify == nil) or (MageNugz.gspiritNotify == "") then
            MageNugPriestOptionFrame_EditBox3:SetText("Guardian Spirit Cast On You")
        else
            MageNugPriestOptionFrame_EditBox3:SetText(MageNugz.gspiritNotify)
        end
       -----moonkin optioins--------
        if(MageNugz.moonkinBoxTog == true) or (MageNugz.moonkinBoxTog == nil)then
            MageNugMoonkinOptionFrame_CheckButton0:SetChecked(1);
            MageNugz.moonkinBoxTog = true;
        else
            MageNugMoonkinOptionFrame_CheckButton0:SetChecked(0);
            MageNugz.moonkinBoxTog = false;
        end
        if(MageNugz.moonkinTog == nil) then
            MageNugz.moonkinTog = false;
        end
        if (MageNugz.moonkinTog == true) then
            MageNugMoonkinOptionFrame_CheckButton:SetChecked(1);
            MageNugMoonkin_Frame:Hide();
            MNmoonFire_Frame:Hide();
            MNinsectSwarm_Frame:Hide();
            MNstarSurge_Frame:Hide();
        else
            MageNugMoonkinOptionFrame_CheckButton:SetChecked(0);
            if(MageNugz.moonkinCombat == false) then
                MageNugMoonkin_Frame:Show();
                MNmoonFire_Frame:Show();
                MNinsectSwarm_Frame:Show();
                MNstarSurge_Frame:Show();
            end
        end
        if (MageNugz.moonkinCombat == nil) then
            MageNugz.moonkinCombat = false;
        end
        if (MageNugz.moonkinCombat == true) then
            MageNugMoonkinOptionFrame_CheckButton1:SetChecked(1);
        else
            MageNugMoonkinOptionFrame_CheckButton1:SetChecked(0);
        end
         if (MageNugz.moonkinMin == nil) then
            MageNugz.moonkinMin = false;
        end
        if (MageNugz.moonkinMin == true) then
            MageNugMoonkinOptionFrame_CheckButtonMin:SetChecked(1);
        else
            MageNugMoonkinOptionFrame_CheckButtonMin:SetChecked(0);
        end
        if (MageNugz.moonkinSize == nil) then
            MageNugMoonkinOptionFrame_Slider:SetValue(3)
        else
            MageNugMoonkinOptionFrame_Slider:SetValue(MageNugz.moonkinSize)
        end
        if (MageNugz.treantSoundTog == nil) then
            MageNugz.treantSoundTog = true;
        end
        if (MageNugz.treantSoundTog == true) then
            MageNugMoonkinOptionFrame_CheckButton2:SetChecked(1);
        else
            MageNugMoonkinOptionFrame_CheckButton2:SetChecked(0);
        end
        if (MageNugz.treantSound == nil) or (MageNugz.treantSound == "") then
            MageNugMoonkinOptionFrame_SoundEditBox:SetText("mirror.mp3")
        else
            MageNugMoonkinOptionFrame_SoundEditBox:SetText(MageNugz.treantSound)
        end
        if (MageNugz.moonkinProcTog == nil) then
            MageNugz.moonkinProcTog = true;
        end
        if (MageNugz.moonkinProcTog == true) then
            MageNugMoonkinOptionFrame_ProcCheckButton:SetChecked(1)
        else
            MageNugMoonkinOptionFrame_ProcCheckButton:SetChecked(0)
        end
        if (MageNugz.moonkinCombatText == nil)then
            MageNugz.moonkinCombatText = true
        end
        if (MageNugz.moonkinCombatText == true) then
            MageNugMoonkinOptionFrame_CheckButton3:SetChecked(1);
        else
            MageNugMoonkinOptionFrame_CheckButton3:SetChecked(0);
        end
        if (MageNugz.innervatNotify == nil) or (MageNugz.innervatNotify == "") then
            MageNugMoonkinOptionFrame_InnervateEditBox:SetText("Innervate Cast On You!")
        else
            MageNugMoonkinOptionFrame_InnervateEditBox:SetText(MageNugz.innervatNotify)
        end
        if(MageNugz.castBoxes == nil)then
            MageNugz.castBoxes = true;
        end
        if(MageNugz.castBoxes == true)then
            MageNugMoonkinOptionFrame_CastCheckButton:SetChecked(1)
        else
            MageNugMoonkinOptionFrame_CastCheckButton:SetChecked(0)
        end
        if (MageNugz.moonkinProcSize == nil) then
            MageNugMoonkinOptionFrame_Slider1:SetValue(3);
        else
            MageNugMoonkinOptionFrame_Slider1:SetValue(MageNugz.moonkinProcSize);
        end
        if (MageNugz.moonkinAnchorTog == nil) then
            MageNugz.moonkinAnchorTog = true;
        end
        if(MageNugz.moonkinAnchorTog == true)then
            MageNugMoonkinOptionFrame_CheckButtonAnchor:SetChecked(1)
        else
            MageNugMoonkinOptionFrame_CheckButtonAnchor:SetChecked(0)
        end
        soundPlayed = false;
        ------------------------------
        MageNugPolyFrame:Hide();
        MageNugImpactProcFrame:Hide();
        MageNugBFProcFrame:Hide();
        MageNugProcFrame:Hide();
        MageNugMBProcFrame:Hide();
        MageNugFoFProcFrame:Hide(); 
        MageNugAB_Frame:Hide();
        MNcritMass_Frame:Hide();
        paralysisId, _, _, _, _, _, _, _, _ = GetSpellInfo(115078);
        shackleId, _, _, _, _, _, _, _, _ = GetSpellInfo(9484);
        iceBlockId, _, _, _, _, _, _, _, _ = GetSpellInfo(45438);
        livingBombId, _, _, _, _, _, _, _, _ = GetSpellInfo(44457);
        netherTempestId, _, _, _, _, _, _, _, _ = GetSpellInfo(114923);
        icyVeinsId, _, _, _, _, _, _, _, _ = GetSpellInfo(12472);
        polyPigId, _, _, _, _, _, _, _, _ = GetSpellInfo(28272);
        polySheepId, _, _, _, _, _, _, _, _ = GetSpellInfo(28272);
        polyTurtleId, _, _, _, _, _, _, _, _ = GetSpellInfo(28272);
        polyRabbitId, _, _, _, _, _, _, _, _ = GetSpellInfo(28272);
        polyCatId, _, _, _, _, _, _, _, _ = GetSpellInfo(28272);
        frostboltId, _, _, _, _, _, _, _, _ = GetSpellInfo(42842);
        frostfireId, _, _, _, _, _, _, _, _ = GetSpellInfo(47610);
        conecoldId, _, _, _, _, _, _, _, _ = GetSpellInfo(42931);
        blastwaveId, _, _, _, _, _, _, _, _ = GetSpellInfo(42945);
        judgementjustId, _, _, _, _, _, _, _, _ = GetSpellInfo(53696);
        infectedwoundsId, _, _, _, _, _, _, _, _ = GetSpellInfo(48485);
        thunderclapId, _, _, _, _, _, _, _, _ = GetSpellInfo(47502);
        deadlythrowId, _, _, _, _, _, _, _, _ = GetSpellInfo(48674);
        frostshockId, _, _, _, _, _, _, _, _ = GetSpellInfo(49236);
        chilledId, _, _, _, _, _, _, _, _ = GetSpellInfo(7321); 
        mindflayId, _, _, _, _, _, _, _, _ = GetSpellInfo(48156);
        impactId, _, _, _, _, _, _, _, _ = GetSpellInfo(64343);
        managemId, _, _, _, _, _, _, _, _ = GetSpellInfo(36799);
        MageNugz_MinimapButton_Move()
        MnClickThrough()
        MNmoonkinAnchorToggle()
        incombat = 0;
        
        if(MageNugz_Frames.frostbomb_point == nil) then
            MageNugz_Frames.frostbomb_point = "CENTER";
        end
        if(MageNugz_Frames.frostbomb_relativePoint == nil) then
            MageNugz_Frames.frostbomb_relativePoint = "CENTER";
        end
        if(MageNugz_Frames.frostbomb_xOfs == nil) then
            MageNugz_Frames.frostbomb_xOfs = 0;
        end
        if(MageNugz_Frames.frostbomb_yOfs == nil) then
            MageNugz_Frames.frostbomb_yOfs = 0;
        end
        
        if(MageNugz_Frames.invokers_point == nil) then
            MageNugz_Frames.invokers_point = "CENTER";
        end
        if(MageNugz_Frames.invokers_relativePoint == nil) then
            MageNugz_Frames.invokers_relativePoint = "CENTER";
        end
        if(MageNugz_Frames.invokers_xOfs == nil) then
            MageNugz_Frames.invokers_xOfs = 0;
        end
        if(MageNugz_Frames.invokers_yOfs == nil) then
            MageNugz_Frames.invokers_yOfs = 0;
        end
        
        if(MageNugz_Frames.hu_point == nil) then
            MageNugz_Frames.hu_point = "CENTER";
        end
        if(MageNugz_Frames.hu_relativePoint == nil) then
            MageNugz_Frames.hu_relativePoint = "CENTER";
        end
        if(MageNugz_Frames.hu_xOfs == nil) then
            MageNugz_Frames.hu_xOfs = 0;
        end
        if(MageNugz_Frames.hu_yOfs == nil) then
            MageNugz_Frames.hu_yOfs = 0;
        end
end

function MageNuggetsOptions() --Options Frame
    local MageNugOptions = CreateFrame("FRAME", "MageNugOptions", InterfaceOptionsFrame)
    MageNugOptions.name = "Mage Nuggets"
    InterfaceOptions_AddCategory(MageNugOptions)
    MageNugOptions:SetPoint("TOPLEFT", InterfaceOptionsFrame, "BOTTOMRIGHT", 0, 0)
    
    local statmonOptions = CreateFrame("FRAME", "statmonOptions");
    statmonOptions.name = "Stat Monitor";
    statmonOptions.parent = "Mage Nuggets";
    InterfaceOptions_AddCategory(statmonOptions); 
    statmonOptions:SetPoint("TOPLEFT", InterfaceOptionsFrame, "BOTTOMRIGHT", 0, 0)

    local msgOptions = CreateFrame("FRAME", "msgOptions");
    msgOptions.name = "Messages";
    msgOptions.parent = "Mage Nuggets";
    InterfaceOptions_AddCategory(msgOptions); 
    msgOptions:SetPoint("TOPLEFT", InterfaceOptionsFrame, "BOTTOMRIGHT", 0, 0)
    
    local soundOptions = CreateFrame("FRAME", "soundOptions");
    soundOptions.name = "Sounds";
    soundOptions.parent = "Mage Nuggets";
    InterfaceOptions_AddCategory(soundOptions); 
    soundOptions:SetPoint("TOPLEFT", InterfaceOptionsFrame, "BOTTOMRIGHT", 0, 0)
    
    local priestOptions = CreateFrame("FRAME", "priestOptions");
    priestOptions.name = "Priest";
    priestOptions.parent = "Mage Nuggets";
    InterfaceOptions_AddCategory(priestOptions); 
    priestOptions:SetPoint("TOPLEFT", InterfaceOptionsFrame, "BOTTOMRIGHT", 0, 0)
    
    local moonkinOptions = CreateFrame("FRAME", "moonkinOptions");
    moonkinOptions.name = "Moonkin";
    moonkinOptions.parent = "Mage Nuggets";
    InterfaceOptions_AddCategory(moonkinOptions); 
    moonkinOptions:SetPoint("TOPLEFT", InterfaceOptionsFrame, "BOTTOMRIGHT", 0, 0)
    
    local mnOptions = CreateFrame("FRAME", "mnOptions");
    mnOptions.name = "Options";
    mnOptions.parent = "Mage Nuggets";
    InterfaceOptions_AddCategory(mnOptions); 
    mnOptions:SetPoint("TOPLEFT", InterfaceOptionsFrame, "BOTTOMRIGHT", 0, 0)
    
    local mnCooldowns = CreateFrame("FRAME", "mnCooldowns");
    mnCooldowns.name = "Cooldowns";
    mnCooldowns.parent = "Mage Nuggets";
    InterfaceOptions_AddCategory(mnCooldowns); 
    mnCooldowns:SetPoint("TOPLEFT", InterfaceOptionsFrame, "BOTTOMRIGHT", 0, 0)

end

function hideMonitorToggle() -- Monitor Toggle
    local monitorChecked = MageNugStatMonOptionFrame_CheckButton1:GetChecked();
    if (monitorChecked == 1) then
	    MageNugSP_Frame:Hide();
        MageNugz.spMonitorToggle = true;
    else
        if (MageNugz.spCombatToggle == false) then
            MageNugSP_Frame:Show();
        end
        MageNugz.spMonitorToggle = false;
    end
end
--
function MNstatMonCombat()
    local statChecked = MageNugStatMonOptionFrame_CheckButton0:GetChecked();
    if (statChecked == 1) then
        MageNugz.spCombatToggle = true;
        MageNugSP_Frame:Hide();
    else
        MageNugz.spCombatToggle = false;
        if(MageNugz.spMonitorToggle == false) then
            MageNugSP_Frame:Show();
        end
    end
end
--
function MNigniteToggle()
    local isChecked = MageNugOptionsFrame_IgniteCheckButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.igniteTog = true;
    else
        MageNugz.igniteTog = false;
    end
end
--
function MNsimpleUItoggle()
    local isChecked = MageNugOption2Frame_SimpleUICheckButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.simpleUiToggle = true;
        MageNugProcFrameTextureBorder:SetTexture();
        MageNugBFProcFrameTextureBorder:SetTexture();
        MageNugProcHUFrameTextureBorder:SetTexture();
        MageNugCauterizeFrameTextureBorder:SetTexture();
        MageNugPolyFrameTextureBorder:SetTexture();
        MageNugFoFProcFrameTextureBorder:SetTexture();
        MageNugMBProcFrameTextureBorder:SetTexture();
        MNBombMonitorDress();
    else
        MageNugz.simpleUiToggle = false;
        MageNugProcFrameTextureBorder:SetTexture("Interface\\UNITPOWERBARALT\\Fire_Horizontal_Frame");
        MageNugBFProcFrameTextureBorder:SetTexture("Interface\\UNITPOWERBARALT\\Fire_Horizontal_Frame");
        MageNugProcHUFrameTextureBorder:SetTexture("Interface\\UNITPOWERBARALT\\Fire_Horizontal_Frame");
        MageNugCauterizeFrameTextureBorder:SetTexture("Interface\\UNITPOWERBARALT\\Fire_Horizontal_Frame");
        MageNugPolyFrameTextureBorder:SetTexture("Interface\\UNITPOWERBARALT\\MetalEternium_Horizontal_Frame");
        MageNugFoFProcFrameTextureBorder:SetTexture("Interface\\UNITPOWERBARALT\\Ice_Horizontal_Frame");
        MageNugMBProcFrameTextureBorder:SetTexture("Interface\\GMChatFrame\\UI-GMStatusFrame-Pulse");
        MNBombMonitorDress();
    end
end
--
function MNMinimapButtonToggle()
    local mini = MageNugOption2Frame_MinimapCheckButton:GetChecked();
    if (mini == 1) then
        MageNugz.minimapToggle = false; 
        MageNug_MinimapFrame:Hide();
    else
        MageNugz.minimapToggle = true; 
        MageNug_MinimapFrame:Show();
    end
end

function HideSSMonitorToggle() -- Spellsteal Monitor Toggle
    local stealMonitorChecked = MageNugOptionsFrame_CheckButton2:GetChecked();
    if (stealMonitorChecked == 1) then
	    MageNugz.ssMonitorToggle = false; 
    else
        MageNugz.ssMonitorToggle = true;
    end
end

function MNmgCombatToggle()
    local isChecked = MageNugOptionsFrame_CheckButtonMGcombat:GetChecked();
    if (isChecked == 1) then
	    MageNugz.mgCombatTog = true; 
        MageNugManaGem_Frame:Hide();
    else
        MageNugz.mgCombatTog = false;
        if(MageNugz.managemToggle == true) then
            MageNugManaGem_Frame:Show();
        end
    end
end
--
function MNInvokersToggle()
    local isChecked = MageNugOptionsFrame_CheckButtonIE:GetChecked();
    if (isChecked == 1) then
	    MageNugz.invokersToggle = true; 
        MageNugInvokers_Frame:Hide();
    else
        MageNugz.invokersToggle = false;
        MageNugInvokers_Frame:Show();
    end
end

function MNAlterTimeToggle()
    local isChecked = MageNugOptionsFrame_CheckButtonAlterTime:GetChecked();
    if (isChecked == 1) then
	    MageNugz.alterTimeToggle = false; 
    else
        MageNugz.alterTimeToggle = true;
    end
end

function MNmessagesToggle() --slowfall notify Toggle
    local msgTog = MageNugMsgOptionFrame_CheckButton:GetChecked();
    if (msgTog == 1) then
	    MageNugz.msgToggle = true; 
    else
        MageNugz.msgToggle = false;
    end
end

function MNpainSupNotifyToggle() -- pain suppression notify toggle
    local msgTog = MageNugPriestOptionFrame_CheckButton2:GetChecked();
    if (msgTog == 1) then
	    MageNugz.painSupToggle = true; 
    else
        MageNugz.painSupToggle = false;
    end
end

function MNgspiritNotifyToggle() -- g spirit notify toggle
    local msgTog = MageNugPriestOptionFrame_CheckButton3:GetChecked();
    if (msgTog == 1) then
	    MageNugz.gspiritToggle = true; 
    else
        MageNugz.gspiritToggle = false;
    end
end


function MNpowerInfNotifyToggle() -- power inf notify toggle
    local msgTog = MageNugPriestOptionFrame_CheckButton0:GetChecked();
    if (msgTog == 1) then
	    MageNugz.powerInfToggle = true; 
    else
        MageNugz.powerInfToggle = false;
    end
end

function MNfocusMagicNotifyToggle() -- Focus magic notify toggle
    local msgTog = MageNugMsgOptionFrame_CheckButton2:GetChecked();
    if (msgTog == 1) then
	    MageNugz.symbiosisnToggle = true; 
    else
        MageNugz.symbiosisnToggle = false;
    end
end

function MNfocusMagicThanksToggle() -- Focus magic thanks toggle
    local msgTog = MageNugMsgOptionFrame_CheckButton3:GetChecked();
    if (msgTog == 1) then
	    MageNugz.symbiosistyToggle = true; 
    else
        MageNugz.symbiosistyToggle = false;
    end
end

function MNinnervateThanksToggle() -- innervate thanks toggle
    local msgTog = MageNugMsgOptionFrame_CheckButton4:GetChecked();
    if (msgTog == 1) then
	    MageNugz.innertyToggle = true; 
    else
        MageNugz.innertyToggle = false;
    end
end
function MNpowerInfusionTyToggle() -- Power infusion thanks toggle
    local msgTog = MageNugMsgOptionFrame_CheckButton5:GetChecked();
    if (msgTog == 1) then
	    MageNugz.pityToggle = true; 
    else
        MageNugz.pityToggle = false;
    end
end
function MNdarkIntentTyToggle() -- dark intent thanks toggle
    local msgTog = MageNugMsgOptionFrame_CheckButton6:GetChecked();
    if (msgTog == 1) then
	    MageNugz.dityToggle = true; 
    else
        MageNugz.dityToggle = false;
    end
end




function MNCauterizeToggle()
    local isChecked = CauterizeCheckButton:GetChecked();
    if (isChecked == 1) then
	    MageNugz.cauterizeToggle = true; 
    else
        MageNugz.cauterizeToggle = false;
    end
end


function MageProcNoteToggle() -- Mage Proc Notification Toggle
    local cNotifyChecked = MageNugOptionsFrame_CheckButton3:GetChecked();
    if (cNotifyChecked == 1) then
	    MageNugz.mageProcToggle = false;
    else
        MageNugz.mageProcToggle = true;
    end
end

function cameraZoomToggle() -- Camera Zoom Out Toggle
    local camZoomChecked = MageNugOption2Frame_CameraCheckButton:GetChecked();
    if (camZoomChecked == 1) then
        ConsoleExec("cameraDistanceMax 15");
        MageNugz.camZoomTogg = false;
    else  
        ConsoleExec("cameraDistanceMax 50");
        MageNugz.camZoomTogg = true;
    end
end

function MirrorImageSoundToggle() -- Mirror Image Sound Toggle
    local miChecked = MageNugSoundOptionFrame_MICheckButton:GetChecked();
    if (miChecked == 1) then
        MageNugz.miSoundToggle = true;
    else  
        MageNugz.miSoundToggle = false;
    end
end

function ProcSoundToggle() -- Proc Sound Toggle
    local procChecked = MageNugSoundOptionFrame_ProcCheckButton:GetChecked();
    if (procChecked == 1) then
        MageNugz.procSoundToggle = true;
    else  
        MageNugz.procSoundToggle = false;
    end
end

function PolySoundToggle() -- Poly Sound Toggle
    local isChecked = MageNugSoundOptionFrame_PolyCheckButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.polySoundToggle = true;
    else  
        MageNugz.polySoundToggle = false;
    end
end

function BlastStackSoundToggle() -- Arcane Blast \ Stack Sound Toggle
    local isChecked = MageNugSoundOptionFrame_ABCheckButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.ABSoundToggle = true;
    else  
        MageNugz.ABSoundToggle = false;
    end
end

function HotStreakSoundToggle() -- HS Sound Toggle
    local isChecked = MageNugSoundOptionFrame_HotStreakCheckButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.hsSoundToggle = true;
    else  
        MageNugz.hsSoundToggle = false;
    end
end

function CauterizeSoundToggle() -- Cauterize Sound Toggle
    local isChecked = MageNugSoundOptionFrame_CauterizeCheckButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.cauterizeSoundToggle = true;
    else  
        MageNugz.cauterizeSoundToggle = false;
    end
end

function TimeWarpSoundToggle() -- time warp Sound Toggle
    local isChecked = MageNugSoundOptionFrame_TimeWarpCheckButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.timewarpSoundToggle = true;
    else  
        MageNugz.timewarpSoundToggle = false;
    end
end

function ImpactSoundToggle() -- Impact Sound Toggle
    local isChecked = MageNugSoundOptionFrame_ImpactCheckButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.impactSoundToggle = true;
    else  
        MageNugz.impactSoundToggle = false;
    end
end

function FoFSoundToggle() -- FoF Sound Toggle
    local isChecked = MageNugSoundOptionFrame_FoFCheckButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.fofSoundToggle = true;
    else  
        MageNugz.fofSoundToggle = false;
    end
end

function BrainFreezeSoundToggle() --Brain Freeze Sound Toggle
    local isChecked = MageNugSoundOptionFrame_BrainFreezeCheckButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.brainfreezeSoundToggle = true;
    else  
        MageNugz.brainfreezeSoundToggle = false;
    end
end

function MirrorImagToggle() -- Mirror Image Timer Toggle
    local mirrorChecked = MageNugOptionsFrame_CheckButton6:GetChecked();
    if (mirrorChecked == 1) then
        MageNugz.mirrorImageToggle = false;
    else  
        MageNugz.mirrorImageToggle = true;
    end
end

function MageArmorToggle() -- Mage Armor Notify Toggle
    local maChecked = MageNugOptionsFrame_CheckButton7:GetChecked();
    if (maChecked == 1) then
        MageNugz.mageArmorToggle = false;
    else  
        MageNugz.mageArmorToggle = true;
    end
end

function EvoToggle() -- Evocation Toggle
    local evoChecked = MageNugOptionsFrame_CheckButton8:GetChecked();
    if (evoChecked == 1) then
        MageNugz.evocationToggle = false;
    else  
        MageNugz.evocationToggle = true;
    end
end

function LivingBToggle() -- Living Bomb Toggle
    local lbChecked = MageNugOptionsFrame_CheckButton9:GetChecked();
    if (lbChecked == 1) then
        MageNugz.livingBombToggle = false;
    else  
        MageNugz.livingBombToggle = true;
    end
end

function MNabCastTimeToggle() -- AB Cast Time Toggle
    local abcChecked = MageNugOptionsFrame_ABcastCheckButton:GetChecked();
    if (abcChecked == 1) then
        MageNugz.abCastTimeToggle = true;
        MNabCast_Frame:Show();
    else  
        MageNugz.abCastTimeToggle = false;
        MNabCast_Frame:Hide();
    end
end

function MageProcMonitorToggle()
    local mpChecked = MageNugOptionsFrame_CheckButton11:GetChecked();
    if (mpChecked == 1) then
        MageNugz.procMonitorToggle = false;
    else  
        MageNugz.procMonitorToggle = true;
    end
end

function MNArcaneBlastToggle()
    local abChecked = MageNugOptionsFrame_CheckButton13:GetChecked();
    if (abChecked == 1) then
        MageNugz.arcaneBlastToggle = false;
    else  
        MageNugz.arcaneBlastToggle = true;
    end
end

function MNpolyToggle()
    local polyChecked = MageNugOptionsFrame_CheckButton14:GetChecked();
    if (polyChecked == 1) then
        MageNugz.polyToggle = false;
    else  
        MageNugz.polyToggle = true;
    end
end

function BuffMonitorsToggle()
    local buffsChecked = MageNugStatMonOptionFrame_CheckButton2:GetChecked();
    if (buffsChecked == 1) then
	    MageNugz.buffmonToggle = true;
    else
        MageNugz.buffmonToggle = false;
    end
end

function MnClickThrough()
    local clickChecked = MageNugOption2Frame_ClickThruCheckButton:GetChecked();
    if (clickChecked == 1) then
        MageNugz.clickthru = true;
        MNSpellStealFocus_Frame:EnableMouse(false);
        MageNugIgnite_Frame:EnableMouse(false)
        MageNugSP_Frame:EnableMouse(false)
        MNicyveins_Frame:EnableMouse(false)
        MNarcanepower_Frame:EnableMouse(false)
        MageNugCauterize_Frame:EnableMouse(false);
        MNlust_Frame:EnableMouse(false)
        MageNugClearcast_Frame:EnableMouse(false)
        MNcritMass_Frame:EnableMouse(false)
        MageNugAB_Frame:EnableMouse(false)
        MNabCast_Frame:EnableMouse(false)
        MageNugProcFrame:EnableMouse(false)
        MageNugProcHUFrame:EnableMouse(false)
        MageNugPolyFrame:EnableMouse(false)
        MageNugImpactProcFrame:EnableMouse(false)
        MageNugBFProcFrame:EnableMouse(false)
        MageNugMBProcFrame:EnableMouse(false)
        MageNugFoFProcFrame:EnableMouse(false)
        MNSpellSteal_Frame:EnableMouse(false)
        MageNugMI_Frame:EnableMouse(false)
        MageNugCD_Frame:EnableMouse(false)
        MageNugInvokers_Frame:EnableMouse(false)
        MageNugInvokers_Frame_Bar:EnableMouse(false)
        MageNugLB_Frame:EnableMouse(false)
        MageNugMoonkin_Frame:EnableMouse(false)
        MageNugSSProcFrame:EnableMouse(false)
        MageNugCastStarsurgeFrame:EnableMouse(false)
        MageNugCastMoonFrame:EnableMouse(false)
        MageNugCastInsectFrame:EnableMouse(false)
        MNmoonFire_Frame:EnableMouse(false)
        MNinsectSwarm_Frame:EnableMouse(false)
        MNstarSurge_Frame:EnableMouse(false)
    else
        MageNugz.clickthru = false;
        MNSpellStealFocus_Frame:EnableMouse(true);
        MageNugSP_Frame:EnableMouse(true)
        MageNugIgnite_Frame:EnableMouse(true)
        MNicyveins_Frame:EnableMouse(true)
        MNarcanepower_Frame:EnableMouse(true)
        MNlust_Frame:EnableMouse(true)
        MageNugClearcast_Frame:EnableMouse(true)
        MNcritMass_Frame:EnableMouse(true)
        MageNugCauterize_Frame:EnableMouse(true);
        MageNugAB_Frame:EnableMouse(true)
        MNabCast_Frame:EnableMouse(true)
        MageNugProcFrame:EnableMouse(true)
        MageNugProcHUFrame:EnableMouse(true)
        MageNugPolyFrame:EnableMouse(true)
        MageNugImpactProcFrame:EnableMouse(true)
        MageNugBFProcFrame:EnableMouse(true)
        MageNugMBProcFrame:EnableMouse(true)
        MageNugFoFProcFrame:EnableMouse(true)
        MNSpellSteal_Frame:EnableMouse(true)
        MageNugMI_Frame:EnableMouse(true)
        MageNugCD_Frame:EnableMouse(true)
        MageNugInvokers_Frame:EnableMouse(true)
        MageNugInvokers_Frame_Bar:EnableMouse(true)
        MageNugLB_Frame:EnableMouse(true)
        MageNugMoonkin_Frame:EnableMouse(true)
        MageNugSSProcFrame:EnableMouse(true)
        MageNugCastStarsurgeFrame:EnableMouse(true)
        MageNugCastMoonFrame:EnableMouse(true)
        MageNugCastInsectFrame:EnableMouse(true)
        MNmoonFire_Frame:EnableMouse(true)
        MNinsectSwarm_Frame:EnableMouse(true)
        MNstarSurge_Frame:EnableMouse(true)
    end
end

function ShowConfigFrames() --Shows frames for 120 seconds
    if (MageNugz.ssMonitorToggle == true) then
        spellStealTog = 120;
        MNSpellSteal_Frame:Show();
        MNSpellStealFocus_Frame:Show();
    end
    mirrorImageTime = 120;
    MageNugMI_Frame:Show();
    livingbombGlobalTime = 120;
    MageNugLB_Frame:Show();
    ignitetimer = 120;
    MageNugIgnite_Frame:Show();
    MageNugInvokers_Frame:Show();
    --MNcooldownMonitor("Cooldowns", 60, "Interface\\Icons\\Spell_frost_coldhearted")
    --MNcooldownMonitor("Cooldowns", 60, "Interface\\Icons\\Spell_frost_coldhearted")
    --MNcooldownMonitor("Cooldowns", 60, "Interface\\Icons\\Spell_frost_coldhearted")
    --MNcooldownMonitor("Cooldowns", 60, "Interface\\Icons\\Spell_frost_coldhearted")
    --MNcooldownMonitor("Cooldowns", 60, "Interface\\Icons\\Spell_frost_coldhearted")
    --MNcooldownMonitor("Cooldowns", 60, "Interface\\Icons\\Spell_frost_coldhearted")
    polyTimer = 120
    MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph")
    MageNugPolyFrame:Show();
    mageImpProgMonTime = 120;
    mageProcBFTime = 120;
    MageNugBFProcFrameText:SetText("|cffFF3300".."BRAIN FREEZE!")
    MageNugBFProcFrame:Show();
    mageProcHSTime = 120;
    MageNugProcFrameText:SetText("|cffFF0000".."HOT STREAK!");
    MageNugProcFrame:Show();
    mageProcHUTime = 120;
    MageNugProcHUFrameText:SetText("|cffFFCC00".."HEATING UP!");
    MageNugProcHUFrame:Show();
    mageProcMBTime = 120;
    misslebTog = 120;
    MageNugMBProcFrameText:SetText("|cffFF33FF".."ARCANE MISSILES!")
    MageNugMBProcFrame:Show();
    fofProgMonTime = 120;
    MageNugFoFProcFrameText:SetText("|cffFFFFFF".."Fingers Of Frost")
    MageNugFoFProcFrame:Show(); 
    cauterizeTime = 120;
    MageNugCauterize_Frame:Show();
    abProgMonTime = 120;
    MageNugAB_Frame:Show();
    clearcastTime = 120;
    MageNugClearcast_Frame:Show();
    MageNugCauterizeFrame:Show();
end

function HideConfigFrames()
    MageNugCauterize_Frame:Hide();
    MNSpellSteal_Frame:Hide();
    MNSpellStealFocus_Frame:Hide();
    MageNugMI_Frame:Hide();
    MageNugLB_Frame:Hide();
    MageNugPolyFrame:Hide();
    MageNugIgnite_Frame:Hide();
    MageNugImpactProcFrame:Hide()
    MageNugBFProcFrame:Hide();
    MageNugProcFrame:Hide();
    MageNugProcHUFrame:Hide();
    MageNugMBProcFrame:Hide();
    MageNugFoFProcFrame:Hide(); 
    MageNugAB_Frame:Hide();
    MageNugInvokers_Frame:Hide();
    MageNugClearcast_Frame:Hide();
    MageNugCauterizeFrame:Hide();
end


function LockFramesToggle()
    local flChecked = MageNugOption2Frame_LockFramesCheckButton:GetChecked();
    if (flChecked == 1) then
        MageNugz.lockFrames = true;
    else  
        MageNugz.lockFrames = false;
    end
end

function ConsoleTextToggle()
    local ctChecked = MageNugOption2Frame_ConsoleTextCheckButton:GetChecked();
    if (ctChecked == 1) then
        MageNugz.consoleTextEnabled = false;
    else
        MageNugz.consoleTextEnabled = true;
    end
end

function MNtoolTipToggle()
    local ttChecked = MageNugOption2Frame_CheckButtonTT:GetChecked();
    if (ttChecked == 1) then
        MageNugz.toolTips = true;
    else
        MageNugz.toolTips = false;
    end
end



function MNclearcastToggle()
    local ccChecked = MageNugOptionsFrame_CheckButtonCC:GetChecked();
    if (ccChecked == 1) then
        MageNugz.clearcastToggle = false;
    else
        MageNugz.clearcastToggle = true;
    end
end
--
function MNmanagemToggle()
    local isChecked = MageNugOptionsFrame_CheckButtonMG:GetChecked();
    if (isChecked == 1) then
        MageNugz.managemToggle = false;
        MageNugManaGem_Frame:Hide();
    else
        MageNugz.managemToggle = true;
        MageNugManaGem_Frame:Show();
    end
end
----------cooldown monitor-------------
function MNcooldownMonitor(name, expiretime, texture)
    if(MageNugCD1_Frame_Bar:GetValue() < 1)then
        MageNugCD1_Frame_Bar:SetMinMaxValues(0,expiretime)
        MageNugCD1_Frame_Text:SetText(name)
        MageNugCD1_Frame_Text2:SetText("!")
        MageNugCD1_Frame_Texture:SetTexture(texture)
        MageNugCD1_Frame:Show()
    elseif(MageNugCD2_Frame_Bar:GetValue() < 1)then
        MageNugCD2_Frame_Bar:SetMinMaxValues(0,expiretime)
        MageNugCD2_Frame_Text:SetText(name)
        MageNugCD2_Frame_Text2:SetText("!")
        MageNugCD2_Frame_Texture:SetTexture(texture)
        MageNugCD2_Frame:Show()
    elseif(MageNugCD3_Frame_Bar:GetValue() < 1)then
        MageNugCD3_Frame_Bar:SetMinMaxValues(0,expiretime)
        MageNugCD3_Frame_Text:SetText(name)
        MageNugCD3_Frame_Text2:SetText("!")
        MageNugCD3_Frame_Texture:SetTexture(texture)
        MageNugCD3_Frame:Show()
    elseif(MageNugCD4_Frame_Bar:GetValue() < 1)then
        MageNugCD4_Frame_Bar:SetMinMaxValues(0,expiretime)
        MageNugCD4_Frame_Text:SetText(name)
        MageNugCD4_Frame_Text2:SetText("!")
        MageNugCD4_Frame_Texture:SetTexture(texture)
        MageNugCD4_Frame:Show()
    elseif(MageNugCD5_Frame_Bar:GetValue() < 1)then
        MageNugCD5_Frame_Bar:SetMinMaxValues(0,expiretime)
        MageNugCD5_Frame_Text:SetText(name)
        MageNugCD5_Frame_Text2:SetText("!")
        MageNugCD5_Frame_Texture:SetTexture(texture)
        MageNugCD5_Frame:Show()
    elseif(MageNugCD6_Frame_Bar:GetValue() < 1)then
        MageNugCD6_Frame_Bar:SetMinMaxValues(0,expiretime)
        MageNugCD6_Frame_Text:SetText(name)
        MageNugCD6_Frame_Text2:SetText("!")
        MageNugCD6_Frame_Texture:SetTexture(texture)
        MageNugCD6_Frame:Show()
    end
end
--
function MNCooldownToggle()
    local cdChecked = MageNugCooldownFrame_cdButton:GetChecked();
    if (cdChecked == 1) then
        MageNugz.cooldownToggle = true;
        MageNugCD_Frame:Hide();
    else  
        MageNugz.cooldownToggle = false;
        MageNugCD_Frame:Show();
    end
end
--
function MageNuggetsCD1_OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate >= 0.1) then   
        local start, duration, enabled = GetSpellCooldown(MageNugCD1_Frame_Text:GetText());
        if(start ~= nil) and (duration ~= nil) then
            local timeleft = RoundZero(start + duration - GetTime())
            MageNugCD1_Frame_Bar:SetValue(timeleft);
            MageNugCD1_Frame_Text2:SetText(timeleft.."s")
            if (timeleft <= 0) then
                MageNugCD1_Frame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsCD2_OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate >= 0.1) then   
        local start, duration, enabled = GetSpellCooldown(MageNugCD2_Frame_Text:GetText());
        if(start ~= nil) and (duration ~= nil) then    
            local timeleft = RoundZero(start + duration - GetTime())
            MageNugCD2_Frame_Bar:SetValue(timeleft);
            MageNugCD2_Frame_Text2:SetText(timeleft.."s")
            if (timeleft <= 0) then
                MageNugCD2_Frame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsCD3_OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate >= 0.1) then   
        local start, duration, enabled = GetSpellCooldown(MageNugCD3_Frame_Text:GetText());
        if(start ~= nil) and (duration ~= nil) then
            local timeleft = RoundZero(start + duration - GetTime())
            MageNugCD3_Frame_Bar:SetValue(timeleft);
            MageNugCD3_Frame_Text2:SetText(timeleft.."s")
            if (timeleft <= 0) then
                MageNugCD3_Frame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsCD4_OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate >= 0.1) then   
        local start, duration, enabled = GetSpellCooldown(MageNugCD4_Frame_Text:GetText());
        if(start ~= nil) and (duration ~= nil) then            
            local timeleft = RoundZero(start + duration - GetTime())
            MageNugCD4_Frame_Bar:SetValue(timeleft);
            MageNugCD4_Frame_Text2:SetText(timeleft.."s")
            if (timeleft <= 0) then
                MageNugCD4_Frame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsCD5_OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate >= 0.1) then   
        local start, duration, enabled = GetSpellCooldown(MageNugCD5_Frame_Text:GetText());
        if(start ~= nil) and (duration ~= nil) then
            local timeleft = RoundZero(start + duration - GetTime())
            MageNugCD5_Frame_Bar:SetValue(timeleft);
            MageNugCD5_Frame_Text2:SetText(timeleft.."s")
            if (timeleft <= 0) then
                MageNugCD5_Frame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsCD6_OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate >= 0.1) then   
        local start, duration, enabled = GetSpellCooldown(MageNugCD6_Frame_Text:GetText());
        if(start ~= nil) and (duration ~= nil) then
            local timeleft = RoundZero(start + duration - GetTime())
            MageNugCD6_Frame_Bar:SetValue(timeleft);
            MageNugCD6_Frame_Text2:SetText(timeleft.."s")
            if (timeleft <= 0) then
                MageNugCD6_Frame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end   
end
--
function MNapCooldown()
    local isChecked = MageNugCooldownFrame_apButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.apCooldown = true;
    else  
        MageNugz.apCooldown = false;
    end
end
--
function MNbwCooldown()
    local isChecked = MageNugCooldownFrame_bwButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.bwCooldown = true;
    else  
        MageNugz.bwCooldown = false;
    end
end
--
function MNcbCooldown()
    local isChecked = MageNugCooldownFrame_cbButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.cbCooldown = true;
    else  
        MageNugz.cbCooldown = false;
    end
end
--
function MNcsCooldown()
    local isChecked = MageNugCooldownFrame_csButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.csCooldown = true;
    else  
        MageNugz.csCooldown = false;
    end
end
--
function MNdfCooldown()
    local isChecked = MageNugCooldownFrame_dfButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.dfCooldown = true;
    else  
        MageNugz.dfCooldown = false;
    end
end
--
function MNdbCooldown()
    local isChecked = MageNugCooldownFrame_dbButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.dbCooldown = true;
    else  
        MageNugz.dbCooldown = false;
    end
end
--
function MNmwCooldown()
    local isChecked = MageNugCooldownFrame_mwButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.mwCooldown = true;
    else  
        MageNugz.mwCooldown = false;
    end
end
--
function MNfrzCooldown()
    local isChecked = MageNugCooldownFrame_frzButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.frzCooldown = true;
    else  
        MageNugz.frzCooldown = false;
    end
end
--
function MNmsCooldown()
    local isChecked = MageNugCooldownFrame_msButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.msCooldown = true;
    else  
        MageNugz.msCooldown = false;
    end
end
--
function MNmiCooldown()
    local isChecked = MageNugCooldownFrame_miButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.miCooldown = true;
    else  
        MageNugz.miCooldown = false;
    end
end
--
function MNibrCooldown()
    local isChecked = MageNugCooldownFrame_ibrButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.ibrCooldown = true;
    else  
        MageNugz.ibrCooldown = false;
    end
end
--
function MNevoCooldown()
    local isChecked = MageNugCooldownFrame_evoButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.evoCooldown = true;
    else  
        MageNugz.evoCooldown = false;
    end
end
--
function MNivCooldown()
    local isChecked = MageNugCooldownFrame_ivButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.ivCooldown = true;
    else  
        MageNugz.ivCooldown = false;
    end
end
--
function MNtreantCooldown()
    local isChecked = MageNugCooldownFrame_treantButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.treantCooldown = true;
    else  
        MageNugz.treantCooldown = false;
    end
end
--
function MNstarfallCooldown()
    local isChecked = MageNugCooldownFrame_starfallButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.starfallCooldown = true;
    else  
        MageNugz.starfallCooldown = false;
    end
end
--
function MNblinkCooldown()
    local isChecked = MageNugCooldownFrame_blinkButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.blinkCooldown = true;
    else  
        MageNugz.blinkCooldown = false;
    end
end
--
function MNcooldownSlider()
    local tempInt = MageNugCooldownFrame_Slider1:GetValue()
    if (tempInt == 0) then
        MageNugCD_Frame:SetScale(0.7);
        MageNugz.cooldownSize = 0;
    end
    if (tempInt == 1) then
        MageNugCD_Frame:SetScale(0.8);
        MageNugz.cooldownSize = 1;
    end
    if (tempInt == 2) then
        MageNugCD_Frame:SetScale(0.9);
        MageNugz.cooldownSize = 2;
    end
    if (tempInt == 3) then
        MageNugCD_Frame:SetScale(1.0);
        MageNugz.cooldownSize = 3;
    end
    if (tempInt == 4) then
        MageNugCD_Frame:SetScale(1.1);
        MageNugz.cooldownSize = 4;
    end
    if (tempInt == 5) then
        MageNugCD_Frame:SetScale(1.2);
        MageNugz.cooldownSize = 5;
    end
    if (tempInt == 6) then
        MageNugCD_Frame:SetScale(1.3);
        MageNugz.cooldownSize = 6;
    end
    if (tempInt == 7) then
        MageNugCD_Frame:SetScale(1.4);
        MageNugz.cooldownSize = 7;
    end
    if (tempInt == 8) then
        MageNugCD_Frame:SetScale(1.6);
        MageNugz.cooldownSize = 8;
    end
    if (tempInt == 9) then
        MageNugCD_Frame:SetScale(1.8);
        MageNugz.cooldownSize = 9;
    end
end
-----------------
function  MageNugSpMonitorSize() --Function for the SP Slider
    local tempInt = MageNugStatMonOptionFrame_SPSizeSlider:GetValue()
    if (tempInt == 0) then
        MageNugSP_Frame:SetScale(0.7);
        MageNugz.spMonitorSize = 0;
    elseif (tempInt == 1) then
        MageNugSP_Frame:SetScale(0.8);
        MageNugz.spMonitorSize = 1;
    elseif (tempInt == 2) then
        MageNugSP_Frame:SetScale(0.9);
        MageNugz.spMonitorSize = 2;
    elseif (tempInt == 3) then
        MageNugSP_Frame:SetScale(1.0);
        MageNugz.spMonitorSize = 3;
    elseif (tempInt == 4) then
        MageNugSP_Frame:SetScale(1.1);
        MageNugz.spMonitorSize = 4;
    elseif (tempInt == 5) then
        MageNugSP_Frame:SetScale(1.2);
        MageNugz.spMonitorSize = 5;
    elseif (tempInt == 6) then
        MageNugSP_Frame:SetScale(1.3);
        MageNugz.spMonitorSize = 6;
    end
end

function  MageNugCauterizeSize() --Function Cauterize Slider
    local tempInt = MageNugOptionsFrame_Slider5:GetValue()
    if (tempInt == 0) then
        MageNugCauterizeFrame:SetScale(0.7);
        MageNugz.cautSize = 0;
    elseif (tempInt == 1) then
        MageNugCauterizeFrame:SetScale(0.8);
        MageNugz.cautSize = 1;
    elseif (tempInt == 2) then
        MageNugCauterizeFrame:SetScale(0.9);
        MageNugz.cautSize = 2;
    elseif (tempInt == 3) then
        MageNugCauterizeFrame:SetScale(1.0);
        MageNugz.cautSize = 3;
    elseif (tempInt == 4) then
        MageNugCauterizeFrame:SetScale(1.2);
        MageNugz.cautSize = 4;
    elseif (tempInt == 5) then
        MageNugCauterizeFrame:SetScale(1.4);
        MageNugz.cautSize = 5;
    elseif (tempInt == 6) then
        MageNugCauterizeFrame:SetScale(1.6);
        MageNugz.cautSize = 6;
    end
end



function  MageNugSSMonitorSize() -- SS Slider
    local tempInt = MageNugOptionsFrame_Slider2:GetValue()
    if (tempInt == 0) then
        MNSpellSteal_Frame:SetScale(0.7);
        MageNugz.ssMonitorSize = 0;
    elseif (tempInt == 1) then
        MNSpellSteal_Frame:SetScale(0.8);
        MageNugz.ssMonitorSize = 1;
    elseif (tempInt == 2) then
        MNSpellSteal_Frame:SetScale(0.9);
        MageNugz.ssMonitorSize = 2;
    elseif (tempInt == 3) then
        MNSpellSteal_Frame:SetScale(1.0);
        MageNugz.ssMonitorSize = 3;
    elseif (tempInt == 4) then
        MNSpellSteal_Frame:SetScale(1.1);
        MageNugz.ssMonitorSize = 4;
    elseif (tempInt == 5) then
        MNSpellSteal_Frame:SetScale(1.2);
        MageNugz.ssMonitorSize = 5;
    elseif (tempInt == 6) then
        MNSpellSteal_Frame:SetScale(1.3);
        MageNugz.ssMonitorSize = 6;
    end
end

function  MageNugProcMonitorSize() --Proc Slider
    local tempInt = MageNugOptionsFrame_Slider4:GetValue()
    if (tempInt == 0) then
        MageNugProcFrame:SetScale(0.7);
        MageNugMBProcFrame:SetScale(0.7);
        MageNugFoFProcFrame:SetScale(0.7);
        MageNugBFProcFrame:SetScale(0.7);
        MageNugImpactProcFrame:SetScale(0.7);
        MageNugz.procMonitorSize = 0;
    elseif (tempInt == 1) then
        MageNugProcFrame:SetScale(0.8);
        MageNugMBProcFrame:SetScale(0.8);
        MageNugFoFProcFrame:SetScale(0.8);
        MageNugBFProcFrame:SetScale(0.8);
        MageNugImpactProcFrame:SetScale(0.8);
        MageNugz.procMonitorSize = 1;
    elseif (tempInt == 2) then
        MageNugProcFrame:SetScale(0.9);
        MageNugMBProcFrame:SetScale(0.9);
        MageNugFoFProcFrame:SetScale(0.9);
        MageNugBFProcFrame:SetScale(0.9);
        MageNugImpactProcFrame:SetScale(0.9);
        MageNugz.procMonitorSize = 2;
    elseif (tempInt == 3) then
        MageNugProcFrame:SetScale(1.0);
        MageNugMBProcFrame:SetScale(1.0);
        MageNugFoFProcFrame:SetScale(1.0);
        MageNugBFProcFrame:SetScale(1.0);
        MageNugImpactProcFrame:SetScale(1.0);
        MageNugz.procMonitorSize = 3;
    elseif (tempInt == 4) then
        MageNugProcFrame:SetScale(1.1);
        MageNugMBProcFrame:SetScale(1.1);
        MageNugFoFProcFrame:SetScale(1.1);
        MageNugBFProcFrame:SetScale(1.1);
        MageNugImpactProcFrame:SetScale(1.1);
        MageNugz.procMonitorSize = 4;
    elseif (tempInt == 5) then
        MageNugProcFrame:SetScale(1.2);
        MageNugMBProcFrame:SetScale(1.2);
        MageNugFoFProcFrame:SetScale(1.2);
        MageNugBFProcFrame:SetScale(1.2);
        MageNugImpactProcFrame:SetScale(1.2);
        MageNugz.procMonitorSize = 5;
    elseif (tempInt == 6) then
        MageNugProcFrame:SetScale(1.3);
        MageNugMBProcFrame:SetScale(1.3);
        MageNugFoFProcFrame:SetScale(1.3);
        MageNugBFProcFrame:SetScale(1.3);
        MageNugImpactProcFrame:SetScale(1.3);
        MageNugz.procMonitorSize = 6;
    end
end

function  MageNugInvokerMonitorSize() --Proc Slider
    local tempInt = MageNugOptionsFrame_InvokersSlider:GetValue()
    if (tempInt == 0) then
        MageNugInvokers_Frame:SetScale(0.7);
        MageNugz.invokersMonitorSize = 0;
    elseif (tempInt == 1) then
        MageNugInvokers_Frame:SetScale(0.8);
        MageNugz.invokersMonitorSize = 1;
    elseif (tempInt == 2) then
        MageNugInvokers_Frame:SetScale(0.9);
        MageNugz.invokersMonitorSize = 2;
    elseif (tempInt == 3) then
        MageNugInvokers_Frame:SetScale(1.0);
        MageNugz.invokersMonitorSize = 3;
    elseif (tempInt == 4) then
        MageNugInvokers_Frame:SetScale(1.1);
        MageNugz.invokersMonitorSize = 4;
    elseif (tempInt == 5) then
        MageNugInvokers_Frame:SetScale(1.2);
        MageNugz.invokersMonitorSize = 5;
    elseif (tempInt == 6) then
        MageNugInvokers_Frame:SetScale(1.3);
        MageNugz.invokersMonitorSize = 6;
    elseif (tempInt == 7) then
        MageNugInvokers_Frame:SetScale(1.5);
        MageNugz.invokersMonitorSize = 7;
    elseif (tempInt == 8) then
        MageNugInvokers_Frame:SetScale(1.7);
        MageNugz.invokersMonitorSize = 8;
    elseif (tempInt == 9) then
        MageNugInvokers_Frame:SetScale(2.0);
        MageNugz.invokersMonitorSize = 9;
    end
end

function MageNugPolyFrameSize()
    local tempInt = MageNugOptionsFrame_Slider1:GetValue()
    if (tempInt == 0) then
        MageNugPolyFrame:SetScale(0.7);
        MageNugz.polyFrameSize = 0;
    elseif (tempInt == 1) then
        MageNugPolyFrame:SetScale(0.8);
        MageNugz.polyFrameSize = 1;
    elseif (tempInt == 2) then
        MageNugPolyFrame:SetScale(0.9);
        MageNugz.polyFrameSize = 2;
    elseif (tempInt == 3) then
        MageNugPolyFrame:SetScale(1.0);
        MageNugz.polyFrameSize = 3;
    elseif (tempInt == 4) then
        MageNugPolyFrame:SetScale(1.2);
        MageNugz.polyFrameSize = 4;
    elseif (tempInt == 5) then
        MageNugPolyFrame:SetScale(1.4);
        MageNugz.polyFrameSize = 5;
    elseif (tempInt == 6) then
        MageNugPolyFrame:SetScale(1.6);
        MageNugz.polyFrameSize = 6;
    end
end

function MageNugLivingBombSize() 
 local tempInt = MageNugOptionsFrame_Slider3:GetValue()
    if (tempInt == 0) then
        MageNugAB_Frame:SetScale(0.7);
        MageNugLB_Frame:SetScale(0.7);
        MageNugManaGem_Frame:SetScale(0.7);
        MageNugClearcast_Frame:SetScale(0.7);
        MageNugIgnite_Frame:SetScale(0.7);
        MageNugz.livingBCounterSize = 0;
    elseif (tempInt == 1) then
        MageNugAB_Frame:SetScale(0.8);
        MageNugLB_Frame:SetScale(0.8);
        MageNugIgnite_Frame:SetScale(0.8);
        MageNugManaGem_Frame:SetScale(0.8);
        MageNugClearcast_Frame:SetScale(0.8);
        MageNugz.livingBCounterSize = 1;
    elseif (tempInt == 2) then
        MageNugAB_Frame:SetScale(0.9);
        MageNugLB_Frame:SetScale(0.9);
        MageNugIgnite_Frame:SetScale(0.9);
        MageNugManaGem_Frame:SetScale(0.9);
        MageNugClearcast_Frame:SetScale(0.9);
        MageNugz.livingBCounterSize = 2;
    elseif (tempInt == 3) then
        MageNugAB_Frame:SetScale(1.0);
        MageNugLB_Frame:SetScale(1.0);
        MageNugManaGem_Frame:SetScale(1.0);
        MageNugClearcast_Frame:SetScale(1.0);
        MageNugIgnite_Frame:SetScale(1.0);
        MageNugz.livingBCounterSize = 3;
    elseif (tempInt == 4) then
        MageNugAB_Frame:SetScale(1.1);
        MageNugLB_Frame:SetScale(1.1);
        MageNugManaGem_Frame:SetScale(1.1);
        MageNugIgnite_Frame:SetScale(1.1);
        MageNugClearcast_Frame:SetScale(1.1);
        MageNugz.livingBCounterSize = 4;
    elseif (tempInt == 5) then
        MageNugAB_Frame:SetScale(1.2);
        MageNugLB_Frame:SetScale(1.2);
        MageNugIgnite_Frame:SetScale(1.2);
        MageNugManaGem_Frame:SetScale(1.2);
        MageNugClearcast_Frame:SetScale(1.2);
        MageNugz.livingBCounterSize = 5;
    elseif (tempInt == 6) then
        MageNugAB_Frame:SetScale(1.3);
        MageNugLB_Frame:SetScale(1.3);
        MageNugIgnite_Frame:SetScale(1.3);
        MageNugManaGem_Frame:SetScale(1.3);
        MageNugClearcast_Frame:SetScale(1.3);
        MageNugz.livingBCounterSize = 6;
    elseif (tempInt == 7) then
        MageNugAB_Frame:SetScale(1.5);
        MageNugLB_Frame:SetScale(1.5);
        MageNugIgnite_Frame:SetScale(1.5);
        MageNugManaGem_Frame:SetScale(1.5);
        MageNugClearcast_Frame:SetScale(1.5);
        MageNugz.livingBCounterSize = 7;
    elseif (tempInt == 8) then
        MageNugAB_Frame:SetScale(1.7);
        MageNugLB_Frame:SetScale(1.7);
        MageNugIgnite_Frame:SetScale(1.7);
        MageNugManaGem_Frame:SetScale(1.7);
        MageNugClearcast_Frame:SetScale(1.7);
        MageNugz.livingBCounterSize = 8;
    elseif (tempInt == 9) then
        MageNugAB_Frame:SetScale(1.9);
        MageNugLB_Frame:SetScale(1.9);
        MageNugIgnite_Frame:SetScale(1.9);
        MageNugManaGem_Frame:SetScale(1.93);
        MageNugClearcast_Frame:SetScale(1.9);
        MageNugz.livingBCounterSize = 9;
    elseif (tempInt == 10) then
        MageNugAB_Frame:SetScale(2.1);
        MageNugLB_Frame:SetScale(2.1);
        MageNugIgnite_Frame:SetScale(2.1);
        MageNugManaGem_Frame:SetScale(2.1);
        MageNugClearcast_Frame:SetScale(2.1);
        MageNugz.livingBCounterSize = 10;
    end
end

function Tab2_OnEnter()
  GameTooltip_SetDefaultAnchor( GameTooltip, UIParent )
  GameTooltip:SetText("|cff00BFFF".."Mage".." |cff00CD00".."Nuggets"..":|cffFFFFFF".."Messages are picked at random.")
  GameTooltip:Show()
end

function Monitors_OnEnter()
  if (MageNugz.toolTips == true) then
    GameTooltip_SetDefaultAnchor( GameTooltip, UIParent )
    GameTooltip:SetText("|cff00BFFF".."Mage".." |cff00CD00".."Nuggets"..":|cffFFFFFF ".."You can disable or resize this".." \n".."monitor in options.")
    GameTooltip:Show()
    end
end

function SPMonitor_OnEnter()
    if (MageNugz.toolTips == true) then
        GameTooltip_SetDefaultAnchor( GameTooltip, UIParent )
        GameTooltip:SetText("|cff00BFFF".."Mage".." |cff00CD00".."Nuggets"..":|cffFFFFFF ".."You can customize or disable this".." \n".."monitor in options.")
        GameTooltip:Show()
    end
end

function MNcooldownOnEnter()
     if (MageNugz.toolTips == true) then
        GameTooltip_SetDefaultAnchor( GameTooltip, UIParent )
        GameTooltip:SetText("|cff00BFFF".."Mage".." |cff00CD00".."Nuggets"..":|cffFFFFFF ".."See Mage Nuggets Options -> Cooldowns")
        GameTooltip:Show()
    end
end

function RoundCrit(critNum) 
    return math.floor(critNum*math.pow(10,2)+0.5) / math.pow(10,2) 
end

function RoundThree(critNum) 
    return math.floor(critNum*math.pow(10,3)+0.5) / math.pow(10,3) 
end

function RoundOne(inputNum) 
    return math.floor(inputNum*math.pow(10,1)+0.5) / math.pow(10,1) 
end

function RoundZero(inputNum)
    return math.floor(inputNum*math.pow(10,0)+0.5) / math.pow(10,0) 
end



function CombatText_OnEnter()
  GameTooltip_SetDefaultAnchor( GameTooltip, UIParent )
  GameTooltip:SetText("|cff00BFFF".."Mage".." |cff00CD00".."Nuggets"..":|cffFFFFFF ".."Checking this will disable all notifications sent to".." \n".."the chat console. This includes polymorph, evocation,".." \n".."spellsteal notifications and all other chat console notifications.")
  GameTooltip:Show()
end

function MageProc_OnEnter()
    GameTooltip_SetDefaultAnchor( GameTooltip, UIParent )
    GameTooltip:SetText("|cff00BFFF".."Mage".." |cff00CD00".."Nuggets"..":|cffFFFFFF ".."The in game combat text must be turned on".." \n".."for mage proc combat text to function.")
    GameTooltip:Show()
end

function MNLockFrames(self)
    if (MageNugz.lockFrames == false)then
       self:StartMoving(); self.isMoving = true;
    end
end

function BorderTypeSlider()
    local tempInt = MageNugStatMonOptionFrame_BorderSlider:GetValue()
    if (tempInt == 0) then
         MageNugSP_Frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
                                    edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
                                    tile = true, tileSize = 16, edgeSize = 16, 
                                    insets = { left = 4, right = 4, top = 4, bottom = 4 }});
        MageNugSP_Frame:SetBackdropColor(MageNugz.backdropR,MageNugz.backdropG,MageNugz.backdropB,MageNugz.backdropA)
        MageNugz.borderStyle = 0;
    elseif (tempInt == 1) then
         MageNugSP_Frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
                                    edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
                                    tile = true, tileSize = 16, edgeSize = 8, 
                                    insets = { left = 1, right = 1, top = 1, bottom = 1 }});
        MageNugSP_Frame:SetBackdropColor(MageNugz.backdropR,MageNugz.backdropG,MageNugz.backdropB,MageNugz.backdropA)
        MageNugz.borderStyle = 1;
    elseif (tempInt == 2) then
        MageNugSP_Frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                    edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
                                    tile = true, tileSize = 16, edgeSize = 16, 
                                    insets = { left = 4, right = 4, top = 4, bottom = 4 }});
        MageNugSP_Frame:SetBackdropColor(MageNugz.backdropR,MageNugz.backdropG,MageNugz.backdropB,MageNugz.backdropA)
        MageNugz.borderStyle = 2;
    elseif (tempInt == 3) then
        MageNugSP_Frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                    edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
                                    tile = true, tileSize = 16, edgeSize = 8, 
                                    insets = { left = 1, right = 1, top = 1, bottom = 1 }});
        MageNugSP_Frame:SetBackdropColor(MageNugz.backdropR,MageNugz.backdropG,MageNugz.backdropB,MageNugz.backdropA)
        MageNugz.borderStyle = 3;
    elseif (tempInt == 4) then
        MageNugSP_Frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                    edgeFile = "Interface/DialogFrame/UI-DialogBox-Gold-Border",
                                    tile = true, tileSize = 16, edgeSize = 16, 
                                    insets = { left = 4, right = 4, top = 4, bottom = 4 }});
        MageNugSP_Frame:SetBackdropColor(MageNugz.backdropR,MageNugz.backdropG,MageNugz.backdropB,MageNugz.backdropA)
        MageNugz.borderStyle = 4;
    elseif (tempInt == 5) then
        MageNugSP_Frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                    edgeFile = "Interface/DialogFrame/UI-DialogBox-Gold-Border",
                                    tile = true, tileSize = 16, edgeSize = 8, 
                                    insets = { left = 1, right = 1, top = 1, bottom = 1 }});
        MageNugSP_Frame:SetBackdropColor(MageNugz.backdropR,MageNugz.backdropG,MageNugz.backdropB,MageNugz.backdropA)
        MageNugz.borderStyle = 5;
    elseif (tempInt == 6) then
        MageNugSP_Frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                    tile = true, tileSize = 16, edgeSize = 16, 
                                    insets = { left = 4, right = 4, top = 4, bottom = 4 }});
        MageNugSP_Frame:SetBackdropColor(MageNugz.backdropR,MageNugz.backdropG,MageNugz.backdropB,MageNugz.backdropA)
        MageNugz.borderStyle = 6;
    end
end

function BackdropTransparencySlider()
    local tempInt = MageNugStatMonOptionFrame_TransparencySlider:GetValue()
    if (tempInt == 0) then
        MageNugz.backdropA = 1.0;
        MageNugSP_Frame:SetBackdropColor(MageNugz.backdropR,MageNugz.backdropG,MageNugz.backdropB,MageNugz.backdropA)
        MageNugz.transColor = 0;
    elseif (tempInt == 1) then
        MageNugz.backdropA = 0.85;
        MageNugSP_Frame:SetBackdropColor(MageNugz.backdropR,MageNugz.backdropG,MageNugz.backdropB,MageNugz.backdropA)
        MageNugz.transColor = 1;
    elseif (tempInt == 2) then
        MageNugz.backdropA = 0.7;
        MageNugSP_Frame:SetBackdropColor(MageNugz.backdropR,MageNugz.backdropG,MageNugz.backdropB,MageNugz.backdropA)
        MageNugz.transColor = 2;
    elseif (tempInt == 3) then
        MageNugz.backdropA = 0.55;
        MageNugSP_Frame:SetBackdropColor(MageNugz.backdropR,MageNugz.backdropG,MageNugz.backdropB,MageNugz.backdropA)
        MageNugz.transColor = 3;
    elseif (tempInt == 4) then
        MageNugz.backdropA = 0.4;
        MageNugSP_Frame:SetBackdropColor(MageNugz.backdropR,MageNugz.backdropG,MageNugz.backdropB,MageNugz.backdropA)
        MageNugz.transColor = 4;
    elseif (tempInt == 5) then
        MageNugz.backdropA = 0.25;
        MageNugSP_Frame:SetBackdropColor(MageNugz.backdropR,MageNugz.backdropG,MageNugz.backdropB,MageNugz.backdropA)
        MageNugz.transColor = 5;
    elseif (tempInt == 6) then
        MageNugz.backdropA = 0.0;
        MageNugSP_Frame:SetBackdropColor(MageNugz.backdropR,MageNugz.backdropG,MageNugz.backdropB,MageNugz.backdropA)
        MageNugz.transColor = 6;
    end
end

function MNSetBackdropBlack()
    MageNugz.backdropR = 0.0;
    MageNugz.backdropG = 0.0;
    MageNugz.backdropB = 0.0;
    MageNugSP_Frame:SetBackdropColor(MageNugz.backdropR,MageNugz.backdropG,MageNugz.backdropB,MageNugz.backdropA)
end

function MNColorSelector()
    MageNugz.backdropR, MageNugz.backdropG, MageNugz.backdropB = MageNugStatMonOptionFrameColorSelect:GetColorRGB();
    MageNugSP_Frame:SetBackdropColor(MageNugz.backdropR,MageNugz.backdropG,MageNugz.backdropB,MageNugz.backdropA);
end

function MageNugz_MinimapButton_Move()
	MageNug_MinimapFrame:SetPoint("TOPLEFT","Minimap","TOPLEFT",52-(80*cos(MageNugz.MinimapPos)),(80*sin(MageNugz.MinimapPos))-52)
end

function MageNugz_MinimapButton_DraggingFrame_OnUpdate()
	local xpos,ypos = GetCursorPosition()
	local xmin,ymin = Minimap:GetLeft(), Minimap:GetBottom()
	xpos = xmin-xpos/UIParent:GetScale()+70 
    ypos = ypos/UIParent:GetScale()-ymin-70
	MageNugz.MinimapPos = math.deg(math.atan2(ypos,xpos))
    MageNugz_MinimapButton_Move()
end

function MageNuggets_Minimap_OnClick() 
    local englishFaction, localizedFaction = UnitFactionGroup("player")
    if (englishFaction == "Horde")then
        MageNugHordeFrame:Show();
    elseif (englishFaction == "Alliance") then
        MageNugAlliFrame:Show();
    end   
end

function MNRecallFrames()
        MNSpellStealFocus_Frame:SetClampedToScreen(true);
        MageNugIgnite_Frame:SetClampedToScreen(true);
        MageNugSP_Frame:SetClampedToScreen(true);
        MageNugCauterize_Frame:SetClampedToScreen(true);
        MageNugClearcast_Frame:SetClampedToScreen(true);
        MNcritMass_Frame:SetClampedToScreen(true);
        MageNugAB_Frame:SetClampedToScreen(true);
        MNabCast_Frame:SetClampedToScreen(true);
        MageNugProcFrame:SetClampedToScreen(true);
        MageNugPolyFrame:SetClampedToScreen(true);
        MageNugImpactProcFrame:SetClampedToScreen(true);
        MageNugBFProcFrame:SetClampedToScreen(true);
        MageNugMBProcFrame:SetClampedToScreen(true);
        MageNugFoFProcFrame:SetClampedToScreen(true);
        MNSpellSteal_Frame:SetClampedToScreen(true);
        MageNugMI_Frame:SetClampedToScreen(true);
        MageNugCD_Frame:SetClampedToScreen(true);
        MageNugLB_Frame:SetClampedToScreen(true);
        MageNugMoonkin_Frame:SetClampedToScreen(true);
        MageNugSSProcFrame:SetClampedToScreen(true);
        MageNugCastStarsurgeFrame:SetClampedToScreen(true);
        MageNugCastMoonFrame:SetClampedToScreen(true);
        MageNugCastInsectFrame:SetClampedToScreen(true);
        MNmoonFire_Frame:SetClampedToScreen(true);
        MNinsectSwarm_Frame:SetClampedToScreen(true);
        MNstarSurge_Frame:SetClampedToScreen(true);
        MageNugInvokers_Frame:SetClampedToScreen(true);
end

----------------------------------------------------------------------------------------
--                              Moonkin                                               --
----------------------------------------------------------------------------------------

function MageNuggetsMoonkin_OnUpdate(self, elapsed) 
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        barpower = UnitPower("player", 8);
        if(GetEclipseDirection() == 'sun') then
            MageNugMoonkin_Frame_Texture:SetTexture("Interface\\Icons\\spell_arcane_starfire");
            if(barpower < 0) then
                MageNugMoonkin_Frame_Text:SetText("|cffFFFFFFLunar "..(barpower * -1));
            else
                MageNugMoonkin_Frame_Text:SetText("|cffFFFFFFLunar "..barpower);
            end
            MageNugMoonkin_Frame_Bar:SetStatusBarColor(0, 0, 0.8)
            MageNugMoonkin_Frame_Bar:SetValue(barpower * -1);
        elseif (GetEclipseDirection() == 'moon') then
            MageNugMoonkin_Frame_Texture:SetTexture("Interface\\Icons\\spell_nature_wrathv2");
            if(barpower < 0) then
                MageNugMoonkin_Frame_Text:SetText("|cffFFFFFFSolar "..(barpower * -1));
            else
                MageNugMoonkin_Frame_Text:SetText("|cffFFFFFFSolar "..barpower);
            end
            MageNugMoonkin_Frame_Bar:SetStatusBarColor(1, 0.5, 0)
            MageNugMoonkin_Frame_Bar:SetValue(barpower);
        end
    self.TimeSinceLastUpdate = 0;
    end   
end


function MageNugMoonSize()
    local tempInt = MageNugMoonkinOptionFrame_Slider:GetValue()
    if (tempInt == 0) then
        MageNugMoonkin_Frame:SetScale(0.7);
        MNmoonFire_Frame:SetScale(0.7);
        MNinsectSwarm_Frame:SetScale(0.7);
        MNstarSurge_Frame:SetScale(0.7);
        MageNugz.moonkinSize = 0;
    elseif (tempInt == 1) then
       MageNugMoonkin_Frame:SetScale(0.8);
       MNmoonFire_Frame:SetScale(0.8);
       MNinsectSwarm_Frame:SetScale(0.8);
       MNstarSurge_Frame:SetScale(0.8);
       MageNugz.moonkinSize = 1;
    elseif (tempInt == 2) then
        MageNugMoonkin_Frame:SetScale(0.9);
        MNmoonFire_Frame:SetScale(0.9);
        MNinsectSwarm_Frame:SetScale(0.9);
        MNstarSurge_Frame:SetScale(0.9);
        MageNugz.moonkinSize = 2;
    elseif (tempInt == 3) then
        MageNugMoonkin_Frame:SetScale(1.0);
        MNmoonFire_Frame:SetScale(1.0);
        MNinsectSwarm_Frame:SetScale(1.0);
        MNstarSurge_Frame:SetScale(1.0);
        MageNugz.moonkinSize = 3;
    elseif (tempInt == 4) then
        MageNugMoonkin_Frame:SetScale(1.1);
        MNmoonFire_Frame:SetScale(1.1);
        MNinsectSwarm_Frame:SetScale(1.1);
        MNstarSurge_Frame:SetScale(1.1);
        MageNugz.moonkinSize = 4;
    elseif (tempInt == 5) then
        MageNugMoonkin_Frame:SetScale(1.2);
        MNmoonFire_Frame:SetScale(1.2);
        MNinsectSwarm_Frame:SetScale(1.2);
        MNstarSurge_Frame:SetScale(1.2);
        MageNugz.moonkinSize = 5;
    elseif (tempInt == 6) then
        MageNugMoonkin_Frame:SetScale(1.4);
        MNmoonFire_Frame:SetScale(1.4);
        MNinsectSwarm_Frame:SetScale(1.4);
        MNstarSurge_Frame:SetScale(1.4);
        MageNugz.moonkinSize =  6;
    elseif (tempInt == 7) then
        MageNugMoonkin_Frame:SetScale(1.7);
        MNmoonFire_Frame:SetScale(1.7);
        MNinsectSwarm_Frame:SetScale(1.7);
        MNstarSurge_Frame:SetScale(1.7);
        MageNugz.moonkinSize =  7;
    elseif (tempInt == 8) then
        MageNugMoonkin_Frame:SetScale(2.0);
        MNmoonFire_Frame:SetScale(2.0);
        MNinsectSwarm_Frame:SetScale(2.0);
        MNstarSurge_Frame:SetScale(2.0);
        MageNugz.moonkinSize =  8;
    elseif (tempInt == 9) then
        MageNugMoonkin_Frame:SetScale(2.2);
        MNmoonFire_Frame:SetScale(2.2);
        MNinsectSwarm_Frame:SetScale(2.2);
        MNstarSurge_Frame:SetScale(2.2);
        MageNugz.moonkinSize =  9;
    elseif (tempInt == 10) then
        MNmoonFire_Frame:SetScale(2.7);
        MNinsectSwarm_Frame:SetScale(2.7);
        MNstarSurge_Frame:SetScale(2.7);
        MageNugMoonkin_Frame:SetScale(2.7);
        MageNugz.moonkinSize =  10;
    end
end

function MNmoonkinCombatToggle()
    local isChecked = MageNugMoonkinOptionFrame_CheckButton1:GetChecked();
    if (isChecked == 1) then
        MageNugz.moonkinCombat = true;
        MageNugMoonkin_Frame:Hide();
        MNmoonFire_Frame:Hide()
        MNinsectSwarm_Frame:Hide()
        MNstarSurge_Frame:Hide()
    else  
        MageNugz.moonkinCombat = false;
        MageNugMoonkin_Frame:Show();
        MNmoonFire_Frame:Show()
        MNinsectSwarm_Frame:Show()
        MNstarSurge_Frame:Show()
    end

end

function MNmoonkinToggle()
    local isChecked = MageNugMoonkinOptionFrame_CheckButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.moonkinTog = true;
        MageNugMoonkin_Frame:Hide()
        MNmoonFire_Frame:Hide()
        MNinsectSwarm_Frame:Hide()
        MNstarSurge_Frame:Hide()
    else  
        MageNugz.moonkinTog = false;
        if (MageNugz.moonkinCombat == false) then
            MageNugMoonkin_Frame:Show();
            MNmoonFire_Frame:Show()
            MNinsectSwarm_Frame:Show()
            MNstarSurge_Frame:Show()
        end
    end
end

function TreantSoundToggle()
    local isChecked = MageNugMoonkinOptionFrame_CheckButton2:GetChecked();
    if (isChecked == 1) then
        MageNugz.treantSoundTog = true;
    else  
        MageNugz.treantSoundTog = false;
    end
end

function MoonkinProcToggle()
    local isChecked = MageNugMoonkinOptionFrame_ProcCheckButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.moonkinProcTog = true;
    else  
        MageNugz.moonkinProcTog = false;
    end
end

function MNmoonkinCombatTextToggle()
    local isChecked = MageNugMoonkinOptionFrame_CheckButton3:GetChecked();
    if (isChecked == 1) then
        MageNugz.moonkinCombatText = true;
    else  
        MageNugz.moonkinCombatText = false;
    end
end

function MNcastFramesToggle()
    local isChecked = MageNugMoonkinOptionFrame_CastCheckButton:GetChecked();
    if (isChecked == 1) then
        MageNugz.castBoxes = true;
    else  
        MageNugz.castBoxes = false;
        MageNugCastStarsurgeFrame:Hide();
        MageNugCastMoonFrame:Hide();
        MageNugCastInsectFrame:Hide();
    end
end

function MNmoonkinAnchorToggle()
    local isChecked = MageNugMoonkinOptionFrame_CheckButtonAnchor:GetChecked();
    if (isChecked == 1) then
        MageNugz.moonkinAnchorTog = true;
        MNmoonFire_Frame:EnableMouse(false);
        MNmoonFire_Frame:ClearAllPoints();
        MNmoonFire_Frame:SetPoint("CENTER", MageNugMoonkin_Frame, "CENTER", -2, 16);
        MNinsectSwarm_Frame:EnableMouse(false);
        MNinsectSwarm_Frame:ClearAllPoints();
        MNinsectSwarm_Frame:SetPoint("CENTER", MageNugMoonkin_Frame, "CENTER", 24, 16);
        MNstarSurge_Frame:ClearAllPoints();
        MNstarSurge_Frame:EnableMouse(false);
        MNstarSurge_Frame:SetPoint("CENTER", MageNugMoonkin_Frame, "CENTER", 50, 16);
    else  
        MageNugz.moonkinAnchorTog = false;
        MNmoonFire_Frame:EnableMouse(true);
        MNinsectSwarm_Frame:EnableMouse(true);
        MNstarSurge_Frame:EnableMouse(true);
    end
end

function  MageNugMoonkinProcSize() --Proc Slider
    local tempInt = MageNugMoonkinOptionFrame_Slider1:GetValue()
    if (tempInt == 0) then
        MageNugSSProcFrame:SetScale(0.7);
        MageNugCastStarsurgeFrame:SetScale(0.7);
        MageNugCastMoonFrame:SetScale(0.7);
        MageNugCastInsectFrame:SetScale(0.7);
        MageNugz.moonkinProcSize = 0;
    elseif (tempInt == 1) then
        MageNugSSProcFrame:SetScale(0.8);
        MageNugCastStarsurgeFrame:SetScale(0.8);
        MageNugCastMoonFrame:SetScale(0.8);
        MageNugCastInsectFrame:SetScale(0.8);
        MageNugz.moonkinProcSize = 1;
    elseif (tempInt == 2) then
        MageNugSSProcFrame:SetScale(0.9);
        MageNugCastStarsurgeFrame:SetScale(0.9);
        MageNugCastMoonFrame:SetScale(0.9);
        MageNugCastInsectFrame:SetScale(0.9);
        MageNugz.moonkinProcSize = 2;
    elseif (tempInt == 3) then
        MageNugSSProcFrame:SetScale(1.0);
        MageNugCastStarsurgeFrame:SetScale(1.0);
        MageNugCastMoonFrame:SetScale(1.0);
        MageNugCastInsectFrame:SetScale(1.0);
        MageNugz.moonkinProcSize = 3;
    elseif (tempInt == 4) then
        MageNugSSProcFrame:SetScale(1.1);
        MageNugCastStarsurgeFrame:SetScale(1.1);
        MageNugCastMoonFrame:SetScale(1.1);
        MageNugCastInsectFrame:SetScale(1.1);
        MageNugz.moonkinProcSize = 4;
    elseif (tempInt == 5) then
        MageNugSSProcFrame:SetScale(1.2);
        MageNugCastStarsurgeFrame:SetScale(1.2);
        MageNugCastMoonFrame:SetScale(1.2);
        MageNugCastInsectFrame:SetScale(1.2);
        MageNugz.moonkinProcSize = 5;
    elseif (tempInt == 6) then
        MageNugSSProcFrame:SetScale(1.4);
        MageNugCastStarsurgeFrame:SetScale(1.4);
        MageNugCastMoonFrame:SetScale(1.4);
        MageNugCastInsectFrame:SetScale(1.4);
        MageNugz.moonkinProcSize = 6;
    end
end

function MNmoonkinminimalToggle()
    local isChecked = MageNugMoonkinOptionFrame_CheckButtonMin:GetChecked();
    if (isChecked == 1) then
        MageNugz.moonkinMin = true;
        MageNugMoonkin_Frame_Texture:Hide();
    else  
        MageNugz.moonkinMin = false;
        MageNugMoonkin_Frame_Texture:Show();
    end
end

function MNmoonkinBoxToggle()
    local isChecked = MageNugMoonkinOptionFrame_CheckButton0:GetChecked();
    if (isChecked == 1) then
        MageNugz.moonkinBoxTog = true;
    else  
        MageNugz.moonkinBoxTog = false;
    end
end


function MNmoonFire_OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        moonfireTime = 0;
        local i = 1;
        local buffName, rank, icon, count, _, duration, expirationTime, unitCaster, _, _, spellId  = UnitAura("target", i, "PLAYER|HARMFUL");
        while buffName do
            if(spellId == 8921) then
                moonfireTime = RoundOne(expirationTime - GetTime());
            end
            i = i + 1;
            buffName, rank, icon, count, _, duration, expirationTime, unitCaster, _, _, spellId  = UnitAura("target", i, "PLAYER|HARMFUL");
        end     
        if(moonfireTime <= 0.5) then
            MNmoonFire_FrameText:SetText(" ")                
            MNmoonFire_Frame:SetAlpha(1);
            if(MageNugz.castBoxes == true)then
                if(incombat == 1) then
                    MageNugCastMoonFrame:Show();
               end
            end
        else    
            MNmoonFire_FrameText:SetText(moonfireTime);
            MNmoonFire_Frame:SetAlpha(0.5);
            MageNugCastMoonFrame:Hide();
        end
        self.TimeSinceLastUpdate = 0;
    end
end

function MNinsectSwarm_OnUpdate(self, elapsed) 
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        insectTime = 0;
        local i = 1;
        local buffName, rank, icon, count, _, duration, expirationTime, unitCaster, _, _, spellId  = UnitAura("target", i, "PLAYER|HARMFUL");
        while buffName do
            if(spellId == 93402) then
                insectTime = RoundOne(expirationTime - GetTime());
            end
            i = i + 1;
            buffName, rank, icon, count, _, duration, expirationTime, unitCaster, _, _, spellId  = UnitAura("target", i, "PLAYER|HARMFUL");
        end     
        if(insectTime <= 0.5) then
            MNinsectSwarm_FrameText:SetText(" ")                
            MNinsectSwarm_Frame:SetAlpha(1);
            if(MageNugz.castBoxes == true)then
                if(incombat == 1) then
                    MageNugCastInsectFrame:Show();
                end
            end
        else    
            MNinsectSwarm_FrameText:SetText(insectTime);
            MNinsectSwarm_Frame:SetAlpha(0.5);
            MageNugCastInsectFrame:Hide();
    
        end
        self.TimeSinceLastUpdate = 0;
    end
end

function MNstarSurge_OnUpdate(self, elapsed) 
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        local ssstart, ssduration, ssenabled = GetSpellCooldown(78674);
        starsurgeTime = RoundOne(ssstart + ssduration - GetTime())       
        if (starsurgeTime > 1.5) then
            MNstarSurge_FrameText:SetText(starsurgeTime)
            MNstarSurge_Frame:SetAlpha(0.5);
            MageNugCastStarsurgeFrame:Hide();
        elseif (starsurgeTime > 1.0) then
            MNstarSurge_FrameText:SetText("gcd")
        else
            MNstarSurge_FrameText:SetText(" ")
            MNstarSurge_Frame:SetAlpha(1);
            if(MageNugz.castBoxes == true)then
               if(incombat == 1)then
                MageNugCastStarsurgeFrame:Show();
                end
            end
        end
        self.TimeSinceLastUpdate = 0;
    end
end

function MNanchorMoonkinFrames()
    MNmoonFire_Frame:ClearAllPoints();
    MNmoonFire_Frame:SetPoint("CENTER", MageNugMoonkin_Frame, "CENTER", -2, 16);
    MNinsectSwarm_Frame:ClearAllPoints();
    MNinsectSwarm_Frame:SetPoint("CENTER", MageNugMoonkin_Frame, "CENTER", 24, 16);
    MNstarSurge_Frame:ClearAllPoints();
    MNstarSurge_Frame:SetPoint("CENTER", MageNugMoonkin_Frame, "CENTER", 50, 16);
end


----------------------------------------------------------------------------------------
--                              SAVE FRAMES                                           --
----------------------------------------------------------------------------------------
MageNugz_Frames = {
    managem_point = "CENTER";
    managem_relativePoint = "CENTER";
    managem_xOfs = 0; 
    managem_yOfs = 0;
    statmon_point = "CENTER";
    statmon_relativePoint = "CENTER";
    statmon_xOfs = 0;
    statmon_yOfs = 0;
    ignite_point = "CENTER";
    ignite_relativePoint = "CENTER";
    ignite_xOfs = 0;
    ignite_yOfs = 0;
    frostbomb_point = "CENTER";
    frostbomb_relativePoint = "CENTER";
    frostbomb_xOfs = 0;
    frostbomb_yOfs = 0;
    invokers_point = "CENTER";
    invokers_relativePoint = "CENTER";
    invokers_xOfs = 0;
    invokers_yOfs = 0;
    lb_point = "CENTER";
    lb_relativePoint = "CENTER";
    lb_xOfs = 0;
    lb_yOfs = 0;
    hs_point = "CENTER";
    hs_relativePoint = "CENTER";
    hs_xOfs = 0;
    hs_yOfs = 0;
    hu_point = "CENTER";
    hu_relativePoint = "CENTER";
    hu_xOfs = 0;
    hu_yOfs = 0;
    impact_point = "CENTER";
    impact_relativePoint = "CENTER";
    impact_xOfs = 0;
    impact_yOfs = 0;
    caut_point = "CENTER";
    caut_relativePoint = "CENTER";
    caut_xOfs = 0;
    caut_yOfs = 0;
    ab_point = "CENTER";
    ab_relativePoint = "CENTER";
    ab_xOfs = 0;
    ab_yOfs = 0;
    poly_point = "CENTER";
    poly_relativePoint = "CENTER";
    poly_xOfs = 0;
    poly_yOfs = 0;
    mb_point = "CENTER";
    mb_relativePoint = "CENTER";
    mb_xOfs = 0;
    mb_yOfs = 0;
    fof_point = "CENTER";
    fof_relativePoint = "CENTER";
    fof_xOfs = 0;
    fof_yOfs = 0;
    bf_point = "CENTER";
    bf_relativePoint = "CENTER";
    bf_xOfs = 0;
    bf_yOfs = 0;
    spellsteal_point = "CENTER";
    spellsteal_relativePoint = "CENTER";
    spellsteal_xOfs = 0;
    spellsteal_yOfs = 0;
    spellstealfocus_point = "CENTER";
    spellstealfocus_relativePoint = "CENTER";
    spellstealfocus_xOfs = 0;
    spellstealfocus_yOfs = 0;
    mi_point = "CENTER";
    mi_relativePoint = "CENTER";
    mi_xOfs = 0;
    mi_yOfs = 0;
    cd_point = "CENTER";
    cd_relativePoint = "CENTER";
    cd_xOfs = 0;
    cd_yOfs = 0;
    cautTimer_point = "CENTER";
    cautTimer_relativePoint = "CENTER";
    cautTimer_xOfs = 0;
    cautTimer_yOfs = 0;
    cc_point = "CENTER";
    cc_relativePoint = "CENTER";
    cc_xOfs = 0;
    cc_yOfs = 0;
}

function MageNugz_SaveFrame_Position()
    MageNugz_Frames.managem_point, _, MageNugz_Frames.managem_relativePoint, MageNugz_Frames.managem_xOfs, MageNugz_Frames.managem_yOfs = MageNugManaGem_Frame:GetPoint();
    MageNugz_Frames.statmon_point, _, MageNugz_Frames.statmon_relativePoint, MageNugz_Frames.statmon_xOfs, MageNugz_Frames.statmon_yOfs = MageNugSP_Frame:GetPoint();
    MageNugz_Frames.ignite_point, _, MageNugz_Frames.ignite_relativePoint, MageNugz_Frames.ignite_xOfs, MageNugz_Frames.ignite_yOfs = MageNugIgnite_Frame:GetPoint();
    MageNugz_Frames.invokers_point, _, MageNugz_Frames.invokers_relativePoint, MageNugz_Frames.invokers_xOfs, MageNugz_Frames.invokers_yOfs = MageNugInvokers_Frame:GetPoint();
    MageNugz_Frames.lb_point, _, MageNugz_Frames.lb_relativePoint, MageNugz_Frames.lb_xOfs, MageNugz_Frames.lb_yOfs = MageNugLB_Frame:GetPoint();
    MageNugz_Frames.hs_point, _, MageNugz_Frames.hs_relativePoint, MageNugz_Frames.hs_xOfs, MageNugz_Frames.hs_yOfs = MageNugProcFrame:GetPoint();
    MageNugz_Frames.hu_point, _, MageNugz_Frames.hu_relativePoint, MageNugz_Frames.hu_xOfs, MageNugz_Frames.hu_yOfs = MageNugProcHUFrame:GetPoint();
    MageNugz_Frames.impact_point, _, MageNugz_Frames.impact_relativePoint, MageNugz_Frames.impact_xOfs, MageNugz_Frames.impact_yOfs = MageNugImpactProcFrame:GetPoint();
    MageNugz_Frames.caut_point, _, MageNugz_Frames.caut_relativePoint, MageNugz_Frames.caut_xOfs, MageNugz_Frames.caut_yOfs = MageNugCauterizeFrame:GetPoint();
    MageNugz_Frames.ab_point, _, MageNugz_Frames.ab_relativePoint, MageNugz_Frames.ab_xOfs, MageNugz_Frames.ab_yOfs = MageNugAB_Frame:GetPoint();
    MageNugz_Frames.poly_point, _, MageNugz_Frames.poly_relativePoint, MageNugz_Frames.poly_xOfs, MageNugz_Frames.poly_yOfs = MageNugPolyFrame:GetPoint();
    MageNugz_Frames.mb_point, _, MageNugz_Frames.mb_relativePoint, MageNugz_Frames.mb_xOfs, MageNugz_Frames.mb_yOfs = MageNugMBProcFrame:GetPoint();
    MageNugz_Frames.fof_point, _, MageNugz_Frames.fof_relativePoint, MageNugz_Frames.fof_xOfs, MageNugz_Frames.fof_yOfs = MageNugFoFProcFrame:GetPoint();
    MageNugz_Frames.bf_point, _, MageNugz_Frames.bf_relativePoint, MageNugz_Frames.bf_xOfs, MageNugz_Frames.bf_yOfs = MageNugBFProcFrame:GetPoint();
    MageNugz_Frames.spellsteal_point, _, MageNugz_Frames.spellsteal_relativePoint, MageNugz_Frames.spellsteal_xOfs, MageNugz_Frames.spellsteal_yOfs = MNSpellSteal_Frame:GetPoint();
    MageNugz_Frames.spellstealfocus_point, _, MageNugz_Frames.spellstealfocus_relativePoint, MageNugz_Frames.spellstealfocus_xOfs, MageNugz_Frames.spellstealfocus_yOfs = MNSpellStealFocus_Frame:GetPoint();
    MageNugz_Frames.mi_point, _, MageNugz_Frames.mi_relativePoint, MageNugz_Frames.mi_xOfs, MageNugz_Frames.mi_yOfs = MageNugMI_Frame:GetPoint();
    MageNugz_Frames.cd_point, _, MageNugz_Frames.cd_relativePoint, MageNugz_Frames.cd_xOfs, MageNugz_Frames.cd_yOfs = MageNugCD_Frame:GetPoint();
    MageNugz_Frames.cautTimer_point, _, MageNugz_Frames.cautTimer_relativePoint, MageNugz_Frames.cautTimer_xOfs, MageNugz_Frames.cautTimer_yOfs = MageNugCauterize_Frame:GetPoint();
    MageNugz_Frames.cc_point, _, MageNugz_Frames.cc_relativePoint, MageNugz_Frames.cc_xOfs, MageNugz_Frames.cc_yOfs = MageNugClearcast_Frame:GetPoint();
end


function MageNugz_SetFrame_Positions()
    MageNugManaGem_Frame:ClearAllPoints();
    MageNugManaGem_Frame:SetPoint(MageNugz_Frames.managem_point, "UIParent", MageNugz_Frames.managem_relativePoint, MageNugz_Frames.managem_xOfs, MageNugz_Frames.managem_yOfs);
    MageNugSP_Frame:ClearAllPoints();
    MageNugSP_Frame:SetPoint(MageNugz_Frames.statmon_point, "UIParent", MageNugz_Frames.statmon_relativePoint, MageNugz_Frames.statmon_xOfs, MageNugz_Frames.statmon_yOfs);
    MageNugIgnite_Frame:ClearAllPoints();
    MageNugIgnite_Frame:SetPoint(MageNugz_Frames.ignite_point, "UIParent", MageNugz_Frames.ignite_relativePoint, MageNugz_Frames.ignite_xOfs, MageNugz_Frames.ignite_yOfs);
    MageNugInvokers_Frame:ClearAllPoints();
    MageNugInvokers_Frame:SetPoint(MageNugz_Frames.invokers_point, "UIParent", MageNugz_Frames.invokers_relativePoint, MageNugz_Frames.invokers_xOfs, MageNugz_Frames.invokers_yOfs);
    MageNugLB_Frame:ClearAllPoints();
    MageNugLB_Frame:SetPoint(MageNugz_Frames.lb_point, "UIParent", MageNugz_Frames.lb_relativePoint, MageNugz_Frames.lb_xOfs, MageNugz_Frames.lb_yOfs);
    MageNugProcFrame:ClearAllPoints();
    MageNugProcFrame:SetPoint(MageNugz_Frames.hs_point, "UIParent", MageNugz_Frames.hs_relativePoint, MageNugz_Frames.hs_xOfs, MageNugz_Frames.hs_yOfs);
    MageNugProcHUFrame:ClearAllPoints();
    MageNugProcHUFrame:SetPoint(MageNugz_Frames.hu_point, "UIParent", MageNugz_Frames.hu_relativePoint, MageNugz_Frames.hu_xOfs, MageNugz_Frames.hu_yOfs);
    MageNugImpactProcFrame:ClearAllPoints();
    MageNugImpactProcFrame:SetPoint(MageNugz_Frames.impact_point, "UIParent", MageNugz_Frames.impact_relativePoint, MageNugz_Frames.impact_xOfs, MageNugz_Frames.impact_yOfs);
    MageNugCauterizeFrame:ClearAllPoints();
    MageNugCauterizeFrame:SetPoint(MageNugz_Frames.caut_point, "UIParent", MageNugz_Frames.caut_relativePoint, MageNugz_Frames.caut_xOfs, MageNugz_Frames.caut_yOfs);
    MageNugAB_Frame:ClearAllPoints();
    MageNugAB_Frame:SetPoint(MageNugz_Frames.ab_point, "UIParent", MageNugz_Frames.ab_relativePoint, MageNugz_Frames.ab_xOfs, MageNugz_Frames.ab_yOfs);
    MageNugPolyFrame:ClearAllPoints();
    MageNugPolyFrame:SetPoint(MageNugz_Frames.poly_point, "UIParent", MageNugz_Frames.poly_relativePoint, MageNugz_Frames.poly_xOfs, MageNugz_Frames.poly_yOfs);
    MageNugMBProcFrame:ClearAllPoints();
    MageNugMBProcFrame:SetPoint(MageNugz_Frames.mb_point, "UIParent", MageNugz_Frames.mb_relativePoint, MageNugz_Frames.mb_xOfs, MageNugz_Frames.mb_yOfs);
    MageNugFoFProcFrame:ClearAllPoints();
    MageNugFoFProcFrame:SetPoint(MageNugz_Frames.fof_point, "UIParent", MageNugz_Frames.fof_relativePoint, MageNugz_Frames.fof_xOfs, MageNugz_Frames.fof_yOfs);
    MageNugBFProcFrame:ClearAllPoints();
    MageNugBFProcFrame:SetPoint(MageNugz_Frames.bf_point, "UIParent", MageNugz_Frames.bf_relativePoint, MageNugz_Frames.bf_xOfs, MageNugz_Frames.bf_yOfs);
    MNSpellSteal_Frame:ClearAllPoints();
    MNSpellSteal_Frame:SetPoint(MageNugz_Frames.spellsteal_point, "UIParent", MageNugz_Frames.spellsteal_relativePoint, MageNugz_Frames.spellsteal_xOfs, MageNugz_Frames.spellsteal_yOfs);
    MNSpellStealFocus_Frame:ClearAllPoints();
    MNSpellStealFocus_Frame:SetPoint(MageNugz_Frames.spellstealfocus_point, "UIParent", MageNugz_Frames.spellstealfocus_relativePoint, MageNugz_Frames.spellstealfocus_xOfs, MageNugz_Frames.spellstealfocus_yOfs);
    MNSpellSteal_Frame:ClearAllPoints();
    MNSpellSteal_Frame:SetPoint(MageNugz_Frames.spellsteal_point, "UIParent", MageNugz_Frames.spellsteal_relativePoint, MageNugz_Frames.spellsteal_xOfs, MageNugz_Frames.spellsteal_yOfs);
    MageNugMI_Frame:ClearAllPoints();
    MageNugMI_Frame:SetPoint(MageNugz_Frames.mi_point, "UIParent", MageNugz_Frames.mi_relativePoint, MageNugz_Frames.mi_xOfs, MageNugz_Frames.mi_yOfs);
    MageNugCD_Frame:ClearAllPoints();
    MageNugCD_Frame:SetPoint(MageNugz_Frames.cd_point, "UIParent", MageNugz_Frames.cd_relativePoint, MageNugz_Frames.cd_xOfs, MageNugz_Frames.cd_yOfs);
    MageNugCauterize_Frame:ClearAllPoints();
    MageNugCauterize_Frame:SetPoint(MageNugz_Frames.cautTimer_point, "UIParent", MageNugz_Frames.cautTimer_relativePoint, MageNugz_Frames.cautTimer_xOfs, MageNugz_Frames.cautTimer_yOfs);
    MageNugClearcast_Frame:ClearAllPoints();
    MageNugClearcast_Frame:SetPoint(MageNugz_Frames.cc_point, "UIParent", MageNugz_Frames.cc_relativePoint, MageNugz_Frames.cc_xOfs, MageNugz_Frames.cc_yOfs);
end

----------------------------------------------------------------------------------------
--                              BOMB MONITOR                                          --
----------------------------------------------------------------------------------------
function MNRefreshFrames()
    local old = MNFindBar();
    local i = 1;
    while(i <= 8) do
        if(livingbombTime[i] == 0) then
            if(old > 0) and (i < old) then
                _G["MageNugLB"..i.."_Frame_Text2"]:SetText(_G["MageNugLB"..old.."_Frame_Text2"]:GetText());
                livingbombTime[i] = livingbombTime[old];
               -- _G["MageNugLB"..i.."_Frame"]:Show();
                lbTargetId[i] = lbTargetId[old]
               -- _G["MageNugLB"..old.."_Frame"]:Hide();
                _G["MageNugLB"..old.."_Frame_Text"]:SetText("");
                _G["MageNugLB"..old.."_Frame_Bar"]:SetValue(0);
                _G["MageNugLB"..old.."_Frame_Text2"]:SetText("");
                livingbombTime[old] = 0;
                lbTargetId[old] = nil;
                break
            end
        end
        i = i + 1;
    end
 end

function MNFindBar()
    local bar = 0;
    local i = 1;
    while(i <= 8) do
        if(livingbombTime[i] > 0) then
            bar = i;
        end
        i = i + 1;
    end
    return bar;
end

function MNApplyBomb(destGUID, destName, expireTime)
    MageNugLB_Frame:Show();
    local i = 1;
    while(i <= 8) do
        if(livingbombTime[i] == 0) then
            livingbombTime[i] = expireTime;
            lbTargetId[i] = destGUID;
            _G["MageNugLB"..i.."_Frame_Text"]:SetText(RoundOne(expireTime - GetTime()));
            _G["MageNugLB"..i.."_Frame_Bar"]:SetValue(RoundOne(expireTime - GetTime()));
            _G["MageNugLB"..i.."_Frame_Text2"]:SetText(strsub(destName,1,18));
            --_G["MageNugLB"..i.."_Frame"]:Show()
            i = 1;
            break;
        else
            i = i + 1;
       end
    end
end

function MNRemoveBomb(destGUID)
    local i = 1;
    while(i <= 8) do
        if(destGUID == lbTargetId[i]) then
            livingbombTime[i] = 0;
            --_G["MageNugLB"..i.."_Frame"]:Hide();
            _G["MageNugLB"..i.."_Frame_Bar"]:SetValue(0);
            _G["MageNugLB"..i.."_Frame_Text"]:SetText("1");
            lbTargetId[i] = nil;
            break;
        end
        i = i + 1;
    end
    MNRefreshFrames();
end

function MNRefreshBomb(destGUID, expireTime)
    if(destGUID == lbTargetId[1])then
        livingbombTime[1] = expireTime;
    elseif(destGUID == lbTargetId[2])then 
        livingbombTime[2] = expireTime;
    elseif(destGUID == lbTargetId[3])then
        livingbombTime[3] = expireTime;
    elseif(destGUID == lbTargetId[4])then
        livingbombTime[4] = expireTime;
    elseif(destGUID == lbTargetId[5])then
        livingbombTime[5] = expireTime;
    elseif(destGUID == lbTargetId[6])then
        livingbombTime[6] = expireTime;
    elseif(destGUID == lbTargetId[7])then
        livingbombTime[7] = expireTime;                       
    elseif(destGUID == lbTargetId[8])then
        livingbombTime[8] = expireTime;
    end
end


function MNBombMonitorDress()
    local isFree, talent = GetTalentRowSelectionInfo(5);
    for i=1, 8 do
       livingbombTime[i] = 0;
    end
    for j=1, 8 do
      lbTargetId[j] = 0;
    end
    if(talent == 13) then
        if (MageNugz.simpleUiToggle == true) then
            MageNugLB_FrameTextureIcon:SetTexture("Interface\\Icons\\spell_mage_nethertempest");
            MageNugLB_FrameTextureBorder:SetTexture();
            MageNugLB_FrameTextureTitle:SetTexture();
            MageNugLB1_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\bluebar.tga");
            MageNugLB2_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\bluebar.tga");
            MageNugLB3_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\bluebar.tga");    
            MageNugLB4_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\bluebar.tga");
            MageNugLB5_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\bluebar.tga");
            MageNugLB6_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\bluebar.tga");
            MageNugLB7_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\bluebar.tga");
            MageNugLB8_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\bluebar.tga");
        else
            MageNugLB_FrameTextureIcon:SetTexture("Interface\\Icons\\spell_mage_nethertempest");
            MageNugLB_FrameTextureBorder:SetTexture("Interface\\UNITPOWERBARALT\\Water_Horizontal_Frame.blp");
            MageNugLB_FrameTextureTitle:SetTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");
            MageNugLB1_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");
            MageNugLB2_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");
            MageNugLB3_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");    
            MageNugLB4_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");
            MageNugLB5_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");
            MageNugLB6_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");
            MageNugLB7_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");
            MageNugLB8_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");
        end
    elseif(talent == 14) then
        if (MageNugz.simpleUiToggle == true) then
            MageNugLB_FrameTextureIcon:SetTexture("Interface\\Icons\\ability_mage_livingbomb");
            MageNugLB_FrameTextureBorder:SetTexture();
            MageNugLB_FrameTextureTitle:SetTexture();
            MageNugLB1_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\redbar.tga");
            MageNugLB2_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\redbar.tga");
            MageNugLB3_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\redbar.tga");    
            MageNugLB4_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\redbar.tga");
            MageNugLB5_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\redbar.tga");
            MageNugLB6_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\redbar.tga");
            MageNugLB7_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\redbar.tga");
            MageNugLB8_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\redbar.tga");
        else
            MageNugLB_FrameTextureIcon:SetTexture("Interface\\Icons\\ability_mage_livingbomb");
            MageNugLB_FrameTextureBorder:SetTexture("Interface\\UNITPOWERBARALT\\Fire_Horizontal_Frame");
            MageNugLB_FrameTextureTitle:SetTexture("Interface\\AddOns\\MageNuggets\\firebar.tga");
            MageNugLB1_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\firebar.tga");
            MageNugLB2_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\firebar.tga");
            MageNugLB3_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\firebar.tga");
            MageNugLB4_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\firebar.tga");
            MageNugLB5_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\firebar.tga");
            MageNugLB6_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\firebar.tga");
            MageNugLB7_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\firebar.tga");
            MageNugLB8_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\firebar.tga");
        end
    elseif(talent == 15) then
        if (MageNugz.simpleUiToggle == true) then
            MageNugLB_FrameTextureIcon:SetTexture("Interface\\Icons\\spell_mage_frostbomb");
            MageNugLB_FrameTextureBorder:SetTexture();
            MageNugLB_FrameTextureTitle:SetTexture();
            MageNugLB1_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\bluebar.tga");
            MageNugLB2_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\bluebar.tga");
            MageNugLB3_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\bluebar.tga");    
            MageNugLB4_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\bluebar.tga");
            MageNugLB5_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\bluebar.tga");
            MageNugLB6_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\bluebar.tga");
            MageNugLB7_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\bluebar.tga");
            MageNugLB8_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\bluebar.tga");
        else
            MageNugLB_FrameTextureIcon:SetTexture("Interface\\Icons\\spell_mage_frostbomb");
            MageNugLB_FrameTextureBorder:SetTexture("Interface\\UNITPOWERBARALT\\Ice_Horizontal_Frame");
            MageNugLB_FrameTextureTitle:SetTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");
            MageNugLB1_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");
            MageNugLB2_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");
            MageNugLB3_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");    
            MageNugLB4_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");
            MageNugLB5_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");
            MageNugLB6_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");
            MageNugLB7_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");
            MageNugLB8_Frame_Bar:SetStatusBarTexture("Interface\\AddOns\\MageNuggets\\netherbar.tga");
        end
    end
end


function MageNuggetsLB_OnUpdate(self, elapsed) 
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 1) then   
       -- MNRefreshFrames();
        if (livingbombGlobalTime >= 0) then
            livingbombGlobalTime = RoundOne(livingbombGlobalTime - 1);
            if (livingbombGlobalTime <= 0) then
               --livingBombCount = 0;
               MageNugLB_Frame:Hide();
            end
        end    
    self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsLB1_OnUpdate(self, elapsed) 
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        local expireTime = RoundOne(livingbombTime[1] - GetTime());
        if (expireTime >= 0.1) then
            MageNugLB1_Frame_BarSpark:Show();
            MageNugLB1_Frame_Bar:SetValue(expireTime);
            MageNugLB1_Frame_Text:SetText(expireTime);
            local position = (MageNugLB1_Frame_Bar:GetValue() / 13 * 130);
            MageNugLB1_Frame_BarSpark:SetPoint("BOTTOMLEFT",MageNugLB1_Frame_Bar,"BOTTOMLEFT",position - 6, -8);
        else
            MageNugLB1_Frame_BarSpark:Hide();
            MageNugLB1_Frame_Bar:SetValue(0);
            MageNugLB1_Frame_Text:SetText("");
            MageNugLB1_Frame_Text2:SetText("");
            livingbombTime[1] = 0;
        end    
        self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsLB2_OnUpdate(self, elapsed) 
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        local expireTime = RoundOne(livingbombTime[2] - GetTime());
        if (expireTime >= 0.1) then
            MageNugLB2_Frame_BarSpark:Show();
            MageNugLB2_Frame_Bar:SetValue(expireTime)
            MageNugLB2_Frame_Text:SetText(expireTime)
            local position = (MageNugLB2_Frame_Bar:GetValue() / 13 * 130);
            MageNugLB2_Frame_BarSpark:SetPoint("BOTTOMLEFT",MageNugLB2_Frame_Bar,"BOTTOMLEFT",position - 6, -8);
        else
            MageNugLB2_Frame_BarSpark:Hide();
            MageNugLB2_Frame_Bar:SetValue(0);
            MageNugLB2_Frame_Text:SetText("");
            MageNugLB2_Frame_Text2:SetText("");
            livingbombTime[2] = 0;
        end    
        self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsLB3_OnUpdate(self, elapsed) 
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        local expireTime = RoundOne(livingbombTime[3] - GetTime());
        if (expireTime >= 0.1) then
            MageNugLB3_Frame_BarSpark:Show();
            MageNugLB3_Frame_Bar:SetValue(expireTime)
            MageNugLB3_Frame_Text:SetText(expireTime)
            local position = (MageNugLB3_Frame_Bar:GetValue() / 13 * 130);
            MageNugLB3_Frame_BarSpark:SetPoint("BOTTOMLEFT",MageNugLB3_Frame_Bar,"BOTTOMLEFT",position - 6, -8);
        else
            MageNugLB3_Frame_BarSpark:Hide();
            MageNugLB3_Frame_Bar:SetValue(0);
            MageNugLB3_Frame_Text:SetText("");
            MageNugLB3_Frame_Text2:SetText("");
            livingbombTime[3] = 0;
        end    
        self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsLB4_OnUpdate(self, elapsed) 
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        local expireTime = RoundOne(livingbombTime[4] - GetTime());
        if (expireTime >= 0.1) then
            MageNugLB4_Frame_BarSpark:Show();
            MageNugLB4_Frame_Bar:SetValue(expireTime)
            MageNugLB4_Frame_Text:SetText(expireTime)
            local position = (MageNugLB4_Frame_Bar:GetValue() / 13 * 130);
            MageNugLB4_Frame_BarSpark:SetPoint("BOTTOMLEFT",MageNugLB4_Frame_Bar,"BOTTOMLEFT",position - 6, -8);
        else
            MageNugLB4_Frame_BarSpark:Hide();
            MageNugLB4_Frame_Bar:SetValue(0);
            MageNugLB4_Frame_Text:SetText("");
            MageNugLB4_Frame_Text2:SetText("");
            livingbombTime[4] = 0;
        end    
        self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsLB5_OnUpdate(self, elapsed) 
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        local expireTime = RoundOne(livingbombTime[5] - GetTime());
        if (expireTime >= 0.1) then
            MageNugLB5_Frame_BarSpark:Show();
            MageNugLB5_Frame_Bar:SetValue(expireTime)
            MageNugLB5_Frame_Text:SetText(expireTime)
            local position = (MageNugLB5_Frame_Bar:GetValue() / 13 * 130);
            MageNugLB5_Frame_BarSpark:SetPoint("BOTTOMLEFT",MageNugLB5_Frame_Bar,"BOTTOMLEFT",position - 6, -8);
        else
            MageNugLB5_Frame_BarSpark:Hide();
            MageNugLB5_Frame_Bar:SetValue(0);
            MageNugLB5_Frame_Text:SetText("");
            MageNugLB5_Frame_Text2:SetText("");
            livingbombTime[5] = 0;
        end    
        self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsLB6_OnUpdate(self, elapsed) 
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        local expireTime = RoundOne(livingbombTime[6] - GetTime());
        if (expireTime >= 0.1) then
            MageNugLB6_Frame_BarSpark:Show();
            MageNugLB6_Frame_Bar:SetValue(expireTime)
            MageNugLB6_Frame_Text:SetText(expireTime)
            local position = (MageNugLB6_Frame_Bar:GetValue() / 13 * 130);
            MageNugLB6_Frame_BarSpark:SetPoint("BOTTOMLEFT",MageNugLB6_Frame_Bar,"BOTTOMLEFT",position - 6, -8);
        else
            MageNugLB6_Frame_BarSpark:Hide();
            MageNugLB6_Frame_Bar:SetValue(0);
            MageNugLB6_Frame_Text:SetText("");
            MageNugLB6_Frame_Text2:SetText("");
            livingbombTime[6] = 0;
        end    
        self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsLB7_OnUpdate(self, elapsed) 
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        local expireTime = RoundOne(livingbombTime[7] - GetTime());
        if (expireTime >= 0.1) then
            MageNugLB7_Frame_BarSpark:Show();
            MageNugLB7_Frame_Bar:SetValue(expireTime)
            MageNugLB7_Frame_Text:SetText(expireTime)
            local position = (MageNugLB7_Frame_Bar:GetValue() / 13 * 130);
            MageNugLB7_Frame_BarSpark:SetPoint("BOTTOMLEFT",MageNugLB7_Frame_Bar,"BOTTOMLEFT",position - 6, -8);
        else
            MageNugLB7_Frame_BarSpark:Hide();
            MageNugLB7_Frame_Bar:SetValue(0);
            MageNugLB7_Frame_Text:SetText("");
            MageNugLB7_Frame_Text2:SetText("");
            livingbombTime[7] = 0;
        end    
        self.TimeSinceLastUpdate = 0;
    end   
end
--
function MageNuggetsLB8_OnUpdate(self, elapsed) 
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then   
        local expireTime = RoundOne(livingbombTime[8] - GetTime());
        if (expireTime >= 0.1) then
            MageNugLB8_Frame_BarSpark:Show();
            MageNugLB8_Frame_Bar:SetValue(expireTime)
            MageNugLB8_Frame_Text:SetText(expireTime)
            local position = (MageNugLB8_Frame_Bar:GetValue() / 13 * 130);
            MageNugLB8_Frame_BarSpark:SetPoint("BOTTOMLEFT",MageNugLB8_Frame_Bar,"BOTTOMLEFT",position - 6, -8);
        else
            MageNugLB8_Frame_BarSpark:Hide();
            MageNugLB8_Frame_Bar:SetValue(0);
            MageNugLB8_Frame_Text:SetText("");
            MageNugLB8_Frame_Text2:SetText("");
            livingbombTime[8] = 0;
        end    
        self.TimeSinceLastUpdate = 0;
    end   
end

function MageNuggetsLB_Prep()
    MageNugLB1_Frame:EnableMouse(false)
    MageNugLB2_Frame:EnableMouse(false)
    MageNugLB3_Frame:EnableMouse(false)
    MageNugLB4_Frame:EnableMouse(false)
    MageNugLB5_Frame:EnableMouse(false)
    MageNugLB6_Frame:EnableMouse(false)
    MageNugLB7_Frame:EnableMouse(false)
    MageNugLB8_Frame:EnableMouse(false)
    MageNugLB1_Frame_Bar:EnableMouse(false)
    MageNugLB2_Frame_Bar:EnableMouse(false)
    MageNugLB3_Frame_Bar:EnableMouse(false)
    MageNugLB4_Frame_Bar:EnableMouse(false)
    MageNugLB5_Frame_Bar:EnableMouse(false)
    MageNugLB6_Frame_Bar:EnableMouse(false)
    MageNugLB7_Frame_Bar:EnableMouse(false)
    MageNugLB8_Frame_Bar:EnableMouse(false)
    
    local i = 1;
    while(i <= 8) do
        _G["MageNugLB"..i.."_Frame_BarSpark"]:Hide();
        _G["MageNugLB"..i.."_Frame_Text"]:SetText("");
        _G["MageNugLB"..i.."_Frame_Bar"]:SetValue(0);
        _G["MageNugLB"..i.."_Frame_Text2"]:SetText("");
        livingbombTime[i] = 0;
        lbTargetId[i] = nil;
        i = i + 1;
    end
end