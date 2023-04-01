options = {}


function options:load()
  optionsbackButton = {
    w = 300,
    h = 100,
    clicked = true,
  }

  fullscreenButton = {
    w = 500,
    h = 60,
  } 

  musicSliderInfo = {
    w = 60,
    h = 400
  }

  sfxSliderInfo = {
    w = 60,
    h = 400
  }
  options:updateButtonPositions()
end

function options:updateButtonPositions()
  optionsbackButton.x = 20
  optionsbackButton.y = love.graphics.getHeight() - 110

  musicSliderInfo.x = (love.graphics.getWidth() / 2) - (musicSliderInfo.w / 2)
  musicSliderInfo.y = (love.graphics.getHeight() / 2) - (musicSliderInfo.h / 2)

  sfxSliderInfo.x = (love.graphics.getWidth() / 2) - (sfxSliderInfo.w / 2)
  sfxSliderInfo.y = (love.graphics.getHeight() / 2) - (sfxSliderInfo.h / 5)

  fullscreenButton.x = (love.graphics.getWidth() / 2) - (fullscreenButton.w / 2) - 25
  fullscreenButton.y = (love.graphics.getHeight() / 2) - (fullscreenButton.h / 10) + 60

  musicSlider = newSlider(musicSliderInfo.x, musicSliderInfo.y, musicSliderInfo.h, 0.8, 0, 1, function (v)
    menubackground:setVolume(v) end, { width = musicSliderInfo.w, orientation = "horizontal", track = "roundrect", knob = "circle" })

  sfxSlider = newSlider(sfxSliderInfo.x, sfxSliderInfo.y, sfxSliderInfo.h, 0.8, 0, 1, function (v)
    click:setVolume(v) end, { width = sfxSliderInfo.w, orientation = "horizontal", track = "roundrect", knob = "circle" })
end


function options:update(dt)
  musicSlider:update()
  sfxSlider:update()
end

function options:keypressed(key, scancode, isrepeat)
  
end

function toggleFullscreen()
  local isFullscreen = love.window.getFullscreen()
  love.window.setFullscreen(not isFullscreen)
  love.resize()
end

function options:mousepressed(x, y, button)
  if button == 1 and x >= optionsbackButton.x and x <= optionsbackButton.x + optionsbackButton.w and y >= optionsbackButton.y and y <= optionsbackButton.y + optionsbackButton.h and not optionsbackButton.clicked then
    love.audio.stop(click)
    love.audio.play(click)
    playButton.clicked = false
    optionsButton.clicked = false
    controlsButton.clicked = false
    optionsbackButton.clicked = true
    quitButton.clicked = false
    controlsbackButton.clicked = true
    gameState = "menu"
  end

  if button == 1 and x >= fullscreenButton.x and x <= fullscreenButton.x + fullscreenButton.w and y >= fullscreenButton.y and y <= fullscreenButton.y + fullscreenButton.h and gameState == "optionsmenu" or gameState == "optionssettings" then
    love.audio.stop(click)
    love.audio.play(click)
    toggleFullscreen()
  end
end

function draw_options()
  -- DRAW MUSIC SLIDER
  love.graphics.setFont(fonts.big)
  local textY = musicSliderInfo.y - 60 - love.graphics.getFont():getHeight() / 2
  love.graphics.printf("MUSIC", 0, textY, love.graphics.getWidth() - 40, "center")
  musicSlider:draw()
  -- END DRAW MUSIC SLIDER

  -- DRAW SFX SLIDER
  love.graphics.setFont(fonts.big)
  textY = sfxSliderInfo.y - 60 - love.graphics.getFont():getHeight() / 2
  love.graphics.printf("SOUND EFFECTS", 0, textY, love.graphics.getWidth() - 40, "center")
  sfxSlider:draw()
  -- END DRAW SFX SLIDER

  -- DRAW FULLSCREEN BUTTON
  if isHovering(fullscreenButton.x, fullscreenButton.y, fullscreenButton.w, fullscreenButton.h) and not fullscreenButton.clicked then
    love.graphics.setColor(63 / 255, 63 / 255, 63 / 255)
  else
    love.graphics.setColor(90 / 255, 90 / 255, 90 / 255)
  end
  love.graphics.rectangle("fill", fullscreenButton.x, fullscreenButton.y, fullscreenButton.w, fullscreenButton.h,
  buttonRadius)
  love.graphics.setFont(fonts.big)
  love.graphics.setColor(0, 0, 0)
  love.graphics.printf("FULLSCREEN", fullscreenButton.x,
  fullscreenButton.y + fullscreenButton.h / 2 - love.graphics.getFont():getHeight() / 2, fullscreenButton.w, "center")
  love.graphics.setColor(0, 0, 0)
  love.graphics.setLineWidth(3)
  love.graphics.rectangle("line", fullscreenButton.x, fullscreenButton.y, fullscreenButton.w, fullscreenButton.h,
  buttonRadius)
  -- END DRAW FULLSCREEN BUTTON

  -- DRAW OPTIONSBACK BUTTON
  if isHovering(optionsbackButton.x, optionsbackButton.y, optionsbackButton.w, optionsbackButton.h) and not optionsbackButton.clicked then
    love.graphics.setColor(63 / 255, 63 / 255, 63 / 255)
  else
    love.graphics.setColor(90 / 255, 90 / 255, 90 / 255)
  end
  love.graphics.rectangle("fill", optionsbackButton.x, optionsbackButton.y, optionsbackButton.w, optionsbackButton.h,
  buttonRadius)
  love.graphics.setFont(fonts.big)
  love.graphics.setColor(0, 0, 0)
  love.graphics.printf("BACK", optionsbackButton.x,
  optionsbackButton.y + optionsbackButton.h / 2 - love.graphics.getFont():getHeight() / 2, optionsbackButton.w, "center")
  love.graphics.setColor(0, 0, 0)
  love.graphics.setLineWidth(3)
  love.graphics.rectangle("line", optionsbackButton.x, optionsbackButton.y, optionsbackButton.w, optionsbackButton.h,
  buttonRadius)
  -- END DRAW OPTIONSBACK BUTTON
end

function options:draw()
  if gameState == "optionsmenu" then
    draw_options()
  end
end

function options:resize(width, height)
  options:updateButtonPositions()
end

return options