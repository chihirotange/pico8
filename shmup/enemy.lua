all_enemies = {}

enemy_green = entity_spr:new({
    hp = 2,
    pool_id = 'enemy_green',
    flash_spr = 21,
    draw_order = 50,
    sprid = 20,
    new = function(_ENV, tba)
        local tbl = entity_spr.new(_ENV, tba)
        printh("spawn new enemy")
        add(all_enemies,tbl)
        return tbl
    end,
    update = function(_ENV)
        if reuse_ready then
            return
        end
        x += (rnd() - 0.5) * 3
        -- destroy enemy logics
    end,
    take_damage = function(_ENV)
        hp -= 1
        flash = 3
        if hp <= 0 then
            spawn_particle(x, y, 2)
            _ENV:destroy()
            -- del(all_enemies,_ENV)
            _ENV:new({
                x = rnd(120),
                y = 20,
                is_abstract = false,
            })
        end
    end
})