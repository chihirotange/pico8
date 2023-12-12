particle = entity:new({
    age = 0,
    max_age = 0,
    draw_order = 100,
    cur_radius = 0,
    spdx = 0,
    spdy = 0,
    draw = function(_ENV)
        printh(cur_radius)
        local c = 10 
        cur_radius *= 0.9
        age += 1
        if age > max_age*0.8 then
            c = 5
        elseif age > max_age*0.6 then 
            c = 8
        end
        circfill(x, y, cur_radius, c)
        x += spdx
        y += spdy
        if age >= max_age then
            printh("destroy")
            _ENV:destroy()
        end
    end,
    _reset = function(_ENV)
        is_abstract = false
        age = 0
        max_age = 15 + rnd(15) 
        cur_radius = 10
        spdx = 3*(rnd() - 0.5)
        spdy = 3*(rnd() - 0.5)
    end
})

function spawn_particle(x, y, speed)
    for i = 1,10 do
        particle:new({
            x = x,
            y = y,
        })
    end
end