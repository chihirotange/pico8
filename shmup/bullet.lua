all_bullets = {} 
bullet = entity_spr:new(
    {
        sprid = 16,
        draw_order = 20,
        bullet_spd = 5,
        new = function(_ENV, tbl)
            tbl = entity_spr.new(_ENV, tbl)
            add(all_bullets, tbl)
        end,
        update = function (_ENV)
            y -= bullet_spd
        end

    }
)