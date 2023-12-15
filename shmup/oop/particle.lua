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
        cur_radius =  radius * (1 - normalize_age)
        c = 10 
        if normalize_age > 0.8 then
            c = 5
        elseif normalize_age > 0.2  then 
            c = 8
        end
        circfill(x, y, cur_radius, c)
        x += spdx
        y += spdy
        if normalize_age >= 1 then
            _ENV:destroy()
        end
    end
})

function spawn_particle(x, y, radius)
    for i = 1,5 do
        particle:new({
            max_age = 8 + rnd(14),
            is_abstract = false,
            x = x + radius * (rnd() - 0.5) * 2,
            y = y + radius * (rnd() - 0.5) * 2
        })
    end
end