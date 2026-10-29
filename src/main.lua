-- STREAMING_CHUNK:Configuring module environment and system variables...
-- ============================================================================
-- BUTTON OF CODES - ROGUELIKE MINIGAME GAUNTLET HORROR ENGINE
-- File: ./src/main.lua
-- ============================================================================

package.path = package.path .. ";./src/?.lua;./?.lua;src/?.lua"

local ShiftManager = require("shift_manager")
local engine = ShiftManager.new()

local gameState = "menu" -- "menu", "intro", "gauntlet"

local function clearScreen()
    if os.getenv("OS") == "Windows_NT" then
        os.execute("cls")
    else
        os.execute("clear")
    end
end

-- Safely capture and handle io.read() output without discarding return values
local function pauseEnter(message)
    local prompt = message or "Press [ENTER] to continue..."
    io.write("\n" .. prompt .. " ")
    local dummyValue = io.read()
    return dummyValue or ""
end

local function triggerFakeCrash()
    clearScreen()
    print("==================================================")
    print("FATAL EXCEPTION: ALERTNESS DEPLETED TO 0%")
    print("MODULE BUTTON_OF_CODES.EXE TERMINATED AT 0x0028:C001")
    print("==================================================\n")
    
    print(" -> The Carver consumed Ward 4B console.")
    print(" -> Process terminated.")
    
    pauseEnter("Press [ENTER] to exit terminal...")
    clearScreen()
    os.exit()
end

local function showMenu()
    clearScreen()
    print("==========================================")
    print("   BUTTON OF CODES: THANKSGIVING HORROR   ")
    print("==========================================")
    print("[ STANDALONE TERMINAL MODE ]")
    print("[ MINIGAME GAUNTLET ]\n")
    print("1. Begin Thanksgiving Night Shift")
    print("2. Quit Terminal\n")
    io.write("Select action (1-2): ")
    
    local choice = io.read() or ""
    if choice == "1" then
        engine:resetGame()
        gameState = "intro"
    elseif choice == "2" then
        os.exit()
    end
end

local function showIntro()
    clearScreen()
    print("[ ARCHIVE LOG - THANKSGIVING NIGHT ]")
    print("--------------------------------------------------")
    print("You wake up with a sharp gasp.")
    print("Cold, leftover turkey sits wrapped in foil on your desk.")
    print("It is 3:14 AM on Thanksgiving Night in Ward 4B.\n")
    pauseEnter("Press [ENTER] to check the hallway...")
    
    print("\nOut in the hallway, an ancient, featureless entity looms—The Carver.")
    print("It feeds on tryptophan drowsiness, fear, and human error.")
    print("Your fingers hover over the glowing red emergency button.\n")
    pauseEnter("Press [ENTER] to listen to the intercom...")
    
    print("\nThe intercom whispers: 'Conquer all 19 holiday emergency minigames in order,")
    print(" starting with Code Lavender, or become part of the feast.'\n")
    print("1. Press Emergency Button to launch Minigame Sequence")
    print("2. Submit to the Carver (Surrender)\n")
    io.write("Choose your fate (1-2): ")
    
    local choice = io.read() or ""
    if choice == "1" then
        print("\nSirens chime! Starting Rank 1: Code Lavender Minigame...")
        pauseEnter("Press [ENTER] to begin minigame gauntlet...")
        gameState = "gauntlet"
    else
        triggerFakeCrash()
    end
end

