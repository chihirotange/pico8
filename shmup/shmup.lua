function _init()
    -- spaceship

    bull_x = 0
    bull_y = 0
    bull_spr = 16
    bull_speed = -5
    
    --muzzle
    muzzle_size = 14
    muzzle_speed = 3
    current_muzzle_size = muzzle_size
    
    --starfield
    for i = 1, 100 do
        starfield:new({
            is_abstract = false,
            x = rnd(127),
            y = rnd(127),
            speed = rnd(1.5) + 0.5
        })
    end

    -- enemies
    for i = 1,9 do
        enemy_green:new({
            is_abstract = false,
            x = rnd(100),
            y = rnd(10) + 10
        })
    end
end

function _update()
   entities:update()
end

function _draw()
    cls(1)
    entities:draw()
    debug(100, 80,{count(entities.entities_draw_list)})

end