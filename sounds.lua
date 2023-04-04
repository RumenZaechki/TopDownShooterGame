Sounds = {}

function Sounds:load()
    Sounds.blip = love.audio.newSource("assets/sounds/blip.wav", "static")
    Sounds.music = love.audio.newSource("assets/sounds/music.mp3", "stream")
    Sounds.dead = love.audio.newSource("assets/sounds/dead.mp3", "stream")


    Sounds.music:play()
    Sounds.music:setVolume(0.3)
    Sounds.music:setLooping(true)
end

function Sounds:update()
    if love.keyboard.isDown("m") then
        Sounds.music:stop()
    end
end