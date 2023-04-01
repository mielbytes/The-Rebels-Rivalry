require("Dependencies")
function love.load()
  Dependencies:load()
end

function love.keypressed(key, scancode, isrepeat)
  Dependencies:keypressed(key, scancode, isrepeat)
end

function love.mousepressed(x, y, button)
  Dependencies:mousepressed(x, y, button)
end

function love.update(dt)
  Dependencies:update(dt)
end

function love.draw()
  Dependencies:draw()
end

function love.resize(width, height)
  menu:resize(width, height)
  options:resize(width, height)
end