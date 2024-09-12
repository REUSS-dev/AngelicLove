-- angelic
local angelic = {}



-- documentation

---@alias prototypeCircle {[1]: number, [2]: number}
---@alias prototypeCurve number[]
---@alias prototypeLine {[1]: number, [2]: number, [3]: number, [4]: number}

---@alias CharacterTemplate {width: number, circles: prototypeCircle[]?, curves: prototypeCurve[][]?, lines: prototypeLine[]?}
---@alias CharacterSet {circleMode: love.DrawMode, circleRadius: number, lineSize: number, characters: table<AngelicCharacter, CharacterTemplate>}

-- consts

---@enum CharacterVariant
local CharacterVariant = {
    REPLICANT = "replicant",
    AUTOMATA = "automata"
}

---@enum AngelicCharacter
local AngelicCharacter = {
    ALEPH = "aleph",
    BETH = "beth",
    CHETH = "cheth",
    DALETH = "daleth",
    AIN = "ain",
    PE = "pe",
    GIMEL = "gimel",
    HE = "he",
    JOD = "jod",
    CAPH = "caph",
    LAMED = "lamed",
    MEM = "mem",
    NUN = "nun",
    KUFF = "kuff",
    RESH = "resh",
    SAMECH = "samech",
    SHIN = "shin",
    TAU = "tau",
    THETH = "theth",
    VAU = "vau",
    ZADE = "zade",
    ZAIN = "zain",
    RECT = "rectangle"
}

---@enum FontStyle
local FontStyle = {
    REPLICANT = "replicant",
    AUTOMATA = "automata",
    REINCARNATION = "rein"
}

---@enum FontVariant
local FontVariant = {
    [FontStyle.REPLICANT] = {
        ["a"] = AngelicCharacter.ALEPH,
        ["b"] = AngelicCharacter.BETH,
        ["c"] = AngelicCharacter.CHETH,
        ["d"] = AngelicCharacter.DALETH,
        ["e"] = AngelicCharacter.HE,
        ["f"] = AngelicCharacter.ZADE,
        ["g"] = AngelicCharacter.GIMEL,
        ["h"] = AngelicCharacter.HE,
        ["i"] = AngelicCharacter.JOD,
        ["j"] = AngelicCharacter.JOD,
        ["k"] = AngelicCharacter.CAPH,
        ["l"] = AngelicCharacter.LAMED,
        ["m"] = AngelicCharacter.MEM,
        ["n"] = AngelicCharacter.NUN,
        ["o"] = AngelicCharacter.AIN,
        ["p"] = AngelicCharacter.PE,
        ["q"] = AngelicCharacter.KUFF,
        ["r"] = AngelicCharacter.RESH,
        ["s"] = {AngelicCharacter.SAMECH, AngelicCharacter.SHIN},
        ["t"] = {AngelicCharacter.ZAIN, AngelicCharacter.THETH},
        ["u"] = AngelicCharacter.VAU,
        ["v"] = AngelicCharacter.VAU,
        ["w"] = {AngelicCharacter.RECT, AngelicCharacter.VAU},
        ["x"] = AngelicCharacter.SHIN,
        ["y"] = AngelicCharacter.JOD,
        ["z"] = AngelicCharacter.ZADE,
    },
    [FontStyle.AUTOMATA] = {
        ["a"] = AngelicCharacter.ALEPH,
        ["b"] = AngelicCharacter.BETH,
        ["c"] = AngelicCharacter.CHETH,
        ["d"] = AngelicCharacter.DALETH,
        ["e"] = AngelicCharacter.HE,
        ["f"] = AngelicCharacter.ZADE,
        ["g"] = AngelicCharacter.GIMEL,
        ["h"] = AngelicCharacter.HE,
        ["i"] = AngelicCharacter.JOD,
        ["j"] = AngelicCharacter.JOD,
        ["k"] = AngelicCharacter.CAPH,
        ["l"] = AngelicCharacter.LAMED,
        ["m"] = AngelicCharacter.MEM,
        ["n"] = AngelicCharacter.NUN,
        ["o"] = AngelicCharacter.AIN,
        ["p"] = AngelicCharacter.PE,
        ["q"] = AngelicCharacter.KUFF,
        ["r"] = AngelicCharacter.RESH,
        ["s"] = AngelicCharacter.SAMECH,
        ["t"] = AngelicCharacter.ZAIN,
        ["u"] = AngelicCharacter.VAU,
        ["v"] = AngelicCharacter.VAU,
        ["w"] = AngelicCharacter.VAU,
        ["x"] = AngelicCharacter.SHIN,
        ["y"] = AngelicCharacter.JOD,
        ["z"] = AngelicCharacter.ZADE,
    },
    [FontStyle.REINCARNATION] = {
        ["a"] = AngelicCharacter.ALEPH,
        ["b"] = AngelicCharacter.BETH,
        ["c"] = AngelicCharacter.CHETH,
        ["d"] = AngelicCharacter.DALETH,
        ["e"] = AngelicCharacter.KUFF,
        ["f"] = AngelicCharacter.ZADE,
        ["g"] = AngelicCharacter.GIMEL,
        ["h"] = AngelicCharacter.HE,
        ["i"] = AngelicCharacter.JOD,
        ["j"] = AngelicCharacter.JOD,
        ["k"] = AngelicCharacter.CAPH,
        ["l"] = AngelicCharacter.LAMED,
        ["m"] = AngelicCharacter.MEM,
        ["n"] = AngelicCharacter.NUN,
        ["o"] = AngelicCharacter.AIN,
        ["p"] = AngelicCharacter.PE,
        ["q"] = AngelicCharacter.KUFF,
        ["r"] = AngelicCharacter.RESH,
        ["s"] = AngelicCharacter.SAMECH,
        ["t"] = AngelicCharacter.ZAIN,
        ["u"] = AngelicCharacter.VAU,
        ["v"] = AngelicCharacter.VAU,
        ["w"] = AngelicCharacter.SHIN,
        ["x"] = AngelicCharacter.SHIN,
        ["y"] = AngelicCharacter.JOD,
        ["z"] = AngelicCharacter.ZADE,
    }
}

