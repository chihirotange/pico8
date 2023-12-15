particle = entity:new({
    age = 0,
    max_age = 30,
    draw_order = 100,
    radius = 8,
    spdx = 0,
    spdy = 0,
    draw = function(_ENV)
        age += 1
        normalize_age = age/max_age
        in_nor_age = 1 - normalize_age
        cur_radius =  radius * in_nor_age
        printh(normalize_age)
        if normalize_age > 0.7 then
            c = 5
        elseif normalize_age > 0.5  then 
            c = 8
        else
            c = 10 
        end
        circfill(x, y, cur_radius, c)
        x += spdx*in_nor_age
        y += spdy*in_nor_age
        if normalize_age >= 1 then
            _ENV:destroy()
        end
    end
})

function spawn_particle(x, y, radius)
    for i = 1,20 do
        particle:new({
            x = x,
            y = y,
            max_age = 8 + rnd(15),
            is_abstract = false,
            spdx = radius* (rnd() - 0.5),
            spdy = radius * (rnd() - 0.5)
        })
    end
end