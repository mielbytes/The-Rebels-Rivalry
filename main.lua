function love.load()
  require("objects.enemy")
  require("objects.player")
  enemy.load()
  player.load()
end

function love.keypressed(key, scancode, isrepeat)
  enemy.keypressed(key, scancode, isrepeat)
  player.keypressed(key, scancode, isrepeat)
end

function love.mousepressed(x, y, button)
  enemy.mousepressed(x, y, button)
  player.mousepressed(x, y, button)
end

function love.update(dt)
  enemy.update(dt)
  player.update(dt)
end

function love.draw()
  enemy.draw()
  player.draw()
end