---@type table<CharacterVariant, CharacterSet>
local CharacterSets = {
    [CharacterVariant.AUTOMATA] = {
        circleMode = "fill",
        circleRadius = 0.09,
        lineSize = 0.08,

        characters = {
            [AngelicCharacter.ALEPH] = { width = 1.06, circles = {{0.14, 0.10}, {0.14, 0.89}, {0.91, 0.10}, {0.91, 0.89}}, lines = {{0.23, 0.22, 0.80, 0.77}, {0.23, 0.77, 0.39, 0.55}, {0.82, 0.22, 0.64, 0.45}} }
        }
    }
}

-- config

local beizer_depth = 5
local msaa_samples = 6

-- vars



-- init



-- fnc



-- classes

---@class AngelicFont
---@field characterSet CharacterSet Designated character set
---@field size integer Size multiplier for characters
---@field same boolean If true, capital letters will use same characters as lower-case; otherwise will use alternative variants for capital letters
local AngelicFont = {}
local AngelicFont_meta = {__index = AngelicFont}

---Create canvas for character and draw it into it
---@param character AngelicCharacter
---@return love.ImageData
----@private
function AngelicFont:drawCharacter(character)
    local template = self.characterSet.characters[character]

    local canvas = love.graphics.newCanvas(math.floor(template.width * self.size), self.size, {msaa = msaa_samples})

    love.graphics.push("all")
    love.graphics.setCanvas(canvas)
    love.graphics.setLineWidth(self.characterSet.lineSize)
    love.graphics.scale(self.size)
    --love.graphics.setBlendMode("smooth")
    local circleStyle = self.characterSet.circleMode
    local circleRadius = self.characterSet.circleRadius

    for _, circle in ipairs(template.circles or {}) do
        love.graphics.circle(circleStyle, circle[1], circle[2], circleRadius)
    end

    for _, curve in ipairs(template.curves or {}) do
        love.graphics.line(love.math.newBezierCurve(curve):render(beizer_depth))
    end

    for _, line in ipairs(template.lines or {}) do
        love.graphics.line(line)
    end

    love.graphics.pop()

    return canvas:newImageData()
end

-- angelic fnc

---Create new AngelicFont object
---@param variant FontStyle
---@param size integer TO BE CHANGED TO PT UNITS
---@param noVariance boolean
---@return AngelicFont
function angelic.new(variant, size, noVariance)
    local obj = {
        characterSet = CharacterSets[variant],
        size = size,
        same = noVariance
    }

    setmetatable(obj, AngelicFont_meta) ---@cast obj AngelicFont

    return obj
end

angelic.CharacterVariant = CharacterVariant -- expose character variant enum for access
angelic.AngelicCharacter = AngelicCharacter -- expose Angelic character names enum for access
angelic.FontStyle = FontStyle -- expose font style names enum for access

return angelic