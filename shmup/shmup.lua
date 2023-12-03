function _init()
    -- spaceship
    spaceship = entity_spr:new(
        {
            is_abstract = false,
            x = 58,
            y = 110,
            draw_order = 50, 
            raw_speed = 2,
            raw_spr = 2,
            sprid = raw_spr,
            update = function(_ENV)
                sprid = raw_spr

                if (current_muzzle_size > 0) then
                    current_muzzle_size -= muzzle_speed
                end
                if btn(0) then
                    x += -raw_speed
                    sprid = raw_spr + 1
                end
                if btn(1) then 
                    x += raw_speed
                    sprid = raw_spr - 1
                end

                if btn(2) then
                    y += -raw_speed
                end

                if btn(3) then
                    y += raw_speed
                end
                -- stop when touch edge
                if (x < 0) then
                    x = 120
                end

                if (x > 120) then
                    x = 0
                end

                if (y > 120) then
                    y = 0
                end

                if (y < 0) then
                    y = 120
                end

                if btnp(4) then
                    bullet:new(
                        {
                            x = x,
                            y = y,
                        }
                    )
                end
            end
        })
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