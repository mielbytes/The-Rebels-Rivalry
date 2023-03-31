player = {}
local states = {
    IDLE = 1,
    MOVING = 2
}

local px, py
local state = states['IDLE']
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
    self.speed = 250
    self.width = 64
    self.height = 64
    self.hitbox = world:newBSGRectangleCollider(self.x, self.y, self.width, self.height, 5)
    self.hitbox:setType("dynamic")
    self.hitbox:setFixedRotation(true)
end

function player:keypressed(key, scancode, isrepeat)
  
end

function player:mousepressed(x, y, button)
  
end

function player:update(dt)
    px, py = self.hitbox:getLinearVelocity()
    self.x, self.y = self.hitbox:getX(), self.hitbox:getY()
    self:movement()
  
    
end

function player:draw()
  
end

function player:movement()
    if is_action_pressed("a") then
        input_vector = get_action_strength("a")
    elseif is_action_pressed("s") then
        input_vector = get_action_strength("s")
    elseif is_action_pressed("d") then
        input_vector = get_action_strength("d")
    elseif is_action_pressed("w") then
        input_vector = get_action_strength("w")
    else
        input_vector = get_action_strength("`")
    end
    self.hitbox:setLinearVelocity(input_vector[1] * self.speed, input_vector[2] * self.speed)
        
   
    
  
end

