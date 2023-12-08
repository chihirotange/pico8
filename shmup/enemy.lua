all_enemies = {}

enemy_green = entity_spr_pool:new({
    hp = 2,
    pool_id = 'enemy_green',
    reuse_ready = false,
    draw_order = 50,
    sprid = 20,
    new = function(_ENV, tba)
        local tbl = entity_spr_pool.new(_ENV, tba)
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
            _ENV:_reset(rnd(120), 0)
        end
    end,
    _reset = function(_ENV, input_x, input_y)
        printh("reset enemy")
        x = input_x
        y = input_y
        reuse_ready = false
        draw_order = 50
    end,
    take_damage = function(_ENV)
        hp -= 1
        if hp <= 0 then
            _ENV:_return_pool()
            del(all_enemies,_ENV)
        end
    end
})