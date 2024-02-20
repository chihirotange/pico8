function _init()
    printh("start")
    for i = 1, 10 do
        create_enemy(rnd(120), 10)
    end
    -- create_enemy(100, 10)
end

function _update60()
    update_all_objects()
end

function _draw()
    cls(1)
    draw_debug()
    draw_all_objects()
end

function draw_debug()
    text_debug("objs", count(all_objects))
    text_debug("colliders", count(all_collider_object))
    text_debug("pending_destroy", count(pending_destroy_object))
end