enemy = Class{}
local ex, ey
local timer = 0
local states = {
    IDLE = 1,
    WANDER = 2
}
local choice = 0
local state = states["WANDER"]
local moving_towards_player = false
local wander_choice = 1
local wander_delay = 0
function enemy:init(x, y)
    self.x = x
    self.y = y
    self.dir = 1
    self.width = 64
    self.height = 128
    self.speed = 100
    --Enemy Hitbox--
    self.hitbox = world:newBSGRectangleCollider(self.x, self.y, self.width, self.height, 15)
    self.hitbox:setType("dynamic")
    self.hitbox:setRestitution(0)
    self.hitbox:setFixedRotation(true)
    self.hitbox:setCollisionClass("Enemy")
    --Enemy States--
    self.max_health = 100
    self.health = self.max_health
    self.isDead = false

    --Enemy Animations--
    self.img = love.graphics.newImage("assets/images/enemy.png")
    self.img:setFilter("nearest")
    self.grid = anim8.newGrid(16, 16, self.img:getWidth(), self.img:getHeight())
    self.animations = {}
    self.animations.idle_down = anim8.newAnimation(self.grid("1-1", 1), 0.5)
    self.animations.idle_up = anim8.newAnimation(self.grid("2-2", 1), 0.5)
    self.animations.idle_side = anim8.newAnimation(self.grid("3-3", 1), 0.5)
    self.animations.walk_side = anim8.newAnimation(self.grid("1-2", 2), 0.2)
    self.animations.walk_up = anim8.newAnimation(self.grid("1-4", 3), 0.2)
    self.animations.walk_down = anim8.newAnimation(self.grid("1-4", 4), 0.2)
    self.anim = self.animations.idle_down


    self.hitbox:setObject(self)
end

function enemy:update(dt)
    if not self.isDead then
        ex, ey = self.hitbox:getLinearVelocity()
        self.x, self.y = self.hitbox:getX(), self.hitbox:getY()
        self.anim:update(dt)
        timer = timer - 1 * dt
        wander_delay = wander_delay - 1 * dt
        self:make_choice()
        self:detect()
        if not moving_towards_player then
            if state == states['WANDER'] then
                self:wander(dt)
                if wander_delay <= 0 then
                    wander_choice = love.math.random(1,4)
                    wander_delay = 2
                end
            else
                state = states['IDLE']
                self:idle()
            end
            if self.hitbox:enter("Wall") then
                state = states["IDLE"]
                self:idle()
            end
        end
    end
end

function enemy:render()
    if not self.isDead then
        if self.dir == -1 then
            self.anim:draw(self.img, self.x - 64, self.y - 64, nil, -8 * self.dir, 8)
    
        else
            self.anim:draw(self.img, self.x + 64, self.y - 64, nil, -8 * self.dir, 8)
        end
    end
end

function enemy:wander(dt)

    if wander_choice == 1 then
        self.hitbox:setLinearVelocity(self.speed, ey)
        self.anim = self.animations.walk_side
        self.dir = 1
    elseif wander_choice == 2 then
        self.hitbox:setLinearVelocity(-self.speed, ey)
        self.anim = self.animations.walk_side
        self.dir = -1
    elseif wander_choice == 3 then
        self.hitbox:setLinearVelocity(ex, self.speed)
        self.anim = self.animations.walk_down
    elseif wander_choice == 4 then
        self.hitbox:setLinearVelocity(ex, -self.speed)
        self.anim = self.animations.walk_up
    end
end

function enemy:detect()
    moving_towards_player = false
    local query = world:queryCircleArea(self.x, self.y,128,  {"Player"})
    for i, v in pairs(query) do
        local player = v:getObject()
        if player then
            self:move_toward_player(query)
            moving_towards_player = true
        else
           self:make_choice()
        end
    end
end


function enemy:make_choice()
    if timer <= 0 and not moving_towards_player then
        choice = love.math.random(1, 2)
        timer = 5
        if choice == 1 then
            self:idle()
            state = states['IDLE']
        else
            self:wander()
            state = states['WANDER']
        end
    end
end

function enemy:idle()
    if state == states['IDLE'] then
        self.anim = self.animations.idle_down
        self.hitbox:setLinearVelocity(0,0)
    end
end

function enemy:move_toward_player(query)
    for i, v in pairs(query) do
        local player = v:getObject()
        local target_x = round(player.hitbox:getX())
        local target_y = round(player.hitbox:getY())
        if round(self.hitbox:getX()) < target_x then
            self.hitbox:setLinearVelocity(self.speed, ey)
            self.dir = 1
            self.anim = self.animations.walk_side
        end
        if round(self.hitbox:getX()) > target_x then
            self.hitbox:setLinearVelocity(-self.speed, ey)
            self.dir = -1
            self.anim = self.animations.walk_side
        end
        if round(self.hitbox:getY()) < target_y then
            self.hitbox:setLinearVelocity(ex, self.speed)
        end
        if round(self.hitbox:getY()) > target_y then
            self.hitbox:setLinearVelocity(ex, -self.speed)
        end   
    end
end

function enemy:take_damage(amount)
    self.health = self.health - amount
end

function enemy:set_spawn_point(x,y)
    self.hitbox:setX(x)
    self.hitbox:setY(y)
end
