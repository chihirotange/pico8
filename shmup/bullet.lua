all_bullets = {} 
bullet = entity_spr:new(
    {
        reuse_ready = false,
        sprid = 16,
        draw_order = 20,
        bullet_spd = 4,
        new = function(_ENV, tba)
            -- must set tba abstract to true BEFORE calling parent constructor to add it to entity array
            tba.is_abstract = false
            local tbl = nil
            for bullet in all(all_bullets) do
                if bullet.reuse_ready then 
                    tbl = bullet
                    tbl:_reset(tba.x, tba.y)
                    break
                end
            end
            if not tbl then
                tbl = entity_spr.new(_ENV, tba)
                add(all_bullets, tbl)
            end
            return tbl
        end,
        update = function (_ENV)
            if reuse_ready then 
                return
            end
            y -= bullet_spd
            -- return bullet to pool
            if y <= 0 then
                reuse_ready = true
                draw_order = -1
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