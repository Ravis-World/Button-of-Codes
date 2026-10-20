-- ============================================================================
-- BUTTON OF CODES - MINIGAME PROGRESSION ENGINE
-- File: ./src/shift_manager.lua
-- ============================================================================

local codesModule = require("hospital_codes")

local ShiftManager = {}
ShiftManager.__index = ShiftManager

function ShiftManager.new()
    local self = setmetatable({}, ShiftManager)
    self:resetGame()
    return self
end

function ShiftManager:resetGame()
    self.sanity = 100
    self.currentShift = 1
    self.alertsSolved = 0
    self.currentCodeRank = 1 -- Starts at Code Lavender (Rank 1)
    self.isAlive = true
end

function ShiftManager:getCurrentCode()
    return codesModule[self.currentCodeRank]
end

function ShiftManager:passMinigame()
    self.alertsSolved = self.alertsSolved + 1
    
    if self.currentCodeRank >= #codesModule then
        return "GAUNTLET_VICTORY"
    end

    self.currentCodeRank = self.currentCodeRank + 1

    if (self.currentCodeRank - 1) % 5 == 0 then
        self.currentShift = self.currentShift + 1
        return "SHIFT_COMPLETE"
    end

    return "SUCCESS"
end

function ShiftManager:failMinigame()
    self.sanity = self.sanity - 25
    if self.sanity <= 0 then
        self.sanity = 0
        self.isAlive = false
        return "PERMADEATH"
    end
    return "FAILURE"
end

return ShiftManager