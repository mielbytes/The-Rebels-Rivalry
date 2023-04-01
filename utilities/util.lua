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