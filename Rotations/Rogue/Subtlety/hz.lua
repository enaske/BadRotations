local rotationName = "hz"

---------------
--- Toggles ---
---------------
local function createToggles()
-- Rotation Button
    RotationModes = {
        [1] = { mode = "", value = 1 , overlay = "Automatic Rotation", tip = "Swaps between Single and Multiple based on number of targets in range.", highlight = 1, icon = br.player.spell.shurikenStorm },
        [2] = { mode = "", value = 2 , overlay = "Single Target Rotation", tip = "Single target rotation used.", highlight = 0, icon = br.player.spell.backstab },
    };
    CreateButton("Rotation",1,0)
-- Cooldown Button
    CooldownModes = {
        [1] = { mode = "", value = 1 , overlay = "Cooldowns Automated", tip = "Automatic Cooldowns - Boss Detection.", highlight = 1, icon = br.player.spell.symbolsOfDeath },
        [2] = { mode = "", value = 1 , overlay = "Cooldowns Enabled", tip = "Cooldowns used regardless of target.", highlight = 0, icon = br.player.spell.shadowBlades },
        [3] = { mode = "", value = 3 , overlay = "Cooldowns Disabled", tip = "No Cooldowns will be used.", highlight = 0, icon = br.player.spell.sap }
    };
    CreateButton("Cooldown",2,0)
-- Defensive Button
    TrinketsModes = {
        [1] = { mode = "", value = 1 , overlay = "Will use Trinkets", tip = "Will use Trinkets.", highlight = 1, icon = br.player.spell.nightblade },
        [2] = { mode = "", value = 2 , overlay = "Will not use Trinkets", tip = "Will not use Trinkets.", highlight = 0, icon = br.player.spell.nightblade }
    };
    CreateButton("Trinkets",3,0)
-- Interrupt Button
    InterruptModes = {
        [1] = { mode = "", value = 1 , overlay = "Interrupts Enabled", tip = "Includes Basic Interrupts.", highlight = 1, icon = br.player.spell.kick },
        [2] = { mode = "", value = 2 , overlay = "Interrupts Disabled", tip = "No Interrupts will be used.", highlight = 0, icon = br.player.spell.kick }
    };
    CreateButton("Interrupt",4,0)
-- Cleave Button
    CleaveModes = {
        [1] = { mode = "", value = 1 , overlay = "Cleaving Enabled", tip = "Rotation will cleave targets.", highlight = 1, icon = br.player.spell.shurikenStorm },
        [2] = { mode = "", value = 2 , overlay = "Cleaving Disabled", tip = "Rotation will not cleave targets", highlight = 0, icon = br.player.spell.backstab }
    };
-- Pick Pocket Button
    PickPocketModes = {
      [1] = { mode = "", value = 1 , overlay = "Auto Pick Pocket Enabled", tip = "Profile will attempt to Pick Pocket prior to combat.", highlight = 1, icon = br.player.spell.pickPocket},
      [2] = { mode = "", value = 2 , overlay = "Only Pick Pocket Enabled", tip = "Profile will attempt to Sap and only Pick Pocket, no combat.", highlight = 0, icon = br.player.spell.pickPocket},
      [3] = { mode = "", value = 3, overlay = "Pick Pocket Disabled", tip = "Profile will not use Pick Pocket.", highlight = 0, icon = br.player.spell.pickPocket}
    };
    CreateButton("PickPocket",0,1)
    VanishDFAModes = {
      [1] = { mode = "", value = 1 , overlay = "VanishDFA", tip = "Vanish before DfA", highlight = 1, icon = br.player.spell.vanish},
      [2] = { mode = "", value = 2 , overlay = "VanishDFA", tip = "No vanish before DfA", highlight = 0, icon = br.player.spell.vanish},
    };
    CreateButton("VanishDFA",1,1)
    DFAModes = {
      [1] = { mode = "", value = 1 , overlay = "DFA", tip = "DfA", highlight = 1, icon = br.player.spell.deathFromAbove},
      [2] = { mode = "", value = 2 , overlay = "DFA", tip = "no DfA", highlight = 0, icon = br.player.spell.eviscerate},
    };
    CreateButton("DFA",2,1)
    OpenerModes = {
      [1] = { mode = "", value = 1 , overlay = "VanishDFA", tip = "Opener", highlight = 1, icon = br.player.spell.shadowstrike},
      [2] = { mode = "", value = 2 , overlay = "VanishDFA", tip = "No opener", highlight = 0, icon = br.player.spell.backstab},
    };
    CreateButton("Opener",3,1)
    FeintModes = {
      [1] = { mode = "", value = 1 , overlay = "Feint", tip = "Feint next cast", highlight = 1, icon = br.player.spell.feint},
      [2] = { mode = "", value = 2 , overlay = "Feint", tip = "Resume rotation", highlight = 0, icon = br.player.spell.feint},
    };
    CreateButton("Feint",4,1)
end

