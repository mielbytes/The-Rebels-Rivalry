sfx = {}

function sfx.load()
  -- AUDIO
  click = love.audio.newSource("assets/audio/click.wav", "static")

  menubackground = love.audio.newSource("assets/audio/menubackground.mp3", "stream")
end

return sfx