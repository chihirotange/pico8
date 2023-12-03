function _init()
   --starfield
    for i = 1, 100 do
        starfield:new({
            is_abstract = false,
            x = rnd(127),
            y = rnd(127),
            speed = rnd(1.5) + 0.5
        })
    end

    -- enemies
    for i = 1,9 do
        enemy_green:new({
            is_abstract = false,
            x = rnd(100),
            y = rnd(10) + 10
        })
    end

    --test
    add(event_system.listeners, sound)
end

function _update()
   entities:update()
end

function _draw()
    cls(1)
    entities:draw()
    debug(100, 80,{count(event_system.listeners)})

end