
Debug = {}
Debug.debug = true

function Debug:load()
  buttonClicks = {playButton, optionsButton, controlsButton, quitButton, optionsbackButton, controlsbackButton}
end

function Debug:draw()
  if Debug.debug then
    for _, button in ipairs(buttonClicks) do
      if not button.clicked then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("line", button.x, button.y, button.w, button.h)
      end
    end
  end
end

function Debug:update(dt)
  buttonClicks = {playButton, optionsButton, controlsButton, quitButton, optionsbackButton, controlsbackButton}
end

return Debug