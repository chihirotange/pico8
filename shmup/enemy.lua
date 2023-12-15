all_enemies = {}

enemy_green = entity_spr:new({
    hp = 5,
    flash_spr = 21,
    draw_order = 50,
    sprid = 20,
    new = function(_ENV, tba)
        local tbl = entity_spr.new(_ENV, tba)
        add(all_enemies,tbl)
        return tbl
    end,
    update = function(_ENV)
        x += (rnd() - 0.5) * 3
        -- destroy enemy logics
    end,
    take_damage = function(_ENV)
        hp -= 1
        flash = 3
        if hp <= 0 then
            spawn_particle(x, y, 6)
            -- should be in this class destroy function but do this to save token
            del(global.all_enemies, _ENV)
            _ENV:destroy()
            enemy_green:new(
                {
                    x = rnd(120),
                    y = rnd(40),
                    is_abstract = false
                }
            )
        end
    end
})