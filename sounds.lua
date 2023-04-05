Sounds = {}

local cooldown -- used the same logic here as in bullets, because otherwise the mute executes so fast you don't even notice it

function Sounds:load()
    cooldown = 0
    self.blip = love.audio.newSource("assets/sounds/blip.wav", "static")
    self.music = love.audio.newSource("assets/sounds/music.mp3", "stream")
    self.dead = love.audio.newSource("assets/sounds/dead.mp3", "stream")
    self.isMuted = false
end

function Sounds:update(dt)
    cooldown = math.max(cooldown - dt,0)
    if love.keyboard.isDown("m") and cooldown == 0 then
        cooldown = 0.25
        if self.isMuted == false then
            self.isMuted = true
        else
            self.isMuted = false
        end
    end

    if self.isMuted == true then
        love.audio.pause(self.music)
    else
        self.music:play()
        self.music:setVolume(0.3)
        self.music:setLooping(true)
    end
end