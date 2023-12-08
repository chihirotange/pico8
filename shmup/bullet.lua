bullet = entity_spr_pool:new(
    {
        pool_id = "bullet",
        sprid = 16,
        draw_order = 20,
        bullet_spd = 4,
        update = function (_ENV)
            if reuse_ready then 
                return
            end
            y -= bullet_spd
            
            -- destroy bullet
            if y <= 0 then
                _ENV:_return_pool()
            end

            -- collide with enemy
            for ene in all(all_enemies) do
                if col(ene,_ENV) then
                    fire_event(on_bullet_collide_enemy)
                    ene:destroy()
                    _ENV:_return_pool()
                end
            end
        end,
        -- for pooling
        _reset = function (_ENV, input_x, input_y)
            draw_order = 20
            x = input_x
            y = input_y
            reuse_ready = false
        end
    }
)