bullet = entity_spr:new(
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
                _ENV:destroy()
            end

            -- collide with enemy
            for ene in all(all_enemies) do
                if col(ene,_ENV) then
                    ene:take_damage()
                    _ENV:destroy()
                end
            end
        end,
    }
)