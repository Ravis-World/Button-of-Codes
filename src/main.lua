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

local function pauseSeconds(sec)
    if os.getenv("OS") == "Windows_NT" then
        local success = os.execute("timeout /t " .. sec .. " >NUL 2>&1")
        if not success then
            os.execute("ping -n " .. (sec + 1) .. " 127.0.0.1 >NUL 2>&1")
        end
    else
        os.execute("sleep " .. sec)
    end
end

local function triggerFakeCrash()
    clearScreen()
    print("==================================================")
    print("FATAL EXCEPTION: SANITY DEPLETED TO 0%")
    print("MODULE BUTTON_OF_CODES.EXE TERMINATED AT 0x0028:C001")
    print("==================================================\n")
    
    pauseSeconds(1)
    print(" -> Shadow entity consumed Ward 4B console.")
    pauseSeconds(1)
    print(" -> Terminating process in 3 seconds...")
    pauseSeconds(1)
    print(" -> 2...")
    pauseSeconds(1)
    print(" -> 1...")
    pauseSeconds(1)
    
    clearScreen()
    os.exit()
end

local function showMenu()
    clearScreen()
    print("==========================================")
    print("       BUTTON OF CODES (ROGUELIKE)        ")
    print("==========================================")
    print("[ NO SAVES | PERMADEATH | MINIGAME GAUNTLET ]\n")
    print("1. Begin Night Shift Gauntlet")
    print("2. Quit Terminal\n")
    io.write("Select action (1-2): ")
    
    local choice = io.read()
    if choice == "1" then
        engine:resetGame()
        gameState = "intro"
    elseif choice == "2" then
        os.exit()
    end
end

local function showIntro()
    clearScreen()
    print("[ ARCHIVE LOG ]")
    print("--------------------------------------------------")
    print("You wake up with a sharp gasp.")
    print("Cold sweat drips from your chin onto the cold metal desk.")
    print("It is 3:14 AM in Ward 4B.\n")
    pauseSeconds(5)
    
    print("Out in the hallway, an ancient, featureless Shadow looms.")
    print("It feeds on fear and human error.")
    print("Your fingers hover over the red emergency button.\n")
    pauseSeconds(5)
    
    print("The intercom whispers: 'Conquer all 19 emergency minigames in order,")
    print(" starting with Code Lavender, or succumb to the darkness.'\n")
    print("1. Press Emergency Button to launch Minigame Sequence")
    print("2. Submit to darkness (Surrender)\n")
    io.write("Choose your fate (1-2): ")
    
    local choice = io.read()
    if choice == "1" then
        print("\nSirens chime! Starting Rank 1: Code Lavender Minigame...")
        pauseSeconds(1)
        gameState = "gauntlet"
    else
        triggerFakeCrash()
    end
end

-- Specific Minigame Execution Router
local function runCodeMinigame(code)
    clearScreen()
    print("--------------------------------------------------")
    print("NIGHT SHIFT " .. engine.currentShift .. " | SANITY: " .. engine.sanity .. "% | PROGRESS: " .. engine.alertsSolved .. "/19")
    print("PROTOCOL RANK " .. code.rank .. ": " .. string.upper(code.name))
    print("--------------------------------------------------\n")
    
    -- MINIGAME 1: Code Lavender (Calm / Breathing Input)
    if code.rank == 1 then
        print("ALERT: Panic spiking in Ward 4B! Execute emotional de-escalation protocol.")
        print("Type '[CALM]' to stabilise the patient's breathing before the shadow notices.\n")
        io.write("Enter command: ")
        local input = io.read()
        return input == "[CALM]" or input == "CALM" or input == "calm"
    
    -- MINIGAME 2: Code Orange (Hazmat neutralisation Code)
    elseif code.rank == 2 then
        print("ALERT: Hazardous spill reported! Enter chemical sealant code.")
        print("Required key combination: **-!!!-##\n** = atomic number of the metal Iridium\n!!! = 1 of Hungary and 2 of Azerbaijan\n## = 3 squared times 11\n")
        io.write("Enter neutralisation code: ")
        local input = io.read()
        return input == "77-HAZ-99"
    
    -- MINIGAME 3: Code Green (Elopement Lock Sequence)
    elseif code.rank == 3 then
        print("ALERT: Patient elopement detected! Lock your ward doors.")
        print("Type 'LOCK ' followed by your ward number (A1, 2B, 3C, etc.)\n")
        io.write("Enter command: ")
        local input = io.read()
        return string.upper(input) == "LOCK 4B"
    
    -- MINIGAME 4: Code Adam (Missing Child Search - Age 5-10)
    elseif code.rank == 4 then
        print("ALERT: CODE ADAM - MISSING CHILD DISPATCH")
        print("LOG DETAILS: 'Young child last seen near Ped-Wing. Features: Blonde hair, Blue eyes.'")
        print("Security monitor feeds show 3 individuals heading for the exit:\n")
        print("  1. Klaes Dorsey: Red hair, Green eyes")
        print("  2. Ascanius Alvarado: Blonde hair, Blue eyes")
        print("  3. Tatianna Zuiderduin: Brown hair, Blue eyes\n")
        io.write("Call out the correct suspect to intercept (1-3 or A/B/C): ")
        local input = string.upper(io.read())
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
        local input = string.upper(io.read())
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
        local input = string.upper(io.read())
        return input == "3" or input == "C"
    
    -- DEFAULT MINIGAME HANDLER FOR OTHER RANKS (Reaction Command)
    else
        local targetWord = string.upper(code.name)
        print("EMERGENCY PROTOCOL: " .. code.desc)
        print("Type '" .. targetWord .. "' to resolve this code immediately!\n")
        io.write("Enter protocol response: ")
        local input = io.read()
        return string.upper(input) == targetWord
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
                pauseSeconds(1)
            elseif result == "SHIFT_COMPLETE" then
                print("\n[SHIFT SURVIVED] Reached Night Shift " .. engine.currentShift .. "!")
                pauseSeconds(2)
            elseif result == "GAUNTLET_VICTORY" then
                clearScreen()
                print("==================================================")
                print("     GAUNTLET CONQUERED - ALL CLEAR PROTOCOL      ")
                print("==================================================")
                print("You successfully beat all 19 code minigames in order!")
                print("The shadow vanishes into the morning sun.")
                print("You survived the night.\n")
                pauseSeconds(4)
                gameState = "menu"
                break
            end
        else
            local result = engine:failMinigame()
            print("\n[MINIGAME FAILED] Wrong input! Sanity depleted to " .. engine.sanity .. "%")
            pauseSeconds(2)
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
