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
        circleRadius = 0.09,
        lineSize = 0.08,

        characters = {
            [AngelicCharacter.ALEPH] = { width = 1.06, circles = {{0.14, 0.10}, {0.14, 0.89}, {0.91, 0.10}, {0.91, 0.89}}, lines = {{0.23, 0.22, 0.80, 0.77}, {0.23, 0.77, 0.39, 0.55}, {0.82, 0.22, 0.64, 0.45}} },
            [AngelicCharacter.BETH] = { width = 1.06, circles = {{0.14, 0.11}, {0.14, 0.88}, {0.91, 0.88}}, lines = {{0.30, 0.885, 0.75, 0.885}}, curves = {{0.91, 0.71, 0.90, 0.12, 0.31, 0.10}} },
            [AngelicCharacter.CHETH] = { width = 1.06, circles = {{0.135, 0.10}, {0.915, 0.10}}, lines = {{0.30, 0.10, 0.75, 0.10}, {0.14, 0.26, 0.14, 0.97}, {0.91, 0.26, 0.91, 0.97}}},
            [AngelicCharacter.DALETH] = { width = 1.06, circles = {{0.135, 0.10}, {0.915, 0.10}}, lines = {{0.30, 0.10, 0.75, 0.10}, {0.91, 0.26, 0.91, 0.97}}},
            [AngelicCharacter.AIN] = { width = 1.06, circles = {{0.14, 0.11}, {0.93, 0.11}}, lines = {{0.81, 0.23, 0.08, 0.95}, {0.23, 0.21, 0.46, 0.44}} },
            [AngelicCharacter.PE] = { width = 0.65, circles = {{0.335, 0.88}}, curves = {{0.405, 0.73, 0.64, 0.215, 0.59, 0.10, 0.33, 0.065}, {0.33, 0.065, 0.005, 0.055, 0.06, 0.51, 0.20, 0.49}, {0.20, 0.49, 0.295, 0.47, 0.32, 0.38}}}, -- hey screw this one
            [AngelicCharacter.GIMEL] = { width = 0.81, circles = {{0.13, 0.89}, {0.67, 0.10}, {0.67, 0.89}}, lines = {{0.67, 0.25, 0.67, 0.73}, {0.55, 0.50, 0.25, 0.77}}},
            [AngelicCharacter.HE] = { width = 1.06, circles = {{0.135, 0.10}, {0.915, 0.10}}, lines = {{0.30, 0.10, 0.75, 0.10}, {0.52, 0.26, 0.52, 0.97}, {0.91, 0.26, 0.91, 0.97}}},
            [AngelicCharacter.JOD] = { width = 1.04, circles = {{0.52, 0.10}, {0.135, 0.89}, {0.895, 0.89}}, lines = {{0.30, 0.89, 0.74, 0.89}, {0.44, 0.26, 0.21, 0.74}, {0.59, 0.26, 0.82, 0.74}}},
            [AngelicCharacter.CAPH] = { width = 0.81, circles = {{0.14, 0.10}, {0.14, 0.89}}, curves = {{0.30, 0.89, 0.30 + 0.40, 0.495 + 0.40, 0.80, 0.495, 0.30 + 0.40, 0.495 - 0.40, 0.30, 0.10}} },
            [AngelicCharacter.LAMED] = { width = 1.02, circles = {{0.505, 0.10}, {0.123, 0.475}, {0.885, 0.475}}, lines = {{0.39, 0.21, 0.23, 0.37}, {0.29, 0.46, 0.72, 0.46}, {0.775, 0.595, 0.44, 0.94}}},
            [AngelicCharacter.MEM] = { width = 1.06, circles = {{0.14, 0.11}, {0.91, 0.11}}, lines = {{0.23, 0.21, 0.45, 0.43}, {0.80, 0.22, 0.07, 0.94}, {0.91, 0.26, 0.91, 0.96}}},
            [AngelicCharacter.NUN] = { width = 0.60, circles = {{0.15, 0.105}, {0.15, 0.885}}, lines = {{0.28, 0.775, 0.495, 0.565}, {0.28, 0.21, 0.495, 0.43}}},
            [AngelicCharacter.KUFF] = { width = 1.06, circles = {{0.135, 0.105}, {0.92, 0.55}}, lines = {{0.30, 0.105, 0.55, 0.105}, {0.52, 0.21, 0.52, 0.96}, {0.64, 0.25, 0.825, 0.435}}},
            [AngelicCharacter.RESH] = { width = 1.06, circles = {{0.14, 0.11}, {0.91, 0.11}}, lines = {{0.30, 0.11, 0.75, 0.11}, {0.83, 0.28, 0.55, 0.95}}},
            [AngelicCharacter.SAMECH] = { width = 1.06, circles = {{0.13, 0.34}, {0.92, 0.34}}, curves = {{0.13, 0.50, 0.13, 1.09, 0.92, 1.09, 0.92, 0.50}}},
            [AngelicCharacter.SHIN] = { width = 1.06, circles = {{0.13, 0.34}, {0.92, 0.34}, {0.525, 0.34}}, lines = {{0.525, 0.50, 0.525, 0.82}}, curves = {{0.13, 0.50, 0.13, 1.09, 0.92, 1.09, 0.92, 0.50}}},
            [AngelicCharacter.VAU] = { width = 0.29, circles = {{0.14, 0.105}}, lines = {{0.14, 0.26, 0.14, 0.97}}},
            [AngelicCharacter.ZADE] = { width = 1.06, circles = {{0.14, 0.10}, {0.91, 0.10}, {0.91, 0.89}}, lines = {{0.23, 0.22, 0.80, 0.77}, {0.055, 0.895, 0.765, 0.895}, {0.82, 0.22, 0.64, 0.45}}},
            [AngelicCharacter.ZAIN] = { width = 1.06, circles = {{0.13, 0.10}, {0.92, 0.10}, {0.53, 0.89}}, lines = {{0.30, 0.10, 0.75, 0.10}, {0.53, 0.22, 0.53, 0.73}}},
        }
    },
    [CharacterVariant.REPLICANT] = {
        circleMode = "line",
        circleRadius = 0.073,
        lineSize = 0.04,

        characters = {
            [AngelicCharacter.ALEPH] = {width = 1.06, circles = {{0.165, 0.135}, {0.145, 0.865}, {0.915, 0.13}, {0.89, 0.865}}, lines = {{0.22, 0.195, 0.835, 0.81}, {0.465, 0.44, 0.175, 0.79}, {0.87, 0.18, 0.56, 0.54}}},
            [AngelicCharacter.BETH] = {width = 1.06, circles = {{0.17, 0.87}, {0.885, 0.87}, {0.15, 0.135}}, lines = {{0.24, 0.865, 0.81, 0.865}}, curves = {{0.935, 0.80, 1.105, 0.28, 0.705, 0.075, 0.465, 0.07}, {0.465, 0.07, 0.315, 0.075, 0.225, 0.13}}},
            [AngelicCharacter.CHETH] = {width = 1.06, circles = {{0.165, 0.13}, {0.885, 0.13}}, lines = {{0.24, 0.13, 0.81, 0.135}, {0.885, 0.20, 0.885, 0.94}, {0.165, 0.20, 0.165, 0.94}}},
            [AngelicCharacter.DALETH] = {width = 1.06, circles = {{0.165, 0.13}, {0.885, 0.13}}, lines = {{0.24, 0.13, 0.81, 0.135}, {0.885, 0.20, 0.885, 0.94}}},
        }
    }
}

-- config

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