---------------
--- OPTIONS ---
---------------
local function createOptions()
    local optionTable

    local function rotationOptions()
        -----------------------
        --- GENERAL OPTIONS ---
        -----------------------
        section = br.ui:createSection(br.ui.window.profile,  "General")
            -- Stealth
            br.ui:createDropdown(section,  "Stealth", {"|cff00FF00Always", "|cffFFDD00PrePot", "|cffFF000020Yards"},  1, "Stealthing method.")
            -- Shadowstep
            br.ui:createCheckbox(section,  "Shadowstep")
            -- Pre-Pull Timer
            br.ui:createSpinner(section, "Pre-Pull Timer",  5,  1,  10,  1,  "|cffFFFFFFSet to desired time to start Pre-Pull (DBM Required). Min: 1 / Max: 10 / Interval: 1")
            -- Dummy DPS Test
            br.ui:createSpinner(section, "DPS Testing",  5,  5,  60,  5,  "|cffFFFFFFSet to desired time for test in minuts. Min: 5 / Max: 60 / Interval: 5")

        br.ui:checkSectionState(section)
        ------------------------
        --- COOLDOWN OPTIONS ---
        ------------------------
        section = br.ui:createSection(br.ui.window.profile,  "Cooldowns")
            -- Agi Pot
            br.ui:createCheckbox(section, "Agi-Pot")
            -- Legendary Ring
            --br.ui:createCheckbox(section, "Legendary Ring")
            br.ui:createCheckbox(section, "Marked For Death - Precombat")
            br.ui:createCheckbox(section, "Symbols of Death - Precombat")
            -- Shadow Strike
            br.ui:createSpinnerWithout(section, "SS Range",  5,  5,  15,  1,  "|cffFFBB00Shadow Strike range, 5 = Melee")
            --Shuriken Toss OOR
            br.ui:createSpinner(section, "Shuriken Toss OOR",  85,  5,  100,  5,  "|cffFFBB00Check to use Shuriken Toss out of range and energy to use at.")
            -- Racial
            br.ui:createCheckbox(section,"Racial")
            -- Trinkets
            br.ui:createCheckbox(section,"Trinkets")
            -- Artifact
            br.ui:createDropdownWithout(section,"Artifact", {"|cff00FF00Everything","|cffFFFF00Cooldowns","|cffFF0000Never"}, 1, "|cffFFFFFFWhen to use Artifact Ability.")
            -- Death From Above
            br.ui:createCheckbox(section, "Death From Above")
            -- Marked For Death
            br.ui:createDropdown(section, "Marked For Death", {"|cff00FF00Target", "|cffFFDD00Lowest"}, 1, "|cffFFBB00Health Percentage to use at.")
            -- Shadow Blades
            br.ui:createCheckbox(section, "Shadow Blades")
            -- Shadow Dance
            br.ui:createCheckbox(section, "Shadow Dance")
            -- Vanish
            br.ui:createCheckbox(section, "Vanish")
            -- SSW Offset
            br.ui:createSpinnerWithout(section, "SSW Offset", 0, 0, 10, 1, "|cffFFBB00For Advanced Users, check SimC Wiki. Leave this at 0 if you don't know what you're doing.")
            -- NB TTD
            br.ui:createSpinnerWithout(section, "NB HP Limit", 15, 0, 105, 1, "|cffFFFFFFHP *1kk hp for NB to be AOE casted/refreshed on.")
            br.ui:createSpinnerWithout(section, "exploit", 4, 0, 105, 0.01, "|cffFFFFFFHP *1kk hp for NB to be AOE casted/refreshed on.")

            br.ui:createCheckbox(section, "Opener")

        br.ui:checkSectionState(section)
        -------------------------
        --- DEFENSIVE OPTIONS ---
        -------------------------
        section = br.ui:createSection(br.ui.window.profile, "Defensive")
            -- Healthstone
            br.ui:createSpinner(section, "Healthstone",  60,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
            -- Heirloom Neck
            br.ui:createSpinner(section, "Heirloom Neck",  60,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
           -- Cloak of Shadows
            br.ui:createCheckbox(section, "Cloak of Shadows")
            -- Crimson Vial
            br.ui:createSpinner(section, "Crimson Vial",  50,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
            -- Evasion
            br.ui:createSpinner(section, "Evasion",  50,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
            -- Feint
            br.ui:createSpinner(section, "Feint", 75, 0, 100, 5, "|cffFFBB00Health Percentage to use at.")
        br.ui:checkSectionState(section)
        -------------------------
        --- INTERRUPT OPTIONS ---
        -------------------------
        section = br.ui:createSection(br.ui.window.profile, "Interrupts")
            -- Kick
            br.ui:createCheckbox(section, "Kick")
            -- Kidney Shot
            br.ui:createCheckbox(section, "Kidney Shot")
            -- Blind
            br.ui:createCheckbox(section, "Blind")
            -- Interrupt Percentage
            br.ui:createSpinner(section, "Interrupt At",  0,  0,  95,  5,  "|cffFFBB00Cast Percentage to use at.")
        br.ui:checkSectionState(section)
        ----------------------
        --- TOGGLE OPTIONS ---
        ----------------------
        section = br.ui:createSection(br.ui.window.profile,  "Toggle Keys")
            -- Single/Multi Toggle
            br.ui:createDropdown(section,  "Rotation Mode", br.dropOptions.Toggle,  4)
            --Cooldown Key Toggle
            br.ui:createDropdown(section,  "VanishDFA Mode", br.dropOptions.Toggle,  6)
            --Defensive Key Toggle
            br.ui:createDropdown(section,  "DFA Mode", br.dropOptions.Toggle,  6)
            -- Interrupts Key Toggle
            br.ui:createDropdown(section,  "Interrupt Mode", br.dropOptions.Toggle,  6)
            -- Cleave Toggle
            br.ui:createDropdown(section,  "Cleave Mode", br.dropOptions.Toggle,  6)
            -- Pick Pocket Toggle
            br.ui:createDropdown(section,  "PickPocket Mode", br.dropOptions.Toggle,  6)
            -- Pause Toggle
            br.ui:createDropdown(section,  "Pause Mode", br.dropOptions.Toggle,  6)
        br.ui:checkSectionState(section)
    end
    optionTable = {{
        [1] = "Rotation Options",
        [2] = rotationOptions,
    }}
    return optionTable
end

----------------
--- ROTATION ---
----------------
local function runRotation()
    
        --Print("Running: "..rotationName)

---------------
--- Toggles ---
---------------
        UpdateToggle("Rotation",0.25)
        br.player.mode.rotation = br.data.settings[br.selectedSpec].toggles["Rotation"]
        UpdateToggle("Cooldown",0.25)
        UpdateToggle("Trinkets",0.25)
        br.player.mode.trinkets = br.data.settings[br.selectedSpec].toggles["Trinkets"]
        UpdateToggle("Interrupt",0.25)
        UpdateToggle("Cleave",0.25)
        br.player.mode.cleave = br.data.settings[br.selectedSpec].toggles["Cleave"]
        UpdateToggle("PickPocket",0.25)
        br.player.mode.pickPocket = br.data.settings[br.selectedSpec].toggles["PickPocket"]
        UpdateToggle("VanishDFA",0.25)
        br.player.mode.VanishDFA = br.data.settings[br.selectedSpec].toggles["VanishDFA"]
        UpdateToggle("DFA",0.25)
        br.player.mode.dfa = br.data.settings[br.selectedSpec].toggles["DFA"]
        UpdateToggle("Opener",0.25)
        br.player.mode.opener = br.data.settings[br.selectedSpec].toggles["Opener"]
        UpdateToggle("Feint",0.25)
        br.player.mode.feint = br.data.settings[br.selectedSpec].toggles["Feint"]

--------------
--- Locals ---
--------------
        if leftCombat == nil then leftCombat = GetTime() end
        if profileStop == nil then profileStop = false end
        local addsExist                                                 = false
        local addsIn                                                    = 999
        local artifact                                                  = br.player.artifact
        local attacktar                                                 = UnitCanAttack("target","player")
        local buff                                                      = br.player.buff
        local cast                                                      = br.player.cast
        local cd                                                        = br.player.cd
        local charges                                                   = br.player.charges
        local combatTime                                                = getCombatTime()
        local combo, comboDeficit, comboMax                             = br.player.power.comboPoints.amount(), br.player.power.comboPoints.deficit(), br.player.power.comboPoints.max()
        local deadtar                                                   = UnitIsDeadOrGhost("target")
        local debuff                                                    = br.player.debuff
        local enemies                                                   = enemies or {}
        local flaskBuff, canFlask                                       = getBuffRemain("player",br.player.flask.wod.buff.agilityBig), canUse(br.player.flask.wod.agilityBig)
        local gcd                                                       = br.player.gcd
        local gcdMax                                                    = br.player.gcdMax
        local glyph                                                     = br.player.glyph
        local hastar                                                    = GetObjectExists("target")
        local healPot                                                   = getHealthPot()
        local inCombat                                                  = br.player.inCombat
        local lastSpell                                                 = lastSpellCast
        local level                                                     = br.player.level
        local mode                                                      = br.player.mode
        local multidot                                                  = (br.player.mode.cleave == 1 or br.player.mode.rotation ~= 3)
        local perk                                                      = br.player.perk
        local php                                                       = br.player.health
        local power, powerMax, powerDeficit, powerRegen, powerTTM       = br.player.power.energy.amount(), br.player.power.energy.max(), br.player.power.energy.deficit(), br.player.power.energy.regen(), br.player.power.energy.ttm()
        local pullTimer                                                 = br.DBM:getPulltimer()
        local race                                                      = br.player.race
        local racial                                                    = br.player.getRacial()
        local solo                                                      = #br.friend < 2
        local spell                                                     = br.player.spell
        local stealth                                                   = br.player.buff.stealth.exists()
        local stealthingAll                                             = br.player.buff.stealth.exists() or br.player.buff.vanish.exists() or br.player.buff.shadowmeld.exists() or br.player.buff.shadowDance.exists() or br.player.buff.subterfuge.exists()
        local stealthingRogue                                           = br.player.buff.stealth.exists() or br.player.buff.vanish.exists() or br.player.buff.shadowDance.exists() or br.player.buff.subterfuge.exists()
        local tier19_2pc                                                = TierScan("T19") >= 2 
        local tier20_2pc                                                = TierScan("T20") >= 2   
        local tier20_4pc                                                = TierScan("T20") >= 4   
        local talent                                                    = br.player.talent
        local time                                                      = getCombatTime()
        local ttd                                                       = getTTD
        local ttm                                                       = br.player.power.energy.ttm()
        local units                                                     = units or {}

        units.dyn5 = br.player.units(5)
        units.dyn30 = br.player.units(30)
        enemies.yards5 = br.player.enemies(5)
        enemies.yards8 = br.player.enemies(8)
        enemies.yards10 = br.player.enemies(10)
        enemies.yards20 = br.player.enemies(20)
        enemies.yards30 = br.player.enemies(30)

        
        --pint(tostring(buff.masterAssassinsInitiative.remain()))

        
        if isDeBuffed("player", 230139) or isDeBuffed("player", 234059) or isDeBuffed("player", 230959) or isDeBuffed("player", 236011) then notdfa = false else notdfa = true end
        if talent.anticipation then antital = 1 else antital = 0 end
        if talent.shadowFocus then shadFoc = 1 else shadFoc = 0 end
        if talent.deeperStrategem and not buff.shadowBlades.exists() and not buff.masterAssassinsInitiative.exists() then f6 = true else f6 = false end
        if talent.deeperStrategem then dStrat = 1 else dStrat = 0 end
        if talent.deeperStrategem and not buff.shadowBlades.exists() and (buff.masterAssassinsInitiative.duration() == 0 or t20_4pc) then dStratNoBlades = 1 else dStratNoBlades = 0 end
        if talent.envelopingShadows then enveloped = 1 else enveloped = 0 end
        if talent.masterOfShadows then mosTalent = 1 else mosTalent = 0 end
        if talent.premeditation then premed = 1 else premed = 0 end
        if talent.subterfuge then subty = 1 else subty = 2 end
        if talent.subterfuge or buff.theFirstOfTheDead.exists() then subtyDead = 1 else subtyDead = 0 end
        if talent.vigor then vigorous = 1 else vigorous = 0 end
        if combatTime < 10 then justStarted = 1 else justStarted = 0 end
        if vanishTime == nil then vanishTime = GetTime() end
        if ShDCdTime == nil then ShDCdTime = GetTime() end
        if ShdMTime == nil then ShdMTime = GetTime() end
        if bugTime == nil then bugTime = GetTime() end
        if buff.shadowBlades.exists() then shadowedBlade = 1 else shadowedBlade = 0 end
        if hasEquiped(137032) then shadowWalker = 1 else shadowWalker = 0 end
        if hasEquiped(144236) then mantleMaster = 1 else mantleMaster = 0 end
        if hasEquiped(151818) then LeGloves = 1 else LeGloves = 0 end
        if mantleMaster == 1 and combatTime < 30 then mantleMasterRecent = 1 else mantleMasterRecent = 0 end
        if hasEquiped(144236) and hasEquiped(137100) then halfMantled = 1 else halfMantled = 0 end
        if stealthingAll then stealthedAll = 1 else stealthedAll = 0 end
        if cd.goremawsBite.remain() > 0 and not buff.feedingFrenzy.exists() then FreeFin = 1 else noGoreFrenzy = 0 end
        if time < 10 then nbpull = 1 else nbpull = 0 end
        if opener == nil then opener = false end
        -- if lastCast == spell.deathFromAbove and not buff.shadowDance.exists() then shddfa = true else shddfa = false end
        -- if shddfa then
        --     if cast.shadowDance() then return end
        -- end
        -- print(f6)

        if not inCombat and not GetObjectExists("target") and mode.opener == 2 then
            NB1 = false
            SS1 = false
            SS2 = false
            SS3 = false
            SS4 = false
            SS5 = false
            SS6 = false
            SS7 = false
            EVI1 = false
            EVI2 = false
            DFA1 = false
            VAN1 = false
            SOD1 = false
            SHD1 = false
            opener = false
            toggle("Opener",1)
        end

        


        dotHPLimit = getOptionValue("NB HP Limit") * 1000000


        -- variable,name=ssw_refund,value=equipped.shadow_satyrs_walk*(6+ssw_refund_offset)
        local sswRefund = shadowWalker * (6 + getOptionValue("SSW Offset"))
        -- variable,name=stealth_threshold,value=(65+talent.vigor.enabled*35+talent.master_of_shadows.enabled*10+variable.ssw_refund)
        local stealthThreshold = (65 + vigorous * 35 + mosTalent * 10 + sswRefund)
        -- variable,name=1.725+0.725*talent.enveloping_shadows.enabled
        local shdFrac = 1.815 + 0.725 * enveloped

        -- Custom Functions
        local function usePickPocket()
            if stealthingAll and not inCombat and (mode.pickPocket == 1 or mode.pickPocket == 2) then
                return true
            else
                return false
            end
        end
        local function isPicked(thisUnit)   --  Pick Pocket Testing
            if thisUnit == nil then thisUnit = "target" end
            if GetObjectExists(thisUnit) then
                if myTarget ~= UnitGUID(thisUnit) then
                    canPickpocket = true
                    myTarget = UnitGUID(thisUnit)
                end
            end
            if (canPickpocket == false or mode.pickPocket == 3 or GetNumLootItems()>0) and not isDummy() then
                return true
            else
                return false
            end
        end

--------------------
--- Action Lists ---
--------------------
    -- Action List - Extras
        local function actionList_Extras()
        -- Dummy Test
            if isChecked("DPS Testing") then
                if GetObjectExists("target") then
                    if getCombatTime() >= (tonumber(getOptionValue("DPS Testing"))*60) and isDummy() then
                        StopAttack()
                        ClearTarget()
                        ChatOverlay(tonumber(getOptionValue("DPS Testing")) .." Minute Dummy Test Concluded - Profile Stopped")
                        profileStop = true
                    end
                end
            end
            -- Pick Pocket
            if usePickPocket() then
                if (isValidUnit(units.dyn5) or mode.pickPocket == 2) and mode.pickPocket ~= 3 then
                    if not isPicked(units.dyn5) and not isDummy(units.dyn5) then
                        if debuff.sap.remain(units.dyn5) < 1 and mode.pickPocket ~= 1 then
                            if cast.sap(units.dyn5) then return end
                        end
                        if lastSpell ~= spell.vanish then
                            if cast.pickPocket() then return end
                        end
                    end
                end
            end
        end -- End Action List - Extras
    -- Action List - Defensives
        local function actionList_Defensive()
            if useDefensive() and not stealth then
            -- Heirloom Neck
                if isChecked("Heirloom Neck") and php <= getOptionValue("Heirloom Neck") and not inCombat then
                    if hasEquiped(122668) then
                        if GetItemCooldown(122668)==0 then
                            useItem(122668)
                        end
                    end
                end
            -- Pot/Stoned
                if isChecked("Healthstone") and php <= getOptionValue("Healthstone") and inCombat then
                    if canUse(127834) then
                        useItem(127834)
                    end
                end
            -- Cloak of Shadows
                if isChecked("Cloak of Shadows") and canDispel("player",spell.cloakOfShadows) then
                    if cast.cloakOfShadows() then return end
                end
            -- Crimson Vial
                if isChecked("Crimson Vial") and php < getOptionValue("Crimson Vial") then
                    if cast.crimsonVial() then return end
                end
            -- Evasion
                if isChecked("Evasion") and php < getOptionValue("Evasion") and inCombat then
                    if cast.evasion() then return end
                end
            -- Feint on demand
            SLASH_FEINT1 = "/feinterino"
            SlashCmdList["FEINT"] = function(msg)
            if not buff.feint.exists() or (buff.feint.exists() and buff.feint.remain() <= 0.8) or isDeBuffed("player", 230139) and mode.feint == 2 then
                    if toggle("Feint",1) then return end
                end
            end 
            -- Feint
                if isChecked("Feint") and php <= getOptionValue("Feint") or mode.feint == 1 and not buff.feint.exists() then
                    if cast.feint() and toggle("Feint",2) then return end
                end
            end
        end -- End Action List - Defensive
    -- Action List - Interrupts
        local function actionList_Interrupts()
            if useInterrupts() and not stealth then
                for i=1, #enemies.yards20 do
                    local thisUnit = enemies.yards20[i]
                    local distance = getDistance(thisUnit)
                    if canInterrupt(thisUnit,getOptionValue("Interrupt At")) then
            -- Kick
                        -- kick
                        if isChecked("Kick") and distance < 5 then
                            if cast.kick(thisUnit) then return end
                        end
            -- Kidney Shot
                        if cd.kick.remain() ~= 0 and cd.blind.remain() == 0 then
                            if isChecked("Kidney Shot") then
                                if cast.kidneyShot(thisUnit) then return end
                            end
                        end
                        if isChecked("Blind") and (cd.kick.remain() ~= 0 or distance >= 5) then
            -- Blind
                            if cast.blind(thisUnit) then return end
                        end
                    end
                end
            end -- End Interrupt and No Stealth Check
        end -- End Action List - Interrupts
    -- Action List - Cooldowns
        local function actionList_Cooldowns()
            -- Print("Cooldowns")
            if getDistance(units.dyn5) < 5 then
        -- Potion
            if useCDs() and isChecked("Agi-Pot") and inRaid and canUse(142117) then
            if hasBloodLust() or ttd(units.dyn5) <= 60 or (buff.vanish.exists() and (buff.shadowBlades.exists() or cd.shadowBlades.remain() <= 30)) then
                            useItem(142117)
                        end
                    end
        -- Tricks on aggro
              if getSpellCD(57934) <= 0.1 then
                if (UnitThreatSituation("player", "target") ~= nil and UnitThreatSituation("player") >= 1 or (UnitExists("target") and isDummy("target"))) and UnitAffectingCombat("player") then
                    if inInstance or inRaid then
                        for i = 1, #br.friend do
                            if (br.friend[i].role == "TANK" or UnitGroupRolesAssigned(br.friend[i].unit) == "TANK") and UnitAffectingCombat(br.friend[i].unit) then
                              CastSpellByName(GetSpellInfo(57934),br.friend[i].unit)
                            end
                        end
                    else
                        if GetUnitExists("focus") then
                          CastSpellByName(GetSpellInfo(57934),"focus")
                        end
                    end
                end
              end
        -- Glaives
                if useCDs() and isChecked("Trinkets") and hasEquiped(147012) and canUse(147012) and ((buff.masterAssassinsInitiative.remain() >= 4 and buff.masterAssassinsInitiative.remain() < 4.5)) and #enemies.yards10 >= 2 then
                    useItem(147012)
                end
        -- Specter
                if useCDs() and isChecked("Trinkets") and hasEquiped(151190) and canUse(151190) and getDistance("target") <= 4 and ((buff.shadowDance.remain() >= 3 and buff.shadowDance.remain() < 3.6) or (buff.masterAssassinsInitiative.remain() >= 3 and buff.masterAssassinsInitiative.remain() < 3.3)) then
                    useItem(151190)
                end
        -- Vial
                if useCDs() and isChecked("Trinkets") and hasEquiped(147011) and canUse(147011) and ((buff.shadowDance.remain() >= 3 and buff.shadowDance.remain() < 3.6) or (buff.masterAssassinsInitiative.remain() >= 3 and buff.masterAssassinsInitiative.remain() < 3.3)) then
                    useItem(147011)
                end
        -- Trinkets
                if useCDs() and isChecked("Trinkets") then
                    if canUse(13) and not (hasEquiped(140808, 13) or hasEquiped(151190, 13) or hasEquiped(147012, 13) or hasEquiped(147011, 13)) then
                        useItem(13)
                    end
                    if canUse(14) and not (hasEquiped(140808, 14) or hasEquiped(151190, 14) or hasEquiped(147012, 14) or hasEquiped(147011, 14)) then
                        useItem(14)
                    end
                end
        -- Racial: Orc Blood Fury | Troll Berserking | Blood Elf Arcane Torrent
                -- blood_fury,if=stealthed.rogue
                -- berserking,if=stealthed.rogue
                -- arcane_torrent,if=stealthed.rogue&energy.deficit>70
                if useCDs() and isChecked("Racial") and stealthingRogue and (race == "Orc" or race == "Troll" or (race == "BloodElf" and powerDeficit > 70)) and getSpellCD(racial) == 0 then
                    if castSpell("player",racial,false,false,false) then return end
                end
        -- Symbols of Death
                --symbols_of_death,if=(talent.death_from_above.enabled&cooldown.death_from_above.remains<=3&(dot.nightblade.remains>=cooldown.death_from_above.remains+3|target.time_to_die-dot.nightblade.remains<=6)&(time>=3|set_bonus.tier20_4pc))|target.time_to_die-remains<=10
                if (hasEquiped(151818) and combo <= 6 - shadowedBlade - LeGloves * 4) or (not hasEquiped(151818) and combo >= 4 - shadowedBlade) and ((cd.deathFromAbove.remain() <= 3 and (debuff.nightblade.remain() >= 3 + cd.deathFromAbove.remain())) or isBoss("target") ) and mode.dfa == 1 and notdfa then
                    if cast.symbolsOfDeath() then return end
                end
        -- Shadow Blades  
        -- shadow_blades,if=(time>10&combo_points.deficit>=2+stealthed.all-equipped.mantle_of_the_master_assassin)|(time<10&(!talent.marked_for_death.enabled|combo_points.deficit>=3|dot.nightblade.ticking))               
                if useCDs() and isChecked("Shadow Blades") then
                    if (combatTime > 10 and comboDeficit >= 2 + stealthedAll - mantleMaster) or (combatTime < 10 and (not talent.markedForDeath or comboDeficit >= 3 or debuff.nightblade.exists(units.dyn5))) then
                        if cast.shadowBlades() then return end
                    end
                 end
        -- Goremaws Bite
                if getOptionValue("Artifact") == 1 or (getOptionValue("Artifact") == 2 and isBoss() and useCDs()) and cd.goremawsBite.remain() == 0 then 
                    if not stealthingAll and charges.shadowDance.frac() <= shdFrac 
                        and comboDeficit >= 4 - justStarted * 2 and powerDeficit > 50 + vigorous * 25 - justStarted * 15 
                    then
                        if cast.goremawsBite() then return end
                    end
                end
            end -- End Cooldown Usage Check
        end -- End Action List - Cooldowns
    -- Action List - Stealth Cooldowns
        local function actionList_StealthCooldowns()
            if getDistance(units.dyn5) < 5 then
        -- Shadow Dance
                -- shadow_dance,if=charges_fractional>=variable.shd_fractional|target.time_to_die<cooldown.symbols_of_death.remains
                if useCDs() and isChecked("Shadow Dance") and not buff.shadowDance.exists() then
                    if charges.shadowDance.frac() >= shdFrac or ttd(units.dyn5) < cd.symbolsOfDeath.remain() or (charges.shadowDance.frac() >= 1.1 and buff.symbolsOfDeath.remain() >= 4 and cd.deathFromAbove.remain() >= 15) then
                        if cast.shadowDance() then ShDCdTime = GetTime(); return end
                    end
                 end
        -- Shadowmeld
                -- pool_resource,for_next=1,extra_amount=40
                -- shadowmeld,if=energy>=40&energy.deficit>=10+variable.ssw_refund
                if useCDs() and isChecked("Racial") and not solo and race == "NightElf" then
                    if power < 40 then
                        return true
                    elseif power >= 40 and powerDeficit >= 10 + sswRefund then
                        if cast.shadowmeld() then ShdMTime = GetTime(); return end
                    end
                end
            end
        end
    -- Action List - Finishers
        local function actionList_Finishers()
         if combo >= 4 and (UnitHealth("target") >= dotHPLimit or isDummy("target")) and (buff.masterAssassinsInitiative.remain() == 0 or debuff.nightblade.remain("target") <= buff.masterAssassinsInitiative.remain()) 
                and ((debuff.nightblade.refresh("target") and (not artifact.finality or buff.finalityNightblade.exists())) or debuff.nightblade.remain("target") < 2) and not buff.shadowDance.exists()  
            then
                if cast.nightblade("target") then return end
            end
            -- nightblade,cycle_targets=1,if=target.time_to_die-remains>8&mantle_duration=0&((refreshable&(!finality|buff.finality_nightblade.up))|remains<tick_time*2)
            if isChecked("Nightblade Multidot") then
                for i=1, #enemies.yards5 do
                    local thisUnit = enemies.yards5[i]
                    if getDistance(thisUnit) <= 5 then
                        if ttd(thisUnit) - debuff.nightblade.remain(thisUnit) >= getOptionValue("Nightblade Multidot") and buff.masterAssassinsInitiative.remain() == 0 and not buff.symbolsOfDeath.exists()  
                            and ((debuff.nightblade.refresh(thisUnit) and (not artifact.finality or buff.finalityNightblade.exists())) or debuff.nightblade.remain(thisUnit) < 2) and debuff.nightblade.count() <= maxnightblade and (isDummy("target") or UnitHealth(thisUnit) >= dotHPLimit)
                        then
                            if cast.nightblade(thisUnit) then return end
                        end
                    end
                end
            end
            --nightblade,if=remains<cooldown.symbols_of_death.remains+10&cooldown.symbols_of_death.remains<=3
            if (debuff.nightblade.remain("target") < cd.symbolsOfDeath.remain() + 10) and cd.symbolsOfDeath.remain() <= 3 and UnitHealth("target") >= dotHPLimit then
                if cast.nightblade("target") then return end
            end
            -- Death from Above
            if mode.dfa == 1 and mode.VanishDFA == 1 and cd.deathFromAbove.remain() == 0 and not buff.masterAssassinsInitiative.exists() and buff.symbolsOfDeath.exists() and  notdfa and (UnitHealth("target") >= dotHPLimit or inRaid or inInstance or isDummy("target")) then 
                if power < 40 then 
                    return true
                elseif power >= 40 then
                    StopAttack()
                    if cast.vanish() then vanishTime = GetTime(); end
                    if cast.deathFromAbove() then return end
                end
            end
            if mode.dfa == 1 and (mode.VanishDFA == 2 or cd.vanish.remain() > 0) and (buff.symbolsOfDeath.exists() or cd.symbolsOfDeath.remain() >= 15) and notdfa and (UnitHealth("target") >= dotHPLimit or inRaid or inInstance) then
                    if cast.deathFromAbove() then end
            end
        -- Eviscerate
            -- eviscerate,if=!talent.death_from_above.enabled|cooldown.death_from_above.remains>=(energy.max-energy-combo_points*6)%energy.regen-(2+(equipped.mantle_of_the_master_assassin&equipped.denial_of_the_halfgiants))
            if (buff.symbolsOfDeath.exists() and (cd.deathFromAbove.remain() > 0 or not inRaid or not inInstance)) or not buff.symbolsOfDeath.exists() or mode.dfa == 2 then
                if cast.eviscerate() then return end
            end
        end -- End Action List - Finishers
    -- Action List - Stealthed
        local function actionList_Stealthed()
            --
            if not inCombat and getDistance("target") <= getOptionValue ("SS Range") then
                 if cast.shadowstrike() then return end
            end
        -- Finisher
            -- call_action_list,name=finish,if=combo_points>=5&(spell_targets.shuriken_storm>=3+equipped.shadow_satyrs_walk|(mantle_duration<=1.3&mantle_duration-gcd.remains>=0.3))
            if combo >= 5 and (#enemies.yards10 >= 3 + shadowWalker or (buff.masterAssassinsInitiative.remain() <= 1.3 and buff.masterAssassinsInitiative.remain() - gcd >= 0.3)) then
                if actionList_Finishers() then return end
            end
        -- Shuriken Storm
            -- shuriken_storm,if=buff.shadowmeld.down&((combo_points.deficit>=3&spell_targets.shuriken_storm>=3+equipped.shadow_satyrs_walk)|(combo_points.deficit>=1&buff.the_dreadlords_deceit.stack>=29))
            if not buff.shadowmeld.exists() and not buff.theFirstOfTheDead.exists() and ((comboDeficit >= 3 and #enemies.yards10 >= 3 + shadowWalker) or (comboDeficit >= 1 and buff.theDreadlordsDeceit.stack() >= 29)) and mode.rotation == 1 then
                if cast.shurikenStorm() then return end
            end
        -- Finisher
            -- call_action_list,name=finish,if=combo_points>=5&combo_points.deficit<3+buff.shadow_blades.up-equipped.mantle_of_the_master_assassin
            if combo >= 5 and comboDeficit < 3 + shadowedBlade - mantleMaster then
                if actionList_Finishers() then return end
            end
        -- Shadowstrike
            -- shadowstrike
             if getDistance("target") <= getOptionValue ("SS Range") then
                 if cast.shadowstrike() then return end
            end
        end
    -- Action List - Generators
        local function actionList_Generators()
            -- Print("Generator")
        -- Shuriken Storm
            -- shuriken_storm,if=spell_targets.shuriken_storm>=2
            if #enemies.yards10 >= 2 and not buff.theFirstOfTheDead.exists() and mode.rotation == 1 then
                if cast.shurikenStorm() then return end
            end
        -- Backstab / Gloomblade
            -- gloomblade
            -- backstab
            if #enemies.yards10 == 1 then
                if cast.backstab() then return end
            end
        end -- End Action List - Generators
    -- Action List - Starter
        local function actionList_Starter()
        -- Stealth Cooldowns
            if powerDeficit <= stealthThreshold - 25 * FreeFin  and (not hasEquiped(137032) or charges.shadowDance.frac() >= shdFrac or powerDeficit >= 10) then
                if actionList_StealthCooldowns() then return end
            end
            -- call_action_list,name=stealth_cds,if=mantle_duration>2.3
            if buff.masterAssassinsInitiative.remain() > 2.3 and buff.masterAssassinsInitiative.remain() <= 5 then
                if actionList_StealthCooldowns() then return end
            end
            -- call_action_list,name=stealth_cds,if=spell_targets.shuriken_storm>=5
            if #enemies.yards10 >= 5 then
                if actionList_StealthCooldowns() then return end
            end
            -- call_action_list,name=stealth_cds,if=(cooldown.shadowmeld.up&!cooldown.vanish.up&cooldown.shadow_dance.charges<=1)
            if (cd.shadowmeld.remain() == 0 and cd.vanish.remain() > 0 and charges.shadowDance.frac() <= 1) then
                if actionList_StealthCooldowns() then return end
            end
            -- call_action_list,name=stealth_cds,if=target.time_to_die<12*cooldown.shadow_dance.charges_fractional*(1+equipped.shadow_satyrs_walk*0.5)
            if ttd(units.dyn5) < 12 * charges.shadowDance.frac() * (1 + shadowWalker * 0.5) then
                if actionList_StealthCooldowns() then return end
            end
        end
    -- Action List - PreCombat
        local function actionList_PreCombat()
            -- Print("PreCombat")
        -- Stealth
            -- stealth
            if isChecked("Stealth") and (not IsResting() or isDummy("target")) and not inCombat and not stealth then
                if getOptionValue("Stealth") == 1 then
                    if cast.stealth() then return end
                end
                if getOptionValue("Stealth") == 2 then
                    for i = 1, #enemies.yards20 do
                        local thisUnit = enemies.yards20[i]
                        if UnitIsEnemy(thisUnit,"player") or isDummy("target") then
                            if cast.stealth() then return end
                        end
                    end
                end
            end
            if isValidUnit("target") and mode.pickPocket ~= 2 then
        -- Potion
                -- potion
                if stealth then
                    if useCDs() and isChecked("Potion") and inRaid then
                        if canUse(127844) then
                            useItem(127844)
                        elseif canUse(142117) then
                            useItem(142117)
                        end
                    end
                end 
        -- Marked For Death
                -- marked_for_death,if=raid_event.adds.in>40
                if isChecked("Marked For Death - Precombat") and not inCombat then
                    if cast.markedForDeath("target") then return end
                end
        -- Symbols of Death
                -- symbols_of_death
                if isChecked("Symbols of Death - Precombat") and not inCombat then
                    if cast.symbolsOfDeath("player") then return end
                end
            end
        end -- End Action List - PreCombat
    -- Action List - Opener
        local function actionList_Opener()
            if isValidUnit("target") and mode.pickPocket ~= 2 then
        -- Shadowstep
                if isChecked("Shadowstep") and (not stealthingAll or power < 40 or getDistance("target") > getOptionValue ("SS Range")) and not inCombat and getDistance("target") >= 8 then
                    if cast.shadowstep("target") then return end
                end
        -- Shadowstrike
                if (not isChecked("Shadowstep") or stealthingAll) and getDistance("target") <= getOptionValue ("SS Range") and not inCombat then
                    if cast.shadowstrike("target") then return end
                end
        -- Start Attack
                if getDistance("target") < 5 and not stealthingAll then
                    StartAttack()
                end
            end
        end -- End Action List - Opener

        local function actionList_Open()
            --if (opener == false and time < 1) and (isDummy("target") or isBoss("target")) and (cd.vanish > 0 or not buff.shadowBlades.exists()) then Print("Opener failed due do cds"); opener = true end

            if not tier20_4pc then

                        if not NB1 and not debuff.nightblade.exists("target") then
                            if cast.nightblade() then NB1 = true; end
                        elseif NB1 and not SS1 and cd.global.remain() == 0 then
                            RunMacroText("/cast Символы смерти")
                            RunMacroText("/cast Танец теней")
                            RunMacroText("/cast Удар тьмы")
                            SS1 = true
                        elseif SS1 and not SS2 then
                            castOpener("shadowstrike","SS2",5)
                        elseif SS2 and not EVI1 then
                            castOpener("eviscerate","EVI1",6)
                        elseif EVI1 and not SS3 then
                            castOpener("shadowstrike","SS3",7)
                            Print("Opener Complete")
                            opener = true
                            toggle("Opener",2)
                        end
            end
            
            if tier20_4pc and hasEquiped(151818) then
                        if not NB1 and not debuff.nightblade.exists("target") then
                            if cast.nightblade() then NB1 = true; end
                        elseif NB1 and not SS1 then
                            print("huy")
                            RunMacroText("/cast Символы смерти")
                            RunMacroText("/cast Танец теней")
                            RunMacroText("/cast Удар тьмы")
                            SS1 = true
                        elseif SS1 and not SS2 then
                            castOpener("eviscerate","SS2",5)
                        elseif SS2 and gcd <= 0.3 and not EVI1 then
                            castOpener("shadowstrike","EVI1",6)
                        elseif EVI1 and gcd <= 0.3 and not SS3 then
                            castOpener("shadowstrike","SS3",7)
                            Print("Opener Complete")
                            opener = true
                            toggle("Opener",2)
                        end
            end

            if tier19_2pc and tier20_2pc and opener == false then
                        if not NB1 and gcd == 0 then
                            castOpener("nightblade","NB1",1)
                        elseif NB1 and not SHD1 then
                            castOpener("shadowDance","SHD1",3)
                        elseif SHD1 and not SS1 then
                            castOpener("shadowstrike","SS1",4)
                        elseif SS1 and not SOD1 then                            
                            castOpener("symbolsOfDeath","SOD1",2)
                        elseif SOD1 and not SS2 then
                            castOpener("shadowstrike","SS2",5)
                        elseif SS2 and not EVI1 then
                            castOpener("eviscerate","EVI1",6)
                        elseif EVI1 and not SS3 then
                            castOpener("shadowstrike","SS3",7)
                        elseif SS3 and not VAN1 and gcd == 0 then
                            if castSpell("player",1856,false,false,false) then VAN1 = true; end
                        elseif VAN1 and not SS4 then
                            castOpener("shadowstrike","SS4",9)
                        elseif SS4 and not DFA1 then
                            castOpener("deathFromAbove","DFA1",10)
                        elseif DFA1 and not SS5 then
                            castOpener("shadowstrike","SS5",11)
                        elseif SS5 and not SS6 then
                            castOpener("shadowstrike","SS6",12)
                        elseif SS6 and not EVI2 then
                            castOpener("eviscerate","EVI2",13)
                         elseif EVI2 and not SS7 then
                            castOpener("shadowstrike","SS7",14)
                        elseif SS7 then
                            Print("Opener Complete")
                            opener = true
                        end
            end  
        end
---------------------
--- Begin Profile ---
---------------------
        if not inCombat and not hastar and profileStop==true then
            profileStop = false
        elseif (inCombat and profileStop == true) or pause() or (IsMounted() or IsFlying()) or (isDeBuffed("player",230950) or isDeBuffed("player",230959)) then
            return true
        else

            print(cd.global.remain())

        if lastCast == spell.deathFromAbove and inCombat then
            if castSpell("player",185313,false,false,false) then ShDCdTime = GetTime(); return end
        end  
-----------------------
--- Extras Rotation ---
-----------------------
            if actionList_Extras() then return end
--------------------------
--- Defensive Rotation ---
--------------------------
            if actionList_Defensive() then return end
------------------------------
--- Out of Combat Rotation ---
------------------------------
            if actionList_PreCombat() then return end
----------------------------
--- Out of Combat Opener ---
----------------------------
            if actionList_Opener() then return end

            if mode.opener == 1 and (isBoss("target") or isDummy("target")) then
                if actionList_Open() then return end
            end
--------------------------
--- In Combat Rotation ---
--------------------------
            if inCombat and mode.pickPocket ~= 2 and isValidUnit(units.dyn5) and (opener == true or mode.opener == 2 or not (isBoss("target") or isDummy("target"))) then
------------------------------
--- In Combat - Interrupts ---
------------------------------
                if actionList_Interrupts() then return end
----------------------------------
--- In Combat - Begin Rotation ---
----------------------------------
        -- Shadowstep
                if isChecked("Shadowstep") and getDistance("target") >= 8 then
                    if cast.shadowstep("target") then return end
                end
        -- Shuriken Toss
                if isChecked("Shuriken Toss OOR") and power >= getOptionValue("Shuriken Toss OOR") and getDistance(units.dyn30) > 8 and hasThreat(units.dyn30) and not stealthingAll then
                    if cast.shurikenToss() then return end
                end
                if getDistance(units.dyn5) < 5 then

                    if not stealthingAll and not IsCurrentSpell(6603) then
                        StartAttack(units.dyn5)
                    end
        -- Cooldowns
                    -- call_action_list,name=cds
                    if actionList_Cooldowns() then return end
        -- Stealthed
                    -- run_action_list,name=stealthed,if=stealthed|buff.shadowmeld.up
                    if stealthingAll then
                        if actionList_Stealthed() then return end
                    end
        -- Nightblade
                    -- nightblade,if=target.time_to_die>6&remains<gcd.max&combo_points>=4-(time<10)*2
                    if combo >= 4 - 2 * nbpull and (not debuff.nightblade.exists() or (debuff.nightblade.exists() and debuff.nightblade.remain() < gcd)) and (isDummy("target") or UnitHealth("target") >= dotHPLimit) and not buff.shadowDance.exists() then
                        if cast.nightblade() then return end
                    end
        -- Starter
                    -- call_action_list,name=stealth_als,if=talent.dark_shadow.enabled&combo_points.deficit>=3&(dot.nightblade.remains>4+talent.subterfuge.enabled|cooldown.shadow_dance.charges_fractional>=1.9&(!equipped.denial_of_the_halfgiants|time>10))
                    if talent.darkShadow and comboDeficit >= 3 and (debuff.nightblade.remain(units.dyn5) > 4 + subty or charges.shadowDance.frac() >= 1.9 and (not hasEquiped(137100) or combatTime > 10)) then
                        if actionList_Starter() then return end
                    end
                    -- call_action_list,name=stealth_als,if=!talent.dark_shadow.enabled&(combo_points.deficit>=3|cooldown.shadow_dance.charges_fractional>=1.9+talent.enveloping_shadows.enabled)
                    if not talent.darkShadow and (comboDeficit >= 3 or charges.shadowDance.frac() >= 1.9 + enveloped) then
                        if actionList_Starter() then return end
                    end
        -- Finishers
                    -- call_action_list,name=finish,if=combo_points>=5+(talent.deeper_stratagem.enabled&!buff.shadow_blades.up&(mantle_duration=0|set_bonus.tier20_4pc))|(combo_points>=4&combo_points.deficit<=2&spell_targets.shuriken_storm>=3&spell_targets.shuriken_storm<=4)|(target.time_to_die<=1&combo_points>=3)
                    if (f6 and combo >= 6) or (f6 and combo >= 5 and buff.symbolsOfDeath.exists()) or (not f6 and combo >= 5) or (hasEquiped(151818) and cd.symbolsOfDeath.remain() <= 1.5 and combo >= 2) or (combo >= 4 and comboDeficit <= 2 and #enemies.yards10 >= 3 and #enemies.yards10 <= 4 and cd.deathFromAbove.remain() > 0) then
                        if actionList_Finishers() then return end
                    end
        -- Generators
                    -- call_action_list,name=build,if=energy.deficit<=variable.stealth_threshold
                    -- if GetTime() > vanishTime + 1 and GetTime() > ShDCdTime + 1 and GetTime() > ShdMTime + 1 and edThreshVar then
                    if powerDeficit <= stealthThreshold and combo < 6 then
                        if actionList_Generators() then return end
                    end
                end
            end -- End In Combat
        end -- End Profile
    
end -- runRotation
local id = 261
if br.rotations[id] == nil then br.rotations[id] = {} end
tinsert(br.rotations[id],{
    name = rotationName,
    toggles = createToggles,
    options = createOptions,
    run = runRotation,
})