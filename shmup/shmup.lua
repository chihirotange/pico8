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
    for i = 1,200 do
        enemy_green:new({
            is_abstract = false,
            x = rnd(120),
            y = 1
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
    debug(80,100, {
        count(entities.entities_update_list),
        count(all_enemies)
})
end