-- Specific Minigame Execution Router
local function runCodeMinigame(code)
    clearScreen()
    print("--------------------------------------------------")
    print("NIGHT SHIFT " .. engine.currentShift .. " | ALERTNESS: " .. engine.sanity .. "% | PROGRESS: " .. engine.alertsSolved .. "/19")
    print("PROTOCOL RANK " .. code.rank .. ": " .. string.upper(code.name))
    print("--------------------------------------------------\n")

    -- MINIGAME 1: Code Lavender (Calm / Breathing Input)
    if code.rank == 1 then
        print("ALERT: Panic spiking in Ward 4B! Execute emotional de-escalation protocol.")
        print("Type '[CALM]' to stabilise the patient's breathing before the entity notices.\n")
        io.write("Enter command: ")
        local rawInput = io.read() or ""
        local input = string.upper(rawInput)
        return input == "[CALM]" or input == "CALM"

    -- MINIGAME 2: Code Orange (Toxic Gravy / Chemical Decontamination)
    elseif code.rank == 2 then
        print("ALERT: Toxic gravy vat rupture in the cafeteria corridor!")
        print("Enter chemical sealant ratio code to neutralise the boiling broth.")
        print("Required key combination: **-!!!-##\n** = atomic number of the metal Iridium\n!!! = 1 of Hungary and 2 of Azerbaijan\n## = 3 squared times 11\n")
        io.write("Enter neutralisation code: ")
        local rawInput = io.read() or ""
        local input = string.upper(rawInput)
        return input == "77-HAZ-99"

    -- MINIGAME 3: Code Green (Elopement Lock Sequence)
    elseif code.rank == 3 then
        print("ALERT: Patient elopement detected! Lock your ward doors.")
        print("Type 'LOCK ' followed by your ward number (A1, 2B, 3C, etc.)\n")
        io.write("Enter command: ")
        local rawInput = io.read() or ""
        local input = string.upper(rawInput)
        return input == "LOCK 4B"

    -- MINIGAME 4: Code Adam (Missing Child Search - Age 5-10)
    elseif code.rank == 4 then
        print("ALERT: CODE ADAM - MISSING CHILD DISPATCH")
        print("LOG DETAILS: 'Young child last seen near Ped-Wing. Features: Blonde hair, Blue eyes.'")
        print("Security monitor feeds show 3 individuals heading for the exit:\n")
        print("  1. Klaes Dorsey: Red hair, Green eyes")
        print("  2. Ascanius Alvarado: Blonde hair, Blue eyes")
        print("  3. Tatianna Zuiderduin: Brown hair, Blue eyes\n")
        io.write("Call out the correct suspect to intercept (1-3 or A/B/C): ")
        local rawInput = io.read() or ""
        local input = string.upper(rawInput)
        return input == "2" or input == "B"

    -- MINIGAME 5: Code Purple (Older Child Abduction - Age 11-17)
    elseif code.rank == 5 then
        print("ALERT: CODE PURPLE - OLDER CHILD ABDUCTION")
        print("LOG DETAILS: 'Pre-teen forced into stairwell. Features: Black hair, Hazel eyes.'")
        print("Security monitor feeds show 3 individuals moving through the basement:\n")
        print("  1. Henriette Levi: Black hair, Hazel eyes")
        print("  2. Bogdan Aiken: Black hair, Brown eyes")
        print("  3. Rozalia Berkovich: Auburn hair, Hazel eyes\n")
        io.write("Call out the correct suspect to intercept (1-3 or A/B/C): ")
        local rawInput = io.read() or ""
        local input = string.upper(rawInput)
        return input == "1" or input == "A"

    -- MINIGAME 6: Code Pink (Infant Abduction Interception)
    elseif code.rank == 6 then
        print("ALERT: CODE PINK - INFANT ABDUCTION INTERCEPTION")
        print("LOG DETAILS: 'Infant nursery tag triggered. Suspect carrying bundle. Features: Brown hair, Grey eyes.'")
        print("Security monitor feeds show 3 figures near the main lobby doors:\n")
        print("  1. Boryana Alberghini: Blonde hair, Grey eyes")
        print("  2. Donte Garbo: Brown hair, Blue eyes")
        print("  3. Fatima Chaudhary: Brown hair, Grey eyes\n")
        io.write("Call out the correct suspect to intercept (1-3 or A/B/C): ")
        local rawInput = io.read() or ""
        local input = string.upper(rawInput)
        return input == "3" or input == "C"

    -- MINIGAME 7: Code Grey (Combative Person De-escalation)
    elseif code.rank == 7 then
        print("ALERT: CODE GREY - COMBATIVE PATIENT IN DINING HALL")
        print("A ravenous dinner guest brandishing a carving fork is confronting security.")
        print("Select the correct non-violent verbal de-escalation command:\n")
        print("  1. AGGRESSIVE: 'Drop the utensil or we will use physical restraints immediately!'")
        print("  2. PACIFYING:  'I hear you're frustrated; step back, lower the fork, and let us talk.'")
        print("  3. DISMISSIVE: 'Go sit back down at table 4, dinner service is closed.'\n")
        io.write("Choose de-escalation response (1-3): ")
        local rawInput = io.read() or ""
        return rawInput == "2"

    -- MINIGAME 8: Code White (Pediatric Medical Emergency Dosage)
    elseif code.rank == 8 then
        print("ALERT: CODE WHITE - PEDIATRIC MEDICAL EMERGENCY")
        print("A 10kg toddler swallowed a raw turkey bone and needs immediate epinephrine.")
        print("Pediatric rule: 0.01 mg/kg ratio required.")
        print("Calculate exact dosage required in milligrams (mg):\n")
        io.write("Enter exact dosage (#.##): ")
        local rawInput = io.read() or ""
        return rawInput == "0.10" or rawInput == "0.1" or rawInput == ".1"

    -- MINIGAME 9: Code Stroke (Vascular Clot FAST Sequence)
    elseif code.rank == 9 then
        print("ALERT: CODE STROKE - VASCULAR CLOT ASSESSMENT")
        print("Patient presents acute neurological failure following dinner.")
        print("Identify the correct medical acronym sequence for stroke recognition:\n")
        print("  1. F.A.S.T. (Face drooping, Arm weakness, Speech difficulty, Time to call)")
        print("  2. S.T.O.P. (Slurred speech, Tremor, Ocular impairment, Pulse drop)")
        print("  3. C.L.O.T. (Cerebral lag, One-sided weakness, Oxygen dip, Time lost)\n")
        io.write("Select correct protocol (1-3): ")
        local rawInput = io.read() or ""
        local input = string.upper(rawInput)
        return input == "1" or input == "FAST" or input == "F.A.S.T."

    -- MINIGAME 10: Code STEMI (Heart Attack Door-to-Balloon Window)
    elseif code.rank == 10 then
        print("ALERT: CODE STEMI - GRAVY-INDUCED CORONARY OCCLUSION")
        print("ECG confirms ST-elevation myocardial infarction after heavy holiday feast.")
        print("Medical Guideline: Maximum door-to-balloon PCI target window standard.")
        print("Select target response time limit:\n")
        print("  1. 30 Minutes")
        print("  2. 90 Minutes")
        print("  3. 180 Minutes\n")
        io.write("Select target time window (1-3): ")
        local rawInput = io.read() or ""
        local input = string.upper(rawInput)
        return input == "2" or input == "90" or input == "90 MINS" or input == "90 MINUTES"

    -- MINIGAME 11: Rapid Response (Deteriorating Vital Sign Triage)
    elseif code.rank == 11 then
        print("ALERT: RAPID RESPONSE - TRYPTOPHAN VITAL COLLAPSE")
        print("Patient telemetry feed shows declining status:")
        print("  - Respiratory Rate: 6 breaths/min (CRITICAL DROOP)")
        print("  - Oxygen Saturation (SpO2): 84%")
        print("  - Heart Rate: 110 bpm\n")
        print("Select immediate interventions:\n")
        print("  1. Administer oxygen mask & call clinician for respiratory depression")
        print("  2. Offer warm pumpkin pie and leave patient to sleep off tryptophan")
        print("  3. Administer high-dose sedative to quiet noisy monitor alarms\n")
        io.write("Choose action (1-3): ")
        local rawInput = io.read() or ""
        return rawInput == "1"

    -- MINIGAME 12: Condition H (Family Panic Escalation)
    elseif code.rank == 12 then
        print("ALERT: CONDITION H - FAMILY DINNER PANIC RESPONSE")
        print("Visiting family member triggered emergency hotline due to unresponsiveness.")
        print("What is the mandatory clinical step upon receiving a Condition H call?\n")
        print("  1. Transfer call to billing department")
        print("  2. Dispatch dedicated rapid clinical team to bed immediately")
        print("  3. Inform family visiting hours end at 8 PM\n")
        io.write("Choose action (1-3): ")
        local rawInput = io.read() or ""
        return rawInput == "2"

    -- MINIGAME 13: Code Blue (CPR Resuscitation Sequence)
    elseif code.rank == 13 then
        print("ALERT: CODE BLUE - CARDIAC ARREST RESUSCITATION")
        print("Patient in Ward 4B has no pulse! Initiate manual CPR sequence.")
        print("Standard adult CPR compression-to-ventilation ratio target required.")
        print("Type exact ratio format (15:2, 30:2, or 50:5):\n")
        io.write("Enter CPR ratio: ")
        local rawInput = io.read() or ""
        local input = string.upper(rawInput)
        return input == "30:2" or input == "30/2" or input == "30-2"

    -- MINIGAME 14: Code Triage (Turkey Fryer Mass Casualty Sorting)
    elseif code.rank == 14 then
        print("ALERT: CODE TRIAGE - TURKEY FRYER EXPLOSION VICTIMS")
        print("3 patients arrive simultaneously from a suburban kitchen mishap:")
        print("  Patient A: Severe airway burns & active wheezing (STRIDOR)")
        print("  Patient B: Minor wrist sprain from slipping on gravy")
        print("  Patient C: Superficial 1st degree burn on thumb\n")
        io.write("Identify RED TAG (Immediate Priority) patient (A/B/C or 1-3): ")
        local rawInput = io.read() or ""
        local input = string.upper(rawInput)
        return input == "A" or input == "1" or input == "PATIENT A"

    -- MINIGAME 15: Code Red (Kitchen Oven Inferno - 3-Step Containment)
    elseif code.rank == 15 then
        print("ALERT: CODE RED - KITCHEN OVEN INFERNO OVERRIDE")
        print("Flames are breaching the main galley doors! Execute RACE protocol sequence.\n")
        print("Step 1/3: Identify first action in FIRE EMERGENCY (R.A.C.E.):")
        print("  1. Extinguish flames immediately")
        print("  2. Rescue anyone in immediate danger")
        print("  3. Contain smoke by opening all windows\n")
        io.write("Step 1 Selection (1-3): ")
        local s1 = io.read() or ""
        if s1 ~= "2" then return false end

        print("\nStep 2/3: Fire type is Grease/Oil (Class B). Select extinguisher type:")
        print("  1. Water (APW)")
        print("  2. CO2 / Dry Chemical")
        print("  3. Wet Chemical (Class K) / Foam\n")
        io.write("Step 2 Selection (1-3): ")
        local s2 = io.read() or ""
        if s2 ~= "2" and s2 ~= "3" then return false end

        print("\nStep 3/3: Blast doors require manual pressure release sequence.")
        print("Type exact override key: '****-!!!!-##'\n**** =  Marine mammals who have 34 extant species\n!!!! = One of the four benders in Avatar\n## = Your ward number")
        io.write("Enter blast key: ")
        local s3 = string.upper(io.read() or "")
        return s3 == "SEAL-FIRE-4B"

    -- MINIGAME 16: Code Yellow (Pressure Cooker Threat - 3-Step Bomb Defusal)
    elseif code.rank == 16 then
        print("ALERT: CODE YELLOW - EXPLOSIVE PRESSURE COOKER THREAT")
        print("An over-pressurised experimental cooker in the galley is near critical threshold!\n")
        print("Step 1/3: What is the primary initial protocol for an unverified threat device?")
        print("  1. Attempt to move the vessel outside")
        print("  2. Evacuate area immediately and do NOT touch device")
        print("  3. Douse device with cold tap water\n")
        io.write("Step 1 Selection (1-3): ")
        local s1 = io.read() or ""
        if s1 ~= "2" then return false end

        print("\nStep 2/3: Calculate emergency valve vent threshold.")
        print("Current Gauge: 280 PSI. Safe Maximum: 100 PSI. Vent ratio = 280 / 4.")
        io.write("Enter Vent Target PSI (integer): ")
        local s2 = io.read() or ""
        if s2 ~= "70" then return false end

        print("\nStep 3/3: Terminal requires security perimeter radius confirmation.")
        print("Minimum standoff clearance distance required for small explosive threat (in feet):")
        print("  1. 50 feet")
        print("  2. 300 feet")
        print("  3. 1000 feet\n")
        io.write("Step 3 Selection (1-3 or #### feet): ")
        local s3 = io.read() or ""
        return s3 == "2" or s3 == "300" or s3 == "300 FEET"

    -- MINIGAME 17: Code Black (Conflicting Notification Sorting - 3-Step Triage)
    elseif code.rank == 17 then
        print("ALERT: CODE BLACK - SYSTEMIC CONFLICTING NOTIFICATIONS")
        print("The console is flooding with chaotic, conflicting threat broadcasts!\n")
        print("Step 1/3: Threat Log Analysis:")
        print("  Feed A: 'Severe weather advisory - High winds'")
        print("  Feed B: 'Active bomb threat called in to main desk'")
        print("  Feed C: 'Cafeteria ice machine low on water'\n")
        io.write("Identify CODE BLACK priority feed (A/B/C): ")
        local s1 = string.upper(io.read() or "")
        if s1 ~= "B" and s1 ~= "FEED B" and s1 ~= "2" then return false end

        print("\nStep 2/3: Protocol verification.")
        print("During a verified phone bomb threat, what critical detail MUST be recorded?")
        print("  1. Caller ID / Voice characteristics & exact threat wording")
        print("  2. The caller's favourite holiday dish")
        print("  3. The Wi-Fi network latency\n")
        io.write("Step 2 Selection (1-3): ")
        local s2 = io.read() or ""
        if s2 ~= "1" then return false end

        print("\nStep 3/3: Clear system pipeline chaos.")
        print("Type verification code '*******-!!!' to flush false alerts:\n******* = 1 of Denmark, 2 of Israel, 2 of Pakistan, 1 of Turkey, and 2 of China\n!!! = Short for acknowledgement")
        io.write("Enter clearance code: ")
        local s3 = string.upper(io.read() or "")
        return s3 == "DISPATCH-ACK"

    -- MINIGAME 18: Code Silver (Active Shooter Stealth Survival - 3-Step Protocol)
    elseif code.rank == 18 then
        print("ALERT: CODE SILVER - ACTIVE SHOOTER IN WARD 4B")
        print("Footsteps echo near the nurse station! The Carver's proxy has entered.\n")
        print("Step 1/3: Identify national standard active threat survival priority hierarchy:")
        print("  1. RUN, HIDE, FIGHT")
        print("  2. FIGHT, RUN, HIDE")
        print("  3. HIDE, NEGOTIATE, RUN\n")
        io.write("Step 1 Selection (1-3): ")
        local s1 = io.read() or ""
        if s1 ~= "1" then return false end

        print("\nStep 2/3: You choose to HIDE in the breakroom.")
        print("Which actions MUST be taken immediately? (Select all correct steps):")
        print("  1. Turn off lights, lock/barricade door, silence phone")
        print("  2. Keep phone on speaker to monitor security feeds")
        print("  3. Peek through window glass periodically\n")
        io.write("Step 2 Selection (1-3): ")
        local s2 = io.read() or ""
        if s2 ~= "1" then return false end

        print("\nStep 3/3: Law enforcement tactical team breaches Ward 4B.")
        print("How should you position your hands when confronting responding police?")
        print("  1. Reaching inside coat for ID card")
        print("  2. Empty hands raised high with fingers spread, visible at all times")
        print("  3. Pointing frantically toward the suspect's direction\n")
        io.write("Step 3 Selection (1-3): ")
        local s3 = io.read() or ""
        return s3 == "2"

    -- DEFAULT MINIGAME HANDLER FOR OTHER RANKS (Reaction Command)
    else
        local targetWord = string.upper(code.name)
        print("EMERGENCY PROTOCOL: " .. code.desc)
        print("Type '" .. targetWord .. "' to resolve this code immediately!\n")
        io.write("Enter protocol response: ")
        local rawInput = io.read() or ""
        local input = string.upper(rawInput)
        return input == targetWord
    end
