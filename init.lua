-- angelic
local angelic = {}



-- documentation

---@alias prototypeCircle {[1]: number, [2]: number}
---@alias prototypeCurve number[]
---@alias prototypeLine {[1]: number, [2]: number, [3]: number, [4]: number}

---@alias CharacterTemplate {width: number, circles: prototypeCircle[]?, curves: prototypeCurve[]?, lines: prototypeLine[]?}
---@alias CharacterSet {circleMode: love.DrawMode, circleRadius: number, lineSize: number, characters: table<AngelicCharacter, CharacterTemplate>}
---@alias StylePreset {characterVariant: CharacterVariant, characters: table<string, AngelicCharacter|AngelicCharacter[]>}

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

---@type table<FontStyle, StylePreset>
local FontStylesPresets = {
    [FontStyle.REPLICANT] = {
        characterVariant = CharacterVariant.REPLICANT,

        characters = {
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
        }
    },
    [FontStyle.AUTOMATA] = {
        characterVariant = CharacterVariant.AUTOMATA,

        characters = {
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
            ["z"] = AngelicCharacter.ZADE
        }
    },
    [FontStyle.REINCARNATION] = {
        characterVariant = CharacterVariant.AUTOMATA,

        characters = {
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
            ["z"] = AngelicCharacter.ZADE
        }
    }
}

---@type table<CharacterVariant, CharacterSet>
local CharacterSets = {
    [CharacterVariant.AUTOMATA] = {
        circleMode = "fill",
        circleRadius = 0.11,
        lineSize = 0.08,

        characters = {
            [AngelicCharacter.ALEPH] = { width = 1.06, circles = {{0.14, 0.10}, {0.14, 0.89}, {0.91, 0.10}, {0.91, 0.89}}, lines = {{0.23, 0.22, 0.80, 0.77}, {0.23, 0.77, 0.39, 0.55}, {0.82, 0.22, 0.64, 0.45}} },
        }
    }
}

-- config

local default_character_variant = CharacterVariant.AUTOMATA

local beizer_depth = 5
local msaa_samples = 6

local space_width = 15

-- vars



-- init



-- fnc

local function pixelFill()
    return 255, 0, 0, 1
end

-- classes

---@class AngelicFont
---@field styleName FontStyle
---@field style StylePreset
---@field characterSet CharacterSet Designated character set
---@field size integer Size multiplier for characters
---@field same boolean If true, capital letters will use same characters as lower-case; otherwise will use alternative variants for capital letters
---@field spaceWidth integer
---@field cacheDrawnCharacters table<AngelicCharacter, love.ImageData>?
---@field cacheImageFont love.Font
---@field separator love.ImageData? ImageFont separator ImageData object. Must be reset after resizing
local AngelicFont = {}
local AngelicFont_meta = {__index = AngelicFont}

---Create canvas for character and draw it into it
---@param character AngelicCharacter
---@return love.ImageData
---@private
function AngelicFont:drawCharacter(character)
    local template = self.characterSet.characters[character]

    local canvas = love.graphics.newCanvas(math.floor(template.width * self.size), self.size, {msaa = msaa_samples})

    love.graphics.push("all")
    love.graphics.setCanvas(canvas)
    love.graphics.setLineWidth(self.characterSet.lineSize)
    love.graphics.scale(self.size)
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

function AngelicFont:generateSeparator()
    local separator = love.image.newImageData(1, self.size)
    separator:mapPixel(pixelFill, 0, 0, 1, self.size)

    self.separator = separator
end

function AngelicFont:generateCharacters()
    self.cacheDrawnCharacters = {}

    for anChar, _ in pairs(self.characterSet.characters) do
        self.cacheDrawnCharacters[anChar] = self:drawCharacter(anChar)
    end
end

---Create new ImageFont from AngelicFont data
function AngelicFont:generateFont()
    local glyphs = " "
    local images = {}
    local totalWidth = self.spaceWidth

    if not self.separator then
        self:generateSeparator()
    end

    if not self.cacheDrawnCharacters then
        self:generateCharacters()
    end

    for character, mappedAngelic in pairs(self.style.characters) do
        local lower, capital
        if type(mappedAngelic) == "string" then
            lower, capital = mappedAngelic, mappedAngelic
        else
            lower, capital = mappedAngelic[1], not self.same and mappedAngelic[2] or mappedAngelic[1]
        end

        local drawnLower = self.cacheDrawnCharacters[lower]
        if drawnLower then
            glyphs = glyphs .. character
            images[#images+1] = drawnLower
            totalWidth = totalWidth + drawnLower:getWidth()
        end

        local drawnCapital = self.cacheDrawnCharacters[capital]
        if drawnCapital then
            glyphs = glyphs .. character:upper()
            images[#images+1] = drawnCapital
            totalWidth = totalWidth + drawnCapital:getWidth()
        end
    end

    local imagefontData = love.image.newImageData(totalWidth + 2 * (#images + 1), self.size)
    local x = 0

    -- Include space
    imagefontData:paste(self.separator, 0, 0, 0, 0, 1, self.size)
    imagefontData:paste(self.separator, self.spaceWidth + 1, 0, 0, 0, 1, self.size)
    x = x + self.spaceWidth + 2

    for _, data in ipairs(images) do
        local dataWidth = data:getWidth()

        imagefontData:paste(self.separator, x, 0, 0, 0, 1, self.size)
        imagefontData:paste(data, x + 1, 0, 0, 0, dataWidth, self.size)
        imagefontData:paste(self.separator, x + dataWidth + 1, 0, 0, 0, 1, self.size)
        x = x + dataWidth + 2
    end

    self.cacheImageFont = love.graphics.newImageFont(imagefontData, glyphs)
end

---Get cached font or create new ImageFont if font wasn't created before or configuration changed
function AngelicFont:getFont()
    if not self.cacheImageFont then
        self:generateFont()
    end

    return self.cacheImageFont
end

-- angelic fnc

---Create new AngelicFont object
---@param style FontStyle
---@param size integer TO BE CHANGED TO PT UNITS
---@param noVariance boolean?
---@return AngelicFont
function angelic.new(style, size, noVariance)
    local obj = {
        styleName = style,
        style = FontStylesPresets[style],
        characterSet = CharacterSets[FontStylesPresets[style].characterVariant],
        size = size,
        spaceWidth = space_width,
        same = noVariance,
    }

    setmetatable(obj, AngelicFont_meta) ---@cast obj AngelicFont

    obj:generateSeparator()
    obj:generateCharacters()
    obj:generateFont()

    return obj
end

angelic.CharacterVariant = CharacterVariant -- expose character variant enum for access
angelic.AngelicCharacter = AngelicCharacter -- expose Angelic character names enum for access
angelic.FontStyle = FontStyle -- expose font style names enum for access

return angelic