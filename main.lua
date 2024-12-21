local font, fontR

function love.load()
    local angelic = require("init")

    local angelAuto = angelic.new(angelic.FontStyle.AUTOMATA, 30)
    local angelRein = angelic.new(angelic.FontStyle.REPLICANT, 30)

    font = angelAuto:getFont()
    fontR = angelRein:getFont()
end

function love.update()
    
end

function love.draw()

    love.graphics.setFont(love.graphics.newFont())
    love.graphics.print("Automata", 50, 30)
    love.graphics.print("Replicant", 250, 30)
    love.graphics.print("Lorem ipsum dolor sit amet", 50, 220)
    love.graphics.print("LoremIpsumDolorSitAmet", 50, 300)

    love.graphics.setColor(254/255, 236/255, 233/255)
    love.graphics.setFont(font)
    love.graphics.print("ABCDE\nFGHIJ\nKLMNO\nPQRST\nUVWXYZ", 50, 50)

    love.graphics.print("Lorem ipsum dolor sit amet", 50, 250)
    love.graphics.print("LoremIpsumDolorSitAmet", 50, 320)

    love.graphics.setFont(fontR)
    love.graphics.print("abcde\nfghij\nklmno\npqrst\nuvwxyz", 250, 50)

    love.graphics.print("Lorem ipsum dolor sit amet", 50, 400)
    love.graphics.print("LoremIpsumDolorSitAmet", 50, 470)
end