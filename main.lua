local font

function love.load()
    local angelic = require("init")

    local angel = angelic.new(angelic.FontStyle.AUTOMATA, 100, true)

    font = angel:getFont()
end

function love.update()
    
end

function love.draw()
    love.graphics.setColor(254/255, 236/255, 233/255)
    love.graphics.setFont(font)
    love.graphics.printf("ABCDEFGHIJKLMNOPQRSTUVWXYZ", 100, 100, 500)
end