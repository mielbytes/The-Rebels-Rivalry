player = {}
local states = {
    IDLE = 1,
    MOVING = 2
}

local px, py
local state
local input_vector = {0,0}
local function is_action_pressed(key)
    if love.keyboard.isDown(key) then
        return true
    end
end

local function get_action_strength(key) 
    if is_action_pressed(key) then
        state = states['MOVING']
        if key == "a" then
            return {-1,0}
        end
        if key == "s" then
            return {0,1}
        end
        if key == "d" then
            return {1,0}
        end
        if key == "w" then
            return {0,-1}
        end
    else
        state = states['IDLE']
        return {0,0}
    end
end




function player:load()
    self.x = 640
    self.y = 360
    self.width = 64
    self.height = 128

    --Player Values--
    self.speed = 250
    self.dir = 1 --direction
    self.health = 100
    self.stamina = 100
    state = states['IDLE']
    --Player Hitbox--
    self.hitbox = world:newBSGRectangleCollider(self.x, self.y, self.width, self.height, 15)
    self.hitbox:setType("dynamic")
    self.hitbox:setFixedRotation(true)
    self.hitbox:setRestitution(0)
    self.hitbox:setCollisionClass("Player")
    --Player Hitbox--

    --Player Animations--
    self.img = love.graphics.newImage("assets/images/player.png")
    self.img:setFilter("nearest")
    self.grid = anim8.newGrid(16, 16, self.img:getWidth(), self.img:getHeight())
    self.animations = {}
    self.animations.idle_front = anim8.newAnimation(self.grid("1-1", 1), 0.5)
    self.animations.idle_side = anim8.newAnimation(self.grid("2-2", 1), 0.5)
    self.animations.idle_back = anim8.newAnimation(self.grid("3-3", 1), 0.5)
    self.animations.side_walk = anim8.newAnimation(self.grid("1-2", 2), 0.2)
    self.animations.up_walk = anim8.newAnimation(self.grid("1-4", 3), 0.2)
    self.animations.down_walk = anim8.newAnimation(self.grid("1-4", 4), 0.2)
    self.anim = self.animations.idle_side
    --Player Animations--
    self.hitbox:setObject(self)
end



function player:update(dt)
    self.state = state
    px, py = self.hitbox:getLinearVelocity()
    self.x, self.y = self.hitbox:getX(), self.hitbox:getY()
    self:movement()
    self.anim:update(dt)
    self:shoot(dt)
    self:run(dt)
end

function player:draw()
    self:gun()
    self:animate()
    self:idle()
end


function player:keyreleased(key)
    if state == states['MOVING'] then
        if key == "w" then
            self.anim = self.animations.idle_back
        elseif key == "s" then
            self.anim = self.animations.idle_front
        elseif key == "a" or key == "d" then
            self.anim = self.animations.idle_side
        end
    end
end

function player:keypressed(key, scancode, isrepeat)
    if key == "w" or key == "d" or key == "s" or key == "a" then
        if state == states['IDLE'] then
            self.anim:gotoFrame(1)
        end
    end
    if key == "escape" then
        if gameState == "playing" then
            gameState = "settings"
        end
         
    end
    if key == "escape" then
        if gameState == "settings" then
            gameState = "playing"
        end
    end
end

function player:mousepressed(x, y, button)
end


function player:take_damage(amount)
    self.health = self.health - amount
end




function player:animate()
    if self.dir == -1 then
        self.anim:draw(self.img, self.x - 64, self.y - 64, nil, -8 * self.dir, 8)
    else
        self.anim:draw(self.img, self.x + 64, self.y - 64, nil, -8 * self.dir, 8)
    end
end


function player:idle()
    if input_vector[1] == 0 and input_vector[2] == 0 then
        state = states['IDLE']
    end
end



--3x3 ak
--10x7 mp5


function player:movement()
    if is_action_pressed("a") then
        input_vector = get_action_strength("a")
        self.dir = -1
        self.anim = self.animations.side_walk
        state = states['MOVING']
    elseif is_action_pressed("s") then
        self.anim = self.animations.down_walk
        input_vector = get_action_strength("s")
        state = states['MOVING']
    elseif is_action_pressed("d") then
        input_vector = get_action_strength("d")
        self.anim = self.animations.side_walk
        self.dir = 1
        state = states['MOVING']
    elseif is_action_pressed("w") then
        self.anim = self.animations.up_walk
        input_vector = get_action_strength("w")
        state = states['MOVING']
    else
        input_vector = get_action_strength("end")
    end
    self.hitbox:setLinearVelocity(input_vector[1] * self.speed, input_vector[2] * self.speed)

end