end

local function runGauntlet()
    while engine.isAlive do
        local currentCode = engine:getCurrentCode()
        local success = runCodeMinigame(currentCode)
        
        if success then
            local result = engine:passMinigame()
            if result == "SUCCESS" then
                print("\n[MINIGAME CLEARED] " .. currentCode.name .. " resolved! Next protocol escalating...")
                pauseEnter()
            elseif result == "SHIFT_COMPLETE" then
                print("\n[SHIFT SURVIVED] Reached Night Shift " .. engine.currentShift .. "!")
                pauseEnter()
            elseif result == "GAUNTLET_VICTORY" then
                clearScreen()
                print("==================================================")
                print("     GAUNTLET CONQUERED - ALL CLEAR PROTOCOL      ")
                print("==================================================")
                print("You successfully beat all 19 code minigames in order!")
                print("The police rescue you from your eternal nightmare.")
                print("You survived the holiday night shift.\n")
                pauseEnter("Press [ENTER] to return to main menu...")
                gameState = "menu"
                break
            end
        else
            local result = engine:failMinigame()
            print("\n[MINIGAME FAILED] Wrong input! Alertness depleted to " .. engine.sanity .. "%")
            pauseEnter()
            if result == "PERMADEATH" then
                triggerFakeCrash()
                break
            end
        end
    end
end

while true do
    if gameState == "menu" then
        showMenu()
    elseif gameState == "intro" then
        showIntro()
    elseif gameState == "gauntlet" then
        runGauntlet()
    end
end