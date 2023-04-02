function set_color(r,g,b,a)
  love.graphics.setColor(r,g,b,a)

end

function round(number) -- typing math.floor is annoying
  return math.floor(number)
end

function updateButtonPositions()
  local gap = 20

  playButton.x = love.graphics.getWidth() / 2 - playButton.w / 2
  playButton.y = (love.graphics.getHeight() / 2) - (1.5 * playButton.h) - gap

  optionsButton.x = love.graphics.getWidth() / 2 - optionsButton.w / 2
  optionsButton.y = (love.graphics.getHeight() / 2) - optionsButton.h / 2

  controlsButton.x = love.graphics.getWidth() / 2 - controlsButton.w / 2
  controlsButton.y = (love.graphics.getHeight() / 2) + (0.9 * controlsButton.h) - gap

  quitButton.x = love.graphics.getWidth() / 2 - quitButton.w / 2
  quitButton.y = (love.graphics.getHeight() / 2) + (2.1 * quitButton.h) - gap
end

function player_mouse_angle()
  local mouseX, mouseY = love.mouse.getX(), love.mouse.getY()
  return math.atan2(player.y - mouseY, player.x - mouseX) + math.pi
end

function GenerateWalls()
  if gameMap.layers['Wall'] then
    for i, v in pairs(gameMap.layers['Wall'].objects) do
      local wall = world:newRectangleCollider(v.x, v.y, v.width, v.height)
      wall:setType("static")
      wall:setCollisionClass("Wall")
      table.insert(colliders, wall)
    end
  end
end

function GenerateDoors()
  if gameMap.layers['Door'] then
    for i, v in pairs(gameMap.layers['Door'].objects) do
      local door = world:newRectangleCollider(v.x, v.y, v.width, v.height)
      door:setType("static")
      door:setCollisionClass("Door")
      table.insert(colliders, door)
    end
  end
end

function SpawnEnemies()
  if gameMap.layers['EnemySpawn'] then
    for i, v in pairs(gameMap.layers['EnemySpawn'].objects) do
      table.insert(enemies, enemy(v.x, v.y, v.name))
    end
  end
end