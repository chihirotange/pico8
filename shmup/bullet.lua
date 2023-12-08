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
                    ene:take_damage()
                    _ENV:_return_pool()
                    fire_event(on_bullet_collide_enemy)
                end
            end
        end,
    }
)