particle = entity:new({
    age = 0,
    max_age = 0,
    draw_order = 100,
    radius = 0, 
    spdx = 0,
    spdy = 0,
    draw = function(_ENV)
        local c = 10 
        age += 1
        if age > max_age*0.8 then
            c = 5
        elseif age > max_age*0.6 then 
            c = 8
        end
        circfill(x, y, radius, c)
        x += spdx
        y += spdy
        if age >= max_age then 
            _ENV:destroy()
        end
    end,
    _reset = function(_ENV)
        age = 0
    end
})

function spawn_particle(x, y, speed)
    for i = 1,20 do
        particle:new({
            x = x,
            y = y,
            max_age = 15 +rnd(10),
            radius = 1 + rnd(4),
            spdx = speed*(rnd() - 0.5),
            spdy = speed*(rnd() - 0.5), 
            is_abstract = false,
        })
    end
end