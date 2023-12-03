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
    
    --score
    -- score = entity:new({
    --     draw_order = 100,
    --     score = 1000,
    --     draw = function (_ENV)
    --         print("score: " .. score, 80, 2, 8)
    --     end
    -- })

    --starfield
    for i = 1, 100 do
        starfield:new({
            is_abstract = false,
            x = rnd(127),
            y = rnd(127),
            speed = rnd(1.5) + 0.5
        })
    end

    --current_lives
    max_lives = 7
    current_lives = 4

    -- enemies
    for i = 1,9 do
        enemy_green:new({
            is_abstract = false,
            x = rnd(100),
            y = rnd(10) + 10
        })
    end

    -- texts
    text = entity_txt:new({
        txt = "ai chan",
        is_abstract = false,
        x = 20,
        y = 50,
    })
end

function _update()
   entites:update()
end

function _draw()
    cls(1)
    -- spr(sprid,ship_x,ship_y)
    -- -- Starfield_Draw()

    -- --flame
    -- current_flame_spr += 1
    -- if (current_flame_spr > ship_flame_spr + 4) then
    --     current_flame_spr = ship_flame_spr
    -- end
    -- spr(current_flame_spr,ship_x,ship_y+8)
    
    -- --muzzle
    -- if (current_muzzle_size > 0) then
    --     circfill(ship_x + 4, ship_y - muzzle_size/3, current_muzzle_size/2, 7)
    -- end

    -- --bullet
    -- spr(bull_spr,bull_x,bull_y)
    -- --draw all "visible" entities
    entites:draw()
    debug(100, 80,{count(entites.entities_list)})

end
