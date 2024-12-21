# AngelicLove
AngelicLove - is a set of vectorized self-constructing Angelic language image-fonts for Love2D.  
This project is inspired by NieR game series by Yoko Taro (at Square Enix) and mimics font variants presented in the games.  
You do not need to download anything external or store any files excpet the module itself for this library to work. All fonts are drawn and generated internally.

![image](https://github.com/user-attachments/assets/8b85bc53-b6be-41d5-b9e6-4850d524e809)

# Installation
* Download latest angeliclove.lua from releases and put it in your require path.
  
OR
* submodule branch [angeliclove](https://github.com/REUSS-dev/AngelicLove/tree/angeliclove) of this repository into your project

# Usage
```lua
-- Import AngelicLove via require as you usually do for modules
local angelic = require("angeliclove")

-- Create new AngelicFont object via `new` call from angeliclove lib
local angelAuto = angelic.new(angelic.FontStyle.AUTOMATA, 30)

-- Retrieve font from AngelicFont object and use it for your needs.
local afont = angelAuto:getFont()

function love.draw()
  love.graphics.setFont(afont)
  love.graphics.print("Hello world!", 100, 100)
end
```
![image](https://github.com/user-attachments/assets/571eca0b-5747-4a43-98ab-732138079a63)  
You can also use `afont = angelic.new(angelic.FontStyle.AUTOMATA, 30):getFont()` to create LOVE2D font in one line, if you do not plan to make changes to it.\
\
`AngelicFont:getFont()` can also be safely called repeatedly.  
This allows to reflect changes you do to Angelic font elsewhere.
```lua
function love.draw()
  love.graphics.setFont(angelAuto:getFont())
  love.graphics.print("Hello world!", 100, 100)
end

-- Makes font smaller when "F" key is pressed.
function love.keypressed(key)
  if key == "f" then
    angelAuto:setSize(20)
  end
end
```
# Documentation
### angelic.new(FontStyle|StylePreset style, number size, boolean noVariance): AngelicFont
Create new AngelicFont object
* `FontStyle|StylePreset style` - Font style of your newly created Angelic font. Can be either entry from FontStyle enum or self-defined style preset table (format below).
* `number size` - Height of a character for a new Angelic font (in pixels)
* `boolean noVariance` - When true, disables upper-case/lower-case variance for font styles that support it.

A self-defined `StylePreset` can be created and used to create your own "unicode character to angelic character" correspondance map for your Angelic font.  
**Format of self-defined StylePreset table**
```lua
local stylePreset = {
  name = "myPreset", -- string
  characterVariant = angelic.CharacterVariant.Automata, -- CharacterVariant
  characters = { -- table<unicode_character, AngelicCharacter|{AngelicCharacter, AngelicCharacter}> Unicode to Angelic character map.
    -- Unicode character can be mapped to one Angelic character (both lower-case and upper-case variations of this unicode character will be mapped to this Angelic character)
    ["a"] = angelic.AngelicCharacter.ALEPH
    -- Or it can be mapped to two Angelic characters. Lower-case variant will use the first element of the table, upper-case variant will use second element of the table. If noVariance is enabled for this Angelic font, upper-case will also use first element of the table as its Angelic character.
    ["b"] = { angelic.AngelicCharacter.BETH, AngelicCharacter.VAU }

    -- All Angelic character names are exposed through enum angelic.AngelicCharacter
  }
}
```
### enum **FontStyle**
Names of pre-defined style presets of Angelic alphabet variations used in NieR series games.  
*Exposed via angelic.FontStyle*
* FontStyle.REPLICANT = `"replicant"`
* FontStyle.AUTOMATA = `"automata"`
* FontStyle.REINCARNATION = `"rein"`

### enum **CharacterVariant**
Names of Angelic character graphics variant.
*Exposed via angelic.CharacterVariant*
* CharacterVariant.AUTOMATA = `"automata"` - Robotic style, used in NieR:Automata and ReiN
* CharacterVariant.REPLICANT = `"replicant"` - Runic style, used in NieR:Replicant

### enum **AngelicCharacter**
Names of Angelic characters used to identify them.
*Exposed via angelic.AngelicCharacter*
* ALEPH = `"aleph"`
* BETH = `"beth"`
* CHETH = `"cheth"`
* DALETH = `"daleth"`
* AIN = `"ain"`
* PE = `"pe"`
* GIMEL = `"gimel"`
* HE = `"he"`
* JOD = `"jod"`
* CAPH = `"caph"`
* LAMED = `"lamed"`
* MEM = `"mem"`
* NUN = `"nun"`
* KUFF = `"kuff"`
* RESH = `"resh"`
* SAMECH = `"samech"`
* SHIN = `"shin"`
* TAU = `"tau"`
* THETH = `"theth"`
* VAU = `"vau"`
* ZADE = `"zade"`
* ZAIN = `"zain"`
* RECT = `"rectangle"`

## class AngelicFont

### AngelicFont:getFont(): loveFont
Get love.Font object of this Angelic font to be used in drawing operations.

### AngelicFont:setSize(number size)
Set new size for this Angelic font.
* `number size` - Height of a character (in pixels)

### AngelicFont:setStyle(FontStyle|StylePreset style)
Set new style for this Angelic font.
* `FontStyle|StylePreset style` - Font style of this Angelic font. Can be either entry from FontStyle enum or self-defined style preset table (format explained above).

### AngelicFont:setNoVariance(boolean noVariance)
Update noVariance parameter for this Angelic font.
* `boolean noVariance` - When true, disables upper-case/lower-case variance for font styles that support it.
