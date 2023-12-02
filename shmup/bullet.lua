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
                    -- reset bullet to init state
                    tbl = bullet
                    tbl.draw_order = 20
                    tbl.x = tba.x
                    tbl.y = tba.y
                    -- because this will re activate the bullet, hence make reuse_ready false
                    tbl.reuse_ready = false
                    break
                end
            end
            if not tbl then
                tbl = entity_spr.new(_ENV, tba)
                printh(tbl.is_abstract)
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
        end
    }
)