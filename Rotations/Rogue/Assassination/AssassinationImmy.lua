local rotationName = "immy"

---------------
--- Toggles ---
---------------
local function createToggles()
-- Rotation Button
    RotationModes = {
        [1] = { mode = "", value = 1 , overlay = "DPS Rotation Enabled", tip = "Enable DPS Rotation", highlight = 1, icon = br.player.spell.toxicBlade},
        [2] = { mode = "", value = 2 , overlay = "DPS Rotation Disabled", tip = "Disable DPS Rotation", highlight = 0, icon = br.player.spell.crimsonVial}
    };
    CreateButton("Rotation",1,0)
-- Cooldown Button

-- Blade Flurry Button
    CleaveModes = {
        [1] = { mode = "", value = 1 , overlay = "", tip = "Cleave on.", highlight = 1, icon = br.player.spell.rupture},
        [2] = { mode = "", value = 2 , overlay = "", tip = "Cleave off.", highlight = 0, icon = br.player.spell.rupture}
    };
    CreateButton("Cleave",2,0)
-- Interrupt Button
    InterruptModes = {
        [1] = { mode = "", value = 1 , overlay = "Interrupts Enabled", tip = "Includes Basic Interrupts.", highlight = 1, icon = br.player.spell.kick},
        [2] = { mode = "", value = 2 , overlay = "Interrupts Disabled", tip = "No Interrupts will be used.", highlight = 0, icon = br.player.spell.kick}
    };
    CreateButton("Interrupt",3,0)
    SpecialModes = {
      [1] = { mode = "", value = 1 , overlay = "", tip = "", highlight = 1, icon = br.player.spell.vendetta},
      [2] = { mode = "", value = 2 , overlay = "", tip = "", highlight = 0, icon = br.player.spell.vendetta},
    };
    CreateButton("Special",4,0)     

    OpenerModes = {
      [1] = { mode = "", value = 1 , overlay = "", tip = "", highlight = 1, icon = br.player.spell.garrote},
      [2] = { mode = "", value = 2 , overlay = "", tip = "", highlight = 0, icon = br.player.spell.garrote},
    };
    CreateButton("Opener",4,1)

    FeintModes = {
      [1] = { mode = "", value = 1 , overlay = "", tip = "", highlight = 1, icon = br.player.spell.feint},
      [2] = { mode = "", value = 2 , overlay = "", tip = "", highlight = 0, icon = br.player.spell.feint},
    };
    CreateButton("Feint",5,1)

    TBExModes = {
      [1] = { mode = "", value = 1 , overlay = "", tip = "", highlight = 1, icon = br.player.spell.exsanguinate},
      [2] = { mode = "", value = 2 , overlay = "", tip = "", highlight = 0, icon = br.player.spell.exsanguinate},
    };
    CreateButton("TBEx",5,0)      

   
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
            -- Opening Attack
            br.ui:createCheckbox(section, "Opener")
            -- mfd prepull
            br.ui:createCheckbox(section, "Marked For Death - Precombat")
            -- Stealth
            br.ui:createDropdown(section, "Stealth", {"|cff00FF00Always", "|cffFF000020Yards"},  2, "Stealthing method.")
        br.ui:checkSectionState(section)
        ------------------------
        --- OFFENSIVE OPTIONS ---
        ------------------------
        section = br.ui:createSection(br.ui.window.profile,  "Offensive")
            -- Trinkets
            br.ui:createCheckbox(section, "Trinkets")
            -- Agi Pot
            br.ui:createCheckbox(section, "Agi-Pot")
            -- Marked For Death
            --br.ui:createDropdown(section, "Marked For Death", {"|cff00FF00Target", "|cffFFDD00Lowest"}, 1)
            -- Vanish
            br.ui:createCheckbox(section, "Vanish")
            -- Racial
            br.ui:createCheckbox(section, "Racial")
            -- Pistol Shot OOR
            br.ui:createCheckbox(section, "Change target in melee")
            -- KS
            br.ui:createCheckbox(section, "Toxic Blade/Exsa")
            -- BR
            br.ui:createCheckbox(section, "Opener refresh")
            -- RTB
            br.ui:createCheckbox(section, "Toxic Blade on cd")
            br.ui:createSpinnerWithout(section, "Dots HP Limit", 15, 0, 105, 1, "|cffFFFFFFHP *10k hp for dots to be AOE casted/refreshed on.")

            br.ui:createSpinnerWithout(section, "Max Garrotes refresh SS",  3,  1,  6,  1,  "max garrotes ss")

        br.ui:checkSectionState(section)
        -------------------------
        --- DEFENSIVE OPTIONS ---
        -------------------------
        section = br.ui:createSection(br.ui.window.profile, "Defensive")
            -- Healthstone
            br.ui:createSpinner(section, "Healing Potion/Healthstone",  60,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
            -- Crimson Vial
            br.ui:createSpinner(section, "Crimson Vial",  50,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
            -- Feint
            br.ui:createSpinner(section, "Feint", 75, 0, 100, 5, "|cffFFBB00Health Percentage to use at.")
            -- Riposte
            br.ui:createSpinner(section, "Evasion",  50,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
            -- Cloak with KS
            br.ui:createCheckbox(section, "Cloak Killing Spree")
        br.ui:checkSectionState(section)
        -------------------------
        --- INTERRUPT OPTIONS ---
        -------------------------
        section = br.ui:createSection(br.ui.window.profile, "Interrupts")
            -- Kick
            br.ui:createCheckbox(section, "Kick")
            -- Gouge
            br.ui:createCheckbox(section, "Gouge")
            -- Blind
            br.ui:createCheckbox(section, "Blind")
            -- Between the Eyes
            br.ui:createCheckbox(section, "Between the Eyes")
            -- Interrupt Percentage
            br.ui:createSpinner(section,  "Interrupt At",  0,  0,  95,  5,  "|cffFFBB00Cast Percentage to use at.")
        br.ui:checkSectionState(section)
        ----------------------
        --- TOGGLE OPTIONS ---
        ----------------------
        section = br.ui:createSection(br.ui.window.profile,  "Toggle Keys")
            -- Single/Multi Toggle
            br.ui:createDropdown(section,  "Rotation Mode", br.dropOptions.Toggle,  4)
            --Cooldown Key Toggle
            br.ui:createDropdown(section,  "Cooldown Mode", br.dropOptions.Toggle,  3)
            --Defensive Key Toggle
            br.ui:createDropdown(section,  "Defensive Mode", br.dropOptions.Toggle,  6)
            -- Interrupts Key Toggle
            br.ui:createDropdown(section,  "Interrupt Mode", br.dropOptions.Toggle,  6)
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
        UpdateToggle("Interrupt",0.25)
        UpdateToggle("Cleave",0.25)
        br.player.mode.cleave = br.data.settings[br.selectedSpec].toggles["Cleave"]        
        UpdateToggle("Opener",0.25)
        br.player.mode.opener = br.data.settings[br.selectedSpec].toggles["Opener"]        
        UpdateToggle("Feint",0.25)
        br.player.mode.feint = br.data.settings[br.selectedSpec].toggles["Feint"]
        UpdateToggle("TBEx",0.25)
        br.player.mode.tbex = br.data.settings[br.selectedSpec].toggles["TBEx"]
        UpdateToggle("Special",0.25)
        br.player.mode.special = br.data.settings[br.selectedSpec].toggles["Special"]        

--------------
--- Locals ---
--------------
        if profileStop == nil then profileStop = false end
        local attacktar                                     = UnitCanAttack("target","player")
        local buff                                          = br.player.buff
        local cast                                          = br.player.cast
        local cd                                            = br.player.cd
        local combo, comboDeficit, comboMax                 = br.player.power.comboPoints.amount(), br.player.power.comboPoints.deficit(), br.player.power.comboPoints.max()
        local combospend                                    = ComboMaxSpend()
        local cTime                                         = getCombatTime()
        local debuff                                        = br.player.debuff
        local enemies                                       = br.player.enemies
        local gcd                                           = getSpellCD(61304)
        local hastar                                        = GetObjectExists("target")
        local healPot                                       = getHealthPot()
        local inCombat                                      = isInCombat("player")
        local lastSpell                                     = lastSpellCast
        local level                                         = br.player.level
        local mode                                          = br.player.mode
        local multidot                                      = (br.player.mode.cleave == 1 or br.player.mode.rotation == 2) and br.player.mode.rotation ~= 3
        local php                                           = br.player.health
        local power, powerDeficit, powerRegen               = br.player.power.energy.amount(), br.player.power.energy.deficit(), br.player.power.energy.regen()
        local race                                          = br.player.race
        local racial                                        = br.player.getRacial()
        local solo                                          = #br.friend < 2
        local spell                                         = br.player.spell
        local stealth                                       = br.player.buff.stealth.exists()
        local stealthingAll                                 = br.player.buff.stealth.exists() or br.player.buff.stealth2.exists() or br.player.buff.vanish.exists() or br.player.buff.shadowmeld.exists()
        local stealthingRogue                               = br.player.buff.stealth.exists() or br.player.buff.stealth2.exists() or br.player.buff.vanish.exists() or (br.player.buff.subterfuge.exists() and br.player.buff.subterfuge.remain() > 0.3)
        local stealthingMantle                              = br.player.buff.stealth.exists() or br.player.buff.stealth2.exists() or br.player.buff.vanish.exists()
        local talent                                        = br.player.talent
        local trait                                         = br.player.traits
        local ttd                                           = getTTD
        local ttdtarget                                     = HeroLib and HeroLib.Unit.Target:TimeToDie(5) or getTTD("target")
        local ttm                                           = br.player.power.energy.ttm()
        local units                                         = br.player.units
        local lootDelay                                     = getOptionValue("LootDelay")

        local HeroLibEnabled = HeroLib and true or false
        if HeroLibNotified == nil then HeroLibNotified = false end
        if not HeroLibEnabled and not HeroLibNotified then
            Print("Consider installing and downloading HeroLib for more accurate TimeToDie calculations.")
            Print("You can find it on Curse/Twitch app, or on Github.")
            HeroLibNotified = true
        end


        if opener == nil then opener = false end
        dotHPLimit = getOptionValue("Dots HP Limit") * 10000
        
-- Get Best Unit for Range
        -- units.get(range, aoe)
        units.get(20)
        units.get(5)
        -- Get List of Enemies for Range
        -- enemies.get(range, from unit, no combat, variable)
         -- makes enemies.yards40
        enemies.get(40)
        enemies.get(20) -- makes enemies.yards40nc
        enemies.get(10)
        enemies.get(5)

        if ssbug == nil then ssbug = 0 end
        local singleTarget = ((mode.rotation == 1 and #enemies.yards10 < 2) or (mode.rotation == 3 and #enemies.yards10 > 0))

        local bleeds = debuff.garrote.count() + debuff.rupture.count()
        local energyRegenCombined = powerRegen + bleeds * 7 / (2*1/(1+(GetHaste()/100)))
        local BleedTickTime, ExsanguinatedBleedTickTime = 2 / GetHaste(), 1 / GetHaste()

        if mode.opener == 2 then
            RUP1 = false
            GAR1 = false
            VEN1 = false
            MUTI1 = false
            RUP2 = false
            EXS1 = false
            opener = false
            if isChecked("Opener refresh") then
            toggle("Opener",1)
            end
        end
        

        -- if ssbuggy ~= nil then
        -- print(ssbuggy)
        -- end
        if ssbuggytime ~= nil then
            if GetTime() >= ssbuggytime + ssbuggytime1
                then ssbug = 0 
            end
        end
 

        -- local function ngs()
        --         local counter = 0
        --         for i = 1, #enemies.yards40 do
        --                     local thisUnit = enemies.yards40[i]
        --                     if debuff.garrote.applied(thisUnit) > 1 and debuff.garrote.exists(thisUnit) then 
        --                         counter = counter + 1
        --                     end
        --         end
        --     return tonumber(counter)
        -- end
        -- print(ngs())
        --if ngs() == 0 then ssbug = false end

        local ttdval = #enemies.yards10 <= 1 and 4 or 12
        --if getCombatTime() == 0 or cast.last.vanish() then garrotecountbuff = debuff.garrote.remainCount(1) end

        local function waitshit()
            if (mode.special == 2 and (not isBoss() or isDummy())) or mode.special == 1 then
                 return true
            else
                return false
            end
        end




    --     local function Evaluate_Garrote_Target(unit)
    --   return TargetUnit:DebuffRefreshableP(S.Garrote, 5.4)
    --     and (TargetUnit:PMultiplier(S.Garrote) <= 1 or TargetUnit:DebuffRemainsP(S.Garrote) <= (HL.Exsanguinated(TargetUnit, "Garrote") and ExsanguinatedBleedTickTime or BleedTickTime) and EmpoweredDotRefresh())
    --     and (not HL.Exsanguinated(TargetUnit, "Garrote") or TargetUnit:DebuffRemainsP(S.Garrote) <= 1.5 and EmpoweredDotRefresh())
    --     and Rogue.CanDoTUnit(TargetUnit, GarroteDMGThreshold);
    -- end
        --local lowestDot = debuff.garrote.lowest(5,"remain")

        local function EmpoweredDotRefresh()
            return #enemies.yards10 >= 3 + (trait.shroudedSuffocation.active() and 1 or 0)
        end
        
            SLASH_SPECIAL1 = "/bursterino"
            SlashCmdList["SPECIAL"] = function(msg)
            if mode.special == 2 then
                    if toggle("Special",1) then return end
                end
            end         


        local function usefiller() 
           return ((comboDeficit > 1 and debuff.garrote.remain("target") > 4) or powerDeficit <= 25 + energyRegenCombined or #enemies.yards10 >= 2) and true or false
        end

        -- local function bfrange()
        --     if talent.acrobaticStikes then return #enemies.get(9) end
        --     else return #enemies.get(6) end
        -- end

        if leftCombat == nil then leftCombat = GetTime() end
        --if vanishTime == nil then vanishTime = GetTime() end

        

        
--------------------
--- Action Lists ---
--------------------
    -- Action List - Extras
        --[[local function actionList_Extras()
        end -- End Action List - Extras]]
    -- Action List - DefensiveModes
        local function actionList_Defensive()
            SLASH_FEINT1 = "/feinterino"
            SlashCmdList["FEINT"] = function(msg)
            if not buff.feint.exists() or (buff.feint.exists() and buff.feint.remain() <= 0.8) or isDeBuffed("player", 230139) and mode.feint == 2 then
                    if toggle("Feint",1) then return end
                end
            end 
            -- Feint
                if mode.feint == 1 and not buff.feint.exists() then
                    if cast.feint() and toggle("Feint",2) then return end
                end

            if useDefensive() and not stealth then
            -- Health Pot/Healthstone
                if isChecked("Healing Potion/Healthstone") and php <= getOptionValue("Healing Potion/Healthstone")
                    and inCombat and (hasHealthPot() or hasItem(5512))
                then
                    if canUse(5512) then
                        useItem(5512)
                    elseif canUse(healPot) then
                        useItem(healPot)
                    end
                end
            -- Crimson Vial
                if cast.able.crimsonVial() and isChecked("Crimson Vial") and php < getOptionValue("Crimson Vial") then
                    if cast.crimsonVial() then return end
                end
            -- Feint
                if cast.able.feint() and isChecked("Feint") and php <= getOptionValue("Feint") and inCombat and not buff.feint then
                    if cast.feint() then return end
                end
            -- Evasion
                if cast.able.evasion() and isChecked("Evasion") and php <= getOptionValue("Evasion") and inCombat then
                    if cast.evasion() then return end
                end
            end
        end -- End Action List - Defensive

local function actionList_Stealthed()            
        --actions.stealthed=rupture,if=combo_points>=4&(talent.nightstalker.enabled|talent.subterfuge.enabled&talent.exsanguinate.enabled&cooldown.exsanguinate.remains<=2&variable.single_target|!ticking)&target.time_to_die-remains>6
            if (debuff.garrote.count() >= getOptionValue("Max Garrotes refresh SS") or #enemies.yards5 <= 2 and debuff.garrote.count() >= #enemies.yards5 ) and combo >=4 and cast.able.rupture() and (talent.nightstalker or (talent.subterfuge and talent.exsanguinate and cd.exsanguinate.remain() and mode.opener  == 2 and #enemies.yards10 < 2) or not debuff.rupture.exists()) and (ttdtarget - debuff.rupture.remain() > 6 or ttdtarget > 7777) then
                if cast.rupture() then return end
            end

        --actions.stealthed+=/envenom,if=combo_points>=cp_max_spend
            if combo >= combospend and #enemies.yards5 <= 1 and cast.able.envenom() and debuff.garrote.count() >= getOptionValue("Max Garrotes refresh SS") then
                if cast.envenom() then return end
            end   

        -- if debuff.garrote.count(units.dyn5) <= getOptionValue("Max Garrotes refresh SS") then

        --actions.stealthed+=/garrote,cycle_targets=1,if=talent.subterfuge.enabled&refreshable&target.time_to_die-remains>2
        if debuff.garrote.count() < getOptionValue("Max Garrotes refresh SS") then
            if talent.subterfuge and cast.able.garrote() and trait.shroudedSuffocation.rank() > 0 then
                for i = 1, #enemies.yards5 do
                    local thisUnit = enemies.yards5[i]
                    if (multidot or (UnitIsUnit(thisUnit,units.dyn5) and not multidot)) then
                                if not debuff.garrote.exists(thisUnit)
                            then    
                                    print(buff.subterfuge.remain())
                                    ssbug = 1
                                    ssbuggytime1=18
                                    ssbuggytime=GetTime()
                                    if cast.garrote(thisUnit) then print("5") return end
                            end
                    end
                end
            end                                                
        end
        
                           if talent.subterfuge and cast.able.garrote() and buff.subterfuge.remain() <= 1.2 and not cd.exsanguinate.exists() and mode.special == 1 then
                        for i = 1, #enemies.yards5 do
                            local thisUnit = enemies.yards5[i]
                            if (multidot or (UnitIsUnit(thisUnit,units.dyn5) and not multidot)) then
                                        if debuff.garrote.remain("target") < 22
                                    then
                                    print(buff.subterfuge.remain())
                                    ssbug = 1
                                    ssbuggytime1=debuff.garrote.remain("target") + 18
                                    ssbuggytime=GetTime()
                                    if cast.garrote("target") then print("1t")                                        
                                      return end
                                    end
                            end
                        end
                    end 
        
                                if talent.subterfuge and cast.able.garrote() and buff.subterfuge.remain() <= 1.2 then
                                    if debuff.garrote.applied("target") <= 1 and debuff.garrote.remain("target") <= 10 --and ttd(thisUnit) - debuff.garrote.remain() > 2
                                        then
                                     print(buff.subterfuge.remain())
                                   ssbug = 1
                                    ssbuggytime1=23.4
                                    ssbuggytime=GetTime()                                
                                    if cast.garrote("target") then print("2t")                                        
                                      return end
                                    end
                                end   

            if talent.subterfuge and cast.able.garrote()  then
                        for i = 1, #enemies.yards5 do
                            local thisUnit = enemies.yards5[i]
                            if (multidot or (UnitIsUnit(thisUnit,units.dyn5) and not multidot)) then
                                        if debuff.garrote.remain(thisUnit) < 5.4
                                    then
                                    print(buff.subterfuge.remain())
                                    ssbug = 1
                                    ssbuggytime1=debuff.garrote.remain(thisUnit) + 18
                                    ssbuggytime=GetTime()
                                    if cast.garrote(thisUnit) then print("1")                                        
                                      return end
                                    end
                            end
                        end
                    end 



            if talent.subterfuge and cast.able.garrote() then
                    for i = 1, #enemies.yards5 do
                        local thisUnit = enemies.yards5[i]
                        if (multidot or (UnitIsUnit(thisUnit,units.dyn5) and not multidot)) then
                                    if debuff.garrote.applied(thisUnit) <= 1 and debuff.garrote.remain(thisUnit) <= 10 --and ttd(thisUnit) - debuff.garrote.remain() > 2
                                then
                                    print(buff.subterfuge.remain())
                                    ssbug = 1
                                    ssbuggytime1=23.4
                                    ssbuggytime=GetTime()                                
                                    if cast.garrote(thisUnit) then print("2")                                        

                                      return end
                            end
                        end
                    end
                end   

            if talent.subterfuge and cast.able.garrote() and trait.shroudedSuffocation.rank() > 0 and buff.subterfuge.remain() <= 0.5 then
                                if ttd("target") > debuff.garrote.remain("target") and debuff.garrote.remain("target") <= 18
                                    then
                                    print(buff.subterfuge.remain())
                                        ssbug = 1
                                    if debuff.garrote.remain("target") <= 5.4 then
                                        ssbuggytime1=debuff.garrote.remain("target") + 18
                                    else
                                        ssbuggytime1=23.4
                                    end
                                    ssbuggytime=GetTime()
                                    if cast.garrote("target") then print("3t")                                        
                                    return end
                                end                
                for i = 1, #enemies.yards5 do
                    local thisUnit = enemies.yards5[i]
                    if (multidot or (UnitIsUnit(thisUnit,units.dyn5) and not multidot)) then
                                if ttd(thisUnit) > debuff.garrote.remain(thisUnit) and debuff.garrote.remain(thisUnit) <= 18
                                    then
                                     print(buff.subterfuge.remain())
                                       ssbug = 1
                                    if debuff.garrote.remain(thisUnit) <= 5.4 then
                                        ssbuggytime1=debuff.garrote.remain(thisUnit) + 18
                                    else
                                        ssbuggytime1=23.4
                                    end
                                    ssbuggytime=GetTime()
                                    if cast.garrote(thisUnit) then print("3")                                        
                                    return end
                                end
                    end
                end
            end               
                    
            if talent.subterfuge and cast.able.garrote() and trait.shroudedSuffocation.rank() > 0 then
                for i = 1, #enemies.yards5 do
                    local thisUnit = enemies.yards5[i]
                    if (multidot or (UnitIsUnit(thisUnit,units.dyn5) and not multidot)) then
                                if not debuff.garrote.exists(thisUnit)
                            then
                                     print(buff.subterfuge.remain())
                                   ssbug = 1
                                    ssbuggytime1=18
                                    ssbuggytime=GetTime()
                                    if cast.garrote(thisUnit) then                                        



                                      return end
                            end
                    end
                end
            end                                

        -- end
        --actions.stealthed+=/rupture,if=talent.subterfuge.enabled&azerite.shrouded_suffocation.enabled&!dot.rupture.ticking
        if talent.subterfuge and cast.able.garrote() and trait.shroudedSuffocation.rank() > 0 then
                        if getDistance() < 5 then
                                if not debuff.rupture.exists()
                            then
                                    if cast.rupture() then return end
                            end
                        end
                  
         end

        -- actions.stealthed+=/garrote,cycle_targets=1,if=talent.subterfuge.enabled&azerite.shrouded_suffocation.enabled&target.time_to_die>remains

        --# Subterfuge + Exsg: Even override a snapshot Garrote right after Rupture before Exsanguination
        --actions.stealthed+=/pool_resource,for_next=1
        --actions.stealthed+=/garrote,if=talent.subterfuge.enabled&talent.exsanguinate.enabled&cooldown.exsanguinate.remains<1&prev_gcd.1.rupture&dot.rupture.remains>5+4*cp_max_spend



        -- if (cast.pool.garrote() or cast.able.garrote()) and talent.subterfuge and talent.exsanguinate and cd.exsanguinate.remain() < 1 and lastCast == spell.rupture and debuff.rupture.remain() > 5 +4 * ComboMaxSpend() then
        --         if cast.pool.garrote() then ChatOverlay("Pooling For garrote exsa") return true end
        --         if cast.able.garrote() then
        --             if cast.garrote() then return true end
        --         end
        -- end


        end        
    -- Action List - Interrupts
        local function actionList_Interrupts()
            if useInterrupts() and not stealth then
                for i = 1, #enemies.yards20 do
                    local thisUnit = enemies.yards20[i]
                    local distance = getDistance(thisUnit)
                    if canInterrupt(thisUnit,getOptionValue("Interrupt At")) and hasThreat(thisUnit) then
                        if distance < 5 then
        -- Kick
                            -- kick
                            if cast.able.kick() and isChecked("Kick") then
                                if cast.kick(thisUnit) then return end
                            end
                            if cd.kick.remain() ~= 0 or not cast.able.kick() then
        -- Gouge
                                
                            end
                         end
                        if cd.kick.remain() ~= 0  or (distance >= 5 and distance < 15) or not cast.able.kick() then
        -- Blind
                            if cast.able.blind() and isChecked("Blind") then
                                if cast.blind(thisUnit) then return end
                            end
                        end
        -- Between the Eyes
                        -- if ((cd.kick.remain() ~= 0 or distance >= 5) and (cd.blind.remain() ~= 0 or level < 38 or distance >= 15)) or not (cast.able.kick() or cast.able.blind()) then
                        --     if cast.able.betweenTheEyes() and isChecked("Between the Eyes") then
                        --         if cast.betweenTheEyes(thisUnit) then return end
                        --     end
                        -- end
                    end
                end
            end -- End Interrupt and No Stealth Check
        end -- End Action List - Interrupts
        local function actionList_Special()


                    if mode.tbex == 1 then
                        if cast.able.toxicBlade() then 
                            if cast.toxicBlade() then return end
                        end
                    end

                    if isChecked("Toxic Blade on cd") and getDistance("target") <= 5  then
                        
                        if not cd.vanish.exists() and debuff.garrote.remain() <= 5.4 and not cd.garrote.exists() and (isBoss("target") or isDummy("target")) then
                            if gcd > 0.2 or power < 40 then return true end
                            if cast.vanish() then return end
                        end

                        if cast.able.toxicBlade() then
                            if cast.toxicBlade() then return end
                        end

                        if not stealthingRogue and debuff.rupture.exists("target") and cast.able.vendetta() and (isBoss("target") or isDummy("target")) then
                            if cast.vendetta() then return end
                        end

                    end


                    if isChecked("Change target in melee") then
                            for i = 1, #enemies.yards5 do
                                local thisUnit = enemies.yards5[i]
                                    if UnitDebuffID(thisUnit,268756) or
                                        ((debuff.garrote.exists(thisUnit) or debuff.rupture.exists(thisUnit)) and not debuff.deadlyPoison.exists(thisUnit))
                                      then
                                        print("refresh poison melee")
                                        local firsttarget = GetObjectWithGUID(UnitGUID("target"))
                                        CastSpellByID(6603,thisUnit)
                                        CastSpellByID(6603,firsttarget)
                                    end
                            end
                    end


            -- if getDistance(units.dyn5) <= 5 then

            --     if not debuff.garrote.exists("target") and comboDeficit >= 2 then
            --         if cast.vanish() then end
            --         if cast.garrote() then return end
            --     end            
            -- --pool for vanish
            -- if cd.vendetta.remain() > 0 and cd.exsanguinate.remain() > 0 and not cd.garrote.exists() and ((debuff.garrote.applied("target") > 1 and debuff.garrote.remain("target") < gcd) or not debuff.garrote.exists("target")) and comboDeficit >= 2 then
            --     if debuff.garrote.remain("target") > 0 then return true end

            -- end





            -- end
            -- if cd.vendetta.remain() > 0 and cd.exsanguinate.remain() > 0 and not cd.garrote.exists() and not debuff.garrote.exists("target") then
            --     if comboDeficit >= 2 and not debuff.garrote.exists() then

            -- end



            -- if stealthingRogue and debuff.garrote.exists() and combo==ComboMaxSpend() and debuff.rupture.refresh() then
            --     if cast.rupture() then return end
            -- end

            -- if stealthingRogue and (cast.last.rupture() or comboDeficit >= 2) then
            --     if cast.garrote() then return end
            -- end
        end
        local function actionList_Open()
            --if (opener == false and time < 1) and (isDummy("target") or isBoss("target")) and (cd.vanish > 0 or not buff.shadowBlades.exists()) then Print("Opener failed due do cds"); opener = true end
            if trait.shroudedSuffocation.rank() > 0 then
                if talent.exsanguinate then
                        if not RUP1 and cast.able.rupture() then
                            if cast.rupture() then RUP1 = true; end
                        elseif RUP1 and not GAR1 and cast.able.garrote() then
                            if cast.garrote() then GAR1 = true
                                    ssbug = 1
                                    ssbuggytime1=23.4
                                    ssbuggytime=GetTime()      
                             end
                        elseif GAR1 and not VEN1 and cast.able.vendetta() then
                            useItem(13)
                            useItem(14)
                            if cast.vendetta() then VEN1 = true; end
                        elseif VEN1 and not MUTI1 and cast.able.mutilate() then
                            if cast.mutilate() then MUTI1 = true; end
                        elseif MUTI1 and not RUP2 and cast.able.rupture() then
                            if cast.rupture() then RUP2 = true; end
                        elseif RUP2 and not EXS1 and cast.able.exsanguinate() then
                            if cast.exsanguinate() then EXS1 = true; end
                            Print("Opener Complete")
                            opener = true
                            toggle("Opener",2)
                            return true
                        end
                    end
                if talent.toxicBlade then
                        if not RUP1 and cast.able.rupture() then
                            if cast.rupture() then RUP1 = true; end
                        elseif RUP1 and not GAR1 and cast.able.garrote() then
                            if cast.garrote() then GAR1 = true
                                    ssbug = 1
                                    ssbuggytime1=23.4
                                    ssbuggytime=GetTime()      
                             end
                        elseif GAR1 and not VEN1 and cast.able.vendetta() then
                            useItem(13)
                            useItem(14)
                            if cast.vendetta() then VEN1 = true; end
                        elseif VEN1 and not MUTI1 and cast.able.toxicBlade() then
                            if cast.toxicBlade() then MUTI1 = true; end
                        elseif MUTI1 and not RUP2 and cast.able.envenom() then
                            if cast.envenom() then RUP2 = true; end
                        elseif RUP2 and not EXS1 and cast.able.mutilate() then
                            if cast.mutilate() then EXS1 = true; end
                            Print("Opener Complete")
                            opener = true
                            toggle("Opener",2)
                            return true
                        end
                end                
            end

            if trait.shroudedSuffocation.rank() <= 0 then
                if talent.exsanguinate then
                        if not RUP1 and cast.able.rupture() then
                            if cast.rupture() then RUP1 = true; end
                        elseif RUP1 and not GAR1 and cast.able.garrote() then
                            if cast.garrote() then GAR1 = true
                             end
                        elseif GAR1 and not VEN1 and cast.able.vendetta() then
                            useItem(13)
                            useItem(14)
                            if cast.vendetta() then VEN1 = true; end
                        elseif VEN1 and not MUTI1 and cast.able.mutilate() then
                            if cast.mutilate() then MUTI1 = true; end
                        elseif MUTI1 and not RUP2 and cast.able.rupture() then
                            if cast.rupture() then RUP2 = true; end
                        elseif RUP2 and not EXS1 and cast.able.exsanguinate() then
                            if cast.exsanguinate() then EXS1 = true; end
                            Print("Opener Complete")
                            opener = true
                            toggle("Opener",2)
                            return true
                        end
                end
                if talent.toxicBlade then
                        if  combo < 4 and not GAR1 and cast.able.mutilate() then
                            if cast.mutilate() then RUP1 = true; end
                        elseif not GAR1 and combo >= 4 and cast.able.rupture() then
                            if cast.rupture() then GAR1 = true; end
                        elseif GAR1 and not VEN1 and cast.able.vendetta() then
                            useItem(13)
                            useItem(14)
                            if cast.vendetta() then VEN1 = true; end
                        elseif VEN1 and not MUTI1 and cast.able.mutilate() then
                            if cast.mutilate() then MUTI1 = true; end
                        elseif MUTI1 and not RUP2 and cast.able.toxicBlade() then
                            if cast.toxicBlade() then RUP2 = true; end
                            Print("Opener Complete")
                            opener = true
                            toggle("Opener",2)
                            return true
                        end
                end                
            end            
            
        end
    -- Action List - Cooldowns
        local function actionList_Cooldowns()
            if getDistance("target") < 5 then
        -- Potion
                -- potion,if=buff.bloodlust.react|target.time_to_die<=60|debuff.vendetta.up&cooldown.vanish.remains<5

        -- Vendetta
                -- vendetta,if=!stealthed.rogue&dot.rupture.ticking&(!talent.subterfuge.enabled|!azerite.shrouded_suffocation.enabled|dot.garrote.pmultiplier>1)
                if mode.special == 1 then
                    
                    if cast.able.exsanguinate() and cast.able.rupture() and combo >= comboMax and debuff.rupture.remain("target") >= 8 then
                        if cast.rupture("target") then return end
                    end

                    if cast.able.exsanguinate() and cast.able.rupture() and combo >= 4 and not debuff.rupture.exists("target") then
                        if cast.rupture("target") then return end
                    end

                    if cast.able.vendetta() and not stealthingRogue and (debuff.rupture.exists("target") or power < 100)
                        and (not talent.subterfuge or trait.shroudedSuffocation.rank() <= 0 or debuff.garrote.applied("target") > 1)
                        and (bleeds >= 5 or power <= 100 or not multidot)
                    then
                        if cast.vendetta("target") then end
                    end

                    if cast.able.exsanguinate() and cd.vanish.remain() >= 10 and debuff.garrote.remain("target") >= 10 and debuff.rupture.remain("target") >= 4 + (3 * comboMax) and debuff.vendetta.exists("target")
                            then
                        if cast.exsanguinate("target") then return end
                    end
                    -- vanish,if=talent.subterfuge.enabled&!dot.garrote.ticking&variable.single_target
                    if cast.able.vanish() and (talent.subterfuge and not debuff.garrote.exists(units.dyn5) and singleTarget) then
                        if gcd >= 0.2 or power <= 40 then return true end
                         print("hz1")
                       if cast.vanish() then
                        if actionList_Stealthed then return end
                       return end
                    end
                    -- vanish,if=talent.exsanguinate.enabled&(talent.nightstalker.enabled|talent.subterfuge.enabled&variable.single_target)&combo_points>=cp_max_spend&cooldown.exsanguinate.remains<1&(!talent.subterfuge.enabled|!azerite.shrouded_suffocation.enabled|dot.garrote.pmultiplier<=1)
                    if cast.able.vanish() and (talent.exsanguinate and (talent.nightstalker or talent.subterfuge and singleTarget) and combo >= comboMax
                        and cd.exsanguinate.remain() < 1 and (not talent.subterfuge or not trait.shroudedSuffocation.active() or debuff.garrote.applied(units.dyn5) <= 1))
                    then
                        if gcd >= 0.2 or power <= 40 then return true end
                        print("hz2")
                        if cast.vanish() then
                        if actionList_Stealthed then return end
                        return end
                    end

                    -- vanish,if=talent.subterfuge.enabled&(!talent.exsanguinate.enabled|!variable.single_target)&!stealthed.rogue&cooldown.garrote.up&dot.garrote.refreshable&(spell_targets.fan_of_knives<=3&combo_points.deficit>=1+spell_targets.fan_of_knives|spell_targets.fan_of_knives>=4&combo_points.deficit>=4)
                    if cast.able.vanish() and (talent.subterfuge and (not talent.exsanguinate or not singleTarget)
                        and not stealthingRogue and not cd.garrote.exists() and (debuff.garrote.remain(units.dyn5) <= 5.4 or debuff.garrote.count() <= getOptionValue("Max Garrotes refresh SS"))
                        and (#enemies.yards10 <= 3 and comboDeficit >= 1 + #enemies.yards10
                        or #enemies.yards10 >= 4 and comboDeficit >= 4)) and (debuff.rupture.count() >= 2 or not multidot)
                    then
                        if gcd >= 0.2 or power <= 90 then return true end
                         print("hz3")
                        if cast.vanish() then
                        if actionList_Stealthed then return end
                        return end
                    end
        -- Toxic Blade
                -- toxic_blade,if=dot.rupture.ticking
                    if cast.able.toxicBlade() and debuff.rupture.exists("target") then
                        if cast.toxicBlade() then return end
                    end

                    if cd.vanish.remain() >= 5 and cd.vendetta.remain() >= 5 and (cd.toxicBlade.remain()>=5 or cd.exsanguinate.remain() >= 5) then
                        toggle("Special",2)
                    end
                end

            end -- End Cooldown Usage Check
        end -- End Action List - Cooldowns
    -- Action List - PreCombat
        local function actionList_PreCombat()
        -- Stealth
            if not inCombat and not stealth and cast.able.stealth() then
                if isChecked("Stealth") and (not IsResting() or isDummy("target")) then
                    if getOptionValue("Stealth") == 1 then
                        if cast.stealth("player") then return end
                    end
                    if #enemies.yards20 > 0 and getOptionValue("Stealth") == 2 and not IsResting() and GetTime()-leftCombat > lootDelay then
                        for i = 1, #enemies.yards20 do
                            local thisUnit = enemies.yards20[i]
                            if UnitIsEnemy(thisUnit,"player") or isDummy("target") then
                                if cast.stealth("player") then return end
                            end
                        end
                    end
                end
            end
        -- Marked for Death
            -- marked_for_death
            if cast.able.markedForDeath() and not inCombat and isChecked("Marked For Death - Precombat") and getDistance("target") < 15 and isValidUnit("target") then
                if cast.markedForDeath("target") then return end
            end
        
        end -- End Action List - PreCombat
    -- Action List - Finishers
        local function actionList_Direct()   
        -- actions.direct=envenom,if=combo_points>=4+talent.deeper_stratagem.enabled&(debuff.vendetta.up|debuff.toxic_blade.up|energy.deficit<=25+variable.energy_regen_combined|spell_targets.fan_of_knives>=2)&(!talent.exsanguinate.enabled|cooldown.exsanguinate.remains>2)

        if cast.able.envenom() and combo >= ComboMaxSpend() - 1  and (debuff.vendetta.exists(units.dyn5) or (debuff.garrote.remain(units.dyn5) < 5.4 and not cd.garrote.exists) or debuff.toxicBlade.exists(units.dyn5) or
         (talent.elaboratePlanning and buff.elaboratePlanning.exists() and buff.elaboratePlanning.remain() <= 0.3) or powerDeficit <= 25 + energyRegenCombined or #enemies.yards10 >= 2)
         and (not talent.exsanguinate or cd.exsanguinate.remain() > 2 or mode.special == 2)
          then
            if cast.envenom() then return end
        end
        --pooling shit

        
       -- actions.direct+=/fan_of_knives,if=variable.use_filler&(buff.hidden_blades.stack>=19|spell_targets.fan_of_knives>=2+stealthed.rogue|buff.the_dreadlords_deceit.stack>=29)
        if usefiller() and cast.able.fanOfKnives() and (#enemies.yards10 >= 2 + (stealthingRogue and 1 or 0) or buff.hiddenBlades.stack() >= 19) then
            if cast.fanOfKnives() then return end
        end

        --muti
        if cast.able.mutilate() and usefiller() then
            if cast.mutilate() then return end
        end

        end -- End Action List - Finishers
    -- Action List - Build
        local function actionList_Dot()
        -- actions.dot=rupture,if=talent.exsanguinate.enabled&((combo_points>=cp_max_spend&cooldown.exsanguinate.remains<1)|(!ticking&(time>10|combo_points>=2)))
        -- if useCDs() and talent.exsanguinate and cast.able.rupture() and ((combo >= ComboMaxSpend() and cd.exsanguinate.remain() <1) or (not debuff.rupture.exists() and (cTime >10 or combo >=2))) then
        --     if cast.rupture() then return end
        -- end

        -- if powerDeficit <= 25 + energyRegenCombined and (cd.garrote.remain() < br.player.gcd or debuff.rupture.remain("target") >=10) and (debuff.garrote.remain("target") <= 5.4 or debuff.garrote.applied("target") > 1) and comboDeficit < 1 then
        --     if cast.envenom() then return end
        -- end


            if (not talent.subterfuge or not (cd.vanish.remain() == 0 and cd.vendetta.remain() <=4) or mode.special == 2) and (ssbug == 0 or debuff.garrote.count() == 0 or not trait.shroudedSuffocation.active()) then
                -- if debuff.garrote.refresh() then
                --     if cast.garrote() then return end
                -- end
                --print("check garrote")
                                            if (debuff.garrote.remain("target") < 5.4  or not debuff.garrote.exists("target")) and UnitHealth("target") >= dotHPLimit
                                                and (debuff.garrote.applied("target") <= 1 or debuff.garrote.remain("target") <= (debuff.garrote.exsang("target") and ExsanguinatedBleedTickTime or BleedTickTime) and EmpoweredDotRefresh())
                                                and not stealthingRogue
                                            --and (not debuff.garrote.exsang(thisUnit) or (debuff.garrote.remain(thisUnit) <= 1.5 and EmpoweredDotRefresh()))
                                            --and (mode.special == 2 or (mode.special == 1 and cd.vanish.exists())) --and (ttd(thisUnit) > ttdval - debuff.garrote.remain(thisUnit) or ttd(thisUnit) > 9999)
                                            then
                                                if comboDeficit >= 1 then
                                                            if cast.pool.garrote() and debuff.garrote.count() <= 1 then return true end
                                                            if cast.able.garrote("target") then
                                                                if cast.garrote("target") then return end
                                                            end
                                                elseif comboDeficit <= 0 and debuff.rupture.remain("target") <= 7.2 and #enemies.yards10 <= 1 then
                                                        if cast.rupture("target") then return end
                                                elseif comboDeficit <= 0 and #enemies.yards10 <= 1 then
                                                        if cast.envenom("target") then return end
                                                end                                                            
                                            end









                            for i = 1, #enemies.yards5 do
                                local thisUnit = enemies.yards5[i]
                                            if (debuff.garrote.remain(thisUnit) < 5.4  or not debuff.garrote.exists(thisUnit)) and UnitHealth(thisUnit) >= dotHPLimit
                                            and (debuff.garrote.applied(thisUnit) <= 1 or debuff.garrote.remain(thisUnit) <= (debuff.garrote.exsang(thisUnit) and ExsanguinatedBleedTickTime or BleedTickTime) and EmpoweredDotRefresh())
                                            --and (not debuff.garrote.exsang(thisUnit) or (debuff.garrote.remain(thisUnit) <= 1.5 and EmpoweredDotRefresh()))
                                            --and (mode.special == 2 or (mode.special == 1 and cd.vanish.exists())) --and (ttd(thisUnit) > ttdval - debuff.garrote.remain(thisUnit) or ttd(thisUnit) > 9999)
                                            then
                                                if comboDeficit >= 1 then
                                                            if cast.pool.garrote() and debuff.garrote.count() <= 1 then return true end
                                                            if cast.able.garrote(thisUnit) then
                                                                if cast.garrote(thisUnit) then return end
                                                            end
                                                elseif comboDeficit <= 0 and debuff.rupture.remain(thisUnit) <= 7.2 and #enemies.yards10 <= 1 then
                                                        if cast.rupture(thisUnit) then return end
                                                elseif comboDeficit <= 0 and #enemies.yards10 <= 1 then
                                                        if cast.envenom("target") then return end
                                                end                                                            
                                            end
                            end

            end        
          
        

        
         -- actions.dot+=/crimson_tempest,if=spell_targets>=2&remains<2+(spell_targets>=5)&combo_points>=4

        if cast.able.crimsonTempest() and combo >=4 and #enemies.yards10 >=2 and debuff.crimsonTempest.remain(units.dyn5) < 2 + (#enemies.yards10 >= 5 and 1 or 0) then
                for i = 1, #enemies.yards5 do
                    local thisUnit = enemies.yards5[i]
                    if (multidot or (UnitIsUnit(thisUnit,units.dyn5) and not multidot)) then
                        if getDistance(thisUnit) < 5 then
                            if cast.crimsonTempest("player") then return true end
                        end
                    end
                end
        end

            if combo >= 4 then
                            if (combo == 4 and debuff.rupture.remain("target") < 6 or combo == 5 and debuff.rupture.remain("target") < 7.2 ) and UnitHealth("target") >= dotHPLimit 
                                and (debuff.rupture.remain("target") <= (debuff.rupture.exsang("target") and ExsanguinatedBleedTickTime or BleedTickTime) and EmpoweredDotRefresh())
                                and (not debuff.rupture.exsang("target") or debuff.rupture.remain("target") <= ExsanguinatedBleedTickTime*2 and EmpoweredDotRefresh()) --and (ttd(thisUnit) > 4 - debuff.rupture.remain(thisUnit) or ttd(thisUnit) > 9999)
                            then
                                if cast.able.rupture() then
                                    if cast.rupture("target") then return true end
                                end
                            end


                for i = 1, #enemies.yards5 do
                    local thisUnit = enemies.yards5[i]
                    if (multidot or (UnitIsUnit(thisUnit,units.dyn5) and not multidot)) then
                            if (combo == 4 and debuff.rupture.remain(thisUnit) < 6 or combo == 5 and debuff.rupture.remain(thisUnit) < 7.2 ) and UnitHealth(thisUnit) >= dotHPLimit 
                            and (debuff.rupture.applied(thisUnit) <= 1 or (debuff.rupture.remain(thisUnit) <= (debuff.rupture.exsang(thisUnit) and ExsanguinatedBleedTickTime or BleedTickTime) and EmpoweredDotRefresh()))
                            and (not debuff.rupture.exsang(thisUnit) or debuff.rupture.remain(thisUnit) <= ExsanguinatedBleedTickTime*2 and EmpoweredDotRefresh()) --and (ttd(thisUnit) > 4 - debuff.rupture.remain(thisUnit) or ttd(thisUnit) > 9999)
                            then
                                if cast.able.rupture() then
                                    if cast.rupture(thisUnit) then return true end
                                end
                            end
                    end
                end
            end
        end -- End Action List - Build
    -- Action List - Opener
        local function actionList_Opener()                    
        -- Opener
            
 
        end
    -- Action List - Stealth
        
---------------------
--- Begin Profile ---
---------------------
    --Profile Stop | Pause
        if not inCombat and not hastar and profileStop==true then
            profileStop = false
        elseif (inCombat and profileStop == true) or (mode.opener == 1 and inCombat and (buff.stealth2.exists() or buff.stealth.exists()))  or pause() or (IsMounted() or IsFlying()) or mode.rotation == 2 then
            return true
        else
            --print(trait.shroudedSuffocation.rank())
            -- print(debuff.garrote.applied("target"))
            --print(debuff.garrote.applied(units.dyn5))
            --print(waitshit())
            -- if ssbuggy ~= nil then
            --     print("___________________")
            --ngs()
            --print(gcd)
            --print(ssbug)
            -- print(ssbuggytime1)
            -- if debuff.rupture.exsang["target"] or debuff.garrote.exsang["target"] then
            --     print("exsanguinated")
            -- end    
            -- print("below rupt")
            -- print(debuff.rupture.exsang("target"))
            -- print("below garrote")
            --print(debuff.rupture.exsang(units.dyn5))
            -- end
            --print(#enemies.yards5)
            --print("target Distance is - "..getDistance("target")..". Current dist is - "..currentDist)
            --print(debuff.rupture.exsang(units.dyn5).."exsang rupt")
            --print(debuff.garrote.exsang(units.dyn5).."exsang garrote")
            -- print(tostring(Evaluate_Garrote_Target("target")).."evaluate")
            -- print(tostring(debuff.rupture.refresh(units.dyn5)).."rupture")
            -- print(energyRegenCombined)
            -- print(debuff.garrote.applied(units.dyn5).." garrote coef")
            -- print(debuff.rupture.applied(units.dyn5).." ruptu coef")
            --print("Garrote calc"..debuff.garrote.calc()..". Rupture calc: "..debuff.rupture.calc()..".Print applied garrote"..debuff.rupture.applied())
            --print(bleeds)
           -- print(debuff.rupture.remain())
            --print(rtbReroll())
            --print(br.player.power.energy.ttm())
            -- if cast.sinisterStrike() then return end
           -- print(getDistance("target"))
            --print(inRange(193315,"target"))
           -- print(IsSpellInRange(193315,"target"))
            --if castSpell("target",193315,true,false,false,true,false,true,false,false) then return end
            --RunMacroText("/cast Коварный удар")
-----------------------
--- Extras Rotation ---
-----------------------
            --if actionList_Extras() then return end
--------------------------
--- Defensive Rotation ---
--------------------------
            --if actionList_Defensive() then return end
------------------------------
--- Out of Combat Rotation ---
------------------------------
            --if actionList_PreCombat() then return end
----------------------------
--- Out of Combat Opener ---
----------------------------
            





            -- if isValidUnit("target") and isChecked("Opener") then
            --     if actionList_Opener() then return end
            -- end
--------------------------------
--- In Combat - Blade Flurry ---
--------------------------------
            -- Blade Flurry
            
--------------------------
--- In Combat Rotation ---
--------------------------
            if inCombat or (isDummy("target") and cast.last.vanish()) then

            if not stealthingRogue and mode.opener == 2   then
                if actionList_Special() then return end
                if mode.Interrupts == 1 then
                    if actionList_Interrupts() then return end
                end
                StartAttack(units.dyn5)
            end                
                --print(garrotecountbuff.."garrote........"..getCombatTime())
                

            if mode.opener == 1 then
                if actionList_Open() then end
                return true
            end        

                if not stealthingRogue and mode.special == 1 and (#enemies.yards5 <= 1 or debuff.crimsonTempest.exists("target") or not talent.crimsonTempest)  then
                    if actionList_Cooldowns() then return end
                end

                if stealthingRogue then
                    if actionList_Stealthed() then return end
                end
                if not stealthingRogue then
------------------------------
--- In Combat - Interrupts ---
------------------------------
                -- for i = 1, #enemies.yards5 do
                --     local thisUnit = enemies.yards5[i]
                --                 if UnitDebuffID(thisUnit,268756)
                --                     then
                --                     if StartAttack(thisUnit) then return end
                --                 end
                -- end

                    
                if actionList_Dot() then return end
                if actionList_Direct() then return end                    
            end

            end -- End In Combat
        end -- End Profile
end -- runRotation
local id = 259
if br.rotations[id] == nil then br.rotations[id] = {} end
tinsert(br.rotations[id],{
    name = rotationName,
    toggles = createToggles,
    options = createOptions,
    run = runRotation,
})
