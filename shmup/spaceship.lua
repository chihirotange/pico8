    spaceship = entity_spr:new(
        {
            is_abstract = false,
            x = 58,
            y = 110,
            draw_order = 50, 
            raw_speed = 2,
            bul_timer = 0,
            raw_spr = 2,
            invul = 0,
            -- muzzle_speed = 5,
            sprid = raw_spr,
            update = function(_ENV)
                sprid = raw_spr
                -- if (current_muzzle_size > 0) then
                --     current_muzzle_size -= muzzle_speed
                -- end
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
                bul_timer -= 1

                if btn(4) and bul_timer <= 0 then
                    bullet:new(
                        {
                            is_abstract = false,
                            x = x,
                            y = y,
                        }
                    )
                    fire_event(on_spaceship_shoot)
                    bul_timer = 3
                end

                invul = max(0, invul - 1) 
                if invul <= 0 then
                    for ene in all(all_enemies) do
                        if col(ene, _ENV) then
                            fire_event(on_spaceship_collides_enemy)
                            invul = 60
                        end
                    end
                end

            end,
            draw = function(_ENV)
                -- flashing when immu
                if sin(time()*6) > 0.5 and invul > 0 then
                else
                    spr(sprid, x, y)
                end
            end
    })