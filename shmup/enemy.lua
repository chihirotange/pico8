enemy_green = entity_spr:new({
    draw_order = -1,
    sprid = 20,
    update = function(_ENV)
        y +=1
    end
})