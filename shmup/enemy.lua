all_enemies = {}

enemy_green = entity_spr:new({
    hp = 4,
    pool_id = 'enemy_green',
    flash_spr = 21,
    draw_order = 50,
    sprid = 20,
    new = function(_ENV, tba)
        local tbl = entity_spr.new(_ENV, tba)
        add(all_enemies,tbl)
        return tbl
    end,
    update = function(_ENV)
        if reuse_ready then
            return
        end
        y += rnd() + 1 
        x += (rnd() - 0.5) * 3
        -- destroy enemy logics
        if y > 120 then
            _ENV:destroy()
            del(all_enemies,_ENV)
        end
    end,
    take_damage = function(_ENV)
        hp -= 1
        flash = 3
        if hp <= 0 then
            explosion:new({
                x = x,
                y = y,
                is_abstract = false,
            })
            _ENV:destroy()
            del(all_enemies,_ENV)
        end
    end
})