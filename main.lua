local char

function love.load()
    local angelic = require("init")

    local font = angelic.new(angelic.FontStyle.AUTOMATA, 25, true)

    local data = font:drawCharacter("aleph")

    data:encode("png", "aleph.png")

    char = love.graphics.newImage(data)
end

function love.update()
    
end

function love.draw()
    love.graphics.setColor(254/255, 236/255, 233/255)
    love.graphics.draw(char, 100, 100)
    --love.graphics.rectangle("line", 100, 100, char:getWidth()+ 2, char:getHeight() + 2)
end