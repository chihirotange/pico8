particle = entity:new({
    draw_order = 100,
    radius = 0, 
    cur_rad = 0,
    spdx = 0,
    spdy = 0,
    draw = function(_ENV)
        circfill(x, y, cur_rad)
        cur_rad -= 1 
        x += spdx
        y += spdy
        if cur_rad <= 0 then 
            _ENV:destroy()
        end
    end,
    _reset = function(_ENV)
        cur_rad = radius 
    end
})

function spawn_particle(x, y, radius)
    for i = 1,20 do
        particle:new({
            x = x,
            y = y,
            radius = 5 + rnd(5),
            spdx = radius*(rnd() - 0.5),
            spdy = radius*(rnd() - 0.5), 
            is_abstract = false,
        })
    end
end